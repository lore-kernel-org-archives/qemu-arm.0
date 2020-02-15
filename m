Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3040352lfp;
        Sat, 15 Feb 2020 04:24:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMvVJLRS8pWEE+r7fGFbT/kqvSEoUcg6ROw90Ng4SdESZgFOpmalPxwVBk1i7BnxWRQcAe
X-Received: by 2002:ac8:340d:: with SMTP id u13mr6316152qtb.114.1581769451555;
        Sat, 15 Feb 2020 04:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769451; cv=none;
        d=google.com; s=arc-20160816;
        b=UwyqqVPj93Vr0O5shyEc+1SAqtgtChvoxIYmysgH5asgz9ung07AzhQTR1tQ8h5z6D
         4M8r6KWnqXs8GI8VCNzTohVtHvvZARvJNd9CN85jpsQ+ran/h5c2LERAEubz2X3SplWj
         MOdhkmaf7JJdh+7WgHdL5tTSs3lLoqrO5UiAH4le3WkZTDxREcMq2eAJ7ueQzxfxta8I
         ungEH57jfZyENfS3TAgYJwHAFhecqboHMeZs1TvWSXF6ysTCzzPBlfE1fkbukIRoCdUM
         JznQlVgrEmjcKavWTRRaTH2Re/87IlwZWEZAOA40qFLuNzUv6WxSaUW6u+q9WrPHfKaS
         hHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=O0cfihfBXPUJpUAb56LetctuINQwtDaqA2jqE4YkZoQ=;
        b=LMA1s/Sw0dPitkftJQ2MHr1zc3Gzwv/kskusB6LOvYsEKLU+GTHC7W97+BozpWf+QI
         P05r2AnDhzh/jstjVApOP/KNnfDg7FZGFH/gV9cO0jR/+L84fnDXxaOi4t6+UILbtDAq
         axQhBiM44EvDcUlzngLJylpxtknUmx4yIAYVZNrMgrzNt9gLUUYGavfjwU5NOoOZG5R6
         3ldKo3p57ceeiey2XOk8S4UDRx+3oelaGdj5M85Brhpe9N3SvPiUqaYTt3b+Vbq1JFJd
         RW9JgFA15ngt05kCvwlTxZ3k38dbZX7lhKDFsStFEQT0EfrBicx7DIj4aIeUt8zl4fCG
         NgoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fOB6XfrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q29si4106562qtj.232.2020.02.15.04.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fOB6XfrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2wUV-0004Ha-0n
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 07:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53584)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2wUM-0004Ef-Nm
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 07:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2wUL-0000zg-MN
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 07:24:02 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:53529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2wUL-0000ya-H0; Sat, 15 Feb 2020 07:24:01 -0500
Received: by mail-pj1-x1041.google.com with SMTP id n96so5190983pjc.3;
 Sat, 15 Feb 2020 04:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O0cfihfBXPUJpUAb56LetctuINQwtDaqA2jqE4YkZoQ=;
 b=fOB6XfrSnBCUB6djAPxhSxQ3U6thsntuTizr2sZ19MTV8huKjWvH/mgWXpiCIB5YFf
 4Ir6OLCwPAarwyKUQ75c17tI/17NwJERc7EDigN0AgrRfSE6PsuhlQ1kto0T58BfUXgB
 ENxznPRGk7JzKzrpTu6v7baSSMD67b6sxXZvykBnxIzdFjf0lI+cP/qtnZ8gsZQ9bMa/
 6PIlJ23tUyQqTlIYP+Gmjv0xQ09bBOM/RbZltUpQB6Olh4Yy90YfTDHBrEKTCgJvMRnj
 ZMShMPMmM4gHIwSed5qdQxXFuDlWk+R38jJRFtWVA6vXtvTCWdjyTEW0xeHxpblFB1oR
 h5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=O0cfihfBXPUJpUAb56LetctuINQwtDaqA2jqE4YkZoQ=;
 b=njHKGRmDwwg/GPfFjOLSgaAg1lIeirfw9WhHSORnMYebNFHTtpNDpgf8DdqiEZQwhN
 Njoa1k8adu/neZthW1IXT2siORREAyWwSeG5qd9DYiKRPaWTOfXREb5hZhi915f06EGy
 1WNyN2M1JlcPbGzRqse0QPfMsQkNlmMvsfs+mYTb0xJ8tpevnz/t1X9qiH/kuQKW/COM
 9HjQ2qNVr/qUipZhKOVkfsp+tlhjmVM2dMR9zxousQgOVXFsOLEB7HP5QQjYAU9QH88f
 wLNLoP8HWf2ZIk+qmx6sEzjVXsinObKehT7bhQW06nt5I9GFaSkmljI4NFb0KNIWFSB5
 TtzQ==
X-Gm-Message-State: APjAAAVk4ZYqyoRcGLsUEE8mfGvfuwvmKPcwShSFffhhhJVH91h7jH0n
 GdlFyOLvfvJF12bvOvmCyG8=
X-Received: by 2002:a17:902:8a8e:: with SMTP id
 p14mr7883798plo.28.1581769440482; 
 Sat, 15 Feb 2020 04:24:00 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l26sm10975710pgn.46.2020.02.15.04.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 15 Feb 2020 04:24:00 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/2] hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,
 ps7-usb class
Date: Sat, 15 Feb 2020 04:23:54 -0800
Message-Id: <20200215122354.13706-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122354.13706-1-linux@roeck-us.net>
References: <20200215122354.13706-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oDxuxNhCwOr/

Xilinx USB devices are now instantiated through TYPE_CHIPIDEA,
and xlnx support in the EHCI code is no longer needed.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 hw/usb/hcd-ehci-sysbus.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 62612c9f5b..b5a014f968 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -114,22 +114,6 @@ static const TypeInfo ehci_platform_type_info = {
     .class_init    = ehci_platform_class_init,
 };
 
-static void ehci_xlnx_class_init(ObjectClass *oc, void *data)
-{
-    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    set_bit(DEVICE_CATEGORY_USB, dc->categories);
-    sec->capsbase = 0x100;
-    sec->opregbase = 0x140;
-}
-
-static const TypeInfo ehci_xlnx_type_info = {
-    .name          = "xlnx,ps7-usb",
-    .parent        = TYPE_SYS_BUS_EHCI,
-    .class_init    = ehci_xlnx_class_init,
-};
-
 static void ehci_exynos4210_class_init(ObjectClass *oc, void *data)
 {
     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
@@ -266,7 +250,6 @@ static void ehci_sysbus_register_types(void)
 {
     type_register_static(&ehci_type_info);
     type_register_static(&ehci_platform_type_info);
-    type_register_static(&ehci_xlnx_type_info);
     type_register_static(&ehci_exynos4210_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
-- 
2.17.1

