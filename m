Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3790543dye;
        Wed, 2 Jul 2025 05:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpw+XMhlwj/2jCAdPWMcHlmH7qlwdUAxEHoitBtRRi1EjMpaboGjpFSWaHiJpHcoOYWMCVRlrGENXg0A==@linaro.org
X-Google-Smtp-Source: AGHT+IG4q8DPJxBfvScG03+MBa6UuSHXGrmGeG4rHRdrtUA7NfysbgrGV2b4ubz+/psnSHjRG5GK
X-Received: by 2002:a05:620a:a81b:b0:7d5:cb64:193b with SMTP id af79cd13be357-7d5cb641b28mr150627685a.21.1751461109864;
        Wed, 02 Jul 2025 05:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461109; cv=none;
        d=google.com; s=arc-20240605;
        b=gnxWchSJNfY0yzmSmKbBiC3rtAHuyrrFA3M4R8Alxt0az4JVO0pD7CSfP+FimO5k8d
         N5gZjX2R0EGzwEuZoaZvhvLvz/lDGP1A2CfhUz0gfIOmDfVkqrv6vUfmqeZp9nRvHK6J
         5zXQzU3eld/GPQtb238+hgiqNtfKyvNB+5fyYS6CYObtZzgLPk62qe55Ygmvkv/EJYHc
         7Cb8HBk81sdp3+7E/VlgZN/YANoPuYhrcPWz+IFN01TDjw3Ycxl4vO4cE0m5ei5gCyeg
         n5A9Y8Su9r38Gv3iaj91E374C7CHAWIQIUpMdEawF4ClD2XVTu87CBSUgkEHUfgpDe3N
         ntVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D+lupzC8Nu+x6L4j8uN4IOKjMC3Hrdrd0rgOJMj14KY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=YjV7JtE88aYcBTCqiXC42wzCA3bSsbqGBr7BoW+l/TIJ0fouetps96/lSJeyVUR/kP
         ZLXsyD76tOiM/utThDF27vRkKZQ8FDjw7jOwWOixKWTJIlS5NJNF57VAeyf4qJ2IMnNd
         JinxNnSEpL+5hTXVht3rNnczkuSvxJ593mgGBR2m7pL82hNPqJUcoDcvpUbkL9WvgBej
         JRANRF1nBuZhcr5OJPvTpyooOmufRDdEnzjecwU0YvGn3EuUoFd3TBrzvjFDVGmWiNme
         KA2DKWFS7AlQrJPpAbx22NJI/rp/IS1nZV/Pwxp+BYx5QGQ5V6LS6vfqYTn2e4E6VTDr
         c4gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FkHAhu2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432397cesi1236638385a.315.2025.07.02.05.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FkHAhu2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwhe-00025o-71; Wed, 02 Jul 2025 08:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwgH-0008EC-4K
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:17 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg2-00017l-0L
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:16 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2efbbf5a754so3005157fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459694; x=1752064494; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D+lupzC8Nu+x6L4j8uN4IOKjMC3Hrdrd0rgOJMj14KY=;
 b=FkHAhu2hr7awrIX8lrqveKNCHUEhVtWKgiVco6/uPf1mG6X96hN/pdRJ6WIvYR0Nwf
 ORIYIhRi9pQV2wA0HniO8bVnSnfV/zVSnsFGi7AaZ08q4ZBZSgIF2q/R51rqyC3zhNtm
 Zu4U2lERib1sufbDPNRvO7bhiipUqtbYkd1IBP07C8j8LjIQfUkyceRr52f8k7FZvEAr
 eC+pk4I7R/irkqFEhwvOb1V6wMFGUoaN0DR/7Gsi+aiAS4ENKF/TEvdiGZRJp9MEEsDh
 QLffhAjIoecZPs4jxgb5CsCxF88C6yuP9gphByfR9xGzmC9qWsfp2rya5EogmO7bkYy6
 DEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459694; x=1752064494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D+lupzC8Nu+x6L4j8uN4IOKjMC3Hrdrd0rgOJMj14KY=;
 b=FhpUaWnHb1pSKhDXNxWvrOvhZtmoR8XKSC2OqvwbHxiMPSBZsrCX21OHWf0/ZC91vV
 KkaDvjvTxAjttJLAuE1MBT4Fyw469dfXVSwPsIq5KsQGnjHtydgF2rstTa/67co3YpNT
 Y4Hm9hCpV6St3Ov7hgEWkZfKWKa5lRGYSX+D7JYmfywxP7u882p1yH6ecUB26OdMdu6I
 n8oPC/1+Hv/r48jxk56wOowW4+LVOvfTPrI83gECN+Ctcyp+3WC8LAMZd5LDqynjJ+qh
 31rsc1E0M0/kbYd5J+BADkTHHtCqwDvK265w8GguHYZ2EmA9Txen4IfLJsblxkEVqkHI
 rP/Q==
X-Gm-Message-State: AOJu0YxoEVdXNQXy5ESeRxkF8DMiexONVth05Q99F73rq2VKiox2EbEC
 t2tdV9+j4pENpqlDnoleMOmf+y9589tfNWEwcooN/6l/GTKCI90y/qWnJTosTAMXOks=
X-Gm-Gg: ASbGncss1/U+Bv4Qe7UcILc9scwI8rslwe38SHTtqLFusmTWpZw3xqJOmdXmfqRdiAB
 tsdvMdjgdNY69vXqGqmQ5lb9ALkmxhH3Qn6b1VfHdv/YuBvlgC1Nbz0x10koH0x8Xn/MXF+JkBy
 bvOSdHlpElVSb3EIhlotLidpy16dbHlGQSG7KkivgLiRZY972sXTVRvdxF9ZgGO4wlSOrunak5S
 R0YHgYB2fJbXr7UO1Rhb/FTwYsJQZIKrdVJzhJ2u+dla5k604RCxxGbPxtLQV5SWPbgqP6ezAoy
 qlOPXDGkFvjUFQCgAk+Q2zQ/hMw0ktKwR8BEAYcpMvkB5LnlUJW1oLh2c/UtKpZfqGdGCew7orl
 w8fW7
X-Received: by 2002:a05:6870:8091:b0:2d5:2191:c8b3 with SMTP id
 586e51a60fabf-2f5c7cc9cf0mr2245013fac.29.1751459693588; 
 Wed, 02 Jul 2025 05:34:53 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 33/97] target/arm: Tighten USDOT (vectors) decode
Date: Wed,  2 Jul 2025 06:33:06 -0600
Message-ID: <20250702123410.761208-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
X-TUID: rmg5564dtciW

Rename to USDOT_zzzz_4s and force size=2 during decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 4 ++--
 target/arm/tcg/sve.decode      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 56353b3bb4..c82a0f771d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7151,8 +7151,8 @@ static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
 TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-TRANS_FEAT(USDOT_zzzz, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
-           a->esz == 2 ? gen_helper_gvec_usdot_4b : NULL, a, 0)
+TRANS_FEAT(USDOT_zzzz_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+           gen_helper_gvec_usdot_4b, a, 0)
 
 TRANS_FEAT_NONSTREAMING(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
                         gen_helper_crypto_aesmc, a->rd, a->rd, 0)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 51847ea56e..401c025852 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1599,7 +1599,7 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
 ## SVE mixed sign dot product
 
-USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+USDOT_zzzz_4s   01000100 10 0 ..... 011 110 ..... .....  @rda_rn_rm_ex esz=2
 
 ### SVE2 floating point matrix multiply accumulate
 BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=1
-- 
2.43.0

