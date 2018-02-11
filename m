Received: by 10.28.71.27 with SMTP id u27csp3691814wma;
        Sun, 11 Feb 2018 12:59:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227RvntDaEzDzT4WbIz16xRRuNVui9dj7dGRU6Uu4yYFl6O+sE92ZQn8TKUmVhZXVkqcttJx
X-Received: by 10.129.81.210 with SMTP id f201mr3797175ywb.77.1518382769947;
        Sun, 11 Feb 2018 12:59:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518382769; cv=none;
        d=google.com; s=arc-20160816;
        b=YOY49zeC/fDeK4DpHnhS3pjWbZt5qfSqt9g2EBXtiG4bGaAY6zHC9X6rwi6sHnqH4M
         K116Y8WWtom/FgUIpuMtYfbsbSnwFDOWuSgyZQF3A0+dq8BZqCmQJx0oVsfzV0sykYAp
         xgYlYhHUn+Jl8tdatDGMWoP7TvRaCytluJzqw20UIs74oGTK+GD0sLbjAOl/uL22DwJW
         sm009uZWiKOFbqXE+8tBm/H3gwLSEleft0yVNNEScnLhzb/JKegSpAUbv2W4lyusgLLf
         FHe9bh9dQcQJknzeGv8RxCQKjzlggnIDvkEndX9o1LUJxPs1P08il3KbpC99jv8VPcNL
         Zt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
        b=B5BjtahMbZh0ay817ibc4qx35Myu12TI9X98ekq8bZ/DtvFyFu4CIEk0e+ABVqEZ7W
         hGa8VDvwpQF5MsOgIW1cWulKRmz6VVOj6y6jjYNJS6ObP6L/W879D6fD4JlYQJKDWmt2
         7nTutKMGipMC5gPHiQpw1zNoROAVVwhjTqLn6pJN5EJ79QEP6hMER661TsQRmdU0hsTW
         AF5jDJ9G30IRnPVO703rB0nk49+NKVG/DLn+EyKk1hvpYJbjjKfVdoyscBI2znwXx9mm
         lgrmLsQjCBMPMwgIKQCoQhqqVTIQckZ8ZAHvPhUr77QCMnjNl0w7Vpoxv2dAlaQ2obhq
         rsFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dF1sML3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q65si925624ywe.776.2018.02.11.12.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 12:59:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dF1sML3v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekyif-00079H-8j
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 15:59:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi8-0006kj-Uq
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi7-0004A1-Db
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:56 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:45731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyi7-00047o-4f
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:55 -0500
Received: by mail-pg0-x241.google.com with SMTP id e11so207037pgq.12
	for <qemu-arm@nongnu.org>; Sun, 11 Feb 2018 12:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
	b=dF1sML3vr/csfHJSssQQ0cB9ZccsJgvF75xdElASwiNpLIwcXEpzU+h7wlf8InzN0I
	sGNElnWxT7oQ2D9RsrdFUZUpEuY8rdsyAhmtbvBF6rtimblY7g6+Gw8SICzqrGRowlCY
	nfLl32aqy2MyBsezfYt+tYwJqNoxYFuHFrkJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
	b=FhywXUse02vJFgihYUmG34pm9kHFg3eXEwrT0bi4xYuZ5qLoTyKnoK4p5qNniCuDep
	wIxuxnOcUp9KETJSAeL60bAxu29L7Pa56E2nlBczxSlaYe0qp7oFSTrP9ZCca6/w02pi
	olaYCxVPXBV/Nw/EUndCoiE6wNC3FTLJ84jGd3sCiyQ10H46BPqZ/rEc8PUh8FpihV2k
	DPGQEv99Cnvhs1u5J6RXNYfH3Vw2+txYrMOwPu+EgE9r0Yl15Z4rS0/a8vq+YsX40eNO
	gDXV18wUbJwbfYcFlwsvAYvS6/T5mXi3vGSjIIt8S5g+sXR0t0BRLRWZY3DsLm8qyH5X
	V/VQ==
X-Gm-Message-State: APf1xPA+ETGgcatiYYTcc8Z3VYS7+2XAxboUOUZEOZXh/WZgspaRq12U
	G6CAkt3XZQpucVFaGZ6NyfEZ3g==
