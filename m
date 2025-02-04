Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183704njb;
        Tue, 4 Feb 2025 04:50:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVuVNBVhbr0nOY0D7EgRb2UUyt4jy5dIp00xRYzaV5GEgSXw2u1bgMhMwGrrTOUpgymIeyAb17Q+wI/oQ==@linaro.org
X-Received: by 2002:a5d:588d:0:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38c5195e773mr24360266f8f.16.1738673416468;
        Tue, 04 Feb 2025 04:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673416; cv=none;
        d=google.com; s=arc-20240605;
        b=k8Kkzci3yIqv5hmUrrCDE7QWomyDOl9GUDHPLuCSqDgig66i/np9feUzz7eq/xtXJE
         I8fEJKpn9i70G9VVv5N9LG1ZhBMQbKwKLXMUICsPQxhU4j5YCE08UbIh/fhrlJC5tuQA
         my9sZ7lGZGC29oO4mcFY+rTrrykuq/JIE8AqV4EPDvJCkrhuJ49vd7k0f0u33LN5v71T
         BuVgPYQ53MtbeAw0Xwx2rc/RX/b4V2HEBeeDbZ4ExfuLM6WDFsdVHqQQN8mYkZkfWChl
         OpLoDFcNSUSMNNA9R287sa26TMBAer/VUQDmd31mVglgbNezd40mIIdNr/tQElSAiASC
         r47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZMomNfTKsnHM/3+WLPMScpmOJgfYrLQIKGo4Qy9Se74=;
        fh=zmoJa8fK3YbeyvFgkd3EsBIXe2l4Turmoj4vvnjVpf4=;
        b=QPVxyjam9HqJSVurWpExcwd9SNMQFlj3PqSUxvxG0YA6TQDb/ltC1MPn1NP6DNpE+G
         Lo7iMKXAzo0t5O5LTSbJnIJ0F+Y7UwPVyxiqjhWgkACB8M7Cab88abbWk8Eu87yWFQi+
         2HDXwOyPAxw+4qqueoe8AHrEA2zN65IGIR7sw3xgUYocnvvmM+PVVVCVzyNkWNKu75H0
         eX2UBWm96oEUbLYDLOAoJvWpO4ItHO2xzTZTelVanGFru4A/cbxLiAv5G88j3lZ1E47V
         wHPsfSQdDzDflZ5/XMU25uZFYI6QqKsBsGnTB76eq2vOOObOrYb1yA9NJUO2mePbRd1x
         dmfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DzgkW2+y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0dd7d4sor3536928f8f.1.2025.02.04.04.50.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DzgkW2+y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673416; x=1739278216; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMomNfTKsnHM/3+WLPMScpmOJgfYrLQIKGo4Qy9Se74=;
        b=DzgkW2+y6XLlWw9TrfQp5qEX4bTY6Y3itQPjbXUobKFKk2WtUGuJiE3BDCDq1zj+ah
         mkf9VjzGa72qks/cfWm/TQ+G7BWVhg+7j2xdSHR0BGoEPCjT+rfM2oqcOo/sUV0Kc59W
         iaDAoDbCxE+RiYEyhr4hBUQGZ/ovPfQ+amWA1u2pcsPAA4P4fO6Wp5p+UyAF6Kn/BRc7
         y3ekSosAdxN8g/MAc9yMxIeY4HY9MBuWpIH6y0+KxJx6BlK2YSqT9JhS8K9PZwAjDsnM
         eREOPYbBjLaJJ7FX4TjDOpCT8M2TYdypBtfHDbXbObNzqW5HJEhzYtQK8FwKlfJ3hoBh
         kTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673416; x=1739278216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMomNfTKsnHM/3+WLPMScpmOJgfYrLQIKGo4Qy9Se74=;
        b=lORGopMLfNKmpC9V0CtreZvI87SSRTpVcE2vMwNcSd0Zok1yg9bL6QUda9Dnk2l01i
         5GzK5izWaPNGvt8A15ZPNsf4+5UCTrl1V1eZb+OdsYJcxGMVSFbTMuEtANUGk9a4klhf
         H0wGnUYlV/ybBs0xJQYbgmBPdN4+jiSpZ4D66tcJchVd76y12CN6azW9McgkjvcXu4Hs
         krrezV4OEMeZ7dltLkfYZqxLF52uI3LCnRpJT9SkjBeq2uCXvB7UfNYqGlRRZAeD7UPg
         CxiUmZk2dvNCod4Rg0gKNzxEDTsUUuNXaV64jlBYij7xOprjHxC2wDtUwqSxabgBVnl0
         5Wow==
