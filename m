Received: by 10.28.4.212 with SMTP id 203csp4254948wme;
        Tue, 17 Apr 2018 13:45:16 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/r4/Mp0+r7y89kHQrWVCQYvdoQ6YYSMUMUrD4vjtWUq7E02TpbnjLGuaaLnQFGMD2KneRY
X-Received: by 10.237.43.228 with SMTP id e91mr1936610qtd.10.1523997916205;
        Tue, 17 Apr 2018 13:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997916; cv=none;
        d=google.com; s=arc-20160816;
        b=BgoQF2Zkub9/JshfRMVcE9fRIfq8yvVVfXetvsbqldB78cXqGd6D4Lcepk0J4LHSl8
         LAf61DCgKWnlVBoHwmHYsHtPxt0SJxxaiBVAcPYrRcYwpSp6/JCHMc3aP1tU6aiB5D0D
         UXdsKwR2nVtk923Jtxp3bAdliy4RFPnusLAmcZmxo04iqLxGwWxl0i9o+5X/iMEtjT2S
         qZHF+gvvEB8vNu5UmUoq8xnrdLR3Skuj+FLVeZZOPXR00ItGC8UWt6xlAPKQxQdPqwyi
         z3MOs1L+ud44N2DLFDU2kKBzZ4ZBEzjKvfPzXwy94DGTDxB/7cxMHaJp3hpdJnlKpzFe
         BWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=MAxALKvAgYJC6ome9HNoIF8y38oakragdo0U0QOA/Ko=;
        b=irqsaM4r0OUB2NPN6mo/j43gsKDON346vvrv/PdGm3qGsvGbhB2HjrScom4KsG9M6Q
         4Yg6ZS0+6PN+YOOwBGJrSBqDUg+e/5h3otBoywWLZzOzkhXtCX4jm3AeocBqxrSHjjUb
         7+6VPU3v0N/njXDosU0WFPi09xYSslngfDZAwlxcymN62+DGz09E9TdyISMNbAciBaEf
         EdpKGOu2hxnaAgyifvExSvNWP39pIXrR3KxSexD2vnZ3erEFPlV6hfBYlrdd/i7FZjI4
         TtIHWLF0ZkTd4S3s0vSCx22O1iEQTCH9BKdyyCSBOUIuiSdPcul6/i7V1wdaK/DCpd7/
         1Rww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WwtIftJK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KRvJo/yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si8491213qkm.293.2018.04.17.13.45.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WwtIftJK;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=KRvJo/yV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XTX-0008Ap-Le
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:45:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNS-0002qu-PG
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNQ-00055G-Kp
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39630)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNQ-0004z1-8t; Tue, 17 Apr 2018 16:38:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 1E03D60FFA; Tue, 17 Apr 2018 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997535;
	bh=+FfW5AAUB8WglxGu5Y8YHr68g4yC/5zZXvXw821T2NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WwtIftJKmk/KXxJpCjuTJm8LexBVTBs47GcehInifNiEOhiIKghBcvj6aulICa0nh
	OgPo+KsQbR06QHFP+usN5/nYkkA17bzBpJN9aqdr1EGz3iWMOIymMAatIv7y47PQ/2
	ngNL5TGUHovCCviu+m/1W18Jr2hGtRJ9JlVsG3is=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id BFD2C60FF6;
	Tue, 17 Apr 2018 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997534;
	bh=+FfW5AAUB8WglxGu5Y8YHr68g4yC/5zZXvXw821T2NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRvJo/yVGfjJB5Q6ZyYmkkA/nTMxOiIjYgZg+NN+JyvnbKeHoAI04K2REJ77yPcI0
	Z+iu7ylCEkOkpp3rhoS1ZTIpBR8m1m03IZN7qsfZ1NvpufYUuTV8yxmmqD8pF1CfrZ
	UG/jV6VY5Q0MevXCFxeoD8wVU8xzI6CYV6NkernQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFD2C60FF6
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:52 -0400
Message-Id: <1523997485-1905-9-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 08/21] target/arm: Allow EL change hooks to do
 IO
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHJL8Wsd8Vzy

During code generation, surround CPSR writes and exception returns which
call the EL change hooks with gen_io_start/end. The immediate need is
for the PMU to access the clock and icount during EL change to support
mode filtering.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/translate-a64.c |  6 ++++++
 target/arm/translate.c     | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c913292..bff4e13 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1930,7 +1930,13 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_exception_return(cpu_env);
+        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+            gen_io_end();
+        }
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
         return;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index db1ce65..9bc2ce1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4548,7 +4548,13 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
      * appropriately depending on the new Thumb bit, so it must
      * be called after storing the new PC.
      */
+    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
+    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+        gen_io_end();
+    }
     tcg_temp_free_i32(cpsr);
     /* Must exit loop to check un-masked IRQs */
     s->base.is_jmp = DISAS_EXIT;
@@ -9843,7 +9849,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 if (exc_return) {
                     /* Restore CPSR from SPSR.  */
                     tmp = load_cpu_field(spsr);
+                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                        gen_io_start();
+                    }
                     gen_helper_cpsr_write_eret(cpu_env, tmp);
+                    if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                        gen_io_end();
+                    }
                     tcg_temp_free_i32(tmp);
                     /* Must exit loop to check un-masked IRQs */
                     s->base.is_jmp = DISAS_EXIT;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

