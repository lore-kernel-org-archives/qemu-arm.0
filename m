Received: by 10.223.197.9 with SMTP id q9csp5935199wrf;
        Wed, 4 Oct 2017 11:48:38 -0700 (PDT)
X-Received: by 10.55.22.146 with SMTP id 18mr26680367qkw.281.1507142918437;
        Wed, 04 Oct 2017 11:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142918; cv=none;
        d=google.com; s=arc-20160816;
        b=mLyZv+dd624z8I2ySmJJGKqE8/JPj8GhlI8UWWQlbOUc2109w7hKycPetUrSJfIau4
         rzyAFB18MhuRMa6xaiy/6HA/kWuZecGXRy4//fgPUSfXj65cglyEbyz2cNWkSYm7eL3E
         fxHy7gz8CAmxgzmrx99Y2gS1tZehssnJeNTOr+tOgANX1VIQW4zZP0vXuMKdtX9g1WJh
         GIHft/tVdJaANAVCJIt2hS+w7CGDzZxPsPHGv6qiksVcz/4Mv75XZWfmp2LhUWOu53yy
         Z401PwJlzaqfrChyb9qkPyzc6iFioxvPy0VXOHhDBK5PmXHuNbbbvJ4qFwMhK/Hwhoh6
         NGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Y5zogntbmWc/HsOd1z5gbDUdbw2+ttmLw9MyB9D9XyM=;
        b=mLrsDSd33dk1CIUu7nVMnrqxN1aMAXoZiJJZkHPuIs7CyVCw5owTOzpIUYqL7CM5bq
         xPgtFAmZHyqg3wCc0bUBN+8bw+2wijdof2BlveaMyLY/kFKcGw6ZVYkiv7taqnEfsixl
         GBFvcT45o+fPksbglIazRQvy6sgInIp7tGl81chwF5XRs5lm0BihPY72qVUJxdkplerv
         Bt+VlIEkjkhxCUsLikGNY/WQPG+X6NQWvesR1nvIDRIbVJ2ScNBO6TiPqlI/EcHih1G/
         p3hVu0NGSZnSjlRETs0g7hf06+ylvoANDqa0o13927SQ5LAyQKyRhPPLUoEZTueDteaR
         fjRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiCKAWTh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m20si10810035qkh.518.2017.10.04.11.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:48:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiCKAWTh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoij-0003n1-UR
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:48:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodw-0008Fh-UM
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodw-0002ip-5O
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:40 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodw-0002iK-1d
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 14:43:40 -0400
Received: by mail-qt0-x22b.google.com with SMTP id a43so15131436qta.0
	for <qemu-devel@nongnu.org>; Wed, 04 Oct 2017 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y5zogntbmWc/HsOd1z5gbDUdbw2+ttmLw9MyB9D9XyM=;
	b=eiCKAWThkc/E3YpbsbXNytKi+AhyQns2T5q29uaATiBQtXqF/bKo3lmS7uthJxz2si
	aveq/5D9xjUrnwkf/Aqn5HDjjYug5jvm74wBIzoX7eGNqUx6Sx63GzmNG/jp9wZN8E3K
	sIlmaZJHL8zjWjzoZdCEELcfjn3jENg/J5CLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y5zogntbmWc/HsOd1z5gbDUdbw2+ttmLw9MyB9D9XyM=;
	b=de5DptjUHyG45MlJc0Y8GIC5UYF8UzPn3FS4znnHO2wS6tg8ERR65HhjfHymQQxsN8
	76LOWCn8sgDs8mqSG+m4XebmgCltvRwYBY9yrz6nJlYqBXaygAgzW1OpsWaVsUCBQhW3
	ke6/HdxehK/JCJiQ1s/Up2vQYqjYkmrF4kCSoWahc/+RT+HdGzTfodQ8LknhL6NEZVEE
	squ53OLYKa/UNrsOg6ZS/cFXzOn3Usup0OWGi6k1kfumPVrSB4ML/QWrTdxDRPeqO26b
	KZVhs+98V3Ov3K540EHRYRO/JS50QOUS681ST+EPi3z6Jsjm6ksB6NqDDBI4TeEn2agn
	qXeQ==
X-Gm-Message-State: AMCzsaXM0KI/YduCH6p8qvuaDMbxQBYj2Hk/hiD+l/A/+mp58kME/94V
	Ple6WxJ5hcJblVErjl11QRG3Ot2iejE=
X-Google-Smtp-Source: AOwi7QDkEb8BMpVwiFU9eqmijGmkyfmb/ln3JtkilTWsCM9WdHE6HLcCzj1KcrszJ5PEXS9ohdAB9w==
X-Received: by 10.37.175.131 with SMTP id g3mr3393632ybh.96.1507142619106;
	Wed, 04 Oct 2017 11:43:39 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:20 -0400
Message-Id: <20171004184325.24157-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-devel] [PATCH v1 07/12] target/arm: Decode aa32 armv8.1 two
 reg and a scalar
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PPjTlQThZshy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0cd58710b3..ee1e364fb5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6941,10 +6941,42 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         }
                         neon_store_reg64(cpu_V0, rd + pass);
                     }
+                    break;
+                case 14: /* VQRDMLAH scalar */
+                case 15: /* VQRDMLSH scalar */
+                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
+                        return 1;
+                    }
+                    if (u && ((rd | rn) & 1)) {
+                        return 1;
+                    }
+                    tmp2 = neon_get_scalar(size, rm);
+                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
+                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
+                                   TCGv_i32, TCGv_i32);
 
-
+                        tmp = neon_load_reg(rn, pass);
+                        tmp3 = neon_load_reg(rd, pass);
+                        if (op == 14) {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlah_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlah_s32;
+                            }
+                        } else {
+                            if (size == 1) {
+                                fn = gen_helper_neon_qrdmlsh_s16;
+                            } else {
+                                fn = gen_helper_neon_qrdmlsh_s32;
+                            }
+                        }
+                        fn(tmp, cpu_env, tmp, tmp2, tmp3);
+                        tcg_temp_free_i32(tmp3);
+                        neon_store_reg(rd, pass, tmp);
+                    }
+                    tcg_temp_free_i32(tmp2);
                     break;
-                default: /* 14 and 15 are RESERVED */
+                default:
                     return 1;
                 }
             }
-- 
2.13.6

