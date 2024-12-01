Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2152272njk;
        Sun, 1 Dec 2024 07:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnttb5fwn36+SH0HGwqa1G2/Ou+H8UZWfGoDs37/Yp7HtdYx8chJw9/D6w+xaa0WeVhXa344kBxwGLBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEtEdG87syWjmT0xYXPjP8YjSdWSXIzkHlIKcLYSt655gym/VAHNiGXOFTDAZj8q7o2W3y5
X-Received: by 2002:a05:6122:1e15:b0:50d:869a:e542 with SMTP id 71dfb90a1353d-51556a023bamr24047284e0c.9.1733066081844;
        Sun, 01 Dec 2024 07:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066081; cv=none;
        d=google.com; s=arc-20240605;
        b=CMT7pbxve5f6zzVGsNs1ajVi0hMmB3R4xewSCDO0gnlPx3Ia6cseHlnOkY3C9rpkJT
         PTGRNX8rOGm7VnEjxWLFt2vBq90ZrCYSId2Yunaho1Hzv4TNMkZ5dT6FNhxu0kggRFAk
         aQxt5zgKsqcYFD4twVmNYUa/8IUsawmPeJZtMIbuMqVHp52XrVi+k5EcyEJlEY9mzU0C
         KCsoZAHejmSa/q4wa91ydWbdflf/LoyH+/isgknOha1K/YnAVhDNl/Ty+xK9P8OL9H9z
         UQn9QlMR5oYg66gYeI47qXM+xgWVdjzs/xZrqxH90H7MxknZwe60wRz7cpzu/TLYYbc4
         xwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/f6Pn+cHL5BJAJGrD9PlXmg1oEjZ57keqW6WBa5VT3M=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gn3/2Az92YiJ0Vt6w5zNE3Pj6GGfm2zp9Y+xMKm6Jc+/Ku45KSTezx7odP5s/Z6AbA
         BecIE+PX8HhEY2p2j0H55j+7iBUGUrgWquMRiu2n7vSeleeGvQR9+xXav8cNZEGzA+O9
         j5Pnzx4X+nvqN2g5svSaci4sSBnWuVgrsaCYcln0fwVmuu6BiIgJAN+5/KvVxEKJabQR
         5X/wIZ2yXoitZTaNrKCyx81VoOv3BEggWRScjRZkbf2URSKvmP/rAX92KN38wu944J/O
         RgXzrcgO7BO+s1c4neSwRNuNbDdvy8BRW5c5ExTOASLPcx2xjW1XqniLUrACAUTLHqR3
         Wp4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLAfLMfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d151f63si2931801e0c.254.2024.12.01.07.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:14:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLAfLMfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlbf-0004kI-9H; Sun, 01 Dec 2024 10:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaU-0008CU-RO
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:19 -0500
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaS-0005Gb-TQ
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:10:18 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5ee8eaa1694so1483820eaf.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065816; x=1733670616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/f6Pn+cHL5BJAJGrD9PlXmg1oEjZ57keqW6WBa5VT3M=;
 b=RLAfLMfE+2spi4cZecUlOo2DeWJa7EQllCcnKriK3xOUfkocX5e3kZ4ZN3v5N9SCdL
 G9p888pYUERr/+UBRedoC3KbId8uhNs9vqVL70JOVPUbVXVhoSIhiqfOEqGbz8k0LRRR
 OW/Sj2A2i0EUB3+neajH1YoqqDQtz0nFyzW4kboX3Rps7vPblSp/197E2cYzztvFxfgP
 HHNfxRQSt1J76r8x/ILaIkmpTOT+Qcf8vB+LqwyWVlJ6xbfIUrtLf363P7z7C5WLulAs
 uXeSz28rDsTv216YerHFxiyCpWcn0sbnS/Bmj4bZQCcNzkxPBn77Mp8SeB9Uf2LFItZK
 kgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065816; x=1733670616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/f6Pn+cHL5BJAJGrD9PlXmg1oEjZ57keqW6WBa5VT3M=;
 b=EWM0PWXSEwWu24T49VBQqIIKCejpFJv1tnVUBhYeVv8bVxvkt/JkhoP+3mtnz932RJ
 9PCHWqy+loB7d+eJ7EyJP0nabqYeZiR20ht4O3lfyyzcUuSdfC6EIj7lSZFgZOXvwD6s
 E2hu0rp3Gr/Vqlo1AMSUDz1VSxuA476Z2FeUF35zgJO5Uq3wenWz/mlePtF7ZN7OkFQa
 Bsf3KrCWLc7+zgxtVMPvVwa5lcfO5/o93qxlDUpN3/3cFAqLiV4TzHJ7ezJvPwOev3Bd
 DlCH67EDvJHg8OqL3qJEr7WNRNCVZIM8n2RYVkm3fFfJDdRCy4FhcHYfQnLMx2PjDYrM
 2nnA==
