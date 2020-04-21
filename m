Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5034891lfm;
        Tue, 21 Apr 2020 05:27:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJi/d5i1Lj9xyJPU8TP/v2ii5QBclBajnNBlWLo4qJWgGsMOjxAm5YT0EOhOWw9re1FO0sK
X-Received: by 2002:a37:71c4:: with SMTP id m187mr20912934qkc.4.1587472056940;
        Tue, 21 Apr 2020 05:27:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587472056; cv=none;
        d=google.com; s=arc-20160816;
        b=RIEodFlCtNR1momhXfifdAxASlNp224upEpvZclyHykhYHpN5InyCzcvjKw27zI52z
         9UTxMMU/kkziNH5x9g+DmmEVQwx2yZ65Z9adrszbOUCAgj5CcB/y62bCue4SY9pOgW6R
         qd4g5YoXdHwaeJNrV5Z29SzbZ5qtNhghlRXrgzsagDr7ySVVWt4GTapM8KbK38R1DrlT
         oVM9dedONHrg8+LAZSY9N7ni7Cue/21qMkr92OGOo+EOnNCWzg13EbnGP8QK4YWQ6vBC
         MCZ3tqdfHStL3yaDEg/jZj2rPnRLliPBNKCF7birjDZhjYCxGZj1rNLV1Fx9xtVOn3it
         L+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6IZGXEDwfoPtCg1GsMDYigPQKwJxDM34TttvkoqeAQE=;
        b=bMd1f4KVJ5F/SMqfHYn+w/cIv1tqnPFIKjD17nCZjRdEaeqUpaSK5eR6mv6S6fiqp1
         VjHNf0tjbUSzk6NFDB0dZky7t1QtVlBCNV95Alu6c300zoe1p+d/hJEXLuwgJAfqYTbd
         UmrL7to2Q/XjhQKIoGqQOcfKpJg+CZu1htGHJ+oCdlhtbqRzQ2SGznXcXBPZb63UW9Qt
         zsGiOJ9rpI+H3B3TgkUBfWJKU5Id/zRlin2APogQOtPdzCj0AKpqkZZPGs6rwh0Uf3hq
         8S5jmID1jHW+dzrljsBulWS5nrJGXSrCNVTLoi+AZlnnAM0vut4XXHFgDUBQ4jmA4KSk
         iFHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cld4TGjX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h60si1463608qtd.377.2020.04.21.05.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:27:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cld4TGjX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQs00-0004gE-73
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpm-0005ho-EC
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:17:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpk-0006uH-Qe
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:17:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpi-0006dA-SF; Tue, 21 Apr 2020 08:16:59 -0400
Received: by mail-wm1-x343.google.com with SMTP id y24so3411611wma.4;
 Tue, 21 Apr 2020 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6IZGXEDwfoPtCg1GsMDYigPQKwJxDM34TttvkoqeAQE=;
 b=cld4TGjXlImqH0i0Lx9y7Jn/yVaEqLd0qkfCoCKNfcIqctdkFSoFFTgxOLZY3AffYE
 FM0xjenwG0+N2/SINbmuvXhTOZ5hgHiS3GCsDLDCSCs5rUtDDVUNzrFbvSZDdvAoFZkJ
 s5VlXJwhMC9Zp8/Gc3IZx3lmB07cvvxXqgnjRd+aIEeXPU/mmsgh4KD8JWi3MN1n/dEg
 aLYTAId3WRlgFST9uUntla4IdEFECOezHme9rdd346di9T+O2W5fOMPdEoNe68xFN1qn
 MCngY4a0nPnfTcGXcmms+7RMTlwyJArgcc8I5KWTZMJi1Gk7qpT+plwkrgQyJyo/lCso
 TVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6IZGXEDwfoPtCg1GsMDYigPQKwJxDM34TttvkoqeAQE=;
 b=kNYFgg49V+SwKvM5GKgDgMJtF/5zZvZakvvD7OGX+sNNmB6j4JMvPifnnrp9eMiAg/
 tx5rlx+baSJTbxyElZu0HQr98Ii/7Tfx0GmNxUZaaHZ3w2tN2I91LXGaF5fwfVPquq9A
 QAJiSkO4Ye0SaBCYMV4fil8KrqT53s1O3GWDiSeYBh15QUWMGojJ2SfzPpNPa4AjJiJi
 rwYOmpXcfZg9hEWfMYvlEZ8tIFti4rlcCfZcoEq9iPyAzksVfNvz2ZLxLMldsSF4dEVu
 /Y2xlMe5X3ndihXQFyyFxu1vMmAVYH6RK+YxtpZfRaaZUICC81YUAM1Rvp5Ffmkm6NNT
 X3xQ==
X-Gm-Message-State: AGi0PuZYhHwD4vG7byIli6vmqmfMSsk+opkGYatm34GFqGA3FZhzvW5j
 lqpX+uroa3TdKyZ4zwxsD9Rwf5kDynA=
X-Received: by 2002:a05:600c:2c04:: with SMTP id
 q4mr4410317wmg.7.1587471414039; 
 Tue, 21 Apr 2020 05:16:54 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/17] hw/misc/bcm2835_property: Implement the
 'temperature-sensor' interface
Date: Tue, 21 Apr 2020 14:16:22 +0200
Message-Id: <20200421121626.23791-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TmK7d63HiK2m

The BCM2835 'property' QEMU device models the serialized responses
from the VideoCore firmware. As we can query the VC for its current
temperatyre, let this model implement the 'temperature-sensor'
interface.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/bcm2835_property.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index bbe80affd4..dd1e9a2e03 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -12,6 +12,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
+#include "hw/misc/temp-sensor.h"
 #include "sysemu/dma.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -372,6 +373,27 @@ static const VMStateDescription vmstate_bcm2835_property = {
     }
 };
 
+static const char *bcm2835_property_get_temp_sensor_name(TempSensor *obj,
+                                                         unsigned sensor_id)
+{
+    return "videocore";
+}
+
+static float bcm2835_property_get_temp(TempSensor *obj, unsigned sensor_id)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+
+    return s->temp_mC / 1000;
+}
+
+static void bcm2835_property_set_temp(TempSensor *obj, unsigned sensor_id,
+                                      float temp_C, Error **errp)
+{
+    BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
+
+    s->temp_mC = temp_C * 1000;
+}
+
 static void bcm2835_property_init(Object *obj)
 {
     BCM2835PropertyState *s = BCM2835_PROPERTY(obj);
@@ -429,10 +451,15 @@ static Property bcm2835_property_props[] = {
 static void bcm2835_property_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    TempSensorClass *tc = TEMPSENSOR_INTERFACE_CLASS(klass);
 
     device_class_set_props(dc, bcm2835_property_props);
     dc->realize = bcm2835_property_realize;
     dc->vmsd = &vmstate_bcm2835_property;
+    tc->sensor_count = 1;
+    tc->get_name = bcm2835_property_get_temp_sensor_name;
+    tc->set_temperature = bcm2835_property_set_temp;
+    tc->get_temperature = bcm2835_property_get_temp;
 }
 
 static TypeInfo bcm2835_property_info = {
@@ -441,6 +468,10 @@ static TypeInfo bcm2835_property_info = {
     .instance_size = sizeof(BCM2835PropertyState),
     .class_init    = bcm2835_property_class_init,
     .instance_init = bcm2835_property_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_TEMPSENSOR_INTERFACE },
+        { }
+    },
 };
 
 static void bcm2835_property_register_types(void)
-- 
2.21.1

