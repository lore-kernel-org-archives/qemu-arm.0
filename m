Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796496lfc;
        Wed, 11 Mar 2020 06:51:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsI6nDXxggM6tk3N2NdUmnSHBSYi5EOU3P9dkLV1r72GjvRF4iZbrGaoFvQS6M842hH4jMo
X-Received: by 2002:a37:6411:: with SMTP id y17mr2909825qkb.437.1583934717738;
        Wed, 11 Mar 2020 06:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934717; cv=none;
        d=google.com; s=arc-20160816;
        b=EaP9EvpNLMed46qFWn9kZjYG+aZWC6+ZReQxZTPBKifFuGWQjd1cr00V5/eYAtFp8j
         gkMnV3yhehAXslsPqwsW737blYj3Eu8HcpMXrkwY0LpVLLJcCIXlYHLeU4k4joWf0GfW
         yYH9i1H9HwrG3YnM84JQYkt4HoeFgt2/Td7tr+Ggkoo7WAklL9Eg3GP+jUQ1pzj4Xwd/
         FFBy+QlAYPv7G6Rn0D/+62WGRqQXbL5zRokTG7+3SYC6RbLKPcUUmdaNsHF/bb6JX4ZW
         XzNcb8A/M8ulii0PoVes5lfLDtSO1Fty9PX9NGHmONEEyATkhzHVyxAhNqMi4JQOLXe4
         b49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pVG1gmnkjNXkzPy9M3rlVXPuuneYEPmOjK0XPCnk1z8=;
        b=FRCuC7UyCTfeG8vIyUsc0tgGBxqFw3L64cS3lusBGojgMnK3HW1IdPy/+d80RIJHGN
         Twlo6MHmR+1BpCq032f4tTKR6+9r5O1W/O7h7Dm/pzmw0+F0NHLhK5MLpUaN25SzjdUN
         eab4X8jixp7Hpj5N/FMjcP0XkLHk75ahr7EZ7p3LL+8BW2K7L5DDmzK1nups+AbQEs7t
         hUTV/HRqYB5ys8jaxMbO8VQ/q3a2WoJ4x3zvXkDAF9bBB3ighzIU9u+k4ylKdlQhQtzA
         CzF6/DixTYgAMTor5Bp6js7cUcBcXmEsjM8LQVeRUc6u+vgjO+joOSYy0Z1XBSB4MtRU
         CEJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=WRB0IDFu;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id dc4si866354qvb.164.2020.03.11.06.51.57;
        Wed, 11 Mar 2020 06:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=WRB0IDFu;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 722764A7FE;
	Wed, 11 Mar 2020 09:51:57 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP+WfvI65dQw; Wed, 11 Mar 2020 09:51:56 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6B38D4A541;
	Wed, 11 Mar 2020 09:51:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id F3C474A4FC
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwMhAw1jYBGF for <kvmarm@lists.cs.columbia.edu>;
 Wed, 11 Mar 2020 09:51:54 -0400 (EDT)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 236BD4A4A0
 for <kvmarm@lists.cs.columbia.edu>; Wed, 11 Mar 2020 09:51:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583934714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HV5vvbw31wyEYrQ32o2dc0uwSfN4maLDv7794Qu4y+I=;
 b=WRB0IDFuovugYtXwM9yStPSFwYRqyz5KTXk/XiDaoPglRTIq1TLT2YaqxDD/Vulcs1as8N
 w8EXwkky6YAizcNS9GShSrtlKm/PeatGcTpwV6ZvZBLS/bxd9u0YIRcaAS+1axubo0yfCa
 Ou3liSuwa5XW/sK9ySUfI5RLLnLf8/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-gfMbWxfiNsewb4CrSNSEmA-1; Wed, 11 Mar 2020 09:51:52 -0400
X-MC-Unique: gfMbWxfiNsewb4CrSNSEmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3D7189F762;
 Wed, 11 Mar 2020 13:51:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4371F5C13D;
 Wed, 11 Mar 2020 13:51:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v6 04/13] arm/arm64: gicv3: Add some
 re-distributor defines
Date: Wed, 11 Mar 2020 14:51:08 +0100
Message-Id: <20200311135117.9366-5-eric.auger@redhat.com>
In-Reply-To: <20200311135117.9366-1-eric.auger@redhat.com>
References: <20200311135117.9366-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: andre.przywara@arm.com, thuth@redhat.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Hq7CtHkeB/l9

PROPBASER, PENDBASE and GICR_CTRL will be used for LPI management.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

---

v3 -> v4:
- replace some spaces by tabs and added Zenghui's R-b
---
 lib/arm/asm/gic-v3.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index e2736a1..47df051 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -18,6 +18,7 @@
  * We expect to be run in Non-secure mode, thus we define the
  * group1 enable bits with respect to that view.
  */
+#define GICD_CTLR			0x0000
 #define GICD_CTLR_RWP			(1U << 31)
 #define GICD_CTLR_ARE_NS		(1U << 4)
 #define GICD_CTLR_ENABLE_G1A		(1U << 1)
@@ -38,6 +39,11 @@
 #define GICR_ICACTIVER0			GICD_ICACTIVER
 #define GICR_IPRIORITYR0		GICD_IPRIORITYR
 
+#define GICR_PROPBASER			0x0070
+#define GICR_PENDBASER			0x0078
+#define GICR_CTLR			GICD_CTLR
+#define GICR_CTLR_ENABLE_LPIS		(1UL << 0)
+
 #define ICC_SGI1R_AFFINITY_1_SHIFT	16
 #define ICC_SGI1R_AFFINITY_2_SHIFT	32
 #define ICC_SGI1R_AFFINITY_3_SHIFT	48
-- 
2.20.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
