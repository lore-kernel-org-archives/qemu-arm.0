Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3787336dye;
        Wed, 2 Jul 2025 05:51:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxZLPOv4cLArHGCw0EYHb+sX4QESIxekCGvevfapbzFYbb9Im4DEo9YUlm2ScMDoQ2AIXxdynjybl9Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IEPOuhlygg/urTaLiU2KAE6QdGwvqtbIsOgEfKIE08n8bCh0CXUXVit/+QSYM9idtCwAaom
X-Received: by 2002:a05:6214:320a:b0:6fb:265:a2c3 with SMTP id 6a1803df08f44-702b20c5dbemr24852336d6.17.1751460682632;
        Wed, 02 Jul 2025 05:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460682; cv=none;
        d=google.com; s=arc-20240605;
        b=gMHATwTLEjLE6Wt5BE8QMrSKEzzGpo2CQVpXgmmeZqn/Fyy4ANpyjytU3b/F4e0Ihs
         z3orxbuWWq3WGWn0THrS9af2sKKxYVWeN8o3ruwD5g8N4MmVb8doH9gYjvUQAedB/Nad
         fxZuyJ7DLnyeyLNKkz0GioS2wHSeSrc+NsnDdQGV2epAaycl2ih1Flsf78yTRsHQjuHu
         jk2elv2TQdkyDFvtJhbFAYok07J2bkd8TbQCRidEYw4rgQenDLgFII9Bi3CNMYMTfog7
         qeeF312NtCigjEFOgzRyPDAn+d/kHT4P6HeSIIdr3e7+9B3+TsVZVEET3ycl47P7fXrZ
         72NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=E9dHQdWY2Kt40Yfi3OCpB/B/ypkV8MGWrOiB+MA3QFU=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=QQsZg20AEn+sWeErbRTRSdlMqT9SGJY2Tg6crwHJ2X1q6YiA8faDgJlnrklhd5Ubw3
         DpQeTS+/LEBjaM3+kd0e8VrJZcr9Kv6NT9Y8gCkf9vkCnR/w7u1m5yBQLp2epk0aT+2p
         vMp/mtbXOFfE2HVE/5KtLIGHQnTRQP1IP6lytdAD03/QW+EMHCsIHL93io5rYmBnnazu
         Bsb5gmXSJaVPNX6G+l+/jD/2zTVgWPv5/hwjPHzl2EzIIysgN5P78WtX5YIgZFhFKKZe
         jRGcLeDfptImziEjcw+bD98fhfQQSFcqBnYQ9ZeukzZsutIlx/qeealoo+pUv+ZeYThY
         fWjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9DYWGtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77288ecbsi151885276d6.49.2025.07.02.05.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9DYWGtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwmD-0007e7-Rv; Wed, 02 Jul 2025 08:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjH-0004Ha-Cx
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:28 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj9-00023j-CN
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:22 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2ea65f5a0easo3851296fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459893; x=1752064693; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9dHQdWY2Kt40Yfi3OCpB/B/ypkV8MGWrOiB+MA3QFU=;
 b=e9DYWGtCi/O5rgJtFWGL4uhk/cM+eRrNsBCfpshpfqBy/Lj0MAwPB601ApRNQF9+Sy
 rPF1KrHGzPdNnf9KVCAQGQoAajCxmtPRGjB1hVqAUtroeMBlOYTEdFDLQK1SrANM/QsR
 pjeHmikHtNK0Q2jSF27apv38N/TrMGorO3JsjiYYz/6CIdXuAmhNTKoYNyTDGeCEDY3G
 npneTMjRg+X2+4gCLrNVc/N9vwn1XGWtwlKMW7W94o66ALFGBgkUIvsBaJdjKVmme03T
 HE7o7y1VILhEbnV+8CsOus81stVNraT1JCSdRakc8hJ43VFf12eAatoAvniEeVUj+htv
 rrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459893; x=1752064693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9dHQdWY2Kt40Yfi3OCpB/B/ypkV8MGWrOiB+MA3QFU=;
 b=Spk5s3Y2jRpGYpLBa9EHQhowg5EvxFnTDI+rJzZGcmcRJWEjn3/HqEHvSUlCBx5W6N
 50Iki56zi1aki94GH/CDou1UCSGYysqM3V+QJHcPQPFTFgHIjmNXRpE/qyEcFIbSjzpU
 KeswAA632zVKtraYirpkUwGAePO9Ow0iXkhnBsYmI2ylSqcSGQQMJxVsuo8HiMMxwd6D
 AUYe1l29dchXQPICq8JsafVJY8rNLYMVMwhdox9ROL097dzlf/QaujV5cBMUI1FG0s93
 r4IOCNo3vHMgGT47Ai23WhUzN7kzbgdr/hJWMWihHQwho90IHnie++k1h2yObTeARajt
 FYpQ==
