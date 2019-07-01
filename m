Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3160783wru;
        Mon, 1 Jul 2019 16:25:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoenDFivnhkhwhR13S2vHI0a1kHPZHkTQie4qWidvzJYUSy8MQ1VF1YsnFZdXjjjj1ZbT6
X-Received: by 2002:aa7:d297:: with SMTP id w23mr31830749edq.128.1562023501706;
        Mon, 01 Jul 2019 16:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562023501; cv=none;
        d=google.com; s=arc-20160816;
        b=ao03/w8/g4erIkxjvA3+d4YLT8u4+V1vZceBxFQ3EIizb10ehPgMcThP3rvZLrBu2X
         PAPoJLJwWRURrk6AraT1Mvhv6V2DLJJ+p3S3GPPd76/O3HXax0H6/eyasac9aagfMFdf
         c2DKWoUVjH3sJKzD/Wq+2VnZmIlm6fqlAGMoLcvoqxutHK8kYz+f/pIO14RJKjbziij0
         9a4Lx5UWDpLMdDSx1VyOtWdUGS27cwN/631XzfrBOZ0CVEEayjM3MA5TAqRCiQLTNQxv
         LSDITHaOBoRb3goHOxT8wqkVMzTEGw4gP2S0vPsPPmtRPn2CeAi7U2ifWgTE5rbQzkN4
         qkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=eSjIhpCoEScyMGU5VuOYIACribQCKH64nLo9ropCFM4=;
        b=q34ctu77eskaNeKhtXmVvH1nenyCCFPsgBq0AgqpZDFbPJLCkwc8dg6SX0OmhGM+tH
         slZfLT0h1rzu22F9L1Zdfwa/ysJFnGPLLDfU4OrmEvxtWxlgv2APIkiD79dkArSwEugk
         blcYuF6UgpjLAmlUn1U/nsvgIlr/e8LNs0QnITcQBabznO25U7rqonIfY5KYyEcg8Dcb
         8eGC4ukSp+yZGBMKwnT95wf5DEMB/bySDBiBEgoPpR6EUwMbkxb4hwPE0vvHIuo5RTiL
         bBrxTe1B6gf7dym/ibHpFsykw6BpHraQTCjAUxAsmKP0MS8ORiGkeWpsZ0wVcZkh6+YW
         6paA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2si7631951ejb.399.2019.07.01.16.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 16:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi5fQ-0005IJ-Jm
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 19:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47493)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hi3yr-0001Mv-V8
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hi3yj-0002qv-W9
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 17:36:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35262)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hi3yb-0002kR-AU; Mon, 01 Jul 2019 17:36:43 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D77330860A0;
 Mon,  1 Jul 2019 19:08:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23EA42CFC7;
 Mon,  1 Jul 2019 19:08:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org,
 shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
Date: Mon,  1 Jul 2019 21:08:19 +0200
Message-Id: <20190701190819.25388-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 01 Jul 2019 19:08:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] tests: Update DSDT ACPI table for arm/virt board
 with PCDIMM related changes
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
X-TUID: ueoz85yZd/hR

PCDIMM hotplug addition updated the DSDT. Update the reference table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fdf7f=
fa442afec3c5c28 100644
GIT binary patch
delta 172
zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=3DeSSi^^mWRZt~=3Da(Tfjuig$N)iRXy-
z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
Ni>WOjJjjWw0RY`tDw+TQ

delta 134
zcmdlxfpN_QMlP3Nmk=3DEf1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=3Dc$sh-0Ff)LR
Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q

--=20
2.20.1

