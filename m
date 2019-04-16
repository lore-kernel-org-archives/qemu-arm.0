Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3692009wrx;
        Tue, 16 Apr 2019 02:14:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyhRpM92mVZHGCQ6LPwOmRBBjW9RigDsAnMu09F3NvlhEC/DnvzcOWb4P60Isf/a+ilnga
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr26897058wmd.59.1555406061265;
        Tue, 16 Apr 2019 02:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555406061; cv=none;
        d=google.com; s=arc-20160816;
        b=EI9Tiv90Txw8XmTscMAIWcgFBGXA0HGequhzUHqs150wMVXP4k5xXRwp4ojVGqd2d8
         99q+QZay8abzu8KoWRE0vUfn/muIDZnvNEKRGd7zt41XP0Lw+EbiuIRUBhjGxbq3H4Mj
         XaffT0TKxAUH31GBLPMle27WMLUCz1rGeRry71srn+lxk6KGVE12eaJ+WEXwowxN6rCP
         2YpBaxtoWrBLQuo8m+7rXo4GbppfxzC3R61JigapAtDvR9q+wz7HJ0JTu/YmaC65VAaG
         +5wFby9n6/gTBaLf76ULhqmChcpy9QEwz9swxA98bG4f89uDewbKRleoJTOhyWgcUDGL
         Rmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=PNoGFeEEf3LYPbrlaYCuGzh9QHlOAd2xDLC01RrnWK0=;
        b=pfvaKUaK7Ra/ug2eAjuMGicwyuNcK7FqaQydzyCltxJT6PFhQt/OmqC6Wz1FbmGMoK
         1FKWPpL8Y3Oxo5os4bgquqH85jfkZDl4GtqvwGKbcpDyYhI+/fE4PaYp99H+6n09jm0t
         YOzfITQaU2CdmGquWHWyXzsJpsi/f/0sp+iC5i1QlSMqoDK1zQ4h7fonzCmSyShfTOsA
         VrttsY6vywVHgKFtRmbMJiJdNJbluDQZUy3JV+C9FOmDXHrO5ySkEAqzc44VORcZkg21
         fowABKxl3VuRhYWpo9C51kRAxVPko19xyQBBTunJZNX7a3GGzSidnq5iHJ5GEgHbjixJ
         NkAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si35623227wrj.214.2019.04.16.02.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 02:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGKAW-0004Xl-9s
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 05:14:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA6-0004Mn-0n
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hGKA5-0004SU-6z
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 05:13:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hGKA4-0004SG-VE; Tue, 16 Apr 2019 05:13:53 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 227F53086211;
	Tue, 16 Apr 2019 09:13:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D04F19C78;
	Tue, 16 Apr 2019 09:13:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 13CF71138648; Tue, 16 Apr 2019 11:13:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 11:13:45 +0200
Message-Id: <20190416091348.26075-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 16 Apr 2019 09:13:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/3] hw/arm/virt: Support firmware
 configuration with -blockdev
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
	philmd@redhat.com, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8/9V+Eb4aMX5

L=C3=A1szl=C3=B3 asked for feature parity with the PC machine types.

v2:
* PATCH 1: Split off PATCH 2 [L=C3=A1szl=C3=B3]
* PATCH 2: Factor out the loop body, not the whole loop
* PATCH 3: Rebase on previous change
           More detailed commit message [L=C3=A1szl=C3=B3]

Markus Armbruster (3):
  pc: Rearrange pc_system_firmware_init()'s legacy -drive loop
  pflash_cfi01: New pflash_cfi01_legacy_drive()
  hw/arm/virt: Support firmware configuration with -blockdev

 hw/arm/virt.c            | 198 +++++++++++++++++++++++++--------------
 hw/block/pflash_cfi01.c  |  28 ++++++
 hw/i386/pc_sysfw.c       |  18 +---
 include/hw/arm/virt.h    |   2 +
 include/hw/block/flash.h |   1 +
 5 files changed, 161 insertions(+), 86 deletions(-)

--=20
2.17.2

