Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2539612ejc;
        Fri, 24 Feb 2023 22:37:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9Mknqp0ax8BEkJnOaoHbfa+m7/QmZgCNlTZaeLvkw8FxnGgC2rgTGiMbBh/xBI8DzWr6NM
X-Received: by 2002:a05:6214:cc3:b0:56e:bb5b:3dfc with SMTP id 3-20020a0562140cc300b0056ebb5b3dfcmr38947562qvx.38.1677307079416;
        Fri, 24 Feb 2023 22:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677307079; cv=none;
        d=google.com; s=arc-20160816;
        b=QF0fGQlLLrGxnvCQ/PhHqNg2DvIjWErmC+Y3sx+gzUQ1R/SJSJmqBoy9yzDEyGQHWc
         ZF22Yu5G7ewMYA4syEEvjIiQGfjG9owwotSndmw4LZodXRj2q3w1ruzx/HSK8R5zyUNv
         N089j3bpxxzTnYgWI/vZDgdw4iG1sZpvqRzBBJeQKwTRbMdKEen6O3DqvjXvQIZ+dfVp
         nOeDU/fX17HSWAwKig7dte3v3QhkZC+jBf8HoCDvXgnXm3nFPtu5db9pFwEc/xkf8HWA
         E9RXQM9BAHX6DZqbi9/RIHlTtcUi5TG7aa1gfNtRYyMrEdVbOuLltJ+d04J0LGWI4Piu
         mQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QfrdHCUKpTvOTzPqLHeR7lm+APERaC+1IpcDPTKv2n0=;
        b=VA05cKAd0QEGFZyt2TZ846gMxY8MH95fAbrdnqCcTkDY8SQBUqL5Lqq89YfAp3bwKL
         1Yc4nzzOWW3TSJAYlNZzjOohDalf3vfBfXI/mA/1AIMUs3Pl9DddAfQ9NW/N9e4rBtE2
         MmMwK5WGNpzL4Qc06Lw1hA767EOFwX8wMY+x6iOuuIFDhYdkDrRMVBh1amupHkK/KjYH
         5skbXQx6IttbvawB4mtLMwD4m/Zz+1cOMTONxIVTKOTfcF2qxId1zcLuEWmeCp1E6Onm
         R9qJ41zQlnij49M5t2UQVolt3HV2LIDTRIQfYSYmk5kqOPZ0qY5d6/7W6fwKTKFKnFW5
         OZew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PuyZdLOD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a05620a258d00b0071932b16aedsi1136181qko.722.2023.02.24.22.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 22:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PuyZdLOD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVoBW-0000hz-RV; Sat, 25 Feb 2023 01:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBK-0000bw-US
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 01:37:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pVoBJ-0002qY-FZ
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 01:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677307036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfrdHCUKpTvOTzPqLHeR7lm+APERaC+1IpcDPTKv2n0=;
 b=PuyZdLOD+SP4u4zlmI1QOhUTL3ccAdLvW9WmRmnfuwFltLBIu3x1/22J+10L7Np8TLoWWt
 t2j6l3kJASkE/nHhVr688LHOKQFR/XvL9UPBNMngsth0v17HtUOv266JVI8L2B15WYxa61
 AeeULQE1rc4QA2VTCcU4vn8+vQWcWe4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-308-plO1_PT5OJ66sNP3GWc2YQ-1; Sat, 25 Feb 2023 01:37:12 -0500
X-MC-Unique: plO1_PT5OJ66sNP3GWc2YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7FF1C05EBE;
 Sat, 25 Feb 2023 06:37:11 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-20.bne.redhat.com [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BE1740C945A;
 Sat, 25 Feb 2023 06:37:02 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, yihyu@redhat.com, ajones@ventanamicro.com,
 berrange@redhat.com, dbarboza@ventanamicro.com, shan.gavin@gmail.com
Subject: [PATCH v3 2/3] hw/arm: Validate cluster and NUMA node boundary
Date: Sat, 25 Feb 2023 14:35:26 +0800
Message-Id: <20230225063527.281479-3-gshan@redhat.com>
In-Reply-To: <20230225063527.281479-1-gshan@redhat.com>
References: <20230225063527.281479-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sQ/YWM2b1I6u

There are two ARM machines where NUMA is aware: 'virt' and 'sbsa-ref'.
Both of them are required to follow cluster-NUMA-node boundary. To
enable the validation to warn about the irregular configuration where
multiple CPUs in one cluster have been associated with different NUMA
nodes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/sbsa-ref.c | 2 ++
 hw/arm/virt.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..91d38af94c 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -864,6 +864,8 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
 }
 
 static const TypeInfo sbsa_ref_info = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..b73ac6eabb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3030,6 +3030,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "mach-virt.ram";
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
-- 
2.23.0

