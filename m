Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261327dyc;
        Fri, 4 Jul 2025 07:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWE1/rsLtd0a7rmDZlutjeRmADvU9aKeiVJ+4FtWXh2ZCJxwJ3n9H2qL12VEn3tiY0USpRHtvWGJjyrfg==@linaro.org
X-Google-Smtp-Source: AGHT+IGJAJ/xid1ZbcTzDZi/Vl6Vmo0LcUocsWyDWwB9ZKoJdWS8deuCqyvLWAgiY3PDq8cpwDAE
X-Received: by 2002:a05:6122:5119:10b0:534:7f57:8e25 with SMTP id 71dfb90a1353d-5347f57969dmr834588e0c.1.1751640085710;
        Fri, 04 Jul 2025 07:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640085; cv=none;
        d=google.com; s=arc-20240605;
        b=gURp/eWH+EMrGf2gLxrIPJ1wsDLMVGjqZgjvnbyJlAaQHoKfUTFoOfs338Z8Jod44S
         TlygL98geMRdfpfnzzx97qyY22Po55V8w1DTbpBp+8ecrNsp7ZznAmRx8wQbwguXlKdS
         wGo9NxuBcn7Xv9Q9GhLz25x5c63qcV7RBcTRnWbdgllmuWRLCX0ucylpwlWEymoTcD4K
         txch1dxkuP1UBw7gpFnSHOerUDb7gvPyOlj7MKA7fLeUg5ZOjDVsVXgAH340NjSJijea
         p8XXooL+z/8cGFUXhf5NCYeFOIBIVmhRCISy1OJQ9BGX0w3JTN2ARjCl/o34s6wQLe37
         vNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KLxGKgXk0i72IBBIKzoJmYKjoJRmgOO7veT/d3JwQic=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=UpcYqfbfD5EIqqTEtc6C56yrGjgPguSlmfCOmMy3oUvHCVpJ/jNpURjWXPTKNlcq6W
         t7bl3++6jEm7wFZqay9Em+mveyEFM/FXt9/YOXAbGw2iBurgaNNR/YWqiJUFJokTapWO
         eR0XmPpnf1RHOW/X26EJ+ikst/62pyPQxBGqWfhI6b2msIUeRT0vixj6fYHeSpRsNq0H
         HU6P6o/3yFJWAmG1RI+Nur4wq+JseFju/PqOpnyps9HY7/obTIkUw6IWENXQR7PeV1i7
         885uRoLr4l9/JpAWL0quLRxZrgH3dejMjKLdBiLFjDR3wDv+kaRX1lW1wY+mFq08VB7k
         nMZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZsskRs2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea72619asi640213137.440.2025.07.04.07.41.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZsskRs2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhUN-0003Tc-DF; Fri, 04 Jul 2025 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhMD-0004pT-G7
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:46 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM4-0008AI-KA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:41 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-40af40aef06so632522b6e.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639131; x=1752243931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KLxGKgXk0i72IBBIKzoJmYKjoJRmgOO7veT/d3JwQic=;
 b=ZsskRs2JeeCoTws/9vtWOyB3Q4ROGPXE2rBodtR1UrN9mD733DrI3X/53soPyW54uL
 3TTSfgKBIlLTKEGxZWsVvYLyrJOm5QhrdVg9nOaLOdkA1JmJKslbUeeMGPV2q4gPaN87
 Pfw8YG9ifab1a1mbve7wYOs/nHF4KUZckyTQ1khVNBJARqvvzV7wrGepfBkcL/cyoNRY
 DxNNy6e/oFpj58V1YFH+sCDC2A2LTjQZxLUD44U5DBUSyrw2NAG1RmOzukUcfbnvqXkH
 1jmnRMAcHi7rBTMd0IwadLNHfV7CznxFSNdLf3TKaiNTkN0GmVznhdKqO/fFoLk9IHct
 Bm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639131; x=1752243931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KLxGKgXk0i72IBBIKzoJmYKjoJRmgOO7veT/d3JwQic=;
 b=X6OQhepJlFKasDZd6wo0W8EYSuoXbFVTIittOK8hxkvxfDMTRnBzeYlYagIonG6x36
 53xaUrZFHkUKm8YS0PkPe52DD/91MdCYNAzIV4d4o4iYFW7WP1Bntbig8SeBd2HG4vSR
 9rx51L3TtCWEPHDvdNZkaaq4FS3blPJj6OkDXDO7ea4xy23LwMgNRKq1D9fx5J5xh4vr
 m3O3ARajqwtWU/HhB4lurB5Ex5Y0ElBLc1WcdnP8r4OmudK+Zv92U32aATJSO8Y49ztV
 3/Ny9n1xRYXUF+WKD0ZevNA7aBuoa7DRbrPAuV92+R/77d0wFMRtofVcYkuo6o9kiTKR
 LHAA==
