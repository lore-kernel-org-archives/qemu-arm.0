Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189228njb;
        Wed, 4 Sep 2024 09:15:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+u7ulYCZ7umF0EQP6t3+I4vhfZnqw0vH9o4889MJJRkCHqItgtIystBI0o+UiOhkfyrtXK+ESzTBPeQ==@linaro.org
X-Received: by 2002:a05:6512:a8d:b0:52f:3ba9:3bfb with SMTP id 2adb3069b0e04-53546b16b24mr11429137e87.6.1725466547180;
        Wed, 04 Sep 2024 09:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466547; cv=none;
        d=google.com; s=arc-20160816;
        b=0EczGVRu13+bX/oK4Ch667a0b1xeYRYWOdYeRmFbFC1NsmSbZPWappIxaEtG/5DnnM
         LDbmNIiq9o7IZx2w07NF3So93sID7ojH7qFpxPIKDIOKG8A8WB5ULxqMEA0k6ODjDOWl
         Q1lpthuFuUQKWz5QOM4I9z6lC5YLKlIpRGjw7Vtlig6mwW2I/T4V8UsEKmJzbtjA8bN+
         eA+Eg4Aw4OWC7LPjvHSSF47XPLilDRKiNyh4PiGHSbRof4z7/dZovCl7TFgXZV/ZXl8Q
         7yA3oSth6plkQFu2L+OJBuQ7XHi/EuLjhZi4XxIG+stW4N4McWNhDhjeX+uubUKicZtz
         SFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+QaVLnXt0IgeqG1OF+UMCmmf0V+2Gd+nNBZAoCF8K30=;
        fh=9H9bSrze1B0q/RiYB3/Op0dRP2+3Ynfj0cEKOEX6wmI=;
        b=qPbqt6ASdaOsJ4upiGQArYruOz3FOj9e8fGXF6n4T3fPD624lcj3uRpw50xekzWsL0
         Lhzm9PAHs6uuOKE2kaxdZGLbmccZm+e8I+VDUZreNnyZy+vtPicx8QJDqWTkP+EwcySS
         RTghvi9yQ7ruaUXVh+yiiA/2zApvvZBhwhzdku9/Xh9+FJCcSROLIHiqZsUpVM5BKp6k
         TRWgSi7VTXIZMfzgZW4PUfket/JnAynaE/HTqXoIzkvw8uzUotD9Y/XKUNuQhb4r/1Xz
         PA832QOBrYnrRq+3Gw2I3kv9UBYR6mUBrSQFeOu5JgaK9Ha2JHSc6p4sS+CEvNJYclVk
         dDxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ze1UOSoB;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53540787ecfsor4467769e87.8.2024.09.04.09.15.46
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ze1UOSoB;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466546; x=1726071346; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QaVLnXt0IgeqG1OF+UMCmmf0V+2Gd+nNBZAoCF8K30=;
        b=Ze1UOSoB/UPOtrGflWFpr9Gs1QH6jddxj7BkB1Z89VAYQVrGiJt7HpS7PSG98+rH1E
         nkkAMnFPyqhTDeZ498vMBAIk7RyTeA6Rg8/w5WQXYXq6A9avMuxugbtiR+r9K1Yd/5Hd
         NevlhbEZGIJQE5MbYRhAuYNbszcf867F4HKQFYU+W6fcMWAz7WaIPfQHH+cDGEoJ8u5X
         9Wx1jzi8spQ3QpzJDJXM9u2MO+NViFPWcKbGFTQrbTt0f6ZdwfxvPqwRMvXB9Bd3te68
         rVzac8D1gmeeAva/D0ZHBdNX20UukuzhP8g35z0Tm+lNld6Noi/2QnBEotyJYxCIAuD+
         vuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466546; x=1726071346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QaVLnXt0IgeqG1OF+UMCmmf0V+2Gd+nNBZAoCF8K30=;
        b=GhUaQYvTqN8C3MGuaJ3CLQG7Woa0vRtpg6KF/c0DOhWlayxIRk2XoVeUB5YJnyZCJ9
         gHu2Dm1k7U7FqOQO/9IOgP/0R5uw03Jx9Lay4hMPnBiu+WbP9Nez5dqGU3e0KcLduuQf
         zFoOCJozjutOG2G9Kq4/jGC1vtq+ZS/fUnB1ZgZf61l596OUvVDhnUAUVEWEgznJ9ezB
         abfvfm1Uv5XlwbQvTPOhr8m5RWsK8avYYAPKXEIil+mGtjG8DjRisjwmMGo9qLprLTst
         2wmcggjDDZMb04FBuyh5KADQ3HJVjZ6dDWDUtz/0ekdKX3KDQTzI8XYiiinRl7U2LWkT
         6gmw==
