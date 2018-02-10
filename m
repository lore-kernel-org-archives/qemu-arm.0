Received: by 10.28.71.27 with SMTP id u27csp2742378wma;
        Sat, 10 Feb 2018 15:06:09 -0800 (PST)
X-Google-Smtp-Source: AH8x227whTfcK2AcAwtDp/agK0MzOxEO5Wj3OlgLPZSzK+oVH2PnPOp+rIvuPwzimoRaDAR8JPno
X-Received: by 10.37.50.18 with SMTP id y18mr4789608yby.417.1518303969469;
        Sat, 10 Feb 2018 15:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518303969; cv=none;
        d=google.com; s=arc-20160816;
        b=fr4kCxRk4LwGVZ6ZGa0yaKbOGdRQHqLdG4VUinL6BTp9SGp5hd5kK1ZrZQTr5jVHGh
         WGmdq2byF/oaHD2dFCy0gKu5n2LfiltB74lCVdaYyk9oua/eeot46P+omg5FVOgM199J
         kAegYjwBm2ZhW8rbCMue4X81NqADJTdG9wbhzygM281dpmSKaNPWLJ5EB6wpbTpTIA1B
         /6qzIREK4S397upLQP6VFlKZkDsJ8j1oSkezeCG5QhCPGbaPp5vKaTDTxAjPYWRCo9Tk
         F/ISNY/6hODQGeDlTAM3VergC6iSWQe3JNB8+ouCzwCK5iPrQNR4U8+dCWArDzDU5it5
         glTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
        b=VfMXwGSPrd2zUH2Hz+hjMQNcz3kBcEGgYfbqvQ3+nElgAMqsDCvlI7sKeXfeJnJ+BY
         GHGPxLJVtQm8mUZkLDepcvrurK/BZOfzt01sK1rZSXi3MC+HKpSG3Et/0ZwGvHLXETEy
         QR6ieqJu9+hI637fbC8YsbdCzkyEIiGCXliD/YxBSnW0K8KSo1N0dbnftcjkywxQ3819
         5guYDugEnGYjgSDkX3vMEQekayPRFfBFSxdCZ+HtWUzs0WpLsr7/Rcp/N5G41YlrUsfS
         KPIUxLUK/MvoKRd3zC0Nml9TupzVbqDcG+wvjK+FkOihLwkwXtVgT2nOOXmhri35y5V9
         KBCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CoWOskR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e66si985415ywd.376.2018.02.10.15.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CoWOskR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeDg-0006iS-SH
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:06:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDD-0006UD-4r
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDB-00083c-GM
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:39 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:44735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeDB-00082R-7r
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:37 -0500
Received: by mail-pg0-x242.google.com with SMTP id j9so4916334pgp.11
	for <qemu-arm@nongnu.org>; Sat, 10 Feb 2018 15:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
	b=CoWOskR625v8onaamWjTOW47R45NzFqwOH/2bNk7Mgi1DcD7yMItWxnXtQGYPdB/rO
	qkNVbEeesIYZ6tEk9xQjHORB84mYNjL9pzCe7pFWhS/AsGkQNGQrWG1jzjU9PJbXejKB
	BGbZyKfVU+oaTvE18Z31xgBQojG5EUo3nW7v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=db7o6VMgdo08ugsOkXJ4Br6qKJbdNpL9zH2Gp3+8vaw=;
	b=JViuWaJSkBWM8JALe8AhAdHqBJPlr+x/7K1l3r+QwEeu60Syvo+RlhZoXwJSEpJZ9P
	qOgKmJ8uSp3v1Jg2vL5AclsgJ4S3vtjIlwVySn5bvc4M6ZIshvCgyIH4I5yCqe3P8Ul7
	IWU1qo2Nmb/Y/x3/xfkY2V5UVhM1+YdEJxNi9tf/aHaTIf+i2sxqLcHKNN8fcfZtKNY2
	TethhqL6uRXBd9/XqHjmQYsnSz8BOsG3duoDEiGQdUwS4aE6cfXhUbwAwLm/3Xodtf9h
	cSo+Y9Dfm/r8vgARncVpnmrlAz+TVpKFovuaNblE9dTT46InOG66HlcerwovnSUdx4XN
	K+IQ==
X-Gm-Message-State: APf1xPCUAKxRVBrjF1EEE20OE3vOOJ2v7qyNQDXqNJKCWJAfDGqrtIF9
	v0zYIh83zI0lZK29goWEncIYWA==
X-Received: by 10.99.110.3 with SMTP id j3mr5883490pgc.85.1518303936259;
	Sat, 10 Feb 2018 15:05:36 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:27 -0800
Message-Id: <20180210230530.8421-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180210230530.8421-1-richard.henderson@linaro.org>
References: <20180210230530.8421-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 2/5] target/arm: Enforce FP access to FPCR/FPSR
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
X-TUID: ZEqf7jZdeqtJ

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

