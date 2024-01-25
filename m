Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp66629ejc;
        Wed, 24 Jan 2024 23:40:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHgE8VDYFe140gjTUH0MsEOhiXKnpu2TCHSDd4iFj3qUiglP9WFvXa6aKpax+3d7rEhrNY
X-Received: by 2002:ac8:57d2:0:b0:42a:52ce:d89b with SMTP id w18-20020ac857d2000000b0042a52ced89bmr710867qta.96.1706168431139;
        Wed, 24 Jan 2024 23:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706168431; cv=none;
        d=google.com; s=arc-20160816;
        b=oSxeidCTpkbFS2JRtfxPwIHAnb/hKLshrhmvlaY/XpLKVA/9Gk2dwOETcdl2ti09hm
         DXPYOaaJhqYzbjvjuIrFzTwwArAhyIdvT21mW1Jkync8H3d4e0/BvBUQGtsxSSij2ZKU
         fKEr0LFXxAV8G6orvPq+nGP1o5wbwzBp/YJMeZn6sdrsbXLAv8in4p8Kxp+UqzPyq5Mp
         HGcgfoSWCMDl73jpOXu+ZxqMVU6EQivvePu216/w4ozTH0b2QxZukTPLA71sSn2o20Cm
         pZpdY7/vMGAucTWLL1KlhaHSK3WHis5fqKyLWO8ymetwvBcnrU1qY1/u8JQ3qSvRuHwr
         1yAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zK83A57SGI4jroHianIZFBWR6MEJ0n6ivZqHqDnH3Jo=;
        fh=KJjndFIi6Bg8+hElVYssEQQ5BYWF+4fLP7XhqJ/C6zk=;
        b=FDw6ux8XB1pTjM7dpIT4K8XPykZ2UfucNXw9dpEU6vRbGPeFyqSJmpalICY/iDYyMT
         bEsC+KKTJQMXnlhurvUdYo4kXs0CXJUjNfUAr0NU0UcCkOyIJDe0u7jYdt5wFoDNeep6
         N7vIoBPJhou3yt9/FYVnvURcB7Y2swUvJZbSNsL3tTTpZV35Mnt3oaigVWdUlfZvhO/v
         hLKg4aHsaUmcNtec3yw+04NoYNMRwkokf64fcJJaChH5sYOE8b6VLA84m9gRZTrfW9NK
         0VkqZFGWBfBcuVlHIGfpOjguhxREHLcn3R9RfD5oRR2ddAiviuabVnNXYkOLOIzuYQw+
         lslw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PGhaswMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05622a001300b0042a67eca0f8si1466508qtw.169.2024.01.24.23.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 23:40:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=PGhaswMe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSuKf-0004hc-BA; Thu, 25 Jan 2024 02:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKd-0004f7-PQ; Thu, 25 Jan 2024 02:39:27 -0500
Received: from mgamail.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKc-0002YQ-5F; Thu, 25 Jan 2024 02:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706168365; x=1737704365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXWfYJCBUHmWbXzXgzBSvycCQazP+69MWP5qPcermqc=;
 b=PGhaswMe5LzHZOxZOhVts8olzXMF/6brr3JT6MBnYjF2XRUeFFR5Bdvx
 C09vbduG1luncj0WpaFBDIaRWx6KR2lscVpl8bBquvDAmVbHG59XgtTE/
 3ucs6MMgw8WH+WKg+HgqSw5Ezepudxb9juYiC6O1H5fu2WYHWU2egRrDg
 570PtJikJQvpfBxqI+t/7OWrtTfBIw+wKtbI9a1XrL7ytCaPyC78cfR1+
 eJ3S0LxLSoGf7VeOctsbt4KeZRShnWXj1KX4uCqz+HkmVV/UQYzD/gdJV
 VmFi1c0F+LAlHOdYbaOk4nVDeZr7wt5TTpomGVk2Do0ij15cPDOHkbTg9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400942968"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400942968"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2187734"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:19 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, clg@redhat.com, peterx@redhat.com,
 jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/2] smmu: Clear SMMUPciBus pointer cache when system reset
Date: Thu, 25 Jan 2024 15:37:06 +0800
Message-Id: <20240125073706.339369-3-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125073706.339369-1-zhenzhong.duan@intel.com>
References: <20240125073706.339369-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: bQRPXddbig5I

s->smmu_pcibus_by_bus_num is a SMMUPciBus pointer cache indexed
by bus number, bus number may not always be a fixed value,
i.e., guest reboot to different kernel which set bus number with
different algorithm.

This could lead to smmu_iommu_mr() providing the wrong iommu MR.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/arm/smmu-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 9a8ac45431..f58261bb81 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -675,6 +675,8 @@ static void smmu_base_reset_hold(Object *obj)
 {
     SMMUState *s = ARM_SMMU(obj);
 
+    memset(s->smmu_pcibus_by_bus_num, 0, sizeof(s->smmu_pcibus_by_bus_num));
+
     g_hash_table_remove_all(s->configs);
     g_hash_table_remove_all(s->iotlb);
 }
-- 
2.34.1

