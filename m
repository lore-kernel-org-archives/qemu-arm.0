Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp977054wrv;
        Thu, 11 Jul 2019 10:29:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfKY8gNDA8ssBy0rRFYuoL7uxETzT46s5fCyttod4Gtcj+cj0+SudXdpbGH1oh3+ZRI78a
X-Received: by 2002:a50:b0e3:: with SMTP id j90mr4800463edd.26.1562866191485;
        Thu, 11 Jul 2019 10:29:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866191; cv=none;
        d=google.com; s=arc-20160816;
        b=QjmrQIsNpNzCEAPCfCxO+5MbXJXAHBt1cGz5tq9laXzehhgo/vd/bK0eRx6BmK7QMI
         qP8JX6o6Vztxr9D/wkoZmv3FN1ypy3DW8PcgRJdnEIe5M1OVp6S3cXeiVpVyaUzINnz4
         hR4+r4KmoycTX0jqUusMttXpztOfBR0wSMoCNmzQ3eNIinGdAHnqDloUO5XFAJ5+TN61
         MIzcGbUOPEomwe7wuTzWsKXPvUDd24k6aOi88VL1k7lgtanJY3v6fVldKDlEu45z2SnA
         4gHhjFfpkMR6aa6adBkxtSc2h4NzhqjzU4QFFaARxR+f3qq4egcLYe1Y2ZUcMwglMp+3
         jhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w59KGEn/normtEg0JU2ao6+n0EO01yDNUY65eA4pjJs=;
        b=z4lupkVyUAj5GtGAZ5EG5L3qI0RVV1KW2FcBT1eoc5mBCQm34TYsLom4TxmIz7mKMa
         2FNIUad2wLfWzQTRV3rA4CQbeTLJSRH3UOklZPs5XFgK49Kqy3woSO8B+7TkKOTWSUDV
         ggIGq1oroXh7g/uHDlION736Wp7NeKmKtPmky2QMQ2Zwx5V9K3FBm0GpsZPaiZV38YJV
         Q9+atx3uHfZUQzc67pksmgGUNShZ8+f8fFr7InH5VnpbOYey7gh9fk5aYbDINlwNe9kl
         7URLZsII26COEncZu1bO6brvKk2hmeGv8VYBu0hkSpB9TqIzg6zdwCmI5JAI1Nw/i0CR
         elRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l41si4148906eda.255.2019.07.11.10.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlctB-0005Tg-SH
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33863)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlct2-00057V-UD
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlct0-0001yC-JU
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:29:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcsz-0001q1-Ee; Thu, 11 Jul 2019 13:29:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D33730054AB;
 Thu, 11 Jul 2019 17:29:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FD665C1B4;
 Thu, 11 Jul 2019 17:29:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:20 +0200
Message-Id: <20190711172845.31035-5-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 11 Jul 2019 17:29:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 04/29] hw/arm/smmuv3: Log a guest error when
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
X-TUID: aX11a8YC9M+c

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

