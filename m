Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2442796njb;
        Tue, 30 Jul 2024 09:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUzdd0RpYtQipaWV8SHg52DknXXtqxRznqClP3d6nR0yEcxJhKElqCWStBfUR8Cb5gn3zzWRQKdRDuZA5TpIY/Y3mPUZBB
X-Google-Smtp-Source: AGHT+IEBl8pmjg4/z6eAHj4iY+gX2SkSXBYmnazGRqlLGqHIatA7bEgnUnA149+8ItWWGVflFmAR
X-Received: by 2002:a05:6214:4110:b0:6b9:6b09:f845 with SMTP id 6a1803df08f44-6bb55a0f510mr106748676d6.31.1722355494499;
        Tue, 30 Jul 2024 09:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722355494; cv=none;
        d=google.com; s=arc-20160816;
        b=OynRPKYqg4JEBLOAF8zat8Hx4Rd3/oebJ4CStjxi4bX0ygmOI45p5u0wOvlITP/y5p
         4yrANCa8UoYXvAH8JaKthfW9xurSAwj3Afvpo3C7y222rT4xfzbtgiFF78cj7R0ad52x
         JjvRH8pCYrapwxTXlhp+7EdIGQqcx1+d7LOY9h9oRHB+wG3G/hrZ8m5Vg25Kr19C4sTw
         pzHbZmfkvCRfI8XGU5vZn/BGS14sC4I+CBWt2aagcVbdXkoW3XuCf157OYlfW/xb39ct
         AKQT/VVhtJq/2J03FO/bpeH33Y2SLQxTCRV94rYFANEJyaCMJlVIGktdzxx4M1hDmCNz
         pkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YvH6WF9jz8JWZCJ6bAYBpoQtH4MHX55fT9yLfRYRxQ0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VBCaGxo7b5n8bmggrmn9gdedBxIYTmoSsTcKmoJ3k7OKLbei/YEfX4ThtN2aK5KPZ7
         0DnAJGmUDesv2huyYFMjb6SewqQhsyrqSNouoeKCI63NU/bDXGoMwcWBRFY+EorLF2rv
         EOOvVpJISuPSPmM5vMoh6aj9DU38ihR8MwazU54tpP6FRwuKRimpVlqZa+BOA8EZaCPO
         IqcaUtCqNbZP5s7qwf2qzkF8ZKZWlIDUHfFzzBGHc8tJIRRGg16ik2R55q9K82SHa/25
         GwVwF6yXmBBZq5ZUgzsMzQPyG/1VkXNtKyufFOrjtEDPvdIGH2YTgnxmFa1L7Vgf2+hB
         O0xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBoJxOSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8cc22dsi122618716d6.105.2024.07.30.09.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 09:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBoJxOSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYpJu-000418-EV; Tue, 30 Jul 2024 12:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJt-0003t3-4C
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJp-0000IC-Gr
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42819654737so23451855e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 09:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722355400; x=1722960200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YvH6WF9jz8JWZCJ6bAYBpoQtH4MHX55fT9yLfRYRxQ0=;
 b=tBoJxOSjlchtr6RiHaQrtYT5kCfBX190aoHaeTmTRf0jMySmOIBHiqZHXzaV93CYvc
 O0UpFSuVCaEQ4ZV3fLFDNx2Hmx1a+byyrUSSdqzuCUS8uIoxIDU2utEAAq7934qWDY24
 Uyi93+m4m4qhffoAvmjZWw96EFest6GuYFlSYVzfWxRfMHZXQ/D+zkCYSoFx6tSmEVyx
 VNuhnglhdlp6cBKjE8iwW36EL7K1WPs+/6XowHXr92MaxKtg8YEpCsQbQhnzVvS2P93e
 99W4FQIKU8Yxf9ozBoy1ml7eKOIF37jImK0jWhD2eE+mVioKsRZH7xa4l1eYvBbmrxtA
 gjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722355400; x=1722960200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvH6WF9jz8JWZCJ6bAYBpoQtH4MHX55fT9yLfRYRxQ0=;
 b=P/ZwaDDd4G22XPyT/KQulOg8wjc+v1EnugH8YsaZvGB3NajA0RiNVRDIHEqVj0x0aa
 OZzESoWXFjwqJOOlnxPy5Jt1D1QOiYkwnsw9uYkXIXoSN++tpG7ysUTbFrm8FWL/RNeE
 Lw6V9TuJLMJ0FhegH4ziMA5bvdfGcsl3oq3HwVl3NGHtJKb2+KMho9JEwUzalNOMLhHS
 fLZg3JastJsfYkT3eWuZtQtfi2LCy7XYSYzUIuUAhL98rbwQOU9Kw+vXvjNyIwxxFE2W
 //dViGk2iX2TCXKiqEmWzyXSxU1yIgMkATxqj5ueT/Z6Zdyprd3aTAaM4aJh9KPu+z1i
 psdw==
X-Gm-Message-State: AOJu0YwYgPLzFPb3sY6hVQ4Msd38h7cjqUDMWebqwDzzsohmBIEUEHkY
 d9Q49VtZzmrnYWXtXkGIXdciDV1XLbr6E63CY22NFxw0+hcv67wLYrvikb1eX/OB3DXKFQg5m8t
 4
X-Received: by 2002:a5d:45cb:0:b0:368:4634:c419 with SMTP id
 ffacd0b85a97d-36b5d09e40emr6824079f8f.58.1722355399934; 
 Tue, 30 Jul 2024 09:03:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3685810csm15001676f8f.71.2024.07.30.09.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 09:03:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/arm: Enable FEAT_EBF16 in the "max" CPU
Date: Tue, 30 Jul 2024 17:03:06 +0100
Message-Id: <20240730160306.2959745-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730160306.2959745-1-peter.maydell@linaro.org>
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: sbEfynL4zErN

Now that we've implemented the required behaviour for FEAT_EBF16, we
can enable it for the "max" CPU type, list it in our documentation,
and delete a TODO comment about it being missing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst  | 1 +
 target/arm/tcg/cpu64.c         | 4 ++--
 target/arm/tcg/translate-sme.c | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3ab6e726679..35f52a54b1c 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -45,6 +45,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
+- FEAT_EBF16 (AArch64 Extended BFloat16 instructions)
 - FEAT_ECV (Enhanced Counter Virtualization)
 - FEAT_EL0 (Support for execution at EL0)
 - FEAT_EL1 (Support for execution at EL1)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fe232eb3069..79258a7c928 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1160,7 +1160,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);  /* FEAT_FRINTTS */
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
-    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 2);     /* FEAT_BF16, FEAT_EBF16 */
     t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
@@ -1244,7 +1244,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
     t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
     t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);  /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 2);  /* FEAT_BF16, FEAT_EBF16 */
     t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
     t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
     t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index bcb502feb05..760c200e622 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -354,7 +354,6 @@ TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a,
 TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
            MO_64, FPST_FPCR, gen_helper_sme_fmopa_d)
 
-/* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod_env, a, MO_32, gen_helper_sme_bfmopa)
 
 TRANS_FEAT(SMOPA_s, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_smopa_s)
-- 
2.34.1

