Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1358519ejf;
        Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
X-Received: by 2002:a5d:5550:0:b0:221:6d3a:1984 with SMTP id g16-20020a5d5550000000b002216d3a1984mr9553003wrw.326.1660590195451;
        Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660590195; cv=none;
        d=google.com; s=arc-20160816;
        b=hinD/oHs1iVWCu+5Ml/FCzDjupMtn7/sRLmoEETD9G8EIvKmEjxDdJb4VD6Ft9aXQk
         In41jMaFlxRw0iUEfyRw3G4DQbHznpRy6+HBfo48TNI1EQj4imRREnBI/0Xk8eF84blU
         +rHYczSLgnO1cs15ag3a2j5AJRtPEDok9fnsTkGxhK5AIEhnnQB8XL19APJQ+G5baDK+
         uPwPkQynf+mXs8gjM/zdHj5D4/gdxiL0e+g6lwdf9hTxb8NmK4lwr40eQ45E2sEfmrAv
         81eTigBM4lGG/HP2JapKkqBBHZurQOJjEXS+Cquq2oX98c6x9fjwawiYo11OQr9F0RWF
         xlqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sjyUnMJzfq++0t8oacR/+QsHL+4P2X7RJJ6Y2pg/KDw=;
        b=HPzlfh1KG++4EVQ7FzlqGHYDdxiCR/32mecA9HyyeQxPXMwemHDxFnxTPZHX5Fj3D8
         Vde/84poF+g4lIm8yru7o8iv2rxph+crc05CIxUgdBGLv4c+XIC94OPrKtuTATrcg05K
         hBOQhupOC9aWbTSmsrbL0Vg/M+iuWcWj6B6EqR6hmPRolLtp19x7dJ5cKxLyaB98U9d4
         qN8098WsGjazeex6w12CpFn49w4Ux/oGmzOVh8HP1eGlSRCddkvTiwiE9pd1kUy0H2Wt
         9qVVgb6UnbuSldWUVVi/kHb9J4wI36VboAibptfyfoFU66s0fWmDChIgReehlnU2pc31
         1oAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAj+CaFG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j14-20020adfa54e000000b0022504e895aesor1456989wrb.12.2022.08.15.12.03.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAj+CaFG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sjyUnMJzfq++0t8oacR/+QsHL+4P2X7RJJ6Y2pg/KDw=;
        b=UAj+CaFGYzEL5D7ZNriTDW2N797k1BN6Unm69rAFCPmO2hcVm+vkEeESdpQJ6eSDQf
         AFbHWqnSV/jqgkVJXkdIaFvvolSyadh41KMoII2FTx3yLWKN4Q+WY/a8snn2hc3A5HLm
         BRgGkdFRvSJ60eajasO4kykeAl7KzDv1TdHFXmvJNJClB1zbSTujppZ/nMfZw4KnHxb8
         d8qlOnKn2f5ihClsar14O9GrtYNL0ooMGtI/vRjEb0bTsGRVR7mK7S8hUQ2053nvuMge
         5QIcmJhcO9ZqM7UsODkBMXrCho6owfYQlNq+9onCMZjFg9ynF3bBepJqQ6E97fHrOI1D
         1fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sjyUnMJzfq++0t8oacR/+QsHL+4P2X7RJJ6Y2pg/KDw=;
        b=pGC+lxIBuK/p6ViEDPxLeOgFBv3PAtQ9rgPtYzRkXuU00GtSy2mgZ1hUXwGT/ttN+r
         8/pAiu5ELAND1CYofrwEwE9bxLogwVgGS1atxspc2fw0jO8VD1EuhHLj6kt4pG0nUGh8
         oZO5hxDtIau7WBRmyWIj1MObnR1IPqQvE1ivfd6LHfqmCLJCq1rz5uMn6hU1da9CPXoO
         qVBWmcgtXO2UJi0/NPRRlbXQGncQlzEgHaSiKuGjBU7cMaMxV/CFPUKMIeRH9Z1PGet1
         3dl7YRF1VSqd1liRt/sK+N5uEz+nwPaCHazHrsjycC6ned5YVgBt2kf0UEYi6z1OxSct
         b+0g==
X-Gm-Message-State: ACgBeo2NjXYImkTCKkoo98NDNkmS9W9ARb0R+2g5t9wARuC+EF1xqcvS
	EEIvL1z4OqSvw6re/JXrof1TTt2D
X-Google-Smtp-Source: AA6agR5qp8Md7YBV5/7MNmmGYSntL1TgcfK0XGcCrzL5Nh6DY2C8EmLCSDg7IrKv8sCBSZ2sdxdQ/Q==
X-Received: by 2002:adf:f7c7:0:b0:21e:fc10:b81b with SMTP id a7-20020adff7c7000000b0021efc10b81bmr9854483wrq.51.1660590195164;
        Mon, 15 Aug 2022 12:03:15 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:03:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stefan Pejic <stefan.pejic@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 5/7] target/nios2: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:03:01 +0100
Message-Id: <20220815190303.2061559-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GbvDY3e4v5x8

Honour the commandline -semihosting-config userspace=on option,
instead of always permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled().

Note that this is a behaviour change: if the user wants to
do semihosting calls from userspace they must now specifically
enable them on the command line.

nios2 semihosting is not implemented for linux-user builds.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/nios2/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2b556683422..d1786b43a69 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -817,8 +817,9 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
 {
 #ifndef CONFIG_USER_ONLY
     /* The semihosting instruction is "break 1".  */
+    bool is_user = FIELD_EX32(dc->tb_flags, TBFLAGS, U);
     R_TYPE(instr, code);
-    if (semihosting_enabled(false) && instr.imm5 == 1) {
+    if (semihosting_enabled(is_user) && instr.imm5 == 1) {
         t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
         return;
     }
-- 
2.25.1
