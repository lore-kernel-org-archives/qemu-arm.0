Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp1101558wrw;
        Tue, 6 Nov 2018 08:41:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5etHdYql/qbRNAH+vtYBI97Ct6KCUNyVwVnT972GF75ptykigWdh+zA4g7Q9448YW/vlQ+m
X-Received: by 2002:ac8:3181:: with SMTP id h1mr20825115qte.14.1541522507856;
        Tue, 06 Nov 2018 08:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541522507; cv=none;
        d=google.com; s=arc-20160816;
        b=bOojPGCmq2lq0XM3M79bgjGIZSztNvAJSHkqtVTa/BtF+sUt0LbqbXQIakA7z56tR4
         nVAxdlDG6zzngdQQG4axqbJNRwmQb+mh9icsY1VnSqgG262P8QIg8GVOG+5CkR+wSQUs
         P9Fjaf0nTj7Y9kslA6Tqg3OjPVLrcX6sYUQtF4k3FcexqwXYMlzSGSVX4Mp8dSXgLIBy
         5X9IKOBMb5ekTkXZLiQ+sFcKP7zIcsGr6nZ+WYHESa06W9eBVdeoSEEq+2zc7ZCIpaV9
         TfZ3BAIB1qZABySZdwhP0w1fjxO/IRBInt0RSAKqNrxdAxy9vDbQclKICHUEymeNVrxt
         8bOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=PTLrFMk+LCWmZCGoHpe/bJ7gQzZmE8V8i2SfSc5CQ2U=;
        b=f60IaINTuGPd6uZPHUFwYjgZ6m0BvjPidnzYXNRoAu9Vala6tNY5/vQR7eqAuiecrK
         ApxIMXs/2rUx8csZ66lsihTJAl/XOkuqnjsqe6jdWJOm+aPaV749MUc8fx3wH1MAOPwj
         F0EuEP0e+7f4him6w4sbusfGjClwUlaZOPoYnaq/YmtlCHByiuSiDxgUz288GOu2tHRx
         U90dK3kN6EPSMTYZWPe/SQ1p9ROUYTF09yBDgvK1XSmdi4uRUAJfpWPQcxJDws6lJbHt
         1k/XCfs5hBLEDmlVUhhpDHvK5kGGsygF01xUTfJ+JR4zcAmkLFj/BgRMsKWrJ1zDKJQc
         uzfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v40si1398432qta.42.2018.11.06.08.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 08:41:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gK4QF-0007D0-Cr
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 11:41:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gK4Q6-0007C1-VN
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 11:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gK4Q6-0000TK-6i
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 11:41:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gK4Q5-0008Ga-V1; Tue, 06 Nov 2018 11:41:38 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gK4Po-00084J-ON; Tue, 06 Nov 2018 16:41:20 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 16:41:18 +0000
Message-Id: <20181106164118.16184-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1] target/arm: Remove antique TODO comment
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
X-TUID: MJLJilxmFK9f

Remove a TODO comment about implementing the vectored interrupt
controller. We have had an implementation of that for a decade;
it's in hw/intc/pl190.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ec56becc394..851ea9aa977 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8378,7 +8378,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         return;
     }
 
-    /* TODO: Vectored interrupt controller.  */
     switch (cs->exception_index) {
     case EXCP_UDEF:
         new_mode = ARM_CPU_MODE_UND;
-- 
2.19.1

