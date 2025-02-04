Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472549njb;
        Mon, 3 Feb 2025 16:23:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUsDBDRv+6e907bdTdk9eYV1HCVvZe1Pin6ve02ngbJkyYLZpLVivMyq1zVTeWSM347uakZTuofQ3Vcw==@linaro.org
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38c51e8de63mr21427825f8f.39.1738628621206;
        Mon, 03 Feb 2025 16:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628621; cv=none;
        d=google.com; s=arc-20240605;
        b=UUVjJ93NqEs78Wudnkt2hWRhHIb3ncneZF0yBVC5TzV3P0k0VzTzucsJ5clQIhIIU7
         g+QJb4fGJVbaeSMTy0KCWUahApAzUh4hpVxJlATmcLaBCCiFuX5WSVqWX1/JVRCh7jUV
         wlfXplZAEzAq3X9P5HWJgfWU3R04NKsq9efva4c0OUnS5JkSc6F+BYIVW51DgNvLj6QQ
         2S40hUIvrMr0+ay5Zf9M3VSwdXLXFg8Il2Hh3fk6dWSUWGgermizbPg2fW9SGRe7CUW2
         XNhO+gfW5oSH26jI8apw2wkAmhcCut5fdfw+AOBHCD1Tp1h3Tp03zmWoN6E/pFTeF4OF
         JHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4BsHBCpnaPz96xyXgY6FPwDTShzZ0gjgpBf5vsUfhxs=;
        fh=/5k8wtRyF1dJueowz9g5W2m9AgvYMCblKIbdBenTBLE=;
        b=QoLVx78AZK1T9DnU94R2tE2PP0WhgczVjBB8c8WHYOkq3DSReln7N+FjBGWIOcw9Ft
         VcmOIMIC0K44LFLlNrqkRGxP0m3SmrBwtaR4YGg8iPG5wF7Fr+FjR1OMv9borWgz3ztW
         QdiriKxoVwyZOP6LLt6+0aL4VvNPQPHRvs84PbbkOmHj13KP4y5uEfuBHdRT5E9rvBZT
         qQCJ7aYC3mso4cvnhF//BYXbg9rzh4DpAvvLZCV7jgxknkRNKNNm7btlO2l2b7GMnsEU
         V1nK4dUKk4kUfx88jCp50lj0VGE8gm9UIFsrELMfBjcLEI/nj18pFFBORysnVNMbjiDR
         RCVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NfFan3Hm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e24607a4sor44431765e9.9.2025.02.03.16.23.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NfFan3Hm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628621; x=1739233421; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BsHBCpnaPz96xyXgY6FPwDTShzZ0gjgpBf5vsUfhxs=;
        b=NfFan3HmVdpseApw0vkEvZmkjxkOZBgV969NR7sjdDMMka8koNWxLmpEtEWCOgH6+W
         1bBeDKvP3JmH180X7fULELayT/GsCdJpxFLuiz3NjasShzodRwevVJBuSCCwvxxti9XP
         2rng1XzHT/DdR1MKvudNGm/jkOWXqLb0xZok4C4ku59RB36HO+Wc5E8RPvsdmtf81ZPg
         oSqXUGgWgWaJZCZ1hPOHrP41OoIz8yqGjQeeDcNhg83QcGgmFzxisCwTQqPye188OVbB
         ILum78vL241VilNWfRef1e+3NZ3Mb4ViY6AZ6kT3X+hXL2UAbMYv2flO/84UUSnyyTBD
         +Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628621; x=1739233421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BsHBCpnaPz96xyXgY6FPwDTShzZ0gjgpBf5vsUfhxs=;
        b=IebEKC99H9zhsQEZ6oS6/ygQzwHQTGFZ2RtRMaAQoP/DKPEBR4cTqyrJzQYXTm/7oQ
         hD46oXgefW4wTxalLL6yTLspD56OzR9La9EDj1FEejCA/ZuKan0Qso5FVD0Dc2tGS3Hm
         1N9ekoAZ4HqNmrDju8/qx4j/n/0DuF2oRAxJ4G+aVSBKA3H+wfm166D4pr42sQOeEa34
         oLkV6vKZH8bRVCexkgcIIeRm6zJaWVGF9AOf49WiWMSERTSrWj4nlOGBMoDLyzWj875K
         vmnLhq/3PiPLdbYCwBCJPYMW9hN2z6Bl6ncEMunHNkppVZ+jZUovWIAz/PfEr9jLs06E
         fdYA==
