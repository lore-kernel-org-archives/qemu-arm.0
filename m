Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1142671njb;
        Sat, 1 Feb 2025 08:42:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoQO/vPQw0E8IpuJ6tYrHPtRADGiW1AraunCa7Xg6Vcl0BXMXJPqS1wLIBTY1UKNen6pbazVc8z2d2NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFv1UouTHS4ffzvN2OL7Eeuvv/ttiUq6qiR+H+GgOZ/R61piTHMlKWBnP9s2IB6kopBCpiy
X-Received: by 2002:a05:6214:19eb:b0:6d4:1e43:f3a5 with SMTP id 6a1803df08f44-6e243c15524mr213257286d6.13.1738428140781;
        Sat, 01 Feb 2025 08:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428140; cv=none;
        d=google.com; s=arc-20240605;
        b=jatoahz93Xe4Ee4i47aDAEzId29g/IqKCSst2BXkr59ay7PAk4P9L6Weach4JS03Tq
         /W9xcjXnScAyg18XgNWW4HcNbxfzqblHNR/FeNsT6eLqE1nxAKKNfCNVQpB5oA5CpqkI
         iPmWsIiMUNJICf6VvMRBFAW67wJ+NjqcIHEO5ifecg3uakN1pF9lvnMrAofTnJ4eUvNQ
         isJAy/NsUiEJDEvCnntHK1yVlIzZkkUwjjTtSTQKJIkOa+e5IUAC8ia56zipwFD9Nk33
         m4/VA055VxLx9M8ZG6/2/4B3bQJ/MkB0BY3ME9WdXAtSsGOqAaqGytH8GpBqCRgHKJOU
         LgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OWU/PlXSyEzT9phV28MmmzHlFyTyrUZHww5V+yN3G6E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=i1Ukmdvk2cKfUYe9AsBFbu0DmRtzIMdXs3RNBUt3CVGaqnW/2zu/PqqXrvWtZnLaK2
         998w+PTpfNyZpztNNpJdoJ+tc3Tj05/4HR5rSFHLhbdAH9V2ck5l3o3tapPMkeiiGZtU
         x6dfwPZF04lxhxEefbdXv95+rIqtwUX0Csk5VBpDaP8vdsMd+IrqYLyOCjioA3G4ilEA
         6PodF/IwVfJz5Ff3kXRPGR0N2i41AfDeQZ8CiImDiieNTJlPgFHMPvHR2VJ/fjqPHZEF
         9UEzfwZLr4lD+zBTPUBJEdZlYa2Lua76xp53panCdMkgwXm1l+/uCYf4b+Jr++o5+TGi
         lUBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXnvWQpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549e3cbcsi56888346d6.490.2025.02.01.08.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lXnvWQpB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYw-0007ff-Ei; Sat, 01 Feb 2025 11:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYd-0007JJ-KQ
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:23 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYb-0001JL-Mk
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e06af753so1533216f8f.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428080; x=1739032880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OWU/PlXSyEzT9phV28MmmzHlFyTyrUZHww5V+yN3G6E=;
 b=lXnvWQpB7EsQAL49ODDDdeIt07/IAPtv4zrS1lgNjvu0zMdz6VF/qmxE7RP/dwXXGC
 lKnT8FUXyYc1s/ic3EgqzBlaEIOknVegKxU1m1LmpbT3BZZPEBzfR0WIahc/tAWD8FxG
 PSWoiPz+Yi3kNsudl/WuXYWtbMtgn6D/UWHUwL31p9fukYuVbjSvakMOimj7HFSEwR1G
 1oPjjjjwcCAb1oyGoIJxhvCRzQpMg75yrK9pC10NgAq66+MSUkfWpuc2i3jtRTXiYUkz
 pCCz2fv1cwOHdSXr9xNT17xgiok55d9WHSfefEhnFgw1xmhT6Mx6Wm0BNAAHkW7Cjg+X
 9kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428080; x=1739032880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWU/PlXSyEzT9phV28MmmzHlFyTyrUZHww5V+yN3G6E=;
 b=NuRQj5gfavUhMcqFkVUBS+3hIa5peqZsFyJJ2JHM2TXSmsXK+w1h623x9E+W4M0JoJ
 T48c1WfkTgwO5tKldwGJVZWjzMVLcfWc4YCuxhgCK3FqTMH6RIV+m3/Ax5x/YyRLL/TD
 eq2qhjsuFf3Yc3AsENRlcgSIj3eZw3mWpIOvIkv7UNRi1iuGpSjMx+tpeA/Kud8cIICN
 aFOwyZPppMqQQOhH7IRQ47PzWUkIwRJrJ4NT5j2ZX4lA3l/lmc88xNYQ03WpfH3VPVVJ
 i7iTIAceDS8oofktW4AtHPSEJ994pCbNtnoQjBOt9wNXyJY2vRReXGkbrTvxKtvUjx1j
 61KA==