X-Forwarded-Encrypted: i=1; AJvYcCXPGqh/PplFaUJgX7WmDBaDMAZcn8hn0X411gEa8nxRsnOtfkCsFpIw2mtEzIZ5p7i9z1URImDDupr9qmNu2Q==@linaro.org, AJvYcCXmD2lpDVuDhEvu31ONSdtDTTAl3HmEleotrxVkWX1wrXgqg2JXO9ahl0UDbupxjk5wizShXWorU87B2w==@linaro.org
X-Gm-Message-State: AOJu0YyEy5ooKk1dRqPR1aqZ9B1TxK/rmi88r/T+CgJtLrHyEzj7Un5J
	0FLMScb5aBhK+1kzVxKUI5jWOJslCHcfQdgMGn+o8RynrGlZcO7h
X-Google-Smtp-Source: AGHT+IEVrMi7SUj3gDc4PnljMDbfUGQS9M6WFx0DSiUFiYCkcinXMFPRnZOAOrty7uworisOgwpFVQ==
X-Received: by 2002:a05:6512:3e08:b0:52f:2ea:499f with SMTP id 2adb3069b0e04-53546b3b1d7mr12943686e87.24.1725466546316;
        Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408286b2sm2393762e87.172.2024.09.04.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:45 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 04/12] hw/arm: xenpvh: Add support for SMP guests
Date: Wed,  4 Sep 2024 18:15:28 +0200
Message-ID: <20240904161537.664189-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O/k4MuNGqB0K

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add SMP support for Xen PVH ARM guests.
Create ms->smp.max_cpus ioreq servers to handle hotplug.

Note that ms->smp.max_cpus will be passed to us by the
user (Xen tools) set to the guests maxvcpus.

The value in mc->max_cpus is an absolute maximum for the
-smp option and won't be used to setup ioreq servers unless
the user explicitly specifies it with -smp.

If the user doesn't pass -smp on the command-line, smp.cpus
and smp.max_cpus will default to 1.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index 5f75cc3779..fda65d0d8d 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -173,7 +173,7 @@ static void xen_arm_init(MachineState *machine)
 
     xen_init_ram(machine);
 
-    xen_register_ioreq(xam->state, machine->smp.cpus, &xen_memory_listener);
+    xen_register_ioreq(xam->state, machine->smp.max_cpus, &xen_memory_listener);
 
     xen_create_virtio_mmio_devices(xam);
 
@@ -218,7 +218,26 @@ static void xen_arm_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
     mc->desc = "Xen PVH ARM machine";
     mc->init = xen_arm_init;
-    mc->max_cpus = 1;
+
+    /*
+     * mc->max_cpus holds the MAX value allowed in the -smp command-line opts.
+     *
+     * 1. If users don't pass any -smp option:
+     *   ms->smp.cpus will default to 1.
+     *   ms->smp.max_cpus will default to 1.
+     *
+     * 2. If users pass -smp X:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will also be set to X.
+     *
+     * 3. If users pass -smp X,maxcpus=Y:
+     *   ms->smp.cpus will be set to X.
+     *   ms->smp.max_cpus will be set to Y.
+     *
+     * In scenarios 2 and 3, if X or Y are set to something larger than
+     * mc->max_cpus, QEMU will bail out with an error message.
+     */
+    mc->max_cpus = GUEST_MAX_VCPUS;
     mc->default_machine_opts = "accel=xen";
     /* Set explicitly here to make sure that real ram_size is passed */
     mc->default_ram_size = 0;
-- 
2.43.0
