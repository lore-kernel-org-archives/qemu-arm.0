Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3801283dye;
        Wed, 2 Jul 2025 06:11:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUjhhFBb5k0QtUKtMKen3osgfyKNkNQ/44zVT0NNOxGlXbVrar2A7gqRm4OszRs4dIn0p2YSM4xsj0zA==@linaro.org
X-Google-Smtp-Source: AGHT+IHTOqxjz3ccjncqKXvpAm90dMxc3G8kEu9iIieqf9PNiDvxD1IQ0EOwOHskkqolWGP8EDOC
X-Received: by 2002:a17:907:1c1d:b0:ade:4f2:9077 with SMTP id a640c23a62f3a-ae3c383f6famr259817766b.5.1751461882941;
        Wed, 02 Jul 2025 06:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461882; cv=none;
        d=google.com; s=arc-20240605;
        b=D+8L/8nxNtq9bfIm4YX4ZuoTc4BIJExOjdSe1SjIT4GQs2DLDr5A3X46jUJInpTG5g
         uhjxKTF82GQsTVXq2csu1MF2AyRikR3dM48u9ltTT18Pk8xRtI0fQvabsy9VC7A1GjSQ
         2IpMsuLqlodfZcck68dFZDlDSVR5kqheE02tpvwNpgr5g3hm021l6RBKo6Qmz+U6asym
         1Xc69lX8rsjn01ASTzRjjOlazk6Fs2bJvNuchYT34eGhHXNewTgKEnwEM9aY8ncNV3oD
         nLqvcxyiVm03bqj/1xfBBl5JQo0TuW8tLaPlU/iSuue7IM62SUmXl5mVhDJk7WGadagT
         z8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yHqvh21OXE4vjukTTqMZ2JA/l8VM2GH0ZoSM4ub9qlg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=CZBffMNHiKywp3LJSvTRXfvs+36/8gI2mzIOLrtAS5HaCMKdGmqjOI5Q4+v6rQ00jA
         gozR20E3Rp197NOsyr5r4OF972lsoJ+Vu5sQCWOXaYHL3x3Le2saGZyC8O2Fg/aXpHYP
         yA+z0rS5ghBkIYjknvJAhsP0vBIPENqFvv1SqAFcrTJ3Klg794HHB7CnmJbKBa3aVwPB
         JUumg07iVQbdQrNk9imXte0UK9PqNYvOoYCTUIF0pKYNs7dyOiBHqbX93l1po0bL3La9
         zz2kKEn9CBF/A1tw02zETSLGe6B8kyi0+9835ampo31LIxocOaQ5LPXJjRgnURU1UBwh
         ij2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2hTW7dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a640c23a62f3a-ae353bc9da8si957175966b.321.2025.07.02.06.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X2hTW7dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwpT-0004l3-1j; Wed, 02 Jul 2025 08:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwkC-0004vS-8f
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:24 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjm-0002HY-I6
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:20 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-2ebb468cbb4so3871100fac.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459933; x=1752064733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHqvh21OXE4vjukTTqMZ2JA/l8VM2GH0ZoSM4ub9qlg=;
 b=X2hTW7dXzbrtNikYliWhHL1RVGX0NJ6dnxu5YjogiDpm/Sg4RdUi4RzaIV1lBXRjqn
 fffJ4LzITBYGYgEDUD4mo6TTHdg1/oYWC4jaAAavApgawJVVZZ8bKSstN8HA1fauwHwx
 fQ8ZzcV6ZzSREbpRcaKhK1tL4SawS2oPZl0XoCotpH6Jb9f7+caVoeyFk9hrI0N9pcXY
 5rpUOYoQRKyuWNng6hqfdRBN+xtc+5gvqeD5rJdXphUq2CNZG4rmcYjJInzFuAgCSVlS
 6/G0ObzKVgDBjej6qedSeAVQeumHQ04BBkSY/gh+HjMIIgWxVnQLQh2fqw2GtHhliekt
 4Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459933; x=1752064733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHqvh21OXE4vjukTTqMZ2JA/l8VM2GH0ZoSM4ub9qlg=;
 b=IaRBBYY1BAhCQWMEJbfNkBuc4+ERKOn0tORCFFeoDtjKaWj0XPq6/wMMNePGvIJ9e2
 1If7tjqgPZDR8yegZYAauwr/qRVNLYlY0Ds7vyMmCEPeQvSFCnRS+3YIct8qm4Dout1u
 8YSJWJEisDhEaNJvnSftiqvLoePe3xJFaR5Rnsc6q5yNdvIMgDoL5clgEDH/dlZDL6Pm
 u+C2fcrDAky+ncOMKJTk/bE8Q/twAGZSeWc2ZkTL7loWXnqoYgdIROiIt3HnsSht++Gq
 ExGb+nB6auExznx1ewLkfwXwFE5lV5CzOhdLizk7VsBlYLkX+o8L2bQXRHW2OB5NPQPa
 B7iQ==
