Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1252502dyc;
        Fri, 4 Jul 2025 07:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCcdvCsSADNY6om3ZGg7W7A8PDuLjc5f6uqqpuKKRTS3jCfNVyVYNwM5CaMMvEcrh71ieNMtrJSgoQ3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG6NNpZOlqA67glON1LFwmTqRKiYnpsoq/MYvGwNM2S+VtCwAza6DwSIoXPLJTYtUlLqtZl
X-Received: by 2002:a05:6102:418e:b0:4e7:866c:5cd2 with SMTP id ada2fe7eead31-4f2f1dc3efdmr1674998137.2.1751639212865;
        Fri, 04 Jul 2025 07:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639212; cv=none;
        d=google.com; s=arc-20240605;
        b=AXGO+tFunlPGu5cKDu4G5S57uR0vfMo3mAJow8pUx9tKqgdDfWREKwjWwdIdBCX+YT
         LNJHbouLRbY/8hnCGLTLs+/bXhUwhTUsdhmxOmg2Sighw+kY+BG38Y6XifzNrS3BvSFI
         b1aH5CMKVyMVMbpd3QdfzKlc89H6TAH796BsKYQrJpkDysRgoPpe8TovAWrt+MzRwmCw
         wWsXd4mLJhUUnhnovY5YpAUfal908zugNDo5FiiEC8UOmwPtLWJxMtxHu+fJmdyrHtxv
         zOMr7tDg//FZj1USVyu2v5AZFtILI8Wys4OptvpuYbex06zmo/u91EDwkPIwFc7/N1mG
         UP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QH0REyU8cDnWZTUTJJuh2X01ovEw+r0Jjx8GCuZi1sE=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=K2YEivdtwz4RUx6PzxqBrx476AiioRDXOekdC3lrxvryS8vizeZHydKhBHgIUluVVd
         aYUoM9SfRGRaYU1Br9seb9Mkqh5XVhcCDfqpNDLZuURshSz8s3Ck8Hi4EbJnHVUFdrAB
         WdOAGcSwcqi74SXQYsxuFArQ8SwyvnimoOqLk3mCrk8D7UVgT80zjzvbFN+19ybg8rmh
         vR14nfXrR4aGv0QHt7bqi36keRggkNuONB8Pg1LV9+gOPxKQcJ9QEhUDh162a/wsyqS5
         KaQy/v1VySZoZRs+LHpuCwDCgFes9QCvoc7UtiMWG2YYZsg33Kki04RFAITe3GJUf162
         LqSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YaUTG9Ie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6edc7bsi777089137.381.2025.07.04.07.26.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YaUTG9Ie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhMg-0005DO-MI; Fri, 04 Jul 2025 10:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIQ-0005NZ-UO
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:47 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIP-00062L-5P
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:46 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2ef493de975so780678fac.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638904; x=1752243704; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QH0REyU8cDnWZTUTJJuh2X01ovEw+r0Jjx8GCuZi1sE=;
 b=YaUTG9Ie9EVqaM2xcIA2WFBK2vjBA7B2rny+8vATUyjBTbaEvjpDQqn+jqqyYyuRRq
 U2ANWgidyuyTs8H3X1YAtImHshZGPHbD9K3B23nG/vCs1ruPjxGA8h+AKg4u/ySRNrqt
 M2P0E12PZjPKTHsg2OB/1FBbqDsOK+RB4CxnFHz33Vwtl2uqSCH8aWCbRlnP3HqcC2oE
 NemA1DRqsPWCeHriHRfbnbfenXVOLO+gLqYO6m5RVBop38F1q+gunl9ei/evcuUFOcyI
 BdCs0eNgDAcRvzdEQfPlrYtDpncf4V22cQcgiJoHlG0zBpR5Xm6S1RxnEbNVpcpW+t9s
 HUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638904; x=1752243704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QH0REyU8cDnWZTUTJJuh2X01ovEw+r0Jjx8GCuZi1sE=;
 b=RMD7q2BM5GSgMpLf6Ff9Q1KXHsawmg4h0GbGNpSN1/QEjIpMegN8E4YQAEGzvDgVb/
 X23H+Vh7A+zjsTNBkFoTxop5DLP4/f1XooGC1PaXXh4ch4l2tIV1gEZmWk/LSQ2ceLO6
 pc9yNVUGC8rb0FQTJ5ZsQw/7Gxujlu/JWEXgFGNLZVUilgr3M7jmZlM43k/7JmrgKmKS
 i7JSSYKnKNSA7GTRA6YVKD/ZSHLB9/jAG3okC1BAUc6PRQ8Bx7/F0Zj6sce1+X9nX/dj
 /iZOZeCsfsTrC+z56jDz3GbeiSPqZAltiJIM9v7gNb4+XHMq8cYZO1WvkpSiK/itfmia
 QEUw==
