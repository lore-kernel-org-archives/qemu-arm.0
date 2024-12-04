Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp495657njb;
        Wed, 4 Dec 2024 12:39:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1ZM8i3jaZs8NtNO7Od2TxpODm2k1w1NtAAZqeQfozMYV7nrN13mXjj68OjXwGn4YYy0YZC+ewNt1rAQ==@linaro.org
X-Received: by 2002:a05:6a20:9144:b0:1e0:df5f:63f8 with SMTP id adf61e73a8af0-1e1653f23famr11129930637.36.1733344785115;
        Wed, 04 Dec 2024 12:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344785; cv=none;
        d=google.com; s=arc-20240605;
        b=AQYjVD1WaJ6UXd61738LmkU+SDsZDrB69l9RetkPNiu1nwq9DDmwhY4lVZugMzbUnW
         zmJL32X/N5JCVCsakkzMa6qr5fDkKgWBUNnmYcL1psc6nMV+kP2mvQ6axnGdIWlxUK5Y
         3tJYj+ce1RkXloD1msQkK4tM6KCoYmUzIQgISyGUZieJe7IGTAWEH8ysZOroBulOW8r1
         WBl7OqlyY7rBrOvO/VnGad8lyMIKSTwst8F/uA6+WoD37GebBht/ogZAyUC8z4IwK9T1
         erDxanE2APcCumxoWQSaZsRwektFroeYXsZvqwte7yYQOw1mImP/E55sg7jcg+aRJnme
         PJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        fh=pZhh6oxx4L9/TmN4BkJyIE4Uo7SxDgHlsstBYJEkD4I=;
        b=FMziOKn7X9wWIjA68gW6HhD+MfqYvxbGLvQhIrpf2jjsodtUrT/jwEknWgIrECcDjD
         rFKePK3XnGtYxIEN06MbNAYmxpuuYjV/frljv+V2APbjSWfOkxlMbpgApVMkTuQODGkA
         BTY5zY+dDIDfyQ3D0+XR9iwPTebuvqDEreqWaKuHCfUrpDE20dsfBsh6CHtI99+7VDDs
         I5KgoBXo56G073Rryn/hh+BzLGiEAUL26Iou6TLRKLAa6cwZFsrpq8jc6GH1C3sbKlNv
         pO4Y5mlP0BB0vdNHB5JxpM/NssmkIicK8Xny6EEHO8pwrhPk1QPSMQcqMVprpsTjjwbu
         bUeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYlrDWHG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7259ef16644sor31525b3a.9.2024.12.04.12.39.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 12:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UYlrDWHG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733344785; x=1733949585; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        b=UYlrDWHGEJxhOYkVCTA/Xm1cG7ZVjpM0JVZyKSu1Gt6wpnaJScgXqa0mDycVqXMkJg
         4Txi3HiFZBr8fdRcXVd2QYZKm6NyGDZuUBjBeXAEtZTIT0FXsFRt+whYnSFXw4FkjaKk
         4LL3q2pmGRb9KuSm2PLDXnYqh3Tb9AAVxuSPLqAJC1YJ+McwzHhYpfLwhmqIh5pM1Rg+
         A46qZYJ8HXSdWESwD4vm1X/jvCHIpM6xmsZ4mgqitW676vUsdwQg14ZxIgGzSq5CaOSj
         dcHVsCJ96qIQBJKF4CtPTTsQWdg/K9S2LqvTU0041Q0QTMda1J88lUwFeO4FTG08Xl1D
         dEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344785; x=1733949585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INFqv3r+4Rnq62Eab2ceon0uXvH0WJurlI9tlF0uERo=;
        b=Y2E+F0qb0iXn1jB790FNQGNPh5Me7ZU7JGVzWOKzyzdT12rH/HBr3WcLMEZ24IA9fp
         IPCuTMFcfHVY1ijUqZo1UQnpzxgyI0StZ/hbAD06dioBEXwhXtObdgqvTSrNZ4tZKxES
         CEf/BMzLhwXfBhEIeh0WyLlGKrSbZL22wX6ezPECdDuWk8wb1S0KB6gOEj1EMei+Y2XX
         VyH8F7yaSCwoskLH1UxMeeSyOEy5/9IDs29reNoKrRBVu3fshG+iCUGGTXW4/bifM+ES
         rDzavevbNeO+MLUjxu++JYAU1ZcsCXiPh4RjhM24Wm8XzDVI3OKGyZy3akkQ1ZAhlhGI
         IghA==
