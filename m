Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp328741wrv;
        Wed, 10 Jul 2019 23:21:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwb1ObqMzW4oo54I8Guc2NGSUdJITYyx4l5iawIWn1m3b4r5PCOUJmmvIuBlI2v3izjbYtP
X-Received: by 2002:a05:6402:14c4:: with SMTP id f4mr1720787edx.170.1562826104794;
        Wed, 10 Jul 2019 23:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562826104; cv=none;
        d=google.com; s=arc-20160816;
        b=0N7G3yJUceu4/HBF43l4ysSYCfji7/SwNseigZEYOwxu2izvniWI74ILwnQ8ZRtqRh
         ZQ90mcQc2iBkPseFyHsU0Q8EAT+nZyBgHUvelc/DSrg2PEuz51yVLwD65Mf014d6pgDl
         Ig7zh1bHJ/I7Uvj0Txte6lQVAfMzFvzQOiger1tmp/rTsIig7dLJHIp02dCBULuYrl5T
         5JEc/SPf/U/2omqk8dZ2uA9yxji7pOP/VZI6gD34odcUpEcw/CO3EVSw93bw0RAH3+5/
         NBkMaHGCDxazVkhNR43JdXs++7TxwD2ooexZMVYKv7lP7MskRDlDMMQtnRO8bpiOQpX8
         vs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w59KGEn/normtEg0JU2ao6+n0EO01yDNUY65eA4pjJs=;
        b=LzhAbHLPExJOmViSMMB+YaXWtf0H9JZxoUSohXTu92KDZvqyD973AuRt96ouespR8M
         1xZr+IMBOedIqZXM29YdmrlqdrqR6J2OEqyOWmBNkBNwyCM6frwY6caWiZdDkDrX6x1F
         tEejfwwlQKAo8ZbmUCNI+GerS7f4nbPJNJctoDizeRLN7Qsft82o9+SZMijrF7aFu9n+
         F8JeEFkDCfSMF1/+Eaug4fDc9EhVJP42IzozteHGKhc7BfkwLJUGYecs7HMuRmWn+NUO
         oh7XrJaI52FUErc8/nr+eTw21xl/ubgwPchC+BL4XEmuJUsIAXfEdKI+y4g3xqGEzXhH
         Q85w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si2923625edb.404.2019.07.10.23.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSSd-0000uB-Sw
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQR-0005kg-RL
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQQ-0000Ov-1E
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54242)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlSQP-0000NZ-S8; Thu, 11 Jul 2019 02:19:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F2F1308A98C;
 Thu, 11 Jul 2019 06:19:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E68D60600;
 Thu, 11 Jul 2019 06:19:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 11 Jul 2019 08:18:56 +0200
Message-Id: <20190711061857.13086-5-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-1-eric.auger@redhat.com>
References: <20190711061857.13086-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 11 Jul 2019 06:19:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 v3 4/5] hw/arm/smmuv3: Log a guest error
 when decoding an invalid STE
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
X-TUID: jydVuhnuDnOX

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

