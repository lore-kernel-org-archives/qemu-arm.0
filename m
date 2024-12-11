Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4194030njb;
        Wed, 11 Dec 2024 08:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBm8067BmtsweMMokzeqH2vs+UrDdwLjmrw6tYEDRrJ81v0IVM9cnwU7bjh2WiiPmXUkEQk1Ur9pZCyg==@linaro.org
X-Google-Smtp-Source: AGHT+IEc9IAWm895wBkST1y/qZGK774LgfJqDsqcbALEOpqt066qgKMWAumTHT0m1AjWIjwXl4f2
X-Received: by 2002:a05:6122:2510:b0:50a:d1e3:82f7 with SMTP id 71dfb90a1353d-518a3cc335dmr3545406e0c.8.1733935085869;
        Wed, 11 Dec 2024 08:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935085; cv=none;
        d=google.com; s=arc-20240605;
        b=SDb5EYjeinoT2Y+UJiC7rEoclx0WaouC0yUIlFfmBtreWrfWBzDHY14vp+HhObAOHm
         E8qtZsTq8XY/CM1rKR+cuOCfJgniJZG1kEY2S2HFV+bRybNshA1or8sMbcOjl9XvwT6q
         9btjpYXXFZWxItFM+QAvossK67c7Ekk3rM3EWi5O6tsx8d4vUEcBwq+dq1pZmn6e/QaJ
         Ggy45a0lD/ZhDuUclpqyvuCJtzUTflJJTPc7WGQC3dJarGomk4kE9rO0U+kGthGKH3Fj
         FkYV5/2r6rvtQ37NlegY5QQg/E/13HM+PULsBCBXg/I1uA7fd/LIVBq+LBmYP7UhxO/W
         CYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YVZbpzoYlL2Dxsbbr2iwK6Jz90M9hQKlxSzzwf2vpI4=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=gpTVeaGcp48zKAGUR7+zYntCu8RGVMsAbVvPFyh/YJa1ytG7KTXMRaCjsFNasKazZg
         BLJRekOWS7SOuaE5HSeSoR4Kp0/hPXRvuPyCsZeP/sOl3hiHz2WtZRH9Jesr1tc7VkMH
         mpHKLwLvukBEhyMP5YmxVEfbFs81qEXoBLT7JPBmbtea/EDH2tbQ6i5ugSM2443Qin8P
         1DRAMQzzaT/8/W/3Wamm+NgPUghEb01YkxQLv+D6h9z2YPbWMayiloucpWO/XbU0zMGo
         YP16TmzS7WoafYOCb894+Il5bWkOWUQoQ3N60xJOwZNfZt3f3oTimbc70i1HbpC0AaP5
         PMvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMncqWWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5181ac1fcf5si1804972e0c.5.2024.12.11.08.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMncqWWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPev-00028Z-Mf; Wed, 11 Dec 2024 11:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdL-0005Vq-VG
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:22 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdI-0001Ph-ST
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:18 -0500
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-4675ae3dcf9so32734511cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934736; x=1734539536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVZbpzoYlL2Dxsbbr2iwK6Jz90M9hQKlxSzzwf2vpI4=;
 b=TMncqWWbe0ZG4opO6PZHipvTr/jDHjC+IkBSGNgefpuDbJu/ixqRTaL6wpg0fbflWe
 BL+MRog38/xWlV+SCmZaf3rfYY/H7Wpj8gjBJ0gCXWbp/XnUXZpC7CKwAcCXaRifpUwt
 NlPUBBUAKv69tbUr41nkjBwk7nr8l3gxKgCTdedbjNyaFIf5eOKnnFSCwY7kjZ6L6n02
 LVAS8KjmKshb2LS7s+qbre6Vp+R9f5Kxf/FIItfMKJVadVKb/BPN+etR7KvbMYv9aLyv
 9ffswIPk4n/IASZhHDEy1Lr+iM1Sr2JJXHR2h2D9od8M5cNADPZa52SU/qUff3ZoHTER
 h5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934736; x=1734539536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVZbpzoYlL2Dxsbbr2iwK6Jz90M9hQKlxSzzwf2vpI4=;
 b=I9MRJGB5LOavA+k4mXZP9/E3xJidQ/+n154TbDgkdTJXbF0xHtWo+VM2VdrGseI1y2
 mqryxmK3XifxM3G1KDYBUQfaWh6pdvAnGXxDyEJ7IrBTF7TAMyrmbIAbnsloB3VgIu6J
 JBVIULzL2+l3G6ZdVh1PGC8VeU+gklEMWHk79tVd6rTfqYL7e9E5OOSzuhCF4wglDLXR
 CifSAqWGNKz6LvSvlFNRv4kbYgJ9njslOpI1CwDyVOQqqh2MqWIrhT+wCNDG9OgLfqMq
 yu6ACGL6tgevOkEcdUjXlvQE4hWXr9KF2Wrb1CSO9fmwAoMW19MnShorQmdkHh/6Prtg
 S4Fg==
