Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp539632ejb;
        Thu, 16 Mar 2023 23:28:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set/qNvf17JFIEAt8psE1TPkkVmW5wa8AqEqTpMnqJy96K7yfhetYtspoOiuHV2wR0rHIs22U
X-Received: by 2002:a05:6214:76f:b0:5a3:2f3c:4ee2 with SMTP id f15-20020a056214076f00b005a32f3c4ee2mr34278311qvz.42.1679034512330;
        Thu, 16 Mar 2023 23:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679034512; cv=none;
        d=google.com; s=arc-20160816;
        b=Jsz/6C91A2t0kPOyr0bLmoPlWw3a5epsKDgZTi08ygZ4fjgvvJE8K0bsYZbqtNOs9J
         nUXKyTaW5zQ4L5BL/g+M94XO9i2QHHcKBdt4z6jVA5pSNW2ovmToaxzz6K3BQAtThiSx
         BcTzuNv0dBHh+S8kWMy6zkfDCycJuS677yPHmCUz1Hy3x3DJ/Znqaup1fBazC8gOya9h
         HmL5FqoFog7EECPJrrdsaOJdzrHn0Ut0hQHyyCCdSQ1xCMAjWTsrAxnp3aQ817s9mtgH
         NbmLTcQbEO+5qUT0xETRdXsaHpq8n544+ceTL84gKayvY8l4fhfmuj7ghVmMaANaDSGS
         BThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a5MMJrgBa4SWV2ls7Z2cuU5cgtU/tihOqfmEBAzFuCE=;
        b=gSrI4+qVgysg5r+eGr5TGuzY4ZseInBvqAuOa5lpV9MiqMSV9BuX2aMSkOvXzz/YvZ
         ckkD7POIYbwsZkZeEYMXkVW5OQyRQMIi7zqlF1gqNQNVAOwMW9bIRfK/ndl20qi2/yt+
         VxrPIC40JqOyq9PXMbigLNz2V6mBjPLPfk5crNZCqHEFKVhRfgG3LH6l9AQAzu0fSvck
         I1PyX8m2tMef8FMVRKZsmxw1vfdl4QM8IL6jHZ+xfgk6zQxIkNzsP63Jf6ObXUKS+NBe
         VLT9K5l8IMs8qgJcNi6m0zyJwqHoh+aP0QE6tWfFBbFdJf3/ENfMM8T0lKXZXZFF6rbe
         KK8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WKyJ8IAe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cs14-20020ad44c4e000000b0056ed468c80esi790267qvb.199.2023.03.16.23.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Mar 2023 23:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WKyJ8IAe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd3Yb-0001kz-Lq; Fri, 17 Mar 2023 02:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3Ya-0001kk-VX
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pd3YZ-0002uq-KP
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 02:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679034435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5MMJrgBa4SWV2ls7Z2cuU5cgtU/tihOqfmEBAzFuCE=;
 b=WKyJ8IAe6jWZsA9+dYxVjGyZj6uWs5I7kFpttEODtHP6zqUqs4QZqr4tlajoMWtyOcxG6D
 S3VIEoMnJElJAAIDyi37bIPXKiF+0cu/irxuxwFYJTMF5S/RgbYconakJRQ9RmRVH8uQRv
 XIUCNfIPP/pj3hP2++eLVFtysPKZQ2o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-XrulB8LHNWuD-QZcA88iVw-1; Fri, 17 Mar 2023 02:27:09 -0400
X-MC-Unique: XrulB8LHNWuD-QZcA88iVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D17713822DE7;
 Fri, 17 Mar 2023 06:27:08 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 218B32166B26;
 Fri, 17 Mar 2023 06:26:57 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rad@semihalf.com,
 peter.maydell@linaro.org, quic_llindhol@quicinc.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, ajones@ventanamicro.com, berrange@redhat.com,
 dbarboza@ventanamicro.com, yihyu@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v4 2/3] hw/arm: Validate cluster and NUMA node boundary
Date: Fri, 17 Mar 2023 14:25:41 +0800
Message-Id: <20230317062542.61061-3-gshan@redhat.com>
In-Reply-To: <20230317062542.61061-1-gshan@redhat.com>
References: <20230317062542.61061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: da6GE1EthXC7

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

