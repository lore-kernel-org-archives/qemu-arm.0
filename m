Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3931225lfb;
        Mon, 16 Nov 2020 10:18:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt7UuFuilMirWkk2Mm6RlZEFAfSuN8ijBSp/b3UAQlZBL0lMH+QuTjhcrVofNPeAx2KTQu
X-Received: by 2002:a25:d981:: with SMTP id q123mr23464050ybg.50.1605550725790;
        Mon, 16 Nov 2020 10:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605550725; cv=none;
        d=google.com; s=arc-20160816;
        b=z32Zx3SCyH/e2Ew3OYrgeEuwERcTBzajyjzqdNDGVNytGWynP8H8V2hDel86Rf/7ot
         nHInYO6E2pmbhQQiFrJyqJEAFrSQwBLZNLO2m0VE0Tx1Wd9+PWVegp6/RC5WZIZgQMYz
         NpzpakAsrELAErbSGO52TGjDXa/7r2acfEuQAgL2jENqq27cKgdFlKFYY/ISoJrQBW/x
         sxP7KTMnJQ3LE9h9cILul3c3/IBLu+cSkouI8ClNj81aVTtk3/vHI1qsCRh53HIVgpVF
         ftMjLpsqDuKls3wvBXnsaHM0Rwx2Av3/vkvoXsNblhafm877tjUAqSxurYZFu2qhLcrK
         GLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vNcl04vp/EkwmGsZPIEqTn5ECNJ30SpdC+Hn4X5NZ0E=;
        b=FlGlIgSx6ISf4cMVT34hHFN76/1uJYp1SkYh254ahNX1XVEuFhkVnKVPBOdrKPHox2
         03nURMKfCarQvcFJi4qgi1aNvDyRZyCHi7KvJ0DU8+EHg34KALPuykb1bqg2LaAFLRCz
         HjnRrlSxZLdA8ooQ1IseTUgFKAZ2erGGHoWQD1A4jJlCGQuzk+FgU6nKmB0dnGUDS4/j
         aSGu8qe1GwYeMa1X2b8GDaKUD0Kn2VqFcLmTB7y0khnmtHkBq2Svrml/cXQvdWeEZGTW
         i+QRgyMiGgBrTEMsPbdhAWRK8TjhuU4e86otue8ad96nIL637oy9DVU+7vLxKXE7z5wP
         0D6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KwDprWMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e73si7780578ybc.179.2020.11.16.10.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 10:18:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KwDprWMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kej5R-0003lS-7M
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1u-0008Kq-Ej
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kej1s-0000nO-NT
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 13:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605550503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vNcl04vp/EkwmGsZPIEqTn5ECNJ30SpdC+Hn4X5NZ0E=;
 b=KwDprWMTv/u5Ktm2ONDm3hkYy+7cUdCQUlxDOpVaWZd969lSB5xwaxZA6r0qbgZ3CsXyte
 m2pdjYypHFWTf0OqeETmVTc6b1CLrp8g0OMYpPztRPMtVZ1Olv0B6UAjW4RCAGTPavyrJA
 PrHqdcrsj470df91eNepL3TnJ/jBjc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470--IUN9rH7OhWbk1LR2EX88A-1; Mon, 16 Nov 2020 13:14:59 -0500
X-MC-Unique: -IUN9rH7OhWbk1LR2EX88A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7967F1008550;
 Mon, 16 Nov 2020 18:14:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 090535C1CF;
 Mon, 16 Nov 2020 18:14:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v7 06/26] memory: Add arch_id and leaf fields in IOTLBEntry
Date: Mon, 16 Nov 2020 19:13:29 +0100
Message-Id: <20201116181349.11908-7-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com,
 shameerali.kolothum.thodi@huawei.com, nicoleotsuka@gmail.com,
 vivek.gautam@arm.com, yi.l.liu@intel.com, peterx@redhat.com,
 zhangfei.gao@gmail.com, yuzenghui@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qG60bWXgdBVt

TLB entries are usually tagged with some ids such as the asid
or pasid. When propagating an invalidation command from the
guest to the host, we need to pass this id.

Also we add a leaf field which indicates, in case of invalidation
notification, whether only cache entries for the last level of
translation are required to be invalidated.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a7364875ef..46795c97f5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -81,12 +81,30 @@ typedef enum {
 
 #define IOMMU_ACCESS_FLAG(r, w) (((r) ? IOMMU_RO : 0) | ((w) ? IOMMU_WO : 0))
 
+/**
+ * IOMMUTLBEntry - IOMMU TLB entry
+ *
+ * Structure used when performing a translation or when notifying MAP or
+ * UNMAP (invalidation) events
+ *
+ * @target_as: target address space
+ * @iova: IO virtual address (input)
+ * @translated_addr: translated address (output)
+ * @addr_mask: address mask (0xfff means 4K binding), must be multiple of 2
+ * @perm: permission flag of the mapping (NONE encodes no mapping or
+ * invalidation notification)
+ * @arch_id: architecture specific ID tagging the TLB
+ * @leaf: when @perm is NONE, indicates whether only caches for the last
+ * level of translation need to be invalidated.
+ */
 struct IOMMUTLBEntry {
     AddressSpace    *target_as;
     hwaddr           iova;
     hwaddr           translated_addr;
-    hwaddr           addr_mask;  /* 0xfff = 4k translation */
+    hwaddr           addr_mask;
     IOMMUAccessFlags perm;
+    uint32_t         arch_id;
+    bool             leaf;
 };
 
 /*
-- 
2.21.3

