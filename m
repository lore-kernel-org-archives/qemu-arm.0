Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3395746lfm;
        Sat, 4 Jul 2020 07:59:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM9QAyDQ8/kFTk4BunNry+q7oNBnc73MG+KTwD0EATq8CqKqJgw+KyFc45Z7oWl83pCfml
X-Received: by 2002:a25:d4b:: with SMTP id 72mr71491923ybn.22.1593874768408;
        Sat, 04 Jul 2020 07:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874768; cv=none;
        d=google.com; s=arc-20160816;
        b=u0tmelulT7C/LkR6MES45SgurcK/IuzLjC9LovAXqWpCP3TGPnWsPmlkI9VBZEq/xN
         28n0ZRzDl9DAWwP465uEIf82zhYkK2wG8DwjTNzGNKa0x39xxZwqYJdEEmCYWXNNHKcm
         NOva3XXHEd0JtPglqDk02lC7kwThajs+KfCWYbquxT4UphDEwG7ZhcTftTdpOdH1dMAp
         OstyGRoNq/yO/ofXhu6QzFEdJWxFn517JGheekoadLjFhexjMKHNc6G/Fnr3e2PcXnou
         bCjLHQzzfUikAkztQsG1E5sjD/OmOTU2WKW83GhssVfL7Ayo/iHi1bnIGUBBJfQBPGXW
         EzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bNYiPy+H907R6GvRggaZDEAvq/yJ89RNH5vqYDziYiQ=;
        b=XjZIHM03bxzeKZOfwEjIjU7AmYnijZX/2XALsuq3Aj/5s1KtSiH/cXe6RCmcVCftrB
         R25LH/PWIuQYH48tA4vqEJaWgrQ+z8DY5Zf3nDq65GQnCCYSWhrV/h+WQLTfAdky0z6Q
         8LmKJME3A6YT4j9PZQFmHlOnetTPoL9hC9ZGWWTpqC9NTAMy4HYT/QbEaUSC+zU5SLeu
         uWJWa7rtaHbQ40wzlXSrB/IyDaJIzmKdFuLXq2xu+VeOc7k/jEfrvcv3XPI0XMUBLtE+
         J+Wi3OoNCG73S8xkza6vY4HbHMCti9n+XnWbseMq3pgtu+1XU68mjna0ECm2+iNA+u50
         OnLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Zzt2Ao+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si14729417ybp.419.2020.07.04.07.59.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Zzt2Ao+q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjdX-0002Br-Of
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUo-0002AQ-L9; Sat, 04 Jul 2020 10:50:27 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUm-0003rV-C1; Sat, 04 Jul 2020 10:50:26 -0400
Received: by mail-wr1-x441.google.com with SMTP id z13so35769451wrw.5;
 Sat, 04 Jul 2020 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bNYiPy+H907R6GvRggaZDEAvq/yJ89RNH5vqYDziYiQ=;
 b=Zzt2Ao+qbpw+PyTf0gj3H8RK9KRIom4jWcvpaKOt4s1hW0V1FcCCbKJ+J1H1BoamQa
 X7yQWbLBOiWHDKwtYXNcSlpsadQlqloNBTBk3OoIeHNh7YjvW7yMB0amtIHW7A3uKNrF
 KIuBad86H5R6+A+garcJYO5R0cc0W1dnCsIKjrMacUlgm36Fhjt7sIWGaJjruzORr6Mw
 tCeATKmk7k/LQ9OiBic3Z6q8k1mV35zARhSfEfSLPMbQtj1CaWLLBsqEXHNhY7FCgnTB
 UPsPUgFVXy+a2LKVM7IwIcL6sBQUgKI3uk0ZNyDH/kMyxLLse6a/v9qA5iUjYWAwTnNg
 EH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bNYiPy+H907R6GvRggaZDEAvq/yJ89RNH5vqYDziYiQ=;
 b=II66UvMQVxzrR3ZWp9oAXjw8zYByE+Rg0Nohw1w/nWghUnsrJdp+sUh9Q5k5C8KlN2
 C4JPOe/js9EnASubm1nyc2Y9+1RqZSvHDGQ7yFuY2yl45NQ8qMW4ZGd20KgSUpGie5K8
 PRst6FvBTDwQTGNocVtkmDmKK6bYguUyoGHkDHmTNIgalRvr9H42V3tCJ2Fhk3praH0/
 YgDtniE7ZY8mqy4ppyHw6hS/EtOjjiCGyVlFc+r/8pWFefYOP4aQF80yYhWCRNiHld3k
 a95g/hLXALMJ28mXwUdbU2eC0woyqgLeNBb7s/KpWIfsLn9z8ZKtSd/4UIcwtnQHKfd9
 bUyw==
X-Gm-Message-State: AOAM530U7Fdg2/eLplpES5zG8B55LMhIvdBgGb4p00tu6pBdrJ3eak6E
 gUmtPKQl13ZUXbyhjuwGoDv1UsbgMnI=
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43510389wrn.143.1593874222155; 
 Sat, 04 Jul 2020 07:50:22 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 17/26] hw/usb/bus: Rename usb_get_dev_path() as
 usb_get_full_dev_path()
Date: Sat,  4 Jul 2020 16:49:34 +0200
Message-Id: <20200704144943.18292-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L1QAUzoNYCuD

If the device has USB_DEV_FLAG_FULL_PATH set, usb_get_dev_path()
returns the full port path. Rename the function accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index f8901e822c..fad8194bf5 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -13,7 +13,7 @@
 
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
 
-static char *usb_get_dev_path(DeviceState *dev);
+static char *usb_get_full_dev_path(DeviceState *dev);
 static char *usb_get_fw_dev_path(DeviceState *qdev);
 static void usb_qdev_unrealize(DeviceState *qdev);
 
@@ -33,7 +33,7 @@ static void usb_bus_class_init(ObjectClass *klass, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
 
     k->print_dev = usb_bus_dev_print;
-    k->get_dev_path = usb_get_dev_path;
+    k->get_dev_path = usb_get_full_dev_path;
     k->get_fw_dev_path = usb_get_fw_dev_path;
     hc->unplug = qdev_simple_device_unplug_cb;
 }
@@ -577,7 +577,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
                    dev->attached ? ", attached" : "");
 }
 
-static char *usb_get_dev_path(DeviceState *qdev)
+static char *usb_get_full_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
 
-- 
2.21.3