X-Received: by 10.99.147.72 with SMTP id w8mr7417602pgm.300.1518382733941;
	Sun, 11 Feb 2018 12:58:53 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:58:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:43 -0800
Message-Id: <20180211205848.4568-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 2/7] target/arm: Enforce FP access to FPCR/FPSR
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3VFVkJ4DGpGG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 35 ++++++++++++++++++-----------------
 target/arm/helper.c        |  6 ++++--
 target/arm/translate-a64.c |  3 +++
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 521444a5a1..e966a57f8a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1714,7 +1714,7 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 }
 
 /* ARMCPRegInfo type field bits. If the SPECIAL bit is set this is a
- * special-behaviour cp reg and bits [15..8] indicate what behaviour
+ * special-behaviour cp reg and bits [11..8] indicate what behaviour
  * it has. Otherwise it is a simple cp reg, where CONST indicates that
  * TCG can assume the value to be constant (ie load at translate time)
  * and 64BIT indicates a 64 bit wide coprocessor register. SUPPRESS_TB_END
@@ -1735,24 +1735,25 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
  * need to be surrounded by gen_io_start()/gen_io_end(). In particular,
  * registers which implement clocks or timers require this.
  */
-#define ARM_CP_SPECIAL 1
-#define ARM_CP_CONST 2
-#define ARM_CP_64BIT 4
-#define ARM_CP_SUPPRESS_TB_END 8
-#define ARM_CP_OVERRIDE 16
-#define ARM_CP_ALIAS 32
-#define ARM_CP_IO 64
-#define ARM_CP_NO_RAW 128
-#define ARM_CP_NOP (ARM_CP_SPECIAL | (1 << 8))
-#define ARM_CP_WFI (ARM_CP_SPECIAL | (2 << 8))
-#define ARM_CP_NZCV (ARM_CP_SPECIAL | (3 << 8))
-#define ARM_CP_CURRENTEL (ARM_CP_SPECIAL | (4 << 8))
-#define ARM_CP_DC_ZVA (ARM_CP_SPECIAL | (5 << 8))
-#define ARM_LAST_SPECIAL ARM_CP_DC_ZVA
+#define ARM_CP_SPECIAL           0x0001
+#define ARM_CP_CONST             0x0002
+#define ARM_CP_64BIT             0x0004
+#define ARM_CP_SUPPRESS_TB_END   0x0008
+#define ARM_CP_OVERRIDE          0x0010
+#define ARM_CP_ALIAS             0x0020
+#define ARM_CP_IO                0x0040
+#define ARM_CP_NO_RAW            0x0080
+#define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
+#define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
+#define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
+#define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
+#define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
+#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
+#define ARM_CP_FPU               0x1000
 /* Used only as a terminator for ARMCPRegInfo lists */
-#define ARM_CP_SENTINEL 0xffff
+#define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK 0xff
+#define ARM_CP_FLAG_MASK         0x10ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4b102ec356..d41fb8371f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3356,10 +3356,12 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = aa64_daif_write, .resetfn = arm_cp_reset_ignore },
     { .name = "FPCR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 0, .crn = 4, .crm = 4,
-      .access = PL0_RW, .readfn = aa64_fpcr_read, .writefn = aa64_fpcr_write },
+      .access = PL0_RW, .type = ARM_CP_FPU,
+      .readfn = aa64_fpcr_read, .writefn = aa64_fpcr_write },
     { .name = "FPSR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 1, .crn = 4, .crm = 4,
-      .access = PL0_RW, .readfn = aa64_fpsr_read, .writefn = aa64_fpsr_write },
+      .access = PL0_RW, .type = ARM_CP_FPU,
+      .readfn = aa64_fpsr_read, .writefn = aa64_fpsr_write },
     { .name = "DCZID_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 7, .crn = 0, .crm = 0,
       .access = PL0_R, .type = ARM_CP_NO_RAW,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fb1a4cb532..89f50558a7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1631,6 +1631,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     default:
         break;
     }
+    if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
+        return;
+    }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         gen_io_start();
-- 
2.14.3

