Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775486njk;
        Mon, 27 Jan 2025 15:29:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvcXnhJz8aXTxiBSvu+NoK0CkQNYmoG1SmWXqlVAPeq6ddeaWW7Sp3Cd0gfiPj2gAcHMSa2YK9kKGt+w==@linaro.org
X-Google-Smtp-Source: AGHT+IHsQ7MIcHA2UOu42ezdG792eGIZ7dk1HObWe7S4NCsO0c0qFYHm+aMK7Qb0wCKjlWPGQazG
X-Received: by 2002:a05:622a:1b92:b0:45d:9357:1cca with SMTP id d75a77b69052e-46e12a554a6mr697326271cf.14.1738020547221;
        Mon, 27 Jan 2025 15:29:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020547; cv=none;
        d=google.com; s=arc-20240605;
        b=B+ciyF+ud6zZq6fsYABhzOzCfY7Jnrvhnn4+lkD4AptR2RWW2K9SpPPnbCps90qDbN
         uwDYpuSVe9tiXTfllB7AbcU4oTtGqzBqa8O2Rvo+rLYKfs/hPrvJspTjqSc5i5WnYNM6
         Pxi0kRcMOuez91F1QvrVnqgB51miy6e8KbG+ALo7N2O4lMB2jQDmyeP0uoglUuQCTSgU
         C3Ky4KzEwnPQV16iOTn1r0ywlna5sxycUKil8EwRapC8feUcvA0Z1JZbJWd5WI8IVRne
         foGZdLZYOfp2oQUq+s/JDHIkR3moai4dm4q6YHK0L8HymHazawSQ1UkqG8mnvbFF2XN0
         geGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p8BKUORijGQS50f4GtdAn/sy3ElbIpcuj5zDOx8ZwZA=;
        fh=igfKki9zV5i/IfmDn/Sk23mhfaq7a0iqiBvPmqdBsis=;
        b=Fa5/Ej0zdcSrrgXnJvH/IJmpoT9gvzsUzCU0ma4vlAlMLHWKe8S7+dqZJKa+OVQh0p
         rqCQ399vmpWs7EFBl0QOTZX1N7Q4mKUk5vdGZY36/m4+B1xp1wMmQHsVNHo8b7vvoi/u
         bZxMiEDZDmWMOM8UrYFZwPj3dUO7kER2Wuk1Nei+XzI8xK8JizKmDi3Mm0kioOQFKiE3
         RuNgliqdpqaY7V8FttrFK6zJcoJC8Z47uK7D0XgYYARTc8z7xoNwJ/X7JeXMiHp3mmYt
         +4cne3FnkXX/t5EUwhS0B7ISR4ufYIeX4o9ADMQjH0goOK0XKlUWr2H7chqvVPqzJIg8
         9k3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dIbGkUQO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e668888bfsi119412821cf.154.2025.01.27.15.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:29:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dIbGkUQO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcYV3-0006bT-Vy; Mon, 27 Jan 2025 18:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUq-0006RW-Q7
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 18:26:24 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUo-0005di-J5
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 18:26:24 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2ef72924e53so8596034a91.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 15:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020381; x=1738625181; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8BKUORijGQS50f4GtdAn/sy3ElbIpcuj5zDOx8ZwZA=;
 b=dIbGkUQOx1eDZI1o8T0KzdGViWUXXrVXDMKr2VW6YHi1hwzKvJNmGMnLX4Qvk9Ha3K
 pVqwfOZ9n2Vz1damJyPIVRF8H2s7RFW/H2ZMIR5pQerWG8DRvUQ7IhJCBdcg2XKr51ex
 A+WQhYBrvu0DWnmNrOWK7l5uydJakA8wVB25t3RAdHaEjwbOMP6DdNvS8S5wMJxSgt2D
 LFbbccd9MFDXOc0MOysipqBLGFU4yQJrobVxq0oWVS/HeXU/a1TYGyEooJbNvcaDzXfM
 UPejnNXh5rutiijbFZeGppJhw+yKSJ7G4ewmcuxgkvWGCvMAhmOrHJ8mYIFqm5kqc+1Y
 0oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020381; x=1738625181;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8BKUORijGQS50f4GtdAn/sy3ElbIpcuj5zDOx8ZwZA=;
 b=Qj8oqPFJrfiMS5lcu1sAr55zUO9CL9+WQxD24lWcrPY9ZNW/A4CegrHKcdpruvliYT
 8KES3UnPKMUAQ+iqgSnp0ZNvwxEwQ/ObvHdY7d8Ob9i74UjVM8f8w+ZikJrxQtiZm+U7
 aPQcoq6gLmreTpDNI0c1sHA+gGUYIUnWcHjSDJz5ASZySFuiSUzAVLiaHG+YcmAkd7Vf
 i9XVGvjd86ZhGjf48PCtgBjA7gauvYA8KIZbzRF8/T6eGSVDyU8gl+7GnJCIgEfuQEkz
 FwsHTNRH1NhTgP8ppNOQQtp3bNgZljHtUr1nkahsBJp/ndV8lurQQTzSXOl7jKSwpYJj
 kNZg==
