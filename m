Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3041325lfk;
        Wed, 20 Apr 2022 04:06:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOdtUw7BV+aWZ01oKs1rf0K+vEgNnwLSvWLJzUQw+0P7kw89x4QHrikIuBr8iu14r2H/eJ
X-Received: by 2002:a05:6214:20e6:b0:446:779e:6a16 with SMTP id 6-20020a05621420e600b00446779e6a16mr5082438qvk.81.1650452764903;
        Wed, 20 Apr 2022 04:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650452764; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl1fRFKhsGpeoG/Rx5nHV9ohYrwjzcsLD16VS+zDZJxe3PEDtukHV6cvk2Ap5zJ/bd
         SYIlqhAlmjU7P9QysTY9WcNr4OJH4Ar6oEdeQ9C5eBl7aF7YJ9Z/udiAjorkMNoJfdZx
         2eAC52Tq5TrAynS3lC6LlH4lL7zVxWmggHW+L+wbUkvp0yADnY9mQUEVVYrvDUoG+5ks
         RTaEjDMOKt4DHdFsvxCxb+9P9UaZO5aoX2N0lNuaWAlghio7PxVIJikt24dYcbk4AWyn
         pIlCjcCPKOoOdLQTnFtWpJz3v7j/wj3PqQbc3UOg6UgsEFu91fgEz6/CKQVnl6KOenMf
         E4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qfJEE3/IG/WPlZJ9pG2XcS77Ozmlz/hB9OcChPelWtg=;
        b=wuEcLFleilqp2l9eYtoHpaMZWgimP1oRe/hOIw9l33pjtr2/TU4kxFTjDgxVV7d0hH
         mzUMt7bTcabBgcSue/5dNzhCCYI1MoKs0M2zVkqM3yKra+cqOn+3Nc/qt9AdTcXcxm0q
         0qrqY1juulKuMx/2FHl2k3FXrtj1rI6jJuYlBk2kTukEsgKXDwodJsmlaB8BTXK9P41S
         N9qvNKzPaGg24WkCMG0V6w/BpYWt4+Qbz10I1E8KfKOvZJUHsWjLW2/q8TqwLM7D0jcv
         WdQZ8H98e4hFxpVlUBy6CtHPnJz106YjqstsZkYmXCGdyBvcF1tCuhFGUtTLHrWhz7W4
         xSpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aLTDhJes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac85805000000b002f200620d8fsi454843qtg.207.2022.04.20.04.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 04:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aLTDhJes;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh89s-0003tO-Av
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 07:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wg-0005YV-Ae
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wb-0001Lq-KN
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfJEE3/IG/WPlZJ9pG2XcS77Ozmlz/hB9OcChPelWtg=;
 b=aLTDhJesNUDct9xJ+nsPh6CJba+GL+hVKen+ZC6d2iw16cH9SEOpP96A2CoakL6+LWzG/t
 1sfBsOk1HOSl799Jx8mJ90iKkMVXaSvVGrLyKQX8Ccn3Q6LJ101c4yM1pxn0/j4aFhdXaD
 Dx7B3vpDDdepR7SzvLPIjXjNruPMrJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-X91ww2HNNbm-H-edAX1goQ-1; Wed, 20 Apr 2022 06:52:17 -0400
X-MC-Unique: X91ww2HNNbm-H-edAX1goQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24E0286B8A3;
 Wed, 20 Apr 2022 10:52:17 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74AA940D1B9B;
 Wed, 20 Apr 2022 10:52:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v7 3/4] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Wed, 20 Apr 2022 18:49:08 +0800
Message-Id: <20220420104909.233058-4-gshan@redhat.com>
In-Reply-To: <20220420104909.233058-1-gshan@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Amh1XRYAmgXm

When CPU-to-NUMA association isn't explicitly provided by users,
the default one is given by mc->get_default_cpu_node_id(). However,
the CPU topology isn't fully considered in the default association
and this causes CPU topology broken warnings on booting Linux guest.

For example, the following warning messages are observed when the
Linux guest is booted with the following command lines.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host                                               \
  -smp 6,sockets=2,cores=3,threads=1                      \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=128M            \
  -object memory-backend-ram,id=mem1,size=128M            \
  -object memory-backend-ram,id=mem2,size=128M            \
  -object memory-backend-ram,id=mem3,size=128M            \
  -object memory-backend-ram,id=mem4,size=128M            \
  -object memory-backend-ram,id=mem4,size=384M            \
  -numa node,nodeid=0,memdev=mem0                         \
  -numa node,nodeid=1,memdev=mem1                         \
  -numa node,nodeid=2,memdev=mem2                         \
  -numa node,nodeid=3,memdev=mem3                         \
  -numa node,nodeid=4,memdev=mem4                         \
  -numa node,nodeid=5,memdev=mem5
         :
  alternatives: patching kernel code
  BUG: arch topology borken
  the CLS domain not a subset of the MC domain
  <the above error log repeats>
  BUG: arch topology borken
  the DIE domain not a subset of the NODE domain

With current implementation of mc->get_default_cpu_node_id(),
CPU#0 to CPU#5 are associated with NODE#0 to NODE#5 separately.
That's incorrect because CPU#0/1/2 should be associated with same
NUMA node because they're seated in same socket.

This fixes the issue by considering the socket ID when the default
CPU-to-NUMA association is provided in virt_possible_cpu_arch_ids().
With this applied, no more CPU topology broken warnings are seen
from the Linux guest. The 6 CPUs are associated with NODE#0/1, but
there are no CPUs associated with NODE#2/3/4/5.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5443ecae92..c3477a8a17 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2497,7 +2497,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
 static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx % ms->numa_state->num_nodes;
+    int64_t socket_id = ms->possible_cpus->cpus[idx].props.socket_id;
+
+    return socket_id % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
-- 
2.23.0

