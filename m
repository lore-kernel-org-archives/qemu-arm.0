Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2439270ejb;
        Wed, 24 May 2023 03:10:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4baoJN2+kuK7GBLGRIPaIl+n8ZA25hdvRwRxGIRe6az61X+WKjTkrEs6zfU8eG2kDmPQAl
X-Received: by 2002:a05:622a:1356:b0:3f6:bffe:3c0d with SMTP id w22-20020a05622a135600b003f6bffe3c0dmr4006767qtk.4.1684923029301;
        Wed, 24 May 2023 03:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923029; cv=none;
        d=google.com; s=arc-20160816;
        b=jFUouA7t5P5oPeWH40oyHREQAVGBkxQulcQiQzY0jX8aUzSxEG5yDJP7AzrCpJIdMA
         RAn9OjFirx93ThhnzMkp+D0NQt7Czuiv6QeKgHAf4hdx8xMCSKbebFFqkllt42M0atnn
         9mQ4MRQMty+wCWIBheJudcSMPcFOwzCTYT4OKdf0QRPur8xy96s4a+m2qfK/ZsjkvAL7
         Yfm3N6GPLrObhYd7tIKsot5d43zXbTywkKZaHbnOj58MBdPTam2q+q3xHgAvrlKI0qcw
         iA51WkLrpKeYMeT1GZplUWrM1O+sltrUqdArRQwGxZp5W8AKBYKtfSoDpML9VD85dvud
         OQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=tYTsUw7KNn2lQnQnvusuvifxoOlVpO/oRfijUf023Wo=;
        b=wnNOU8pgD40zwy+6fZsyb18N95Rpu/LFU7G69kKODLStN6MtDHUmQCoa23xCi/IxwU
         FOvxwiFZOxKz2qzQFUXOQU42uQa9cRqt1WT2QbsF7sZFLM+nIjYF4E8xxOytVx8BESaV
         87nw5JbbcfvSfIY9EPZwnJwqWzO7bmeFxL0+4UI3f0dMiUrqataU6cgBjXqXyNhSaEAp
         +61bdOIrRWZk8WCHBeBFeAPiWBldI0GaEcRxcEQx5ZfkzWhfzSeswY1CnKjGq//kNYWj
         2VdTqdCl/4f9Fds3u9zxGl4ZHwGNh9ZmtH+MO+Zl3K0JP9yrjIvqQzz9hNkAoCIa5Ibs
         xtAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020ac85b45000000b003b9b59883fbsi3160717qtw.573.2023.05.24.03.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:10:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lRV-0001oV-9T; Wed, 24 May 2023 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lRT-0001o2-UQ; Wed, 24 May 2023 06:10:04 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lRS-0004nj-FP; Wed, 24 May 2023 06:10:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 6EEA22609C0;
 Wed, 24 May 2023 12:09:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Upu532Q0PMx1; Wed, 24 May 2023 12:09:57 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C2211260249;
 Wed, 24 May 2023 12:09:56 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/4] Add Bochs to list of vga_interfaces
Date: Wed, 24 May 2023 12:09:53 +0200
Message-Id: <20230524100953.810660-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
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
Reply-To: 94fa33bb-56a7-8c08-4edb-3283745ad903@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C/zg1yJnl3bp

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

