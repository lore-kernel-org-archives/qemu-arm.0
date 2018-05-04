Received: by 10.28.4.212 with SMTP id 203csp333782wme;
        Fri, 4 May 2018 11:30:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqxHIf22m2ua3dfg1UHydc/MYNHj/FMJhFuJGkIAJuNJpNtEfzKkgAxjHcvxUFfQTdV89eX
X-Received: by 2002:a0c:f146:: with SMTP id y6-v6mr24960239qvl.0.1525458648994;
        Fri, 04 May 2018 11:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458648; cv=none;
        d=google.com; s=arc-20160816;
        b=xDkYt58MQtUIuDwWhXtm6m/yRN23WUzsDsNRGowGOX/JN58ipE9k6DqQTF9oawvDtu
         wTtj1xtteQPU+ZkzsY04FGpQeAgaDJTwhSoXSJMdZjDPJzouOjEhOCZA9bCCOPTwevNr
         WJ/8dcq98yRdeYq/i/URXJiu0VR5ug87LoOpC8q18Zf06M5EOxZnu4f18TFgR3eq2JNK
         TCLZNGedncs5AUJHbeepHHKmrKilN51bz6LJOle4erDGQBjrok4taLrP2eQC3L2A6kxZ
         2C22r9jL2aI99kXGYNHp8b23DEw95q3XxKGz3FsQRMQKZ/8virBLdOFU5gFy7kj5eFmL
         jb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SPjqhxLd7+E3Y6suNDHxXLhiZ2uZGVurwI4LU+Q6Rpw=;
        b=Inz8jmhc44uZVP5EcxHoPh+5iQ8kTflkvPtMlvfZ14X3fPvMr4qAlsDaAAJikB14ZX
         FjgMM3+Q3CxV7iLCuUvYZ518wMFRC9CW9tNPwd8DetenNbrGVzc8iKNyf4BO3Tm1Naxh
         6jxsXYz6bPNEqfnMvHibZWpYZ2XmS1VrPpgMD6vVgFRVKnp/S0pT3xJTC9X8Y6XFSE1J
         /QQKCY97/ZKWH+kKErO26oWE79lAHRiPQ59vw/K23lP3rf8D2jXTECBZOa4OWfkdNpK8
         2keQVDRGyXvOZT0OSQtQqheD71eU3KZkGO5I6D8VI9lqWdQjgr1T1htyt2i5W9njoJY5
         6Eew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eYYgX/I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s9-v6si2920211qtg.195.2018.05.04.11.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eYYgX/I4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfTk-0007Wl-DQ
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:30:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTS-0007T1-7k
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTR-00015a-7n
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:30 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:45526)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTR-00014s-2U
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:29 -0400
Received: by mail-pf0-x244.google.com with SMTP id c10so18058908pfi.12
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SPjqhxLd7+E3Y6suNDHxXLhiZ2uZGVurwI4LU+Q6Rpw=;
	b=eYYgX/I4G2Y7Al99KqdFCDicCsWg0XZFcjwqtjo/+OQx6kgzE+O4tEDwursqE3XDaX
	xtH0Qx5MKhSJypQm9uvHsyeLENPwc9JwxGiHvXRltcK3wD0tFBcKIAsyzXMqvODCJmbt
	TAMTh4iNwUU77YVx6JCdKTRI+kfROI9J4Z3Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SPjqhxLd7+E3Y6suNDHxXLhiZ2uZGVurwI4LU+Q6Rpw=;
	b=SY+0vbmqm0gIusUHPXxm2tlgKUyuBmirCLTvhiU4cA4JKu3xLw4+KkTwcD5mxD5ny/
	l5Oh7KW46J0uTm9sHR89kNMpQHM/5cUIMe9FDyWa+blC3499YfnHkf/JJYjhttGh1WEf
	GYDT/13HghdSo9DzL1D3Egay2QH6PpQ/Q/tWdm8kNF/zoCK3yE8/3K2qZdsSeF7FJrO8
	9Q4e5miDQXhPDNU+0UjxGiiKoq+Rvth6r+jo3nasFgW5vOV97QgEfJKjQFg3dQhmytuJ
	OiiXN1Lrop7LBPevhnvmKheb7OCC+CFwoIKDODLaGpcfyohYXwcyz5oJirlc8yKx7J1G
	NfRA==
X-Gm-Message-State: ALQs6tBNNuskG9vthTvxRXbExwXJzSP7u0WlYcCK7XkhYXk2ecssNIR6
	y1ZZs+bKeoX5qR5zP/aQkSjgUBF+jTA=
X-Received: by 10.98.150.150 with SMTP id s22mr27371635pfk.191.1525458628151; 
	Fri, 04 May 2018 11:30:28 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:14 -0700
Message-Id: <20180504183021.19318-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 03/10] target/xtensa: Use new min/max expanders
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
X-TUID: pXSjEeiDH8qY

The generic expanders replace nearly identical code in the translator.

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 50 +++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4f6d03059f..bad5cdb009 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1527,10 +1527,8 @@ static void translate_clamps(DisasContext *dc, const uint32_t arg[],
         TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2]);
         TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2]) - 1);
 
-        tcg_gen_movcond_i32(TCG_COND_GT, tmp1,
-                            cpu_R[arg[1]], tmp1, cpu_R[arg[1]], tmp1);
-        tcg_gen_movcond_i32(TCG_COND_LT, cpu_R[arg[0]],
-                            tmp1, tmp2, tmp1, tmp2);
+        tcg_gen_smax_i32(tmp1, tmp1, cpu_R[arg[1]]);
+        tcg_gen_smin_i32(cpu_R[arg[0]], tmp1, tmp2);
         tcg_temp_free(tmp1);
         tcg_temp_free(tmp2);
     }
@@ -1855,13 +1853,35 @@ static void translate_memw(DisasContext *dc, const uint32_t arg[],
     tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
 }
 
-static void translate_minmax(DisasContext *dc, const uint32_t arg[],
-                             const uint32_t par[])
+static void translate_smin(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
 {
     if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
-        tcg_gen_movcond_i32(par[0], cpu_R[arg[0]],
-                            cpu_R[arg[1]], cpu_R[arg[2]],
-                            cpu_R[arg[1]], cpu_R[arg[2]]);
+        tcg_gen_smin_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_umin(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_umin_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_smax(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_smax_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
+    }
+}
+
+static void translate_umax(DisasContext *dc, const uint32_t arg[],
+                           const uint32_t par[])
+{
+    if (gen_window_check3(dc, arg[0], arg[1], arg[2])) {
+        tcg_gen_umax_i32(cpu_R[arg[0]], cpu_R[arg[1]], cpu_R[arg[2]]);
     }
 }
 
@@ -2984,23 +3004,19 @@ static const XtensaOpcodeOps core_ops[] = {
         .par = (const uint32_t[]){TCG_COND_NE},
     }, {
         .name = "max",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_GE},
+        .translate = translate_smax,
     }, {
         .name = "maxu",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_GEU},
+        .translate = translate_umax,
     }, {
         .name = "memw",
         .translate = translate_memw,
     }, {
         .name = "min",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_LT},
+        .translate = translate_smin,
     }, {
         .name = "minu",
-        .translate = translate_minmax,
-        .par = (const uint32_t[]){TCG_COND_LTU},
+        .translate = translate_umin,
     }, {
         .name = "mov",
         .translate = translate_mov,
-- 
2.14.3

