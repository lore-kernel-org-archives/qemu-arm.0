Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp5017536lfc;
        Fri, 15 Oct 2021 03:49:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbtiEqc2ikrioSiVC/jAY4yqtDxb1M6KKfKgZk2zvyaYh7zis1aDVsPThscMpU/O6acl5N
X-Received: by 2002:a05:6e02:178f:: with SMTP id y15mr3392061ilu.175.1634294988678;
        Fri, 15 Oct 2021 03:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634294988; cv=none;
        d=google.com; s=arc-20160816;
        b=BUPIsnfOIsA1bguerG9Xpd9eanxvSQQN7YcWRTCIK6gCOxbywekkhVDl0ciPkTuEZ6
         p7Ffvo9nMQsbLTkWe9BkbO9bJgM2CfkUSUcHt098rFZGk8urrey43GR5YDsIK1Yrvs3D
         Hmj5YNa3Wtbx+uuGX7Dy+03TG2cln0fcw4BsiT/9riFeE/+uBOcSXKLmY9I7Q74e4XpP
         +pIMO/Z0EONnBrYzObU89QHiISZUL2/T82pMQ6XhZNYfVvQEspLnbcFRuNjo1z4WmaFF
         6CwvETO5oiBPjallVxBTu3qtyWzY6o4VIui2pOsJGV7OKBm9Yf49utDt0QXLhwcRVVgr
         QS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=maTTtXdlSTQj8q1wAof5H5YOOBc3riqhlbyW4EBa6xM=;
        b=SRluRNPQ2aBGK6vmRJgxvMZxWUPTdQ5efleUW6lpUfSyF5viLxD9Tj/AnCVCM3E5TT
         dbjNzgqTL8jJGZ1Qe9Klc97WyTYymEdJjuy2N9xf4PDhRQPVphxs9hZ64SIkKNC+HiPp
         swTOGLHey5QmO/I28UpNqJPJScKpC4exRTDv103HaO6TWhzWhlvnZoNtjcXgslfyLJf2
         M5QieIppU7yDMT4Q596sSqUdGMCrThbuqzRUJKR0Q0HC+k7o0qU+kTq7erlTep3ftoSu
         WbrO73PhSoV++mI6yO1LTTdrMy+23MuplGSKwWZunma59Z0QqQDAUQSjh+KIdnoNscsI
         /cvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=enciNskY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si6806503ilu.53.2021.10.15.03.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 03:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=enciNskY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbKmZ-0007eb-V5
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKmH-0007eA-6W
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 06:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKmE-0000kd-8e
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 06:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634294963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=maTTtXdlSTQj8q1wAof5H5YOOBc3riqhlbyW4EBa6xM=;
 b=enciNskYnWpvNyEwpnuAYylE3msZmfmDPixErfC+CCaaXP71dzcqN9yT+Q/D2dwQUWKqZB
 Jh8xCD32vywC1w3m3Y6s79hXnp6c91rULPYmyUKOh6T+l+ioFNDP8htlBYG1i42rQ+aUTF
 c+5LFbkd6E+9qpDTvyN2RfF57zxegUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-aTJgCOKfPe6_JFON83Nllg-1; Fri, 15 Oct 2021 06:49:18 -0400
X-MC-Unique: aTJgCOKfPe6_JFON83Nllg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4547218D6A32;
 Fri, 15 Oct 2021 10:49:17 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD00410013D7;
 Fri, 15 Oct 2021 10:49:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4] hw/arm/virt: Don't create device-tree node for empty NUMA
 node
Date: Fri, 15 Oct 2021 18:49:09 +0800
Message-Id: <20211015104909.16722-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-TUID: SLeblj4WNsel

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
map. As the memory hotplug through device-tree on ARM64 isn't existing
so far, it's pointless to expose the empty NUMA nodes through device-tree.
So this simply skips populating the device-tree nodes for these empty
NUMA nodes to avoid the error, so that QEMU can be started successfully.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v4: Drop patch to enforce distance-map as memory hotplug through
    device-tree is never supported on ARM64. It's pointless to
    expose these empty NUMA nodes. Besides, comments added to
    explain the code changes included in this patch as Drew
    suggested.
---
 hw/arm/boot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 57efb61ee4..e05c1c149c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -599,10 +599,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     }
     g_strfreev(node_path);
 
+    /*
+     * According to Linux NUMA binding document, the device tree nodes
+     * for the empty NUMA nodes shouldn't be generated, but their NUMA
+     * node IDs should be included in the distance map instead. However,
+     * it's pointless to expose the empty NUMA nodes as memory hotplug
+     * through device tree is never supported. We simply skip generating
+     * their device tree nodes to avoid the unexpected device tree
+     * generating failure due to the duplicated names of these empty
+     * NUMA nodes.
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