X-Gm-Message-State: AOJu0YwkgPQZVjOhB5GBcfWOCZ+2HNaijYw4eiTBlPHYbgNNZRdGgVgh
 2kikCPWmUnMSEt0XEwaifc2N4j6rzBagR5kUX1CT1rXa33HDbuSQvLic5zAIrwih6uXyrgr/tDf
 ySlPtmlI=
X-Gm-Gg: ASbGncvsCnX5uAG2yzSVVM6ObS5MRhDunM3q7RkYEyezKSmZ9FREJr3kPLvLUzscS3e
 EBuRaKzNKK5S3u0AW/g2sEoi7NYxXzxyl6uxyOHzSIX66XD0MPqNICl95P6jEkyICSLvRCmOYei
 tg3qWGgz9n7I/4b6DdTi+eRWbx+TwKUZqvRDmvJX5dWPCVpytnO42oj4/oYj6OyV2qU0nFdywNC
 t/OIxPGhfZGL8jQaZCE62O/pJzAju6nGAbF3x/lqPVgIijc5rbRp4CiMrjGE2V4vLAbJi73XXzu
 QIpefFoBc2nMprbcqjnDHmlTQ8pb9GBTGbcAxyD6lQpZBMs6XiZPj/7Kv+WahVbnE6bLOA==
X-Received: by 2002:a05:6870:88a5:b0:2b8:b76f:1196 with SMTP id
 586e51a60fabf-2f66499dd2cmr1817123fac.19.1751459892893; 
 Wed, 02 Jul 2025 05:38:12 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 48/97] target/arm: Use do_[us]sat_[bhs] in sve_helper.c
Date: Wed,  2 Jul 2025 06:33:21 -0600
Message-ID: <20250702123410.761208-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
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
X-TUID: CNY4leRIaD5d

Replace and remove do_sat_bhs.
This avoids multiple repetitions of INT*_MIN/MAX.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 116 +++++++++++++++---------------------
 1 file changed, 48 insertions(+), 68 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 4f12723afe..f9052f2164 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -527,14 +527,9 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
 DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
 DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 
