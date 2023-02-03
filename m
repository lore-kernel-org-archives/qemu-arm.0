Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1642879ejb;
        Fri, 3 Feb 2023 10:10:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/gbyUQ6uojFVo3sO3q+KRzd19QuMleBzqzKT4lpDYx2CJfi1auhFkbAuF+hxVLv9ian8rX
X-Received: by 2002:a05:622a:1755:b0:3a8:dae:d985 with SMTP id l21-20020a05622a175500b003a80daed985mr10988669qtk.14.1675447847819;
        Fri, 03 Feb 2023 10:10:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447847; cv=none;
        d=google.com; s=arc-20160816;
        b=FVJB64IPLucY0/hvEUb+J6TU3v6EZUKSxp7dr8jOYdv2W0Yy4sIuGi+5JtKo/TNfMM
         YuYP56zQ//Ccue4hy7MCi8nF6PNWAdwldePq67oWFEqnTl417DzeaFhcdOmFGzuGGBTj
         jZ4nIldIufrtzo8qw2CHPehepvB5bko1QEfIC5Y+gUJFEN2nx2LmKf1tr2+0OoGZt50b
         xP9XBvE+2aSFhHPzdQ7sZJeyCo3UhXPiBsS1qPj+hz4sw3XYpHfjEBZk9BaLjAKPJtHu
         qTTausAc9qm4snZ6kmqOcQp2cBmbntwFCpHIb2LFtn8xcNKf8Ts51WlMX0av8kW2ayjI
         BmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
        b=Ye93JYf/RICHMXq+1TH8RV8iHr/MgQMIwoRkRPpe5iWmS/e0jZZfyFJxKkj26TmJhM
         hbRimHDk5HEjlLofsvDXslpIbX2wnbap0BlUVxf6FXUp9CgvRaoSGqAHuguYDs43mpqs
         LR26bYklFmjDnRvdqJzdCUsKiyfXEK/VZGe4va/oAEPg0y61MwKcDMZOMoA4zgtyNaxp
         np41FBZy4tjv3RIPaeoAGXNTIoeQ+AwKcWGPA99BTkxvYvL+MQovhDfK6SN07brT8MoS
         odILAFXZtLS9Yy6RGfX9KrdTFzejvMFtcRwjp+C7xUJH93wsUv/lqAITrQUyzHCiMjL7
         dKQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOROVGJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05622a000100b003b6955054a1si2014801qtw.424.2023.02.03.10.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:10:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UOROVGJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0Vw-0008ST-3A; Fri, 03 Feb 2023 13:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vf-0007p5-Fb
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:11 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vb-0008Gs-3L
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:10:01 -0500
Received: by mail-wr1-x431.google.com with SMTP id j25so1858529wrc.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=UOROVGJf2LhPr752Dw/+I93w8jyObbZA3IhAvPk00odJTomcoFC44+VlywzefzTQBI
 87UOdzz6xjb3/z/Ugj3dHNwazZt3412OTsoijUEPdpUp3MBFD7cH/6bhCR93Oimgr3gn
 hIhsa1QlaaC8RTcuQafvT4FTWWrinb1RaHh9Spr8Jw5wKNAitKVz2wLDnQ+e555kKLLv
 AqcGsxNra2OcpD6xxVviE4L0YwJ1GnLN2VGeyW0ylWgc7UCY607BbK7njSwVVNduiAoG
 42IQvlighScOqCP5CeI0+K/sIHTT28zzDnBRXMZbFRHtSH9igpqtd/kIbuR+6dUT86Pd
 PAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=fzzCjQQ3m8lxpvAeNlbfnU3YL43eH5lbLwJpOzP+X6lAtgWZ23piITCMZSue0Dcx1k
 IPlBjFOwkSBvY+cZIBRDZjqtlluG2SOLL+tL0AvkKdVHW5qPMEZ1drMxJG8Son36+N25
 XtSLTWgiP5wPnMkBNmR3CGky6YQmpdIqXHUFMxLvO3jb8Mn+NZau7+Wvtb1UF5VzG7Rs
 zvcPiXznxyYI4SgTdc5hwlxKf7sK7lb6v2hKNnrDDQmTfYzSA/wBe2AbowvqLKog9ORp
 McvUHEz6VWHlSs+VEb5IPHKQ29IsKoZpFHMfcDYCMNghgOOG0fXRiKzobixu9Y0NRMrw
 G+yA==
X-Gm-Message-State: AO0yUKUSMqA/Ouog1Ev17oWTYu+95uGxXwW9ZZsP1zyev4od21gRa2cF
 yQAF0QXTwTvgNCO8iqrbJSNVp9LAd8bnZ9vQ
X-Received: by 2002:a5d:456e:0:b0:2c3:db61:20ec with SMTP id
 a14-20020a5d456e000000b002c3db6120ecmr719672wrc.23.1675447797782; 
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002bbed1388a5sm2528636wrt.15.2023.02.03.10.09.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/19] hw/usb: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:03 +0100
Message-Id: <20230203180914.49112-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: i7pdLC+bE8kA

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 643d4643e4..7511af4ce2 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     dev->config[0x60] = 0x30; /* release number */
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index faf57b4797..d73c71015b 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -36,7 +36,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
-- 
2.38.1

