Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp900442wrt;
        Fri, 12 Oct 2018 07:46:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62LlHEi6ZdDGiff8PXNV6B88deDGTHlOgHRBtSG7eLD5HRTZ7RCSLKOychnVdQOxbFyMxqW
X-Received: by 2002:a0c:b49d:: with SMTP id c29-v6mr6407771qve.75.1539355612523;
        Fri, 12 Oct 2018 07:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355612; cv=none;
        d=google.com; s=arc-20160816;
        b=00it+y7A8+EtZqExV0gatGuyTfnTD5H2IfoD3m8oHtLSzcF4V4K4703MQmkJB22YGJ
         kcOCrbnXL08ZPGQduVlduB6bsAN5TE9Hq7pSt8Bvq/aVThRlQuzB+4OyA6Dy1la/isnz
         3KYdXeaweBzARrTFMVZIzbiFGexjnvWhWsxV+pz/fLGiHQr7yltx5t38TtLShIRS22yr
         QqND3PmzTRP7PPTAyJZ+O1doDovf0c6eeMmR1KzJgNXhGx4LQYLGo+h1RzOiY3R3hgjx
         Ewe3CXMQ89722g8CrjnfgnapnhDIah5Rip/NT2gy+26TVQq9c27WlkwH77fPaZUxlO5P
         F02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JZH/Kjnru7jKz33s+DuzqVq7dopxuu2ZiwaPLzptua8=;
        b=OuE+VnEU7HxewrsvtynB7+c4QuteVkhd5JfTd1eds6OzBJ9DxpQziZzAbaPFGnCOAt
         qncG/DLuDl02J/Zk5yCwQ+UoxNuPJc51ao8pC3ySN9X2GXun/qUwCCVJ9TUpV+GybQQ6
         VQYFlU1jepRDqwf4eBYX3noRubxjmJf+h2bh0FhnXR7KsacfKKJrkdRfdG3HWxILV/Yr
         YsfqAJvwJTFv1F+6ryoy5cqGFBS2d77Kw3PPN5TEDGFUXfQePDZzMvDRETtKEQfOMGak
         WKuRHLULQTeWvVPzFZggLJnkWeBYvB+ZO3oj1V2R4OwlpOOzBCNR9Xm1E9QdHl6vMdMO
         A/CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q9-v6si1243986qkh.248.2018.10.12.07.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyiH-0002e3-II
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:46:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeN-00080W-PB
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeM-0002wa-Qb
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51802)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeM-0002ut-I1; Fri, 12 Oct 2018 10:42:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeL-0000Ow-II; Fri, 12 Oct 2018 15:42:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:30 +0100
Message-Id: <20181012144235.19646-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/10] target/arm: ISR_EL1 bits track virtual
 interrupts if IMO/FMO set
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
X-TUID: He4ZtCY77V64

The A/I/F bits in ISR_EL1 should track the virtual interrupt
status, not the physical interrupt status, if the associated
HCR_EL2.AMO/IMO/FMO bit is set. Implement this, rather than
always showing the physical interrupt status.

We don't currently implement anything to do with external
aborts, so this applies only to the I and F bits (though it
ought to be possible for the outer guest to present a virtual
external abort to the inner guest, even if QEMU doesn't
emulate physical external aborts, so there is missing
functionality in this area).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 84b40031b6f..65e431e03b3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1328,12 +1328,26 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     CPUState *cs = ENV_GET_CPU(env);
     uint64_t ret = 0;
 
-    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
-        ret |= CPSR_I;
+    if (arm_hcr_el2_imo(env)) {
+        if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
+            ret |= CPSR_I;
+        }
+    } else {
+        if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+            ret |= CPSR_I;
+        }
     }
-    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
-        ret |= CPSR_F;
+
+    if (arm_hcr_el2_fmo(env)) {
+        if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
+            ret |= CPSR_F;
+        }
+    } else {
+        if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
+            ret |= CPSR_F;
+        }
     }
+
     /* External aborts are not possible in QEMU so A bit is always clear */
     return ret;
 }
-- 
2.19.0

