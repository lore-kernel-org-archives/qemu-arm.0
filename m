Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3802845dye;
        Wed, 2 Jul 2025 06:13:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfd6ZXhmkymiJNJgvg1RbemxqYR77x5HgMnWl9D+3E/JhlWA/clqc/5KngsAXRZZkxy9Ag0NyZp8XIQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHL9pbeT3XV1i2/rtoZteuzH7msqiXFoC0JPcbHHpYAwRWN7VDTCbQc1TVR5sTj6DUS8LD6
X-Received: by 2002:a05:600c:8212:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-454a36dd789mr35175075e9.4.1751462023071;
        Wed, 02 Jul 2025 06:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751462023; cv=none;
        d=google.com; s=arc-20240605;
        b=RM8243WGE4d9qBcqtZK6n7JzvTn8ORaXfG9iSF9UV6CpsPBlt2zSeH2Sy6R3ziOc2V
         cB8nTT2mo/YAzDTtzpKop4f0i8w/UM4EiekF5alx6VexrGDAl3ulm/UuHFLahoSWDz+7
         9cibVqqRrBU6eru54vWKdf9mRzqvCQ2K+LJsGaN6Dmp3G3sIWVaej8sfvl1+PCzA+ROg
         Kw+7XvFT4h1qZ+Vncz3WF0Hnqo/YaZLX57xX7RnQhUYsSiLBQlW+Mm6kBRuhEpozP8Xg
         oVDQoSb1SOZIFT7Gr2SbaNJ97IjSYZMD1rzGe52MQb39ngGTQP6xBYot9ibg+dwVjy27
         GRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WLzctUCzTucCiIQYGsjG0PruHuyOXcVhxFiiYg1qHM4=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=D8WHa/EHeEaZVYEjEK4Sj0Pz1xRiDonZ1+bbEYUmyAcu0lF5XwB+GGNS0/Jaupywgo
         FTQBQv8Kh8/G3zrz8oIaAJye0WraLHoizZ7WNbY4jZYqVKH5tILep4dQoVD9//YiIBmW
         P0yhoyeKGAzj+f0EDqEKsiyHz6VmSeUwkJhdVK/ZpNBHAnF5P07lbOO89tfm07vsmvbR
         LgPKoajDqc6w2wxICTgNuAzhenmtQYATdm1888QTQwipbllJuXE9oCyY3z5g5AlyxCFg
         pI9R5/jNRMgQxVqvN6sFoIKfsbu0t9RiTJLWBLLtUIM/7bXAadJG+0phv4A4Un5pLrek
         z+ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLW7sBFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453823e573fsi139263525e9.151.2025.07.02.06.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WLW7sBFH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwrh-00084L-Ni; Wed, 02 Jul 2025 08:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwkA-0004v6-Mv
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:21 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjq-0002I0-7d
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:39:18 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so3760525fac.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459934; x=1752064734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLzctUCzTucCiIQYGsjG0PruHuyOXcVhxFiiYg1qHM4=;
 b=WLW7sBFHTIFXSwlUtCxW691YSeDifNKtLcNV2A1RmsiDMl+OTCXZE5BThLoCE+emM/
 XS2XxaqqVenbow3jd0QgWe/5hF+chdLv+SvSMklDD5FlNKn96HqBYsAI45a1J2jeNkaj
 NeCL8e5U6I4G/crLk4A/57OhZtnVQ/6LBGiqumySyLCHXboDEB7rRTBUpa1qnd9YhT0p
 3F6HA2UnjYiChfmsfUgXtEqofSVqHqR9Vj/6CNQfX/HzObFLZFzF2qrkqFgitgcdQQTE
 cHNE//GYlY7QKJq/x5+A870yDFVTfIf8x2Nktr7KHDFdb8flUKCE2kVPRq8M1pTanX6m
 TAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459934; x=1752064734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLzctUCzTucCiIQYGsjG0PruHuyOXcVhxFiiYg1qHM4=;
 b=p6kXuJl1UxIAIiGCAKlVSC5T5tAEEd+qEaffLBPmZGxszAdyk7H5ti4lxrxl2xiH+H
 dzM/5DQL7z++k//hXFKBXAMEti+Du5RAHpJ/tG9jxZFPNz9Cbx6DznjslrTDRTS+0tkn
 sRR8mjsoHM+Bn8PQy4SWQk2EZHu32XmL9cU1JJOSMWBnoeHADTCqD4ijHYESEEnMXcyW
 94lgrnOf/viIeOXU1g3xKQ8E5UmdRFX+vcyrsij/Trk43QXS1LmYKRcjYXaUNlZnrYCB
 XnA9N5PK+lq7ZAMubRfEHKd7mc5cOwionKQms5N3hw3QO3xLJVogAW6Pcpq3TQDuoFyQ
 LDqA==
