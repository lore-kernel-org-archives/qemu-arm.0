Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472392njb;
        Mon, 3 Feb 2025 16:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa+tzbcV0W6R4w7tzbFNZevY2/95LAZMU7bRhFT1wltNc9QUUB8udDTPtJudLgsu5yqYeq4ZK/2BgNrQ==@linaro.org
X-Received: by 2002:a05:600c:296:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-438e256a851mr165729585e9.15.1738628599738;
        Mon, 03 Feb 2025 16:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628599; cv=none;
        d=google.com; s=arc-20240605;
        b=XaetDb8KmTlY/2j5ZugezzmITY7YyI4PSTz5I0xPd3O0j7wJOD3SJgEyBjcuhOCOXl
         /nyAA93IU1WxcK+jOWJxiWEjMXcildU56Z71hJF5fXmzSTQlO/M30ER7ES2KHJXbT9Bb
         sU0uMdXjXuA57Uet3y8iU612wNaZPtR0CponHT7sDXGVgFw0dymQrqflU5uQadqUaDoT
         zu/Z+xS+xEWSDa+zPUVFOBXGN278h4BAIr8OK1d1iI8Tf+1WbGqZFwCqhlTPiODgfUt4
         zAWr98f7j25oGFEq1JZEOhJ4DZkt1cK+BF93GUAq4n/tJniffuyrzvSDBVorDcTekAG4
         4KwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7ETuzJ6SLiQ/NiVSSl3xkPrhN42XnijAgudKaENxFFg=;
        fh=c+rFr7LkvaAVpO4jt8Afy34EtrOt17KZKNAmmZ9Ttec=;
        b=ZUparDskxDMnE6Q/65sfP62d/5VEMume+R6ObgbTj/5nh9/5KitYs1y2ZUSk34w3Nq
         Du/NjaF7FFIKnq0Dv4I1kKWIUfTuW3ZHYkPPCI5taucc8XrwGl7zJfvpLQhLrrFDfilZ
         A2R1pSOa5ZG0tvdghM1iS89TwodFgR1EDEQR799Vm/kEfA38b9QS6Pnsjaz8PCz1SW26
         mid8VggOMAWYw5YEOBwljMP6bfnynOeYmXYexSnGDYLJKHHGG2N3jdU8FM+r2qKn+P32
         4E60C7t/F4nYam2roNZrQTfrzZ/meF4+cqujug8VAagg10DK8MA5qjpwMOZ6paD7LEqU
         oadw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/ocy6b/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23d6a39sor45499735e9.2.2025.02.03.16.23.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/ocy6b/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628599; x=1739233399; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ETuzJ6SLiQ/NiVSSl3xkPrhN42XnijAgudKaENxFFg=;
        b=T/ocy6b/Ci+uD05UnU1/i+Vo0frrInYamQfKiUFGdVV4sciSQxbtz/gExs3nvOBARK
         xxN2MAd1eqspO49uT7op8iM6Wl2ZSDQI1/BZqRwbcFDjYfVignQGUKr8cfu/i9pO34zg
         VFnFX4PpCHFtInZOXZwxpZz196jHifug+lobHxamx2xRWMjv3rkjm3xCLis3aZYE7r9Q
         +ErYIJuTw0LaRvJuAJ30X7F75nw/1PlhPpvhtkW5uPEwgrNzjwEEaNNkL6G3bMKKtoys
         98SYngd2IwINRR8KLRq6za+uTPZ3T8PCJ0Ar9dBU9WEycJ2sV4Ibv0aeipKQIzTztYD/
         oc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628599; x=1739233399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ETuzJ6SLiQ/NiVSSl3xkPrhN42XnijAgudKaENxFFg=;
        b=hxL8KFQUKwO+EDSHw3I9JgQrTkczGZtTqMn3I1YSYcGJ6i1+z7EZ1af5OMMSLmfqo2
         kXcLX+8syREZXSVzjIdDbZvtdic9/0J9MDyp6D3Znrk+H1t53NRumN0weDMFeWW5J6Ps
         rSRA2sLZp1bI6enHefmhs0WdT5ozLiIeDgGtIbGqhSGW9Y1Lcb55eHATM2COmnlvSWGi
         VTOBTXHmatxFzyjG0Xjx5IWU/m6GLR+ezEhDB6o+yVPM3DWdU/inHg41sXRtQb7T3qUe
         jhn46nCkAa9upeACX3ofQj0mcLvoqmJqJF4W3EwxXDVf7MyURR2H2LQD9p8I2H7xBYHL
         EZng==
