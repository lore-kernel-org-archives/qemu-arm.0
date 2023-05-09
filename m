Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2391383ejq;
        Mon, 8 May 2023 17:29:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ywHWsjmJr8OKHh3BqmGJhG+D+uyQ2rRVIpNHCMccfS5C/EB3jzQXhPQcBonNAnZ+nbC1z
X-Received: by 2002:ac8:7dc7:0:b0:3f3:6708:c7d1 with SMTP id c7-20020ac87dc7000000b003f36708c7d1mr17324299qte.36.1683592181388;
        Mon, 08 May 2023 17:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683592181; cv=none;
        d=google.com; s=arc-20160816;
        b=PcQ4QeuMlFzB0C5KGIlqnahFNG4C6O6pbKuz0O5IX2bgOGQ0WbBOwEf2TgKXCyLRvu
         JA83yWon818nv0pB1Nxm+2Ma5x0yjyc4lRNwQlQk8fN7JjzzgzcnB23HXOQZ8eQoOULl
         XFuTlxytaXhM0rJRjZMl/x0saHJ5KMyU/y+FpmVMWMSxW1khIWOLcp+w5ubZ/0JEjcwv
         PCueR/onZXTQl7CTCvTW5lif6eDqH8N2wi5Wgv8WAwRqi93Al/GFyIBD7zDIGKTHWQCo
         DoGggSrGhO+aztleEjel2ZuIlwpMuEeisFyi6RR1tptzDix9+E4mAYZ48zTZ1Axf6T3l
         pDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Om+yHZCioNW3THbOGuEmFPAAwBXcsErx+2ZivRpwpRk=;
        b=HiO0BhsEXSce92w96HUCoGdk+78vNsXs9FWguwoPwejj84mDhwu4GHNi0JjZvG9rMz
         lhn9B5MRTLxpu6CHL/rvxv0PLtSKv6YRY9qUIsdtYzBRKSj9VKLaNxFrUnG8RsKKvzLH
         QE8Pl0HN6cUgGrAAi2vHGtqurGpb/FUt9Jg099NMLCFFqRWsFX4T5ICqTJtscXZvddFj
         pPOnqpvSsGMogcfMwHNKuGnUNzJuQZDWzhG3L+8lXkFRStsjfzL/rT4GebCXQ/6jMwqu
         Ck/SEb2u6MFOqpeNT+mHNXmVcjdxABaXabWpW0P3rc0DiCqjzjDLiYyX9EFfTxiQ551O
         75CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iw4oszkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a05622a164b00b003f365244139si77918qtj.70.2023.05.08.17.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 17:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Iw4oszkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwBDO-0004MZ-4z; Mon, 08 May 2023 20:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBDF-0004KA-6e
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwBDA-00046F-PV
 for qemu-arm@nongnu.org; Mon, 08 May 2023 20:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683592090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Om+yHZCioNW3THbOGuEmFPAAwBXcsErx+2ZivRpwpRk=;
 b=Iw4oszkC0WrmCplLQUJpP+Dq/V+LiXO3ruFjTUpalAUOHmIoTNhozc7ufKe4FWtDKSuX2+
 7Xf0aHkAsVImpPJFtNV4pbhpvg6csVBKlRVbqIRotieUEepEgN4W34GIQ0QAKBGzV73I89
 B2XKUXAti2LWbpQFPA8mOO8ajGkXZNA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-vZ8NPbONPzGwbZQFb0O4og-1; Mon, 08 May 2023 20:28:07 -0400
X-MC-Unique: vZ8NPbONPzGwbZQFb0O4og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E55485A588;
 Tue,  9 May 2023 00:28:06 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E71A14171BC;
 Tue,  9 May 2023 00:27:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org, rad@semihalf.com,
 quic_llindhol@quicinc.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, thuth@redhat.com,
 lvivier@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v5 2/3] hw/arm: Validate cluster and NUMA node boundary
Date: Tue,  9 May 2023 10:27:38 +1000
Message-Id: <20230509002739.18388-3-gshan@redhat.com>
In-Reply-To: <20230509002739.18388-1-gshan@redhat.com>
References: <20230509002739.18388-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nORRCF0jC9d3

There are two ARM machines where NUMA is aware: 'virt' and 'sbsa-ref'.
Both of them are required to follow cluster-NUMA-node boundary. To
enable the validation to warn about the irregular configuration where
multiple CPUs in one cluster have been associated with different NUMA
nodes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/sbsa-ref.c | 2 ++
 hw/arm/virt.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0b93558dde..efb380e7c8 100644
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
index b99ae18501..5c88b78aab 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3032,6 +3032,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
+    /* platform instead of architectural choice */
+    mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "mach-virt.ram";
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
-- 
2.23.0

