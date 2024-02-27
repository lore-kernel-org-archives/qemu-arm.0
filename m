Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543214ejf;
        Tue, 27 Feb 2024 00:41:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4JaetWl45QFcr+Fads8frYImluB7xxl6RmdWPaOMw42MORThbfSs/TXS0jpIuNyc2JU6zEM8cvkCQ5wfPW1LepIy5Sa0f
X-Google-Smtp-Source: AGHT+IG96xxJTED6YURIoUUKWD6B3PNT0E1IJ0SqMCL070HRmcB+UYyVeTF+FcE1DtY98/77lMOv
X-Received: by 2002:a05:6102:ce:b0:471:e1aa:60d9 with SMTP id u14-20020a05610200ce00b00471e1aa60d9mr4377046vsp.23.1709023261385;
        Tue, 27 Feb 2024 00:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023261; cv=none;
        d=google.com; s=arc-20160816;
        b=PwrSp9OUdelSmPEfS6C09NbCIF3NiFvHAKtg6112ukKayl9vdiSe94n7czVA1Aimdg
         5rmpRVv/IF5TIwMb55BgLlHKaXOfEH72wdbF43TaYKSaMphfD89+JoG5FD18oBsXJwT6
         zTQsy+q72Z6f8DRhAriESff/Qld/3P4OzLYrpaxZWqslTS/pDiaf3ZueKHQIgejytCTh
         IbpWXCl0FwXSX2O/nMNW3hwYKhLEhi9sxQ4NRSdlbayDNFzvGBpoXaOGGS133zkFlNsh
         1bD6ywOftPm9xIqy1poEBDJTpwDmySW6wKeS+2idwn4roTriQXEOnCGAL6bboGT90Xbs
         B3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VFksONIBdqYx5443JbI5pC5i+NSIyfbO3mN1D7EMdV4=;
        fh=4l8bMu+dp8tvNejhVnr00arWnI5zVQgHINePw2DpqEQ=;
        b=CRTZ++AfIGVND3rwlIXibhAjtnCftr4jsmzGLlt+t+PP65q0rY5n616/lZzz+rM/G+
         6MB47A+QRMYTHtBSYGMlr6OBFgeVLYUAp7liU8Te9olu3t26mFgvrDH++cmIkSYRXa1C
         t2bkS4UgHQI6EXe2G6/UjICfMzJIN/gg8s9gL/3yHALoLnC3glaZUAgboxaw3MzoDXmL
         A3Uh9BGVTotktD0ZAbH4ElhLGya+Y4FGsb/r/VtPhHnwfn4OLGu0vZE4EwVFSY9egxff
         pvuv+0xZAV+24W8t7AjTufzLI6DBDnbRwuDBs67L7RwgZyT7rvVT6pQvpd26mVVGhQGm
         y1oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9rBA+wk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020ac84645000000b0042e7f5eb8e2si4701015qto.388.2024.02.27.00.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9rBA+wk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0v-0006MN-3x; Tue, 27 Feb 2024 03:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0t-0006L9-Hj
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0r-0007o6-Vd
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:35 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso31094555e9.0
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023232; x=1709628032; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFksONIBdqYx5443JbI5pC5i+NSIyfbO3mN1D7EMdV4=;
 b=M9rBA+wkHQinY9Wx6xSndxiOK6YJ9GlEZsdqoijNFtW3aNGxtKFPuEmeXDIzQKlDCz
 SQBnmviT8XLh8N3Drff4U2TUIdYpaybaRSTlb0CIx9HNCJvgwkuFDkkiO5jdqmsQmsSQ
 e8dnNwIyHNPLPX7qQSX4hWtBj6eQhiaHDV9yPSLqsmAYek02eblUpy3Wi99ngG42Q2RV
 ucw8naiSVz6SyAwdqYDHngfuFGzmEI2rvIqojZaXR5xnRiWNF/irnVyCdCvyRz+B2n9H
 B3OD/fXU+D1hxVUx+bq9nZMpybJnh8x+g+chBxezQWZu/xducHM0ZEBVM6ZvGmHHWIOc
 nbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023232; x=1709628032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFksONIBdqYx5443JbI5pC5i+NSIyfbO3mN1D7EMdV4=;
 b=HlrtAKdUnjLJuPDYoz+ylNKgy64EtthHtpxSYW1wT2DD1WwOcTsdpbCKFatUrAq35P
 4abH/gp7SAWHKfELAo5ZpgK41ER8SEQZen1veSCny45zTKtPuTQpwYA53NGI8FLQFkuy
 2v8rF+TVRWEeJEPQ5UUZgKhSU6HvMrEKVC/D30ewa9z0R2gJPWgMz17DY8mRpVPykx24
 ux7KeyCXx3bGqDFd52YfTKWj7uJ3wJ9hzvF2Ptn0w1sY29vta4wj9gSLm/mDDCrhXxXa
 JVqCYOYXTwBee8abPIpTvpKj48mbx1jjuDV8j/sGWqseTKeKMlpnEgeE1BpDt0v+boD4
 jVAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTMj2KJXd/kyWL49BBKX0LvJZjKvaaj8E27bzbgY3r0euy44UyVEy5m0pBhfvvRojFqKqcRIzA/YHCSokblr0IwCGv