X-Gm-Message-State: AOJu0YxJyaRhnZHf3XJTLcH9PAyUzU1hX3k04FwLpNx319UQm7rH8OwG
 8R+2bvd0ONwe87U7fbsRzsTbTi07wyWCmsfE/n2nEJhiqgsXUfbksanMqqIhFP1EQxDTBqACwmm
 4
X-Gm-Gg: ASbGncsMzmuNng1Y8/100EnPww3eH/A7RxPsHCUs3dGYLtRXgOnBMpA9P4Ny75zQl5y
 YsA8vyMdJsGKuIYju1t/ou2T3jVixAgrMxU2jwutDgpYT+lb3f0Jfi1ch2EQ/Gt+S+e7SXN6Jf6
 ecg+LMnIKBG7wAWKOiAjFMXsUxQeO+v1ORiuBfx3MZCLifbBnh+Zt1d0FLoJUjakHk9TTXIK02a
 qThMeFLzlvd+I83YdPHJL5QtumFCBn3BxNhUAsOfF2bxDHvnKtfpHUpSLMEKrMvwBWWndcc4mLV
 rRFKqO0thyYGT4wsytga
X-Received: by 2002:a05:6000:1567:b0:38c:5bb2:b928 with SMTP id
 ffacd0b85a97d-38c5bb2bd44mr7951163f8f.20.1738428080015; 
 Sat, 01 Feb 2025 08:41:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 50/69] target/arm: Handle FPCR.AH in SVE FMLSL (indexed)
Date: Sat,  1 Feb 2025 16:39:53 +0000
Message-Id: <20250201164012.1660228-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: m2fErWFcdthQ

From: Richard Henderson <richard.henderson@linaro.org>

Handle FPCR.AH's requirement to not negate the sign of a NaN in SVE
FMLSL (indexed), using the usual trick of negating by XOR when AH=0
and by muladd flags when AH=1.

Since we have the CPUARMState* in the helper anyway, we can
look directly at env->vfp.fpcr and don't need toa pass in the
FPCR.AH value via the SIMD data word.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20250129013857.135256-32-richard.henderson@linaro.org
[PMM: commit message tweaked]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/vec_helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 5f0656f34ca..42bb43acd78 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2250,23 +2250,32 @@ void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
                                CPUARMState *env, uint32_t desc)
 {
     intptr_t i, j, oprsz = simd_oprsz(desc);
-    uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
+    bool is_s = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
     intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
     float_status *status = &env->vfp.fp_status_a64;
     bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16_a64);
+    int negx = 0, negf = 0;
+
+    if (is_s) {
+        if (env->vfp.fpcr & FPCR_AH) {
+            negf = float_muladd_negate_product;
+        } else {
+            negx = 0x8000;
+        }
+    }
 
     for (i = 0; i < oprsz; i += 16) {
         float16 mm_16 = *(float16 *)(vm + i + idx);
         float32 mm = float16_to_float32_by_bits(mm_16, fz16);
 
         for (j = 0; j < 16; j += sizeof(float32)) {
-            float16 nn_16 = *(float16 *)(vn + H1_2(i + j + sel)) ^ negn;
+            float16 nn_16 = *(float16 *)(vn + H1_2(i + j + sel)) ^ negx;
             float32 nn = float16_to_float32_by_bits(nn_16, fz16);
             float32 aa = *(float32 *)(va + H1_4(i + j));
 
             *(float32 *)(vd + H1_4(i + j)) =
-                float32_muladd(nn, mm, aa, 0, status);
+                float32_muladd(nn, mm, aa, negf, status);
         }
     }
 }
-- 
2.34.1

