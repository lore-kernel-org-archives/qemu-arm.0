Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3396438lfm;
        Sat, 4 Jul 2020 08:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7E4J9oNAEBsjFe1orZeBBe6VbmreJtoyNFew+RLUeUy+L1evWTdP27bl7Kjii6PzZWLGZ
X-Received: by 2002:a25:d08c:: with SMTP id h134mr68783839ybg.513.1593874828714;
        Sat, 04 Jul 2020 08:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874828; cv=none;
        d=google.com; s=arc-20160816;
        b=P/DcM2pm/FpTeUH3OY2hlHGtA4reES3NwUhPjMIKsHK+Qz41EDID3qVW1SSGvbCz02
         6Tpi9tPomvtwuzfiPtvIAm3dBmcN/aefXgWLeS0CW0CfIRa3R9H/krRrbz6Ry/oTQYc+
         SA/uG9PqyUlv/wOC9E6b8eooprHrpl6xlYbogoOBK0S7RR0iBzCJ+WTjCGiGodQVjeEV
         0x7nLKp9hgtsDdswCLKZeyXJwjr+F3Q6h1jN/7VJQlVHR7DNVjZxerhRVOPzH6mwUhIc
         dpvJFQzxf7TnbYx+ZkOmj49eOIOca+JPzHT5fs3Y6iNgIFL/EuOLSKmk+9w4c29+mJC6
         w9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LwCcRU3ITBZcN/p8m4Tvly+Gfq57t4rX34Kk3Uzziqs=;
        b=Vtlkrt0HVBRV/ObofMD2n75jzt8G9FyOTjluCXLeKtXey7AtVfIBj7O3xS6fQlTm74
         GE0LDrsTo0rs0wvsgBslh0uJ/np51jR3MT/uBph55tN32DDccu8CIPqqSNngBT8SKcJE
         6DEGx4tPA0GPDr0JXhteI0wZ0YeQUpnB/oE+XVlHAxM3cyLIPn5tONYKHJVE7WnX9qFg
         fsqXEeumBaxAn2ba0Xd5lDmCC2nGxmzJqVbFTrjbY1yKah3fFCfDY4EuBURClNg73ERu
         tyvhLLkj21a2jLXVX8i1uGv+DxyLN/quC2qgOh3pjlU3CT6FQ9cke9zmYDJ/jJIOcDLD
         weaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oKjMAbLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e79si14288367yba.493.2020.07.04.08.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oKjMAbLQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjeV-0004IR-Tq
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUm-00028B-4p; Sat, 04 Jul 2020 10:50:25 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUk-0003q0-NQ; Sat, 04 Jul 2020 10:50:23 -0400
Received: by mail-wm1-x341.google.com with SMTP id f18so37074414wml.3;
 Sat, 04 Jul 2020 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwCcRU3ITBZcN/p8m4Tvly+Gfq57t4rX34Kk3Uzziqs=;
 b=oKjMAbLQ2Nbdo7AVZTEMo5rKzXNXebbxS2YHgA5kZDA2Z2+DxgsuBaop4Nf7YP0t9g
 825K7Sz5l6DRKW2FWV64F6Y8PFEbfBZ/8mNGGq8q8I/v/XzgiVoT/c6cLtJ4Wq4+y8s/
 ZyQu3ZX70MOw0YMf2jRU84FoSuY8lwe6rfsONGi0EvhvcQH4agyx8WdTlthVPz7oUMLd
 7gZ2JkRsngTeq9VmBw6iuSdlXJYxQF7UzAOPFbD80qjvobuW2TUKX0fMm3Fjk3Rm4noB
 rWoSeUrHYZkkLtcx+JFqgKhA77mwlMll57o/tAzzPnbS9XSESKlGwrsNVmP1tPkGSkA/
 JlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LwCcRU3ITBZcN/p8m4Tvly+Gfq57t4rX34Kk3Uzziqs=;
 b=JU9ZGLfp+IKrelXi+y+CRQ0VhaCkexDDJ7h1rbIyzRzUjdSBXxOfdOMn1aPNFfxIe/
 FaV9ttEf13z26+sqbf5OYyZWewdtgXynir+BwxjDB4ieKWyOud2IaGh+Skqn8YP/Lp5F
 RFbYQvvK0xf/ceyCnS28d5B1SesKuwMh7IorXu4yorCgQF4uYYIo7ZTLc4zAa4Txv+vR
 YvRsjqITjj2iDe2s/zA9RWrvnRL5PCjt/jc31k9mn6ZdWqP4tymOowqtKM7fmKvwovlj
 3QQXbjLsQGG3UJKMXMnq44i/NPqC37hZlKOxpkKmLuWCuvfuk3Q225EwgL6DktBdWTH7
 +MwA==
X-Gm-Message-State: AOAM533khQ0XpLCK8Osqv+UkveTMFGDCStAjJ3Wo62U6dJtZH4lZwGlF
 L0Wg19e3BCQ7CpkJlOCDnInCimklmTo=
X-Received: by 2002:a1c:b686:: with SMTP id
 g128mr43033346wmf.145.1593874220071; 
 Sat, 04 Jul 2020 07:50:20 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 16/26] hw/usb/bus: Simplify usb_get_dev_path()
Date: Sat,  4 Jul 2020 16:49:33 +0200
Message-Id: <20200704144943.18292-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
X-TUID: IN+S7tEoGFXq

Simplify usb_get_dev_path() a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/bus.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 111c3af7c1..f8901e822c 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -580,19 +580,18 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
 static char *usb_get_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-    DeviceState *hcd = qdev->parent_bus->parent;
-    char *id = NULL;
 
     if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
-        id = qdev_get_dev_path(hcd);
-    }
-    if (id) {
-        char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
-        g_free(id);
-        return ret;
-    } else {
-        return g_strdup(dev->port->path);
+        DeviceState *hcd = qdev->parent_bus->parent;
+        char *id = qdev_get_dev_path(hcd);
+
+        if (id) {
+            char *ret = g_strdup_printf("%s/%s", id, dev->port->path);
+            g_free(id);
+            return ret;
+        }
     }
+    return g_strdup(dev->port->path);
 }
 
 static char *usb_get_fw_dev_path(DeviceState *qdev)
-- 
2.21.3

