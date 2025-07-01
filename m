Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056424dye;
        Tue, 1 Jul 2025 03:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMeIhd8mEr5DBbLHCEryEeMPyZk1td+L3zrA+esOGcNBuB4rqMgFs1IaGQquDBt6EyHkbXeBO4nuTEjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGuJLPOGdG6Gw/eSdURZEiGQ56D5FYjJwMLfWA4FIkfX/zo+kJb5bQ4v+bB23bqXQKRwSiu
X-Received: by 2002:a05:620a:1b8d:b0:7d4:635f:3e42 with SMTP id af79cd13be357-7d4635f4151mr599533385a.20.1751366026934;
        Tue, 01 Jul 2025 03:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366026; cv=none;
        d=google.com; s=arc-20240605;
        b=H5d0fY0y6qgMHexprZvhcnoaCCU5Bb/inFpxZc4x7XY9FBpt4WWvht06FUTqi5Mfo6
         0m79Azf1GWmlCO+UH5BSf2k64nD+QUM8bStlgKG3qV75SFQC/cWtCjBHmsvwEervD2Pp
         Ys1O1qAeXsV36d4sWjJax6RCR4K+03FiDL73rViB6COJ4IvLOpcn80nGLJ62xNHBePk5
         XVU4+uoQLGhVE+iDb1O9CFmw29u5l9dhkMCYVh0ON3xzfnyWOUVlIL/fN3r5jAZrbxby
         zJ0MtBaY4WthBTmNo791ayzyJ23PQyZNGkufeMmUw7k3twTQBd6dZ5xOjDAXZGMWLw2R
         qxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7aRIcodaoxwPOVqLMAiD3Xs6uLadGOPk1WBQF+3EBdA=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=fqjuFC932YuJqldoqeF18OI8ZLnSEzKCY0r0DOuMNL3b1TiIOda5dMHVc9mS1LrSb5
         IYbbtqpwx1zdz8FvhyAYaZAfS9J66Ax1PkTzGhyyeiTcHnl0g73vQe9YP6b8PYiSjdsz
         +Y+iBVjsBltB/hBNothR5Y7c2nLgX0Ndewni/TJ7tbiKnU2Tc0YAvgjsC8my9uCfbyiE
         g9QQ/JR7bwBduSxKerF5Og+af7ufF9hNJdyF2KDNWYncP95Psuc4X8Ll8faif1iVNiqB
         zH82VExpJ1T7OwD9FvsbYypUCRQdAa0QEeAbB6LdQrgjtEUUCoBjQ3vzvB7uL4kIOlFR
         zn+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5u+RIgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d443226de7si310633985a.251.2025.07.01.03.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C5u+RIgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWYJ2-0005au-Rv; Tue, 01 Jul 2025 06:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIu-0005PL-Rq; Tue, 01 Jul 2025 06:33:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIs-0002Ni-JU; Tue, 01 Jul 2025 06:33:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-23602481460so55691665ad.0; 
 Tue, 01 Jul 2025 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751366007; x=1751970807; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aRIcodaoxwPOVqLMAiD3Xs6uLadGOPk1WBQF+3EBdA=;
 b=C5u+RIgWcMaJUTSwBeneo74yAfQQzh+tOsFefx9jFakGXJwt8zQQ8s3hx5fgk4Wjw4
 yO5aal9jU257JNtXTJTKLuU7PHxyQybLRnFwpgBe0cWi+APWt7mBcyYaFQl7C1ybStBT
 +e+7A2FeJ4mqT3yZv4ItqcfXmAepA0AznxfuCZoi5mwGSYUiZmUwnQdUBtlx0VQX4lZh
 r885kfT3U00lULLTQZSV+JuuuoTMkul8gmUnJKC5x1TzVIwMcJsiRMgldQkTDb4WU9uO
 PbT9U9+OxYk34fCE/sUzwqjXdjHUnUf/XmQJLq3wdebj2LljTXmcpj8A2R2d/EyEKhPP
 hBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751366007; x=1751970807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aRIcodaoxwPOVqLMAiD3Xs6uLadGOPk1WBQF+3EBdA=;
 b=aSYu1vnwYgi4CwlqgCqfk4ZaXIIDLI/R93IlaAoL2dT16MmdXSB1ordI2LATL0roEc
 P0c58gOulKBejjAkW8xVYDaFMq77C4KulVSqF/14AiVtPHGp8kyZPo96R4MSSWKsKZbk
 O3fcbbzptKve1nqU4j2rL/zz56LngPyggo+2u3y1Lnsp+a/RKTly6Ox5yayU+QCyyI1U
 JpAG8mLYgViElN2xI+9wivsv0WhSjr7yo0DzRMprK+9q+l+3zopzJ09SDSijC5tZFUBP
 qL/Q9lgH1lZ6022a3d2SeWGMfviCiaKgHV2WZ8uYia05mQo3+xcy7Cf7N+W1Izu6Pjw/
 ju7A==
