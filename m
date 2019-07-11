Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986900wrv;
        Thu, 11 Jul 2019 10:40:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/awUrBgPYsP1kW9zvMWmz15GiZUkKAbSIuW1ykbPC+nFUbGwWHfEdFbpVeQ3k62j37Elz
X-Received: by 2002:a17:906:7013:: with SMTP id n19mr4328347ejj.65.1562866841173;
        Thu, 11 Jul 2019 10:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866841; cv=none;
        d=google.com; s=arc-20160816;
        b=PX84JXT3Rb8CZlz4hJxtuTI8qo+sDL9RE2ygx9Lqg9Te6pXbSaUgpAGtKOjbX+FY9w
         lMykMSF+/gZqg1+Lzx3utoUQHO5VHPt2AZiQ7WHkGBIXTtXUj50fw3nZzbDSM3c604pF
         IrTgXUpDCRWldiJ4/eZiILlKwpLHIP1rLKIO4LpEfq16BUhAZGN5Avj9u7JXOYXXdZYu
         5qu5LMP3mQf160O4Mjg7cQLdYCyIlkf/SD0+zieJ/4qV1+zodqeCfZWUcf+rM/5J81DO
         xpYToqckqe4heacZB7MkmWIeLFB7rHRBpPROwVyMu4rEofEhDaalL4cNslw2xt31YuiS
         Hu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w59KGEn/normtEg0JU2ao6+n0EO01yDNUY65eA4pjJs=;
        b=olLvfFD3TAuqevpo56UYoOO4M2+KT8SzhijhaX1Qa60w1/DcvnZdK2BiSLFvaPbV0I
         /NBqTL1zH2cr68os10eL7E69fy2e1id9xgMoL1+AcjabFnEqNYpBKz6ZDbu0eiLDFTOn
         8RF6nRcWQuBTaZ0NXmCMJWMI3P1iWRZi87OwNuah0XgX4JvWBiHe8nytUqUO3CVmr0tx
         nTPr8ZkLOHeWs0wtGsmQSq2MzE80iNtg3Zc7Qb6UgJxi42PyBycmXKKmx9vlRK9gJwC9
         00e/mz6b3mmfVuc8lr5NSucRgHm/Az+VsPM7BoxeoZhoHG5XxPHYl+hWiyqL8OEMxDHX
         lRAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t27si4279409eda.244.2019.07.11.10.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld3f-0001mX-Iz
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld3X-0001X6-BH
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld3V-0004Eh-A1
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld3R-000405-DA; Thu, 11 Jul 2019 13:40:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC49B3082B44;
 Thu, 11 Jul 2019 17:40:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070DA60A97;
 Thu, 11 Jul 2019 17:40:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:08 +0200
Message-Id: <20190711173933.31203-5-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 11 Jul 2019 17:40:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 04/29] hw/arm/smmuv3: Log a guest error when
 decoding an invalid STE
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ubfpylEVVaU

Log a guest error when encountering an invalid STE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 384c02cb91..2e270a0f07 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -320,6 +320,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
fg,
     uint32_t config;
=20
     if (!STE_VALID(ste)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid STE\n");
         goto bad_ste;
     }
=20
--=20
2.20.1

