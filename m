Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2065260lfi;
        Thu, 2 Apr 2020 07:53:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypK5IHBjvo2DbWg3qBhEV1Y+4HoDhD6NfJiZR07isr5VSx9KyovxTY8VLlbLIaF7z2blG5MX
X-Received: by 2002:aca:b308:: with SMTP id c8mr2596555oif.131.1585839196772;
        Thu, 02 Apr 2020 07:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585839196; cv=none;
        d=google.com; s=arc-20160816;
        b=AeG1dZWpCT6gucbrQJsSBxsOHfgX52ggpFk33peRU/R61yDSgUHWx95d+MFdEL4xF3
         +FYfTXaAmVwPtJE906qXIu5VlAVx8a3rU7+SYmeGlg/b4rLzvurx3aDOQE1HRNzFNpQ1
         PDvL3DL9FsM2TTYSDDrXW/rM/NK9bw0Ruz/cx9GwIgSpbVd9/q4sM2arfI2zekvILBrw
         bXTypYWd0F5bqlYw4J+Dwx/mh8A6OMiinFxytTyP8cuzhOEiQgyg7CJ8zCu6lXCRNSz9
         cz7xCpejYuNZvq/hoUiRLJatJEodHwYhsQ6oysB276R9suGkdX5wmp3O8oKjgmSoW/+7
         jY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=HV5vvbw31wyEYrQ32o2dc0uwSfN4maLDv7794Qu4y+I=;
        b=wQfFUBFGRkZPLCcJGuzeBRy0Oht5WhJpolfOnhtX/EWowlxK0+Z85sGl7ZwVBFgVi/
         vlhu0B97R8AGWUKe7FY+gjoZmae/PWb6H+pUk9ll+EeKQ0rV1aIr0/IxzM7MXbQjGAn+
         RSqFASoGzfNn6S5/MHbSz6hcWMBKYl37gzYhRYDmNO/WBc0gk8idntwnEn3sOos6S1Lq
         lAZq8DH4l4We051ADWQvYwk2ModRt2E9eieUPnIav8QQjWnguJ1B1W+OV3tDThIe70od
         zdAScD5KVLvJLyObsz3RcHjS2whgPMUpKfdFHhM4AzfGl7/u4R2HZpqnVrfj1vMTVkVF
         nD+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZnqIbnaN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x5si2406408otp.126.2020.04.02.07.53.16;
        Thu, 02 Apr 2020 07:53:16 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZnqIbnaN;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388871AbgDBOxQ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Apr 2020 10:53:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41050 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388855AbgDBOxP (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Apr 2020 10:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585839195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HV5vvbw31wyEYrQ32o2dc0uwSfN4maLDv7794Qu4y+I=;
        b=ZnqIbnaNJncRCBMxAB4MjQh8GlL/DsS4NEJvXFo5kuRUIqbcdb/+bY+MUyqPjEV56RMsnv
        MUY4w2t5cciAIcTMR3adx6k+YvPVeceRkBPPXntxl4BwXoxI37y5OcjoPR57NSymAP+Cxp
        f88ELJAdqOIFzSZprpfjZGd1AYSvZ0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-y7-sp6k9OeCPZEOCTGnEDQ-1; Thu, 02 Apr 2020 10:53:11 -0400
X-MC-Unique: y7-sp6k9OeCPZEOCTGnEDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0879418B9FD0;
        Thu,  2 Apr 2020 14:53:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B76C15DA88;
        Thu,  2 Apr 2020 14:53:04 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v8 04/13] arm/arm64: gicv3: Add some re-distributor defines
Date:   Thu,  2 Apr 2020 16:52:18 +0200
Message-Id: <20200402145227.20109-5-eric.auger@redhat.com>
In-Reply-To: <20200402145227.20109-1-eric.auger@redhat.com>
References: <20200402145227.20109-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 6bT+oSQlANAH

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
=20
+#define GICR_PROPBASER			0x0070
+#define GICR_PENDBASER			0x0078
+#define GICR_CTLR			GICD_CTLR
+#define GICR_CTLR_ENABLE_LPIS		(1UL << 0)
+
 #define ICC_SGI1R_AFFINITY_1_SHIFT	16
 #define ICC_SGI1R_AFFINITY_2_SHIFT	32
 #define ICC_SGI1R_AFFINITY_3_SHIFT	48
--=20
2.20.1
