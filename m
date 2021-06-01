Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3279901lfm;
        Mon, 31 May 2021 22:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuO+QyWXKJFuUHN4WnWNEZoLoAAOByIYpsaeYOR1H6Ry8Gz9q490MZjK0ClX//3GqjRKh6
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr16370170vsg.21.1622525396780;
        Mon, 31 May 2021 22:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622525396; cv=none;
        d=google.com; s=arc-20160816;
        b=POlIJROs/hC4m4bhQdOEsK9jH8K7bcZYPdYkxYQIUzw6YjhWndLfJ8xFR1pq7BwZKA
         BOHTH3VVkyO6O9ru3qgAGaI/4CayF46LEYO8U9C8gLoxfleSPAO8RHYVFK18O7/rmxIS
         07O5NlN+BFwjjwjDnSLYx91CFUZJsknl2LaNLuMJG1+JXjLxM9Ztj8qTJcBp89Hw0bgG
         TrQrktGx3khHJPgDhzrHRfY1QpmcElreUo76q19p19fQ6+3xFSksIkQ58AAA5/8NCZTn
         SxwmG2AFLKddThlt4SsjtGMuzslHNgbUElWpHPWn0K0GJAMhmvMsROnPobrHoWMLaMw3
         JI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7/lGE3Q3O38oapozsEntEQplElt+NleYNusY1XC20t4=;
        b=qZ/50UyoSPy71d089RroZj8gYA8FkKpQ5r5VekA1hOglWl+2WeY0Px1hxZjpbOQwx3
         4dA/7FU8dexazEHwLU3NDN6KBB68i73LD5J644gzU7K2I+htFb32Le6H0vl6EhiLCddG
         Rbkqzr7SPUdkO1zOhX5OCr+8sp5902dyrFwKIWoCJutx00KgI4Qin12nXgUEurCHlO5E
         CvCTZ8QcnOakAb0Hle4t5v6VOSp0Li35s3Z5P/FdjhTEHBw7EdX+65NrDTvWeBSzzFx8
         Aubja8vqdU+qxldbEOLy138sNdQvu5FdeQcqvy91HoCdje7u6ZjIZWH46fI2Gg5c62Hl
         +Tvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GkIXcz0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si3210822uam.58.2021.05.31.22.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 May 2021 22:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GkIXcz0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lnwyS-00008c-5K
	for alex.bennee@linaro.org; Tue, 01 Jun 2021 01:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lnwy5-000079-Ih
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 01:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lnwy3-0005mJ-0X
 for qemu-arm@nongnu.org; Tue, 01 Jun 2021 01:29:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622525368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7/lGE3Q3O38oapozsEntEQplElt+NleYNusY1XC20t4=;
 b=GkIXcz0ZFj9TvX8KOAVZGCF49Ad99M+AyFsaxs+jaKMfTRJE1IlEs54I+5+7Xt6hVwPTRe
 K364CgK/7R4j636kKl+eTLxdd83STeoAAsyd9kUCPh9+6Dv0bLi/cXVDo2SQV59DeyizHY
 nq8hZfAUZgcnMQMWqCNKyNUVFn9qwsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-bvQK2ZyhPt298fUpMSSKnQ-1; Tue, 01 Jun 2021 01:29:26 -0400
X-MC-Unique: bvQK2ZyhPt298fUpMSSKnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A653107ACC7;
 Tue,  1 Jun 2021 05:29:25 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-23.bne.redhat.com [10.64.54.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A84D360CCE;
 Tue,  1 Jun 2021 05:29:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Date: Tue,  1 Jun 2021 15:30:04 +0800
Message-Id: <20210601073004.106490-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +X+qlCDnrYZ9

We possibly populate empty nodes where memory isn't included and might
be hot added at late time. The FDT memory nodes can't be created due
to conflicts on their names if multiple empty nodes are specified.
For example, the VM fails to start with the following error messages.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
  -accel kvm -machine virt,gic-version=host                        \
  -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
  -object memory-backend-ram,id=mem0,size=512M                     \
  -object memory-backend-ram,id=mem1,size=512M                     \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
  -numa node,nodeid=2                                              \
  -numa node,nodeid=3                                              \
    :
  -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes

  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
                       FDT_ERR_EXISTS

This fixes the issue by using NUMA node ID or zero in the memory node
name to avoid the conflicting memory node names. With this applied, the
VM can boot successfully with above command lines.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e..3169bdf595 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
     char *nodename;
     int ret;
 
-    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+    if (numa_node_id >= 0) {
+        nodename = g_strdup_printf("/memory@%d", numa_node_id);
+    } else {
+        nodename = g_strdup("/memory@0");
+    }
+
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
     ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
-- 
2.23.0