X-Gm-Message-State: AOJu0YxpKSU3yvm4Gf60d4sh90GrrDivKxAaru/2lPzmRo9EMuBXssj7
 kg53p9glfp5TjxR3+suioBbExFLYk967Km4FZKEFgRdpZLiFbNcDv3eMD0vuDq4p1kBkoheYrMB
 W
X-Gm-Gg: ASbGncsJ5fiVdZ+81uB7WE3KYz0alcp7GESJ7+kLi8cg5SjeS5amfcTj6vXGuc7QV6p
 iaST8qUfXhu/yd6mwKyGVmyvYX9k5YF2eyqMmbvy+IwMBmTRjy38VANkuDOpTG0zz0fSW2iFIMB
 toogcz3cdYBkb39auCb9bAyzAkZpEI9c9a65Z+MAqHOK7fvaEf0/l7BeAl+PitjelqoKyNV0ZBs
 xJy92O/3glpwy1MuH5dd/ZK80yshgB9ZmQvmILI+AXXYbdhe0KT10fQfnRYfZIcIoZBgJv1OJyB
 /8PIfhymf3pfJvMfPKwgIAvELwaEt3FMdraQP/M=
X-Received: by 2002:a17:90b:53c6:b0:2ee:fa0c:cebc with SMTP id
 98e67ed59e1d1-2f782cb690amr63804771a91.20.1738020380898; 
 Mon, 27 Jan 2025 15:26:20 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 19/22] target/arm: Use float*_maybe_ah_chs in sve_ftssel_*
Date: Mon, 27 Jan 2025 15:26:01 -0800
Message-ID: <20250127232604.20386-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: P4psOUME/QAQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 3f38e07829..a2ff3b7f11 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -2563,8 +2563,8 @@ void HELPER(sve_ftssel_h)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float16_one;
         }
-        if ((mm & 2) && !(fpcr_ah && float16_is_any_nan(nn))) {
-            nn ^= (1 << 15);
+        if (mm & 2) {
+            nn = float16_maybe_ah_chs(nn, fpcr_ah);
         }
         d[i] = nn;
     }
@@ -2581,8 +2581,8 @@ void HELPER(sve_ftssel_s)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float32_one;
         }
-        if ((mm & 2) && !(fpcr_ah && float32_is_any_nan(nn))) {
-            nn ^= (1U << 31);
+        if (mm & 2) {
+            nn = float32_maybe_ah_chs(nn, fpcr_ah);
         }
         d[i] = nn;
     }
@@ -2599,8 +2599,8 @@ void HELPER(sve_ftssel_d)(void *vd, void *vn, void *vm, uint32_t desc)
         if (mm & 1) {
             nn = float64_one;
         }
-        if ((mm & 2) && !(fpcr_ah && float64_is_any_nan(nn))) {
-            nn ^= (1ULL << 63);
+        if (mm & 2) {
+            nn = float64_maybe_ah_chs(nn, fpcr_ah);
         }
         d[i] = nn;
     }
-- 
2.43.0

