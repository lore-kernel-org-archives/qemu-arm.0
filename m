Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2443369ejb;
        Wed, 24 May 2023 03:18:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nkyXWk7uMu1RjjQP7YmgqMYjiVaKt0AkY3RoXBbGJw/voH3EQw26Ra1+HNj4Wvn4t/VDh
X-Received: by 2002:a37:4d6:0:b0:75b:23a1:8350 with SMTP id 205-20020a3704d6000000b0075b23a18350mr5843933qke.75.1684923534336;
        Wed, 24 May 2023 03:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923534; cv=none;
        d=google.com; s=arc-20160816;
        b=Pq04l7Vvb3ti4ALMXwXbrT90FIe7yryyb4P2DqMr46s7zhDd8eoInnWvODn5ct1E5K
         nU83nLjSmj300+yCmbrFhdA8tlqTKCvUwdW/YvHFMKxZHJNIn/D9sA3N8p+VNphRUWcr
         khyotV/yroFfK7kwtujJ7iVZsxFPLwgJsl99wpV0XITQsLHwDtqJPzUfUNfIyYdg6PJD
         HwDp+7tw3bQqADS/4ObyWLAv8vRtdFcG/OqklOQvb8XzXE2LdvSpUV75JZOp764bCAmF
         P6HI/siGAB1+wNvdLk7Cq4B9nTwvHYBGbYnhmTHAofnu4xbPDcPQJDfGhRM5muFJg1Ru
         //HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=tYTsUw7KNn2lQnQnvusuvifxoOlVpO/oRfijUf023Wo=;
        b=nOiOE/SD8bHgyb0o3FAopgmASddO9anUwXKFanYkLslAQri6pxxSveeipAZ+jJXwkf
         Sbz5B7mQ9hn6THNbw3gAcbsMl2nsV+zqgLq3xyIVHz0ySM/MvMhvkgLN2cm/R9Ssuydq
         LH0cEB29Ys6klML6VmvhhXObpqpB6o5vU1pUggkMMwV6D5kZc+v3ebdHQLFMf8lq4PC2
         pxRqZNAsQTav03J3PkISesHc7tBhtnOkjj/EW99nXbnlXP2iXsrhwXRZh5vZwoMjR3KE
         FnmitgA1bvs5hQxHAOseEeWNSlB+p8AkxNTmIcnJhw6XWKzW7eRKaZFODn1wvlun1Heu
         sYmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020ae9c102000000b007579d615158si5813878qki.649.2023.05.24.03.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lZy-0003VE-Hh; Wed, 24 May 2023 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZo-0003Py-1V; Wed, 24 May 2023 06:18:40 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZk-0006ce-01; Wed, 24 May 2023 06:18:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 632A1260249;
 Wed, 24 May 2023 12:18:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4v4b2P0Q0xE; Wed, 24 May 2023 12:18:29 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 35D4D260287;
 Wed, 24 May 2023 12:18:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 2/5] Add Bochs to list of vga_interfaces
Date: Wed, 24 May 2023 12:18:20 +0200
Message-Id: <20230524101823.810737-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UF1HR6hOPIu9

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

