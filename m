Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5309054njc;
        Fri, 22 Nov 2024 03:20:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfiuxImhda8TqbmAWz2Vegoc/JAoKCdXZFyyRbG/Eb/hl7IQ4ea+bXjM8SY1h0qu5xCitdOjL+RurUAA==@linaro.org
X-Google-Smtp-Source: AGHT+IGL180JPVccXjTuVaZT7hzoH0yFQ0BgHFYy/2ClUNeVBtlNh/yLqh+yNXqWhDicTRGaGqJF
X-Received: by 2002:a05:622a:1a17:b0:460:dc96:27bd with SMTP id d75a77b69052e-4652f423a51mr99643671cf.14.1732274408160;
        Fri, 22 Nov 2024 03:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732274408; cv=none;
        d=google.com; s=arc-20240605;
        b=GtIxUYoJWBPuz0ctAlb5fw+hcbrUb1UbK7Ug7j0jwMY3ifmJrrB61nvBxtX+y9WnU5
         e8TFe6GmUueMPP+j/jhst4X9uaiFN6PXxC+RFYSsP/jtcjji7tpXC0lgwlEND5xxs2J7
         hNL/TzSIxtSxwx/N8CnoDFMs/LRx/shd+4JduGlsKDzWzrvCgh81sk+RYAizu6ocA6Ck
         jtP4NUEjGw3QJhnRFUQDlWW03O6zPTPdRxQFHaF0jKXcGJGVATp5E5mQoSKT1YyAC8Hc
         EYL35jmw+mCVR9DZpW38YfTTp2Sx3XIQUAg+60pXumlBaJaHMz5ByHQJx8pIyyZh9QHK
         6BiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2hRSTyr9LseUA345HjOb58N9q4glOwPpxbZ3ixu2HJM=;
        fh=r8/Xd+xlSx+2zxRcDRA1i+KaCwf/Nq4kCJncYfTcqJs=;
        b=ILYAKzsXOKwfd2d4JBK91iTmd4xNF4kxXraOd31FFkQQwtdUps7cPJBYPJisOQkVyg
         gyWZeJDDJDTJEVY+VTa2v3qAsvgnvZUUhXGsX+RL73xJt94g7JJAfBuOP1J8iznbBobV
         p070E8ZRjC8gDcQFwWmkcxgrJjchI+gmuqG4M4sSHcu+ktCLAoLg3lRFuuZxoy/NTnmz
         YtzliSPN2xsof7dSDySTBtF/i7xM4b5+vwIpcfI0zRw0pe7W48qfFlaSMDa4ZsbPU/wy
         NJB0G9en9yrbwujRZubYR9FnzETGTtZqPl5ihCxTKrTQejDzFzEpMQ+rcbFL5zzcKEkO
         8Zqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oikOljE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4653c48ccc0si19226931cf.467.2024.11.22.03.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2024 03:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oikOljE9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tERhg-0007du-Fw; Fri, 22 Nov 2024 06:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tERhe-0007d0-T2
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 06:19:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tERhY-00069c-Jn
 for qemu-arm@nongnu.org; Fri, 22 Nov 2024 06:19:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so17756865e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Nov 2024 03:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732274390; x=1732879190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hRSTyr9LseUA345HjOb58N9q4glOwPpxbZ3ixu2HJM=;
 b=oikOljE90Xisob9a6/Lh3s85Tkc1LtG+zrjU5dpp1zy0iBxvUvE5X2U3MYRmFoH21A
 aetkbbCssPXAXvcLuStR+LkC9SPS4bsQ31/1AMcZ6bEeSOTevI+AEdNjMhOUMgEUQlXu
 Y39rMy78xAYo7Mah4Xph8fgEylyWMTXlN/GelNJqBYaHk6YK4A+ySk12fSI4hqoAkwK5
 WgEI7XBH3xZAlMGwOWuBKe6L+ioy2wUMnOHeWW3+BsMNI95twX57zN09LfcZXVMjddfB
 PUhzu0LDQUX/gw3p8vu9SWuL5Cfrc6/IsddAHZsCnlGB9W3gPMsruJgP/Ks2HeyTsQ6V
 4F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732274390; x=1732879190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hRSTyr9LseUA345HjOb58N9q4glOwPpxbZ3ixu2HJM=;
 b=udhmdLEPZ+hKvpCxA+OibKpZKDyVuyXoF3iogr1twmaIWZDspz6B0J6XflKy5w//qe
 t8iYFIToqxCGEGEvkt4x8acs8tLrdakWGl0fva+ABhvmBbb7kt4AQTpMgbbiBkYOECCV
 KLiQKYqG1lvtU1+LAya9+DZJxofmOT/cFBTrT16dhLC5L4lzMBpYUO1/z/RJVvMmVxTL
 mp2JLMzgvcDlQVZv+kTko2WOwps5pYXd7EfKZLI3z6u32biI0g3yUiLtLpDE+e1/CY+U
 GCfCOUYMqFUte0LTaPmr/hmAN1MwSl5C1OR6fQat0pfFPzPH8aGVZ7ghwi5CTgJSHbqo
 BYhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpGuHrToihdqvZdfXTEDZoPA+F2ej8MxAuf69CdmYFs36wt7WUp8jobyZVK4algp2V02oBEZ/RBw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2Fd1OerjmfWa20UkdkuKtYTHDNHIYK6RbkhyPIJf1TurAo0zd
 jfdJ3o/beH2lbnz3IAqU1iqnjb1ixX3KTBMcmC4G+Kn91PIZFt9JaW4VpfI9NZA=