X-Gm-Message-State: AOJu0YxGbnpuvn9IxAVgJL5asnwes2lRM31JSjw22EXEo33YrqipA2Dj
 w5LXOI/pqwwrUl3FGNqfWn64yyZ/Uu/FAG/2iTL40fgGfOR4N0Bp89Xk4/WyY2Dt9pc=
X-Gm-Gg: ASbGncv9H+09ltNLpkKFZuL/MCDd34HWSwPGS5uWSU228cXxoTDxjQTaPKeSwflZJZF
 kRo+ll1dhAHM026+2aMeEc7gPnOMdIlCf8GC4Oh5pK0xQvAc8vjm2R1edHwiC1YLgGErfAJgj2M
 K+BlsIGaCyw77sTE5iAqeRi+a+8WI/lD96lSUzmr+vBS3NtlX4kI7mrtikwVA3dlUylQsq3PKGl
 K05kUnwp8+64hoCgNus4J2N7EAQH0zkOrTNuoe1ME/9G9eAL3tFdsftKU71WMdDuhUc3MFv6w7J
 mpY3vFz96YzCB5yovfb6SccweHMg13UTlEtcyck7reBxeSal4vRUqO7c8qc6QlLSvDKj+DpEN2l
 IPlyEOGI38/nJTtiSC5y5f9T3DEMaKibTvGgIrt9J/hA=
X-Received: by 2002:a17:903:1a67:b0:236:7333:f183 with SMTP id
 d9443c01a7336-23ac3afd8e4mr245773125ad.19.1751366007307; 
 Tue, 01 Jul 2025 03:33:27 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23acb2f1c40sm104476955ad.67.2025.07.01.03.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:33:26 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 09/12] target/arm: Fix VLD2 helper load alignment checks
Date: Tue,  1 Jul 2025 20:01:56 +0930
Message-ID: <20250701103159.62661-10-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: jw8ATPYqjkY7

This patch adds alignment checks in the load operations in the VLD2
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 2d2936abde..9e8ea04074 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -513,13 +513,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint8_t *qd;                                                    \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 2;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             for (e = 0; e < 4; e++, data >>= 8) {                       \
                 qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + (e & 1));    \
                 qd[H1(off[beat] + (e >> 1))] = data;                    \
@@ -537,13 +539,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         uint32_t addr, data;                                            \
         int e;                                                          \
         uint16_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat] * 4;                                \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             for (e = 0; e < 2; e++, data >>= 16) {                      \
                 qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + e);         \
                 qd[H2(off[beat])] = data;                               \
@@ -560,13 +564,15 @@ DO_VLD4W(vld43w, 6, 7, 8, 9)
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
                 continue;                                               \
             }                                                           \
             addr = base + off[beat];                                    \
-            data = cpu_ldl_le_data_ra(env, addr, GETPC());              \
+            data = cpu_ldl_mmu(env, addr, oi, GETPC());                 \
             qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + (beat & 1));    \
             qd[H4(off[beat] >> 3)] = data;                              \
         }                                                               \
-- 
2.48.1

