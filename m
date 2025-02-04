Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472514njb;
        Mon, 3 Feb 2025 16:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgpjPWocMDLg66aXidC2jZxuMROa/3vZCyUqcQAju+i7kE8sU1DiwyEGUgpXQhEMtzwDyEYtHygW/hKQ==@linaro.org
X-Received: by 2002:adf:ef0a:0:b0:38a:88f8:aad7 with SMTP id ffacd0b85a97d-38c520b75dcmr14007266f8f.54.1738628616374;
        Mon, 03 Feb 2025 16:23:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628616; cv=none;
        d=google.com; s=arc-20240605;
        b=bDO7fIrelEuca0uMFueTGR1vYyWkAj5hvAuRrdB81zc+EbbJmnjRN+Byy2JSwsacfc
         3/QN/SzWxParANoMSQJKai6vBT4jX54+WtfV0eunNMXx7rn0f7i5SSzxbj7FOIB3896m
         4cBOBNvFW/zc6EU+8dwR21dYKQ1DX/7s1d84UUINBRyKxewtq1Mt5P+K5voBOVVb56hi
         UMPaRpbYRyp0m5aDDRtcG9Z7qGGvmyU+mNsCuuDtbjDAchCOgUmDrguknIzXXnE+KoJT
         9YUMug6f1egyh9E767yq3+UYuRO9pCd06PbnFExZUN3icjQNlxHC+S2gEEnbVboOJjCx
         X8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n6QDpRJ2FlSdxPQFjP8LoBbvp72nwEtWebL/3euq8gE=;
        fh=nAHueyySchJ92t3lz7ZnPC1ltl36PPd+lqbdyj7Uxeg=;
        b=M4B0ljmHcki47yPdlTEZUYR06I0EAsFjg8EI8K3or8LMYvgcOuITKVepC/P5Phmykf
         GdEmZ6YBbyD6M+fnXGCD3YuJH4YmPFf6SbRzGk1GGRl3quOjhPJ+0w3+MLCpuMcq92EU
         HWxQgxGHsWsfC0lUyoeysUI0ojGEK/4JjIaI3lBQ+HbP6hteEcq2+GaYUHGZVHNX+N22
         bXntBOgg9dIQeDl10ZFVdqhoEW7axwGLrZSKE9lZiGSQ8vaFnWUjftE//IwtzzhaGZJz
         9KxZSjgW6vx2+sCTYDD9z8IOtoRWBNzNvUTHKQ7TWV/C34FItdFKl1x+aHaSVBHOKg6O
         FDgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlukANlb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0eb9fasor3233555f8f.2.2025.02.03.16.23.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlukANlb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628616; x=1739233416; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6QDpRJ2FlSdxPQFjP8LoBbvp72nwEtWebL/3euq8gE=;
        b=nlukANlbtgsgRIja/waE6TFq4NdMS3nNU9aghSy2gkLCdoOcwPNUFHfatwiMw/PN86
         UW5Na4XNrBm76t6WOjoDcn1QokA4xAgPxGTs/stVY515nWJ31EoxnkRx8BrEBFg3Z8n0
         yVk1ysFZUos1Gprm6pdzekpGCGd9kp3VBGeHkYGBde1EAui5PTETl9O+KLCDAaswXTbE
         aAW7b0emR781Brs0zTzOb2HKLIVrxuTYs9hUCaq3eosKVR6rD1XrQKG5iwRdOF6mqho2
         tNMvhCF6lW+EBDI7VVWG3zduGK5URgYBtY3aT83F/GEiLMP3fD1rGapjHr/UMKCR0OOt
         mNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628616; x=1739233416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6QDpRJ2FlSdxPQFjP8LoBbvp72nwEtWebL/3euq8gE=;
        b=pqmQoeK6mcu3ZXlqlB8py6GS4A3rhc5LWV49/0eNBqKUSyRmS7ZlYYdhgAl44NCxT1
         veli5XmhLI1M1JTMlY6od0IUdKvvVzcl1IhnR994Mj5IpMuxaSaaM+Rujtk5/6EeRoKb
         LK3QkcOs9QBbegtVa0tXYUnJZR5tgrjv11V60Px38blbxsyWJj3Nis1klH3LiaQ7k1Ol
         +BjMQ3DPzK7hGDSZTW9PlKBsr0WlAp5bfPiZqAlOOEib+JujiQGxfXxEbREaj0lUkIOw
         jTu/1dXxD1J9Yq72WM19GSYw3w8SCBppD2XmoHPEoDFzFS4hdeg0zUaM1z2bpE0y8/JT
         YlGA==
