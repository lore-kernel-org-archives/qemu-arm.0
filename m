Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498097ejd;
        Fri, 19 Apr 2024 09:00:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnYLz2U4GYUAAIYE1dA2VESI9BwBHt6wdmiiw21GVYDJ/6ih7muc8Y/cj5MJZGyYOh7D1CZy2ue73Pm9EyzkvbGexgbOBw
X-Received: by 2002:a5d:5548:0:b0:343:9feb:25af with SMTP id g8-20020a5d5548000000b003439feb25afmr1760641wrw.56.1713542400957;
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542400; cv=none;
        d=google.com; s=arc-20160816;
        b=orhgoimNAGKVEPRj0+JnkmYNOXmf5uNge8GFrE78rWqNYhR6ulMZQnCYxlCONrXMgT
         nbafv8W1uhnx9NSVP16BgOcNhoSbJ6hkHl86OH0FDRRzUv1i9gWZA8GCLL3IiZ2A/1cq
         v95aaqWFVZTI2PgY4uDcIL7IBS3ICE+3Khy/Jd5L2THXreq92dK0itIv1Is0GITh9NUf
         81PHlK3IPmEhn7Z/37t/L7T6TAcIzN6PFGirULjGUCAPeUTVcM8PLtwl7UpnQ/3Ji6eg
         5/M4NeWVf2KnwKIyY4VbkB0mCfPBhTOdsPhvykP7HAgZSIlGl/76z1YLBZen5Jvlqho8
         LW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8BWAuiO9PeeT7wJXoLX3l8pOkv9yYOvs9jxN8c0Qe4w=;
        fh=IXSzs3UAK9jJ0al3eve0n6CawtEvERsS06bv8ZvoV6s=;
        b=MYK5Oc9rPJ1mOerCyE/0rdnoV7uU1gtoEhvUlvHG6Upf1zRuzYZojrsEqkGh9drK8O
         d82e5n5F1Z9J7wbHxjsEJNVLEvmZ2w9TPolsKnYZxd/kvqqlQuV1UjgSkgvyeW74b/JV
         iXRvaGukKUsSR8fnNVfXeVA92kUwQZQxwyV45ggCbA/bucGkh2D6T9+WghaUqY2+/RRq
         aiVwj3XBdSgyBCd7Ecvmxa8ORnvZ8MUH0dm/zo8bUgQdN9WoPI/tjtdHGhtWuCA4Ya+N
         UE7VmG120we39QP/os6im1GnLTvGSt4RFR3hPPOWXktPOk3691rLj6OjDc3sMWme2NZq
         E7zQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V1IkiS0R;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fi18-20020a056000441200b0034a80eddf16sor177741wrb.6.2024.04.19.09.00.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V1IkiS0R;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542400; x=1714147200; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BWAuiO9PeeT7wJXoLX3l8pOkv9yYOvs9jxN8c0Qe4w=;
        b=V1IkiS0RQTo3mn39YncFav2X6KlqTPwlIRThqMsOMiedRW7T5tOUuiHXvMoncgwhuJ
         yg5nbhSx/JbztQ5qBWiJbz+4qH1uhjkE2Bp4r4dCwVRLHW3XLM8QX7bsH6JYZRSvqIMV
         x0SU0CVTVlUtjNHcHwIkLo7xcZACOey/D6F8lGKqeTmu7j/GBedloYGvWVVXbKtKBCZE
         QqWUBRk34HFkTp96uKCI8RDrJo5LdUUOC0MmM3+DgUtMAV/jxWIYis2DPrpjqroNiCM2
         UAFuop8fiwARXi2bm63df6HC21RQODdv07YSOdiXtxICK5pdc5A3gLBWVYGarGpKCfet
         KzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542400; x=1714147200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BWAuiO9PeeT7wJXoLX3l8pOkv9yYOvs9jxN8c0Qe4w=;
        b=w6ohhNBV8V3tNiH+dvYe5qcKM/8ayzOifqCL56GJjTJ7rFDnOte6YBqiiWCYeqIbJ8
         iHPKcGMztVDutIt/qG1KZtaGPe736nBOJAvCDqci2Mg077y1AcHFSoXTV4ouIhPigzfU
         cQtFHNsXl00wf9ZQReBUupxwg/1pdP1N3p/R8y3PWnZWdltA/Tz7xcwywzRxLCrU8Qk0
         1xKTuTGxi5G7adJKD9HBKE5slBzDELfRz3zBnm3m1SRDW2sxaJ+B0aSIKTznJp7358GL
         /h8074oXvjQMj6mgOJGgx6hE/gw4EolkSBKwkLE/1SdcRVKlylNwwy4p1YTFR2aXWsct
         l/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVAsMnhAQIgebiHgJ38vf/xZrsBHc79qSwcssRAeBCCeUyf+0IN4ytGwq71HTLT9JKLgcFWeW6uGUt2hajEifaCQwZuOMu
X-Gm-Message-State: AOJu0Yw+aQ4XMx7CeaSrISckBJe60HL/ejOyr0rXbHT7cd2LB1VzENwx
	/s2SapmCfOjgVf/je5Mghinb6UHcK25gf1PCcqFZo55cFE2i+HVhfk0KKECEO5Er9Q==
X-Google-Smtp-Source: AGHT+IHL2b232p3lFzAWlqwCwOnXVcHu34vFIkav0qsljUhtn7NkN1WBCwMvjAVu9roxBgpBo+CyLQ==
X-Received: by 2002:a5d:69c1:0:b0:343:ef1b:9f69 with SMTP id s1-20020a5d69c1000000b00343ef1b9f69mr1972749wrw.43.1713542400612;
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:00:00 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 21/22] hw/arm/virt: Move virt_flash_create() to machvirt_init()
Date: Fri, 19 Apr 2024 16:57:09 +0100
Message-ID: <20240419155709.318866-23-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gKZttyGRTmL5

For confidential VMs we'll want to skip flash device creation.
Unfortunately, in virt_instance_init() the machine->cgs member has not
yet been initialized, so we cannot check whether confidential guest is
enabled. Move virt_flash_create() to machvirt_init(), where we can
access the machine->cgs member.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index eca9a96b5a..bed19d0b79 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2071,6 +2071,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -3229,8 +3231,6 @@ static void virt_instance_init(Object *obj)
 
     vms->irqmap = a15irqmap;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
-- 
2.44.0