X-Gm-Message-State: AOJu0YwkylPsYCOVmapWoVxEoPctCoDKp0KURMajI/0v5bry2mNIRcF8
 3fkKaohJyK5jeHGhmCTbbO24JrjleoW2pRZeJAmdCvIulTY/Zhg7jHfkY6BgQccii257Fq35FCg
 BIFt8wwzs
X-Gm-Gg: ASbGncv3uFJju0D6ZnhsT1VZ3oFu09EzwriIUB56T/3Q8emKJQ6gG73Wu+4GpWptrDe
 iaJXE+YILUadDoZoD1I4yl3un1P5vqu05tAM+zabUZWpJbyNhj5565zOnG5lHOSHqGZFb4nOTX9
 58aHmLwWvGG8pWKb8fRazjrajBG9+knrVoGGtrrLsY6wYkIfOI6V8xEaniQPL12NsTHGkAW1Umc
 E6PZrpVyIFU837aCqs4jrVtGfTvL90bSRjCXZzovQUqwYcJ5xt5Fm6gIoVDFQ==
X-Received: by 2002:ac8:7d07:0:b0:467:7cda:936d with SMTP id
 d75a77b69052e-467893201d2mr60175501cf.14.1733934735761; 
 Wed, 11 Dec 2024 08:32:15 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 29/69] target/arm: Convert BFCVT to decodetree
Date: Wed, 11 Dec 2024 10:29:56 -0600
Message-ID: <20241211163036.2297116-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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
X-TUID: om0BGMZb9nOH

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 26 +++++++-------------------
 target/arm/tcg/a64.decode      |  3 +++
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5a347bece3..5b30b4caca 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8420,6 +8420,11 @@ static const FPScalar1 f_scalar_frintx = {
 };
 TRANS(FRINTX_s, do_fp1_scalar, a, &f_scalar_frintx, -1)
 
+static const FPScalar1 f_scalar_bfcvt = {
+    .gen_s = gen_helper_bfcvt,
+};
+TRANS_FEAT(BFCVT_s, aa64_bf16, do_fp1_scalar, a, &f_scalar_bfcvt, -1)
+
 /* Floating-point data-processing (1 source) - single precision */
 static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -8432,9 +8437,6 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x6: /* BFCVT */
-        gen_fpst = gen_helper_bfcvt;
-        break;
     case 0x10: /* FRINT32Z */
         rmode = FPROUNDING_ZERO;
         gen_fpst = gen_helper_frint32_s;
@@ -8454,6 +8456,7 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
     case 0x3: /* FSQRT */
+    case 0x6: /* BFCVT */
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -8652,28 +8655,13 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 0x6:
-        switch (type) {
-        case 1: /* BFCVT */
-            if (!dc_isar_feature(aa64_bf16, s)) {
-                goto do_unallocated;
-            }
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_fp_1src_single(s, opcode, rd, rn);
-            break;
-        default:
-            goto do_unallocated;
-        }
-        break;
-
     default:
     do_unallocated:
     case 0x0: /* FMOV */
     case 0x1: /* FABS */
     case 0x2: /* FNEG */
     case 0x3: /* FSQRT */
+    case 0x6: /* BFCVT */
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9d2f099c9c..4a48fcff1d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -45,6 +45,7 @@
 &qrrrr_e        q rd rn rm ra esz
 
 @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
+@rr_s           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=2
 @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
 @rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
@@ -1337,6 +1338,8 @@ FRINTA_s        00011110 .. 1 001100 10000 ..... .....      @rr_hsd
 FRINTX_s        00011110 .. 1 001110 10000 ..... .....      @rr_hsd
 FRINTI_s        00011110 .. 1 001111 10000 ..... .....      @rr_hsd
 
+BFCVT_s         00011110 01 1 000110 10000 ..... .....      @rr_s
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

