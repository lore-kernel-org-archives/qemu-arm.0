Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp556994ejb;
        Thu, 22 Jun 2023 09:21:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7PtOXUzTDHqVWREM/L0W0F1mUoY70hfEIOPmQTAhVWtCVm9srWEIHcRf2qLl1ZuyvvNwkM
X-Received: by 2002:aca:1c1a:0:b0:3a0:5a28:c51f with SMTP id c26-20020aca1c1a000000b003a05a28c51fmr2552562oic.44.1687450881599;
        Thu, 22 Jun 2023 09:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687450881; cv=none;
        d=google.com; s=arc-20160816;
        b=MC0h+PL8LKcbnCY26TeXIvM8wEPi+sJDP0umXjl62xt97pwyt3VQJtsW5rmeE42Bxj
         /BoI6KmjFPsQQQ76NSvnpIKA6v3BtQjgicgdgYaNDMsk6mRwilNdUzL0IeVkKbUNIzr6
         fIiRXMKqjk4VGZZYOfBAcnfGww6aR0e93oiR29eJoaOdUcj+Wjo1ZOirPmFtewCdceOO
         M3hnFFNUpIA3XTHm/GjM+kATPUIQPAVP/3w4RDskr/ak301L6fRky2gOzHP3ofFPtN8Y
         p3t6ty69pletlFP6r0VFTtW1P5FTplaw3+ykIgrGDRhcy/vXsW8gqYYhKO9OI4eP7a6r
         olrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5EdDN+KecjH+W/bjTNWjdWHVlQ3BFHGeOB5Edh+tsFE=;
        b=mHQ5W/S5c8hXBObZaGl8oQqFznCGeR1jxZGyGpi867PFjxB5KfVlT1MS5IckfgYj9i
         P9w9avZhAQm2KJJQix9dNMqKrf3R0YrCoZ6NiO/89v9lhdHkpwmfF95PPpqyAEJlmv1o
         IEwvncQpWuGPq96fRwzvKKosZqGZYWNk4aUEoL4Wz6dOna5M8R+OURqaEA3GsB+Zv82/
         3dEb3Q+Gr5tzyr9M5dyABNhiD7kSUnLEvBwHULaqK04UaNAcIDpuA/rIu+awrN+3sRnN
         ZG9BRyuV/EWgPXcw4H4wMH9ood9xZfLzVc3IFY88HVr/HJF/kPBqwGo89TE/O3xyzXyA
         di2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=LF5Q0GNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020ac87f48000000b003f527a0b2a7si2716081qtk.784.2023.06.22.09.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jun 2023 09:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=LF5Q0GNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCN1I-0003ef-Hu; Thu, 22 Jun 2023 12:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN1C-0003Mv-Sr
 for qemu-devel@nongnu.org; Thu, 22 Jun 2023 12:18:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qCN1A-00069A-5J
 for qemu-devel@nongnu.org; Thu, 22 Jun 2023 12:18:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1b52bf6e669so57494635ad.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jun 2023 09:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687450722; x=1690042722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EdDN+KecjH+W/bjTNWjdWHVlQ3BFHGeOB5Edh+tsFE=;
 b=LF5Q0GNCup3H5Tn+kQTWafzXlsKG7fnn3ryqxswS/mLmURxCqN7ehXyyd/WSQlMm3r
 wg4M3SqL+hs+gb//Kk8uNRw2xWO4g9ugmQ8Yp9ZcrQMWhwUdP2rIHjlDSj/3jWuG0URg
 oVdHYPU356CnArsZrIjQc9gC2U10tyMUgerJUq46ZLO1kqg6f/MxE1V3tUw2sFZC0r7y
 2ResoKbEWErcUXjof2Dz/ZMGq0z9yNTRZEZOxWsQkBzpv03IihM5e0L/ikc27nw3Mfrp
 bfOYQmPfGpq6V1fcgTmDXHlXShuIBvVfV4DLvn605TitHnoGsDPxdKvoUnSBaz2tKuCJ
 BqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687450722; x=1690042722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5EdDN+KecjH+W/bjTNWjdWHVlQ3BFHGeOB5Edh+tsFE=;
 b=DmRjkjhRlSskR9Y0GYvXvkX1hATMAJax4pq20F4wMLZfT8BH77+NYcI4GljaCEC0WX
 Ygnq18P3mTE6bd1E9eo41Yi2HWdh/ALKxpHvKmh/JoOKAutyQJUVXdNl/nHdCbeNw2MK
 XbCeyKPrV6NCu6n/007/zDaZSRsxFSGMIhbDREtMhJqOnIXgbQhTWbNh9jCecBacbiKf
 YCrA8ahF63U2bHnzUs7HR8wi+qsii4neFu7urVHf6rmNKjYyGz6exo14Z0X4axrFZz0G
 X+LEH0BhHpgMuaNQEwQT6TYvctFFWdXc3H8TYEFt/3i22q1hg7TR4544qgBHYoIyC7jQ
 wYHw==
X-Gm-Message-State: AC+VfDyeaaB3NHZOyUKaaPhhpVXjXcgpu7VVS2BVUuT1iYfD7pfubzvN
 t9ghQeqXnq7Dl9V1o+dLXEudmiMADEZPAJEVJwIF/sokimHX4BfEICZ4DV8J5gPV1o1X3DfXvbm
 oX35jzyZltLdcseNVRUV8b3QZGDxKmRZfEKNm/YqeFMgh7K7pOtgTCWdPY39KvSQNWSp6zx8H9t
 Bz
X-Received: by 2002:a17:902:d38d:b0:1b1:9f7d:2aec with SMTP id
 e13-20020a170902d38d00b001b19f7d2aecmr17580654pld.68.1687450722579; 
 Thu, 22 Jun 2023 09:18:42 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170902d48100b001b3f039f8a8sm5609683plg.61.2023.06.22.09.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 09:18:42 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 14/17] crypto: Create sm4_subword
Date: Fri, 23 Jun 2023 00:16:30 +0800
Message-Id: <20230622161646.32005-15-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230622161646.32005-1-max.chou@sifive.com>
References: <20230622161646.32005-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=max.chou@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hkkbUDy2ik/h

Allows sharing of sm4_subword between different targets.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 include/crypto/sm4.h           |  8 ++++++++
 target/arm/tcg/crypto_helper.c | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
index 9bd3ebc62e..de8245d8a7 100644
--- a/include/crypto/sm4.h
+++ b/include/crypto/sm4.h
@@ -3,4 +3,12 @@
 
 extern const uint8_t sm4_sbox[256];
 
+static inline uint32_t sm4_subword(uint32_t word)
+{
+    return sm4_sbox[word & 0xff] |
+           sm4_sbox[(word >> 8) & 0xff] << 8 |
+           sm4_sbox[(word >> 16) & 0xff] << 16 |
+           sm4_sbox[(word >> 24) & 0xff] << 24;
+}
+
 #endif
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d28690321f..58e6c4f779 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -707,10 +707,7 @@ static void do_crypto_sm4e(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(n, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 2) ^ rol32(t, 10) ^ rol32(t, 18) ^
                             rol32(t, 24);
@@ -744,10 +741,7 @@ static void do_crypto_sm4ekey(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(m, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 13) ^ rol32(t, 23);
     }
-- 
2.31.1

