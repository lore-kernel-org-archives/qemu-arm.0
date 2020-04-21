Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5030758lfm;
        Tue, 21 Apr 2020 05:22:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypIgikS6hnXijqbnkyGKmoNw7TEmWztYsML0KPGl2WxeWqBLvOXOMt3yk6RmF2jk2zg4b1U7
X-Received: by 2002:a37:7906:: with SMTP id u6mr19900995qkc.489.1587471765440;
        Tue, 21 Apr 2020 05:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587471765; cv=none;
        d=google.com; s=arc-20160816;
        b=kspYyHWE9pQyIo3MzTt9fHzZifZVP+TKviCZ4gKasXU0frgXL+K43UdtwGo7NEPP9G
         olNFjpi/ExM4kQzjQWeo+0vQgr/6oAZp4D1lz+Qikn7XbUH2ohIAG+PQzjXln+KH8Z0V
         y2hBBaX+Onuk9JKJ+OjFYyf5Qqqc8KbUSmFvOpIiVaRhcfUgqAmM2CWRVqAsU2FEH3QF
         OlLPmcpNbGiAXre02Ifw/rc9aPc2pWYXrnlAvLO1iHRaMUSjyIayFSE5jgY3Z2t9WLbg
         XtGdRdxAeCq2679ZePjoWYuLB3rzWLkU3ebB3Vo1khK0oKzoiIIgmXDkhqyXo+npbOTH
         ecVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GEsba70DRlLJ93uPzs+mr1zMRSnp49U/A5f7HHRTeFE=;
        b=nHOzSTwY6MBePSwO8MzSPQ8nTMn9fiAesoXnzmRkaf8PUvuNUlB+DM7sH+nHEdMXhd
         PPVKrySTbVMQGF6qRTm+4iXTIM1pLl1ZP0u2zHAFDsrnFKm0E2icl0/CVw3xUgsmMYbk
         01yZCpbmRJ2fNoCe5JvrIYnfoc9TQv5dzRV8f5VQpFJOEEmxDuelfoPP47OwsX3Jft0Z
         2t2YzhQN7/3ugiC+5srZrqlAkVNgoYiJ936f7GCuY/4RhCZLF8O/TAF+7VeqpTo5aUHz
         LkO+9lJY5TwTauUAtyC03sNMO6h3ZAHc6VtR8wiSorcTgQSEqrJLUt4gBX1TJve7t9wu
         hzZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qppkq85u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j37si1349384qte.263.2020.04.21.05.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 05:22:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qppkq85u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQrvI-00064G-Rd
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 08:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59234)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpd-0005T4-I6
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:16:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpc-0006V5-Uq
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 08:16:53 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpS-00066S-0g; Tue, 21 Apr 2020 08:16:42 -0400
Received: by mail-wr1-x443.google.com with SMTP id i10so16182252wrv.10;
 Tue, 21 Apr 2020 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GEsba70DRlLJ93uPzs+mr1zMRSnp49U/A5f7HHRTeFE=;
 b=Qppkq85up1c6ppkmHL+8aeLnbXywhG5l6y8CyvTN9prmFjxDDl0ZPsRXOKmJ10VheF
 Dp1Aqu34xgZZ6Nsce6O0efVi8n7BKK6hb2VkVhJNuEln5naD/J/mWRpq0AaT44qvutRS
 iVEaIcEuIlSu2CxmRFH86M7NB0WlR5E8CZ/U00CS47CdUtiU0PchJ2DrgrT+UuaRIilg
 5j27UPhaXHI+RqLLhfmrCitBAkhbOI4PRT+9H4NmZMk4eTKSF9BrS87Uwu6l6mMRG09/
 Xoy6BRc6b7XYUHUct3MOmIb+SvCrKHjxfJqgNFEBDIsyoP7n7jw9cwRfTTgUXrKi3yBG
 eniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GEsba70DRlLJ93uPzs+mr1zMRSnp49U/A5f7HHRTeFE=;
 b=RtYRdiW/AbraDnG791mrM5/8oMf59vzcgFHQEyW9ujfagajTEdQWMwC6IWadxTiagp
 2TESPTQXlZJ2SJZZNFUf0cK78n40q2i/YCA4ixx95VTO6pGdtfCREMJTe632nfrjwoQy
 HIZKFO8nmfXVR8inBaxGYus4bfvCX3FzpU9Y9TWciPqWnMdRdyjr+goymAdB5tkhXEYQ
 xozb7QbgX2Er/GiBUJl4Vb8JtqpzO+m61qedydP+ggK/H4AwfgAjhgQ5tGOGptC2MUKC
 3F0uyZmGELeS7gytOKBZacmjeikIDEGffPa0QncAo75WkaHZ3ENzHqfRg3gt3y1U1wKI
 RDVw==
X-Gm-Message-State: AGi0PuZqaBaSJ9qvQE3E7Hn6JnwBcrGppu0Ysz2Oekuw/Q8d4q6e5d3Y
 LLQtgC8b3+X+quUr7qmhmTMxyMQijHg=
X-Received: by 2002:adf:f986:: with SMTP id f6mr23636914wrr.221.1587471398577; 
 Tue, 21 Apr 2020 05:16:38 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/17] hw/misc/tmp105: Implement the 'temperature-sensor'
 qdev interface
Date: Tue, 21 Apr 2020 14:16:14 +0200
Message-Id: <20200421121626.23791-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ByVt0RWtlZQ9

The TMP105 is an I2C temperature sensor.
Let it implement the 'temperature-sensor' interface.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/tmp105.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index 754c8a6eb4..1f0cb28012 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "hw/misc/temp-sensor.h"
 
 static void tmp105_interrupt_update(TMP105State *s)
 {
@@ -74,6 +75,17 @@ static void set_temp_mC(TMP105State *s, int64_t temp_mC, Error **errp)
     tmp105_alarm_update(s);
 }
 
+static float tmp105_get_temp(TempSensor *obj, unsigned sensor_id)
+{
+    return get_temp_mC(TMP105(obj)) / 1000.f;
+}
+
+static void tmp105_set_temp(TempSensor *obj, unsigned sensor_id,
+                            float temp_C, Error **errp)
+{
+    set_temp_mC(TMP105(obj), temp_C * 1000.f, errp);
+}
+
 static void tmp105_get_temperature(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
@@ -261,12 +273,16 @@ static void tmp105_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+    TempSensorClass *tc = TEMPSENSOR_INTERFACE_CLASS(klass);
 
     dc->realize = tmp105_realize;
     k->event = tmp105_event;
     k->recv = tmp105_rx;
     k->send = tmp105_tx;
     dc->vmsd = &vmstate_tmp105;
+    tc->sensor_count = 1;
+    tc->set_temperature = tmp105_set_temp;
+    tc->get_temperature = tmp105_get_temp;
 }
 
 static const TypeInfo tmp105_info = {
@@ -275,6 +291,10 @@ static const TypeInfo tmp105_info = {
     .instance_size = sizeof(TMP105State),
     .instance_init = tmp105_initfn,
     .class_init    = tmp105_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_TEMPSENSOR_INTERFACE },
+        { }
+    },
 };
 
 static void tmp105_register_types(void)
-- 
2.21.1

