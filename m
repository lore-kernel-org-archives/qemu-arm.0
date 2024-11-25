Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569364njc;
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0N9cDNVnqsN95YnK5oUi5o3aBLq82IskO41HYXqUUOAJnbk2sUcZ2YwtudsJ6L/eSrOpcgxnCeIkArA==@linaro.org
X-Received: by 2002:a05:600c:4712:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-433ce48f8bamr132206755e9.22.1732564775901;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564775; cv=none;
        d=google.com; s=arc-20240605;
        b=A9Xu7pW/VWxgAwSOshIbntnJGhkVzsU0oOFfvQT0phpla9Rxd8Z7kSBvF6ZWcXQuVW
         0UICJ+C7SfMX6vZlBTtqk2mxG47i7VvDYAuJz9cp2CxQ0VIK92wMXA9NA5Nhn/jXvtpn
         ErvG/25BKiP8fMp05JWevgIncH7DyFaxNUW4IV1c7zHGPf6k2z64N+w21/hJI1ejjAmX
         ap95VdUJh13EGz/PPHvKIVlJGNx0NwXLNDhY66C98NabhVeT8dQdpWg/I5Ae7ExU5/+3
         Vbp1b3uU2jGgUdKQZinPJ2M4/jEkuNLtho9+hAtEVpFr1FexsmnCCbXnDp5Y+q9k4uqN
         euVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DywAE1h0x8RJnjNb6ZyyKOUQTV8+QaXBhNrpy+I4lm8=;
        fh=1+YAM4S8AKKUSmeUhO7bPpPWXwsvTRT/P6XG9SQ0yHw=;
        b=INY1l3+Xc9wn17YoZAVarV1G569FNArqc0p/mvltWDRoEXdhbG0EeklJRSY/4Cn44+
         4gEQgCZo9WuGnlNgladAJNfVyZKzZaARtgep6C1sANOvBQiAjOhERmvaVwTFg3vRb1Rp
         2u++yf6pDKWltoVT0MPdG+Hk9PJtIDlxeGPfOyCtRz5QSgEhkDnzSNinHN2lCyd1waVb
         XtjUrN2XYBxoKLw6guO9FppM3k1kk+HaTm8Xd0HNr6Yyet2laeSRvYXgBb3l52jV5aTM
         rRJEdcbRkb1NJb0wmiCeI4lkL5YpRD+hUgvNPWnKm8t2jtvnb3x1tD5apSpzEz0A8ubV
         GZYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zPETncN5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434a3221ee0sor5644235e9.3.2024.11.25.11.59.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zPETncN5;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564775; x=1733169575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DywAE1h0x8RJnjNb6ZyyKOUQTV8+QaXBhNrpy+I4lm8=;
        b=zPETncN5Vsv+ubld8vRoi8RJ1i5U6rXKOWT2H+o0hy4jNGg1K/1mjh0kXjHC5ChpLX
         UUDZEHCxCGaG43XBlniT5fpishYZOte+GzQhHwq7H4egFq6xTQJGd0I75UyWiLldq+5B
         9XyGZIIMkU1IUnUtf3u6E1qBybGfxje87wsgRIWSIr4qO0Q41Qiuw3KL6GzsaA5h+uQw
         7q7gFALwEWiTGqI0qK3Yd4yVbvXJng/dHYZySwK7GDPsHnATkEqMIcrkJvLrik7qhdch
         f8iEfIvkvlBqcIbTt4qdwYKpQHjh0Zxe0aexHr8as0lss+sKuC0jvtD5/j1svVXbZdZW
         p+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564775; x=1733169575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DywAE1h0x8RJnjNb6ZyyKOUQTV8+QaXBhNrpy+I4lm8=;
        b=mMsEcIbsHwXhmpR09KtgHXqjxIzvINx4wJYNiPijQKty7Hq7DC0JYdfne/XOcJamoI
         QdhbAmqlhgmc2uWESMrGvwFtU/3IdQN6qz60TAjNZuXUQ4C/sZ/cmG9QW5t5iBeXjgJb
         WEp7eW9pHMNIT8PtElvoTh61FG3iqq1XU/3kKmwd5s+e0R/tCzpp7MzapxPLZ4hwdHY1
         xw9rQMtvspqc6M2AMHpCvozxIDHDNHRzL8HHzWIRz07GesyRJUTczfLUTUjbch/JenTg
         srPowAlpJQDc33ySE1ye5LHP0YSzigEgb6rXHOlvynULw5L9ICel8on5eB9hK1J6pIgO
         o7LA==
X-Forwarded-Encrypted: i=1; AJvYcCWsBQljAKwSl72U0BRll6cEPOxkzk/zoXA3kyvhwwZ/xEWMvhln59W2dJD89rZmE6l6oOLZRGMQ7JvM/Q==@linaro.org
X-Gm-Message-State: AOJu0Yz9vCfK5Eal0rnUCj/m0WyzCzDich7uZJ1nAW5K+vWE+sqCwBkf
	TpunK20ajZzXhCXA6kPRTlHjXB+YbN8FioimDVeVLV6VRjyoTcDZ/sAPYODRXyaaTg==
X-Gm-Gg: ASbGncuI5zGVHt/Vx/zMlskl4ITv87683wtBAYBxfagvpysdxhbywxmkCFSPQ61x7oj
	/0Q/gUidEWu2ve9DTQIL8D0NDg7uGXHDQI6oELrjm/m0m/MWvOXGOeqpIrPma69WU01nWt7NqeW
	XiJcTFUXAEmRbE+l6LCxAxi/ZFaLvYxjDDddOT5PXM8181MeoLNp0yKfnvBoMhv2MNETyHYxSz4
	V30IjpgTDlIQqaTs//tGlBkMSW4hnuPd3xHPsw2+D7B6sEPiINGLHzNuBBO4IdxNhBZ
X-Google-Smtp-Source: AGHT+IFcITnBM6NuekDsP94qupu4u1K65i9I9qgzFbjGkHe4n3FTfQzWMtxpGxczoDQxw6ewpdqeIQ==
X-Received: by 2002:a05:6000:1788:b0:382:51d7:a2e0 with SMTP id ffacd0b85a97d-38260b61f45mr13353893f8f.27.1732564775393;
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:35 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 19/26] hw/arm/virt: Move virt_flash_create() to machvirt_init()
Date: Mon, 25 Nov 2024 19:56:18 +0000
Message-ID: <20241125195626.856992-21-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1c7cm5e6m32I

For confidential VMs we'll want to skip flash device creation.
Unfortunately, in virt_instance_init() the machine->cgs member has not
yet been initialized, so we cannot check whether confidential guest is
enabled. Move virt_flash_create() to machvirt_init(), where we can
access the machine->cgs member.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index eb94997914..c4cf69ea33 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2124,6 +2124,8 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    virt_flash_create(vms);
+
     possible_cpus = mc->possible_cpu_arch_ids(machine);
 
     /*
@@ -3359,8 +3361,6 @@ static void virt_instance_init(Object *obj)
 
     vms->irqmap = a15irqmap;
 
-    virt_flash_create(vms);
-
     vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
-- 
2.47.0
