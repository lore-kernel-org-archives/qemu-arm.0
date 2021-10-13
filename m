Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2540854lfc;
        Tue, 12 Oct 2021 21:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywbDBTRg3hNwmLDeCRSl4PEksYywU4CW5rovdrKp3Rbbs+WzkixnwUv5WInouG9LKk3i9k
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr31447200ybh.527.1634101134369;
        Tue, 12 Oct 2021 21:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634101134; cv=none;
        d=google.com; s=arc-20160816;
        b=zeefeboW9ilt8B9MwxFfRRQ+YyyY7ILlqGEbe+a6EZvezf0GnYsw+uwJE4gYEGZrL2
         pc8ZPRfF9KEHaNDVKr5aaUNGKVu7VPLNfLHuBRwDNWHkZbXx0phTS+hgw1nrCsDWkqnl
         CaRP6iexf10k+WP5uPK5h5S76zlqGq3QHk0DfjT6eUwNpCUj6VCWfrGPxWpNPGufa6Vj
         TOWuJfxYcnFMALV11fo0dEIR9VEsixUTytjxfc5KcDcDwn68CUAEjRAw9EeQAq2+zphz
         7638YDHGQUP48jAduM4wUtrW6GXa0dtFSNnqvAlxwz9VpCjwFN1BhKWBM5xjw404nbjp
         GnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aD8nzljPsEKJ570RR+jldn/7/HXpuLhVnorn+6ome1Q=;
        b=LiNlEpmr4lhLsdp3C5w+0QYSAi+ptPBFALrTGTW38BMZNjDvLeVQfvZTC/k4ApFsHy
         My4j/NAo7zhH4SzmeBHxgb3sKN7QcxiDRZ4XrtDxqjjXDGqjB04lTcqcmBKhAqjPg/X3
         7s1G3RnW9uPVt6S1aoOo5wl1K8tBtKIXIH/VyIuVvroxuik5rxyWxyVcMYQY3o6T3tSJ
         QPbDkXeC+0CKrGp7ZcSqv/6/zwKXE4cGKjv8dE5ZaDn+rx6afVK+IrUoTq5ABUfe8zMt
         dwrhzL6sZ40WEl27M97aaep/7N2tmR+n/DULxybbOwgvE3aKCuVnVxJKOFg50hydQHda
         Qn/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RUhimNnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o73si971019ybg.208.2021.10.12.21.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 21:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RUhimNnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maWLt-0002uY-Lb
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 00:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLZ-0002Up-Rb
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 00:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maWLX-0004m7-LP
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 00:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634101110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD8nzljPsEKJ570RR+jldn/7/HXpuLhVnorn+6ome1Q=;
 b=RUhimNnHRRGx27IravF/QFtdVAtulGM7lxub1+6lKt35IzJQFoO4PwXTwNT+5h0uI/J7Xe
 rGuvdkgwAfBNPXCfFAebS0fRGhwvksZpbohJasOr57nK0K5VIYKF1or5ctkxNLViZ3AMwq
 8TvCdr4k3MqmYSIFncILV5Hj+BIauA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-EBzFnG8fOomtjiAmD_6dKg-1; Wed, 13 Oct 2021 00:58:27 -0400
X-MC-Unique: EBzFnG8fOomtjiAmD_6dKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6058680363B;
 Wed, 13 Oct 2021 04:58:26 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B132E5D9C6;
 Wed, 13 Oct 2021 04:58:23 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 2/2] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Date: Wed, 13 Oct 2021 12:58:05 +0800
Message-Id: <20211013045805.192165-3-gshan@redhat.com>
In-Reply-To: <20211013045805.192165-1-gshan@redhat.com>
References: <20211013045805.192165-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: robh@kernel.org, drjones@redhat.com, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bYPPl3SCB9ym

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
Reviewed-by: Andrew Jones <drjones@redhat.com>
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

