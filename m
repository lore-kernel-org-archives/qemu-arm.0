Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp243421lfg;
        Thu, 25 Feb 2021 03:01:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5Zul2k5Wz/BxL39g2gQsaEIhAT9BzpQutA58h+tbcjyjlmbXAdV8cfBhi+44P5gkWzcaK
X-Received: by 2002:ab0:46ca:: with SMTP id t10mr1329640uab.32.1614250911855;
        Thu, 25 Feb 2021 03:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614250911; cv=none;
        d=google.com; s=arc-20160816;
        b=aGmSjm+8byG1W8FmASgSIAGNn1AecndrB9N4T0eT2dN7OF7vbN0M9nZrcyiUzRj4aL
         h0vE5YwO1bKeBSWsoEa5ZIocT7eyMAayVCzxsmH3Rsj+Gn4TnODf0X17oqQWOtcXDasR
         P10+EMCdDpwTT075d72fcWfD8+OK7KjugxgVdp6rAWQaB/udb1M1uwHfr2T2EOf+2Nlf
         uY1huCeLX7GVaoh/ahb1Cq4cQPh0NtfiVhduXKg4jEBf07yeCjqaNOmuvRXfUSZxcBJS
         YeqC41cJ6W7/bjO2L9KlMdXmgpx1GRKbpTGYokX+EsaGwk/FPaub5Pm3+YqMmkxPbGlo
         +vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lDfcZKnNIMMVmLaKskxqgZgjZw3XIWdgk6DBKgfXBPg=;
        b=uJc6RjQN9Gm9poWoXYHDXZpF469ZwcvrwiMtKXsqgeLCbRf2xK1GNEOtt3BX9VYXOL
         buZv8PG1z3eWcKwtBkS4hgAoAGX2W+XnSnuLt3wdAofaPLVuajQni6r5vEyC4cuZF4WI
         8jInnjNJKVJML7qIAWp9qKcMlcR1wauflSsML3p7BKn6ohnLdaaVw4aS+Zn5U/kSjAG0
         LLnfaWWab4FayKoGX+YXWvNT8fa5C+o50t9Jjq8lzE9Ag7twuc12u7fZZ488T4oQMkjU
         6eexTixHYabH1UWTKgw4dsJCVkk5ajhR+COy4+CSO2uSU6R0W9s5Br2NQAnUNiNGUvq+
         E00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VHvTTXF4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si790479uan.142.2021.02.25.03.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VHvTTXF4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEP1-0000C2-3L
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEGi-0005et-Cf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEGf-0004sU-7Z
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDfcZKnNIMMVmLaKskxqgZgjZw3XIWdgk6DBKgfXBPg=;
 b=VHvTTXF4iI0oCCxsXngG1GkOQiLj0biptzIUhBdeXZ8crMcm2J2GGh9qBZFE6kZrhWBewI
 7upqTYr9Aj34kyL8j1njuL24QeJuR5/rf5bfU7GiYOul7pFF/SdRDSdd7AZKZ6NQuOtpfF
 UnUA3ctmtvi/dFFljVcYEiBHm5CtZQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-RByCjvCFNWGc8sGXE9vkfQ-1; Thu, 25 Feb 2021 05:53:05 -0500
X-MC-Unique: RByCjvCFNWGc8sGXE9vkfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9363D801979;
 Thu, 25 Feb 2021 10:53:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEE7D5D9D7;
 Thu, 25 Feb 2021 10:52:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 01/28] hw/vfio/common: trace vfio_connect_container operations
Date: Thu, 25 Feb 2021 11:52:06 +0100
Message-Id: <20210225105233.650545-2-eric.auger@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HpDLU/jkltkQ

We currently trace vfio_disconnect_container() but we do not trace
the container <-> group creation, which can be useful to understand
the VFIO topology.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 3 +++
 hw/vfio/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a50b10c801..fcf2c5049f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1709,6 +1709,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_FOREACH(container, &space->containers, next) {
         if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
             group->container = container;
+            trace_vfio_connect_existing_container(group->groupid,
+                                                  container->fd);
             QLIST_INSERT_HEAD(&container->group_list, group, container_next);
             vfio_kvm_device_add_group(group);
             return 0;
@@ -1742,6 +1744,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     if (ret) {
         goto free_container_exit;
     }
+    trace_vfio_connect_new_container(group->groupid, container->fd);
 
     switch (container->iommu_type) {
     case VFIO_TYPE1v2_IOMMU:
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index c0e75f24b7..c17ad82aa4 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,6 +104,8 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_disconnect_container(int fd) "close container->fd=%d"
+vfio_connect_existing_container(int groupid, int container_fd) "group=%d existing container fd=%d"
+vfio_connect_new_container(int groupid, int container_fd) "group=%d new container fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
 vfio_put_base_device(int fd) "close vdev->fd=%d"
-- 
2.26.2

