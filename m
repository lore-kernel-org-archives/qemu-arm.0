Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3564611dlb;
        Thu, 4 Jul 2024 05:16:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWTf2nV6iZZ0xQp3DhZ98WJ7vQD75lNGVHD3vJS6jMB8ZEHj3IqzdMk9ulZrkTDdhSnwUqVwnpSzp8hW6kaA6wCzVhJdAY
X-Received: by 2002:a7b:cb4e:0:b0:423:6957:89bd with SMTP id 5b1f17b1804b1-4264a3e3508mr11149635e9.12.1720095372509;
        Thu, 04 Jul 2024 05:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720095372; cv=none;
        d=google.com; s=arc-20160816;
        b=ECH8eylykdO9moIWZLv8aP8C1otYPiDbMXl83TvHelj+vXlkMF4Rt0z2+Sis/e8Gwh
         GVKaDnGC8rHvIMjVOlNppA7Vr6tjDU/lvmNV6DkHtiDLSBxCjy0bSYyViE7FXE2PoOZB
         JnWG2OVxgyK/9Pe6406VnrivU0klj40hq8tQkhqYw6euWVGmC5rd3RM/VLPXa00hciBW
         aa03sXpK9Ob+q3lQND7kmQpHXhRsZlUkPE16T00U5E896PQ6xM+ICWwK01Nv9tvwjprv
         JCJFmN5ayzBFD1N5xL5t5daANHPq6BppzsmLlGNy0KxCBYUNlGKhdMiMzXbNiN/SDzRZ
         ll1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sebo8kp7DAxDc5R9inOIScJcgh+uRNdHOYeHTAuds3E=;
        fh=P4w+ZDFIOJQq3m2C779jyd8od//d7o29hFOME4JV57I=;
        b=ZxY9AwF8cA8q4/0wQ/1bm6qnYTrYumbUwY/NJ+WW8UL+SiDXRdTWG+QFq85yMBvvqs
         4WH3IFhBbClhgkaU6a3YRe9OpHYRj9wg7CV4agSMdyaTz1W0qDowrNaM+X1Gie9DRdRT
         Bj0+tEsVji05L/oNuwSurh0AaE/ohqZ5+KRixg0Gr5H052m/bc/dwEAEUIhghZajOyQB
         TvWNRyHdZKNm4OF+HRkyd9F6rOfPQKWrkP9hNlCN8N2MMDWoxxQklQC/SedE5Xv6EqJE
         cbfdil9QLocVR4Pn5YdKs9pWwhwi5/fJMu9/Ff1IhNoyTh1GHfJYCT+ifS1jVZHE0Nur
         TyuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7WGhcAF;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4257a1207e1sor29496605e9.11.2024.07.04.05.16.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 05:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7WGhcAF;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720095372; x=1720700172; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sebo8kp7DAxDc5R9inOIScJcgh+uRNdHOYeHTAuds3E=;
        b=Q7WGhcAF9FC46sr0xgriT5SS5LJCnmqEjK2Ol2l1qBL7GrGU3is/ceJ284+QA9hjPf
         jul63meoBXLPGkxMdjEUmEKNEtQGAKaULqwp0Xw8PBkhhhOCBxvSBI+/3DTtbboDzWDc
         dHdqsf1in2fRtkh7cyRAwDibC53KBtBVsfIao7OUvIbkVh6b31BJ4OOkiuHY6/NOuCxX
         GggyfZoEHQLbpQz0KyCGedGR/2amR3SjPmHvXKEqh7P1pOH8O1Ei2Zx/hDQSjgiNYZQ2
         /J119duB0JXeNfSGwZk8aX1CQeO5w1ezaUTSxFueCuPBFg6LLzVmdgNym2cR14Wwr/+1
         wxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720095372; x=1720700172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sebo8kp7DAxDc5R9inOIScJcgh+uRNdHOYeHTAuds3E=;
        b=j+z79xd1Svy8ZxeV3KjVh2HOxwC1h9OzTDKj/yf4ZPr1JrE09/E+KfYLcUs1RDxkjh
         EHowlWLePA6vlp4fg4HyUW8hGZ4EBV8Nhrga6ixpQsc+aoFbSk+OqcHrTF0CmfoI5kZW
         wuv5JbqIkiylkPZosw/obDRBbpT2mldX/r15fNT/lxz+AAD4DFOfD/FLiaFkUY67FgRv
         4S6MSRhdyTJfojY6+XbcaEH3D+75y9ldlk5YOtkyMRi+kvWz+g/1WczMRtsEla0a0un2
         3ohYuIbRc3wF/FNuywT38urCjGSK5R2rS6Nrr5aIFx1yV0MAc2mkrpjBUDi5gzPhVcwY
         OOxA==
X-Forwarded-Encrypted: i=1; AJvYcCXVSlSWmzYjGugrsfIoG5U8P36kfi5OI0784guhK7Oicor+SanJlo+m9YEv5yh06LoMQ4upuO/RRoa9O9H3Ikizf+ThP6uQ
X-Gm-Message-State: AOJu0Yw+AALZBH2l0u8N/PsT7BRpKfS78XWI/+FBD+dWhmUH0tFRcqKr
	/Uk4hgVBDCQTwgoPNzUItpDaAdFx5dOOUsGh1f8/wlLG0fGcrEmiwSoP6fuOhgT3Tg==
X-Google-Smtp-Source: AGHT+IGWtIyHVdRRDQf6UCO/aG+PUwZ52bIwCYcWjqtTvhy4DkR8vJ0g+c0CIxrJtgmEO3DIoK5/HA==
X-Received: by 2002:a05:600c:158b:b0:422:62db:5a02 with SMTP id 5b1f17b1804b1-4264a4561d7mr10600945e9.32.1720095372023;
        Thu, 04 Jul 2024 05:16:12 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-241.37.6.160.tellas.gr. [37.6.160.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5casm22471015e9.32.2024.07.04.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:16:11 -0700 (PDT)
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
Subject: [RFC PATCH v4 7/7] DO NOT MERGE: replace TYPE_PL011 with x-pl011-rust in arm virt machine
Date: Thu,  4 Jul 2024 15:15:43 +0300
Message-ID: <99604de6015556c4dc57bef0fa89e53b1c42b4c6.1720094395.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <rust-pl011-rfc-v4.git.manos.pitsidianakis@linaro.org>
References: <rust-pl011-rfc-v4.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: qgXyX0UzowhU

Convenience patch for testing the rust device.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0c68d66a3..49dd0b815e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -929,7 +929,11 @@ static void create_uart(const VirtMachineState *vms, int uart,
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
