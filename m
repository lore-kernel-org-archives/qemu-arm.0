Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3054817lfr;
        Sun, 11 Apr 2021 05:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsDMgKn3K30s3UbbcWLDGKYn7FUYP/PKAvtfpIOSC3/75/ul+0TikP+voi+F5IQu95uFdg
X-Received: by 2002:a0c:be92:: with SMTP id n18mr1652482qvi.31.1618143212736;
        Sun, 11 Apr 2021 05:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143212; cv=none;
        d=google.com; s=arc-20160816;
        b=tzqyvGuQms/nzAE/tE1orNE91CpJQ9A11CutQixWsOvAzatQdViJWbbY9hwzse50z4
         L4KLB8dS8El3LHLElMd3/aQzpKSBTBVvWn+5HvKaj56cmNMMCz0BkMowMJUQm3V2gIDS
         46coidMYC9/kF5op+ZoIZf7P3NZ4m4noRK6og4RgZHVuYuoHc7+uYVz1kNZmCRgcLGTN
         4R7NggUHBIuFLN9ugccKstDk6a3wGoF37cIUi6PLfVQysxZPGjJSo3JaWWnHoaNtoCgg
         hHW4f+iV3SHSW7NHpU1rcjMlfcwg2L/6tAKV02fa4fod6sw/18uaYSj3Ts5h2cC6RoiA
         M44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mLJe5TCOUz2BnNqe++ZYaoKvLMWgaoDMV8xcH1e8+ns=;
        b=BfDUnC1Z478RLfd4Ik/zvTrgoSXCx9rJvlSnBHXftmDBx2w6Uc6EqsvYoHzvPTGvkx
         d+HzpZefQIkf9HoQWNFy4IvCqQCVA3gHWgLhCiBJCpbNzDW9N4rRWX2UVs01EvpH2DM+
         nYX94WR/REd954gMs6e2K4eHA634Y3vL54GgOFnezZNwu0BNXaxm/P3GpybbcQ0rG1Un
         bnqEVId0bV0moi0Ajg9SMsLqnAEAxu5gLV9yX5CQ3ugaA6FRoMMuHWnKhoagZtkBQL0B
         Q8C5++RfuKgremSAP3jvjit82JXUBY4XHc0phlKw/EAilCKLhy7tc1z47PfLVoZOtyiF
         y/Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WcsdsCbk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si5714551qtw.279.2021.04.11.05.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WcsdsCbk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVYy4-0001fG-12
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYuU-0008Fd-Mq
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYuO-0002AJ-AU
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618142983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLJe5TCOUz2BnNqe++ZYaoKvLMWgaoDMV8xcH1e8+ns=;
 b=WcsdsCbkt7xulSZQfeC0C5clWp0B8yB/8at04fIDH2KUqpGHhnMYIdov4EMeMUxpdAIcfM
 ZhB2dXYD4SiH/lIGKamzKfp/WUjr8zVCJH4suZuoag+YqvOMj4zKw/XqeD/hjAhpqVfr9v
 tTBFYJdMeI1nqklHapOFpG/EUG0FFLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-i8hwmUBnP8Wg3sOIPUiwzg-1; Sun, 11 Apr 2021 08:09:40 -0400
X-MC-Unique: i8hwmUBnP8Wg3sOIPUiwzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B8A4802B40;
 Sun, 11 Apr 2021 12:09:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC89910023B2;
 Sun, 11 Apr 2021 12:09:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 01/29] hw/vfio/common: trace vfio_connect_container operations
Date: Sun, 11 Apr 2021 14:08:44 +0200
Message-Id: <20210411120912.15770-2-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeX0z79ptc+G

We currently trace vfio_disconnect_container() but we do not trace
the container <-> group creation, which can be useful to understand
the VFIO topology.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c     | 3 +++
 hw/vfio/trace-events | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..a456455517 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1742,6 +1742,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_FOREACH(container, &space->containers, next) {
         if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
             group->container = container;
+            trace_vfio_connect_existing_container(group->groupid,
+                                                  container->fd);
             QLIST_INSERT_HEAD(&container->group_list, group, container_next);
             vfio_kvm_device_add_group(group);
             return 0;
@@ -1775,6 +1777,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     if (ret) {
         goto free_container_exit;
     }
+    trace_vfio_connect_new_container(group->groupid, container->fd);
 
     switch (container->iommu_type) {
     case VFIO_TYPE1v2_IOMMU:
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 079f53acf2..2a41326c0f 100644
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
2.26.3

