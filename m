Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4582771lff;
        Mon, 16 Dec 2019 06:03:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkiFWZ2Qs6iwHH+lzQMNWOQQIjjgjBbR7PFNqKpMWC0ZsvoPu3f3AqD7u3vDonnBr2euvz
X-Received: by 2002:a54:451a:: with SMTP id l26mr9718797oil.69.1576505036438;
        Mon, 16 Dec 2019 06:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505036; cv=none;
        d=google.com; s=arc-20160816;
        b=nAI9xgP2e6TRw+zcu/SveO4DkZ/+FL0QXZA+Go0AtqhPXNxtZ1tIYgjbjnuQHvNXgz
         qbNN5CBJx06/1TLyg5/4QSrf1hc7cNAXSVbiuqLrI4WgdoRr7dz+uONjAePZLc3rwmn9
         B2V1YLgDjnG5pVaCK/B5BbRlc4peFmKiXub6ZWf0mj+xr6Jf0VA4Tf7u9ogQ3wd2c8JG
         TsHtLOFbmvUNmR10pL8+R/v/85tTPG160QnlrZQdGWuHETG6jUy++3/nnqQZ/0kHT5Uu
         MaGw3B0SjZJ6SkhXvzPwRKbRLjD0i/PzzrS7GJN+5Xd/LwmTI5iUH11WsCIsTer6379u
         7ZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=GOWPhC17h35AGp/dOHacyK3ecv9iQL7rfh6w3pp+A2s=;
        b=ploW0Y99AlqWC1IcINd+3Dxd1NPnMg47v+8IN0YBLMJJg4hq32uy6yIpuv0ZwCUlmS
         4e1lrqPn/CgM0NCB8603Q9HvGW0DVhYodtLQ8f8t98KCJoZC/Jj/FOOMge80bp6c+IbZ
         xozuvjyjFrpHqly0fyZYbnXyV5nmsIO5e/k1p9bIWIW+psc4BkaP2dJ7tCTZ6JJeST9N
         exPrC3faWH/uWtx8usdv2wpM0sSdxEeWeW6iP419wlKRSVZjH2aChZRjnJLfxVg569h5
         xbfpCArfrcq8oGpaoUGbQ63Amf55ZcHHxsUnJgt/WEkalqURL1jSriJoC8HcUsdf7167
         Skpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LsBgQxB/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t18si10467446oij.133.2019.12.16.06.03.56;
        Mon, 16 Dec 2019 06:03:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LsBgQxB/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfLPODz (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:03:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46470 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727950AbfLPODz (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 16 Dec 2019 09:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GOWPhC17h35AGp/dOHacyK3ecv9iQL7rfh6w3pp+A2s=;
        b=LsBgQxB/0JCpfTSCHtqMwR6TXD+rWkxxPUgHHa2BS5dBmA5ncH2HIAqKyXwUbrvrmm7R7G
        Nt4WR2StgbL12IiYoHggSC+tcyqIWnnsxEYsWR1REde7r6XUmUGBYfokKieWIM00b9WUSb
        4zoPo9V9TI7/R9LZyAbKq7l3vqj/Ifs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-UkzAK9YLPwyQPAgoFtqeUw-1; Mon, 16 Dec 2019 09:03:53 -0500
X-MC-Unique: UkzAK9YLPwyQPAgoFtqeUw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58472DBE7;
        Mon, 16 Dec 2019 14:03:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 717CF675B8;
        Mon, 16 Dec 2019 14:03:48 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 04/16] arm/arm64: gicv3: Add some re-distributor defines
Date:   Mon, 16 Dec 2019 15:02:23 +0100
Message-Id: <20191216140235.10751-5-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4BiyJ4+NLbKA

PROPBASER, PENDBASE and GICR_CTRL will be used for LPI management.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 4a445a5..d02f4a4 100644
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
@@ -35,6 +36,11 @@
 #define GICR_ISENABLER0			GICD_ISENABLER
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
