Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp811960lfm;
        Wed, 22 Jul 2020 08:47:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz7BF5rfugBXF+Fn7Dg+lvgBrb+KIFgsCRe6tKhAERMDGKU8s71SjcHAqg6yQ3zbjCOyVN
X-Received: by 2002:a5b:3d2:: with SMTP id t18mr47324359ybp.453.1595432864217;
        Wed, 22 Jul 2020 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595432864; cv=none;
        d=google.com; s=arc-20160816;
        b=s5noa8UlncqdsQry5SG2racoFTLakbr72TqOmM7LNd5It5hpesBX4DHHIrhiI5ao7y
         lWzeEOktcTYqWZQlDjWGJ7ClMm1NjhAYCG2RpoKkAQR3sCucX5qgGJtIa9Fx4L1IKE+u
         D9ubHK0d5w+1i603DPyj9/X2qeu7XKVR+g9wd251JewoKM93/G2DCICc1Fv7ndmX6ZN4
         0re1/+mf4a2d2u+44gIMnwOOaQV3YdElEVd3wgh4/EtwTFN+LBA9f1w5swMOQRCMF2SN
         whDfBdmcBwCNvqXlw+J5TLj1SMZLR+NvLUgEHocvKTSUU7MO79870FLCRLic0tHyCzfq
         CnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=oKmwSab4WVClOoA3+gwsRKlvTsX+VrKLkz2Nba6iFdQ=;
        b=oA6bQ2RewLZcgUyT6WldCRLoR3XLCFYftox4MlX+f660zUu8qRCsNkic+MA8meWxKT
         euwdy6U7QSlkWnvholuwH3bVWU5160AyufQTzJte+YPoSG8tlmkAndRD7CQak9FbJdHh
         ZYvRPH2kHn92QqKWhWYNUgO/KQXXlPj3ml6rQziELEo8BNBE1IV4Fti0hZhB+78VTWnJ
         FTCPGoPRgl6XQx8WUWy70Eu/dBkQmEUUvE6HgUeuqpjQlIT+uQg42b4JKblqdT/N45Va
         bhcvpsyiZgE4g1ZiIAyEd5nSm0lQW+eT4GKXhxlYl4wj4+U8wlljEb/wBAFwtF5uyUT1
         NQqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfKr9iGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s65si82469ybc.138.2020.07.22.08.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 08:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfKr9iGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyGy7-000362-JP
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 11:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyGxx-00034Z-RL
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 11:47:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37187
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jyGxw-0007Ki-Gj
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 11:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595432851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=oKmwSab4WVClOoA3+gwsRKlvTsX+VrKLkz2Nba6iFdQ=;
 b=VfKr9iGxzDFMWkRD0AL+0pJCWOdIz07Nz7vUefYFVDnKRUJ73bPJbJUZg8QWprFtdprNI/
 pfv1r9L0IyaQcw6B2ZR5quT7pGLMgvl++OpMtAmRVA8i5qFFii6diEzj1IZSDHANQuLf3u
 YERyz2/t4rfsfSTpF4/XYM2Bn1QMq1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-NwuPYuELP_m1iOkTRzn-zA-1; Wed, 22 Jul 2020 11:47:27 -0400
X-MC-Unique: NwuPYuELP_m1iOkTRzn-zA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80764102C7ED;
 Wed, 22 Jul 2020 15:47:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-92.ams2.redhat.com [10.36.112.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D915F7D8;
 Wed, 22 Jul 2020 15:47:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.1] hw: Only compile the usb-dwc2 controller if it is
 really needed
Date: Wed, 22 Jul 2020 17:47:19 +0200
Message-Id: <20200722154719.10130-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IWoIvgrd7XX0

The USB_DWC2 switch is currently "default y", so it is included in all
qemu-system-* builds, even if it is not needed. Even worse, it does a
"select USB", so USB devices are now showing up as available on targets
that do not support USB at all. This sysbus device should only be
included by the boards that need it, i.e. by the Raspi machines.

Fixes: 153ef1662c ("dwc-hsotg (dwc2) USB host controller emulation")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a224a6351..bc3a423940 100644
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
index d4d8c37c28..5e63dc75f8 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -48,7 +48,6 @@ config USB_MUSB
 
 config USB_DWC2
     bool
-    default y
     select USB
 
 config TUSB6010
-- 
2.18.1

