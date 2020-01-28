Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp304847lfp;
        Tue, 28 Jan 2020 02:35:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4KQ4Vxd3lkNr5/CHIsUQ9zLGDSUckSlNT/YHzKtiEs56wB4iSIDdx5++PD/nyBICT9jw0
X-Received: by 2002:a05:6830:18d4:: with SMTP id v20mr16173336ote.29.1580207742838;
        Tue, 28 Jan 2020 02:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207742; cv=none;
        d=google.com; s=arc-20160816;
        b=p5t1+sOEsrHfpICX7loLFZNotjwhoGSTERYFnhw81VoHBDarY72oV1Opsz/9rdhXvd
         uXpnKBfiMockAkzWfIIDuJok/PspFNP1ldC+VVCnAMvvjGoxiADCqMaRQ+qzY304Hp5P
         ruYeFcPpHNb7+X+G1cuooOWsvvKQambxB6oeXTDWN9Q+Zk/X3e+A1IOJ/+otU7TR2LWR
         GNWwWTi/ddeMYaMBYjG5ydeBd5wyPbVh9PzulQWaUkHGu7X5tKh9PMX1gwr4IOEsZvj0
         vdNmBsF1yOoqgawTz3TvaXmbNMm+u2HeLoFy47eYKVcNxrr8IzdSfm9JQLjOdsCI1Zmg
         iu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=zRIDXBcFA1npKL3bY9kDF0a2tZ99w/hj73UnpskP22g=;
        b=GzEQYYNEqfEGwqqqAFm3tV+X15U6Nikh2YQj1xkuTGEA/ciWtYS72niMMziaU6n2IR
         C/6qbexfPjcrsA2OV1l+g5Mpypuz02UQnTy1S1a9qHIGnSmIfzhN32OdZmqkOXfw1ITd
         mG5MiXcvCd4cj0pfFdOZB6JFxiJttUcEXaJIYFOYTzPv61cw/z8N4ZBuTd6EE2dbb52V
         U9lJB7TNZCvGi9J5gTTWgzc2cneNA1HJppRkK8088ze7d9FwQ2r2KVrUH1AF4PR+0ZaT
         lXBFnl88tmzKKQ9thC/sIQL3QQqiSI/TlLZIbR6VjgaalJKTK0hxbJ3Erw7EMitfIy2+
         Dm+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NncEcveZ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a10si5035526oia.232.2020.01.28.02.35.42;
        Tue, 28 Jan 2020 02:35:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NncEcveZ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgA1Kfl (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:35:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20985 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725965AbgA1Kfl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Jan 2020 05:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zRIDXBcFA1npKL3bY9kDF0a2tZ99w/hj73UnpskP22g=;
        b=NncEcveZ5rQ2pVAGg+JLS5BCNnelm7wULgNKz7JGRAreCpN46ieSu9DsJb8bHw4xqX4FZ6
        sAmHvotCqkXntOLASEC84jg2mPLBeVsTZuAKe4A3PBNi7CBnktOQDESak04PojZT6VZNHs
        aFzg7tYZ1ddUio6CBDa02oCJGJyY4Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-BSGEQTgFPAW1HAu62B4BsA-1; Tue, 28 Jan 2020 05:35:38 -0500
X-MC-Unique: BSGEQTgFPAW1HAu62B4BsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 517108017CC;
        Tue, 28 Jan 2020 10:35:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C03F41001B08;
        Tue, 28 Jan 2020 10:35:31 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 04/14] arm/arm64: gicv3: Add some re-distributor defines
Date:   Tue, 28 Jan 2020 11:34:49 +0100
Message-Id: <20200128103459.19413-5-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 01zC8f9wf68h

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
=20
+#define GICR_PROPBASER                  0x0070
+#define GICR_PENDBASER                  0x0078
+#define GICR_CTLR			GICD_CTLR
+#define GICR_CTLR_ENABLE_LPIS		(1UL << 0)
+
 #define ICC_SGI1R_AFFINITY_1_SHIFT	16
 #define ICC_SGI1R_AFFINITY_2_SHIFT	32
 #define ICC_SGI1R_AFFINITY_3_SHIFT	48
--=20
2.20.1
