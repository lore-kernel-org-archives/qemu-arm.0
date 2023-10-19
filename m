Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp800944ejb;
        Thu, 19 Oct 2023 14:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyC29/LrM7g/PZeX/ygQffgVuzm+jWHi6HPZdn2DAI4KWPavWif0FFUzAoFY5EORw2E+Pu
X-Received: by 2002:a05:622a:198a:b0:419:6cde:86e6 with SMTP id u10-20020a05622a198a00b004196cde86e6mr4447658qtc.32.1697750479307;
        Thu, 19 Oct 2023 14:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750479; cv=none;
        d=google.com; s=arc-20160816;
        b=GSMYmtyR3EMs0Tvk4ORvYZron7cSfi0LvVyYkhev3xqtCwPx1uU0UAt7qCx+8yFG+Q
         XK9irHGwciVbOCAaUY6rtriR3ECa8GdZ3a3B9UAVIK6S+ZZuzbPmVOdm20J4gha+0mJ4
         RAbKBQNjayF+L1TtsEb1TG+WsOjmu0V4wiRujGBE8PRp4cN4/jWdFwjPRuAgv5lCLohb
         4UEpTdMP4KmOMw4RgSpQk/Mp86PDSnPeHXGGib8qA5wbFdavYa9CTQn22P3DidXwJsnc
         GXqtczPm+w0ftHCX2/Ok5Bgo5A1TrkwB9vdAn7S3jLqBz67YQtvjsoq2GwimnJ3ZOYuw
         aatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yVnP+tB8rBOXz7uiUDsk16xVhO8z/h4DQiumFB9H0lA=;
        fh=JJVrIxA960fi2M8f1oD8ZiXLObaAuT+S4YeQ3hi6v/I=;
        b=YjWkuKcFPo9zkHWe5zROPmuZmM1G1akjnhrQkSN051EkdojjI/2Ce+wlhLAKNGy3va
         d/ZM8rJ83ezm2p5cW1cCPraya3FTDmdewfzlEqC02OL7qwtClDFdCExy3kkqg+bHlfrf
         Fdc7/6RcsJK50ZgriLWacFC87HjIEUHxhWp2tiwWMPIe1wH/tlKCBDlZualh/PxJbCJ5
         uI4+3YyTg1XYqGK/kgVEiB/Wat6iEvhOxn3Jf/HTD11DEeDY4HOO0TDmAhHvJfk7V3CC
         qVDvKW2CsprntslCc9EBxxXwK37jL+SC14E6IQVbAlYbHKKJHwzryoVuw18mWNopwIK1
         FwAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgqcPmN0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020ac858c4000000b004178c9b7d0bsi262686qta.328.2023.10.19.14.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mgqcPmN0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaRF-0007jw-Qj; Thu, 19 Oct 2023 17:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaR8-0007QD-4M
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:20:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaR3-0005I0-RX
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:20:09 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4084f682d31so945535e9.2
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750403; x=1698355203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVnP+tB8rBOXz7uiUDsk16xVhO8z/h4DQiumFB9H0lA=;
 b=mgqcPmN0/S08PegUZwQ525sVxZzzP6pLXUjcsV57l1/E09RCxEIh5Xow0j0vehB/1R
 2zRXTGEPJcBlcprj6DtNmxnekO3l+KpQilh+QkReCX2eQI3FBLLRnLWeXC2dteYtata8
 53lLapB5/unCufMKY4MRkY/vk1QrgRlSgVHwf3752lUingQTfYuCer1XuEerSOHopeVW
 c0Erp8/a/bGX0317oEtSxTqpUnB3NmRO2MVEmBDKjKIAuYCgDm8cWO2FUKaHk9QHiLcm
 btlmKVZrvzupl+Q6b7boH3FedqsFchFE1dgIjRelF1lIoAlAc8ixAbZ3u2lSkiqxvjkU
 bmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750403; x=1698355203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVnP+tB8rBOXz7uiUDsk16xVhO8z/h4DQiumFB9H0lA=;
 b=CwhoiPRw0dSQsP2IxZ1vENi5AUu/UIbffoLltzVwPl7D06YajnBXR482AxRgSWZr1A
 bhU0ee4V5ZTfm2XlSXKSaDtPx8yaVqMdoapLRhaAJmO0ikAVRfRtgy4Ns1fEF5DiXM6d
 Q/SQwj3Ka/RWuwy4eN0a9deRMXlhUNRsLRe993PtYhRfXW3BM8XrISf8EDoKCi98oF2F
 tvlvkfLPAWO1JvoGzG+dHHQzkeECJ473+Gl4cdbjn9+KOE7fHe6w/L0we9lVuYetgukC
 mGUKDD9+qgVRDf26GrbnTRty8IdSP6v1I05w3H7mQwQqFz4PEWsozNNIgq7XPzj97bSr
 QpGQ==
