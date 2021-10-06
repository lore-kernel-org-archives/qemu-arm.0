Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp145643lfp;
        Wed, 6 Oct 2021 03:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhBwlG8L1zf8x+nSomTlgIYoQ/Xry+Q3JHvpw+6zvrVCPj3PBRdRz1g8tC26whUAeQiP+Q
X-Received: by 2002:ab0:4adc:: with SMTP id t28mr17105379uae.4.1633515820344;
        Wed, 06 Oct 2021 03:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633515820; cv=none;
        d=google.com; s=arc-20160816;
        b=h83zOmS6/kIAo+VYa+5rqo2MkZDB7eBIB+dT8+RuVxmD9QEBcVbRsaD5oJdYSTMA2q
         oxP2JlEX4h6T7xs0ovqNWYD0BOK345jcsc78B7KB74MIqoZt+HL4TY1MbI+z9c3V62+u
         W+7xYXHeEegZYdAl2iTbRHunhHUNKDiWDX/KY+VWPDS5i3gW+YvPZi2IVxGU4Cxtvr+4
         zAQaMEbSN+8Xx8zAMP5Cx9+OIOPa8NayA+zYmQJTSegXJ2C6V5QKcrkPUEmTfBVsFD0G
         2af++B4ryiwX97iSIPzqeoNaFN4oYrB5k4wK3VRf7+mtroM5AzlY16rttgM9g4K2YB75
         EbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uyF/aTol2TckZJBIPUFu2KazCq/337t0uYgke3QkrH4=;
        b=SRCDDEujxwpNiliY6AEZ3uXB9TFqzEz6BhqM/ZRugV7SGeAAVF806d7T30V1q8if+b
         8mZzFHzPt2GP5RPt+L8u5iEvsZbZzGGAoroZM/QHcYKrONKNcIxkITziExYaVV2Ro7gQ
         sdFMMSnncmZPBokhrKOZF3u/sMHgGHKh6kAFQEif/s/7uzNt4949S/+kGquK0KIU69WY
         Nzth4alHSfD3QQGm/qUfAGImYxK6c2Jql0g2vq6ozeto2Nlu1yf5RQF5PmYYean8lFMJ
         sPKRO61H0aZcdpn+q/K8e2WX5PakJZ7eXSCBw6rwFAl01S9qzmQYr8nditr/aYsOQ8GV
         L07A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IYjoDx0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si5478562uan.124.2021.10.06.03.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 03:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IYjoDx0V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY45K-0004gR-M4
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 06:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY44l-0004KA-TW
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mY44k-00044C-9m
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 06:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633515780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyF/aTol2TckZJBIPUFu2KazCq/337t0uYgke3QkrH4=;
 b=IYjoDx0VaACPcP8EcBS/I3ztq+kogZe8nPzLBo2fVFF9/BdjJmdJwHmquL0qBz9mQ392Tr
 8Ur7K5I0AP+WFI/3RpWUb9+0GHx8YrSQwE5wiLWvdVvf4PU5Q501KiLVA9sRFRHD+g7SzN
 Fugw7YWmnjFh54KgFMvGCSOF7937UL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-Dp3I9n_BPAalL2QdPEEq5w-1; Wed, 06 Oct 2021 06:22:59 -0400
X-MC-Unique: Dp3I9n_BPAalL2QdPEEq5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 477EF19057A0;
 Wed,  6 Oct 2021 10:22:58 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739CF5F4EC;
 Wed,  6 Oct 2021 10:22:55 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] hw/arm/virt: Don't create device-tree node for empty NUMA
 node
Date: Wed,  6 Oct 2021 18:22:09 +0800
Message-Id: <20211006102209.6989-3-gshan@redhat.com>
In-Reply-To: <20211006102209.6989-1-gshan@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-devel@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dqjylnbXNEPq

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
map device-tree node. This skips populating the device-tree nodes
for these empty NUMA nodes to avoid the error, so that QEMU can be
started successfully.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee4..4e5898fcdc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -603,6 +603,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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