X-Gm-Message-State: AOJu0Yzt6mAj2P5Gn6Ut87Yf/eC9mKF9MlvgX2Na07DspoqB2zPiuDn3
 yaoiK+859wKR7Np2SMfezUaJcY0IyOPqTCdumrE2IDTyx/btdZkoJuTCPrD9Z0WiHB8J7n9xKt3
 CA7FdW74=
X-Gm-Gg: ASbGncvZtbkqXENrqSg6xYVlfr9H2gE9QGi5e8MBmD202JcHCjEYE1jCCiRqSS2DEgY
 56mtSqUwQ1Ac9vp3l9bL/XKDF6ou2B4ufJghc0QXYttwGNyjC2aUk2r0NxxT5Gef5o84G3iPBuJ
 gpFzfVpQJxA2JLEdtVe94WW05SYOwBpfmBGzQhWKQU+GPjw0PQIPrZsKuDd08CdWD1qZjT5eoco
 guS0wgdoRcO9rV9H9/7OOud6G+rSp6tBt5qGWMK4PuRFQw8WrKLygJB6tn/VRNxtMl2qTjY3gVS
 enUklgt0b8tmhQvTPLkCdqqdKVu6AA3Zi/opyBJXGBdH22vz+AXhoMq45ifX0WeyGzcATPcp4yB
 ANlRMP7pu7LOQGDXeUN95xg+KUDHQVU5TMH5kO2nD7MGOTU21AfHn2VDwct4=
X-Received: by 2002:a05:6870:3047:b0:2f3:e087:678d with SMTP id
 586e51a60fabf-2f796c0a2a5mr1500852fac.11.1751638903838; 
 Fri, 04 Jul 2025 07:21:43 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 028/108] target/arm: Implement SME2 SMOPS, UMOPS (2-way)
