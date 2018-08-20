Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp816500wrd;
        Mon, 20 Aug 2018 08:31:22 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaLVhC42icJuveUVeaaNuA8aeDWYCT1v4hDac8e8t7x7PWVdAuEa6VMUXBAaQ1Z2s3Z74Ti
X-Received: by 2002:ac8:764c:: with SMTP id i12-v6mr10762403qtr.250.1534779082493;
        Mon, 20 Aug 2018 08:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534779082; cv=none;
        d=google.com; s=arc-20160816;
        b=S55OSVxO1I9uoNccOytMaIKHQOs0ZB+77HCCzio6gKzAIf47QS5ifzqZQUR2f8+5zX
         acjtcJTcQvLiQpr2HL4OiF4G9S0rTx5JI5cqhspwWQedD6Jg2SwE6RYxeB77JCxvTL1O
         neZiDn2NQvCd0XOvsIPPGlI3Tk5CnbM7hOGgpFJEk02AK6dnRlx5xCC3fJtnIhGbGrNe
         /Z1Zetou4XtxoOZcHnZh1bMjF7dnEkCHhUhykmTYuL+mjV77pcC7ac3uN+LNKtw3kFU2
         OtK1d8EIOsnx2k3+ksYt5ul2vPZxKcxO+5tqamisfBRtpYOwS1wTQIqGhtVqSVgPoNMx
         oXVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3CvSwrmSuBIbLZxYAjdp+og32bCQHbuyhht33Y+lrMM=;
        b=nHaakfDo86wH6+bvBGZ8vG6K6mIbzaIV1kPgckuBCBJOqtWZB6ltxYNfUAQ0HH8XmP
         3puGogvmweG6qNwQ//fg2Gbk8lxndv6R9PI/+30Gs7OU0u1eOnRJC0e2yqXygIyjTjdK
         ihTVr4CRoEJxSfktdKGUMdHT+j9j8U9T59sU4Ed/+FhKegEdZKzp/zEX2SYzBbZMH/JR
         rf17Fpu53cvvjDn6VgiYceovCvq7f/Xi9nWaOgvoAUow0F8Bv2Jvcz2rw7dpdgqcuJhc
         f0xv7p0rxlE2xue+e+UoiQZ4WJ4SZ+TLsN6VwW8CY9luzWSwxg+CSps3Hc2AFJFC3jMr
         1Gyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i7-v6si7794806qkb.178.2018.08.20.08.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 08:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frm9J-00063L-RO
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 11:31:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8U-0005Zi-S4
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frm8U-0004AA-91
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 11:30:30 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frm8T-00048Z-PS; Mon, 20 Aug 2018 11:30:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frm8S-0003ab-RS; Mon, 20 Aug 2018 16:30:28 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 16:30:20 +0100
Message-Id: <20180820153020.21478-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153020.21478-1-peter.maydell@linaro.org>
References: <20180820153020.21478-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 6/6] hw/arm/boot: AArch32 kernels should be
 started in Hyp mode if available
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eg1fdFS/1A7s

The kernel booting specification for an AArch32 kernel requires that
it is booted in Hyp mode if available; otherwise the kernel can't
enable KVM. We were incorrectly leaving the kernel in SVC mode.
If we're booting an AArch32 kernel in the Nonsecure state and Hyp
mode is available, start in it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ca9467e583f..20c71d7d961 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -736,6 +736,17 @@ static void do_cpu_reset(void *opaque)
                 }
             }
 
+            if (!env->aarch64 && !info->secure_boot &&
+                arm_feature(env, ARM_FEATURE_EL2)) {
+                /*
+                 * This is an AArch32 boot not to Secure state, and
+                 * we have Hyp mode available, so boot the kernel into
+                 * Hyp mode. This is not how the CPU comes out of reset,
+                 * so we need to manually put it there.
+                 */
+                cpsr_write(env, ARM_CPU_MODE_HYP, CPSR_M, CPSRWriteRaw);
+            }
+
             if (cs == first_cpu) {
                 AddressSpace *as = arm_boot_address_space(cpu, info);
 
-- 
2.18.0

