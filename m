Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1107478lfp;
        Fri, 31 Jan 2020 13:12:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzToulYTYHmp8w/i0MwIWSKu6Xiirv4ru+w40Ar9N/GATHBSnweoFmdARPP7kA3w3mdeP6p
X-Received: by 2002:aed:35e7:: with SMTP id d36mr12998001qte.363.1580505152306;
        Fri, 31 Jan 2020 13:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580505152; cv=none;
        d=google.com; s=arc-20160816;
        b=PosUjMMhqlIVa5mhi0Oy5UVslDqqJD1tP5xxEtjPScCj7hymTvIgbOhRwmlOwO7HgD
         TOwGnoxkTRm7TLoUnAvLxLojM0jMZY6pXy6CnNKjCRzxFipx16tPUHOS/M/50ksT8Rcp
         l2KGvIzBiDIJV1r+WscmiLZK/bnaT15yod6uRE1hDFa+2YsnJXW7m2bonRbys8BjWg5J
         JCUide3FyHFCbH9QJPHQ4TNDCL5qU473SU78+bcdbKdH5XTpHv3rR00FoJXxKdA5Td7X
         t3PIdfHf7oLalro8rvdnXmTzKplZbokagV8r7F9/ifmzU40I3mSnzjQzkY/bnUthVUg7
         DYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4DgmTmXDTc3XoP6PgS5i3UFuOxUpLW86Z2TRHb2sW7Y=;
        b=uAknqtvZX0HEd+xMAqzPqFkO9Xjgw2YmQAL4CicQqk6YRZ1oDTZpszMfqsaPJHvAkH
         JIki6DVWq33vwjy03GbD/icZ9oC0bWqJrJUTvjRrBoKQyDjmQXQORD+F/MBrBvuBr7Hh
         pq9szgav5IUFB4nfOt76XAVHQAxfWvFK+ZqjYtyss9rKqkc9iImrk8p5fqd+5lRzfOOH
         G5EtbIyI8raB/b6EcxXSjR19BUx2RGpsjcD1AyTzIWQMOjpwTb1LhrZ3EJVylFD47qAf
         +l72NwKKKqQjpzifGM1ec3/Ujm7BBn8OJYUhdIFHWuliA96cw8x4XCivhfTexZ625rAT
         LKfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q7fwoFA+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16si7415932qkg.275.2020.01.31.13.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 13:12:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q7fwoFA+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixdaZ-0004H1-Oi
	for alex.bennee@linaro.org; Fri, 31 Jan 2020 16:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZE-0002r3-Vc
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 16:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZD-0003DB-S4
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 16:11:08 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ixdZD-00037M-M5; Fri, 31 Jan 2020 16:11:07 -0500
Received: by mail-wm1-x342.google.com with SMTP id s10so9486666wmh.3;
 Fri, 31 Jan 2020 13:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DgmTmXDTc3XoP6PgS5i3UFuOxUpLW86Z2TRHb2sW7Y=;
 b=Q7fwoFA+EQR0CiQgBgZOQ5CaZrdqAXXioJyRqD7h88Q+6KNWrGehCo+aO3LOVY3wop
 J0I0DdY9Nnq+Ozv2IvonCGNyz5AS2a2CyMlqvrPlFtiY3J95XFt6bEJhf0q4T4oXvpWE
 /nVaGbrczBb1h/GPPl5UyrQ2mQtuKotjP2I3aj/XwEhSB7fJSLDMhho/uWx05CogzieH
 vuVyJN3zu8rFtEpPalXoVQ9v/mSf4p5epxQqcOx04mqhnHsF1ti48SlMQn4ldcQnlfEq
 scpUlBskFRoNz+F41tVtwQ0G232HL/OnSSe7kAvTCmvbXfje4wS5G1ZpzkDAq3VteyzA
 ctJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4DgmTmXDTc3XoP6PgS5i3UFuOxUpLW86Z2TRHb2sW7Y=;
 b=qVndfdzzO87hHYNQaR0DES1XkMLSK8MC2IF1fj/fEB5X2hIiPa/33qlQ8plyhP4x4Z
 OU+bFg2dcw3OuxUMjTm/AFX8EnbFIscTFTJASEch6qjzYfjSpvfnA8wYknfNZtTonpht
 UZOrygwRg519PBuzG2T0FCCSi/ZX+1tT289Qk0PRfOKv+CW7CWnuVH+HKzJ7ckBe7ka0
 CF7ImuhjPoNFH9JUKRXEy8XgES2QFRQ++gL603IQ5fCgZlx4ptPq7MO6WRfQgeH2mg6L
 vP9AQSe2w1iagYNPgrjtUwoG/EHs1eATpLQ9pNhVXl1I7Yoct8odDBW/QmVL4M2feLp5
 4VuQ==
X-Gm-Message-State: APjAAAUH12P0JbFIBiLEZP6SqnxZhu2vWGrmYASAho3R8oZpuquS03jO
 Z1pkr0pRccAl825hmxFye2f87+9L
X-Received: by 2002:a1c:740a:: with SMTP id p10mr13978564wmc.65.1580505066363; 
 Fri, 31 Jan 2020 13:11:06 -0800 (PST)
Received: from x1w.redhat.com (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id d204sm12236025wmd.30.2020.01.31.13.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 13:11:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
Date: Fri, 31 Jan 2020 22:11:01 +0100
Message-Id: <20200131211102.29612-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200131211102.29612-1-f4bug@amsat.org>
References: <20200131211102.29612-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGA6MCiFcE3g

As we want to re-use this code, extract it as a new function.
Since we are using the PL011 serial console, add a Avocado tag
to ease filtering of tests.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/machine_arm_integratorcp.py | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
index 4f9ab40f2f..748819916d 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -19,12 +19,7 @@ class IntegratorMachine(Test):
 
     timeout = 90
 
-    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
-    def test_integratorcp(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:integratorcp
-        """
+    def boot_integratorcp(self):
         kernel_url = ('https://github.com/zayac/qemu-arm/raw/master/'
                       'arm-test/kernel/zImage.integrator')
         kernel_hash = '0d7adba893c503267c946a3cbdc63b4b54f25468'
@@ -40,4 +35,13 @@ class IntegratorMachine(Test):
                          '-initrd', initrd_path,
                          '-append', 'printk.time=0 console=ttyAMA0')
         self.vm.launch()
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_integratorcp(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:integratorcp
+        :avocado: tags=device:pl011
+        """
+        self.boot_integratorcp()
         wait_for_console_pattern(self, 'Log in as root')
-- 
2.21.1