X-Gm-Gg: ASbGncvBYCjR3OgFf0HUpBv3exGeQrPS3mOoXbLuOAlgAkak9W6tN7lm/uocXlAx5yi
 72THrQq79sLNIGdTHiNWQfvOG7znjW6BkqJ6SXdLk52hLIUCq4ZzwTVUL+p/Fu8DCxNbLeW0ct+
 l2kZ4+PmOiRCyz/Wvwx3OyTfTLzfgVwR33Kx4K6kfOXix2yRCMC6eSWP+5aWH42jqVFdvbQ6NdG
 1AsyYJMBLSsrwrpuvh2KjCOu4nales7DE3gpcrOjjxE+SZZuwQanbka/Yv5ECDfNWFmYc9RynMt
X-Received: by 2002:a05:600c:4f90:b0:431:4fa0:2e0b with SMTP id
 5b1f17b1804b1-433ce4af2eemr16585165e9.28.1732274389724; 
 Fri, 22 Nov 2024 03:19:49 -0800 (PST)
Received: from localhost.localdomain ([176.187.211.33])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43366cbcd17sm65040505e9.1.2024.11.22.03.19.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Nov 2024 03:19:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Helge Deller <deller@gmx.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/3] hw/scsi/spapr_vscsi: Call
 scsi_bus_legacy_handle_cmdline() in REALIZE
Date: Fri, 22 Nov 2024 12:19:37 +0100
Message-ID: <20241122111939.11936-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122111939.11936-1-philmd@linaro.org>
References: <20241122111939.11936-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /rrsLEtYuv0P

Call scsi_bus_legacy_handle_cmdline() in the DeviceRealize
handler, just after scsi_bus_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/spapr_vscsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index c75a6c8807..8e76bfd7ce 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1218,6 +1218,7 @@ static void spapr_vscsi_realize(SpaprVioDevice *dev, Error **errp)
     dev->crq.SendFunc = vscsi_do_crq;
 
     scsi_bus_init(&s->bus, sizeof(s->bus), DEVICE(dev), &vscsi_scsi_info);
+    scsi_bus_legacy_handle_cmdline(&s->bus);
 
     /* ibmvscsi SCSI bus does not allow hotplug. */
     qbus_set_hotplug_handler(BUS(&s->bus), NULL);
@@ -1227,10 +1228,9 @@ void spapr_vscsi_create(SpaprVioBus *bus)
 {
     DeviceState *dev;
 
-    dev = qdev_new("spapr-vscsi");
+    dev = qdev_new(TYPE_VIO_SPAPR_VSCSI_DEVICE);
 
     qdev_realize_and_unref(dev, &bus->bus, &error_fatal);
-    scsi_bus_legacy_handle_cmdline(&VIO_SPAPR_VSCSI_DEVICE(dev)->bus);
 }
 
 static int spapr_vscsi_devnode(SpaprVioDevice *dev, void *fdt, int node_off)
-- 
2.45.2

