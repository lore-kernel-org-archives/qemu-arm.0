Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp838008ejb;
        Mon, 10 Jun 2024 11:23:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHyDmha75OwH7DXXQfoP56efnQVvhXCSPgmvQ8IJOWRLl3Rf2Xny2hxeP5g3gZ+CnY0MPSi156LiJFN7ZsVsvGqMQ0ypAi
X-Received: by 2002:a2e:bc13:0:b0:2ea:c3db:d0bb with SMTP id 38308e7fff4ca-2eadce23ef7mr93139751fa.9.1718043818493;
        Mon, 10 Jun 2024 11:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718043818; cv=none;
        d=google.com; s=arc-20160816;
        b=k9Poc46iagpep9qJrQr1SV4CE+Spa3OjLxD16vNeaxvcaeFaR9C6AzS8mMMeqGrmr1
         f3UYdsIB/6KKbbo7PMgPEvWnWNMftigy8hbkXRqlNxBShdIkXAZBuWg59BmlaCUg1UYb
         2WqhOmszRepJBPiAls85n9mhClM9HynZ/08IJIfGwekYx8urYrC/cci/2LVxhG7jVxAf
         IFl+TtFoZJrMXWPV/OKdtR02b2rX/4diA/284HWGAUAuxNSqFTb7vA9ffmygce8UXjz1
         q+OLPfeP8dLxnuYvtRsy8dBeW5soxR49kSJiSOljQSXMQzHGEhAaPvULd9rfzjvDbv1X
         SWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ySCgik+LBiFClMJnnOBIpi9kKmck863oPvAUWXJIWbk=;
        fh=g8MIp5dHtsffyAkrNclxvnarHGekk5BYo7MsrRJSPgY=;
        b=qTyPGLVkk/qpO7O6Nhgr92PpVWXbJ1AqculTZc6LW1FCYfvMkv89yYBfcgPgEQdttl
         K5BvLrRL/T/zUFPUnS8RqzVvGVHFyQb97+YuK+NIbuvBFieAj8r1GllO+VbrrdokkqVt
         XPtGx1u9v3memnQ0R5+9rRDZTQMuTgjVyCwAfC8cgFpV7COdMaJUZlWkCQ0aED6iD6yY
         n1O6YyyjaLSltljHqLltoI3YKcLQHKq05NGbdefLbEBGD+Bqz4oN5YtwwbQlcjGdqFa1
         +QwtV/RgC3OvdlL97qaaX8SLFpVS+shjxwcOQKyQ1uXushspT4iQhW5yra/8grfd8HZg
         Co2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQg+zeaS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ebe5ae9afcsor6697081fa.7.2024.06.10.11.23.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jun 2024 11:23:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xQg+zeaS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043818; x=1718648618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySCgik+LBiFClMJnnOBIpi9kKmck863oPvAUWXJIWbk=;
        b=xQg+zeaS8+W2qcjTOlde57mwkdggNrDpBH+7904OmexxbQrb2CFev9Onf3M8CttuF0
         FsBrHtlK2Ps1XaFv3iuvejIehLZpAMt4QDgNtfHd+ITEBO7LIP+L0obk/znpXatQMXsK
         vIvY9jYrftcUpoviTPsXB/cmhRS77WGO4iWWYQfXsqREjB8XDUMSA8EVF0kH/Nz3MYL1
         /IfdwNM9T8g9OdwsP+AnvF3LKPUq42OS4FQs36n1WBcf6VaMxbeUkscLX8CzYPXvKnTB
         11wRjx30LhuOXCiqyfpytegB4mhZUkfOyZ6zjRGrMUByOHAwEMls5BmFk0xENeL5InDD
         hIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043818; x=1718648618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySCgik+LBiFClMJnnOBIpi9kKmck863oPvAUWXJIWbk=;
        b=oZDZ0zyAAjbChoGGvK9cUlA4bK0s4wayXnLUiF/Z4Kd7xnwfLKyd1Jse49vA4XUltS
         7H78tqGINewcE3ysyD4++aaKgxjCKujNeg3qQPud+u4UshzQLkAbQiDMcYB1Edt1zoSF
         Uowbmf7L5OqaY6uT6q98gT+iW5ZFE7dH784am2FOwHc9sC5CtZMb85WgFuKfWdqW1CEl
         GecP677vkImwFiLkgibcV3Ji0XY5Azxo1rimJ+o++DOYotxI5HvFiepLI3sOcPBef1Mb
         iPfCmXrz7noxheRm309KnDrC7ernqdlSoFPm+HXGG4uPZrEhUUVvgL52rw/WupCyuvUG
         qIAw==
X-Forwarded-Encrypted: i=1; AJvYcCXCWjYr2nm74SXrrWlMPRER0lLpikMtiVPhjSLuBBpKYSGkyHYPHoYaxYyIZFCT4AYI4jM5K+EDfCXcq+YOwHVyT13vYHHo
X-Gm-Message-State: AOJu0YzkUcrNzXx+Aq7lIU3oXA4Yk9XAvoFclaYnY7Tl0JViUJHDHcc1
	NSrbiScRefg3KURXc5mwa6WPO1W3db6gSS4Hx18UGunt6g1F6eck/d0U02GHLSCd3Q==
X-Google-Smtp-Source: AGHT+IFNBKuk/z+DZg4RS8PmG4cxfZZONBe7Kf+ler9pThCBIX0O/h3fUNcPgeTtowcw5JRg5I80aw==
X-Received: by 2002:a05:651c:1031:b0:2ea:e592:5bfc with SMTP id 38308e7fff4ca-2eae5925cccmr63519711fa.42.1718043817958;
        Mon, 10 Jun 2024 11:23:37 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-33.37.6.162.tellas.gr. [37.6.162.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42161147811sm135487395e9.18.2024.06.10.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:23:37 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
	qemu-arm@nongnu.org
Subject: [RFC PATCH v1 4/6] DO NOT MERGE: replace TYPE_PL011 with x-pl011-rust in arm virt machine
Date: Mon, 10 Jun 2024 21:22:39 +0300
Message-ID: <cf690592ff727cc18e4c9b49827f7b8268fb515f.1718040303.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.rust-pl011-rfc-v1.git.manos.pitsidianakis@linaro.org>
References: <cover.rust-pl011-rfc-v1.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: 8P9cZcQ3L5RO

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..153be0f42d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -912,7 +912,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
     int irq = vms->irqmap[uart];
     const char compat[] = "arm,pl011\0arm,primecell";
     const char clocknames[] = "uartclk\0apb_pclk";
-    DeviceState *dev = qdev_new(TYPE_PL011);
+    DeviceState *dev = qdev_new("x-pl011-rust");
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
     MachineState *ms = MACHINE(vms);
 
-- 
γαῖα πυρί μιχθήτω
