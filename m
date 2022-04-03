Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2108233lfb;
        Sun, 3 Apr 2022 04:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypCPiZ1KgFBoZQIERKE96UYEPsPTC8lMqzvVHRALe6pU1eskCV9B9ncu5nlZDoDB719r8m
X-Received: by 2002:a05:620a:2886:b0:699:bab7:ae78 with SMTP id j6-20020a05620a288600b00699bab7ae78mr1832779qkp.618.1648983851692;
        Sun, 03 Apr 2022 04:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648983851; cv=none;
        d=google.com; s=arc-20160816;
        b=e1s4eH53K5iAa9XLcLhrmbxMWzrX4tNDmWP7p9ThkgE4wxM7Zjfxj+8/dFtoOE9fdT
         CMl7QdYisz2AwiMEQahaWDMPhDzVWEhI/QVgpD04oJtQOwvoUoi0Bge09SKv+ZoM5J0t
         pnUtmnXlLMNJY3OhArs3r0WswpbuuRjyKKS+gKuLPGn2fu9PccHNWI0PAT4aXqeYbJf5
         UsQczkdRgtkIj54FG0jP36uk4/frYpIeV0xjP8fxX9uaa2PzxllEa98I9TF8PGWGYzlD
         SqEf+JEu/vMiMBtmkz3Vx7p0AFf02NYOUeDcgady0YBHtJTrO+dK40mfZjmu7DS2uZXh
         CoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9W1VrdNopYHMYWbjYkVtU8hVkqQD8CSQBjT/xYI0fhc=;
        b=I1SqgqsABkOSI0A0iqtbzewmGjzt8/Tq73lgLw6hGCh7WgUC7O9EqT7zSPfB7tVB7O
         OlSrsuve5p3pQSa4a+UTyfurAjcBpSKGGzWkox0tMnTR2KvthnpVdg4vWDN6LlgMRStz
         gAEXhyBuCNEETmbyTQBqQ3pgp87kPBMX+blK7xui+IR3qeFSkO6LMWhBzzHW2tJLZcZd
         kFXn6oHwCOccBTRvEQFMzu+1FTqMHOnFl/36gvFDCVeJnkw8Nt4S5SybZDsi1DJda1ne
         5VW+MxZ1sU20Vx1L3hrNIgMS2cXP3CmxFXD+Dttyn+/z8cFnbBfWBp2l7/yzH1b9wlKH
         lx1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0be0aHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a0cca88000000b00440e46a7b77si2325111qvk.21.2022.04.03.04.04.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 04:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0be0aHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nay1j-0000xU-8Q
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 07:04:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyp-0004j1-8l
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyn-0001W5-MB
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9W1VrdNopYHMYWbjYkVtU8hVkqQD8CSQBjT/xYI0fhc=;
 b=X0be0aHUHtwscWwG5ctYUVNe5l07evM7i3EcMlIfrR/5S+5GE6W+BmLEgUSiyjLMeZW5Wy
 oudkOPml3b9PRQd7pRfjQ2ED8P+hIA2E7JodM5UIjYhxjaYtDQw7tz0Q/Fs9MRCeF/WhFZ
 zd4hQ5SNhQorURGPKrRiN/G8dJjj1vU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-FccQGr8FNN6nZDrvNj6JFw-1; Sun, 03 Apr 2022 07:01:07 -0400
X-MC-Unique: FccQGr8FNN6nZDrvNj6JFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28351811E75;
 Sun,  3 Apr 2022 11:01:07 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B8C940D02E1;
 Sun,  3 Apr 2022 11:01:02 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 2/3] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Sun,  3 Apr 2022 19:00:35 +0800
Message-Id: <20220403110036.5531-3-gshan@redhat.com>
In-Reply-To: <20220403110036.5531-1-gshan@redhat.com>
References: <20220403110036.5531-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxxljfV6Va1x

When CPU-to-NUMA association isn't explicitly provided by users,
the default on is given by mc->get_default_cpu_node_id(). However,
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
---
 hw/arm/virt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f628e86f78..558bd59e8b 100644
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