Date: Fri,  4 Jul 2025 08:19:51 -0600
Message-ID: <20250704142112.1018902-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
X-TUID: 7SN8KqydtLzj

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme.h    |  4 ++++
 target/arm/tcg/sme_helper.c    | 37 +++++++++++++++++++++++++---------
 target/arm/tcg/translate-sme.c |  2 ++
 target/arm/tcg/sme.decode      |  2 ++
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index 17d1a7c102..ecd06f2cd1 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -156,3 +156,7 @@ DEF_HELPER_FLAGS_6(sme_usmopa_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(sme2_bmopa_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme2_smopa2_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sme2_umopa2_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 6122a5b5d9..8ce50653b4 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1261,7 +1261,7 @@ static inline void do_imopa_d(uint64_t *za, uint64_t *zn, uint64_t *zm,
     }
 }
 
-#define DEF_IMOP_32(NAME, NTYPE, MTYPE) \
+#define DEF_IMOP_8x4_32(NAME, NTYPE, MTYPE) \
 static uint32_t NAME(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg) \
 {                                                                           \
     uint32_t sum = 0;                                                       \
@@ -1274,7 +1274,7 @@ static uint32_t NAME(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg) \
     return neg ? a - sum : a + sum;                                         \
 }
 
-#define DEF_IMOP_64(NAME, NTYPE, MTYPE) \
+#define DEF_IMOP_16x4_64(NAME, NTYPE, MTYPE) \
 static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
 {                                                                           \
     uint64_t sum = 0;                                                       \
@@ -1287,15 +1287,15 @@ static uint64_t NAME(uint64_t n, uint64_t m, uint64_t a, uint8_t p, bool neg) \
     return neg ? a - sum : a + sum;                                         \
 }
 
-DEF_IMOP_32(smopa_s, int8_t, int8_t)
-DEF_IMOP_32(umopa_s, uint8_t, uint8_t)
-DEF_IMOP_32(sumopa_s, int8_t, uint8_t)
-DEF_IMOP_32(usmopa_s, uint8_t, int8_t)
+DEF_IMOP_8x4_32(smopa_s, int8_t, int8_t)
+DEF_IMOP_8x4_32(umopa_s, uint8_t, uint8_t)
+DEF_IMOP_8x4_32(sumopa_s, int8_t, uint8_t)
+DEF_IMOP_8x4_32(usmopa_s, uint8_t, int8_t)
 
-DEF_IMOP_64(smopa_d, int16_t, int16_t)
-DEF_IMOP_64(umopa_d, uint16_t, uint16_t)
-DEF_IMOP_64(sumopa_d, int16_t, uint16_t)
-DEF_IMOP_64(usmopa_d, uint16_t, int16_t)
+DEF_IMOP_16x4_64(smopa_d, int16_t, int16_t)
+DEF_IMOP_16x4_64(umopa_d, uint16_t, uint16_t)
+DEF_IMOP_16x4_64(sumopa_d, int16_t, uint16_t)
+DEF_IMOP_16x4_64(usmopa_d, uint16_t, int16_t)
 
 #define DEF_IMOPH(P, NAME, S) \
     void HELPER(P##_##NAME##_##S)(void *vza, void *vzn, void *vzm,          \
@@ -1325,3 +1325,20 @@ static uint32_t bmopa_s(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg)
 }
 
 DEF_IMOPH(sme2, bmopa, s)
+
+#define DEF_IMOP_16x2_32(NAME, NTYPE, MTYPE) \
+static uint32_t NAME(uint32_t n, uint32_t m, uint32_t a, uint8_t p, bool neg) \
+{                                                                           \
+    uint32_t sum = 0;                                                       \
+    /* Apply P to N as a mask, making the inactive elements 0. */           \
+    n &= expand_pred_h(p);                                                  \
+    sum += (NTYPE)(n >> 0) * (MTYPE)(m >> 0);                               \
+    sum += (NTYPE)(n >> 16) * (MTYPE)(m >> 16);                             \
+    return neg ? a - sum : a + sum;                                         \
+}
+
+DEF_IMOP_16x2_32(smopa2_s, int16_t, int16_t)
+DEF_IMOP_16x2_32(umopa2_s, uint16_t, uint16_t)
+
+DEF_IMOPH(sme2, smopa2, s)
+DEF_IMOPH(sme2, umopa2, s)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index c2615f06ae..0a863a50bf 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -541,3 +541,5 @@ TRANS_FEAT(SUMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_sumop
 TRANS_FEAT(USMOPA_d, aa64_sme_i16i64, do_outprod, a, MO_64, gen_helper_sme_usmopa_d)
 
 TRANS_FEAT(BMOPA, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_bmopa_s)
+TRANS_FEAT(SMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_smopa2_s)
+TRANS_FEAT(UMOPA2_s, aa64_sme2, do_outprod, a, MO_32, gen_helper_sme2_umopa2_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index de8d04cb87..36f369d02a 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -167,3 +167,5 @@ USMOPA_d        1010000 1 11 0 ..... ... ... ..... . 0 ...      @op_64
 UMOPA_d         1010000 1 11 1 ..... ... ... ..... . 0 ...      @op_64
 
 BMOPA           1000000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
+SMOPA2_s        1010000 0 10 0 ..... ... ... ..... . 10 ..      @op_32
+UMOPA2_s        1010000 1 10 0 ..... ... ... ..... . 10 ..      @op_32
-- 
2.43.0

