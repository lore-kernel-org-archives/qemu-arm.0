Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1152133ejb;
        Thu, 7 Mar 2024 05:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfOLqaL42AOLBfD8pValDODipV+EWgl8BOo8ygzmKW4GnoC22yAUZRNQnSsD7PETPZyJMvWXacEt8W3NX4mYEF/o2oCA/b
X-Google-Smtp-Source: AGHT+IHfG+0Pzmfe8zrLYfJMjHvCBUIO/48Glp8kpJobhQFohE3zSSDbwXfQhAyWUIY0t8j7gkC2
X-Received: by 2002:a25:c7c9:0:b0:dd0:129f:16 with SMTP id w192-20020a25c7c9000000b00dd0129f0016mr11511064ybe.11.1709819420745;
        Thu, 07 Mar 2024 05:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819420; cv=none;
        d=google.com; s=arc-20160816;
        b=x0yA9GxlvYJuGtCvGX30UyxcMT7hF3qNLTG7T7j8KxFw1fFFuMrcDup4Th6Q31NjxK
         ZhFbAjWEAIPO3XeNWr+rQR84tiDW44Rt6r+UdGwW4ctxbHa6WkqTTe/5X38X5aqwTkzn
         fDpuCUtn3C9Pn0Yl9UZR8gbUSCkrI/bbWaCJVfBdCzC17JyKdxaObDSyyeRtOwACrkOC
         7bHwvSPtAG4V+ODBoIljllhnph/H8paRvEbzh1dV63yrizsHaNWa+TBXkr/LE4EWH7GZ
         rG2A/5hgKiXTvoE+ty4CRz6nc3UfHkjWAr8huBttJDhmWjlZbYN4/lRw15ig8oCKvjsI
         1V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CQdBQ55XBD1zKpk7OKKORm1TNObn+aTFGDtbgCuAoGo=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=fDp4OttXh1/Y0Fk4FaVjCahWC1WnnkHl4k9/uXlnwd1Ado8hgwTbmRURQVuPLxnzdn
         ECN3i1VeuUPMUZaKFQ+/iPnx2Ihbubn1ulps69pUGUIPmfAJwbkNRPQVw6cYI+TcEAZv
         ggwwrInAbY0dkefewqfEUYpa/nkj2iuge1Phogfw0AMvqiK9stMQw3KWcC/Z++ASDJoU
         R71dn35Tn11Rr33W6kDuWRrM9Ai9q/JxiUZKcoVp0xOnRKb4dfeQARWBk34j5ODEM57m
         RfTH89WOH59Fn8KkZar7qRXGwWBsvBG62T4XULF1C1ByOFW/iQtQoGExecDahEW03I/0
         OyZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XkvbIMYK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk36-20020a05620a1a2400b0078841225922si3420357qkb.633.2024.03.07.05.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XkvbIMYK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riE7A-0006gc-6n; Thu, 07 Mar 2024 08:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3f-0004qw-Ea
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3W-0007AD-1Q
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQdBQ55XBD1zKpk7OKKORm1TNObn+aTFGDtbgCuAoGo=;
 b=XkvbIMYK8LcIRGEMVOMSWrmLomquOLQgUyxXxuyqFqRrtEOmgi5WzSDAtXmpvIVzT9G+EY
 sH4gaeqvDjkjVn5gJRBJ5Cz5bmOkPIAOpqMjqzUgFLC7nCZcpEkIn9nGT8srXzUmV1J6wc
 q/5VRG0EVfc4QoJIby301K6Xyc37pR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-p0y4NFzPMrq6hC-PHUGS-w-1; Thu, 07 Mar 2024 08:44:56 -0500
X-MC-Unique: p0y4NFzPMrq6hC-PHUGS-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0A4A187570E;
 Thu,  7 Mar 2024 13:44:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911EB17AA7;
 Thu,  7 Mar 2024 13:44:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 1/9] qdev: Add a granule_mode property
Date: Thu,  7 Mar 2024 14:43:02 +0100
Message-ID: <20240307134445.92296-2-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZTp4DRhLzh1f

Introduce a new enum type property allowing to set an
IOMMU granule. Values are 4k, 8k, 16k, 64k and host.
This latter indicates the vIOMMU granule will match
the host page size.

A subsequent patch will add such a property to the
virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

---
v5 -> v6
- remove #include "hw/virtio/virtio-iommu.h" (Zhenzhong)

v4 -> v5
- remove code that can be automatically generated
  and add the new enum in qapi/virtio.json (Philippe).
  Added Phild's SOB. low case needs to be used due to
  the Jason generation.

v3 -> v4:
- Add 8K
---
 qapi/virtio.json                    | 18 ++++++++++++++++++
 include/hw/qdev-properties-system.h |  3 +++
 hw/core/qdev-properties-system.c    | 14 ++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index a79013fe89..95745fdfd7 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -957,3 +957,21 @@
 
 { 'struct': 'DummyVirtioForceArrays',
   'data': { 'unused-iothread-vq-mapping': ['IOThreadVirtQueueMapping'] } }
+
+##
+# @GranuleMode:
+#
+# @4k: granule page size of 4KiB
+#
+# @8k: granule page size of 8KiB
+#
+# @16k: granule page size of 16KiB
+#
+# @64k: granule page size of 64KiB
+#
+# @host: granule matches the host page size
+#
+# Since: 9.0
+##
+{ 'enum': 'GranuleMode',
+  'data': [ '4k', '8k', '16k', '64k', 'host' ] }
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 06c359c190..626be87dd3 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -8,6 +8,7 @@ extern const PropertyInfo qdev_prop_macaddr;
 extern const PropertyInfo qdev_prop_reserved_region;
 extern const PropertyInfo qdev_prop_multifd_compression;
 extern const PropertyInfo qdev_prop_mig_mode;
+extern const PropertyInfo qdev_prop_granule_mode;
 extern const PropertyInfo qdev_prop_losttickpolicy;
 extern const PropertyInfo qdev_prop_blockdev_on_error;
 extern const PropertyInfo qdev_prop_bios_chs_trans;
@@ -47,6 +48,8 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
 #define DEFINE_PROP_MIG_MODE(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_mig_mode, \
                        MigMode)
+#define DEFINE_PROP_GRANULE_MODE(_n, _s, _f, _d) \
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_granule_mode, GranuleMode)
 #define DEFINE_PROP_LOSTTICKPOLICY(_n, _s, _f, _d) \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_losttickpolicy, \
                         LostTickPolicy)
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 1a396521d5..b45e90edb2 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -679,6 +679,20 @@ const PropertyInfo qdev_prop_mig_mode = {
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
+/* --- GranuleMode --- */
+
+QEMU_BUILD_BUG_ON(sizeof(GranuleMode) != sizeof(int));
+
+const PropertyInfo qdev_prop_granule_mode = {
+    .name = "GranuleMode",
+    .description = "granule_mode values, "
+                   "4k, 8k, 16k, 64k, host",
+    .enum_table = &GranuleMode_lookup,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
+};
+
 /* --- Reserved Region --- */
 
 /*
-- 
2.41.0