X-Forwarded-Encrypted: i=1; AJvYcCUwQ8TzVlHPxK8ilLV3Gu/ek0apdDBPJfodk00GrroyQfr329G2L3QhLiUf4IhNfjGy5TI/Ukie9KNPzA==@linaro.org
X-Gm-Message-State: AOJu0Yzg9sruXZjRCYnr3F6o+C0H9pOIuMVJgHfmnS0GO2JCagpiScuu
	KWpiHdgwGHivT5ZMjxotAyENxIYV94tchR2ciWIxAcNn+STfQ3dV/pAfbNjd3Hkk3w==
X-Gm-Gg: ASbGncuxSCm/BacFAX4pQJ5/2w1nwmKnfhev379CuiZYehVB9ikWqlQuavI+PFRHH4n
	midkfWHdgxn8JblucRS+08elGglBrJtentPC5x5/vI0N4R/KdQ6UY0s3jksRFvG9wPU58TBsT8P
	QRAYBZR4bKRM+f2SPYPFfSCgvOsdee1mAxMGJ6W7GSXvom2CuQOPy/JSx1qmb4NH8or76u2YEti
	qzE3+q+a4Xja9meqUeKb3OsXd+Cafh2lcTm9nqiozuMjNcCDleN+A7byRdWDO46PM7/aq+L5pju
	sMci57b8bFB114/vlFETrkgnhQyg7th1310TsKkwopmaDd6SMGeh0mT+SN4SyFt9VQ==
X-Google-Smtp-Source: AGHT+IE5eacu+tscRKXYBvGC7D2HiLBrNH0amLlpLTUZJ+7YJSAfPVR1pLS83k8+E9AGhYYQnO6mrQ==
X-Received: by 2002:a5d:5988:0:b0:385:fd07:8616 with SMTP id ffacd0b85a97d-38c5167d80bmr20625537f8f.0.1738628599192;
        Mon, 03 Feb 2025 16:23:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm168179175e9.33.2025.02.03.16.23.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:18 -0800 (PST)
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
Subject: [PATCH v2 06/12] hw/arm/raspi: Consider network interface for B models
Date: Tue,  4 Feb 2025 01:22:34 +0100
Message-ID: <20250204002240.97830-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gv3xlX1/Krnx

Raspberry Pi 'B' models have an ethernet chipset (the LAN9512).
Since we don't yet model it, add a /* TODO */ comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 1a6a1f8ff22..68332fba027 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -143,6 +143,16 @@ static const char *board_type(uint32_t board_rev)
     return types[bt].model;
 }
 
+static bool is_model_b(uint32_t board_rev)
+{
+    return !!strchr(board_type(board_rev), 'B');
+}
+
+static bool has_enet(uint32_t board_rev)
+{
+    return is_model_b(board_rev);
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const ARMInsnFixup smpboot[] = {
@@ -304,6 +314,10 @@ void raspi_base_machine_init(MachineState *machine,
                             machine->kernel_cmdline, &error_abort);
     qdev_realize(DEVICE(soc), NULL, &error_fatal);
 
+    if (has_enet(board_rev)) {
+        /* TODO: model LAN9512 and wire over USB2 */
+    }
+
     /* Create and plug in the SD cards */
     di = drive_get(IF_SD, 0, 0);
     blk = di ? blk_by_legacy_dinfo(di) : NULL;
-- 
2.47.1