X-Gm-Message-State: AOJu0YxwACO5CJcMOxO73c5xNJbQO+G2AB/y9Hr6g3KmvhsXjvI3AT3y
 uSiQ0Y075leLEErwCKDbzzNdxsckDQzjvQLEb5H9OI9ivS53A3I0bM1JZn4Y97I=
X-Received: by 2002:a05:600c:3b08:b0:412:a0e5:728f with SMTP id
 m8-20020a05600c3b0800b00412a0e5728fmr5388423wms.21.1709023232617; 
 Tue, 27 Feb 2024 00:40:32 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b00412ad7c8298sm1016497wmq.8.2024.02.27.00.40.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:40:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/30] hw/nubus-device: round Declaration ROM memory region
 address to qemu_target_page_size()
Date: Tue, 27 Feb 2024 09:39:23 +0100
Message-ID: <20240227083948.5427-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bmyUZhom3uW4

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Declaration ROM binary images can be any arbitrary size, however if a host ROM
memory region is not aligned to qemu_target_page_size() then we fail the
"assert(!(iotlb & ~TARGET_PAGE_MASK))" check in tlb_set_page_full().

Ensure that the host ROM memory region is aligned to qemu_target_page_size()
and adjust the offset at which the Declaration ROM image is loaded, since Nubus
ROM images are unusual in that they are aligned to the end of the slot address
space.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20240111102954.449462-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nubus/nubus-device.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 49008e4938..be4cb24696 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -10,6 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
+#include "exec/target_page.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/nubus/nubus.h"
@@ -30,7 +31,8 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     NubusDevice *nd = NUBUS_DEVICE(dev);
     char *name, *path;
     hwaddr slot_offset;
-    int64_t size;
+    int64_t size, align_size;
+    uint8_t *rom_ptr;
     int ret;
 
     /* Super */
@@ -76,16 +78,24 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
         }
 
         name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
-        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
+
+        /*
+         * Ensure ROM memory region is aligned to target page size regardless
+         * of the size of the Declaration ROM image
+         */
+        align_size = ROUND_UP(size, qemu_target_page_size());
+        memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, align_size,
                                &error_abort);
-        ret = load_image_mr(path, &nd->decl_rom);
+        rom_ptr = memory_region_get_ram_ptr(&nd->decl_rom);
+        ret = load_image_size(path, rom_ptr + (uintptr_t)(align_size - size),
+                              size);
         g_free(path);
         g_free(name);
         if (ret < 0) {
             error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
             return;
         }
-        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - size,
+        memory_region_add_subregion(&nd->slot_mem, NUBUS_SLOT_SIZE - align_size,
                                     &nd->decl_rom);
     }
 }
-- 
2.41.0

