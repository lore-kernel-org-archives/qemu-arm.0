Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp788589ejb;
        Thu, 25 May 2023 16:28:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Sn/ZMdxYJ4JILry1xKXPuleQPU879b5sFVExeopkY/Xj+SnmLFqPtizkbzFgo2Y0KUQRa
X-Received: by 2002:a05:6214:2503:b0:625:950f:2d5c with SMTP id gf3-20020a056214250300b00625950f2d5cmr458217qvb.10.1685057322601;
        Thu, 25 May 2023 16:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685057322; cv=none;
        d=google.com; s=arc-20160816;
        b=gAoG8RgByftX9vkENKXGKmYsyW7KvX2kVjU6AQusEol/sOsTRVMas+6z3iHMl8tkeV
         652fceNE17EwRQUrrUosiAWf6PXSJvyMzACehUuGApWBfIZgB5h+hjhWjiUUsNqcGVEU
         nRKoxn71ZbjhTwSoqwR9aMAcM3d5qRt46EAXxevC3wrS2Hj6Xn/cO45v+bwaMotd6kiN
         anOjmfCZoLqZQtc4MOjYHbkaIqV4xbjbQqbQPHvwfVJFCgEr6eHT0454nKdZZ/6lMCGm
         oTq9aPFDC5IRp//o//vUlYbq+dJU1JZyB/IT5wd/3kNlm3p4vMOFUeKgkenjyVFC1EBJ
         5Y7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QJBfhL5s/JujOKO92cVuqA077g93rVli8DiADyiaM+o=;
        b=qR9TX/FYzKJey9yvgmWSArl/rzice+s09SV5PmqsgKhhaoCkAQ9095R4kEZH9Rrb/R
         zrRJ0uHP78EtWWSId/4kz3TRLqseZ4J05lMKVuy2wm84a/4ZwjYxWcsP1kPHIdzDJzBk
         8hQ+X1l973ISJy4Igk8gdEwKNjSExe+yQRnzmuwt0a/NqyVTjvRt6OYCD/0N/tTUkSfC
         1pDSE32ewDz/GCp7Jaz/VRIWadMMmCjwTOO/47W3GP3VCeOEEPv7KRYIyYiA7G2brSLz
         GKn83g98XK6fuSplbk6+oFKoB5sC01T8aDMIESBKfoREtO02ghK06ce20m0eg+lAPRRJ
         JllA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5hvo23g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020a05621419c200b00621257f084csi949744qvc.156.2023.05.25.16.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 16:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5hvo23g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2KLl-00061p-Fg; Thu, 25 May 2023 19:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLe-0005vB-Ba
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2KLO-0005lr-M4
 for qemu-arm@nongnu.org; Thu, 25 May 2023 19:26:22 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so280616b3a.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685057164; x=1687649164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJBfhL5s/JujOKO92cVuqA077g93rVli8DiADyiaM+o=;
 b=A5hvo23gwC8j+XKAUw2mNHEBSYX+NlpEgOv6/2UzF82T7wc6+/iPrcpetNllUrS4hs
 Na5TX/jjAobW1W5F8l5XKWRyKfUisbP4LI3GKQ5AX/tS/HaeBZQmoNRK6WYcJsnlDC6n
 d+Wddaiue+RdosErOmzDA/gNYkq2t0n+a/fIiZmoED0ML81NeKHcbCnjaQEDgm6wsZok
 ygXE/yPyTocEu7Cy/RegdyczI1S7crDdlRO6II/5/3K+ZFn+otSXcOlxhpz1dauJBroy
 4/yFCIjmyclkWySVGLnobllIi51nIwn9jAYWlTJWxeM/q8sG/izfM+EEoPZhTW23DvXn
 rXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685057164; x=1687649164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJBfhL5s/JujOKO92cVuqA077g93rVli8DiADyiaM+o=;
 b=Jd1ZjQFarJY9x3IlH/uudACB7DCFF/tJbHvWhjO4FF+lQhTiap2eo6BJZUka1IUZLh
 nBaXmfPwgd1J18OWDY20h3PwYrRhLKOrPOuzIF6tzB4s6L91wnArUw49/G316gHrARoL
 bLZD/SFC/kSYgI4uyv0GVTAriy0q8+PBjoj41qpth2BvVHV8OoAJ2GBVJ4C6UK/JWnu+
 +jF+bu9OS798yFejIOd9SvKhUEuVWGiED9smmjOkVV0Pb/E9RNHKKojIXm3RgPLl86zk
 /z9mvWt1xiYfXp5Z9MLjpjUHHQe2a64rQZNR+iwDt+lBiJShjAs8OtfxoARaM0q6Nu+M
 7Gkw==
X-Gm-Message-State: AC+VfDwOEhQ3PwAWrjV/q1PModj61xa90sDdpKhUMuwQ3ly5NX+G8dqP
 VMGuYI5z/7d4u92KeCXP6uZqhw==
X-Received: by 2002:a05:6a20:8f14:b0:10b:27d0:70cc with SMTP id
 b20-20020a056a208f1400b0010b27d070ccmr21617096pzk.20.1685057164437; 
 Thu, 25 May 2023 16:26:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a170902ea0f00b0019e60c645b1sm1885036plg.305.2023.05.25.16.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 16:26:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/20] target/arm: Use tcg_gen_qemu_st_i128 for STZG, STZ2G
Date: Thu, 25 May 2023 16:25:44 -0700
Message-Id: <20230525232558.1758967-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525232558.1758967-1-richard.henderson@linaro.org>
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /t8pAqTZtt+U

This fixes a bug in that these two insns should have been using atomic
16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6bb68618a0..51f9d227e7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4070,15 +4070,18 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
 
     if (is_zero) {
         TCGv_i64 clean_addr = clean_data_tbi(s, addr);
-        TCGv_i64 tcg_zero = tcg_constant_i64(0);
+        TCGv_i64 zero64 = tcg_constant_i64(0);
+        TCGv_i128 zero128 = tcg_temp_new_i128();
         int mem_index = get_mem_index(s);
-        int i, n = (1 + is_pair) << LOG2_TAG_GRANULE;
+        MemOp mop = finalize_memop(s, MO_128 | MO_ALIGN);
 
-        tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index,
-                            MO_UQ | MO_ALIGN_16);
-        for (i = 8; i < n; i += 8) {
-            tcg_gen_addi_i64(clean_addr, clean_addr, 8);
-            tcg_gen_qemu_st_i64(tcg_zero, clean_addr, mem_index, MO_UQ);
+        tcg_gen_concat_i64_i128(zero128, zero64, zero64);
+
+        /* This is 1 or 2 atomic 16-byte operations. */
+        tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
+        if (is_pair) {
+            tcg_gen_addi_i64(clean_addr, clean_addr, 16);
+            tcg_gen_qemu_st_i128(zero128, clean_addr, mem_index, mop);
         }
     }
 
-- 
2.34.1

