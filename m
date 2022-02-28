Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1591305lfq;
        Sun, 27 Feb 2022 23:53:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNwQDy0i5ZXyhCXrejfuYwXtsdld5HZo1dKtwkrm2NboVciCmktbttqoTtVu2pl8b0zn/Z
X-Received: by 2002:a05:620a:2451:b0:648:c4ac:38a1 with SMTP id h17-20020a05620a245100b00648c4ac38a1mr10527548qkn.438.1646034813036;
        Sun, 27 Feb 2022 23:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646034813; cv=none;
        d=google.com; s=arc-20160816;
        b=gJyIYxbpsFeS1tx6+STNRd8X2pb9+Rp6F1UOYerQ/E7YsAxvM451keNhHa0Ju7Fi5o
         2JYmwR/EoQiGdntQgejGVpwKHt2R43bZlQFQVeG04jxcw80yn2L/8rBS3VIPcYissvUa
         mEsG+edpxttmDJTCNA4FexO/dXX/K0GClcUR9HdcKPJiY4x/IYuOq21Zwj3RUz9FCMKK
         61QYMQjK1KcVgmewtU1HhRSo9Lt8vmO63FYLjSpQCrdKV6pxrlBkypo8R78MP9s5Lz3V
         wDq2I1a1hSq5v9Itz+kWhi+cbLST84sjOXF2NVYzD7zCefKWLcQViyC2av8x2qb9/7vN
         MONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zYwy8zPApfYrKbU+hcK+Nz81iYaFLebamsKqnJetuHQ=;
        b=jWeuAk5m02FaMpA6gxBFFkWxwiL2ObE/Zq7/xCQCIFyHs+bhjZnXOpZCu5zEW1iKmY
         ItOQViTTX8FkUz4gWSqGNE59WBp1A+bAv0edVd44fNL7+hnoSBlJSpGS5I5ESs5bXcM6
         Z6bokSHCsksv+RaX3BW7RJUdig12D/I3lEkNklIiHXQFzK/dmMyN5V0egm7RopEozFGH
         mB3TJUxkJFl3HzZhIVFe3OV0rG8tigWWKmfQvfVnRAW6u1JhAd/tZ2NlzxwWXPe1QxT3
         +bVI/B/0M9lrpRNyjTYde0WL69PJwg7nYOAmZrewtkfz+bsqpiO+8d/tNB/PB8EFs0XJ
         9zsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXYGojHz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a0ca9c5000000b0042c53997739si3745497qvb.169.2022.02.27.23.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Feb 2022 23:53:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GXYGojHz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOaqa-00029e-7W
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 02:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOaqA-00027f-6U
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nOaq8-0003Ya-L8
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646034784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zYwy8zPApfYrKbU+hcK+Nz81iYaFLebamsKqnJetuHQ=;
 b=GXYGojHztZXP3ulrF4LhRz1HAaMcrDSSzVSp0z9nxB+bmcp97ld3mFJXc5T6cGLnyzQuxm
 e5yElJha7IovanFhlPfFI5OvFPXiBWo1W4HlM5rdfCZbnGX2Tux0nTEvOB/qkXCUT5Ux3V
 Fmjr6SP/H/gQIQ8BnSxZGf5CufmOAgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-4W8u4LgBNAyY1dDFiu0Hig-1; Mon, 28 Feb 2022 02:53:00 -0500
X-MC-Unique: 4W8u4LgBNAyY1dDFiu0Hig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74AC7800422;
 Mon, 28 Feb 2022 07:52:59 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-227.pek2.redhat.com [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DFF06E6EF;
 Mon, 28 Feb 2022 07:52:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Date: Mon, 28 Feb 2022 15:52:03 +0800
Message-Id: <20220228075203.60064-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CxZaAFnO4K7+

When the memory size on the first NUMA node is less than 128MB, the
guest hangs inside EDK2 as the following logs show.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64         \
  -accel kvm -machine virt,gic-version=host                       \
  -cpu host -smp 8,sockets=2,cores=2,threads=2                    \
  -m 1024M,slots=16,maxmem=64G                                    \
  -object memory-backend-ram,id=mem0,size=127M                    \
  -object memory-backend-ram,id=mem1,size=897M                    \
  -numa node,nodeid=0,memdev=mem0                                 \
  -numa node,nodeid=1,memdev=mem1                                 \
  -L /home/gavin/sandbox/qemu.main/build/pc-bios                  \
   :
  QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x47F00000 - 0x7FFFFFFF
  QemuVirtMemInfoPeiLibConstructor: System RAM @ 0x40000000 - 0x47EFFFFF
  ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000

This adds MachineClass::validate_numa_nodes() to validate the memory
size on the first NUMA node. The guest is stopped from booting and
the reason is given for this specific case.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c       | 9 +++++++++
 hw/core/numa.c      | 5 +++++
 include/hw/boards.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..234e7fca28 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2491,6 +2491,14 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
     return idx % ms->numa_state->num_nodes;
 }
 
+static void virt_validate_numa_nodes(MachineState *ms)
+{
+    if (ms->numa_state->nodes[0].node_mem < 128 * MiB) {
+        error_report("The first NUMA node should have at least 128MB memory");
+        exit(1);
+    }
+}
+
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
@@ -2836,6 +2844,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+    mc->validate_numa_nodes = virt_validate_numa_nodes;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 1aa05dcf42..543a2eaf11 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -724,6 +724,11 @@ void numa_complete_configuration(MachineState *ms)
             /* Validation succeeded, now fill in any missing distances. */
             complete_init_numa_distance(ms);
         }
+
+        /* Validate NUMA nodes for the individual machine */
+        if (mc->validate_numa_nodes) {
+            mc->validate_numa_nodes(ms);
+        }
     }
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index c92ac8815c..9709a35eeb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -282,6 +282,7 @@ struct MachineClass {
                                                          unsigned cpu_index);
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
+    void (*validate_numa_nodes)(MachineState *ms);
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
 };
 
-- 
2.23.0

