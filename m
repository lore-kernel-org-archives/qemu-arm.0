Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp56280lfc;
        Fri, 15 Oct 2021 05:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkc7H8TkpmuaMAEm4Y5Tf7lAMheA8cojxGp3E6iMQNIXdqufsw0bYqNbfYlnGcF1ZYPMsh
X-Received: by 2002:a05:6638:258e:: with SMTP id s14mr8250295jat.54.1634301850324;
        Fri, 15 Oct 2021 05:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634301850; cv=none;
        d=google.com; s=arc-20160816;
        b=L8Z2G+xm3lpODocBKuOTTofcPmzrbUqGSeimY6n0XOHO1xL4eZNY29zjeDhNjwZA5l
         aOVeNwY5J+ipFAdtY+NHBg2uk9PeeJdx9jIW0VU28b+yTBbk8Y+iQX6T2yzTpl+31A6M
         i9Fk9omUgLWp3C+rkPt+CjKf5LerZ2IbW6GAyoWNEKzbCA2podTkr/yDfCBe9bKCfVTG
         3BByk9549bKMDjQ2CytlicWeXx+hdee1M50FstINciLXm0QqQqr4Wfw5jWvBk8dy5FEg
         1Tp2Ohc4hf1p1X2YGugMBRPbwOPBJ1D8FBDfingKozpdQcaAmUo7RM7tjBRUeWyNYa1v
         siXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Y3CQLFRSmnzmNpDgdTSL8MqMr3tL+HLcQJ58HgW7YXA=;
        b=bm1XMS1Fj8mFPyyK3U/roioRUtaJ4O5nbqUuAsePe8SlGt5bx3+urtI6ufhw0hj8Y6
         YRqcJ+iSQBYgPF3ZkZ/hOsU7QWZOSN1pZDxiPec4yXGR2Pj3MMmX59fCedfzTTo9S6kR
         VHuQeQ9tSGamFrYOITquYKNAaMoLi0F57duSkPpihlT48VRQ+Z5arnUDtrNX3kmOd90/
         UzJgBRZBiatO2dQJaFTLDUHy4YntX/zmMYmi/ITw9zzAIC58zZ/lo9cCNzhUw9hkVmfb
         NbsCFAvS1n9uY/W3nGYcnk1NJpUiAVWrjX96MY9TzynP1+WEuiEMEDkTiV8X1bIXl30o
         vbXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo96yPIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si6727587ile.175.2021.10.15.05.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 05:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Oo96yPIC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbMZE-0004Jv-Gv
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 08:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbMYg-0004J9-7H
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 08:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbMYe-0007NK-36
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 08:43:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634301810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y3CQLFRSmnzmNpDgdTSL8MqMr3tL+HLcQJ58HgW7YXA=;
 b=Oo96yPICKI5kqH/tNds20VfAreJ6ZfIMjkpgkDuPUHmXtD9QNM9gpIGqrA+jYDZfqfsOfn
 H2b44R21zETfKU+UiaEjhzZlybSNrQI44sVBXay6XNnlJN1+EQc1VCYd/ImaGoM4gzqDyt
 bQeR7cgdUwTac9s8zQA0If2n/AhLHso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-PKjm2rPxOsWDrCTjFhyR-A-1; Fri, 15 Oct 2021 08:43:27 -0400
X-MC-Unique: PKjm2rPxOsWDrCTjFhyR-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FEC10A8E00;
 Fri, 15 Oct 2021 12:43:26 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D297A196E5;
 Fri, 15 Oct 2021 12:42:50 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty NUMA
 node
Date: Fri, 15 Oct 2021 20:42:46 +0800
Message-Id: <20211015124246.23073-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: robh@kernel.org, drjones@redhat.com, qemu-riscv@nongnu.org,
 ehabkost@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mF3hMH10gyT/

The empty NUMA node, where no memory resides, are allowed. For
example, the following command line specifies two empty NUMA nodes.
With this, QEMU fails to boot because of the conflicting device-tree
node names, as the following error message indicates.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3
    :
  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS

As specified by linux device-tree binding document, the device-tree
nodes for these empty NUMA nodes shouldn't be generated. However,
the corresponding NUMA node IDs should be included in the distance
map. The memory hotplug through device-tree on ARM64 isn't existing
so far and it's not necessary to require the user to provide a distance
map. Furthermore, the default distance map Linux generates may even be
sufficient. So this simply skips populating the device-tree nodes for
these empty NUMA nodes to avoid the error, so that QEMU can be started
successfully.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v5: Improved commit log and comments as Drew suggested.
---
 hw/arm/boot.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee4..74ad397b1f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -599,10 +599,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
     g_strfreev(node_path);
 
+    /*
+     * We drop all the memory nodes which correspond to empty NUMA nodes
+     * from the device tree, because the Linux NUMA binding document
+     * states they should not be generated. Linux will get the NUMA node
+     * IDs of the empty NUMA nodes from the distance map if they are needed.
+     * This means QEMU users may be obliged to provide command lines which
+     * configure distance maps when the empty NUMA node IDs are needed and
+     * Linux's default distance map isn't sufficient.
+     */
     if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
         mem_base = binfo->loader_start;
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             mem_len = ms->numa_state->nodes[i].node_mem;
+            if (!mem_len) {
+                continue;
+            }
+
             rc = fdt_add_memory_node(fdt, acells, mem_base,
                                      scells, mem_len, i);
             if (rc < 0) {
-- 
2.23.0

