Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp683805lfy;
        Tue, 28 Jul 2020 08:14:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0LjjpQ4RoG4yfpdix9Nz/COgKFAU+z5MNElqZOVnpi0q4OUfBMhtoSjG3lPZuH2zu2bUx
X-Received: by 2002:a25:cb49:: with SMTP id b70mr11201303ybg.361.1595949291805;
        Tue, 28 Jul 2020 08:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949291; cv=none;
        d=google.com; s=arc-20160816;
        b=ed4q2zwC9lmA1u2ppmQkEvejgvFeEevsDSCj5asjpcqzeNnOhQtqx4lAL4mdApDgAB
         U5YHEbcRZHnORieAnlfu1hYRrhTAalFzFh9VygesONsJr5ucTo6umJE2X4bkTC8tJhwV
         BxapRqLkTadvbS31/yD0MNdpSxrtn5duCZHls46hRG9z02dICqWfuRt4aoTjUMI9HzVc
         eJ+CR473OddWuMginrGXiiBWDkniFc/iBHHdV2uBIVKiNPEysj5OPs9v5h9OMYRj3Ot6
         UbIifes6vu1PV0rjR2a/RFuVS0D8FghLTNK/5a5Z+6Bs05IlfZDDE+UJdgc4sv34CZse
         pdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/PDNEqPVzlrLEJCTVvsWJYXrf1MkJxyj/Y4y8B8JvaI=;
        b=ECaB7L8qBtP1l1QJw8LuJWd8Kx1eoQLIXDVC/zi/pSAt8bny3C7wopj03FUU5VG4bo
         ep5+1GX8/df+Ltlzg6h5d25dmcsfUMnXoLxn9S4jjhASvj2eIZVJnXQ/xXnnmlLTGIrn
         kEe0f5g071eF8l29nqiRr36ETZV7AxaJNOpgG0akjrLQuv+MZNH/tIGJLm723sMET0QC
         jCCZ8dwEcxSnqcm85lgsdjnMYOKQ7CNFhCbSSAI9ASLndvXKNHGGu+IUIGUy5SHwp6hA
         M/bgvwJScRljoQ8sEF5aVoi1sWaQbm5tEmGRIy6HouGPJ5uK0KvluFDQ+iW8g+GCDHed
         cBWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xbt2p5yG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e133si11824946ybe.403.2020.07.28.08.14.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xbt2p5yG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RJa-0007xE-US
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFi-0000Q5-V5
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:10:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50991
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k0RFg-00082e-Do
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595949045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PDNEqPVzlrLEJCTVvsWJYXrf1MkJxyj/Y4y8B8JvaI=;
 b=Xbt2p5yGn3OIeLft5cCNcq9YY5iOv/5DipwbRIBwcOIWBVA9UVL7hpCym0W0JZWMbo+TX3
 P0UWnzNSGAMbqTxw5N04yQsWq/n5kCWdM9kFsah0be0ynkZLxpxgPL4a5afuINJw7I3RSN
 HbKMVbrSHcp6OPcyliqFAV0WV53lxqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-L9mRbsX0McOjfYD66i-bNg-1; Tue, 28 Jul 2020 11:10:43 -0400
X-MC-Unique: L9mRbsX0McOjfYD66i-bNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4558100AA2B;
 Tue, 28 Jul 2020 15:10:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-203.ams2.redhat.com [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 452AA69328;
 Tue, 28 Jul 2020 15:10:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH for-5.2 v4 09/11] hw/arm/smmuv3: Let AIDR advertise SMMUv3.0
 support
Date: Tue, 28 Jul 2020 17:08:13 +0200
Message-Id: <20200728150815.11446-10-eric.auger@redhat.com>
In-Reply-To: <20200728150815.11446-1-eric.auger@redhat.com>
References: <20200728150815.11446-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RRQKpPVuP/rS

Add the support for AIDR register. It currently advertises
SMMU V3.0 spec.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v3 -> v4:
- upper -> lower case
- added Peter's R-b
---
 hw/arm/smmuv3-internal.h | 1 +
 include/hw/arm/smmuv3.h  | 1 +
 hw/arm/smmuv3.c          | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index ef093eaff5..bd34a4f330 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -64,6 +64,7 @@ REG32(IDR5,                0x14)
 #define SMMU_IDR5_OAS 4
 
 REG32(IIDR,                0x18)
+REG32(AIDR,                0x1c)
 REG32(CR0,                 0x20)
     FIELD(CR0, SMMU_ENABLE,   0, 1)
     FIELD(CR0, EVENTQEN,      2, 1)
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 36b2f45253..68d7a963e0 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -41,6 +41,7 @@ typedef struct SMMUv3State {
 
     uint32_t idr[6];
     uint32_t iidr;
+    uint32_t aidr;
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 89ab11fc36..718f28462e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1251,6 +1251,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_IIDR:
         *data = s->iidr;
         return MEMTX_OK;
+    case A_AIDR:
+        *data = s->aidr;
+        return MEMTX_OK;
     case A_CR0:
         *data = s->cr[0];
         return MEMTX_OK;
-- 
2.21.3

