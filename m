Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1594481ejb;
        Wed, 19 Jun 2024 13:15:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMczrq4EVGYTi8qNrI8PkUdnqW/8cT5Puo7j2EWOagnXt/hf1BxwxzusM0KgUTvzbNDoanBVyDSOaJzYDUtWhabP9h4sIE
X-Received: by 2002:a05:600c:2d4c:b0:423:34d:b050 with SMTP id 5b1f17b1804b1-42475175515mr23055165e9.9.1718828118681;
        Wed, 19 Jun 2024 13:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718828118; cv=none;
        d=google.com; s=arc-20160816;
        b=i9IIG/0NUp94AeGHM/DxULgt5Lwm5cR4ZABN+X8z4owb9ky3LYQa+uNoPViqY3uYjS
         HQOpVaU+1+46js8dQbJylWKtU2PT7z0JWlE2p+nwaIcLsDPVp44InI0IxuVowrN6cOBQ
         +9mmgTC5X7294vD8tBWIA5xorX2PEfQs2rbG7Kzf834d1kx2BJBgobs/cWJ2QhwX7bUh
         Ftl9FqzzxVHgM/rE+stppN4payVg9raS7YCbG9RQZQA8ItMi8ks92d7F9vPILOE3+54t
         E/dju47MUQion8tcCDsxL1+qzylToyggo2MIptI49/DvUbcG9e9ddFRl6t4WQAk/m2Gk
         WzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        fh=yEKgGBm4WuUrTqnnHX0HpyKkT7dO+J96DDIQmt7J2UE=;
        b=Mr6JRnUdLD0jC/ImIULQDkH09rEoJJcFwVs7pBEstJEY9Wc/bTg9l6qjeClDDAZb4k
         mh9SAbAlmZ2Pb2MWNAXp6Uo8OlxxGnlv3+JT5fsfDY6zKCgEWQJBMiLb+rfIV8ScwmIs
         3cRsvBxoowy5bcba9elV4+3ihV0QSp1cVmqhPjrKt0Q0Tl5cRt/pauChr+7fgXWbpaSb
         8vU9pKLWxuZrkWYi1HZ7GzqyV5Zw2Dd3Kaw5gsaK84taVy+Y0N+V/lCNR5MRrKqAdOzs
         DLUrz1arAOx6QZRwCeMlJ9ZlsPBTDyzTAXE6bP+ynGciSnkKxXpOv9Mb7RJJqsytupUK
         3EKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3D47cCx;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42479aec089sor5072885e9.9.2024.06.19.13.15.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Jun 2024 13:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y3D47cCx;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718828118; x=1719432918; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        b=Y3D47cCxubXV/LNN37UMiqdDNPOPmblZcnhcgcdQRcTTFSkEdFY9x4s/A82WoZWYsV
         FUkgNjIM2YBAnykjy42nIK7BMOuieyZoBASXAPQmA1oXsy5hkza27e2c6AHFbFRhgfu+
         HKeP/U7FHPHOAO+nygiarLINGGWjtFTZnhMYfBba7gXTdJGPTYKCQL7XK05fq/2a5Tg+
         tg/OxZAz63JzJkoQL8FKonKogm4RjyIhVlcNH/rQ9+Xjfct0KvP5RbSgMQ5qwyjGyySX
         olrgTIAZqH+hZ9Lm1wsdzXW2si6vIZinzosJMFANXOGjkSnx2GIBpPLZUbqB1dIIU1IF
         JppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718828118; x=1719432918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfBlhlKJNBiXVGnmXKNokqgloJowB7odFyWS6IGw2Bs=;
        b=IOLZn6+IzHC4QyrLDHiox+Z6Ux1Ytm50IF7NGEl3id9snPdv32P7YTm7u8pIS08m6v
         FMLGxUr7t9vxKYgW58gZwf+WSJicDYp2TDZT9KDY/Dy4NqAEMp9yq+Qv6ICXTh///e/Q
         zO6YhTRa11e/AK7WP6igAVj8jkvX8qX337tMfXFcqLcLL+30+DXvy4SYw15wKG9VC87M
         +5b5Q96d1/oRjsb3+yPWVp4L98/8t7csoWMJQ3r80vK9HVtIn4xel7A50MHBmfL4QfD/
         xT6WQ1GhQ4eXnTIXTjP97zsn1Cp32d10GR8ZlMNu0R4gSJQA/QZ9tt48GzJjJVxokYuG
         BPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfKw5bfB8qsCN8UHjfS6KMqfHWHhmVjoSKY7BHZU02SiiNQu9YMNUNOKExj45RSDJFJFAZa1RzxavpBShoxbf6eICByfxg
X-Gm-Message-State: AOJu0YwzXliMndWjP2zXFIWyJ9hY0c40eYrFfrK4aB/b5E4rrrk4J61J
	JhQVjFWwRsiTbhfnm9w2WUCIJcwq0pA57KSWqOYwRmgtYH8lZlm7UI0/EtCT4QTCIQ==
X-Google-Smtp-Source: AGHT+IFwh4Cg8fzxeEz6lV14WhbpQxy3K3e724v6u9ffOUFEWfQZU+O8YDORo10T7H+BZi+vCZIZnQ==
X-Received: by 2002:a05:600c:3503:b0:422:1a82:3ebf with SMTP id 5b1f17b1804b1-4247529bdb6mr26227915e9.35.1718828118374;
        Wed, 19 Jun 2024 13:15:18 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-103.37.6.162.tellas.gr. [37.6.162.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247101aac6sm45623235e9.0.2024.06.19.13.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 13:15:18 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	rowan.hart@intel.com,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org
Subject: [RFC PATCH v3 5/5] DO NOT MERGE: replace TYPE_PL011 with x-pl011-rust in arm virt machine
Date: Wed, 19 Jun 2024 23:14:02 +0300
Message-ID: <229703c7f4394691f254b02c012ee0d7dcf57afb.1718827153.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org>
References: <rust-pl011-rfc-v3.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: InJSXC7V3r+y

Convenience patch for testing the rust device.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..f33b58ae0d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -912,7 +912,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
     int irq = vms->irqmap[uart];
     const char compat[] = "arm,pl011\0arm,primecell";
     const char clocknames[] = "uartclk\0apb_pclk";
+#ifdef CONFIG_WITH_RUST
+    DeviceState *dev = qdev_new("x-pl011-rust");
+#else
     DeviceState *dev = qdev_new(TYPE_PL011);
+#endif
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
     MachineState *ms = MACHINE(vms);
 
-- 
γαῖα πυρί μιχθήτω
