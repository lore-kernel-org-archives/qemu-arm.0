Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6316189wrg;
        Mon, 27 May 2019 04:53:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqfzv7A6c3CJwd3/PqmpMS20HNgYiXozaxZIXdDjE/OH8ur/VKEDpXisdq5kI21z8AdztL
X-Received: by 2002:aed:2de7:: with SMTP id i94mr2552189qtd.129.1558958026236;
        Mon, 27 May 2019 04:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958026; cv=none;
        d=google.com; s=arc-20160816;
        b=XyLMQjjQz2SE4cM4ssSk2MgFv7emDgUzcW3OzmzXQbWLLfIEMbocFnyIMks/ps5G2Y
         /zKO7CkaACYLPI0aYacxT2FitCebNvah0+2sRV7XWqTH7V1TbjvDjV7UIsOjcYXNjien
         BcREHqhLds0d5Z6+3wIUAgvTvNoLzwXJkmUv9ThMPYYb9clQohZriyEhjT7Gcljcj++v
         VXzlla6iJ5su693lS/jknfmNHEF7B2vqWVWP1EyndX0sQxlvMXZvB37qVxfl9E+Wwe8i
         V8j8T7h9SXwaGB5+xzJPz6cKUgqWFszKI0l42fO6NVL51/UqfYdQXM6UIRIzleG4nmKy
         4rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LcDFQyCX9q7z5YRXfvEmazDjfCLJscRdEHEmUikMUmE=;
        b=J6Q5qOCi2oXItHAeW9SaU9amu54ExoA/KIpIY+R7ZXUatWkoTSLIjMf8J83NcyYGNJ
         /7SsaADerNhQVIZkrb8Ey6/AHiioL1pq+qoiCqwTPE7s/er+qUQjMYWIQMOZeczX90wK
         hk1rFEHJhCDI4E4H/iDRmzKLNB2KKTo2tADfPltGYrsp+IX/a/eezVwHfIZ0PSm8W/Pk
         vS7ELdFXCnOwaN42ytZY1FrKBV/KQUM1aMc24IGNaigt0qLKibTiRQRURVvaKHAjMOUY
         i2MYt6SLSZWA8b5cdTxxg7xjR68jA5fmNOgbtjhs74U8EYXVVOuOMqzK0YyHx76+z2xB
         cqbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o126si5437423qkf.143.2019.05.27.04.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVECH-00037O-Lh
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:53:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2w-00041M-Fu
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2v-000436-Kx
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2v-00042V-Gh; Mon, 27 May 2019 07:44:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB9723079B83;
	Mon, 27 May 2019 11:44:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2C275D962;
	Mon, 27 May 2019 11:43:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:50 +0200
Message-Id: <20190527114203.2762-15-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 27 May 2019 11:44:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 14/27] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kg8k/q1rM4Oy

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8db605adab..b6eb61304d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -822,6 +822,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_iotlb_notify_one(n, &entry);
 }
--=20
2.20.1

