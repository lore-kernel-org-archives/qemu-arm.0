Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp666264lff;
        Wed, 4 Dec 2019 05:56:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIYbH7jK1rlWa5WBHR4Z3Gocv7kiqwqel4pB9i8yBj5NOjuAWWKZ4I/rXNhf1dKgOOIzxc
X-Received: by 2002:a17:906:27cb:: with SMTP id k11mr2989897ejc.301.1575467799076;
        Wed, 04 Dec 2019 05:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575467799; cv=none;
        d=google.com; s=arc-20160816;
        b=EPHIJDG3QzhkeRoF2WLtCDFlyEdUgxfRYLnDaFs1IuoTllU5HhCXpp9y6+PJ1bfYFU
         jk9xvLHbZSZtgKnSdWiP8sMeCD3riaX+ausvpOsly4YvrH0YUKy6emfov2ywyYVKoKg0
         u7bn5TMHGEiKTSLmP9qPHidZWc2fJ5Y15t3RsoII2Hj22+z4DJ96Dr7pEdW5KXVxQeCV
         SBlkw3qTvWYUR1wG1c5RKP7F8Y9tcQfCaQ4RbRUXVBgp9LyBA3OtjNkqnDjAFggcb1Dp
         4X76WdqXhLcm6p8e4K2n7ae5zRZejYIxWl6ymgeI0/A2fV1byySEOeUFbg1u1bC3h5T+
         YFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:cc:to:from:ironport-sdr:dkim-signature;
        bh=qj63OZvgUd2blMa1aPgiv5NYnxSXE+CuB5YhjLWxvAQ=;
        b=pJOLdK0Ls+xVsgaE/wFE3mc7Cn1LKtFuNG3jG6wG52jSt8AQNMBZ5m+71eh+7LU3WS
         4Xlc88nSQ5UYiINP/JTspHgyesqqJ+13aB5BE3TURNaayHYDE/yFHlOTKUhZpqYcObSv
         F1DUuNwESesKihcxKkjMwPmRr41iNqAKv4z5Lq3vMIGIoDdeW1Si6u3Y5pq83lS4s2yT
         JyE9IndLtvUF172K1ct9rNYJjmjXSnNPkJSay4CkGPaHD2LqQrrcVM+FkEiJ8S3M94FC
         lZvN5lgaPArTFFntwZsOhAQ0Hpmnu03+RJHUHp1i7ClyB2dcY3SzENfXM67+Wq94E18r
         0eug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=TJAKTEAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si4878150edf.32.2019.12.04.05.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2019 05:56:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.de header.s=amazon201209 header.b=TJAKTEAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.de
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icV8v-00057A-8B
	for alex.bennee@linaro.org; Wed, 04 Dec 2019 08:56:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8g-00056w-VI
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8f-00059n-Ss
 for qemu-arm@nongnu.org; Wed, 04 Dec 2019 08:56:22 -0500
Received: from smtp-fw-6001.amazon.com ([52.95.48.154]:42197)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8f-00058h-N0; Wed, 04 Dec 2019 08:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575467782; x=1607003782;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=qj63OZvgUd2blMa1aPgiv5NYnxSXE+CuB5YhjLWxvAQ=;
 b=TJAKTEAf9mBVF6OR39gakACdYNs24NTz0lAPMf6D0rVo0oIG+hd++2qf
 KuITrx/F/AVCuQH8WFv35c1ISiTFr7Hgo8ywZliCWOEvbSYcSmK9oUiwi
 BTWOPXwG2gn3wXiaAIBayUjjmdyfPc437IIgLihMQtgkyA8R1u20y0NGd w=;
IronPort-SDR: 9XWlbc6AWrPk3Sj3AkLAH72XL5hyTn7zSX2aKM1OSxlEtUk5upywo/vxwyze+8OM3TAF/7Xmah
 3NCeQZ6lGfYQ==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="7621879"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 04 Dec 2019 13:56:19 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 09EB5A1DCA; Wed,  4 Dec 2019 13:56:17 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xB4DuG4i029360; Wed, 4 Dec 2019 14:56:16 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xB4DuG1e029358;
 Wed, 4 Dec 2019 14:56:16 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 1/5] hw/arm/smmuv3: Apply address mask to linear strtab base
 address
Date: Wed,  4 Dec 2019 14:55:44 +0100
Message-Id: <1575467748-28898-2-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575467748-28898-1-git-send-email-sveith@amazon.de>
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 52.95.48.154
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
X-TUID: Zcvh+pfnmDzw

In the SMMU_STRTAB_BASE register, the stream table base address only
occupies bits [51:6]. Other bits, such as RA (bit [62]), must be masked
out to obtain the base address.

The branch for 2-level stream tables correctly applies this mask by way
of SMMU_BASE_ADDR_MASK, but the one for linear stream tables does not.

Apply the missing mask in that case as well so that the correct stream
base address is used by guests which configure a linear stream table.

Linux guests are unaffected by this change because they choose a 2-level
stream table layout for the QEMU SMMUv3, based on the size of its stream
ID space.

ref. ARM IHI 0070C, section 6.3.23.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e2fbb83..eef9a18 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -429,7 +429,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
         }
         addr = l2ptr + l2_ste_offset * sizeof(*ste);
     } else {
-        addr = s->strtab_base + sid * sizeof(*ste);
+        addr = (s->strtab_base & SMMU_BASE_ADDR_MASK) + sid * sizeof(*ste);
     }
 
     if (smmu_get_ste(s, addr, ste, event)) {
-- 
2.7.4

