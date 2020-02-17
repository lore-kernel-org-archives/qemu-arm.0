Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4992542lfp;
        Mon, 17 Feb 2020 03:52:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqSvwSZiPVLjaaI1HHClFGjkE7ZJL5p1/RJqlXlhmC4GC+yZcpROsWs1mV4WjnwxYe3LZ0
X-Received: by 2002:a37:9f93:: with SMTP id i141mr13045531qke.404.1581940329982;
        Mon, 17 Feb 2020 03:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940329; cv=none;
        d=google.com; s=arc-20160816;
        b=0FoF35Ce2Zrab3FCsdyxcoL2iVQaJ7AIAx8N5fRCGn2J40tNnGdUtoTrPlRIVC0IXF
         13i7yJvUb3N6k1xpYHHq8XGdIIibXAwecibGTVffwKMt4HcKvvcH5WIm5QoHG2ZBc8kM
         VzRdLiiBwEARgTeoobO+kNfNEZ3jmO2M0oVJMl5AGKAl0ufB7mZa0NNkhFTnFAvJ1GZL
         x+VLRHNg/uJNlDGPJT24QDDlSSWPzHqvk5LokwfNJTWf3ZA5jUaeAA9qb/oetXGvPCDY
         J5OarrLYXjlOGXeIfqprosmffnEMAPj963WpwQ6dLRgsySEd/Q5H9UU+ugn25Ggp0ZTQ
         qMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
        b=f7GtK+oH0BCPPfF7Adt5L29B6PSqmQ57PiiTm2qsajqnH7ASswbS+4cf3QYfrFQkHH
         XiCLlxFwXx5jFp8L7MOjj5HH/5K3JQcGPAWCR6VNQKMeUKsfUBF9/C6rfXNlpk6vtCd2
         GTetga2itXjHox7RbXyhcBsaQobudePDjluLKa7RFfypWeaDkSPBJrKE0xKe86Hpn0f5
         I5Ce4hrZTKN/WaDG3RFGQMCL5ljQf53wPGB4WfnjPQHle+rD7cbrItanTLIJ2qQd4Dks
         Pz2D1NvcaQNnhi/g/Hc1HH1oZtSQhXl0GBprYJqK8mN5yNes+Y1k9zv6lIQazqbCN+U7
         GJQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vWjv0Unr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23si120710qtn.80.2020.02.17.03.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vWjv0Unr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3ewb-0007o1-Bw
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqV-0006mQ-4h
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqU-0002VT-1v
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:45:51 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35225)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqR-0002TI-KY; Mon, 17 Feb 2020 06:45:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id w12so19333906wrt.2;
 Mon, 17 Feb 2020 03:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
 b=vWjv0UnrVB8fjx4RaHN8b3G/mooA72TRn2WGdB5N06+c0rCcSYzJpZM4WNnuoVTAWp
 KDM1y5h4XGQud5RgTHbIB14lKKXmb/188Sg5EjV3KZKx3ipTF5cFPvO9H1YYeU3Se0Nv
 MiUfBNEEI5tTkqcgLsPoeAWAI/GqfL5nPd0WbuVzIOQGQo64qghaKNmPSxyr687Hla4j
 ZePh2AwRQyHO05yXI/yf473SqmDVzTLtvHILM5mPNAk5856l4oJQYzHX50oHT0lH1G6M
 4+XElfYTBQkFfOo/BPjCNKgpUZWvpol1vrodEwhYOqtRi0O51y3FpJbx/OU1qMFlpnnU
 5lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i66d8bTofo8A1vTFZIP/v8pdqf575/6M5yHqFaN2D1Y=;
 b=Uncx5N25OqUDVu2U9Ad/UFhy+r9tjAcfA+gXm141p49iXl1RnwJL1hcb7KkfSwlMAe
 a18OfrjLcnwMnn8rXTUzNlvWK/k4EDTGk89VSHC6AaW5XmSkh1j/LYHY9Z7kUKyfn9OL
 RWBwS3SyFYF0tBdba7jEejVhrxr2bIQDfFuFqLpRY7ArTFhOXw85ooIDBAOp9Q9M22Gj
 xoEbnHOp2Z3F4ZSUa+pAsruvJKd66/E7qZDNkGJTWZmrjfZh2CMzli1PBeH3zSABVkhn
 pFRkKcvdHCFeZzeGlboi6XdQk2jnaHtvZ1Q0alj0RGTUvYG1Q7BUxmmID9CL55MCwQus
 jV1w==
X-Gm-Message-State: APjAAAV5gFRHyw9jJZ9OTRQWDMN4qjcwvTmq+H49me2vAqgb8pHfd8gR
 RrmSZGssjzTokBqFmSkUpK+QBMAJYF8=
X-Received: by 2002:adf:fd91:: with SMTP id d17mr23281923wrr.340.1581939946474; 
 Mon, 17 Feb 2020 03:45:46 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] hw/arm/bcm2836: Introduce BCM283XClass::core_count
Date: Mon, 17 Feb 2020 12:45:28 +0100
Message-Id: <20200217114533.17779-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WIExm9j3E5iE

The BCM2835 has only one core. Introduce the core_count field to
be able to use values different than BCM283X_NCPUS (4).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 683d04d6ea..3b95ad11e9 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -21,6 +21,7 @@ typedef struct BCM283XClass {
     DeviceClass parent_class;
     /*< public >*/
     const char *cpu_type;
+    int core_count;
     hwaddr peri_base; /* Peripheral base address seen by the CPU */
     hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
@@ -37,7 +38,7 @@ static void bcm2836_init(Object *obj)
     BCM283XClass *bc = BCM283X_GET_CLASS(obj);
     int n;
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
                                 sizeof(s->cpu[n].core), bc->cpu_type,
                                 &error_abort, NULL);
@@ -107,7 +108,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
-    for (n = 0; n < BCM283X_NCPUS; n++) {
+    for (n = 0; n < bc->core_count; n++) {
         /* TODO: this should be converted to a property of ARM_CPU */
         s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
@@ -173,6 +174,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
@@ -187,6 +189,7 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     BCM283XClass *bc = BCM283X_CLASS(oc);
 
     bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53");
+    bc->core_count = BCM283X_NCPUS;
     bc->peri_base = 0x3f000000;
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
-- 
2.21.1