-static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
-{
-    return val >= max ? max : val <= min ? min : val;
-}
-
-#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
-#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
-#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
+#define DO_SQADD_B(n, m) do_ssat_b((int64_t)n + m)
+#define DO_SQADD_H(n, m) do_ssat_h((int64_t)n + m)
+#define DO_SQADD_S(n, m) do_ssat_s((int64_t)n + m)
 
 static inline int64_t do_sqadd_d(int64_t n, int64_t m)
 {
@@ -551,9 +546,9 @@ DO_ZPZZ(sve2_sqadd_zpzz_h, int16_t, H1_2, DO_SQADD_H)
 DO_ZPZZ(sve2_sqadd_zpzz_s, int32_t, H1_4, DO_SQADD_S)
 DO_ZPZZ_D(sve2_sqadd_zpzz_d, int64_t, do_sqadd_d)
 
-#define DO_UQADD_B(n, m) do_sat_bhs((int64_t)n + m, 0, UINT8_MAX)
-#define DO_UQADD_H(n, m) do_sat_bhs((int64_t)n + m, 0, UINT16_MAX)
-#define DO_UQADD_S(n, m) do_sat_bhs((int64_t)n + m, 0, UINT32_MAX)
+#define DO_UQADD_B(n, m) do_usat_b((int64_t)n + m)
+#define DO_UQADD_H(n, m) do_usat_h((int64_t)n + m)
+#define DO_UQADD_S(n, m) do_usat_s((int64_t)n + m)
 
 static inline uint64_t do_uqadd_d(uint64_t n, uint64_t m)
 {
@@ -566,9 +561,9 @@ DO_ZPZZ(sve2_uqadd_zpzz_h, uint16_t, H1_2, DO_UQADD_H)
 DO_ZPZZ(sve2_uqadd_zpzz_s, uint32_t, H1_4, DO_UQADD_S)
 DO_ZPZZ_D(sve2_uqadd_zpzz_d, uint64_t, do_uqadd_d)
 
-#define DO_SQSUB_B(n, m) do_sat_bhs((int64_t)n - m, INT8_MIN, INT8_MAX)
-#define DO_SQSUB_H(n, m) do_sat_bhs((int64_t)n - m, INT16_MIN, INT16_MAX)
-#define DO_SQSUB_S(n, m) do_sat_bhs((int64_t)n - m, INT32_MIN, INT32_MAX)
+#define DO_SQSUB_B(n, m) do_ssat_b((int64_t)n - m)
+#define DO_SQSUB_H(n, m) do_ssat_h((int64_t)n - m)
+#define DO_SQSUB_S(n, m) do_ssat_s((int64_t)n - m)
 
 static inline int64_t do_sqsub_d(int64_t n, int64_t m)
 {
@@ -585,9 +580,9 @@ DO_ZPZZ(sve2_sqsub_zpzz_h, int16_t, H1_2, DO_SQSUB_H)
 DO_ZPZZ(sve2_sqsub_zpzz_s, int32_t, H1_4, DO_SQSUB_S)
 DO_ZPZZ_D(sve2_sqsub_zpzz_d, int64_t, do_sqsub_d)
 
-#define DO_UQSUB_B(n, m) do_sat_bhs((int64_t)n - m, 0, UINT8_MAX)
-#define DO_UQSUB_H(n, m) do_sat_bhs((int64_t)n - m, 0, UINT16_MAX)
-#define DO_UQSUB_S(n, m) do_sat_bhs((int64_t)n - m, 0, UINT32_MAX)
+#define DO_UQSUB_B(n, m) do_usat_b((int64_t)n - m)
+#define DO_UQSUB_H(n, m) do_usat_h((int64_t)n - m)
+#define DO_UQSUB_S(n, m) do_usat_s((int64_t)n - m)
 
 static inline uint64_t do_uqsub_d(uint64_t n, uint64_t m)
 {
@@ -599,12 +594,9 @@ DO_ZPZZ(sve2_uqsub_zpzz_h, uint16_t, H1_2, DO_UQSUB_H)
 DO_ZPZZ(sve2_uqsub_zpzz_s, uint32_t, H1_4, DO_UQSUB_S)
 DO_ZPZZ_D(sve2_uqsub_zpzz_d, uint64_t, do_uqsub_d)
 
-#define DO_SUQADD_B(n, m) \
-    do_sat_bhs((int64_t)(int8_t)n + m, INT8_MIN, INT8_MAX)
-#define DO_SUQADD_H(n, m) \
-    do_sat_bhs((int64_t)(int16_t)n + m, INT16_MIN, INT16_MAX)
-#define DO_SUQADD_S(n, m) \
-    do_sat_bhs((int64_t)(int32_t)n + m, INT32_MIN, INT32_MAX)
+#define DO_SUQADD_B(n, m) do_ssat_b((int64_t)(int8_t)n + m)
+#define DO_SUQADD_H(n, m) do_ssat_h((int64_t)(int16_t)n + m)
+#define DO_SUQADD_S(n, m) do_ssat_s((int64_t)(int32_t)n + m)
 
 static inline int64_t do_suqadd_d(int64_t n, uint64_t m)
 {
@@ -634,12 +626,9 @@ DO_ZPZZ(sve2_suqadd_zpzz_h, uint16_t, H1_2, DO_SUQADD_H)
 DO_ZPZZ(sve2_suqadd_zpzz_s, uint32_t, H1_4, DO_SUQADD_S)
 DO_ZPZZ_D(sve2_suqadd_zpzz_d, uint64_t, do_suqadd_d)
 
-#define DO_USQADD_B(n, m) \
-    do_sat_bhs((int64_t)n + (int8_t)m, 0, UINT8_MAX)
-#define DO_USQADD_H(n, m) \
-    do_sat_bhs((int64_t)n + (int16_t)m, 0, UINT16_MAX)
-#define DO_USQADD_S(n, m) \
-    do_sat_bhs((int64_t)n + (int32_t)m, 0, UINT32_MAX)
+#define DO_USQADD_B(n, m) do_usat_b((int64_t)n + (int8_t)m)
+#define DO_USQADD_H(n, m) do_usat_h((int64_t)n + (int16_t)m)
+#define DO_USQADD_S(n, m) do_usat_s((int64_t)n + (int32_t)m)
 
 static inline uint64_t do_usqadd_d(uint64_t n, int64_t m)
 {
@@ -1226,37 +1215,29 @@ void HELPER(NAME)(void *vd, void *vn, uint32_t desc)                    \
     }                                                                   \
 }
 
-#define DO_SQXTN_H(n)  do_sat_bhs(n, INT8_MIN, INT8_MAX)
-#define DO_SQXTN_S(n)  do_sat_bhs(n, INT16_MIN, INT16_MAX)
-#define DO_SQXTN_D(n)  do_sat_bhs(n, INT32_MIN, INT32_MAX)
+DO_XTNB(sve2_sqxtnb_h, int16_t, do_ssat_b)
+DO_XTNB(sve2_sqxtnb_s, int32_t, do_ssat_h)
+DO_XTNB(sve2_sqxtnb_d, int64_t, do_ssat_s)
 
-DO_XTNB(sve2_sqxtnb_h, int16_t, DO_SQXTN_H)
-DO_XTNB(sve2_sqxtnb_s, int32_t, DO_SQXTN_S)
-DO_XTNB(sve2_sqxtnb_d, int64_t, DO_SQXTN_D)
+DO_XTNT(sve2_sqxtnt_h, int16_t, int8_t, H1, do_ssat_b)
+DO_XTNT(sve2_sqxtnt_s, int32_t, int16_t, H1_2, do_ssat_h)
+DO_XTNT(sve2_sqxtnt_d, int64_t, int32_t, H1_4, do_ssat_s)
 
-DO_XTNT(sve2_sqxtnt_h, int16_t, int8_t, H1, DO_SQXTN_H)
-DO_XTNT(sve2_sqxtnt_s, int32_t, int16_t, H1_2, DO_SQXTN_S)
-DO_XTNT(sve2_sqxtnt_d, int64_t, int32_t, H1_4, DO_SQXTN_D)
+DO_XTNB(sve2_uqxtnb_h, uint16_t, do_usat_b)
+DO_XTNB(sve2_uqxtnb_s, uint32_t, do_usat_h)
+DO_XTNB(sve2_uqxtnb_d, uint64_t, do_usat_s)
 
-#define DO_UQXTN_H(n)  do_sat_bhs(n, 0, UINT8_MAX)
-#define DO_UQXTN_S(n)  do_sat_bhs(n, 0, UINT16_MAX)
-#define DO_UQXTN_D(n)  do_sat_bhs(n, 0, UINT32_MAX)
+DO_XTNT(sve2_uqxtnt_h, uint16_t, uint8_t, H1, do_usat_b)
+DO_XTNT(sve2_uqxtnt_s, uint32_t, uint16_t, H1_2, do_usat_h)
+DO_XTNT(sve2_uqxtnt_d, uint64_t, uint32_t, H1_4, do_usat_s)
 
-DO_XTNB(sve2_uqxtnb_h, uint16_t, DO_UQXTN_H)
-DO_XTNB(sve2_uqxtnb_s, uint32_t, DO_UQXTN_S)
-DO_XTNB(sve2_uqxtnb_d, uint64_t, DO_UQXTN_D)
+DO_XTNB(sve2_sqxtunb_h, int16_t, do_usat_b)
+DO_XTNB(sve2_sqxtunb_s, int32_t, do_usat_h)
+DO_XTNB(sve2_sqxtunb_d, int64_t, do_usat_s)
 
-DO_XTNT(sve2_uqxtnt_h, uint16_t, uint8_t, H1, DO_UQXTN_H)
-DO_XTNT(sve2_uqxtnt_s, uint32_t, uint16_t, H1_2, DO_UQXTN_S)
-DO_XTNT(sve2_uqxtnt_d, uint64_t, uint32_t, H1_4, DO_UQXTN_D)
-
-DO_XTNB(sve2_sqxtunb_h, int16_t, DO_UQXTN_H)
-DO_XTNB(sve2_sqxtunb_s, int32_t, DO_UQXTN_S)
-DO_XTNB(sve2_sqxtunb_d, int64_t, DO_UQXTN_D)
-
-DO_XTNT(sve2_sqxtunt_h, int16_t, int8_t, H1, DO_UQXTN_H)
-DO_XTNT(sve2_sqxtunt_s, int32_t, int16_t, H1_2, DO_UQXTN_S)
-DO_XTNT(sve2_sqxtunt_d, int64_t, int32_t, H1_4, DO_UQXTN_D)
+DO_XTNT(sve2_sqxtunt_h, int16_t, int8_t, H1, do_usat_b)
+DO_XTNT(sve2_sqxtunt_s, int32_t, int16_t, H1_2, do_usat_h)
+DO_XTNT(sve2_sqxtunt_d, int64_t, int32_t, H1_4, do_usat_s)
 
 #undef DO_XTNB
 #undef DO_XTNT
@@ -2187,10 +2168,9 @@ DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
 DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
 DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t, H1_8, H1_4, do_urshr)
 
-#define DO_SQSHRUN_H(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT8_MAX)
-#define DO_SQSHRUN_S(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT16_MAX)
-#define DO_SQSHRUN_D(x, sh) \
-    do_sat_bhs((int64_t)(x) >> (sh < 64 ? sh : 63), 0, UINT32_MAX)
+#define DO_SQSHRUN_H(x, sh) do_usat_b((int64_t)(x) >> sh)
+#define DO_SQSHRUN_S(x, sh) do_usat_h((int64_t)(x) >> sh)
+#define DO_SQSHRUN_D(x, sh) do_usat_s((int64_t)(x) >> (sh < 64 ? sh : 63))
 
 DO_SHRNB(sve2_sqshrunb_h, int16_t, uint8_t, DO_SQSHRUN_H)
 DO_SHRNB(sve2_sqshrunb_s, int32_t, uint16_t, DO_SQSHRUN_S)
@@ -2200,9 +2180,9 @@ DO_SHRNT(sve2_sqshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRUN_H)
 DO_SHRNT(sve2_sqshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRUN_S)
 DO_SHRNT(sve2_sqshrunt_d, int64_t, uint32_t, H1_8, H1_4, DO_SQSHRUN_D)
 
-#define DO_SQRSHRUN_H(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT8_MAX)
-#define DO_SQRSHRUN_S(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT16_MAX)
-#define DO_SQRSHRUN_D(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT32_MAX)
+#define DO_SQRSHRUN_H(x, sh) do_usat_b(do_srshr(x, sh))
+#define DO_SQRSHRUN_S(x, sh) do_usat_h(do_srshr(x, sh))
+#define DO_SQRSHRUN_D(x, sh) do_usat_s(do_srshr(x, sh))
 
 DO_SHRNB(sve2_sqrshrunb_h, int16_t, uint8_t, DO_SQRSHRUN_H)
 DO_SHRNB(sve2_sqrshrunb_s, int32_t, uint16_t, DO_SQRSHRUN_S)
@@ -2212,9 +2192,9 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
 DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
 DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t, H1_8, H1_4, DO_SQRSHRUN_D)
 
-#define DO_SQSHRN_H(x, sh) do_sat_bhs(x >> sh, INT8_MIN, INT8_MAX)
-#define DO_SQSHRN_S(x, sh) do_sat_bhs(x >> sh, INT16_MIN, INT16_MAX)
-#define DO_SQSHRN_D(x, sh) do_sat_bhs(x >> sh, INT32_MIN, INT32_MAX)
+#define DO_SQSHRN_H(x, sh) do_ssat_b(x >> sh)
+#define DO_SQSHRN_S(x, sh) do_ssat_h(x >> sh)
+#define DO_SQSHRN_D(x, sh) do_ssat_s(x >> sh)
 
 DO_SHRNB(sve2_sqshrnb_h, int16_t, uint8_t, DO_SQSHRN_H)
 DO_SHRNB(sve2_sqshrnb_s, int32_t, uint16_t, DO_SQSHRN_S)
@@ -2224,9 +2204,9 @@ DO_SHRNT(sve2_sqshrnt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRN_H)
 DO_SHRNT(sve2_sqshrnt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRN_S)
 DO_SHRNT(sve2_sqshrnt_d, int64_t, uint32_t, H1_8, H1_4, DO_SQSHRN_D)
 
-#define DO_SQRSHRN_H(x, sh) do_sat_bhs(do_srshr(x, sh), INT8_MIN, INT8_MAX)
-#define DO_SQRSHRN_S(x, sh) do_sat_bhs(do_srshr(x, sh), INT16_MIN, INT16_MAX)
-#define DO_SQRSHRN_D(x, sh) do_sat_bhs(do_srshr(x, sh), INT32_MIN, INT32_MAX)
+#define DO_SQRSHRN_H(x, sh) do_ssat_b(do_srshr(x, sh))
+#define DO_SQRSHRN_S(x, sh) do_ssat_h(do_srshr(x, sh))
+#define DO_SQRSHRN_D(x, sh) do_ssat_s(do_srshr(x, sh))
 
 DO_SHRNB(sve2_sqrshrnb_h, int16_t, uint8_t, DO_SQRSHRN_H)
 DO_SHRNB(sve2_sqrshrnb_s, int32_t, uint16_t, DO_SQRSHRN_S)
-- 
2.43.0

