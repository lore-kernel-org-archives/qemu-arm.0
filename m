Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794382lff;
        Fri, 10 Jan 2020 06:54:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLZB2xKSi2YvKBznxsl/ydOS9btXr9jQ64LNpruyPj+rMQSWizWISLRBSkaZ5E01V/Y2Jf
X-Received: by 2002:a37:ae47:: with SMTP id x68mr3600306qke.214.1578668088332;
        Fri, 10 Jan 2020 06:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668088; cv=none;
        d=google.com; s=arc-20160816;
        b=Rx9dzbIVhcM+EtwhgvJ/1hyb+GUoST8GM1fJJBIPZX1hI0gZkpvccdhNtrSkGPFsu0
         7fJgPGlUlJAT0+gVGUqlIdjyqxlR+gmS78Xbh8u/xJXASXmhaQEtB5BWf/3N2gC04iOO
         yYrBZhEYV3eO4IM5IkyvY22qnY/uESMbqYV80gqy3ZVuZ6L0pNk1EAJ3agEH9PZ596Oy
         z/cBACEbVnkm7OncH035ctV6KvcwT8SxYIy5x8SWRnD56F8s6yeOEwHGOpZzJXswAFKN
         3s1UeyT9Wi8pf1xzv/rzCLdOxxCA17CwH7mG80WrzUpGzu04MAihpvMvo8iu/+4KJil5
         O1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p1e5ZFMNcmrCVElEJ2fTDrrtl+oX6kg+L8A9LSyMuws=;
        b=cvhXMp9TMlFHPQQYbe2YfGKdLOhBvgvhaMp2pVwf6mYYqEWttRtRnKlX39Ktfhce6N
         KrpwHzYeAyuqMX8B5SXLm2utHVIebVoERJoba5qafGtDyy8fipaKsHddXDGiDguHyGYE
         5BzbBe9RESye4PqX/Lt0JrgTdGD7bhNG6hJi7StSsEg6NWWWpspkPs+Z3R9rgVoXSCk1
         lVFW3ACUQlItYJxl1mq2ll26blWWsk/8m3S1eu1vD1XFF+RShAPIw1vUq27wqd9bSyn1
         aoiID2cKj+dV+cMeBMUe4z3uVwb/hHuwbPUw0Ndau9glE2IvK5Wh07nm6h1S4Qq0k2Jt
         lVQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="Iw/PRM+p";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id g11si1373982qkm.233.2020.01.10.06.54.48;
        Fri, 10 Jan 2020 06:54:48 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b="Iw/PRM+p";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1211C4AF0C;
	Fri, 10 Jan 2020 09:54:48 -0500 (EST)
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
	with ESMTP id oxMOGjFwK99X; Fri, 10 Jan 2020 09:54:47 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0FA6D4B17F;
	Fri, 10 Jan 2020 09:54:47 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 8C9694B179
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:45 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WJ4PVtbdkNR for <kvmarm@lists.cs.columbia.edu>;
 Fri, 10 Jan 2020 09:54:44 -0500 (EST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 83F5D4AF0C
 for <kvmarm@lists.cs.columbia.edu>; Fri, 10 Jan 2020 09:54:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRIDXBcFA1npKL3bY9kDF0a2tZ99w/hj73UnpskP22g=;
 b=Iw/PRM+psFyub7kbGNQ0jIaU1aUzyKq2aGymROD16bMEh/kLL7xwmSeLR+aPMdUROU6zWu
 F2i/NRXRyxe2reFckhPfYzNthyOi6bMlhWl/zpaw0F/+o5nBdoUiW2f3Y0ibk7oYCC/U1U
 VrCvgtj1OSPZNqVjW0IbbHQd3ij2y58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-XZnWUPIoPGqsUdeBvjoPIw-1; Fri, 10 Jan 2020 09:54:42 -0500
X-MC-Unique: XZnWUPIoPGqsUdeBvjoPIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E91B8C71A0;
 Fri, 10 Jan 2020 14:54:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C87D77BA5F;
 Fri, 10 Jan 2020 14:54:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 04/16] arm/arm64: gicv3: Add some
 re-distributor defines
Date: Fri, 10 Jan 2020 15:54:00 +0100
Message-Id: <20200110145412.14937-5-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
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
X-TUID: vxtncoOzbWgf

PROPBASER, PENDBASE and GICR_CTRL will be used for LPI management.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 6beeab6..ffb2e26 100644
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
@@ -36,6 +37,11 @@
 #define GICR_ICENABLER0			GICD_ICENABLER
 #define GICR_IPRIORITYR0		GICD_IPRIORITYR
 
+#define GICR_PROPBASER                  0x0070
+#define GICR_PENDBASER                  0x0078
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
