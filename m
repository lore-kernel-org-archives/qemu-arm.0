Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1041873njc;
        Mon, 9 Jun 2025 00:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNQgb5/fU9Sqx6EJaItFiIohQD4OdarZ6VCVa5M+Vkux2DBql009BDPor8VCLFoUVI4t+fKclEULFKLw==@linaro.org
X-Google-Smtp-Source: AGHT+IGtCnhGc46rNx5S0KdNRU9Ds5ZDt+eSJ6Vx/Xt/ubYx2vbg2wTPrwUOenQznVHHml2uBC4c
X-Received: by 2002:a05:620a:8008:b0:7c7:a543:dcfe with SMTP id af79cd13be357-7d2298a6e55mr2025247885a.32.1749454540529;
        Mon, 09 Jun 2025 00:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749454540; cv=none;
        d=google.com; s=arc-20240605;
        b=bJO/tpk0xGbHQTiKNL1UTzLI2Mjk066Z4On+TyuSnhaT/g0RZGTLbHYjakngcnHJPc
         9vZvEU2kVlm8Yt/m9jAtCDmpEC3QwcOGNBvVYuf+CutGVXyHqoZGwtWQ5eTRgfuqHYXI
         6MhmGsTC/ROQ17V/nCor5DsgTp6dPCBZkz8Pk4aC6t/AiSR1rN0RYh298zVVoG8VNjq0
         BuEmzJwTb1v1PaiaMYy5sXeIWcw9spUecCL51Of9LKMzRkVoYCaJJQyMOf1U8xEzJsI1
         SLdv+Y7kttxWjKEMlmVgdLLaW+jiGzmpyJQCwlXRnt7SuOrPNLFRfcUNtEbMo5tAmo5m
         j37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=25pOue6onoYQAGYnF02spvqInhU0HxMXPXhjOM+erd8=;
        fh=lzjBrAuCny0+7NZCIyQsDXXoKpAYld5k7zeaEGBOn5g=;
        b=dNohCpjivxbkN7zXFTZDQTjdR5CbcgQfSS6aQgnyc0XDin+hG+I4BUIfsOYrp2B39g
         dYUqJyHUlOKCXHJL5+st9pJSdGzh2nsK69QdcHfOxnOnmTeyYWCrdwSDrLqpdc5YqY8F
         EB2Y61gaOuxDpyDCDdLHZhutXDq0SYLsNgCzFktrPbE7SXIcjfD8FDZDmxt0EhKJXui0
         NJnAsO7EzumFgQuZwCzVtpVlb2CHp/E+GAgwT5cDv3W+f/f67sNxMtfr1iul+PyezPuY
         m/fZRMqTfpN3DwhCdj5UX3lm/UI3xtk/wZEzcFY0tlRpsPGQp34pz4QY+Pfbl0TitvvZ
         v4PQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WbEl2kdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d25a60ff7fsi735026985a.343.2025.06.09.00.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jun 2025 00:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WbEl2kdQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOX2O-0008Q8-RB; Mon, 09 Jun 2025 03:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOX1s-0008E3-FF
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 03:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1uOX1p-0005kj-Br
 for qemu-arm@nongnu.org; Mon, 09 Jun 2025 03:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749454484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25pOue6onoYQAGYnF02spvqInhU0HxMXPXhjOM+erd8=;
 b=WbEl2kdQV5KWNzuN9ZbEgu+RNpyfeAGmSJ2QcMj9/zZBiroVTXw43pnleysyGSEmpN64DU
 xx60s8iNOqlQC0HMOeXuYZIDDGL/IAK1OgA7y86Q2kohJA1fyy+QmX2k4mQK2yR7wlSdXQ
 krggYvj25L4zQ+19C5ueyGw0ZHtKGiU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-XLH8ZhbbNua161eSU_mNfg-1; Mon,
 09 Jun 2025 03:34:41 -0400
X-MC-Unique: XLH8ZhbbNua161eSU_mNfg-1
X-Mimecast-MFC-AGG-ID: XLH8ZhbbNua161eSU_mNfg_1749454480
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED6641809C83; Mon,  9 Jun 2025 07:34:39 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CC7011956087; Mon,  9 Jun 2025 07:34:38 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-arm@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eauger@redhat.com>,
 Shaoqin Huang <shahuang@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] hw/arm: Add the romfile compatatibility
Date: Mon,  9 Jun 2025 03:34:08 -0400
Message-Id: <20250609073408.2083831-3-shahuang@redhat.com>
In-Reply-To: <20250609073408.2083831-1-shahuang@redhat.com>
References: <20250609073408.2083831-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: daqMdV6GPk9p

On arm64, it doesn't use the vgabios-ramfb.bin, so set the property
"use-legacy-x86-rom" to false, thus the ramfb won't load the
vgabios-ramfb.bin.

This can mitigate the problem that on release version the qemu can't
find the vgabios-ramfb.bin if it use the ramfb.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a96452f17a..5f94f7a2ca 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -38,6 +38,7 @@
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
 #include "hw/block/flash.h"
+#include "hw/vfio/pci.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
@@ -90,6 +91,8 @@
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
+    { TYPE_RAMFB_DEVICE, "use-legacy-x86-rom", "false" },
+    { TYPE_VFIO_PCI, "use-legacy-x86-rom", "false" },
 };
 static const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
 
-- 
2.40.1

