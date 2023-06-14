Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp363953ejt;
        Wed, 14 Jun 2023 15:57:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Ogb5qfPV0O/e3IbE7tyC9WpetvwQqLgjx1RYMVtV7oSyFK+wyS/aNOWtOMlRA2pgU9Tp4
X-Received: by 2002:a05:6214:5194:b0:61a:fe65:4481 with SMTP id kl20-20020a056214519400b0061afe654481mr19760293qvb.51.1686783450862;
        Wed, 14 Jun 2023 15:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686783450; cv=none;
        d=google.com; s=arc-20160816;
        b=q5SvN7bggz2dpNLUy6c2IxWCTtg8iHhmUcmtYh6YCj0UF6rfK1hFraRMlIcT81/lYm
         /MyMKv9DLD8JctQ15K/SfTW+hhpNPKjXTJH+Z5sej1/kTQ1FiepPtqND+fTKEms2iPQ8
         oAGGw35Qel4k4xxRiUBhXfhx+cw8l5Cxnwk+LLLrPMpsvNsAc33hkPytTs0weVeCU9pN
         kT7ov0PUNNatLF0c9DqEUNhQ9eFVd0MEHgU8rNQgE+ocL+eIaQGtIBZAaOzBNNWpBFtQ
         cnQEhK7cFLFDsw9zrioPG74TGA9Dnjp4U6pDOHgYRhR04ylsvh4M/pi+YKkytd56D2kk
         +bsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OhYRcYXWE26TbZEm20TSOGro/txUrypCuhbhRIiADE0=;
        b=fG6vxNAfrNceXmI3nGH1z1TjXzDzhI8YpiPRqJmtpkz2Mbpkuhp8IPBkNrFR2QiefS
         LGXmWX0hF02GNk7T8TrILVyEeN5igh8NSoIf28M0IFZYM3G1iItAyLHNO4mgJI1YZTxE
         VEbWaZcJL/lFbHqGsW47nDND5Er43PHfIoT4W1/ZERnPHxRZCfGdKabupSaTcoHuZV98
         gbV/o8b0frt8lGC5kn15PAnXlzvoiBgSzJF2tXHJDf/D92lKA6WMkjeE7nzknTK3Q608
         AHTkdsG9gkIvvcvyiolr8L8QpDp//h6cRYL3xan9oAjIfLon+y5qHUUyIKOPP/7fCcEg
         9X4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=smvYusAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a0562141d2900b005ef8c578589si9165776qvd.297.2023.06.14.15.57.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=smvYusAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9ZQ2-00086p-TW; Wed, 14 Jun 2023 18:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZPt-000855-LF; Wed, 14 Jun 2023 18:56:43 -0400
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=52269c73c=graf@amazon.de>)
 id 1q9ZPr-0000fS-SV; Wed, 14 Jun 2023 18:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1686783399; x=1718319399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OhYRcYXWE26TbZEm20TSOGro/txUrypCuhbhRIiADE0=;
 b=smvYusAjQG3X+kzAgMGYbl7FqLcRak3wqehlbWonrV6vI7zBOGPLp7sM
 Gjt7UwG6T30Or2GBs1PMFiIPArhljM6OUt2ISZRykvCGTO+l3gCaTuWET
 PD12eVY0Bcz3pITpu2b7aZaHL4/HTNmuePVit42zjBAvmobCuPT0Iyhby c=;
X-IronPort-AV: E=Sophos;i="6.00,243,1681171200"; d="scan'208";a="338928100"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6002.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 22:56:36 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-617e30c2.us-east-1.amazon.com (Postfix)
 with ESMTPS id 00DD06347B; Wed, 14 Jun 2023 22:56:32 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:56:32 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 14 Jun 2023 22:56:30 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 06/12] hw: Add vmapple subdir
Date: Wed, 14 Jun 2023 22:56:23 +0000
Message-ID: <20230614225626.97734-2-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614225626.97734-1-graf@amazon.com>
References: <20230614224038.86148-1-graf>
 <20230614225626.97734-1-graf@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=52.95.49.90;
 envelope-from=prvs=52269c73c=graf@amazon.de; helo=smtp-fw-6002.amazon.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: yQaJ15c+wmk1

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS             | 6 ++++++
 hw/Kconfig              | 1 +
 hw/meson.build          | 1 +
 hw/vmapple/Kconfig      | 1 +
 hw/vmapple/meson.build  | 0
 hw/vmapple/trace-events | 2 ++
 hw/vmapple/trace.h      | 1 +
 meson.build             | 1 +
 8 files changed, 13 insertions(+)
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a80a38511..7d5cb3e3e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2547,6 +2547,12 @@ F: hw/usb/canokey.c
 F: hw/usb/canokey.h
 F: docs/system/devices/canokey.rst
 
+VMapple
+M: Alexander Graf <agraf@csgraf.de>
+S: Maintained
+F: hw/vmapple/*
+F: include/hw/vmapple/*
+
 Subsystems
 ----------
 Overall Audio backends
diff --git a/hw/Kconfig b/hw/Kconfig
index ba62ff6417..d99854afdd 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source tpm/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source vmapple/Kconfig
 source xen/Kconfig
 source watchdog/Kconfig
 
diff --git a/hw/meson.build b/hw/meson.build
index c7ac7d3d75..e156a6618f 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -40,6 +40,7 @@ subdir('tpm')
 subdir('usb')
 subdir('vfio')
 subdir('virtio')
+subdir('vmapple')
 subdir('watchdog')
 subdir('xen')
 subdir('xenpv')
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
new file mode 100644
index 0000000000..8b13789179
--- /dev/null
+++ b/hw/vmapple/Kconfig
@@ -0,0 +1 @@
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
new file mode 100644
index 0000000000..9ccc579048
--- /dev/null
+++ b/hw/vmapple/trace-events
@@ -0,0 +1,2 @@
+# See docs/devel/tracing.rst for syntax documentation.
+
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 0000000000..572adbefe0
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
diff --git a/meson.build b/meson.build
index 0bb5ea9d10..e0203518ef 100644
--- a/meson.build
+++ b/meson.build
@@ -3273,6 +3273,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