X-Gm-Message-State: AOJu0YxxnETeRke2cY8rF1Uk+/a/kr3AlTX23KwFN0l5S+ksjnqJ2LEX
 a81GFo9IGVKo60WErub27cjoJDhXaoFtAbdHuPHVnw==
X-Received: by 2002:adf:e782:0:b0:32d:812d:907e with SMTP id
 n2-20020adfe782000000b0032d812d907emr2337227wrm.65.1697750402848; 
 Thu, 19 Oct 2023 14:20:02 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a5d5609000000b0032da7454ebesm210465wrv.79.2023.10.19.14.20.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:20:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 16/46] hw/pci-host/sh_pcic: Correct PCI host / devfn#0 function
 names
Date: Thu, 19 Oct 2023 23:17:41 +0200
Message-ID: <20231019211814.30576-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r4yw+oVnERve

Host bridge device and PCI function #0 are inverted.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20231012041237.22281-3-philmd@linaro.org>
---
 hw/pci-host/sh_pci.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 41aed48c85..580e273d96 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -116,7 +116,7 @@ static void sh_pci_set_irq(void *opaque, int irq_num, int level)
     qemu_set_irq(pic[irq_num], level);
 }
 
-static void sh_pci_device_realize(DeviceState *dev, Error **errp)
+static void sh_pcic_host_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     SHPCIState *s = SH_PCI_HOST_BRIDGE(dev);
@@ -145,19 +145,19 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
     s->dev = pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "sh_pci_host");
 }
 
-static void sh_pci_host_realize(PCIDevice *d, Error **errp)
+static void sh_pcic_pci_realize(PCIDevice *d, Error **errp)
 {
     pci_set_word(d->config + PCI_COMMAND, PCI_COMMAND_WAIT);
     pci_set_word(d->config + PCI_STATUS, PCI_STATUS_CAP_LIST |
                  PCI_STATUS_FAST_BACK | PCI_STATUS_DEVSEL_MEDIUM);
 }
 
-static void sh_pci_host_class_init(ObjectClass *klass, void *data)
+static void sh_pcic_pci_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    k->realize = sh_pci_host_realize;
+    k->realize = sh_pcic_pci_realize;
     k->vendor_id = PCI_VENDOR_ID_HITACHI;
     k->device_id = PCI_DEVICE_ID_HITACHI_SH7751R;
     /*
@@ -167,11 +167,11 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static void sh_pci_device_class_init(ObjectClass *klass, void *data)
+static void sh_pcic_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = sh_pci_device_realize;
+    dc->realize = sh_pcic_host_realize;
 }
 
 static const TypeInfo sh_pcic_types[] = {
@@ -179,12 +179,12 @@ static const TypeInfo sh_pcic_types[] = {
         .name           = TYPE_SH_PCI_HOST_BRIDGE,
         .parent         = TYPE_PCI_HOST_BRIDGE,
         .instance_size  = sizeof(SHPCIState),
-        .class_init     = sh_pci_device_class_init,
+        .class_init     = sh_pcic_host_class_init,
     }, {
         .name           = "sh_pci_host",
         .parent         = TYPE_PCI_DEVICE,
         .instance_size  = sizeof(PCIDevice),
-        .class_init     = sh_pci_host_class_init,
+        .class_init     = sh_pcic_pci_class_init,
         .interfaces = (InterfaceInfo[]) {
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
             { },
-- 
2.41.0