X-Forwarded-Encrypted: i=1; AJvYcCX7tB5RRQRnbMnCKCjfSFSdcyrLhphjGT4vBviySSpZ64DPsgoZUcXTLVYA9VuYGCsdzK3XeijjZ4usig==@linaro.org
X-Gm-Message-State: AOJu0YzO5rOixVmbfcijHarUnMmOeRLHg5/8lAK4vXmmqfx6zqvfLhwN
	VGTpCmgB/+hKVWqIGHjOtpyu5ihEK0DO7IecKKCcdpep4aGffdlpHdDlB5tMEW4lmw==
X-Gm-Gg: ASbGncspfoGZQj575ujaI/kYIwX2EwvONYAwPWfwU8yuXbWiwSVROfLKSW/keVOQzq+
	6wec0CAUXYArepz1a3AGoPbzQ7Uic3kQJlKh34RSnwW/LjZRaUj73btJVXjWaTv2lqcqIwApA1v
	VVlSLaluAOz9v01UJqFu+Xu0uI+EQcH0B5ULgevm+B6f/TidQowbsHDtryyUQh9YP23tRkM+70Q
	YnpyQMaJmBFPpltwS/MY1VN4C1WrU20lSAuyCeeJnEaN2ToYcUKCwE3eaw73x9emmx+klpGnUey
	P/sWPuYAmjR8fr3WuXhAA13N4zTwgGeI/EjPhro8HIIPKr2XagMLESdB2eO8nhlPlw==
X-Google-Smtp-Source: AGHT+IG7jWGrmSQyucvp8cl04A0B6GQvyWzANUSPKFJhjeQG53dan6HWFQx2maj55IYQawVpHdmwxA==
X-Received: by 2002:a05:600c:1d06:b0:434:fa61:fdfb with SMTP id 5b1f17b1804b1-438e561ceaemr158695135e9.18.1738628620679;
        Mon, 03 Feb 2025 16:23:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1016a1sm14187863f8f.21.2025.02.03.16.23.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:40 -0800 (PST)
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
Subject: [PATCH v2 10/12] hw/arm/raspi: List models creatable by the generic 'raspi' machine
Date: Tue,  4 Feb 2025 01:22:38 +0100
Message-ID: <20250204002240.97830-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MHVuLhRZ9U3+

All the following models can be created (with different RAM size):

  $ qemu-system-aarch64 -M raspi
  qemu-system-aarch64: Missing model, try -M raspi,model=help
  $ qemu-system-aarch64 -M raspi,model=help
  Available models (processor):
  - A          (BCM2835)
  - B          (BCM2835)
  - A+         (BCM2835)
  - B+         (BCM2835)
  - 2B         (BCM2836)
  - CM1        (BCM2835)
  - 3B         (BCM2837)
  - Zero       (BCM2835)
  - CM3        (BCM2837)
  - ZeroW      (BCM2835)
  - 3B+        (BCM2837)
  - 3A+        (BCM2837)
  - CM3+       (BCM2837)
  - 4B         (BCM2838)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b184ac3c446..8cae1ff6f93 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -445,7 +445,7 @@ static void raspi_generic_machine_init(MachineState *ms)
     uint64_t max_ramsize;
 
     if (!board_rev) {
-        error_report("Missing model");
+        error_report("Missing model, try -M raspi,model=help");
         exit(1);
     }
 
@@ -500,8 +500,33 @@ static void raspi_update_board_rev(RaspiBaseMachineState *s)
     ms->smp.max_cpus = soc_property[proc].cores_count;
 }
 
+static void raspi_list_machine_models(void)
+{
+    printf("Available models (processor):\n");
+
+    for (unsigned i = 0; i < ARRAY_SIZE(types); i++) {
+        const char *soc_type;
+
+        if (!types[i].model) {
+            continue;
+        }
+
+        soc_type = soc_property[types[i].proc_id].type;
+        if (!soc_type) {
+            continue;
+        }
+        printf("- %-10s (BCM%s)\n",
+               types[i].model,
+               soc_property[types[i].proc_id].type + 3);
+    }
+}
+
 static void raspi_set_machine_model(Object *obj, const char *value, Error **errp)
 {
+    if (!strcmp(value, "help")) {
+        raspi_list_machine_models();
+        exit(0);
+    }
     for (unsigned i = 0; i < ARRAY_SIZE(types); i++) {
         if (types[i].model && !strcmp(value, types[i].model)) {
             RaspiBaseMachineState *s = RASPI_BASE_MACHINE(obj);
@@ -512,6 +537,7 @@ static void raspi_set_machine_model(Object *obj, const char *value, Error **errp
         }
     }
     error_setg(errp, "Invalid model");
+    error_append_hint(errp, "Use model=help to list models.\n");
 }
 
 static char *raspi_get_machine_model(Object *obj, Error **errp)
-- 
2.47.1