X-Forwarded-Encrypted: i=1; AJvYcCWSTT8PijyFbHo27p0wPnC5ubUMoF4KIe4XaYDZpb7mxF8gElG92E2bELcX64r+UXzal2d6c8hhzt0ckQ==@linaro.org
X-Gm-Message-State: AOJu0YwBFL963WQjV+wNQrTySq30iCiB1Ei9LNTdWKo66yWKfdsMd35u
	dGpFRcR9B1X3dspsV0jJRXfJLQbj/wWdp7DY0gNvXW+5n+TgUFgfM34TlWUUefvdyQ==
X-Gm-Gg: ASbGnctN1DvJsmHbYPzCkHJQAga/VM/B5Mh8auZARFHJPjMuKMqSqlHhXVB3V59eM/n
	kmox3elkHJF2vqrrtYMm91Z/pcYNpUfWKfmRTDKpX5cOD6ON9Jk6AqI2+i7UkKGO3pzu914ePMW
	8x0W+D8n59hhBNKPzqMsPMcabn4yDevD5a0Mo7j5FCz9SQsTubwhrK15LwlOlUhNG5zT095AIzj
	MKe8sG6sYH84D9Z+bCTjBpiDhou9uhW55fS7zF94CRv70cjwf0CLZsLSaOKvcnXFBP+jkWw8IQA
	5fAOZoDH
X-Google-Smtp-Source: AGHT+IEXwxk9YXiYm9HZonpNhGit3TZcpef++9rTEdAkFcAHlUMUvL6FptDpINRvxcL0pLYseoFEKA==
X-Received: by 2002:a17:90b:35d2:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ef011f67cfmr9633254a91.11.1733344784688;
        Wed, 04 Dec 2024 12:39:44 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700cc6esm1873117a91.21.2024.12.04.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:39:44 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	qemu-arm@nongnu.org,
	Troy Lee <leetroy@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	alex.bennee@linaro.org,
	Alistair Francis <alistair@alistair23.me>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 4/4] docs/system/arm/virt: document missing properties
Date: Wed,  4 Dec 2024 12:39:12 -0800
Message-Id: <20241204203912.3037515-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 28Vnf/7h0EXv

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 11ceb898264..d25275c27ce 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -169,10 +169,18 @@ iommu
   ``smmuv3``
     Create an SMMUv3
 
+default-bus-bypass-iommu
+  Set ``on``/``off`` to enable/disable `bypass_iommu
+  <https://gitlab.com/qemu-project/qemu/-/blob/master/docs/bypass-iommu.txt>`_
+  for default root bus.
+
 ras
   Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
   using ACPI and guest external abort exceptions. The default is off.
 
+acpi
+  Set ``on``/``off``/``auto`` to enable/disable ACPI.
+
 dtb-randomness
   Set ``on``/``off`` to pass random seeds via the guest DTB
   rng-seed and kaslr-seed nodes (in both "/chosen" and
@@ -186,6 +194,14 @@ dtb-randomness
 dtb-kaslr-seed
   A deprecated synonym for dtb-randomness.
 
+x-oem-id
+  Set string (up to 6 bytes) to override the default value of field OEMID in ACPI
+  table header.
+
+x-oem-table-id
+  Set string (up to 8 bytes) to override the default value of field OEM Table ID
+  in ACPI table header.
+
 Linux guest kernel configuration
 """"""""""""""""""""""""""""""""
 
-- 
2.39.5
