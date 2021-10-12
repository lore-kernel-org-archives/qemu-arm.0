Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1484924lfc;
        Mon, 11 Oct 2021 23:37:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKdOekSeaL0Wi7Zr7iFGoszq6SIk+R6TQhpf7zkIwEScxngKpva9zCL8QWS6e9z8+M8Wsq
X-Received: by 2002:a67:c088:: with SMTP id x8mr28095902vsi.45.1634020628536;
        Mon, 11 Oct 2021 23:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634020628; cv=none;
        d=google.com; s=arc-20160816;
        b=quvRDSFaSD0rgzLniBJhs8+JrBY9uqgMA+Bg8PCJmdag4UHRT3rRby0oY6JzZXecKN
         QnTuM54j8bj+EKXuDJV+JvghohVyjWYQv6XpWcUoJcIB1Ll1KOWXsXNkF4LkxB4k4d48
         OGrcSnPrSl3nyP4ijOjxqwyD5qa+lJQV4iGUwpYbBDfgeNHxaablR0sfokHoyvr9yv5p
         0ENKsrbXnoTSxcX1FVVNz58MLXddKzENGjWjp8C0R7UHsiQU+iexX68S0uMLuDGZtV1j
         trK/u3IwmiBBan/EQNVcqFJa3Zk1ri73tpRe4iDs1t7vjK2C9FurMgS9uYLZhJ4KDn7V
         iAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aD8nzljPsEKJ570RR+jldn/7/HXpuLhVnorn+6ome1Q=;
        b=hZhTw47twp8OXPBWdUF/2UHdjjW7SlVOWNuAoON0av1/BjnZy3HZertkU+EN9yF1dR
         GPvr1dN02gGjgtNku3COoRyxNGr97shqRiN0hFuHRtgv0En/PEXTrPXjYwUKc3RMbri8
         rPBfXx9V3ro2iQWDalMbCvS6vzV4J3omGIV8F5N4YYDU6lDN5d06sX0JVqlMolJSJrMN
         V8cD3g+Mi5/oft0n++DSlNo9izW9Hd0j+SdMHXv/9ly5YUjTG3W+v29H93/roKcwGG+x
         K5d9fMeeeOhpVgHBny6IOuGJaV9GMFDeVBXoZ/54zW9mMLRP2ehp0qRhW5L/szBGj4Ta
         vUnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZhlKl6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si2905219uax.130.2021.10.11.23.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 23:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZhlKl6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maBPP-00042i-O6
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 02:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maBOp-0003Ss-CF
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maBOn-0007dz-C6
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 02:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634020588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aD8nzljPsEKJ570RR+jldn/7/HXpuLhVnorn+6ome1Q=;
 b=aZhlKl6WTSaX3gF9/e1LFX9L0JKOCAWStObj635qyr+5Tgk06K9BrHKYOoKoOD9dCqYnxb
 XVju8dWDOWEKvuXp9T8CBDHHVSe7zF6+FTUGWEbaqR8Kf5t2sldSaFx1pJJdxKwzBJONq3
 UEWPUhu7phrSwX90P7XK42rFItxT2y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-yrLFVuLzP76FmpPU8aJX-g-1; Tue, 12 Oct 2021 02:36:26 -0400
X-MC-Unique: yrLFVuLzP76FmpPU8aJX-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5DF91109;
 Tue, 12 Oct 2021 06:36:25 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9115019C79;
 Tue, 12 Oct 2021 06:36:21 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Date: Tue, 12 Oct 2021 14:36:03 +0800
Message-Id: <20211012063603.166255-3-gshan@redhat.com>
In-Reply-To: <20211012063603.166255-1-gshan@redhat.com>
References: <20211012063603.166255-1-gshan@redhat.com>
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-devel@nongnu.org, shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQPe9oXjXgOh

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

