Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2391205ejq;
        Mon, 8 May 2023 17:29:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Tlrafwvd4Dkp5b/y4lxc6cfuC7IWxsJ1bQiQ0kybTiD9YQkMnbv7K+cGS5c8v+kFqZxYm
X-Received: by 2002:a05:622a:44d:b0:3ef:58f5:a001 with SMTP id o13-20020a05622a044d00b003ef58f5a001mr17334193qtx.44.1683592148446;
        Mon, 08 May 2023 17:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683592148; cv=none;
        d=google.com; s=arc-20160816;
        b=nTLsD/KfAjLv7njVGG3rvIt2kWpoMyS9gP86voV6cbxfDhslW2Zg0LkSrtIunhLhAc
         2yj4B39E6ffu6akJLybYw3cIl2o0XDyl8A2LEy8pvHGaboJC6I7X1iqD75qQ71t+0bF6
         HoeLEZNrDwZdrKRz0CqVTz+OjR/MQIRGxF6r+hGuZDfjqotZXOTohiEW9keir1BQA/MJ
         0F6Y2hINSOO3nHCniAXvaczJl0lyDGamvL6aiy0Hx158uN5ytV2enkMnaaHMgKuFH6xJ
         IDbP3FdVMoz9vEPviai0je/2abf7A6wAYCdmvI6HjZ2WrMHyRseqBkGMepmgEmoVtora
         3duw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h0e9kG0FR3IP27E3gxDdD+6BjsHxySQBdLDMEqFNo6w=;
        b=Z66f/PUX/szXl07duXlyDWu4w5IZCn1NF2/o7XoAFp27fN7GCgn18svPG4I+5xHSiv
         8XY/ZOn9LAyqfKLuLsX8RmfVV8skJEt71C2zCQE5fMTwFO01Gvv3zqpqvavoUD84kNMJ
         gEyhNxIgT96Hz01r9EPgQtxbufkXzxE7DB7U7VdPupuVgtF8yfMBRgl8WAuJWC4fX3rg
         zLF7ENVtbf0bbrPmoAiv6KPZWRPR6mB27TsvNvAheuN5sDeuB6I3Leut/lLnHp7GR4r/
         oe3LehgtQn7lzd0ZQgsc6DjwZsu1cBOA1z/NVXfkeJomTJMXjc5fzvebt/ERjtwlkCDS
         H3Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="A0+WOVu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020ac85a04000000b003ef3d74694esi79343qta.34.2023.05.08.17.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 17:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="A0+WOVu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwBDP-0004NV-De; Mon, 08 May 2023 20:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBDH-0004LN-PR
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBDG-0004CR-0k
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683592097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0e9kG0FR3IP27E3gxDdD+6BjsHxySQBdLDMEqFNo6w=;
 b=A0+WOVu/QX3TO67SzsCD1ZkqHvpWn8xRfQqo1iUlZvRzlJz5y9+tuirdS4LEIJCLXlorZD
 tlii2pq7mSNDfzsEPVMGiV7s1OhQD7MbmCRnb2CzSVO+rbQJmVAuK5a0Kuf4fi+kI+wlhk
 wAQS75xpIXWxW2PfwdMPciXwPUukH5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-tgb_eNJAOb2ZMgLQXmuYiQ-1; Mon, 08 May 2023 20:28:16 -0400
X-MC-Unique: tgb_eNJAOb2ZMgLQXmuYiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F75B100F654;
 Tue,  9 May 2023 00:28:15 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B51714171BC;
 Tue,  9 May 2023 00:28:06 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v5 3/3] hw/riscv: Validate cluster and NUMA node boundary
Date: Tue,  9 May 2023 10:27:39 +1000
Message-Id: <20230509002739.18388-4-gshan@redhat.com>
In-Reply-To: <20230509002739.18388-1-gshan@redhat.com>
References: <20230509002739.18388-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qloIXtZNxfPT

There are two RISCV machines where NUMA is aware: 'virt' and 'spike'.
Both of them are required to follow cluster-NUMA-node boundary. To
enable the validation to warn about the irregular configuration where
multiple CPUs in one cluster has been associated with multiple NUMA
nodes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/riscv/spike.c | 2 ++
 hw/riscv/virt.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 2c5546560a..81f7e53aed 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -354,6 +354,8 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
     object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
     object_class_property_set_description(oc, "signature",
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..84a2bca460 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1678,6 +1678,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv_virt_board.ram";
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
-- 
2.23.0