X-Gm-Message-State: AOJu0YxGFCrdbZELSkxG6zS9cr/9uk30Q4Aav6WPUrd6uJXgqWLV5IEC
 B1MiWo+IvsnfJ3kab66Y7d8+v+vxduJrWaD7SyQS2kBOYqkKTGDIMsH2EjItLozIFIKs5nN2MU3
 /Qew=
X-Gm-Gg: ASbGncv4feWqWibJ8+JJrGG+snF/VtiX0pf7fcpqCpQukQost8x57BJitVAxqaM3sod
 WBdGUmGS/So4xFACMl/3dR3Xc9O9ptquuvOY9IxUkZdfN1yOb6wT4HEB/0zg82KUnogDpTjhlez
 gq2twRQs34+5NXna1BzxZwbZ/QI0REk821jO+ll+dC5zZ5vaHaeP9Rk6TlG7ogDCilUfgNdstxY
 lbdWJs+nqC054VFyOoLCyzJW0zhHQWUuTdZx/DrTAch5IDhhrfpHcHF2/uaH+eAfflSbRK57cLg
 lSSURz3poj/k1XKeaKrWC2keOeiYMttB6f3n
X-Received: by 2002:a4a:ee82:0:b0:5f1:f897:1dcf with SMTP id
 006d021491bc7-5f20a076dd0mr10208525eaf.2.1733065815852; 
 Sun, 01 Dec 2024 07:10:15 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:10:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 59/67] target/arm: Rename helper_gvec_vcvt_[hf][su] with _rz
Date: Sun,  1 Dec 2024 09:05:58 -0600
Message-ID: <20241201150607.12812-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wkzOflQT3e/M

Emphasize that these functions use round-to-zero mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             | 8 ++++----
 target/arm/tcg/translate-neon.c | 8 ++++----
 target/arm/tcg/vec_helper.c     | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 04e422ab08..f2cfee40de 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -650,13 +650,13 @@ DEF_HELPER_FLAGS_4(gvec_touizs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_sf, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_uf, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_fs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_fu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_fs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_fu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_uh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_hs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(gvec_vcvt_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vcvt_rz_hu, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vcvt_rm_us, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 0821f10fad..cea400e1f5 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -1409,13 +1409,13 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
 
 DO_FP_2SH(VCVT_SF, gen_helper_gvec_vcvt_sf)
 DO_FP_2SH(VCVT_UF, gen_helper_gvec_vcvt_uf)
-DO_FP_2SH(VCVT_FS, gen_helper_gvec_vcvt_fs)
-DO_FP_2SH(VCVT_FU, gen_helper_gvec_vcvt_fu)
+DO_FP_2SH(VCVT_FS, gen_helper_gvec_vcvt_rz_fs)
+DO_FP_2SH(VCVT_FU, gen_helper_gvec_vcvt_rz_fu)
 
 DO_FP_2SH(VCVT_SH, gen_helper_gvec_vcvt_sh)
 DO_FP_2SH(VCVT_UH, gen_helper_gvec_vcvt_uh)
-DO_FP_2SH(VCVT_HS, gen_helper_gvec_vcvt_hs)
-DO_FP_2SH(VCVT_HU, gen_helper_gvec_vcvt_hu)
+DO_FP_2SH(VCVT_HS, gen_helper_gvec_vcvt_rz_hs)
+DO_FP_2SH(VCVT_HU, gen_helper_gvec_vcvt_rz_hu)
 
 static bool do_1reg_imm(DisasContext *s, arg_1reg_imm *a,
                         GVecGen2iFn *fn)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 60381258cf..282dba4bfd 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2507,12 +2507,12 @@ DO_3OP_PAIR(gvec_uminp_s, MIN, uint32_t, H4)
 
 DO_VCVT_FIXED(gvec_vcvt_sf, helper_vfp_sltos, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_uf, helper_vfp_ultos, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_fs, helper_vfp_tosls_round_to_zero, uint32_t)
-DO_VCVT_FIXED(gvec_vcvt_fu, helper_vfp_touls_round_to_zero, uint32_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_fs, helper_vfp_tosls_round_to_zero, uint32_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_fu, helper_vfp_touls_round_to_zero, uint32_t)
 DO_VCVT_FIXED(gvec_vcvt_sh, helper_vfp_shtoh, uint16_t)
 DO_VCVT_FIXED(gvec_vcvt_uh, helper_vfp_uhtoh, uint16_t)
-DO_VCVT_FIXED(gvec_vcvt_hs, helper_vfp_toshh_round_to_zero, uint16_t)
-DO_VCVT_FIXED(gvec_vcvt_hu, helper_vfp_touhh_round_to_zero, uint16_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_hs, helper_vfp_toshh_round_to_zero, uint16_t)
+DO_VCVT_FIXED(gvec_vcvt_rz_hu, helper_vfp_touhh_round_to_zero, uint16_t)
 
 #undef DO_VCVT_FIXED
 
-- 
2.43.0

