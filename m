Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp743736ejb;
        Wed, 6 Mar 2024 12:34:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgPTF7+4xU/6XzxsJCc109QPjHtfHKm+T2v8gl+05c4QUhz8aTdWkwNsjgXEpmhDEK8cI9HpsIdfAmhHb6d34PwTmlkVEl
X-Google-Smtp-Source: AGHT+IFjh2t+/0G3+BWbbigq8zSHWMspx0NuZSj23E/nI53GmIKkcpEZjlY8sNvuLP7DcvQefUJ9
X-Received: by 2002:a05:620a:4552:b0:788:1dba:9e62 with SMTP id u18-20020a05620a455200b007881dba9e62mr7628767qkp.32.1709757295043;
        Wed, 06 Mar 2024 12:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757295; cv=none;
        d=google.com; s=arc-20160816;
        b=W3Nlunma0b9Eoqwvi33cSEaT2tciaLWWvPXvOZJyBUg7lptH2X8y5g5iADEay0g/us
         GZ2bFRXB6OCTdmTmkTLJ3LAHXaRixlp/1AI2GpSQVKPOYJbQAuU18syMyvoEFtaZ68Ym
         A5TKABPkBQZQJRmK/ICP9/qX05+ZUaLvruGV6vA+cz+8sDfAW2Gz70r0N90gF5hMM+QB
         80vlL00C9+CyI/WoXzBXVWPOo6M00CMZ1x2soJWZfJbnya6capo1g9nydOi2SZFijJHO
         UtpkqEYDHlMMFuoEnccWGOQMbeqoLigO++NAmdYdtg78c/OO+joVsDaN8b854g1wxbf/
         aogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CQdBQ55XBD1zKpk7OKKORm1TNObn+aTFGDtbgCuAoGo=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=pqVN5GqcOWtOV0dr2a/mmehPT/vWFDjTM6UUJpBv8J6LCKBJ1wvOVdGjz6EjHEnSlP
         XhdKHzQnPwFrT2DSsNbmwrS0naptWU+jIm8wJUnGFDtLrHa+W73fGU9Hi0JsOIw7MzBp
         WjeIeZ6zmDzqg4IdIsKAj62XrnUwGFhqNw/cs94gdBDJPzlJ4fAI/LXaEFmrUoJp1VtQ
         zohDQmuhrmfpz/c2kq17DXsVJk79Xk1Op2l+8DL5+/HpYQubMhrmMb3PWD0HnZXx+wD/
         /5d4MalnB75AqgXSH6zAKnW4BqG9wIFsjY7OHmr0hP2FwYUQ3DakzcH1Zvz5yBF8ChZU
         HTuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awPCQQs9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a05620a245300b007882dd56f1asi7669156qkn.195.2024.03.06.12.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awPCQQs9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhxxt-0004Fh-Hz; Wed, 06 Mar 2024 15:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxl-0004Ep-PF
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxk-0001nQ-B1
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 15:34:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQdBQ55XBD1zKpk7OKKORm1TNObn+aTFGDtbgCuAoGo=;
 b=awPCQQs9RxwXWs6enxN1bxU4V6wLHwDyjTWmyxyUVuBeVTrcIcqGZkc3snS3rX4SY2zaVU
 SIlbvjlpq8tZUfCeZDbzNUYwQ52o9QZFU864pUpVOdHeu+ThgdaFQsiLfBKnpPgtH8eXHv
 CC0Y8gzBXSR8cMvM+WVj3fS/yHWejcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Rvi4R51iM1SVnqVhVlIKNQ-1; Wed, 06 Mar 2024 15:33:59 -0500
X-MC-Unique: Rvi4R51iM1SVnqVhVlIKNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B07C389C663;
 Wed,  6 Mar 2024 20:33:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49BB147CB;
 Wed,  6 Mar 2024 20:33:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 1/9] qdev: Add a granule_mode property
Date: Wed,  6 Mar 2024 21:32:40 +0100
Message-ID: <20240306203348.65776-2-eric.auger@redhat.com>
In-Reply-To: <20240306203348.65776-1-eric.auger@redhat.com>
References: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aECulZJUWtUU

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