X-Gm-Message-State: AOJu0Yy0pT6Fc6psPx5fWKcLKDa8b2Oh3ut58X96NOQKimBuQe5JXhOT
 sN9+twMZl2xsSAtISX2IMypOCvAUzJrXxGv2DbAiX8hIxhYvvYpKcVN74M0x6LWwAiOOUL/NanA
 MyOwxJL4=
X-Gm-Gg: ASbGncsV4sNabpgkHOkTai85eZaDemXdTT0tPVd/qIyx9qSt5jR6/HTcNiVLvze2Sbh
 BlRVYY8/WZN919Dh2Fdz3itop+6FcYBAKnRFqh7Irj/nDjT8Fp1GN7Q+TN6LKiqyPGiCRlVSR0Y
 9aOliFcHIs14iPoderLSSKiWUaDhvcFzvViwqHX37ex4U0eCE4vSwC6cQZk5pzQ4fD6cUB/4HZL
 5zcgQFg8VOUIP8MNhZTH9f5MhAJz0r3f+xJFucuLN7Yuf7SSmAiKktzY/YAw6pTlSa8AwTZEYQ8
 SLC4gI80LNhFbniVkNA0KcMVC0794GSTzdmTOMCGJO1uQX8wrXwkxaScFseH2GV04a1fIGtDBYS
 2scEXxtn4uJuYFQElxsLEJkr2jByFEg4I38I+yBjipDXqtnKQ
X-Received: by 2002:a05:6808:2124:b0:401:e67c:b3be with SMTP id
 5614622812f47-40d04a2815fmr1945797b6e.4.1751639131031; 
 Fri, 04 Jul 2025 07:25:31 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 073/108] target/arm: Split out do_whilel from
 helper_sve_whilel
Date: Fri,  4 Jul 2025 08:20:36 -0600
Message-ID: <20250704142112.1018902-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
X-TUID: TEsREYvYNBOI

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a62a647f3a..741d04309c 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4107,19 +4107,14 @@ static uint32_t pred_count_test(uint32_t elements, uint32_t count, bool invert)
     return flags;
 }
 
-uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
+/* D must be cleared on entry. */
+static void do_whilel(ARMPredicateReg *d, uint64_t esz_mask,
+                      uint32_t count, uint32_t oprbits)
 {
-    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
-    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
-    uint64_t esz_mask = pred_esz_masks[esz];
-    ARMPredicateReg *d = vd;
-    intptr_t i, oprbits = oprsz * 8;
-
     tcg_debug_assert(count <= oprbits);
-
-    /* Begin with a zero predicate register.  */
-    memset(d, 0, sizeof(*d));
     if (count) {
+        uint32_t i;
+
         /* Set all of the requested bits.  */
         for (i = 0; i < count / 64; ++i) {
             d->p[i] = esz_mask;
@@ -4128,7 +4123,18 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
             d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
         }
     }
+}
 
+uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    memset(d, 0, sizeof(*d));
+    do_whilel(d, esz_mask, count, oprbits);
     return pred_count_test(oprbits, count, false);
 }
 
-- 
2.43.0

