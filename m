Received: by 10.223.172.38 with SMTP id v35csp3214156wrc;
        Fri, 22 Sep 2017 08:04:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCrRBFVVMBr1qIrELKFOcrwQZpHtPYyptPUzrA7WZ4PMpOUqW1oSJ7rtdQPhKXVhAL79zeZ
X-Received: by 10.200.24.65 with SMTP id n1mr8605267qtk.323.1506092676108;
        Fri, 22 Sep 2017 08:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092676; cv=none;
        d=google.com; s=arc-20160816;
        b=hCzI5dZYvhybFlN9GSBlLGqvkKesQ09Wz/Xdpq4ZISo3lV7iIstq55zm4+qPMv4KHI
         Ca86GVDPti6v7SIKZIU+yOAc1FKMiiDpaWP3jQ8uKNj8xLSwOtdn63hJSdTgyZV1S211
         ZX9UKtemIGu/eEssV50ShrSRmpMEYM+Vb76BLj4XFxpiyMu9v/Cf0UnTvM7jjA7n/wSB
         hkAndlYT5KMys4th2v0na2YCDt+MUCqEQtZYSnZ6zcvbof1TX+2+EzRngodIPJ7HqfKf
         5/UcFaXHs2kB4hckp/A1EXg9cE9i21Tt7589PE2EHsZXZwex+gFtKC2acrwIOxVuCIdB
         Hh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1XB2bZM6McpwLcdJ/J1b0+QQ1qmOnpqQ8EyA3JE5xOA=;
        b=AOrxvqcSPhKT3sXXLv4abDVrOswbiycBmyV96iEA6osXjlo3Z+9olK69OeJYH6UJ6e
         Y4g6hBEZaWTE7PTG3CkbEcWhnnbUonN6Yx1QcPAocE6XnO0Rm0jcnpLvz8yzhsJFsv8U
         J2gYkgzOgjwybO5S7g6JKcg3ymXFJVVK4OdBHR7JTogQY2yL77FOAlsjEt7ZJpCIzbZQ
         u1BSdkhl7WC68Xp4FSCoJ1N72aErL99oIMtavi7GDtpPDd56yiFCM0Jfv8YJCQGQFt9z
         76EbS/vNlqEnz2geMO8Rp6GnGXQLOXLpFAW1kRGTDeN4uz3xomQFF2ms/JwdVgToyg98
         9K3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o123si19769qkd.308.2017.09.22.08.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPVJ-0003YI-WE
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQY-0007w1-BG
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQX-00045A-HZ
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQX-00043B-BF; Fri, 22 Sep 2017 10:59:37 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQU-0007AY-IF; Fri, 22 Sep 2017 15:59:34 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:54 +0100
Message-Id: <1506092407-26985-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/20] target/arm: Warn about restoring to
 unaligned stack
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pg8MTnKuKF1f

Attempting to do an exception return with an exception frame that
is not 8-aligned is UNPREDICTABLE in v8M; warn about this.
(It is not UNPREDICTABLE in v7M, and our implementation can
handle the merely-4-aligned case fine, so we don't need to
do anything except warn.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a2e46fb..979129e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6403,6 +6403,13 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                                               return_to_sp_process);
         uint32_t frameptr = *frame_sp_p;
 
+        if (!QEMU_IS_ALIGNED(frameptr, 8) &&
+            arm_feature(env, ARM_FEATURE_V8)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M profile exception return with non-8-aligned SP "
+                          "for destination state is UNPREDICTABLE\n");
+        }
+
         /* Pop registers. TODO: make these accesses use the correct
          * attributes and address space (S/NS, priv/unpriv) and handle
          * memory transaction failures.
-- 
2.7.4

