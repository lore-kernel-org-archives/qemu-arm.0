Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3739121dye;
        Wed, 2 Jul 2025 04:21:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTnYOnC3ypCOAvgXHQlZSI0ALrCSZoQFT9PXkMoh3StEOOVneCaiT65BsoXo6wMmqlnAOJ0ASy0em5jQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHaHZwIK3i9rSlrx85Qes9dSef6Zdg5Eue5LEwo7WJxuDOjPmgUVuxPa7jl1ShK3d2V1xnU
X-Received: by 2002:a05:6214:5084:b0:6fa:ae40:3023 with SMTP id 6a1803df08f44-702b2016550mr32382476d6.7.1751455317641;
        Wed, 02 Jul 2025 04:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455317; cv=none;
        d=google.com; s=arc-20240605;
        b=aGV1KHjx7te6yD6w8GBeBMOvGOMsyAdumRHiNolJC1QVhASWDtfNaSqUqYgMY6ZMGO
         7BjvdeNmUVYTFclGUsa5HFyYGeDUFs9vCg+UZH87hQiVtU5ztyu6L3PB+6P5iV+IT2fH
         PxUCGbFkhVIcOvTK4/wudHDcc93DgWvfQIiYWENAXZ9JUZMQgtXOk7J0l7nBForHWu32
         3FGgDSa4VRPraal0y62DA9qZpYT3RuEmw2q0ZYhoRvfqmTR2ZIjslP11p47NyQPJRUbk
         NUN1L4Uf266S6aaO32J0eArKcsH+hza395pR4/UgwbLRjoSXCSIpJJN2xfVwqn650JJo
         YHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sRN/1vFm2ZWO5FB3O8HE20lztbV9KvcYq5rghMJib5I=;
        fh=+NYtK5zGcW6pUCHbByPUnUAm3zGA8t6eYLMqkBGLE00=;
        b=Pikpx9YpWLVLzyNSkh3QWoFxZ2SsA1rNXXgPrFivWPNUrhQF8LBlTWjS2ixsJWCF7W
         gFX88uDkYA4R9dNZBBmOJC3bsTZC9GrGVF+Nxy2sI/xDBEJlCvp9od243FI+kCKHnenA
         uAiCXRruxig7nUtlvbYx4RoS2N5u/J7xKK0yYZdSEBi8WbPezCY+m9bg+S43dGu6pWzj
         vYR11UaxwNiVo+a73za5FiWLOQQFo6RFm5r5Zr2ha/zcFUleNht4s/OdcgrPs/Mi4XjU
         jimzgmG3cY790aNI3CCYEhAmgmQRR0n38zFeXTV7xbwVt2uawtdK4fPn+uIgR/OwFMRN
         X84w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVuTjsGd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77299eb6si141419456d6.136.2025.07.02.04.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:21:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kVuTjsGd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWvWY-00089B-Jn; Wed, 02 Jul 2025 07:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvWE-0007jC-K3; Wed, 02 Jul 2025 07:20:53 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvW7-0002ST-0a; Wed, 02 Jul 2025 07:20:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2350fc2591dso63963295ad.1; 
 Wed, 02 Jul 2025 04:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455240; x=1752060040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRN/1vFm2ZWO5FB3O8HE20lztbV9KvcYq5rghMJib5I=;
 b=kVuTjsGd6YR7FQlHD0CiYw0Wr4CTzo60Z/KXCnQCgmeiy9rBgLc32H887WYp6n/OIp
 Q1p4entxflSQdd3S4leD+rdhCkBJDsaR0w7PkRwhHp4HvmaFePiTaNpeviRQz/y8180l
 TzZ2Az1+luOlPj+l7p3+XyxqLET/3a1gcKcKjE4MxBjZlttB1OFm9V7lsB3dq/NwITCo
 BaiOFTj/7wFYMOCdwlvKgHNFWTSAd9lS9rniI/vK6On2JH39F+NT20XEEZ4EbJsp3vDb
 WVGA2NjHDpCBLX1/CzYOuAe6zONKVOLa9MCiEKWD13ow1plV4vj1SKw/f1fBtzaFxn24
 ZMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455240; x=1752060040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sRN/1vFm2ZWO5FB3O8HE20lztbV9KvcYq5rghMJib5I=;
 b=lhnkUERUkkVZVFF9Z9+1aUkKdJwxfSyXea35U70RGIqe+VqZV69fsmABADcgMSa/qQ
 lpCn/WV87H6D69gIHwCD8TfzgtWChVnzyJVyTUJP7JIdGb/C4kn6rIv5ugh3zuh8Zdn4
 7z0iCB6X/urg10gmXv8rhMJz0zEojHW3gVg/4opaVeyKww/h038aF8wzS5YflRKjIXrb
 j0xQGomTTz0xKB1fUlb2blxxnQPjDypNNuNpr19EZZoykTpydPlSEmBCWaxwDaYiS+DO
 Bi0eLbJCoyh7hGx05M6BCcNVKohvycn/QsGvZAEMIriv46G7xr94spAR+s05FxjFUOM4
 K4hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvwY+F41PBUQclaqoEG65EfXdQosMJ78iVcPcIjwGJo6qx8SYesmxq1VU3gey95sX+T1RS6dgALA==@nongnu.org