X-Forwarded-Encrypted: i=1; AJvYcCWUPeWuPj8F1dbrvyISoK6qJH86L9YQsdHqXe6oc73vWmOPBYIODDK26e8rasQNuH8LPbrcjAPwDiIK7A==@linaro.org
X-Gm-Message-State: AOJu0Ywh2ImpYzru+qRnN023I3cJbgnCxaVEmX7TnMt09EI1qoZGbe75
	CeHm1/ZYy01LnS447Gm5xLj+zGB7yGq3tsWm63TvayQTJVZ6AF38ylPCVhRgXEveuA==
X-Gm-Gg: ASbGncuUeuiuw0i72hgsjAydMkISi/DzESpRB8Dud8dUVTXYK2iA0B02/wdOJ/XAZeG
	6nhaS16qh1P+iHpDzVPF6CACrMkEG3CeuxPdPE54vFoqAeH+8AveG+naWzNL3hTIjN3J8L5BNz0
	/uF6+Ux/euKDQM/dXqfNGpNeP4M4kJC96RpM4fGerKg8BXPQVsdpiKkABD/CvgZRbp3LDFUEpj2
	kP4bycL3VPdJh0reijjr2r9HH7hs8IfKacaVM0698ocxB3FQ3u2U17/vDY0G2fwwcQLCJ6I2qWo
	6jkrIfMIXsELvaUA4sABeg==
X-Google-Smtp-Source: AGHT+IH41lar320LQzBf74OfHPI1IKm+o2XdQxdLIEafZ8Oerby+u8AdGTr7nEUfM4oIc5bB9MB/fA==
X-Received: by 2002:a05:6000:2a3:b0:38d:b099:4546 with SMTP id ffacd0b85a97d-38db099463bmr739289f8f.54.1738673415946;
        Tue, 04 Feb 2025 04:50:15 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 4/9] target/arm: Always apply CNTVOFF_EL2 for CNTV_TVAL_EL02 accesses
Date: Tue,  4 Feb 2025 12:50:04 +0000
Message-Id: <20250204125009.2281315-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b9PpMzYBfxKU

Currently we handle CNTV_TVAL_EL02 by calling gt_tval_read() for the
EL1 virt timer.  This is almost correct, but the underlying
CNTV_TVAL_EL0 register behaves slightly differently.  CNTV_TVAL_EL02
always applies the CNTVOFF_EL2 offset; CNTV_TVAL_EL0 doesn't do so if
we're at EL2 and HCR_EL2.E2H is 1.

We were getting this wrong, because we ended up in
gt_virt_cnt_offset() and did the E2H check.

Factor out the tval read/write calculation from the selection of the
offset, so that we can special case gt_virt_tval_read() and
gt_virt_tval_write() to unconditionally pass CNTVOFF_EL2.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ec1e6cfaab..01ca222903d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2600,6 +2600,12 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gt_recalc_timer(env_archcpu(env), timeridx);
 }
 
+static uint64_t do_tval_read(CPUARMState *env, int timeridx, uint64_t offset)
+{
+    return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
+                      (gt_get_countervalue(env) - offset));
+}
+
 static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
                              int timeridx)
 {
@@ -2614,8 +2620,16 @@ static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
         break;
     }
 
-    return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
-                      (gt_get_countervalue(env) - offset));
+    return do_tval_read(env, timeridx, offset);
+}
+
+static void do_tval_write(CPUARMState *env, int timeridx, uint64_t value,
+                          uint64_t offset)
+{
+    trace_arm_gt_tval_write(timeridx, value);
+    env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
+                                         sextract64(value, 0, 32);
+    gt_recalc_timer(env_archcpu(env), timeridx);
 }
 
 static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2632,11 +2646,7 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
         offset = gt_phys_cnt_offset(env);
         break;
     }
-
-    trace_arm_gt_tval_write(timeridx, value);
-    env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
-                                         sextract64(value, 0, 32);
-    gt_recalc_timer(env_archcpu(env), timeridx);
+    do_tval_write(env, timeridx, value, offset);
 }
 
 static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2768,13 +2778,21 @@ static void gt_virt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static uint64_t gt_virt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_tval_read(env, ri, GTIMER_VIRT);
+    /*
+     * This is CNTV_TVAL_EL02; unlike the underlying CNTV_TVAL_EL0
+     * we always apply CNTVOFF_EL2. Special case that here rather
+     * than going into the generic gt_tval_read() and then having
+     * to re-detect that it's this register.
+     * Note that the accessfn/perms mean we know we're at EL2 or EL3 here.
+     */
+    return do_tval_read(env, GTIMER_VIRT, env->cp15.cntvoff_el2);
 }
 
 static void gt_virt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                uint64_t value)
 {
-    gt_tval_write(env, ri, GTIMER_VIRT, value);
+    /* Similarly for writes to CNTV_TVAL_EL02 */
+    do_tval_write(env, GTIMER_VIRT, value, env->cp15.cntvoff_el2);
 }
 
 static void gt_virt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.34.1
