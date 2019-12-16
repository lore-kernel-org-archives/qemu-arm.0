Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4678304lff;
        Mon, 16 Dec 2019 07:17:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyebldFHZ9WxfJZvK4G10MUHkq8lOzVDLR4nwjWAhxI+MYckSvYHlz0WKaSWaRHf+YvYthu
X-Received: by 2002:a9d:3677:: with SMTP id w110mr26382540otb.139.1576509439914;
        Mon, 16 Dec 2019 07:17:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576509439; cv=none;
        d=google.com; s=arc-20160816;
        b=eVjPWPd9wgW6WKyNfwS01svk8mX//rIJ4yD7mNRe4QZNjUxqWo2DQEUxk7AFr+Xyt/
         BkshQ+aztktYr6buE9djqk+72tiDYHW9bbu71irmmsra15jNE3N5U/Hh5tl5V7PhPEtB
         waflHb+xVWqDUsZc+5q+9ZOfhBCUStGHK3lUE8+gbzvGUldoxAFokQT1TlAy6Ud7g56f
         lAaOufrB2vQ5BJImBR2p6nE9Pl0nOiD3kY9xGkgdRJAN5701fGgb5l3x+MTp3KNnDTS4
         ddpSY9H4Z8CCK720N/PEk46ylha9sFa8+g9K5UWNXeoxHYI+fWx0zG1npVLeSLGOE5OT
         XQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=mVMZNzfGgCZy2rnEt7SIpbodq72YKWuf3Om7HpAHf2g=;
        b=EkbfSJOIZVZlGXWJBfcu4YN20MdVPyWpXEPLbKlm0SzSLIzxfp40yal/+Ol0OFqhtC
         a8KNUxx7vFGMWZyyy/+MGaeeTTKENIrjmkwFdS3cNNdevE7QH/iVk+BFDgIRGcaEdA1d
         Fzo/BU9SQwOvcv5dcIIYAIElob0hCM3jP8e3nVy4QJvjhq2OE8rJUHD8WNefVkEErjPM
         h5Jmkz2Psyab666J8aL0luHpaXzjNfjKMMDX2FodBWq7Kw6o/BzuTTOrGra2ttwPDkbM
         F/nJ9ZuxqG/+Hyiwc4CdvZm8OOQmXMC7N/hvCfmo1bJUNFlNQKoCP6WB16f39aDNrBFb
         gYJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=seMttDmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si10399026oia.277.2019.12.16.07.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 07:17:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=seMttDmu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igs7a-0003To-AT
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 10:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7G-0003TA-5g
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:16:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7E-0001QT-QC
 for qemu-arm@nongnu.org; Mon, 16 Dec 2019 10:16:58 -0500
Received: from smtp-fw-6002.amazon.com ([52.95.49.90]:18037)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=246de4cf7=sveith@amazon.com>)
 id 1igs7E-0001KT-Ia; Mon, 16 Dec 2019 10:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1576509416; x=1608045416;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=mVMZNzfGgCZy2rnEt7SIpbodq72YKWuf3Om7HpAHf2g=;
 b=seMttDmuf556S4JhsB25HzawlXSy71DW80BU9CQ2+zTK33m7cVNsWiYw
 AaqEZM++YcNyGD41w4uzPBi28z23J0SEEjvnEYuMkFukGe+b6TsbMEGff
 RsMes+IRC/GlMQ6MXQ1zGCYml8VRvyQSB8LDrHxUs2K3omHAwB2lA9gYB Q=;
IronPort-SDR: Td7t4XrxG8vLi7kFqoN91DaZsotrP8zKsf3WW3ib3YIHRhFtHtt3iAcSY4kZbkeH6//wYfi7r9
 aLRjdmhmR+Bg==
X-IronPort-AV: E=Sophos;i="5.69,322,1571702400"; 
   d="scan'208";a="7831631"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Dec 2019 15:16:53 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan2.amazon.com [10.247.140.66])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6CCD1A262A; Mon, 16 Dec 2019 15:16:52 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xBGFGolE013973; Mon, 16 Dec 2019 16:16:50 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xBGFGn2g013944;
 Mon, 16 Dec 2019 16:16:49 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 2/6] hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
Date: Mon, 16 Dec 2019 16:15:08 +0100
Message-Id: <1576509312-13083-3-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576509312-13083-1-git-send-email-sveith@amazon.de>
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.49.90
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: clDrz5Q2J0KX

There are two issues with the current value of SMMU_BASE_ADDR_MASK:

- At the lower end, we are clearing bits [4:0]. Per the SMMUv3 spec,
  we should also be treating bit 5 as zero in the base address.
- At the upper end, we are clearing bits [63:48]. Per the SMMUv3 spec,
  only bits [63:52] must be explicitly treated as zero.

Update the SMMU_BASE_ADDR_MASK value to mask out bits [63:52] and [5:0].

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/arm/smmuv3-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d190181..042b435 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -99,7 +99,7 @@ REG32(GERROR_IRQ_CFG2, 0x74)
 
 #define A_STRTAB_BASE      0x80 /* 64b */
 
-#define SMMU_BASE_ADDR_MASK 0xffffffffffe0
+#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
 
 REG32(STRTAB_BASE_CFG,     0x88)
     FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
-- 
2.7.4

