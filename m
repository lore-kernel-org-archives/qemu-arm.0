Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp714787njm;
        Wed, 5 Mar 2025 02:58:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtbNF9RCSbO4cvGtdpr2CR00e/VM/EtDys0ifScI4L4mjBcJ1LfTqIQrBWSnf1hci9n3A61YaIExnb3A==@linaro.org
X-Google-Smtp-Source: AGHT+IFnkdWsK0S9AesuqQWxc758m6nxGK7Vhct5n2xKCZ8/XQYBvD5mFHYNW9BlX1L4l+fNCMbT
X-Received: by 2002:a05:6214:2b0b:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6e8e6d4ec99mr37058106d6.39.1741172338850;
        Wed, 05 Mar 2025 02:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741172338; cv=none;
        d=google.com; s=arc-20240605;
        b=Tt0sYORr6LyaHhU1VDKtBZIopuWKq9nWuMReWB4iHnyqc9uJ3PyjUjBTBmYGX968kR
         dEcKyRkPo5jksbS7cpXjpPzw774OMxOhRdUaNdy4TmuFNTtPwfbt52Ji85s/kqwCPnC/
         T0vALlOst8XoCZf7+Vgv1rNz7NVjSOnhm6di3hE5rZCyGyS1khvNjefJQb4GabZySvmP
         HMXC35glsrOfjB7QK3EPl3BRjULRPFeLwNmnrv1XDQ0G/cCt9Yi+MdMsT8lybVs/QPJV
         c1KwxZMONayb0Ve8TzfShQ/05IFxdH5oHiAh9P7e6H4iOB7AjNrMK1X4EvTH97KvRHMd
         3n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=d4WCCa9DdQ8JqYpK/48KzX+KPIshRLvGx5c9HPd+4EM=;
        fh=4zSIZWa8wtouIzi8gCSxgg0WTFHJDpnjrIY9cXjk/4k=;
        b=PDn5lD9GjqAtk6sUVUXyvgTSQKrVQOgILtPMwp00/ZxTHL0V0IkowWlxLOz5AOqhZT
         ygxooRe+BDQ2ubUQFapsFLNBuIU+zkQfSx04RVGiv1MokREJppOnCFhPSTc6b+4G3/2N
         KFaLvb/wl4sSvFlSFfaNv2xdV0x5CgrfHq8vSe2IB6PGq0huhdAsm9SsiAXArK7Q4Kky
         vRsdNAg7uGe++D9po1N6mz//mNnyOqgim1/Cssio5+XxpFIYWK344HG6ngP1a8YHEejo
         V0yk0tXwO5pDT9lg12CEHXrK5AYritT8IucDquvPe463Eoea8L0heozUCECaw3U9Ec+4
         WXFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KUyrWgfJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8e898520asi10106886d6.456.2025.03.05.02.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 02:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KUyrWgfJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpmSI-0001v9-Gb; Wed, 05 Mar 2025 05:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tpmSH-0001ur-DE
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 05:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tpmSF-00017y-AU
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 05:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741172301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d4WCCa9DdQ8JqYpK/48KzX+KPIshRLvGx5c9HPd+4EM=;
 b=KUyrWgfJ51k39KLsEglCD5uowkwHcXqSLKzK2UepXEh8SrgWRgx8FifcCglOx8XZEJ7ll6
 WTwXhXEma8JnIG5Haxpiq22ZpsKxGsKPrSrWQIRqm5EcI5soWUJnzTgL1oqQze5jevpKSV
 XAs5syKawh6jEJ3ZoveiHWh+53VQ+oo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-7wuh7ZkfO6KYjaJ2TvBIMA-1; Wed,
 05 Mar 2025 05:58:17 -0500
X-MC-Unique: 7wuh7ZkfO6KYjaJ2TvBIMA-1
X-Mimecast-MFC-AGG-ID: 7wuh7ZkfO6KYjaJ2TvBIMA_1741172296
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 567501801A03; Wed,  5 Mar 2025 10:58:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.225.55])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 841AB3000708; Wed,  5 Mar 2025 10:58:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, clg@redhat.com
Cc: zhenzhong.duan@intel.com,
	will@kernel.org,
	maz@kernel.org
Subject: [PATCH] vfio-platform: Deprecate all forms of vfio-platform devices
Date: Wed,  5 Mar 2025 11:58:00 +0100
Message-ID: <20250305105800.949153-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kVNojR5EOlNZ

As an outcome of KVM forum 2024 "vfio-platform: live and let die?"
talk, let's deprecate vfio-platform devices.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 docs/about/deprecated.rst | 25 +++++++++++++++++++++++++
 hw/vfio/amd-xgbe.c        |  2 ++
 hw/vfio/calxeda-xgmac.c   |  2 ++
 hw/vfio/platform.c        |  1 +
 4 files changed, 30 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index abadf8de27..d11a7004df 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -434,6 +434,31 @@ Stream ``reconnect`` (since 9.2)
 The ``reconnect`` option only allows specifiying second granularity timeouts,
 which is not enough for all types of use cases, use ``reconnect-ms`` instead.
 
+VFIO device options
+''''''''''''''''''
+
+``-device vfio-calxeda-xgmac`` (since v2.4)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The vfio-calxeda-xgmac device allows to assign a host Calxeda Highbank
+10Gb XGMAC Ethernet controller device ("calxeda,hb-xgmac" compatibility
+string) to a guest. Calxeda HW has been ewasted now and there is no point
+keeping that device.
+
+``-device vfio-amd-xgbe`` (since v2.6)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The vfio-amd-xgbe devices allows to assign a host AMD 10GbE controller
+to a guest ("amd,xgbe-seattle-v1a" compatibility string). AMD "Seattle"
+is not supported anymore and there is no point keeping that device.
+
+``-device vfio-platform`` (since v3.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+The vfio-platform device allows to assign a host platform device
+to a guest in a generic manner. Integrating a new device into
+the vfio-platform infrastructure requires some adaptation at
+both kernel and qemu level. No such attempt has been done for years
+and the conclusion is that vfio-platform has not got any traction.
+PCIe passthrough shall be the mainline solution.
+
 CPU device properties
 '''''''''''''''''''''
 
diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
index aaa96903db..5927503b5c 100644
--- a/hw/vfio/amd-xgbe.c
+++ b/hw/vfio/amd-xgbe.c
@@ -15,12 +15,14 @@
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 
 static void amd_xgbe_realize(DeviceState *dev, Error **errp)
 {
     VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
     VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
 
+    warn_report("-device vfio-amd-xgbe is deprecated");
     vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
     vdev->num_compat = 1;
 
diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
index b016d42b49..a5ef262def 100644
--- a/hw/vfio/calxeda-xgmac.c
+++ b/hw/vfio/calxeda-xgmac.c
@@ -15,12 +15,14 @@
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 
 static void calxeda_xgmac_realize(DeviceState *dev, Error **errp)
 {
     VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(dev);
     VFIOCalxedaXgmacDeviceClass *k = VFIO_CALXEDA_XGMAC_DEVICE_GET_CLASS(dev);
 
+    warn_report("-device vfio-calxeda-xgmac is deprecated");
     vdev->compat = g_strdup("calxeda,hb-xgmac");
     vdev->num_compat = 1;
 
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index f491f4dc95..a09f7f65c6 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -575,6 +575,7 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     int i;
 
+    warn_report("-device vfio-platform is deprecated");
     qemu_mutex_init(&vdev->intp_mutex);
 
     trace_vfio_platform_realize(vbasedev->sysfsdev ?
-- 
2.47.1