X-Forwarded-Encrypted: i=1; AJvYcCXs446urj6W5KhevUnpw3OkeP1zvkNq/q0m7Vrq4sz580MycM97UVyhPgCD2yIEJUDVyF8Mp53hhnTT9Q==@linaro.org
X-Gm-Message-State: AOJu0Yy4X8Pte+t8rYj5vHhqxJZL3jI+wo6YyVvBRKbmerU55Tzi2AjY
	h4EnBL7ObksHn71wznNitEgMkaulvGHVkoz0Qoqp9Oy1+tVphhoXTF1uVA2z9fLEgA==
X-Gm-Gg: ASbGncsL0gcIQI3qY8jQYLKdDEC8Fj3LInanY8mc7U/I5R3Dkw7+wcDb063mMR2Jszo
	FCdxWe/37GYHqNkUOesMx0GEiyV9kNVJ1sP30+cgJqr0IcZCSqA4oh6MBz7ShgJOJH407HHOeuk
	8oLSZhgLsuS60VOLoEe8FQuDKWku1IZYh+sgThaaJsXS7/VsHQpKqTNxGVBWI54MFX57VAK9NjT
	J2VOGo/jkePa6l9MKJoeAYAu25VpR0/YAn9IZ1WVfX8ovdzYtghss0/Kzw0VRgIF8yiDvtFaQlJ
	7x71mZNB3tC0LDroTcVoaAKVdrmY76q3fY/k6QkaRl5ZG+8ucVQd8toQBm8dgJgYgA==
X-Google-Smtp-Source: AGHT+IGvLfzTEpc1pBKpxxVeRx8k046du4w0Is2O3ClvlntW/6wwoH7wrL1zHpqYqwZUy/jy/wfwHw==
X-Received: by 2002:adf:f4d2:0:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-38c51b5d898mr15999565f8f.31.1738628615886;
        Mon, 03 Feb 2025 16:23:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm175409535e9.28.2025.02.03.16.23.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 09/12] hw/arm/raspi: Have the generic machine take a 'revision' property
Date: Tue,  4 Feb 2025 01:22:37 +0100
Message-ID: <20250204002240.97830-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2wLx2nRHdj37

Add a property to specify the board revision. This allows to
create a Raspberry Pi 2B with BCM2836 SoC (rev 1.0 and 1.1)
or BCM2837 (rev 1.2 up to 1.5).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1dc41701efe..b184ac3c446 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -491,6 +491,10 @@ static void raspi_update_board_rev(RaspiBaseMachineState *s)
 
     model_index = FIELD_EX32(s->board_rev, REV_CODE, TYPE);
     proc = types[model_index].proc_id;
+    if (model_index == 4 && FIELD_EX32(s->board_rev, REV_CODE, REVISION) > 1) {
+        /* 2B rev 1.0 and 1.1 have BCM2836, 1.2+ have BCM2837 */
+        proc = PROCESSOR_ID_BCM2837;
+    }
     s->board_rev = FIELD_DP32(s->board_rev, REV_CODE, PROCESSOR, proc);
 
     ms->smp.max_cpus = soc_property[proc].cores_count;
@@ -517,6 +521,35 @@ static char *raspi_get_machine_model(Object *obj, Error **errp)
     return g_strdup(types[FIELD_EX32(s->board_rev, REV_CODE, TYPE)].model);
 }
 
+static void raspi_set_machine_rev(Object *obj, const char *value, Error **errp)
+{
+    RaspiBaseMachineState *s;
+    int rev;
+
+    if (strlen(value) != 3 || value[0] != '1' || value[1] != '.') {
+        error_setg(errp, "Invalid revision");
+        return;
+    }
+    rev = value[2] - '0';
+    if (rev < 0 || rev > 5) {
+        error_setg(errp, "Invalid revision");
+        return;
+    }
+
+    s = RASPI_BASE_MACHINE(obj);
+    s->board_rev = FIELD_DP32(s->board_rev, REV_CODE, REVISION, rev);
+
+    return raspi_update_board_rev(s);
+}
+
+static char *raspi_get_machine_rev(Object *obj, Error **errp)
+{
+    RaspiBaseMachineState *s = RASPI_BASE_MACHINE(obj);
+
+    return g_strdup_printf("1.%u",
+                           FIELD_EX32(s->board_rev, REV_CODE, REVISION));
+}
+
 static void raspi_generic_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -540,6 +573,12 @@ static void raspi_generic_machine_class_init(ObjectClass *oc, void *data)
                                   raspi_get_machine_model,
                                   raspi_set_machine_model);
     object_class_property_set_description(oc, "model", "Set machine model.");
+    object_class_property_add_str(oc, "revision",
+                                  raspi_get_machine_rev,
+                                  raspi_set_machine_rev);
+    object_class_property_set_description(oc, "revision",
+                                          "Set machine revision. "
+                                          "Valid values are 1.0 to 1.5");
 };
 
 
-- 
2.47.1
