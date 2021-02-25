Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp249285lfg;
        Thu, 25 Feb 2021 03:09:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxv1akxzoLJcZDl8zLuOw/pf/vEim0O4HyP2YEFX+XqiOWdVLtFhmj+5hvkq0wGnHfymme
X-Received: by 2002:a05:6e02:1154:: with SMTP id o20mr2041354ill.236.1614251361112;
        Thu, 25 Feb 2021 03:09:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614251361; cv=none;
        d=google.com; s=arc-20160816;
        b=QMVp7rT1srnmYGNzxzrIwbaoajhU+CIIvKsRvceHS4p5GGqmy+ysnDpHoXgS64zy34
         wHcS14Ax05j0jx+sz/60uqKuXhSz7LnSc7O+JR60rQKCxAwGlky5pVz8g17ZuVJY6tqO
         f8AcJ0UAg7eE19Ofm039bZbIZ7Q9eivCPuShRFju/J83lYrHRZ+/YpvIC9M0KfkEHz3L
         5RCmgFrvzIqVDXWq0OGJJK7HCCJ3BBr/Pg/XpnXdvPF6zDOUgwYPy+QovvljIInMHVxY
         NbAwF7GG4SGFMH46X196Mas3Zo1wh7x8h53dD97wtO1jldCwU92a56qwCPELLxW/pORo
         q2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Sx2vRRYISdhKsakXwQJJnoaaQyhxgwJAdnxikV207cI=;
        b=iWJijGc+iIHo0wSETImeBwYWHdJnlDnOGj7hTe372DsWdk4yeUVaHmsqcosyPA0aBH
         YLt4gG2F9F0beT2qj8o7A4rf+XsoqzQuyp8NmjqmCdjrI8JQkagMAVKVbTAeyz7if6oo
         3lPqWE7K6Y2blHMBAavLZHUrqIgAf7+jdDSUIONV60Ko8f7u5js292Ucs1renRfAjC6L
         pF6wPrnOT9gHYwvKTVxNAOr4Vf1rHyuVSrYt+9R5a73HqlyI3Q9zAH0aiaGYxekXfE3U
         P8rMuZ2BNYnmctKstHFFCRoEPjgZ8ZsfEzyNgjfr8p2EmI3myhZpEQrXCQAZ4G7FjNST
         9/yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e3z96SRT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si5523487ilu.126.2021.02.25.03.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 03:09:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e3z96SRT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFEWG-0003KF-Ds
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 06:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKJ-0002DQ-88
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lFEKH-0006Tu-PY
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614250617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sx2vRRYISdhKsakXwQJJnoaaQyhxgwJAdnxikV207cI=;
 b=e3z96SRTSkx7YZsnHwkP6Y3VLF+9MEip0kpfNJIi3dDefPTJ7LuWzgFqLLn6fVUq2t7fjp
 inAcl3OJxOqh2Y+vgRd78SRY7zvKmKXpGGrLrBQOex9XXI27BA4bjbjnL6g3XvEh1ktxU9
 HlKdD5sOu7LEqSUg3MX0s76rqVk8mXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-itxkzIPMPjCtUgT5uk0XRA-1; Thu, 25 Feb 2021 05:56:53 -0500
X-MC-Unique: itxkzIPMPjCtUgT5uk0XRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36E06107ACE3;
 Thu, 25 Feb 2021 10:56:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44A095D9D7;
 Thu, 25 Feb 2021 10:56:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v8 20/28] hw/arm/smmuv3: Advertise MSI_TRANSLATE attribute
Date: Thu, 25 Feb 2021 11:52:25 +0100
Message-Id: <20210225105233.650545-21-eric.auger@redhat.com>
In-Reply-To: <20210225105233.650545-1-eric.auger@redhat.com>
References: <20210225105233.650545-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 jiangkunkun@huawei.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, yuzenghui@huawei.com,
 zhangfei.gao@linaro.org, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u7sx0iyyrgcJ

The SMMUv3 has the peculiarity to translate MSI
transactionss. let's advertise the corresponding
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/smmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6172a62b8e..a998e237f0 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1587,6 +1587,9 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     if (attr == IOMMU_ATTR_VFIO_NESTED) {
         *(bool *) data = true;
         return 0;
+    } else if (attr == IOMMU_ATTR_MSI_TRANSLATE) {
+        *(bool *) data = true;
+        return 0;
     }
     return -EINVAL;
 }
-- 
2.26.2

