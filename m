Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2660658lfg;
        Tue, 9 Mar 2021 02:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXuP3rou8ZKC3uXhJriU85QWLZp0JDQLHECd1f7rhI/tZFzqDquypMm5W4jGCB3amBgiIC
X-Received: by 2002:a92:cd8a:: with SMTP id r10mr23403461ilb.110.1615286231971;
        Tue, 09 Mar 2021 02:37:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615286231; cv=none;
        d=google.com; s=arc-20160816;
        b=iaXAprMb7D8LR0ADdj5MQinnONj8oNVS6Z9OsMPgcKE+84jNJRqE8S7ceZfapev72Z
         Swh+9UkAyzbk6Q5MuIFq1n980wHAW1WPWugjFI8SJaC0teMFt97rYR9eqck+EPSuBjEa
         24jTrS9iclwGvV4MAovZ6NszKOZOKZDU5uYHVkVWN+x4irSzHsEXmTENWAaCE9HPg2Ad
         nxCnrQ5Rmhv7dJ288rq+2EuJVsyTIiqFhF2YszFvS2SYr/lFEkhog0cd15uhfIfDFGIm
         4gnTmj/GOBeFQ/ohLSJwzPydNXPg+cm4d4G7neK2rsvAgjmnz8dcREAkUYsnW+2pYvM9
         h56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=14p+j/CpjB0GM1QQbxolieRgFGzs9w3/Zsqc0TRnMgI=;
        b=mSpw1b3o2vPL6LdDys4DiyGcBF0t5qS4vKlXSiKzOlYo/cDYVjY/hklFMAquKWzSnK
         /TWEmw42BwGBi8fnvKMFlx3w4uksjlnBqk6wd7lOTtTbWW26bG9G73xzloZEdTrjOZVA
         wT8neILgBLQXV0eJFTMf2tThls/pGBE1zGbxDAAKHEMmwg97TTev1YhihFnC9yiYyIkD
         DcmHbC65/x+b0dCGctOx8g4hWElYAjYfeg5MWd1uClSokN3WEveEfBb46Y4vdxmCzyAe
         82zzFQ8XtQu25Jf/t/veG3Uc/DHlj9kVMaA47iX9lwMIcff2D12x+glIAcFsoAzDdCvo
         JnMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DocXQwHX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si13080727ilm.5.2021.03.09.02.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:37:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DocXQwHX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZjj-0005ne-8g
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbG-0005ie-LJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZbF-0005fb-0A
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14p+j/CpjB0GM1QQbxolieRgFGzs9w3/Zsqc0TRnMgI=;
 b=DocXQwHXUzxvJb/aP4TsloNZDxRhHI0HWBaAbsVTgQY0BUHF0SGCPiv7st13oChRDGLKeG
 XYqXUlB3jrqLoCu1Fw827HTqLRjbsFkXHfzN9f3UHB8CO2+i8b+mmVASTTHn+/d+PwzPz6
 YAAUfpbsJzIMCk3w03f2ZK++nWlmogg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-9Eh_diLSMXqyPB2F2ImrYg-1; Tue, 09 Mar 2021 05:28:22 -0500
X-MC-Unique: 9Eh_diLSMXqyPB2F2ImrYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40832193F56A;
 Tue,  9 Mar 2021 10:28:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0CEA19D7C;
 Tue,  9 Mar 2021 10:28:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 4/7] hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid
 is not set
Date: Tue,  9 Mar 2021 11:27:39 +0100
Message-Id: <20210309102742.30442-5-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H+pC8wdaQHRC

If the asid is not set, do not attempt to locate the key directly
as all inserted keys have a valid asid.

Use g_hash_table_foreach_remove instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 405d5c5325..e9ca3aebb2 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -151,7 +151,7 @@ inline void
 smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
                     uint8_t tg, uint64_t num_pages, uint8_t ttl)
 {
-    if (ttl && (num_pages == 1)) {
+    if (ttl && (num_pages == 1) && (asid >= 0)) {
         SMMUIOTLBKey key = smmu_get_iotlb_key(asid, iova, tg, ttl);
 
         g_hash_table_remove(s->iotlb, &key);
-- 
2.26.2

