Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3058021lfr;
        Sun, 11 Apr 2021 05:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf0in1LzJGoUAUP/7xHyNrkzGbshspvxNxf+F1XokwsBAkUJvZWEFAW3LGKxRi/+mC6Jnb
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id i14mr18373825ila.49.1618143558869;
        Sun, 11 Apr 2021 05:19:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143558; cv=none;
        d=google.com; s=arc-20160816;
        b=fWx/yyw4uTy1eTzy54gOb9hvieD5HP57X0/vQbjF85Bnlxr3IoEl7sBe1C2HyG6uiN
         qxTSIOeNvBWxhKEbrDSkf+FigKd6hnePIkznB4q950od6Zpbmvo9ix8p0FYjgXttpZVG
         73JOeUijKdZvpr1SsE5FYB+oP1Q1JjmJ7lY9JQJkK2c+seHN7cGAHipy5GNzEZssF7kN
         QYvNyDC7HxLcpKDeN4OHLriSFDrxaOnWaevg95VIov6p9+yFgBvB2rQ1sDShilDWjIqq
         hep/cpEdWNMQFVW4XVjNQwmDOhfQlv5NCAJWVwID0wafgNp2WtZkXFnBoEUnGIwLKZk4
         sCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=adWMq36hXFG3/U1wl+mGXph1gW/qyQxxHZUg27bCPMs=;
        b=q4jy7+eGQwnQZxDJAsdTVqcho29UzgHCOw1Dw083rHUvrKk9xt2qjWNyOFk0+jm8x3
         vzkRJVOGQh4fzGDUsuW3lxdgdDzg1xcZAL5DekatgJdfsDYEcL2lVg3f4FrNhZuNECRo
         M1WL2EK/mIUKmHcjM6aCJNAh4BqydC4CxZWF9hfisg8Icghlcyt4IL6jRz8CoFuQbha+
         KTjf0CASCzLcJMz8VMpC38gyLO09e6fzY7DggVx9MqLvdtppTp7MXNrWBYrhdlRzqo8o
         vGR8+Ne6sKHw4O5x8WpfKCiGucvaMyKQmaC6BQRC6A2n7DcLXr48Xy4RUlb00AWDI3s1
         78zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q20t4OoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si9258613jaq.60.2021.04.11.05.19.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:19:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q20t4OoY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVZ3e-0006DE-3i
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvR-0000SQ-9R
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYvO-0002gj-1z
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 08:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618143045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=adWMq36hXFG3/U1wl+mGXph1gW/qyQxxHZUg27bCPMs=;
 b=Q20t4OoYM6AUx9GvBrsvhLjtXUTIqQQ9aovZ75tFsGk7vm2NBitmF1Kt51d3eQOnIC9oZW
 xcC0lp0VtKtkMxz15XjoYpdCQBhT+3Rng4ygYU1OW/ClKs7+OVcbHGM+A0Bk8LOVZvl6xt
 i1p+O/t5U3/f9WHcRrGlOhKFCgP+JkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-aS8sC_8oOUGDhU8uHSMs3w-1; Sun, 11 Apr 2021 08:10:44 -0400
X-MC-Unique: aS8sC_8oOUGDhU8uHSMs3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CB9E107ACC7;
 Sun, 11 Apr 2021 12:10:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DAE810023B2;
 Sun, 11 Apr 2021 12:10:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 06/29] hw/arm/smmu-common: Allow domain invalidation for
 NH_ALL/NSNH_ALL
Date: Sun, 11 Apr 2021 14:08:49 +0200
Message-Id: <20210411120912.15770-7-eric.auger@redhat.com>
In-Reply-To: <20210411120912.15770-1-eric.auger@redhat.com>
References: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I9DmXM3LWhas

NH_ALL/NSNH_ALL corresponds to a domain granularity invalidation,
ie. all the notifier range gets invalidation, whatever the ASID.
So let's set the granularity to IOMMU_INV_GRAN_DOMAIN to allow
the consumer to benefit from the info if it can.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: chenxiang (M) <chenxiang66@hisilicon.com>
---
 hw/arm/smmu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 0ba3dca3b8..c33d03de67 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -478,6 +478,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
     event.entry.iova = n->start;
     event.entry.perm = IOMMU_NONE;
     event.entry.addr_mask = n->end - n->start;
+    event.entry.granularity = IOMMU_INV_GRAN_DOMAIN;
 
     memory_region_notify_iommu_one(n, &event);
 }
-- 
2.26.3

