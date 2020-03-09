Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp975249lfc;
        Mon, 9 Mar 2020 03:25:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsOGiEumJjs8s7KCco252Ff6hN88JQo7w5s3AnAatB8jhKInpnwV9zHQ/IVcBFNhYHn1AtB
X-Received: by 2002:a0c:fb4c:: with SMTP id b12mr4669254qvq.161.1583749501698;
        Mon, 09 Mar 2020 03:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583749501; cv=none;
        d=google.com; s=arc-20160816;
        b=fKUN76MpVpa2dVo24/twsTPV7H7MZ4envKuPyGrPnxIcGPbGBuROWQy21UXgI98x1e
         h0bP4Ds45+OME/+Fa1x8yMl204eVC2tiCu3qPa3127h3NhHnwgG978L2SGr7zXiq6zOp
         /SqOJ2FeHxuc5paaZmXTGgJqVpPWWTgcvaMbXYZnA4QgBATwvVQ2L5M7MoWJPOfnlkuL
         FazU1+8Bmx+/Iy8cQaFzVcG+no0L4Xy/dFrMmZ/wLbDEncs+oFFOCgouq9BcTfK/Z/Hq
         oq5G/zbc5mP7bC6N5Fh92n0HWOC2dp5rWL/riSGAK8pMUhIPlILyzv1M2mPEQgNN0o10
         KOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pVG1gmnkjNXkzPy9M3rlVXPuuneYEPmOjK0XPCnk1z8=;
        b=S0Mwstx1VlGPb6M6zQX/S8G70W/y6gqhyiG3OpfWG0TIQFFgR8Q/JgfXz1CVYEsfjY
         kxv1ZcnSTMcPkMPUuy8KaGLnylxEfnq1Ez4mA4sCUN5I5k5oN5DDSBGNBcqKGyxa+NNu
         zuXu1KrIEWoFA+YtI+FJMIkss4aa1qpSIlKPtOtU0wwjk5bxE3RKhSY3vVU2pnhLzm6s
         JtjkkFsCIazy/AUlbpWcoLoNhu6nXOJkxL/Ex1pSdyO4CKPxsh1vNk0pnL7sAoMqkorS
         PPPeLD5ntmqgyoSbjMblgxchWHvGoAyuElt3YFII5Cd1kAjxoLMzJYu/pSY+J7eQ1xSM
         OjIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=Lt1Gtvhv;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m5si5688912qki.209.2020.03.09.03.25.01;
        Mon, 09 Mar 2020 03:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=Lt1Gtvhv;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 683684A4FC;
	Mon,  9 Mar 2020 06:25:01 -0400 (EDT)
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
	with ESMTP id oaBamwQjNifC; Mon,  9 Mar 2020 06:25:00 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 734044A51E;
	Mon,  9 Mar 2020 06:25:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7AF934A4FF
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:24:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyUcGjITpNof for <kvmarm@lists.cs.columbia.edu>;
 Mon,  9 Mar 2020 06:24:58 -0400 (EDT)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 9EC734A4F7
 for <kvmarm@lists.cs.columbia.edu>; Mon,  9 Mar 2020 06:24:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583749498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HV5vvbw31wyEYrQ32o2dc0uwSfN4maLDv7794Qu4y+I=;
 b=Lt1GtvhvEGHVkuYDyLP/RKU8uOlAeUopsEcIPgrKUOQZZN6fK8tZki1/ZaTBDAo9CZFjp0
 e1Em1ld6HasRK1urOE6ojMJpR9mr4E9rHg3tPKYMyl9LvTBq6pHyg5MNZ+8AgZ9uh9HEfc
 WSMjR2Hwf8Je5HLZkZoQuojxnBOXKhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-QK0iUyyRMlKOBTk4pdRpKg-1; Mon, 09 Mar 2020 06:24:56 -0400
X-MC-Unique: QK0iUyyRMlKOBTk4pdRpKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D124A8017CC;
 Mon,  9 Mar 2020 10:24:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFE487B08;
 Mon,  9 Mar 2020 10:24:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v4 04/13] arm/arm64: gicv3: Add some
 re-distributor defines
Date: Mon,  9 Mar 2020 11:24:11 +0100
Message-Id: <20200309102420.24498-5-eric.auger@redhat.com>
In-Reply-To: <20200309102420.24498-1-eric.auger@redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-TUID: XRDtgHApgXBq

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
