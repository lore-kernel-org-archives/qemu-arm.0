Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp506022lfy;
        Fri, 24 Jul 2020 09:43:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGXoj4aoKJgZ3RTp4H6E4LVtleLIpmhXp4vTfKzadXYS9WLG1M24daZO2wHeuDUTnpgp1I
X-Received: by 2002:a25:3b93:: with SMTP id i141mr15399613yba.28.1595609014352;
        Fri, 24 Jul 2020 09:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595609014; cv=none;
        d=google.com; s=arc-20160816;
        b=YaLN5I9U8rY7OAuBV86oh9zL3cAXbQ9c5Gy8SIsd8AxVMyCYu9ttxOIVjkEV6yHyWm
         XA1kKjhtcU3fDBqKwD2408kZQhxNxwDXUnEDVMZNniumdf2rv4iD9LKLNOx0gSkAxKkh
         1Epi4a+mGDwKHwAGeGVmnzbLIj+vBjY8fGeig85vZKH2Lh6NR9E2cce91KKBAo6BcVHr
         Knh+53iJZAIEggqqe4sODnydSTO/p/5ETMzeerx3KchkfW8IL+BaU4OuoU8ABOQvGzLo
         rQdrJ4OqNRC0vVRNEZCSnm+NsLc0+ndDVUIL2CkyO8d2WW5DEtF7Y5gjap8D6oGvD9aj
         npOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ZKva+nnLceYjGOoECEqJvTZy04pusQPwhRPdMqSZ1kw=;
        b=tTavfo59XJDYrtZvk0e1zhyhfDKeISu+XFoO6gWS2Eq0tFhgyk/UbFPheDgwyRnL42
         20Vhr4wyDKtePLLcyyJN3tOZdSvk/ZCq2S/ZcmE00cHK5eNS5zK60QMolEohUDXI6V7Q
         TJB1QA0fvV3TL5CRJPgNDPOUMnUDSBVcTRnh5NXU+aCcA+p+kHN6GUrDcqW0ZQAFGv8O
         d8qd89F3/rEJbGyBBvDgvMCQLJ/9oDqYuEBxz+ENaRlfy+GoR0sh+CmmcMfMZRv74SSG
         uJYPoQG68awHXcNqZedQNeJr+IKr1olaBCX9woWjzDt8AFpMCj+KVbTJgaOuI4EUMifM
         RBjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QAr26za4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si1490494ybj.190.2020.07.24.09.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 09:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QAr26za4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jz0nF-0005OW-OI
	for alex.bennee@linaro.org; Fri, 24 Jul 2020 12:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mw-0005Mh-29
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58420
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jz0mt-0002Zs-46
 for qemu-arm@nongnu.org; Fri, 24 Jul 2020 12:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595608989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=ZKva+nnLceYjGOoECEqJvTZy04pusQPwhRPdMqSZ1kw=;
 b=QAr26za42oahJRP5RfH1cCtBr3c5eKjSRDo5bQirMwvWytCTujd4jUIuGUhIm9gZGJMUo7
 WQSVRgcpov6ySuXNf9csoLVUkyXYfomuwxsCaCiU38rW2PiNpxbkm6wSuTBorxucxHquJK
 RnssD4Rn3f/737NtBsOukwHTcUKmh0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-liJemNFgOMe-LOJwg4ln9w-1; Fri, 24 Jul 2020 12:43:07 -0400
X-MC-Unique: liJemNFgOMe-LOJwg4ln9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89371940920;
 Fri, 24 Jul 2020 16:43:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A7819D7C;
 Fri, 24 Jul 2020 16:42:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A0D9F9D92; Fri, 24 Jul 2020 18:42:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] hw: Only compile the usb-dwc2 controller if it is really
 needed
Date: Fri, 24 Jul 2020 18:42:56 +0200
Message-Id: <20200724164258.24886-2-kraxel@redhat.com>
In-Reply-To: <20200724164258.24886-1-kraxel@redhat.com>
References: <20200724164258.24886-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 06:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HbwIOjB0CjLZ

From: Thomas Huth <thuth@redhat.com>

The USB_DWC2 switch is currently "default y", so it is included in all
qemu-system-* builds, even if it is not needed. Even worse, it does a
"select USB", so USB devices are now showing up as available on targets
that do not support USB at all. This sysbus device should only be
included by the boards that need it, i.e. by the Raspi machines.

Fixes: 153ef1662c ("dwc-hsotg (dwc2) USB host controller emulation")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>
Message-id: 20200722154719.10130-1-thuth@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a224a6351ab..bc3a423940b7 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -315,6 +315,7 @@ config RASPI
     select FRAMEBUFFER
     select PL011 # UART
     select SDHCI
+    select USB_DWC2
 
 config STM32F205_SOC
     bool
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index d4d8c37c2897..5e63dc75f815 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -48,7 +48,6 @@ config USB_MUSB
 
 config USB_DWC2
     bool
-    default y
     select USB
 
 config TUSB6010
-- 
2.18.4

