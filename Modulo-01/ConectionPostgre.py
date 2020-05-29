import psycopg2
class ConectionPostgre(object):
    _db = None

    def __init__(self, mhost, db, usr, pwd):
        """
        Initialization parameters.
        Args:
            mhost: Host name
            db: Database
            usr: User
            pwd: Password
        """
        self._db = psycopg2.connect(host=mhost, database=db, user=usr,
                                    password=pwd)

    def manipulate(self, sql):
        """
        It scans with the cursor, searching all the records in the database, then executes SQL.

        Args:
            sql: Command SQL to execute
        """
        try:
            cur = self._db.cursor()
            cur.execute(sql)
            cur.close();
            self._db.commit()
        except:
            return False;
        return True;

    def consult(self, sql):
        """
        Query method.

        Args:
            sql: Command SQL to execute
        """
        rs = None
        try:
            cur = self._db.cursor()
            cur.execute(sql)
            rs = cur.fetchall();
        except:
            return None
        return rs

    def nextPK(self, table, key):
        """
        Returns the highest index of the inserted record's primary key
        Args:
            table: Table
            key: Key
        """
        sql = 'select max(' + key + ') from ' + table
        rs = self.consult(sql)
        pk = rs[0][0]
        return pk + 1

    def close(self):
        self._db.close()