Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp7213210wrx;
        Thu, 11 Apr 2019 06:56:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyu01qT4iVDKVyrMy8VZ9S3kIR4DhSFBYWzCvFus9hYEJb98RQZWB9clJ/B3wPllt2PUSRH
X-Received: by 2002:a05:6000:1209:: with SMTP id e9mr9840409wrx.35.1554990980342;
        Thu, 11 Apr 2019 06:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554990980; cv=none;
        d=google.com; s=arc-20160816;
        b=n2BzZP+Tk7gEg/K3lMuS7tvMFotM1+6vc1t7ZdqbZNANh7NwXF53qsSF9qlRX4N37m
         pAjjEJKBlmFupOEvwD+xNd1amlLCo1LpUFlol+lyUAr1NJVQONUFmTAvys8w9qmlcxnw
         T52dZxUuTtynfOJ5Tahr72aRk0YPGFD4xzNlG6zuEeUojQNLszkF8LnQFBc38PZO+COn
         rybUyHeU4sdQ0rLjDR0gh3w8Jy34JaP/9r77uYehd8i8qGFHQm0LRPHS3lIwB4PgoWsV
         2kmJnAtmzdD8L9BxAfe3KN+fG00SwfhQo90v+Yx8O7p+XPvjQo4wLr+NvWc5sXMB1eQ+
         oZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=UOyqzIPWEQeyH/jFM/+7cHNwAvDAlY1o1Vgeixl1gSo=;
        b=0c7FMC8rUAnr+A4XGVR7wEwVpdzrymFW6dyEfQqQxjmZPgvWP37yBTwxazFpo7zdKy
         7KXcL4ckLSdle6+2n4HJEiWMuTI1GTlY29xytG180pbQUTZpz8J1PPuHOSiqSi9npJBK
         BE6rShkcXYCl0wTQOuxImkRmsdTW0CkoOqnKNals+bAFbcNmMbRA3jI5/K2yVj9hskpb
         azKg4SeyF744YXgRJM+TfhTsKMLwMrY+AeZ8wieNML1sumtnDvEfvn6NjPswXXB6h3OT
         Kfq77ZyzzmTC8EfJiPVvxXKzjxgCCByE+wqnXP/PIl8d8r6RWbvPwBDTuL+03hxC9Xt+
         KftQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s126si3349089wme.35.2019.04.11.06.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 06:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEaBf-0001BJ-EP
	for alex.bennee@linaro.org; Thu, 11 Apr 2019 09:56:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEaBT-0001AO-7v
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 09:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEaBS-0005gn-9u
	for qemu-arm@nongnu.org; Thu, 11 Apr 2019 09:56:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hEaBR-0005fS-UJ; Thu, 11 Apr 2019 09:56:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02C20C0AC378;
	Thu, 11 Apr 2019 13:56:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD04045F35;
	Thu, 11 Apr 2019 13:56:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 448F41138648; Thu, 11 Apr 2019 15:56:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Apr 2019 15:56:00 +0200
Message-Id: <20190411135602.21725-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 11 Apr 2019 13:56:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] hw/arm/virt: Support firmware configuration
 with -blockdev
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	mreitz@redhat.com, qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tt22pDPCrOqD

L=C3=A1szl=C3=B3 asked for feature parity with the PC machine types.

Markus Armbruster (2):
  pflash_cfi01: New pflash_cfi01_legacy_drive()
  hw/arm/virt: Support firmware configuration with -blockdev

 hw/arm/virt.c            | 192 +++++++++++++++++++++++++--------------
 hw/block/pflash_cfi01.c  |  30 ++++++
 hw/i386/pc_sysfw.c       |  19 +---
 include/hw/arm/virt.h    |   2 +
 include/hw/block/flash.h |   1 +
 5 files changed, 157 insertions(+), 87 deletions(-)

--=20
2.17.2