X-Gm-Message-State: AOJu0Ywj1sYJG1Xqj/LutptZXkPnZouQDV+HH0gU8N3NhtOZxkcueSrg
 ADua1CGq4NNbv6hjLDgnT0Gw1bu2p6w6Vtq+56OzNooAw5ygTTehuno7q0zFLPRlSl93k114R2i
 QM6IQr+A=
X-Gm-Gg: ASbGncuCTYjDleUicS6m72BejRjgCGlkR8gDHVjZPuSFMW6ssCqlXaGSF0foawdrNCi
 003uA706WxQTHFSCzcoKT7PYTq4k4/hiaIAXlv0ELcnw6HQ/Q41hVAlMViRRKtwuPbyOZDXsjOX
 /LYYHm0pbaXp0W4ktDPPbP1VfM28XxbJbretPOSzRz8mrf0LX23lZPAzaKRImAV9tmBE/BvRkFA
 1m0EPRip+OB91vxEQ/pt1AzhfSh3KCXGBD6XobiHYkucqoxaDW7GXfrGY5IeuM8LKsDbsIv3ZwP
 Q2Kb3lNl1AjFInl5gzo/rICaB3Y4jI36kZFtRQ4724hf3tvZqaqPvSDW+Cg2Q5DLyiU7Vz9MXoE
 LfjTw
X-Received: by 2002:a05:6870:d03:b0:2ea:87d7:5a35 with SMTP id
 586e51a60fabf-2f5a8cdd633mr1819269fac.36.1751459932729; 
 Wed, 02 Jul 2025 05:38:52 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 78/97] target/arm: Implement EXTQ for SME2p1/SVE2p1
Date: Wed,  2 Jul 2025 06:33:51 -0600
Message-ID: <20250702123410.761208-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NnBb5gdw3tMK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 49 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e33b2eb2a4..a918da31fe 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2202,6 +2202,55 @@ static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
 TRANS_FEAT(EXT, aa64_sve, do_EXT, a->rd, a->rn, a->rm, a->imm)
 TRANS_FEAT(EXT_sve2, aa64_sve2, do_EXT, a->rd, a->rn, (a->rn + 1) % 32, a->imm)
 
+static bool trans_EXTQ(DisasContext *s, arg_EXTQ *a)
+{
+    unsigned vl, dofs, sofs0, sofs1, sofs2, imm;
+
+    if (!dc_isar_feature(aa64_sme2p1_or_sve2p1, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    imm = a->imm;
+    if (imm == 0) {
+        /* So far we never optimize Zdn with MOVPRFX, so zd = zn is a nop. */
+        return true;
+    }
+
+    vl = vec_full_reg_size(s);
+    dofs = vec_full_reg_offset(s, a->rd);
+    sofs2 = vec_full_reg_offset(s, a->rn);
+
+    if (imm & 8) {
+        sofs0 = dofs + 8;
+        sofs1 = sofs2;
+        sofs2 += 8;
+    } else {
+        sofs0 = dofs;
+        sofs1 = dofs + 8;
+    }
+    imm = (imm & 7) << 3;
+
+    for (unsigned i = 0; i < vl; i += 16) {
+        TCGv_i64 s0 = tcg_temp_new_i64();
+        TCGv_i64 s1 = tcg_temp_new_i64();
+        TCGv_i64 s2 = tcg_temp_new_i64();
+
+        tcg_gen_ld_i64(s0, tcg_env, sofs0 + i);
+        tcg_gen_ld_i64(s1, tcg_env, sofs1 + i);
+        tcg_gen_ld_i64(s2, tcg_env, sofs2 + i);
+
+        tcg_gen_extract2_i64(s0, s0, s1, imm);
+        tcg_gen_extract2_i64(s1, s1, s2, imm);
+
+        tcg_gen_st_i64(s0, tcg_env, dofs + i);
+        tcg_gen_st_i64(s1, tcg_env, dofs + i + 8);
+    }
+    return true;
+}
+
 /*
  *** SVE Permute - Unpredicated Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 2650e00f80..af4fb966bf 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -583,6 +583,8 @@ DUPQ            00000101 001 imm:3   10 001001 rn:5 rd:5        &rri_esz esz=1
 DUPQ            00000101 001 imm:2  100 001001 rn:5 rd:5        &rri_esz esz=2
 DUPQ            00000101 001 imm:1 1000 001001 rn:5 rd:5        &rri_esz esz=3
 
+EXTQ            00000101 0110 imm:4 001001 rn:5 rd:5            &rri
+
 # SVE insert SIMD&FP scalar register
 INSR_f          00000101 .. 1 10100 001110 ..... .....          @rdn_rm
 
-- 
2.43.0

