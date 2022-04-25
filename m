Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2095996lfk;
        Sun, 24 Apr 2022 20:32:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1son4GfR/H3O6mfYoJhhjE/K5eQYAsZk9TsRTP/WMI2u0/r1a5bri8Zs1IeBfhTDYeFMm
X-Received: by 2002:a05:620a:25cc:b0:699:c303:83f5 with SMTP id y12-20020a05620a25cc00b00699c30383f5mr8949740qko.345.1650857571272;
        Sun, 24 Apr 2022 20:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650857571; cv=none;
        d=google.com; s=arc-20160816;
        b=gaP0EbnbknQoS1gL+PHQK7COZHXdkm5gDkmAWz+rEF9dYtxxeH9ET5tMoXChS9ot0K
         UyIHv/RVS92D93ljO8d2Q7z2+blVAu9PlQGbElDUx7NNhG8NOAHZk8+1dGeYDkwi2NtZ
         j0w74DxFFgci0qq1xEwtUrnluNoUt8Aitow57Td36GUv33/x4uudyCqWeirpubcYt5ix
         ffXYHH38BqU4Saf6xnCt7Ywr3JS3hmRRYBuvUhcPgA7GTr/hTvoYOGTBkIQ2Tk81LIDt
         y6X0XnrwbF/PZzB/wENSRR9nIYcBhvHWV73pFyqaVGjq/gtFR2WjLxzfMSlIFP8z58d3
         /PFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XmPa0oFVeJGMHlrIDklYmRdRvpykmhdDp365jjIAGLY=;
        b=Uw4VmkSBhpalKZ+f98z+cYp284WEAQEkua+pwj7vYZaUmOgHx8zBQWeHI1o3m0uNlG
         2MiRnjEO3K9natqdX49ZdvI/VvTgRaPv7Mqq33DZI22UhHikrweHJsm/fcRitl5DYoJW
         cv5aXJ4NfwQ2JEDvmo/k6/x8dxBk8Hu052bH228kmD0AHHNNGiB3UUWPz6hAQSp0Bveh
         41fu0VwbDqmuK4/8Fjb5iaO9GrEohC5TqlJj8m829WtGDQF6Uf5LC9tUJffETSrkKfRR
         exTphtgPK0rABXSZxC2bZDfLgDfKA/lMHoZVBr6dENxtFhuiLLHVcX7qfyO3Ra+mrzhX
         N8QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoOzaakH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020ac85f4a000000b002f1f559e978si4142615qta.421.2022.04.24.20.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Apr 2022 20:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoOzaakH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nipT0-0000Zm-Pk
	for alex.bennee@linaro.org; Sun, 24 Apr 2022 23:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQN-0003j8-Qq
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQM-0002cj-6L
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650857405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmPa0oFVeJGMHlrIDklYmRdRvpykmhdDp365jjIAGLY=;
 b=MoOzaakHhSp3Ngj5o1+A9X8gfu5ph8iSfWX8o04OjHepIBsP3Go2l8vBnwg3DtsUb9eclC
 w2Ez+yXOINoLpFb+HE31azFgFjI2HkoIB9jOZbYcPQtZzB5AfiRjFmIN5aPFXQHsGk5Xkd
 I/AJgqTLpctJMOwVxNMTqXfnpOT5s7U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-gpXfgE1TNqGeatzlZoTmrw-1; Sun, 24 Apr 2022 23:30:01 -0400
X-MC-Unique: gpXfgE1TNqGeatzlZoTmrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD40F101AA42;
 Mon, 25 Apr 2022 03:30:00 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51DBC145BEF7;
 Mon, 25 Apr 2022 03:29:51 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v8 4/5] hw/arm/virt: Fix CPU's default NUMA node ID
Date: Mon, 25 Apr 2022 11:28:01 +0800
Message-Id: <20220425032802.365061-5-gshan@redhat.com>
In-Reply-To: <20220425032802.365061-1-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1O6WtaTCbHbM

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
index 0fd7f9a6a1..091054662c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2552,7 +2552,9 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 
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

