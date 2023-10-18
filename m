Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4669680ejc;
        Wed, 18 Oct 2023 07:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXwQZlhkZkyZ0jbNKw6k7CHz1Gg5+n/5Q5BhRuY8UmH4Ss866NS8QFAqgGBVW5FOxdn/AR
X-Received: by 2002:a05:6214:509b:b0:66d:3474:a93a with SMTP id kk27-20020a056214509b00b0066d3474a93amr5848760qvb.30.1697638455804;
        Wed, 18 Oct 2023 07:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697638455; cv=none;
        d=google.com; s=arc-20160816;
        b=MyP+rsGMeVAJ9UNYdDT2e0/CYmQOkGJDrdNiQlH7tfcD/llia2Lw6gwnro+fHllenS
         A5JBT2kAaUqcnL1+EZooSOevFDcBIcNfLwnbGFddZ8gg0W/zkCNlA7bMfl81q55rxIBS
         bBtqpv5kdbJ4FzUk3hkyrK3FjxUhHqzhEsdQUcg7l/fRkLoBmMGtTZDNd1ZKyKpXiX+e
         fR1yIzAya4BaJvROSr1oSwbRvYJmu7aiZ+mp4UV3p6EBQScpz+wsnT1rfrC+Q5ojQekN
         RpRdOa1S1JiWMb+8VHotpyRx5nwdY9jv7tYDv6vHU7bQSEh2SfE/lea3z74vjnrsPWif
         efVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5QjYWheBMzRDx+1pua16/AosP+NmrpkNMedodm6UtRk=;
        fh=ANIikQnX6ADG7FYuHYnQUKFZKV9+VnxLLzGv0RFOlfg=;
        b=OQ7q7bbYw7RKLlnYjPjAK9vB16or9tf0V/cRFrgZMpnPrPj1VUQ0svPWMtu7fKJrr0
         bvNmwjruGqR/qSp3wLd2nVNs736TwHqLX8mDuIzeg22uE7qu1o3tKZsFv2pP69ECTkiM
         VkMKcAupkbxcN44F6EMzz1uxr+KKOUW+1hxXxVDHPTC2lukHFPaivSmR945DB49MT4e/
         LfPXplltG2CKutXp3+Fljk7FdleIpyvPP/hYGgGEUofDnj1zADWLf2uJWyUpTkbgwNDr
         eaPxTDvXWkG2qQHQ647HbQxI/IYV02x3J1k32oKc3CwK1MFR1eh1mO4yzdFx4l9uUzPl
         NZCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WofQ4+j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu18-20020ad455f2000000b0065b0771f2f0si2613188qvb.529.2023.10.18.07.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 07:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WofQ4+j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt7IO-0000aM-R4; Wed, 18 Oct 2023 10:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7IN-0000Wd-9R
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt7IL-0004u6-Jc
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 10:13:11 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so1435694766b.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697638388; x=1698243188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QjYWheBMzRDx+1pua16/AosP+NmrpkNMedodm6UtRk=;
 b=WofQ4+j4Gqqnw7OsASSimlp19EOsSjU5UR2AO/2oZBZ8q/YGL8SbSdT+C8gTN04wAX
 OtC4DeBJ+Iz7eTAxrMMz+Um9GrtNWWjqCdr6Etb/ev6FDPpi8UES3T4p09qfqSLdEXbm
 xzdJz/QxG7sYeuE0TF2B9/7mHM+5OvbInvOM04OLkydfs/vTQhmyoyxRoIXwrqTuJafc
 bpSe6257RwqTzc47SNLyjObKiAFk2eZmBoIUZprGTh4yuNcKWtlKiBI1tLZeqVanW5st
 U9jdrthP9OQ9bbch51LTRRjMqXHR51EQgX2cWknhDBkG20lq+h4Ydbc5vxAPT+7YKU4b
 DN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697638388; x=1698243188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QjYWheBMzRDx+1pua16/AosP+NmrpkNMedodm6UtRk=;
 b=nTtcLHTgECMvct2NFVMjaN21JpaSLW4cMCUZT7pE2FY6FkRSRqcOHGlvhzKsUr7N4A
 LQm202vuEEMyiZHJwu9hQWEW59RqEzU+Jo70xg9l/4ZVizzvk2VbclIcjtB/cLSRyBCi
 XXYNvgroErBhG29InscWPhDMBoy99CmGDo0xyNaq6wMM6lkqeAv9Oo6vh2dkX7uO5QQN
 h4bmWXNf59W4OvRFc3OX2uldpIEkDQmrrth+Tg6ZJlliKZywYojjvkrXR4W2FxraguGs
 NnxH+KMcIFxP8w2ZpAA3rrjy3glPv8RQ7i4x5SywBhnXMsYz6xbF51wz/is42CPS1wq4
 v4vw==
X-Gm-Message-State: AOJu0YxjTRjHYDSb2G8km4Bf95bOi9uR0ExTsqqs8K1mm4NdwK4vJj2/
 ZtmTyEn2RXHiJD+Z1MVj0PlCPQ==
X-Received: by 2002:a17:907:86ac:b0:9ad:8641:e91b with SMTP id
 qa44-20020a17090786ac00b009ad8641e91bmr4831802ejc.11.1697638387711; 
 Wed, 18 Oct 2023 07:13:07 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 fi10-20020a170906da0a00b0098669cc16b2sm1753999ejb.83.2023.10.18.07.13.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 07:13:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 09/12] hw/s390x/css-bridge: Realize sysbus device before
 accessing it
Date: Wed, 18 Oct 2023 16:11:47 +0200
Message-ID: <20231018141151.87466-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018141151.87466-1-philmd@linaro.org>
References: <20231018141151.87466-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zFHZ3ERBvzAD

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/css-bridge.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 4017081d49..15d26efc95 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -95,7 +95,6 @@ static const TypeInfo virtual_css_bus_info = {
 
 VirtualCssBus *virtual_css_bus_init(void)
 {
-    VirtualCssBus *cbus;
     BusState *bus;
     DeviceState *dev;
 
@@ -103,19 +102,19 @@ VirtualCssBus *virtual_css_bus_init(void)
     dev = qdev_new(TYPE_VIRTUAL_CSS_BRIDGE);
     object_property_add_child(qdev_get_machine(), TYPE_VIRTUAL_CSS_BRIDGE,
                               OBJECT(dev));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
     bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
-    cbus = VIRTUAL_CSS_BUS(bus);
 
     /* Enable hotplugging */
     qbus_set_hotplug_handler(bus, OBJECT(dev));
 
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
     css_register_io_adapters(CSS_IO_ADAPTER_VIRTIO, true, false,
                              0, &error_abort);
 
-    return cbus;
+    return VIRTUAL_CSS_BUS(bus);
  }
 
 /***************** Virtual-css Bus Bridge Device ********************/
-- 
2.41.0

