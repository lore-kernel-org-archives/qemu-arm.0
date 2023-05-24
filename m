Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447768ejb;
        Wed, 24 May 2023 03:29:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KWhMPeCv3UkuMFAL/lknkWyCeIHgadVD3nlOWQLUaxaYwGk3MlxDTSPP3TdwLlPdDMB7C
X-Received: by 2002:a37:cc1:0:b0:75b:23a0:d9d4 with SMTP id 184-20020a370cc1000000b0075b23a0d9d4mr6676558qkm.42.1684924143535;
        Wed, 24 May 2023 03:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924143; cv=none;
        d=google.com; s=arc-20160816;
        b=yd5NHq7DtdiLu7c+ilH8ZQHxL9OQwjtc+iRpLvq0b4e7Wcn4BEZcVa2WK4rDabz7jT
         5KM1AIIkaX+2A612p754gPWhWe0WMjc7JeWLOUVuH+CrLNk4TQxjv6f8aNmipffnOQKt
         r94lDZnDImOpFYarW/cbZvkVbhcDvEHpmofNsxcy70dhrSaY/H3e1yaAZpaNCNygGGz3
         yrCrm6LX5cAvhIcz3Bxhi1i8aNM1xVHXE7nZDYANinhWRQANmJmyrHB5mQN4w4lAuzPm
         giKnXmCDaKewrxLadmSO6ewv2meyqbKZ6a2nfJU94NDw23qaCQf6BBU+pc/oxrirBy6F
         pBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=tYTsUw7KNn2lQnQnvusuvifxoOlVpO/oRfijUf023Wo=;
        b=Wfnqa0x9OL6euJiGlnv7JECYT7RD+JzftHNch+y71WQDjyvMiSJ3q0xTWaW4Yvn7u2
         wKe9FCm/mkzsMjWfyxN5qP55B9wGh2o73MAtKcEMP+AweHZEAKp3kcs0BSRve6G5otZH
         VBO090TnPdZdN0yqbRMZoU0GXRa2S5+Zh5yABduUbhgS0R71KCdV911r5c4OnHe4SBY6
         Axw0rtQTH9xMvt7zJh1eva0PCAHkpC/JD5yBcWw3je4SLNkYrY9JB7yvEsRhEEBosPGC
         M0Zw+X7MNtEHNbzTDyo+E2zvdpWfa/F0qChutxk0Hw/h26bk+oh+249jwWdS+N0FGfbP
         Sgfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx15-20020a05620a51cf00b0073baf97bb4dsi6082634qkb.101.2023.05.24.03.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:29:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1lio-0007yX-1V; Wed, 24 May 2023 06:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lia-0007r4-1a; Wed, 24 May 2023 06:27:46 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liX-0000Oo-Ql; Wed, 24 May 2023 06:27:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id EFB0B260B8B;
 Wed, 24 May 2023 12:27:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b1UX0hO68vl; Wed, 24 May 2023 12:27:36 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DA9622609C0;
 Wed, 24 May 2023 12:27:34 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 2/5] Add Bochs to list of vga_interfaces
Date: Wed, 24 May 2023 12:27:26 +0200
Message-Id: <20230524102729.810892-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qUEyzbwmh6iF

arm/sbsa-ref uses Bochs-display graphics card and without it being
present in vga_interfaces "-vga none" argument handling cannot be added.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 include/sysemu/sysemu.h | 2 +-
 softmmu/vl.c            | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 25be2a692e..9713a1b470 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -29,7 +29,7 @@ extern int autostart;
 
 typedef enum {
     VGA_NONE, VGA_STD, VGA_CIRRUS, VGA_VMWARE, VGA_XENFB, VGA_QXL,
-    VGA_TCX, VGA_CG3, VGA_DEVICE, VGA_VIRTIO,
+    VGA_TCX, VGA_CG3, VGA_DEVICE, VGA_VIRTIO, VGA_BOCHS,
     VGA_TYPE_MAX,
 } VGAInterfaceType;
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b0b96f67fa..07e6030875 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -216,6 +216,7 @@ static struct {
     { .driver = "ati-vga",              .flag = &default_vga       },
     { .driver = "vhost-user-vga",       .flag = &default_vga       },
     { .driver = "virtio-vga-gl",        .flag = &default_vga       },
+    { .driver = "bochs-display",        .flag = &default_vga       },
 };
 
 static QemuOptsList qemu_rtc_opts = {
@@ -935,6 +936,11 @@ static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] = {
         .name = "CG3 framebuffer",
         .class_names = { "cgthree" },
     },
+    [VGA_BOCHS] = {
+        .opt_name = "bochs-display",
+        .name = "Bochs framebuffer",
+        .class_names = { "bochs-display" },
+    },
 #ifdef CONFIG_XEN_BACKEND
     [VGA_XENFB] = {
         .opt_name = "xenfb",
-- 
2.40.1