X-Gm-Message-State: AOJu0YwoNrPGPf4mVpTDLlEPxUBPipegDKRKETut8NK2+Dwz+cjma73R
 lRS7/sNx1GD8DMs84M3G0INo1sA0St/0rbHpvSOye2j5eKhqn6jUvnFe2vAw/P+UI98=
X-Gm-Gg: ASbGncs1CdYnGIk0l9aJ/NdOZJbdT+jLiKUp6fhyCqeM0UIYWgYMWg45alBdDzE3P0B
 yV3PWVP76N+HEL9B22OKK7MMThbnCC47g2m2nBwKy9BuY4BB6M8Hb/5OTivIOhYIR60Uih0sr3s
 dUdnEYilknz7ohL7F6Ghxa3KMLjoNfGHa1EngTcw2sy7qkg9wQ19Waij19aCqbzCa1MjCS2CQ3Y
 bp35ihKfOgskk5xrimbkb08WFInJC4IR5H8iEW8h/rS3ioxeoUFZMojCT7cyMYtn/woJ/7bJvLv
 HObfDlP+ogtv6P5mbTHdSdOxESAMtwyDvJtuKzZ+QjuQcaZ7C+lZqmHItozfxpKOrZgH8/MfyNI
 gH01uZ3JPAGsYmATaspIhJcrZPCYVPwxkf9uC5hnLU00=
X-Received: by 2002:a17:902:d2d0:b0:235:eca0:12e8 with SMTP id
 d9443c01a7336-23c6e759a54mr30180745ad.4.1751455240207; 
 Wed, 02 Jul 2025 04:20:40 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23acb39ba8esm133678985ad.129.2025.07.02.04.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:20:39 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 10/12] target/arm: Fix VST4 helper store alignment checks
Date: Wed,  2 Jul 2025 20:49:52 +0930
Message-ID: <20250702111954.128563-11-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
References: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x62f.google.com
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
X-TUID: +9rraJpg1QID

This patch adds alignment checks in the store operations in the VST4
instruction.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/mve_helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index d6e2f1ac5a..185f6efeab 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -577,6 +577,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         uint16_t mask = mve_eci_mask(env);                              \
         static const uint8_t off[4] = { O1, O2, O3, O4 };               \
         uint32_t addr, data;                                            \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -588,7 +590,7 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
                 uint8_t *qd = (uint8_t *)aa32_vfp_qreg(env, qnidx + e); \
                 data = (data << 8) | qd[H1(off[beat])];                 \
             }                                                           \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
@@ -602,6 +604,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         uint32_t addr, data;                                            \
         int y; /* y counts 0 2 0 2 */                                   \
         uint16_t *qd;                                                   \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0, y = 0; beat < 4; beat++, mask >>= 4, y ^= 2) {   \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -612,7 +616,7 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
             data = qd[H2(off[beat])];                                   \
             qd = (uint16_t *)aa32_vfp_qreg(env, qnidx + y + 1);         \
             data |= qd[H2(off[beat])] << 16;                            \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
@@ -626,6 +630,8 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
         uint32_t addr, data;                                            \
         uint32_t *qd;                                                   \
         int y;                                                          \
+        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
+        MemOpIdx oi = make_memop_idx(MO_TEUL | MO_ALIGN, mmu_idx);      \
         for (beat = 0; beat < 4; beat++, mask >>= 4) {                  \
             if ((mask & 1) == 0) {                                      \
                 /* ECI says skip this beat */                           \
@@ -635,7 +641,7 @@ DO_VLD2W(vld21w, 8, 12, 16, 20)
             y = (beat + (O1 & 2)) & 3;                                  \
             qd = (uint32_t *)aa32_vfp_qreg(env, qnidx + y);             \
             data = qd[H4(off[beat] >> 2)];                              \
-            cpu_stl_le_data_ra(env, addr, data, GETPC());               \
+            cpu_stl_mmu(env, addr, data, oi, GETPC());                  \
         }                                                               \
     }
 
-- 
2.48.1

