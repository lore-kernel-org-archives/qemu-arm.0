Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1208726njb;
        Tue, 10 Sep 2024 02:49:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyKYunpaPGVP5L0Q5S1VDqJF42kJQ2ZSB2a+jvMb4ui+5So2u0d+9LOajh2uYeWduM7nxh5bucNJq9SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IECbXQIiF80Cmv70PM/KLEjJ2j3z4zGJfaGR7RZ7aD7UcBwN/gWIdh0fD5bRQvh0YryykGn
X-Received: by 2002:a05:6214:268d:b0:6b5:1584:62bf with SMTP id 6a1803df08f44-6c554d1e20fmr44970936d6.6.1725961757314;
        Tue, 10 Sep 2024 02:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725961757; cv=none;
        d=google.com; s=arc-20240605;
        b=drM/cVWkFQO6x1A7qawl/OHWMbXaNfNtQP1G+zbx5YTwScVmxC1mlbacVFw42afaPK
         nmUHrTN89IawAkbnYnYCeoEEhjSA5BujK2fapptK+QQmNOuz69M0TildTWW9ORNVNo52
         Co8sxnt1UY/rFV3m7RcN4Zl2z8OWTtClKHqVvCw80Z1S1hSAfwrODf/w90XK3m+loLK0
         t89UBwA+C2YJuaOmo2sKnfHLQrapL0TTRO0yfg7gwFDffNX7OfmoTER7H2c60B+OvCXS
         NGoQOMlnkuEKDKS0wrB9/rlTnGdq1lWt0mzUKD+3nR9XXrrZ+EUNLHg3zR0/yOTYWLiA
         UtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from;
        bh=wonZRhVlCmJ3rfx64ZLoYDJJXRR6B3NB/kzu6AICag4=;
        fh=2XNni5tFqqNsYuVOJGxzVTMSzHzZnaSMOOPrr5cXMU4=;
        b=CS6tU+0r4HoxqrgEY0X3wIGZMvO1yAEPKbin3BwDqBgPvxGzYzoORWB6qqwbaJzhlK
         shLxOYgqRQSlRFEXdA8TV7BZckP/+LPnusYAeIAWAE2YWmp7m8mBPFqek9Du9TlFyW4o
         Xr4dgaWklJO4gjAcDct8QqHog03M3dAdqjCPZu96P4+/CAv1rECOQbnHwx1mTMpM7CNy
         7RxIsKPrawm365vEN/PMX7fch+oVBtbNmARAIJ/V5vkXET0go13VXguQmcdFjqybFTNO
         HZXjl/y+r0MuOCMqLU2VTOCfelCqLuSOcVa0INXmF7MvubqG1zy13xIn0r31gCSWvnpp
         99ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534784e56si76057886d6.428.2024.09.10.02.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 02:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snxUF-0006cj-Da; Tue, 10 Sep 2024 05:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUD-0006VZ-LO; Tue, 10 Sep 2024 05:48:37 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1snxUC-0000MT-45; Tue, 10 Sep 2024 05:48:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 0FD35260836;
 Tue, 10 Sep 2024 11:48:34 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id JbCQcShU0BRq; Tue, 10 Sep 2024 11:48:32 +0200 (CEST)
Received: from applejack.lan (83.11.24.101.ipv4.supernova.orange.pl
 [83.11.24.101])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6BAA0260BB4;
 Tue, 10 Sep 2024 11:48:31 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 10 Sep 2024 11:48:10 +0200
Subject: [PATCH v5 3/4] tests: expand timeout information for aarch64/sbsa-ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-b4-move-to-freebsd-v5-3-0fb66d803c93@linaro.org>
References: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
In-Reply-To: <20240910-b4-move-to-freebsd-v5-0-0fb66d803c93@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: b4 0.14.0
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VQYFcROCgtxy

'Test might timeout' means nothing. Replace it with useful information
that it is emulation of pointer authentication what makes this test run
too long.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/functional/test_aarch64_sbsaref.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_aarch64_sbsaref.py b/tests/functional/test_aarch64_sbsaref.py
index 89d0b9587a..1648e8ceb6 100755
--- a/tests/functional/test_aarch64_sbsaref.py
+++ b/tests/functional/test_aarch64_sbsaref.py
@@ -137,7 +137,8 @@ def test_sbsaref_alpine_linux_max_pauth_off(self):
     def test_sbsaref_alpine_linux_max_pauth_impdef(self):
         self.boot_alpine_linux("max,pauth-impdef=on")
 
-    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'),
+                'Test might timeout due to PAuth emulation')
     def test_sbsaref_alpine_linux_max(self):
         self.boot_alpine_linux("max")
 
@@ -175,11 +176,13 @@ def test_sbsaref_openbsd73_default_cpu(self):
     def test_sbsaref_openbsd73_max_pauth_off(self):
         self.boot_openbsd73("max,pauth=off")
 
-    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'),
+                'Test might timeout due to PAuth emulation')
     def test_sbsaref_openbsd73_max_pauth_impdef(self):
         self.boot_openbsd73("max,pauth-impdef=on")
 
-    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'),
+                'Test might timeout due to PAuth emulation')
     def test_sbsaref_openbsd73_max(self):
         self.boot_openbsd73("max")
 
@@ -216,11 +219,13 @@ def test_sbsaref_freebsd14_default_cpu(self):
     def test_sbsaref_freebsd14_max_pauth_off(self):
         self.boot_freebsd14("max,pauth=off")
 
-    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'),
+                'Test might timeout due to PAuth emulation')
     def test_sbsaref_freebsd14_max_pauth_impdef(self):
         self.boot_freebsd14("max,pauth-impdef=on")
 
-    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipUnless(os.getenv('QEMU_TEST_TIMEOUT_EXPECTED'),
+                'Test might timeout due to PAuth emulation')
     def test_sbsaref_freebsd14_max(self):
         self.boot_freebsd14("max")
 

-- 
2.46.0

