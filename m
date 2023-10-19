Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp802067ejb;
        Thu, 19 Oct 2023 14:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEupz/QaUr1VChkjrymXVbuyf2ZPBr80WcSslF2bmW/LGOTvhZoVxgPrueid3+sUe8DjknY
X-Received: by 2002:a05:6122:178f:b0:495:3d9d:535c with SMTP id o15-20020a056122178f00b004953d9d535cmr31291vkf.4.1697750621790;
        Thu, 19 Oct 2023 14:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750621; cv=none;
        d=google.com; s=arc-20160816;
        b=WvLGGXASqroDrmilo8Syu5MKr3Ei/3YjdmvnXpsqIswvdmBZil3w+i+jH3Cs6btLIT
         3VDXLRAf8w6JqWgp4zoj3AAFh5NdtQqUmYET7RW6aHySYQBGecfP1Wpdb+VubZ5Zoun1
         sdGLpySfa5l7ra20zk9w6R9XQGqxKxAEYyt8Qs/5gvgeV56JLRZHwzuhfyxZjHJWTgkw
         ZIxIXInB4lfsu0bff0emnK+knSoobYfN+UeUJWfRHyegSF9pv7gBi4mxpsjccbghWGKz
         wMbpHhnMHeMqJEMNrwQGg7WRT2ssHe8c1ACCBWWc0oXpfJPYXc0HD89FfOYBnYG9uP2D
         vj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5L3KhgnR+wD3KYNvWp6CWYVG73hhXTbT/VSAj1bhVwM=;
        fh=JJVrIxA960fi2M8f1oD8ZiXLObaAuT+S4YeQ3hi6v/I=;
        b=i7cMUB0vV/QBrSIpDAGSvs8kSQ6bpnnGi9hEbTISIU6NqHBINrY++WhYCupQGlrn76
         j2736JEyIBipnk/yTHTFM/SJ3cqb8MyH80S0M0BGrOlyo9SQViX0Ix3W7LKMlgI/HOql
         4mqXstGh0PqYv7ZoT4A67kOCK8rrLdDyC+qMSyjXo+AX9zeM6oOmcnB+iRXaD4tABBlD
         rPnPdVA4ByoRO5bcHrxB71Agtz9e+MoiBd+YP+7adELstBpTYB9aM3kB1GgoFDMOHjN/
         6y2CtGGDLr0a3s4hYVKhoOVotCe8POBwEacAYXrSwRzQgKwdLrgORC8HHavb04NyOWOz
         QXtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N5WPcaSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020ac85a4a000000b00417fa5bd43dsi256772qta.314.2023.10.19.14.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N5WPcaSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaRD-0007Y8-Ve; Thu, 19 Oct 2023 17:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQz-0007E6-7L
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQw-0005Aw-B3
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:20:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so111852f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750396; x=1698355196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5L3KhgnR+wD3KYNvWp6CWYVG73hhXTbT/VSAj1bhVwM=;
 b=N5WPcaSWVaFJ9iyQSiuRHSaSFqeTfDy3aN+rLAwIRSFb8lkDR3U3gDDevC0h1uNg1S
 fvfeBgU6RUR1vhzG1etx6B0OqmJNt0ltCLqWLLKQhI4NRrvJ1anu+jYiVyU/3BEgnNs/
 qBip4i50VkqMfMXvW6I9cOds0er7OKesxl0Fa4nwwaaueswnR8zwx40+h8xL4Q0DK5yl
 BQk18LNSUu/dZJsfLGhzfToFAqoeGJm+BmkjTDBf7auKbBoBvqr5DszSVAjuyCJf4jfd
 m/U/5Y/N3Z3QejCz1WfH2r1RD9ZxYV55InHEA7D/S7SXmqTe5KZsZIzQbymg9guHfKow
 DGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750396; x=1698355196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5L3KhgnR+wD3KYNvWp6CWYVG73hhXTbT/VSAj1bhVwM=;
 b=IGfV2EPsUHfcG58SWHt/KI1egJHo2vCoCXiaNZmjrfymehYdcLEKDbosU6FIjCz2tq
 QmWFwb5k81O/Xz+XxRtv+ebKNedAvk0Nh5U6zorKicECxN6b4tdmxjdJdiYbCx0GgnXi
 QOzaNfkR8VNuBoN64LSDHhW+cdzPKr9MkXJrK/PFueBRRSWt2D7Emi3n9n1Nn+czF+Mo
 +0aPUvyYcqpQ/1qwBOZFu32qwGWYEHh0JnhcL+zRrkQ5p0WFO8tvIkd+3NammIPyzHYm
 F12SuyCruBW+qwfj+i+gofVqnYC/s9GI5d4wurgPzVtPDwkZOeIJNj/NGjYhInCFTMeD
 8fqw==
X-Gm-Message-State: AOJu0Yz6DF/UWBF/Wo6A89jPt5bYtd++ryyyrhuw+Jf8xkpXbxh+aGHj
 ybsban8gBe+uHOA8TtY/4J3MBA==
X-Received: by 2002:a5d:4202:0:b0:32d:9b80:e2c6 with SMTP id
 n2-20020a5d4202000000b0032d9b80e2c6mr1914430wrq.26.1697750396472; 
 Thu, 19 Oct 2023 14:19:56 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d5042000000b0032d886039easm233498wrt.14.2023.10.19.14.19.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 15/46] hw/pci-host/sh_pcic: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Thu, 19 Oct 2023 23:17:40 +0200
Message-ID: <20231019211814.30576-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: yOEm+o6hhpS3

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20231012041237.22281-2-philmd@linaro.org>
---
 hw/pci-host/sh_pci.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 77e7bbc65f..41aed48c85 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -167,17 +167,6 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo sh_pci_host_info = {
-    .name          = "sh_pci_host",
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
-    .class_init    = sh_pci_host_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
 static void sh_pci_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -185,17 +174,22 @@ static void sh_pci_device_class_init(ObjectClass *klass, void *data)
     dc->realize = sh_pci_device_realize;
 }
 
-static const TypeInfo sh_pci_device_info = {
-    .name          = TYPE_SH_PCI_HOST_BRIDGE,
-    .parent        = TYPE_PCI_HOST_BRIDGE,
-    .instance_size = sizeof(SHPCIState),
-    .class_init    = sh_pci_device_class_init,
+static const TypeInfo sh_pcic_types[] = {
+    {
+        .name           = TYPE_SH_PCI_HOST_BRIDGE,
+        .parent         = TYPE_PCI_HOST_BRIDGE,
+        .instance_size  = sizeof(SHPCIState),
+        .class_init     = sh_pci_device_class_init,
+    }, {
+        .name           = "sh_pci_host",
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(PCIDevice),
+        .class_init     = sh_pci_host_class_init,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
+    },
 };
 
-static void sh_pci_register_types(void)
-{
-    type_register_static(&sh_pci_device_info);
-    type_register_static(&sh_pci_host_info);
-}
-
-type_init(sh_pci_register_types)
+DEFINE_TYPES(sh_pcic_types)
-- 
2.41.0