X-Gm-Message-State: AOJu0Yy/LEn/ERmFBbDOdnNk9FFznuFZhSxLs09Rhu0hHpsjsxBFj1VG
 JKGGa5nrkfF43u5GZCpFchI7FcBo3bhFu8tzs9vdrGcGtO2zgcKSMhnkyToaqam+M86cMAtvAXc
 FCmv8opI=
X-Gm-Gg: ASbGnctkbFML6FGNF2dKZliLaZjYAdd12ZuT6SSPJl8pAdPrJ20c+tr++GRD2FkqtaK
 4sa/7JTYMoC6mLR7E58SrK/1WGjdQAywIzU8dklDNsoGBMgSqfwYvHFLhdEhQ1ENd7JQXa+LmZE
 1snV9wOQGZZji6tgd2lWhrSUetriPRc+EDj2e6mNFKgxCg3vM+EwjTtw6AC8iBup8UN9PDOY3eh
 ktgrbu0dl3bBfP31pp2Tht/8LELOPlBr54ExXJHQQ/K5rVehTs2/PfOqn0bGpuC1pU1vOKGCfvI
 c3uFpMgpiLHj/GK9OcbQFVDeEOryVcnTMoxChp+OwPMDC+7j3FQzkYM9hwUl/8oS8MWcIQ==
X-Received: by 2002:a05:6870:ae96:b0:2ef:2af4:dfcb with SMTP id
 586e51a60fabf-2f5a8c53a8dmr1797623fac.28.1751459934189; 
 Wed, 02 Jul 2025 05:38:54 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 79/97] target/arm: Implement PMOV for SME2p1/SVE2p1
