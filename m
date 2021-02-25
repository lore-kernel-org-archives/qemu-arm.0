Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp258850lfg;
        Thu, 25 Feb 2021 03:22:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1+YhnJKVzcEp+ZSgdfGd8XBm2mAWXZ/foYDHDy7IFFO3jUmFOBb19k4hwGjRdUmcLB2Ce
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr2251223iop.73.1614252166631;
        Thu, 25 Feb 2021 03:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614252166; cv=none;
        d=google.com; s=arc-20160816;
        b=ys7+SFHWXDvdpHtYbUA/NN5v0aUATLhuBDMevlM4KL7Auv00gJ9dmDBajMbl6X232q
         89Sgax9kHFqsZXPB7yofPLO0iGkZdFfu/GlBWn4UD0TXWm57yechjFhoJQ3N831qmqDY
         TZSG3PF7nJdgy1SoNQkEs7N30I1XjHhhMtDmSZY/KsiZLd7LcSswH/5NcqlegVh9GUNe
         bAAa2NLu90ESnZd/qSYIEzLkZTEjXWwC0Wwl6ne0uWkjUUBHlhEbJG4ug+XNpneu4elB
         Y4j1tT8sUKEUr/lyYIba9eQd+xQVx1rl2gMfC/198Y16gyRHrSxcKV5TLkNlOA5ASwok
         /nLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mWpvnpNWqbf4fsxYCvkc5JQlRB/986NNUaqzHGD3Ask=;
        b=FufjhZlAgRMirTTfAhRr/QglZPWf5KjBCSc1gge0SFdHGfxcgGUnpmK3uoRYQEHb2S
         91UMBy37wuShlQmVY/ssjCfVG5O+FspnIZ1ZqhTDe9TIQ4QVUobZfAVd4oArdWOqcctY
         XwNrNKss1G74gWS/ftSY26t7U/1MHV/vN3iAtsgoMxcQNnTktFBCxz/uRuoLNHwX9xCK
         k2yzBKbx81Rsfx/AvFTVHqSxiTo79MXPdis9HBqyXrvsEToC5yARDenrsEK5shJDf4m9
         1v75AipVWSLW2vyzoMN1FM9Hdjg0hGUiiSpN+Um1DyI4PLvnhLnG5dKVReUv8PW7ZnXw
         sKwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qo9UupvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si4705240ilu.88.2021.02.25.03.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Qo9UupvK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEjG-0006Wz-02
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELS-0004YI-UZ
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFELR-0006yB-EI
 for qemu-arm@nongnu.org; Thu, 25 Feb 2021 05:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWpvnpNWqbf4fsxYCvkc5JQlRB/986NNUaqzHGD3Ask=;
 b=Qo9UupvKmXEGcMPzmVF+Re2/Hjzr9ldLaemIgM4ty89bjsNTlRuJ4cc8/ciGpRIBHebHBK
 38hmltL4YuE0qkuaAtZHTRBwBhUJzbnW3jcBofsIZyb0OMwYbTpoFebyiG1B27eg1/581s
 0QT0e9kqsIn/shmnKWPF8Niuglh9eZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-NYov6jGMPgKF2Wf3bJsgng-1; Thu, 25 Feb 2021 05:58:04 -0500
X-MC-Unique: NYov6jGMPgKF2Wf3bJsgng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 787F618B6141;
 Thu, 25 Feb 2021 10:58:02 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45785D9D7;
 Thu, 25 Feb 2021 10:57:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 26/28] hw/arm/smmuv3: Allow MAP notifiers
Date: Thu, 25 Feb 2021 11:52:31 +0100
Message-Id: <20210225105233.650545-27-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aQrDyutVezhf

We now have all bricks to support nested paging. This
uses MAP notifiers to map the MSIs. So let's allow MAP
notifiers to be registered.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a61c1129d9..77d5fc2ec5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1618,14 +1618,6 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
         return -EINVAL;
     }
 
-    if (new & IOMMU_NOTIFIER_MAP) {
-        error_setg(errp,
-                   "device %02x.%02x.%x requires iommu MAP notifier which is "
-                   "not currently supported", pci_bus_num(sdev->bus),
-                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
-        return -EINVAL;
-    }
-
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         QLIST_INSERT_HEAD(&s->devices_with_notifiers, sdev, next);
-- 
2.26.2

