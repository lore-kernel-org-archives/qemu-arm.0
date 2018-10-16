Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5624088wrt;
        Tue, 16 Oct 2018 02:37:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60566+DbMzS0aw386fpWFDLKqMeeYxAItnUdRmTwVjrAgrwTd8TOeK4XzdQ8OCpauZ/beeQ
X-Received: by 2002:a37:2307:: with SMTP id j7-v6mr19909214qkj.146.1539682658548;
        Tue, 16 Oct 2018 02:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539682658; cv=none;
        d=google.com; s=arc-20160816;
        b=fdfZv00JdDSbwyC0TjPhToxpex9/T/UPIj2U/Yx+a8UNbHKeblgRfMtbWzFOTrWup0
         mmVSzDHqkRiGz/0PG02XAdoSAW2GrhRA6+S8aiFewa7g73j9YQzWnQp62+hg67WirlKZ
         nzU7zGW0yiA5rZjceIU0IYIyrdlKdO9oTevyWZy/lOcXyqcejErzFwo5QX713rV3ldrl
         cef4WqZWSPSozZtw95asaoCGoyMIRkCi0jaEUidxcijtjeXijCOiWrxEI7rPfmnumJOp
         moLttwgUIIv9H/9ahABTUw1DObWRLWdhdx/+rxqfOMoktLBiRiacPfUoF8m01OMVTNUF
         336g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ckMmZOuh7mIM28RxoB/ADTNpJIvKIT2+iOTSzCjfZ74=;
        b=zpQmNkh0k0MRkbgx3MJ+72xmmHkqaB+ka4UYpe/t8JF3ZOmrxIBUXLvHICyM6/pgZQ
         on9javssz8sgfS/EvuV7NB0cIBL+ootUrAO/A9ki7sBEr00mYtbXkA9uIer2MtxMWb91
         Y4GWBcnEC1/jHF7gtwMq3uSTaQVskAUH9+fRcjzxDKyKL/pUjgyrIArQBn0XrISZYlsw
         i5QIjvX76bjSydqzG13eIbQDdEIkXZyjrS7BmvRA/3R7GFib0q45IYMht44rrObvH9sx
         AT2uZAm/BpXL+7cVf8pY2fIH3ERDTIhKPv4rgeaki/MjRG9L7vMtqqkRFqeEW6Eyzqzl
         xlBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si5246925qvx.161.2018.10.16.02.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 02:37:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCLnG-0007Hp-3X
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 05:37:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLmv-0007G1-SK
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gCLmv-0000zP-4P
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 05:37:17 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gCLmu-0000qT-T2; Tue, 16 Oct 2018 05:37:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gCLml-0003Xq-Ld; Tue, 16 Oct 2018 10:37:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Oct 2018 10:37:02 +0100
Message-Id: <20181016093703.10637-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181016093703.10637-1-peter.maydell@linaro.org>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Set S and PTW in 64-bit PAR
 format
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
X-TUID: hDc4bQa/O5hk

In do_ats_write() we construct a PAR value based on the result
of the translation.  A comment says "S2WLK and FSTAGE are always
zero, because we don't implement virtualization".
Since we do in fact now implement virtualization, add the missing
code that sets these bits based on the reported ARMMMUFaultInfo.

(These bits are named PTW and S in ARMv8, so we follow that
convention in the new comments in this patch.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 43afdd082e1..dc849b09893 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2344,10 +2344,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
 
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
-            /* Note that S2WLK and FSTAGE are always zero, because we don't
-             * implement virtualization and therefore there can't be a stage 2
-             * fault.
-             */
+            if (fi.stage2) {
+                par64 |= (1 << 9); /* S */
+            }
+            if (fi.s1ptw) {
+                par64 |= (1 << 8); /* PTW */
+            }
         }
     } else {
         /* fsr is a DFSR/IFSR value for the short descriptor
-- 
2.19.0

