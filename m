Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10588C43327
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 20:46:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfOG8-0006nI-C3; Thu, 02 Jul 2026 16:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFx-0006i9-Ui
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:33 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wfOFs-0000VZ-En
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 16:43:33 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-ca00f126b7eso97266a12.2
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 13:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783025006; x=1783629806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RwI7JlkBk6Ii388/4jtMaAw7B3ZR7ujKm0vuL/CM/8=;
 b=Zl3YleF8qnZ/XUWMutxha1o+IOTHuAiQ+uAjh4yDzbKt9KzisessG5XWriT/EeC5FS
 c8umajsCiGBEA1e5ud6V9LiJAFQcU5hogObO3vHiCu7aZYQiGh6WdlqGJrvl5o7NV81y
 6qLfsA5lcd4DSIN6KDygHevMCBm5ErJJKA0aOvuhwRpGueBlgoKq6PGQTl8qgQxgN9wA
 ESyODuRNGqphr5gcJK8+4X/n+8iQDGzzpDjQAZKBG3qkCBAj4RzagZticNsme6skfhVJ
 X2BPpFv8P7dX4MxKZ22cGqDhT2yza/pJhUMFIlc7IhZLwskeLfH0CDSYRpMPBG5hnOox
 LR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783025006; x=1783629806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/RwI7JlkBk6Ii388/4jtMaAw7B3ZR7ujKm0vuL/CM/8=;
 b=YHX2eneCHArXboq/4uM7ortiTFDQYtFrolhQjc+Bk6ZPJENrSMiWNlHXbW97yy1PyM
 ULdB8BUKqKD39ZPykFZ1kP0NCcCqBhY0r+Et5jqTp1uwWkv5NTYxdyadgEGqpZB8vmt7
 RkVda4DVfKC+D3oLCqfkvvbPw34NMTynmKWg0MBx6im8lt41Ov7YwG5goWSx1ysPWtf7
 VVEsW8UWloqlSTTimtH8tTfpzArPlQOnJxPLsdxvEGMnbX9JCuiwN3D/bDmTCUWSdJ3P
 mSOOK8Do9gDn+5bxEI8PUlNqc/1e4wjogj4ei/Bg6PKNQsc/9pLfQaTmMpZFWY3EmQRw
 G0jQ==
X-Gm-Message-State: AOJu0YwnKbX86qDTytCs4YfrD++HR+MUix6BTtTet8Hg6l6tC5FSsdbg
 kmuSo+r1v1ABM8PICQseAeo7ryZoFZoh3O92a3bm/+Hoq9xh9vPEVA8jLv59ONt7bPM=
X-Gm-Gg: AfdE7cmCWiOOzTUMU4P9EI6hmWDM+KJJL1p5WgbdleGQwIGI23uIqAXG64buGZqU1zp
 h2+flZ2AyBVdN+HOQQDiKhey5qfrHQXcPHaRPOg9FsY3hwGLIn/9sUqPGtJuc3ezyoGegH735RF
 VYn/Vp6+P+UtrjOBKg1ep/XAo7I7uemGpgwYwzfXdpVwLdWkxV9lWfTuIWxGIPBPkyrOaCQaoM9
 7D/XvxYZoESmUDX72Ca4L6QmPcLdUrSQDQPqgkrV2HCONvnR6DqrYhPX48/UZWrn/qRkBnxlYMj
 5UXT5rmC4FvGN6axOLWeR9QLsMAV5frhezzW23SYxG71LsxaEsO6x68DpzrxcCpMhKNR9VF7yCr
 tfgUUkZrBMj3oXxCppO01i0Cq3ni2obb+ZO8NrgkPD31+aJrMyegSlxRyw3g6OL8SVtWH58ewIH
 2EePMuDzv5LYv0djycXCgoNeBUzc9qJ8UPg1owMDqm1WEA6hEUvA==
X-Received: by 2002:a05:6a21:150b:b0:3bf:e2dc:bc7d with SMTP id
 adf61e73a8af0-3bfed570246mr8939999637.57.1783025006220; 
 Thu, 02 Jul 2026 13:43:26 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c9e921cd139sm1678941a12.23.2026.07.02.13.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 13:43:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/15] target/arm: Implement UMOP4[AS] (2-way)
Date: Thu,  2 Jul 2026 13:43:11 -0700
Message-ID: <20260702204314.79224-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702204314.79224-1-richard.henderson@linaro.org>
References: <20260702204314.79224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h | 3 +++
 target/arm/tcg/sme_helper.c      | 3 +++
 target/arm/tcg/translate-sme.c   | 3 +++
 target/arm/tcg/sme.decode        | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 3da40d9f33..38b23690d1 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -382,6 +382,9 @@ DEF_HELPER_FLAGS_5(sme_ah_fmop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_4(sme_smop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_umop4a_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sme_umop4s_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sme_smop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_smop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 5a9e3b8398..fd085850ed 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2953,6 +2953,9 @@ void HELPER(sme_##NAME)(void *vza, void *vzn, void *vzm, uint32_t desc) \
 IMOP4_2WAY(smop4a_sh, +, int32_t, int16_t, int16_t)
 IMOP4_2WAY(smop4s_sh, -, int32_t, int16_t, int16_t)
 
+IMOP4_2WAY(umop4a_sh, +, int32_t, uint16_t, uint16_t)
+IMOP4_2WAY(umop4s_sh, -, int32_t, uint16_t, uint16_t)
+
 #undef IMOP4_2WAY
 
 #define IMOP4_4WAY(NAME, OP, TYPED, TYPEN, TYPEM)                       \
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index fce07b2565..a8fcb0630d 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2110,6 +2110,9 @@ static bool do_mop4_int(DisasContext *s, arg_mop4 *a, MemOp esz,
 
 TRANS_FEAT(SMOP4_sh, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_smop4s_sh : gen_helper_sme_smop4a_sh)
+TRANS_FEAT(UMOP4_sh, aa64_sme_mop4, do_mop4_int, a, MO_32,
+           a->s ? gen_helper_sme_umop4s_sh : gen_helper_sme_umop4a_sh)
+
 TRANS_FEAT(SMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_smop4s_sb : gen_helper_sme_smop4a_sb)
 TRANS_FEAT(SMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index aef3fae8db..fbc85b8206 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1118,6 +1118,8 @@ FMOP4A_sb       1000 0000 001. ...0 0000 00.. ..00 00..         @mop4_o2_s0
 FMOP4A_hb       1000 0000 001. ...0 0000 00.. ..00 100.         @mop4_o1_s0
 
 SMOP4_sh        1000 0000 000. ...0 1000 00.. ..0. 10..         @mop4_o2
+UMOP4_sh        1000 0001 000. ...0 1000 00.. ..0. 10..         @mop4_o2
+
 SMOP4_sb        1000 0000 000. ...0 1000 00.. ..0. 00..         @mop4_o2
 SMOP4_dh        1010 0000 110. ...0 0000 00.. ..0. 1...         @mop4_o3
 
-- 
2.43.0


