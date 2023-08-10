Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp366179ejc;
        Wed, 9 Aug 2023 19:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgTBxMvCBIdCBQwPHjEZ3nfeaobEasn1/VZkgW41LuK/PllSvayL/S9QFPTdtKoiDcm6XH
X-Received: by 2002:a05:6214:b84:b0:62f:f3dd:602a with SMTP id fe4-20020a0562140b8400b0062ff3dd602amr809832qvb.65.1691635015466;
        Wed, 09 Aug 2023 19:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691635015; cv=none;
        d=google.com; s=arc-20160816;
        b=vOR9XGFOIEL7MYAgYZ5ewtHArPMTBeeQ850ALNzU+QZnF4cqmh+hNaH3Uzra4KIYfA
         sFr2vuKpQVrpHTvfNPkCbtvsl5sMV5xDnC9B/V4rRWar/qipYo3UHKz3RxQIajMbxXys
         j6eNaZLaIYbZgqtXguubWGrp7DIqYxElIFs7plPiaD4KvAjAENrAo0L6SLS1mXdWLsAX
         uMVo04/wxZhy4ukDpBoDavpC/+bnC+lW/U629abAx+XI0siSdmAwnYNiYu86UBjbPhSU
         rq65iaxoTQEEYSp1w8w2dZoLQaS60dGYH9oxn214kGuG2Sx9iyE5DFBRZ/CGimE6jmNM
         +cog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=phrIw6b5pWNBBmVHR2P9mXRKZKLN/f9yT3V1nvx09pc=;
        fh=j4Z1An09Ve/stdydd/yoEYU5jCtTlZP/o+LZJGsiADc=;
        b=J7KnpuPOvG1uOUBJS6WOtbCKElRaEu7ymyhtRHmosh37veemHpH1pgiL2y609yjvuY
         6BiTKS3PSMQ5bXsJKlS73+qTTvL8E0trVcUJWG9hzMp8mLhecFfEB30Xjnzyt/z2dd+9
         2MHhBeiyBataaMY5FMHbxl4S43y1Q+qM2INyuRGH/Ct3PStPSm+wyEQcCOm7Hza2jlV5
         2FfdvNEwMPoIxxQWq5PZeEcXwa7QbD1c9Tu7Jfu6Y8EvSZCvmBouwsH7kHNfoIqUIeZX
         ZPXs5R7vb0OSOc2BjjnJJu7Rnsg6tPrEcex5AdGcG0DQ6G7w9yc68Y9S8tkzFePam649
         GdSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hetcGLST;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020a0ccd14000000b0063d0292b536si237299qvm.64.2023.08.09.19.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hetcGLST;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTvWp-0000zW-L6; Wed, 09 Aug 2023 22:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWj-0000uY-RH
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 22:35:53 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWi-0004x8-7U
 for qemu-devel@nongnu.org; Wed, 09 Aug 2023 22:35:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-686f38692b3so370698b3a.2
 for <qemu-devel@nongnu.org>; Wed, 09 Aug 2023 19:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634951; x=1692239751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=phrIw6b5pWNBBmVHR2P9mXRKZKLN/f9yT3V1nvx09pc=;
 b=hetcGLSTvMBODJofQGfMVBISegsvqZdiKKEbSfvqqqx+d99tfCCDuaJWnrsG3hV+gX
 HeX00d8gGHe9ieeT8E3SnzLZiy0K+JL/Vf3EN5EDq1i9CFp1PrEhJ4mVePQ9vO1g7tbZ
 herQk+zbXxrFUzSytvWYr3gFniGDMuDmXW9GFngAh3r5ExlIX7IiyEzofpDk4+ypzfkG
 KX43SBIB+cpGu/HC3yzMxaRaVi3mlnug36VLLig+Q2A0/ZwpQ4O0Q3l5uU5e7AY6RIBV
 PimncngeezMtCofNYYrpyqc49LtO1xjVFWkcLo7R5y/t1KpFpCsRx8Pmrkj6MbxU2VzH
 H8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634951; x=1692239751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=phrIw6b5pWNBBmVHR2P9mXRKZKLN/f9yT3V1nvx09pc=;
 b=AX2PWhf1ZTgUn9kSAckmH1NH+NXZnNCvlHfSG1XupyLA+n8YSU3xWhi7wcd1/93wAN
 5IP9RHb8K0K9q90ZPn5rFQs+7dzyBw11QbKQvu212g+jOD3tuVGWbwbgLSb/Lwosbpk8
 4DCM1aezieTV0fYFoYztANWibmoCnsiSD5E8yJNJ1SXCTJHZIaOqwk5vsgJgfFTAKxrV
 P2oCbtGeeYLtlFTVRmUASGvffTMIcwW3COFtfoh54MrbImw4pEhp6WUf+LXsohTcteM1
 yVPNGJR84uXi8FoIp/FkJp0kCWhHxgmkUmxDha3EMaGkO9P/3qmJryzPAoP6FKFo9GSX
 eeCw==
X-Gm-Message-State: AOJu0YymsuusrddBxeddiEUJ0uAztZcyPAwt1Tf+kTAdZUpPOXotY6FX
 ncoqnP+ZnHvlmVFuEtnH+KlqB0FFTMIP4kFz0ho=
X-Received: by 2002:a05:6a00:23d1:b0:687:520e:4b17 with SMTP id
 g17-20020a056a0023d100b00687520e4b17mr1382835pfc.8.1691634950943; 
 Wed, 09 Aug 2023 19:35:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 1/5] target/arm: Disable FEAT_TRF in neoverse-v1
Date: Wed,  9 Aug 2023 19:35:44 -0700
Message-Id: <20230810023548.412310-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810023548.412310-1-richard.henderson@linaro.org>
References: <20230810023548.412310-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UpcSUF8nSuhs

Self-hosted trace is out of scope for QEMU.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8019f00bc3..60e5f034d9 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -618,7 +618,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->dcz_blocksize = 4;
     cpu->id_aa64afr0 = 0x00000000;
     cpu->id_aa64afr1 = 0x00000000;
-    cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
+    cpu->isar.id_aa64dfr0  = 0x000000f210305519ull; /* w/o FEAT_TRF */
     cpu->isar.id_aa64dfr1 = 0x00000000;
     cpu->isar.id_aa64isar0 = 0x1011111110212120ull; /* with FEAT_RNG */
     cpu->isar.id_aa64isar1 = 0x0111000001211032ull;
@@ -628,7 +628,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->isar.id_aa64pfr0  = 0x1101110120111112ull; /* GIC filled in later */
     cpu->isar.id_aa64pfr1  = 0x0000000000000020ull;
     cpu->id_afr0       = 0x00000000;
-    cpu->isar.id_dfr0  = 0x15011099;
+    cpu->isar.id_dfr0  = 0x05011099; /* w/o FEAT_TRF */
     cpu->isar.id_isar0 = 0x02101110;
     cpu->isar.id_isar1 = 0x13112111;
     cpu->isar.id_isar2 = 0x21232042;
-- 
2.34.1

