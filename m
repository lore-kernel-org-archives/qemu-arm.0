Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3931462lfb;
        Mon, 16 Nov 2020 10:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxG769vs6Bff0OiqrlBA96gJMBth8PfVyOF34mCOI3vCrlpAUCqdy11C7c+Z9+/THO5iyBM
X-Received: by 2002:a25:493:: with SMTP id 141mr22508460ybe.104.1605550742546;
        Mon, 16 Nov 2020 10:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550742; cv=none;
        d=google.com; s=arc-20160816;
        b=j8wQkmWkmkAx/jR0RCwlOP7iJyqBkZE72u/J8nTWdfRyFmZPjTwGkL7f5LEwpqt8GJ
         LtZrwcDY3gzvREpOFDqdsfQc6jpu0oMCUn9NqdJbIr18o4C1TQ/IWqytluE6v++GgdYB
         O3JDKfPnMLIKOfgkeQ/W48cHp6HbMqLUkD6hZulNBbWnj3HSB5L/gQo6QhKcKhH9a1kC
         YqHRd8Z4sP46rTve1L9iQxU3Mplmf4kzlDKrqzmKv4xXLCT2lJ4ZSoZKups96pwwEBLc
         DNQJGf3UbROIjHXMnHy8JMXnADRwNY0eIB4QdClU0vtQfhNwBmhrRs2OHnamEG34oDa4
         nJ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o83gyVo5CZKstp0kyEd9Y00vOBXHl/4kdhGS+VAUbng=;
        b=QEPtzx3Fb78F1Xra0zx3t47w0PMtykY0x3UJKflnQxO92N/QD5Phzn0o+WdYpvFLF8
         5VJD5SBJ2bfBrXJUGtweZ2d7cr8XgLP1D2i3m+BvExzN2246L8ynDwFFrhTOmUKf2o8T
         Mo72YFmMpHwyP2C/4znc7AmRTgmqY6LLxxZn8NumrFSKmKfG4f9atCg/LlOp7DA1HHDx
         XCt5IqTuXX59ssDg4l8g0vM3SjrorFfPpyvHFA9B7hol7WfQPUJwHCcOxmWDSqWUHyzR
         2bSi+6Mlt+/1RfMJl6Y94attRSpb2Y8TyyXnVwMzg5yZmA7NNGbMDdh0W6RIlNDP9Ux2
         QZrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PnZPV9Ev;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si20446618ybe.117.2020.11.16.10.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:19:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PnZPV9Ev;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej5h-0003eB-QF
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej22-0008RE-Fd
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:15:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1x-0000pC-NN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o83gyVo5CZKstp0kyEd9Y00vOBXHl/4kdhGS+VAUbng=;
 b=PnZPV9EvUKPneX+ZrUFwjuugVhww/jTGiGAZ5uImo9a0WAgQDr54B5yQudt83S1mwtJHdl
 9gxQFJY8PB8xmVrfG+uWJ2L97JvvhCNwmpuNBIAl6Tdj5zzPq3h/Q/5IRSPuVAKq/1W6Re
 +4fmsys3ESIBmzvtuSVT+OTssAiHB4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-xp6HhSl9MpaLS5Q0Qj5Tyg-1; Mon, 16 Nov 2020 13:15:07 -0500
X-MC-Unique: xp6HhSl9MpaLS5Q0Qj5Tyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C06803630;
 Mon, 16 Nov 2020 18:15:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1BF15C1CF;
 Mon, 16 Nov 2020 18:14:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 07/26] iommu: Introduce generic header
Date: Mon, 16 Nov 2020 19:13:30 +0100
Message-Id: <20201116181349.11908-8-eric.auger@redhat.com>
In-Reply-To: <20201116181349.11908-1-eric.auger@redhat.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtXZ3VJhxAeR

This header is meant to exposes data types used by
several IOMMU devices such as struct for SVA and
nested stage configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/hw/iommu/iommu.h

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
new file mode 100644
index 0000000000..12092bda7b
--- /dev/null
+++ b/include/hw/iommu/iommu.h
@@ -0,0 +1,28 @@
+/*
+ * common header for iommu devices
+ *
+ * Copyright Red Hat, Inc. 2019
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_HW_IOMMU_IOMMU_H
+#define QEMU_HW_IOMMU_IOMMU_H
+#ifdef __linux__
+#include <linux/iommu.h>
+#endif
+
+typedef struct IOMMUConfig {
+    union {
+#ifdef __linux__
+        struct iommu_pasid_table_config pasid_cfg;
+#endif
+          };
+} IOMMUConfig;
+
+
+#endif /* QEMU_HW_IOMMU_IOMMU_H */
-- 
2.21.3

