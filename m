Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1258164dyc;
        Fri, 4 Jul 2025 07:35:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAabCp6yElJEds0rQJO+ycPhV5JPb2OvcB73TEyzjwOCRfoME6L+7dgqDXTLZ1a4Tm1PDN2KDFjcrBcw==@linaro.org
X-Google-Smtp-Source: AGHT+IEfXVz5eQoymtMtK3tQUh60mYVawgUAPIoVhH9XXv9JTqV/bVbrdBxr8uRPpH9VMmHvguMJ
X-Received: by 2002:a05:620a:40c9:b0:7d3:f0a3:d8cc with SMTP id af79cd13be357-7d5df169b32mr250093485a.45.1751639748614;
        Fri, 04 Jul 2025 07:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639748; cv=none;
        d=google.com; s=arc-20240605;
        b=XdGrzWDpeqx09gqnHioMOgnnJgCf2peGt+Agyk4akILxxIYmOqo3i/fQJOjTVIG7ZI
         50HY7e3RSCK1Qw3IU2FUZ4PUr1ON2L0sGapXoSgGfgpxnviq+vUxDfzLhualhPJdr5Ax
         1n0x6UnKBn/y6RG6sik+v5LIAlHBlccPDSZT0TxFyaDA5wpVP1pnSFIyzecnldYCYvLS
         lYTE4NurR6EdMjMCHpPwxiOg6j01IALmkSkX2U3nOd/JC7fUfwztLU0G5Khd3m1tNFt6
         hik/rKTst+f/UqnJFy442Fd5rMHWhTXXhhmWTd/8iSaqi6xsedCXbekx/z5oXkQz5mKV
         FgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EPqD2WiuW/V5KwVpgPbT8/RYmpheRb4cRCRm2q9oZgY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=i9KEXOeLP0KptM4LfCHuuw7KKTdP46LblxNuMzwogpXwztciXdNiHHk/1O701dglxh
         SxdLI3jITvwbJgiehvAZQZVkRhP1nlAVFXqfxiTBnEoN5mHes8TUONSlgtDl6oUWkg+l
         ItrtY8x5iDk5o9zK+pj270Xy3JP8WQGCqzXWb5Q2oEJ59+IbshuLKvLLTQTHZf761QmD
         8xN7v79YemxHutb04O1Y5pFzuP9Bf9YXwfNS35mNa0bFlM3nIQgT45Y0TEZBtcEMPPsF
         4zoG0tB1fZRQyNIsjn2etSnH5MNCl1qvjx7M4vly4Jzv5uriNgAvt4TbtQxyYvlT/ksD
         GT9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0Jfm6fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-886e92ca619si571419241.64.2025.07.04.07.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:35:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0Jfm6fH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhR1-0004ws-KA; Fri, 04 Jul 2025 10:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLu-00047M-VU
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:27 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhLp-0007zK-GI
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:21 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-72c47631b4cso863528a34.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639116; x=1752243916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPqD2WiuW/V5KwVpgPbT8/RYmpheRb4cRCRm2q9oZgY=;
 b=U0Jfm6fHXOqrmOwr1xzlhDe0kZm1+8roOngtNaw+f5bm+YmDKkuVx6i8WndnMrVd/R
 +4hEN2D3jsWA4gD+mrDHhEyF6qWcvIOnPhMt2aQp5+45hvCqXFP8uD+VdlkjJFzZAm9X
 R+L0DPL+vOCN6AtLM1kAK/bHYhjprByeRn1LgJ+tvgXznLAOnCVh+FuuzBLOEot6HX8k
 d1XqNWTjzR/PPkW21U/Wcuxm+LFS9JuBFUolmE2GtJUTgZi+6QIsoWJGq0dLCXy3qG/k
 y6TVzzqu5zX6PjrsZyDIyEdUJmAcLQS1U/hGhIj2FNzUl2U10YXgbRTj2Ud5POcrCand
 BzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639116; x=1752243916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EPqD2WiuW/V5KwVpgPbT8/RYmpheRb4cRCRm2q9oZgY=;
 b=pJ3j/JjCc5CpffesH/POUEU1SDUw9b5fr1d4oR2T0UmJCiCDjIEAjIvFAitzZW4wO8
 IlNyzohOwmNsggceiBGX1DbNWstrlmOmsrlO/kkt4efD6S5kjhSLNLSpoUm7BCmfAd5S
 vt6joRyr1KjqAg9b+WwF+YhZGHM/5lkhx6DMBdOiMA5mVs7PMub13lmxx9yNSvkAA4Xz
 p+8QZjwK0JbnkRi0Rjcy7Glj9ovv2avC9hTdR3uM3eCIH5cYzd8lJXtU/YT7SWOou6Tu
 QFg4LDVUoto5usBaMtCwm+ElRLM7o+tUkj0UEsMv03VxRj9umyuHa30ObwjeTDoHWZvR
 GXuA==
X-Gm-Message-State: AOJu0YyIhZoIsGc0qphDM4MbslAfjbkz2Y9lt4yAO5lZKYYxAWOO2qzV
 5t/yqhZ3ZMOrRj/4Fpid70HcSEDZlQDUDOHiuhaaa3ZIDwXRytl6j93v61CuDXtAGAM=
X-Gm-Gg: ASbGncupcLz8xBKb+sv0nZpDzIyU/xl0AY/m9JbJEUcOJQQw1bSeRg5tEgFy09BeFm4
 BD4nOA7U4OCiE80GlZqIMd7+duQl7fAHUa9VClyDbcwE1mUCErhNv1hVUp49Nsqou9qkQolXsY5
 d8RnhuXlmK4R2ohGBmJeCi/AVVyZ7601rn1KVYnjBP5rrpn/z8betCiplBXTOH9ElIGlkvjZQTq
 TVJG4pJsOQeOCAg38Y2+4G8xP3XNFI2Zedsm+QRE3Ep+lQ3Nk1nN8D2vs8BBG12NA6YrIf0+Uv1
 wvRIMvy18r0TGDAKga6/HGatXFsKOROGYog2iGoClaIIlhFrX0Cs7iJOjqlRRW3ypYAwxPQoYjJ
 rPac25iAbC2blxznlvDsGya+bMS3y7A/TsrusaTJCeLB+gjS0
X-Received: by 2002:a05:6830:7101:b0:73a:9d3d:7bea with SMTP id
 46e09a7af769-73ca677b66cmr1470667a34.24.1751639115997; 
 Fri, 04 Jul 2025 07:25:15 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 057/108] target/arm: Introduce do_[us]sat_[bhs] macros
Date: Fri,  4 Jul 2025 08:20:20 -0600
Message-ID: <20250704142112.1018902-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 02CAkaafSDns

Inputs are a wider type of indeterminate sign.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index bbf76f63b1..a1c10c60a1 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -223,6 +223,13 @@ int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
 int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
 int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 
+#define do_ssat_b(val)  MIN(MAX(val, INT8_MIN), INT8_MAX)
+#define do_ssat_h(val)  MIN(MAX(val, INT16_MIN), INT16_MAX)
+#define do_ssat_s(val)  MIN(MAX(val, INT32_MIN), INT32_MAX)
+#define do_usat_b(val)  MIN(MAX(val, 0), UINT8_MAX)
+#define do_usat_h(val)  MIN(MAX(val, 0), UINT16_MAX)
+#define do_usat_s(val)  MIN(MAX(val, 0), UINT32_MAX)
+
 /**
  * bfdotadd:
  * @sum: addend
-- 
2.43.0

