Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4477840ejc;
        Wed, 30 Aug 2023 09:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVXOVAmzdWt7boqX3Y3SKB8HcUffixaJS2ksd7KdfGvoWXhPoouA8cOL+bu9NL6RwSubHp
X-Received: by 2002:a67:bd15:0:b0:44d:547d:4607 with SMTP id y21-20020a67bd15000000b0044d547d4607mr2221874vsq.35.1693412164448;
        Wed, 30 Aug 2023 09:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693412164; cv=none;
        d=google.com; s=arc-20160816;
        b=lTCZjUZ3gHzvgYwcLDwsIp6C3e3lWlEabIkAh9g1rLoy8MZzroC75Yc5kZE2f8fmU1
         zTtFQ3SbZztXA3rt2/8JzKBIdoB1u0vXHrThWGtS7GCvdekOcwlqhHywtikKw2MBX+rd
         qqUaAlFJM9GrNCHktrm/DnEx5I+sj8LD2RviL9BvdnAYQYsdNFGCiBmZZTUASfldQqHB
         PlBLVC1tgG7pXZgZaQXCWbLDbT+s5PmfCeC5xNtGkEIQ5C613OcjvWdfoDMEOWUmR6mq
         dn3iaJMCnS2hIwHU2Av0V5kI7/OMNpzdyJvcdmTGVcjbzFVSRJuykiz/+moWyHePDE7R
         d4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:content-transfer-encoding:precedence
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BN7p1+nUod5Kl7QmNTLv0efgM3fiYIGpIgiSI9p6Knw=;
        fh=OBt2Y58vDLuJaQUxvn8ibOYWL7kLsVUqWZDsmWaxWv4=;
        b=cLruQo7IhbCC8WdR/k9IG6bCY89qncTb6clXGc2NPif/29NAyHdSnQvCgvDnlvYZJR
         GDVlpbXg2HUeXKcBV70uO2YnLrkIbPyACbeQB0/P4Y04YcPeNDZEoSIUP6NQNUHzujBR
         fdntE2WB4UYhwfrwEyK3dxcK0T7e8O7rM+uWKCDn7phvdf5e8kEX6zh6zemsu3D08Dtr
         QZ4vENU/5H2MQf5l6RKTJcKmVrG/WWfRMQCEddcJTmXlX1mjVrzlLA8JSCWVivVVY8zm
         7iqDstCZeYu1Z5H5IUugWqjIYEcE2h93nhSzSWIlv8u4Eo/J0+qyILtN/eoeNzjxBYcl
         IPig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=hwDsCCzQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a67c30d000000b0044e97267170si1175537vsj.94.2023.08.30.09.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 09:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=hwDsCCzQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbNqb-0003Fe-FF; Wed, 30 Aug 2023 12:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=599fd62c5=graf@amazon.de>)
 id 1qbNqX-0003A6-Tb; Wed, 30 Aug 2023 12:15:11 -0400
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=599fd62c5=graf@amazon.de>)
 id 1qbNqS-0003lU-SA; Wed, 30 Aug 2023 12:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1693412105; x=1724948105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BN7p1+nUod5Kl7QmNTLv0efgM3fiYIGpIgiSI9p6Knw=;
 b=hwDsCCzQCdnAsEBmzSLvpuS35oC7SBXVU3Czhyc+Ybqm2Ovz+gYe2pdA
 OJd1yANQXKtTsH540tKEXLr9xTF8kcigVhXgZkwBH3FLzSQi4Ag0zYVbh
 qdpdHhcQLV7e2ELramYiceTQKSysbOKw1XIWpLy+ASITztpq1aAkKdjxk s=;
X-IronPort-AV: E=Sophos;i="6.02,214,1688428800"; d="scan'208";a="348536778"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 16:15:01 +0000
Received: from EX19MTAUWC001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-96feee09.us-east-1.amazon.com (Postfix)
 with ESMTPS id BE3A547A29; Wed, 30 Aug 2023 16:14:55 +0000 (UTC)
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 30 Aug 2023 16:14:44 +0000
Received: from dev-dsk-graf-1a-5ce218e4.eu-west-1.amazon.com (10.253.83.51) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 30 Aug 2023 16:14:41 +0000
From: Alexander Graf <graf@amazon.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, <qemu-arm@nongnu.org>, Cameron Esfahani
 <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Mads Ynddal
 <mads@ynddal.dk>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann
 <kraxel@redhat.com>
Subject: [PATCH v2 05/12] hw: Add vmapple subdir
Date: Wed, 30 Aug 2023 16:14:18 +0000
Message-ID: <20230830161425.91946-6-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230830161425.91946-1-graf@amazon.com>
References: <20230830161425.91946-1-graf@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D038UWC003.ant.amazon.com (10.13.139.209) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=72.21.196.25;
 envelope-from=prvs=599fd62c5=graf@amazon.de; helo=smtp-fw-2101.amazon.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: NoDrHtAGknP8

We will introduce a number of devices that are specific to the vmapple
target machine. To keep them all tidily together, let's put them into
a single target directory.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS             | 6 ++++++
 meson.build             | 1 +
 hw/vmapple/trace.h      | 1 +
 hw/Kconfig              | 1 +
 hw/meson.build          | 1 +
 hw/vmapple/Kconfig      | 1 +
 hw/vmapple/meson.build  | 0
 hw/vmapple/trace-events | 2 ++
 8 files changed, 13 insertions(+)
 create mode 100644 hw/vmapple/trace.h
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events

diff --git a/MAINTAINERS b/MAINTAINERS
index 6111b6b4d9..3104e58eff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2573,6 +2573,12 @@ F: hw/usb/canokey.c
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
diff --git a/meson.build b/meson.build
index 0d6a0015a1..dc5242a5f4 100644
--- a/meson.build
+++ b/meson.build
@@ -3282,6 +3282,7 @@ if have_system
     'hw/usb',
     'hw/vfio',
     'hw/virtio',
+    'hw/vmapple',
     'hw/watchdog',
     'hw/xen',
     'hw/gpio',
diff --git a/hw/vmapple/trace.h b/hw/vmapple/trace.h
new file mode 100644
index 0000000000..572adbefe0
--- /dev/null
+++ b/hw/vmapple/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_vmapple.h"
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
-- 
2.39.2 (Apple Git-143)




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



