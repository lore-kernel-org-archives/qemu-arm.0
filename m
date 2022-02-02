Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1064559lfk;
        Wed, 2 Feb 2022 03:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx46+2NcLm4zdyZbPlyslcdlo9DJ5kf89Efp2icHLXiq4XQ1jPJVGeLjZLcg97u3fvlrBOa
X-Received: by 2002:a81:834b:: with SMTP id t72mr793294ywf.92.1643800775030;
        Wed, 02 Feb 2022 03:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643800775; cv=none;
        d=google.com; s=arc-20160816;
        b=0SASDh/ZyrrPz4bXfUi364uGBh/8F/nqMkJctcaIG8++7KS28KxnE36Ii7w4gj1yub
         ck83+/RwVWf6HBBwWCrziBw3s3OTURFAvYnw4UVfbp5edHh3cG3OSS0ybkmJaVev5IDM
         K4dHKp1Ozr43qLuMSExq4bkHqq06rLCp4yUgtPYu81z4OLOACvt3gwSSmyJ2ctXLyOjX
         +1vpiKk8U16sWkUIH/T5EaXBHz66f0ihlkLTmZwQQvT/P+k7snKHEvWZUSkLgNzLEWn4
         JlcA6+j4C+rqj11oiCzcda29gdJDoYFgFRjGgQLBNU9eQ98Uv+E99rFSU8BYW3tIpRaO
         ju5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=SDCBaptvTdJ6MaGIqN5dCST/Vb0ziTlxyPLO2sqP+W8=;
        b=il32SQI3eqDzEnYNgM2RlvClQwON/dXlSTsKC5YgRSbGBJQKg7VXfLchPcKNkX1GaI
         jd8jvz/Je/5ZAzDBkMvCOItgjSGgM8CDToe7fakArR/jdC8OxSdR5R4hkuWo1EkKTaHs
         p2QH9HCH46Kef2azUJBsEFq466XKpTAB/bM3WAqE5fzme9G47+S8aDDZLLpM7FoWtzU/
         WtFmuh9QpIGGX3VEM6lEUGkUTJmRNrOvoZeTgEWyyG2MSPIX6sofq1uZzYgVPx5xHK5C
         cg03sCpzT0U2bdw13WyFdwVHF9p0SzZ+yYBe6oNNQdaOzlT+88QIcRyiRGa5p/QYlx7j
         +mpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bfb1Ztkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si219427ywy.398.2022.02.02.03.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Feb 2022 03:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bfb1Ztkc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFDfi-0000aY-Ea
	for alex.bennee@linaro.org; Wed, 02 Feb 2022 06:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nFDcq-0000aF-Jf
 for qemu-arm@nongnu.org; Wed, 02 Feb 2022 06:16:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nFDcn-0008Ti-14
 for qemu-arm@nongnu.org; Wed, 02 Feb 2022 06:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643800573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SDCBaptvTdJ6MaGIqN5dCST/Vb0ziTlxyPLO2sqP+W8=;
 b=bfb1ZtkcpVoDEa0bFC9mCvVI09Pq9cfMkRIMgXPcGyO17dQOdD+FzZY5zBfmDNIUONa5OI
 iWj60iGeumydsJK3mTWOnT5W+P7+k6ztRKfVOJ86+go1s2DcoXHfA7WwCyHkZnbl0IjTGv
 eZVk9bGX3ocTL0g5ZdXlylh4B+C653g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-G3U6wVDwORGVvGn5CNQMlA-1; Wed, 02 Feb 2022 06:16:10 -0500
X-MC-Unique: G3U6wVDwORGVvGn5CNQMlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353471091DA3;
 Wed,  2 Feb 2022 11:16:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D20410840C8;
 Wed,  2 Feb 2022 11:16:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH] hw/arm/smmuv3: Fix device reset
Date: Wed,  2 Feb 2022 12:16:02 +0100
Message-Id: <20220202111602.627429-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNpchTG8f99v

We currently miss a bunch of register resets in the device reset
function. This sometimes prevents the guest from rebooting after
a system_reset (with virtio-blk-pci). For instance, we may get
the following errors:

invalid STE
smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
Invalid read at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
invalid STE
smmuv3-iommu-memory-region-0-0 translation failed for iova=0x13a9d2000(SMMU_EVT_C_BAD_STE)
Invalid write at addr 0x13A9D2000, size 2, region '(null)', reason: rejected
invalid STE

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: 10a83cb988 ("hw/arm/smmuv3: Skeleton")
---
 hw/arm/smmuv3.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b43368be0f..674623aabea 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -278,6 +278,12 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->features = 0;
     s->sid_split = 0;
     s->aidr = 0x1;
+    s->cr[0] = 0;
+    s->cr0ack = 0;
+    s->irq_ctrl = 0;
+    s->gerror = 0;
+    s->gerrorn = 0;
+    s->statusr = 0;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
-- 
2.26.3