Date: Wed,  2 Jul 2025 06:33:52 -0600
Message-ID: <20250702123410.761208-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: pT6orJYSuQR6

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |   8 +
 target/arm/tcg/sve_helper.c    | 317 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c |  93 ++++++++++
 target/arm/tcg/sve.decode      |  17 ++
 4 files changed, 435 insertions(+)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 733828a880..04b9545c11 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -3020,3 +3020,11 @@ DEF_HELPER_FLAGS_4(sve2p1_andqv_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_andqv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_andqv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2p1_andqv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(pmov_pv_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(pmov_pv_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(pmov_pv_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(pmov_vp_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(pmov_vp_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(pmov_vp_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index c41143468a..7af5c59fa5 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3035,6 +3035,323 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
+static uint64_t extractn(uint64_t *p, unsigned pos, unsigned len)
+{
+    uint64_t x;
+
+    p += pos / 64;
+    pos = pos % 64;
+
+    x = p[0];
+    if (pos + len > 64) {
+        x = (x >> pos) | (p[1] << (-pos & 63));
+        pos = 0;
+    }
+    return extract64(x, pos, len);
+}
+
+static void depositn(uint64_t *p, unsigned pos, unsigned len, uint64_t val)
+{
+    p += pos / 64;
+    pos = pos % 64;
+
+    if (pos + len <= 64) {
+        p[0] = deposit64(p[0], pos, len, val);
+    } else {
+        unsigned len0 = 64 - pos;
+        unsigned len1 = len - len0;
+
+        p[0] = deposit64(p[0], pos, len0, val);
+        p[1] = deposit64(p[1], 0, len1, val >> len0);
+    }
+}
+
+void HELPER(pmov_pv_h)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd;
+    unsigned vl = simd_oprsz(desc);
+    unsigned vq = vl / 16;
+    unsigned vofs = simd_data(desc) * vq;
+    uint64_t x;
+
+    for (; vq >= 4; vq -= 4) {
+        x = *(uint32_t *)(vs + H1_4(vofs));
+        vofs += 4;
+        *dst++ = half_shuffle64(x);
+    }
+
+    if (vq) {
+        x = *(uint32_t *)(vs + H1_4(vofs));
+        x = extract32(x, 0, vq * 8);
+        *dst++ = half_shuffle64(x);
+    }
+}
+
+static uint64_t one_pmov_pv_s(uint64_t x)
+{
+    x = ((x & 0xff00) << 24) | (x & 0xff);
+    x = ((x << 12) | x) & 0x000f000f000f000full;
+    x = ((x <<  6) | x) & 0x0303030303030303ull;
+    x = ((x <<  3) | x) & 0x1111111111111111ull;
+    return x;
+}
+
+void HELPER(pmov_pv_s)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd, *src = vs;
+    unsigned vl = simd_oprsz(desc);
+    unsigned idx = simd_data(desc);
+    unsigned width = (vl * 8) / 32;
+    uint64_t x0, x1, x2, x3;
+
+    switch (vl / 16) {
+    case 1:
+        x0 = extract64(*src, idx * 4, 4);
+        goto one;
+    case 2:
+        x0 = ((uint8_t *)vs)[H1(idx)];
+        goto one;
+    case 3:
+        x0 = extract64(*src, idx * 12, 12);
+        goto one;
+    case 4:
+        x0 = ((uint16_t *)vs)[H2(idx)];
+        goto one;
+    case 5:
+    case 6:
+    case 7:
+        x0 = extractn(src, idx * width, 16);
+        x1 = extractn(src, idx * width + 16, width - 16);
+        goto two;
+    case 8:
+        x0 = ((uint32_t *)vs)[H4(idx)];
+        x1 = x0 >> 16;
+        goto two;
+    case 9:
+    case 10:
+    case 11:
+    case 12:
+        x0 = extractn(src, idx * width, 16);
+        x1 = extractn(src, idx * width + 16, 16);
+        x2 = extractn(src, idx * width + 32, width - 32);
+        goto three;
+    case 13:
+    case 14:
+    case 15:
+        x0 = extractn(src, idx * width, 16);
+        x1 = extractn(src, idx * width + 16, 16);
+        x2 = extractn(src, idx * width + 32, 16);
+        x3 = extractn(src, idx * width + 48, width - 48);
+        break;
+    case 16:
+        x0 = src[idx];
+        x1 = x0 >> 16;
+        x2 = x0 >> 32;
+        x3 = x0 >> 48;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    dst[3] = one_pmov_pv_s(x3);
+ three:
+    dst[2] = one_pmov_pv_s(x2);
+ two:
+    dst[1] = one_pmov_pv_s(x1);
+ one:
+    dst[0] = one_pmov_pv_s(x0);
+}
+
+static uint64_t one_pmov_pv_d(uint64_t x)
+{
+    x = ((x & 0xf0) << 28) | (x & 0xf);
+    x = ((x << 14) | x) & 0x0003000300030003ull;
+    x = ((x <<  7) | x) & 0x0101010101010101ull;
+    return x;
+}
+
+void HELPER(pmov_pv_d)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd, *src = vs;
+    unsigned vl = simd_oprsz(desc);
+    unsigned idx = simd_data(desc);
+    unsigned width = (vl * 8) / 64;
+    uint64_t x0, x1, x2, x3;
+
+    switch (vl / 16) {
+    case 1:
+        x0 = extract64(*src, idx * 2, 2);
+        goto one;
+    case 2:
+        x0 = extract64(*src, idx * 4, 4);
+        goto one;
+    case 3:
+        x0 = extract64(*src, idx * 6, 6);
+        goto one;
+    case 4:
+        x0 = ((uint8_t *)vs)[H1(idx)];
+        goto one;
+    case 5:
+    case 6:
+    case 7:
+        x0 = extractn(src, idx * width, 8);
+        x1 = extractn(src, idx * width + 8, width - 8);
+        goto two;
+    case 8:
+        x0 = ((uint16_t *)vs)[H2(idx)];
+        x1 = x0 >> 8;
+        goto two;
+    case 9:
+    case 10:
+    case 11:
+    case 12:
+        x0 = extractn(src, idx * width, 8);
+        x1 = extractn(src, idx * width + 8, 8);
+        x2 = extractn(src, idx * width + 16, width - 16);
+        goto three;
+    case 13:
+    case 14:
+    case 15:
+        x0 = extractn(src, idx * width, 8);
+        x1 = extractn(src, idx * width + 8, 8);
+        x2 = extractn(src, idx * width + 16, 8);
+        x3 = extractn(src, idx * width + 24, width - 24);
+        break;
+    case 16:
+        x0 = ((uint32_t *)vs)[H4(idx)];
+        x1 = x0 >> 8;
+        x2 = x0 >> 16;
+        x3 = x0 >> 24;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    dst[3] = one_pmov_pv_d(x3);
+ three:
+    dst[2] = one_pmov_pv_d(x2);
+ two:
+    dst[1] = one_pmov_pv_d(x1);
+ one:
+    dst[0] = one_pmov_pv_d(x0);
+}
+
+static void pmov_vp_tail(uint64_t *dst, unsigned vl, unsigned width,
+                         unsigned idx, uint64_t val)
+{
+    /* Index 0 clears the rest of the vector; others just insert. */
+    if (idx == 0) {
+        dst[0] = val;
+        clear_tail(dst, 8, vl);
+        return;
+    }
+
+    switch (width) {
+    case 8:
+        ((uint8_t *)dst)[H1(idx)] = val;
+        break;
+    case 16:
+        ((uint16_t *)dst)[H2(idx)] = val;
+        break;
+    case 32:
+        ((uint32_t *)dst)[H4(idx)] = val;
+        break;
+    case 64:
+        dst[idx] = val;
+        break;
+    default:
+        depositn(dst, idx * width, width, val);
+        break;
+    }
+}
+
+void HELPER(pmov_vp_h)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd, *src = vs;
+    unsigned vl = simd_oprsz(desc);
+    unsigned idx = simd_data(desc);
+    unsigned pl_dr8 = DIV_ROUND_UP(vl, 64);
+    unsigned width = (vl * 8) / 16;
+    uint64_t x0 = 0, x1 = 0;
+
+    switch (pl_dr8) {
+    case 4:
+        x1 = half_unshuffle64(src[3]);
+        /* fall through */
+    case 3:
+        x1 = (x1 << 32) | half_unshuffle64(src[2]);
+        /* fall through */
+    case 2:
+        x0 = half_unshuffle64(src[1]);
+        /* fall through */
+    case 1:
+        x0 = (x0 << 32) | half_unshuffle64(src[0]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (width <= 64) {
+        pmov_vp_tail(dst, vl, width, idx, x0);
+    } else if (idx == 0) {
+        dst[0] = x0;
+        dst[1] = x1;
+        clear_tail(dst, 16, vl);
+    } else {
+        depositn(dst, idx * width, 64, x0);
+        depositn(dst, idx * width + 64, width - 64, x0);
+    }
+}
+
+static uint64_t one_pmov_vp_s(uint64_t x)
+{
+    x &= 0x1111111111111111ull;
+    x = ((x >>  3) | x) & 0x0303030303030303ull;
+    x = ((x >>  6) | x) & 0x000f000f000f000full;
+    x = ((x >> 12) | x) & 0x000000ff000000ffull;
+    x = ((x >> 24) | x) & 0xffff;
+    return x;
+}
+
+void HELPER(pmov_vp_s)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd, *src = vs;
+    unsigned vl = simd_oprsz(desc);
+    unsigned idx = simd_data(desc);
+    unsigned pl_dr8 = DIV_ROUND_UP(vl, 64);
+    unsigned width = (vl * 8) / 32;
+    uint64_t x = 0;
+
+    for (int i = pl_dr8 - 1; i >= 0; --i) {
+        x = (x << 16) | one_pmov_vp_s(src[i]);
+    }
+    pmov_vp_tail(dst, vl, width, idx, x);
+}
+
+static uint64_t one_pmov_vp_d(uint64_t x)
+{
+    x &= 0x0101010101010101ull;
+    x = ((x >>  7) | x) & 0x0003000300030003ull;
+    x = ((x >> 14) | x) & 0x0000000f0000000full;
+    x = ((x >> 28) | x) & 0xff;
+    return x;
+}
+
+void HELPER(pmov_vp_d)(void *vd, void *vs, uint32_t desc)
+{
+    uint64_t *dst = vd, *src = vs;
+    unsigned vl = simd_oprsz(desc);
+    unsigned idx = simd_data(desc);
+    unsigned pl_dr8 = DIV_ROUND_UP(vl, 64);
+    unsigned width = (vl * 8) / 64;
+    uint64_t x = 0;
+
+    for (int i = pl_dr8 - 1; i >= 0; --i) {
+        x = (x << 8) | one_pmov_vp_d(src[i]);
+    }
+    pmov_vp_tail(dst, vl, width, idx, x);
+}
+
 typedef void tb_impl_fn(void *, void *, void *, void *, uintptr_t, bool);
 
 static inline void do_tbl1(void *vd, void *vn, void *vm, uint32_t desc,
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index a918da31fe..7f35d1d23c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -2386,6 +2386,99 @@ static gen_helper_gvec_3 * const tbx_fns[4] = {
 };
 TRANS_FEAT(TBX, aa64_sve2, gen_gvec_ool_arg_zzz, tbx_fns[a->esz], a, 0)
 
+static bool trans_PMOV_pv(DisasContext *s, arg_PMOV_pv *a)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        NULL,                 gen_helper_pmov_pv_h,
+        gen_helper_pmov_pv_s, gen_helper_pmov_pv_d
+    };
+    unsigned vl, pl, vofs, pofs;
+    TCGv_i64 tmp;
+
+    if (!dc_isar_feature(aa64_sme2p1_or_sve2p1, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vl = vec_full_reg_size(s);
+    if (a->esz != MO_8) {
+        tcg_gen_gvec_2_ool(pred_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vl, vl, a->imm, fns[a->esz]);
+        return true;
+    }
+
+    pl = vl / 8;
+    pofs = pred_full_reg_offset(s, a->rd);
+    vofs = vec_full_reg_offset(s, a->rn);
+
+    QEMU_BUILD_BUG_ON(sizeof(ARMPredicateReg) != 32);
+    for (unsigned i = 32; i >= 8; i >>= 1) {
+        if (pl & i) {
+            tcg_gen_gvec_mov(MO_64, pofs, vofs, i, i);
+            pofs += i;
+            vofs += i;
+        }
+    }
+    switch (pl & 7) {
+    case 0:
+        return true;
+    case 2:
+        tmp = tcg_temp_new_i64();
+        tcg_gen_ld16u_i64(tmp, tcg_env, vofs + (HOST_BIG_ENDIAN ? 6 : 0));
+        break;
+    case 4:
+        tmp = tcg_temp_new_i64();
+        tcg_gen_ld32u_i64(tmp, tcg_env, vofs + (HOST_BIG_ENDIAN ? 4 : 0));
+        break;
+    case 6:
+        tmp = tcg_temp_new_i64();
+        tcg_gen_ld_i64(tmp, tcg_env, vofs);
+        tcg_gen_extract_i64(tmp, tmp, 0, 48);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_gen_st_i64(tmp, tcg_env, pofs);
+    return true;
+}
+
+static bool trans_PMOV_vp(DisasContext *s, arg_PMOV_pv *a)
+{
+    static gen_helper_gvec_2 * const fns[4] = {
+        NULL,                 gen_helper_pmov_vp_h,
+        gen_helper_pmov_vp_s, gen_helper_pmov_vp_d
+    };
+    unsigned vl;
+
+    if (!dc_isar_feature(aa64_sme2p1_or_sve2p1, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vl = vec_full_reg_size(s);
+
+    if (a->esz == MO_8) {
+        /*
+         * The low pl bytes are copied from p to v unchanged.
+         * We know that the unused portion of p is zero, and
+         * that imm == 0, so the balance of v must be zeroed.
+         */
+        tcg_gen_gvec_mov(MO_64, vec_full_reg_offset(s, a->rd),
+                         pred_full_reg_offset(s, a->rn),
+                         size_for_gvec(vl / 8), vl);
+    } else {
+        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
+                           pred_full_reg_offset(s, a->rn),
+                           vl, vl, a->imm, fns[a->esz]);
+    }
+    return true;
+}
+
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
     static gen_helper_gvec_2 * const fns[4][2] = {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index af4fb966bf..3271c9cf78 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -30,6 +30,7 @@
 %size_23        23:2
 %dtype_23_13    23:2 13:2
 %index3_22_19   22:1 19:2
+%index3_22_17   22:1 17:2
 %index3_19_11   19:2 11:1
 %index2_20_11   20:1 11:1
 
@@ -594,6 +595,22 @@ INSR_r          00000101 .. 1 00100 001110 ..... .....          @rdn_rm
 # SVE reverse vector elements
 REV_v           00000101 .. 1 11000 001110 ..... .....          @rd_rn
 
+# SVE move predicate to/from vector
+
+PMOV_pv         00000101 00 101 01 0001110 rn:5 0 rd:4          \
+                &rri_esz esz=0 imm=0
+PMOV_pv         00000101 00 101 1 imm:1 0001110 rn:5 0 rd:4     &rri_esz esz=1
+PMOV_pv         00000101 01 101 imm:2 0001110 rn:5 0 rd:4       &rri_esz esz=2
+PMOV_pv         00000101 1. 101 .. 0001110 rn:5 0 rd:4          \
+                &rri_esz esz=3 imm=%index3_22_17
+
+PMOV_vp         00000101 00 101 01 1001110 0 rn:4 rd:5          \
+                &rri_esz esz=0 imm=0
+PMOV_vp         00000101 00 101 1 imm:1 1001110 0 rn:4 rd:5     &rri_esz esz=1
+PMOV_vp         00000101 01 101 imm:2 1001110 0 rn:4 rd:5       &rri_esz esz=2
+PMOV_vp         00000101 1. 101 .. 1001110 0 rn:4 rd:5          \
+                &rri_esz esz=3 imm=%index3_22_17
+
 # SVE vector table lookup
 TBL             00000101 .. 1 ..... 001100 ..... .....          @rd_rn_rm
 
-- 
2.43.0

