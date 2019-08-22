Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1061004wrs;
        Thu, 22 Aug 2019 10:29:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaPVv0DSL4dcp7z/QdpWz8djK10CTg60kQ2X10Be9zRK60NnUbKKlVMtLVgwjvklVS0LwD
X-Received: by 2002:a17:906:c744:: with SMTP id fk4mr356664ejb.189.1566494955669;
        Thu, 22 Aug 2019 10:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494955; cv=none;
        d=google.com; s=arc-20160816;
        b=BNWnwc3C9jgeqWI5SHbZC3en2EcjyLn7gAz/UJ2DPyqIzQANdh87FIQOtY0aMZYr2i
         OMt1iJEG9mdIHrSLSg+F1qGwWz/Mc5sCmu8yr5hLp8a4WT66jfOn4H9hP9sE4+xyCwY7
         HSQFF3xvJfNZvYupzhkY4IP3rvztShv/GNj4iXbWucvy+0LQhvfHvNcN3NtyHnH61upd
         hIt82/aauT/Nn6jw44ZGPzmEHiiW7IeUIMwNTB5hRu/Bhu9HaXZshDobddyo8iqa+0Z0
         WeyhctxA1LW3xZSd1ympVEdKfPfQUzgjI2wVkwVsAhv35uJNS/CdCbVGOAP5KBO3SpRV
         X8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qUFjJfSjQziLgJquA0bf5UEOrmYLvzmMV1UMHsdhI5U=;
        b=ZB9mcYyrlqBLgabF2AqkOVSWuq+GmKY3D1ziy89PQCsF5b5lde/+RrzfiJm/08vi45
         knwlXybRl9Uu2StOgEJ6hj8KMXjXNsSo5pW4ZheGHiVvciiINIurYjcJyIHrJndAOdkn
         2TQ+Wkzl8aVWxbroAtBRUSQCmU9pel0KixEE2CFuN4Ulvuor9fgfADyCI5jFzPjkvl3a
         LwKxtx3I379KKOz5fcsJm0xU2i24YfYmNNuKWQqwzRs1wrMeZGjw3+TaiNLTWEVNj+Xb
         6M+dL/kQfw8tfN5lGPLrDKeIQ6clpMGEBDhiAO8FL6yAGo/Met95SBqDDawkMFRUme30
         aekQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lc20si102095ejb.262.2019.08.22.10.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qtd-00031s-D9
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35679)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoz-00068H-Pw
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoy-0003D8-PF
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qoy-0003Cb-Jo; Thu, 22 Aug 2019 13:24:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D73CE3083392;
 Thu, 22 Aug 2019 17:24:23 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5053960610;
 Thu, 22 Aug 2019 17:24:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:49 +0200
Message-Id: <20190822172350.12008-5-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 22 Aug 2019 17:24:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 4/5] hw/arm/smmuv3: Log a guest error when
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qj4nPHRstJar

Log a guest error when encountering an invalid STE.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a37e3da240..c353e4c27b 100644
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

