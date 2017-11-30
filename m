Received: by 10.223.159.82 with SMTP id f18csp390159wrg;
        Thu, 30 Nov 2017 00:53:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZXr+aTzc1MJ8v/s+MU4y0HkX9K5svIGwOWGbmo44M4sm+HHipAcuIDKlemk4Rj3aRSrpwq
X-Received: by 10.37.30.11 with SMTP id e11mr972987ybe.321.1512032014625;
        Thu, 30 Nov 2017 00:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512032014; cv=none;
        d=google.com; s=arc-20160816;
        b=O95tXWLR2yE0uFvFBslEgnuE8mS+nF9t2LatPVuaCmfVXAvNHk0GkSNkFbKiQdWSDm
         c3I4oHYxDOo+NBCJQUGSapuj5Qt9rpcV1oebHoHpUf2ZBiq9BlgoJMNQB4WHsc7wOdhN
         YgpRWKUhj7olaSlD5IZqSlWKL7dLwo/UvT0NdeJ9O1jy7Q+UnYjLx3arVT5oQzZQYysG
         kjg/Bxk47ijLPH2a5fMqPlKVFOHRdLnfV7nNqmTTK1NLMtlzqE3U8sqHrVJzwJcK4pb4
         97j8KNJ3ZOn4vcOfrwyeeOa+nOwIRvoRno+bVC0YEqxUGVHpg8fh3EOeBvq0FyxuMWJ4
         J7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ZjXpWlZ7xFjd3vWLGQhDMGdNSpwDUKPcFygyKJlQTrI=;
        b=apyk6Uc2EU7gSI4QKpQ08XrOSH877n9xQYpLgrRf3t/Ddfom4gZIKVUbuEqq1bd5Hj
         wkOiDKpvR+HKGlABL4cZFP6fRFRHfz26PKv0AVT8EBow/OoeiAzZ8cBHGIQDgHSdtUxo
         8BpXljs9hNXaayBYD6W5ucnwIxDQqjXfByLtTDe2Xjk1OYXFlKyZQgjDCU0uYlVcCFeL
         i+oxNlM/IGdOPkQ0q55Vm7xqKPIeenga9MBFXl6TMMQ1T8BgvTtg/6KljROtEUOmZEhH
         8njGWAbBTY19f8WVc1mWh5Uo03Qv9iU9WXYQttX/se5cGIFSL7WyvY/gUwI3GwCpFOBd
         vztg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12si683697ybd.323.2017.11.30.00.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 00:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKKb8-0005Ca-3f
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 03:53:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKau-0005AG-6o
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKKat-0006gm-64
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 03:53:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKKas-0006fX-Sv; Thu, 30 Nov 2017 03:53:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDD67C04D318;
	Thu, 30 Nov 2017 08:53:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22A425D6A5;
	Thu, 30 Nov 2017 08:53:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 30 Nov 2017 09:53:03 +0100
Message-Id: <1512031988-32490-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1512031988-32490-1-git-send-email-thuth@redhat.com>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 30 Nov 2017 08:53:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-2.12 2/7] tests/boot-serial-test: Add code to
 allow to specify our own kernel or bios
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Anthony Green <green@moxielogic.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bXlDxaP0iAf/

QEMU only ships with some few firmware images, i.e. we can currently run
the boot-serial test only on a very limited set of machines. But writing
some characters to the default UART of a machine can often be done with
some few lines of assembly, so we add the possibility to the boot-serial
tester to use its own mini-kernels or mini-firmwares. We write such images
then into a file that we can load with the "-kernel" or "-bios" parameter
when we launch QEMU.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include   |  2 ++
 tests/boot-serial-test.c | 54 +++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index c002352..41ca44c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -297,6 +297,8 @@ gcov-files-x86_64-y = $(subst i386-softmmu/,x86_64-softmmu/,$(gcov-files-i386-y)
 
 check-qtest-alpha-y = tests/boot-serial-test$(EXESUF)
 
+check-qtest-m68k-y = tests/boot-serial-test$(EXESUF)
+
 check-qtest-mips-y = tests/endianness-test$(EXESUF)
 
 check-qtest-mips64-y = tests/endianness-test$(EXESUF)
diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
index fa4183d..d997269 100644
--- a/tests/boot-serial-test.c
+++ b/tests/boot-serial-test.c
@@ -7,9 +7,10 @@
  * or later. See the COPYING file in the top-level directory.
  *
  * This test is used to check that the serial output of the firmware
- * (that we provide for some machines) contains an expected string.
- * Thus we check that the firmware still boots at least to a certain
- * point and so we know that the machine is not completely broken.
+ * (that we provide for some machines) or some small mini-kernels that
+ * we provide here contains an expected string. Thus we check that the
+ * firmware/kernel still boots at least to a certain point and so we
+ * know that the machine is not completely broken.
  */
 
 #include "qemu/osdep.h"
@@ -20,6 +21,9 @@ typedef struct testdef {
     const char *machine;    /* Name of the machine */
     const char *extra;      /* Additional parameters */
     const char *expect;     /* Expected string in the serial output */
+    size_t codesize;        /* Size of the kernel or bios data */
+    const uint8_t *kernel;  /* Set in case we use our own mini kernel */
+    const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
 static testdef_t tests[] = {
@@ -72,26 +76,52 @@ done:
 static void test_machine(const void *data)
 {
     const testdef_t *test = data;
-    char tmpname[] = "/tmp/qtest-boot-serial-XXXXXX";
-    int fd;
+    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
+    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
+    const char *codeparam = "";
+    const uint8_t *code = NULL;
+    int ser_fd;
 
-    fd = mkstemp(tmpname);
-    g_assert(fd != -1);
+    ser_fd = mkstemp(serialtmp);
+    g_assert(ser_fd != -1);
+
+    if (test->kernel) {
+        code = test->kernel;
+        codeparam = "-kernel";
+    } else if (test->bios) {
+        code = test->bios;
+        codeparam = "-bios";
+    }
+
+    if (code) {
+        ssize_t wlen;
+        int code_fd;
+
+        code_fd = mkstemp(codetmp);
+        g_assert(code_fd != -1);
+        wlen = write(code_fd, code, test->codesize);
+        g_assert(wlen == test->codesize);
+        close(code_fd);
+    }
 
     /*
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    global_qtest = qtest_startf("-M %s,accel=tcg:kvm "
+    global_qtest = qtest_startf("%s %s -M %s,accel=tcg:kvm "
                                 "-chardev file,id=serial0,path=%s "
                                 "-no-shutdown -serial chardev:serial0 %s",
-                                test->machine, tmpname, test->extra);
-    unlink(tmpname);
+                                codeparam, code ? codetmp : "",
+                                test->machine, serialtmp, test->extra);
+    unlink(serialtmp);
+    if (code) {
+        unlink(codetmp);
+    }
 
-    check_guest_output(test, fd);
+    check_guest_output(test, ser_fd);
     qtest_quit(global_qtest);
 
-    close(fd);
+    close(ser_fd);
 }
 
 int main(int argc, char *argv[])
-- 
1.8.3.1

