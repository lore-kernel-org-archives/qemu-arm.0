Received: by 10.223.172.38 with SMTP id v35csp1406583wrc;
        Tue, 5 Sep 2017 06:12:43 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5yybcI8YRKIotkAvfR2SI5qfqXkoDOwH13VJ1YD91xp3SYGldLu9PqUdg1EsUq4MgCeaJ+
X-Received: by 10.55.164.12 with SMTP id n12mr5423338qke.246.1504617163756;
        Tue, 05 Sep 2017 06:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504617163; cv=none;
        d=google.com; s=arc-20160816;
        b=0g25tnwcqRmfD9abdHq8CNoSrWDxMgUvzowklOAvlXcR3Jttc36RMmf/2UyQkXHFV6
         865rtO3o3IY0lWFC2EJkQbT4rI6D0qoURQmaSkvgrEbJ5ys/Uk4RxG/qKIEYU1FNYbz1
         OHuc6fUNxfBDuUdKJIVUdPdR8p1XkdJjsWFN4UlWKeEcUgfH0BjznmEdMkRIy2x0othX
         pD/04Qarx4VfBs/Vz6ihXfuKt/CWasj7+Ji8uv0/GAzf1wrxynZW0PF9Hf8VBaXENLMi
         SOJNCpR6xxBjsLIIDDziwTPyywMte/ZnJhH8UFVtG5DZclUGwuO3/WtxZwN/kIGfJC/8
         MtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=TEjx4ypsWFM3iz3AmfiZFOJyskZbrYo4lRN9Wn7NSD4=;
        b=z/fNa3SAOwhmofcrTz/IZqEAl6V0K9E4cncxQhbPcgxIkPYW41MO+B6IJiuocjFEIV
         Sy7PPEgew/+48pC/HNu4/WnCEi30BS/pMwdWk/hmXeIAQcFH6k7VZHdxfGbODjNE+9wn
         M3YdGLXz4c+0HzO7wGS/+hh1hxrQOP6zOi2KYmDIAHh1SzhTm/6few8fQenm8Ye2bjik
         h5cxurhMxoe/sOP1nY3PkbRetgOzRS56wCLNwfsPU0j21boNLr7EclLQj/AMvoNEgg4X
         UBdVcpdcUgMNKpxWX/9S9hcyNEz6PGNFXm1FayKwshve5U6s6YshNeubw2RAtRv5CSZt
         aaUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n64si167270qtd.475.2017.09.05.06.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 06:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpDej-0006z4-IA
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 09:12:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDe2-0006Mi-Hv
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:12:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpDdx-0007hE-S8
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 09:11:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpDdx-0007gC-Ln; Tue, 05 Sep 2017 09:11:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F2ED2CA0;
	Tue,  5 Sep 2017 13:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9F2ED2CA0
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB7ED7FB95;
	Tue,  5 Sep 2017 13:11:50 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 21:11:43 +0800
Message-Id: <20170905131149.10669-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 05 Sep 2017 13:11:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 0/6] arm: Make use of DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mHS3gZ+1O6AW

v6: Rebase and resend v5: Add Philippe's rev-bys and fix one typo in bitb=
and
    patch.

This is the arm part that was left out from:

https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg04006.html

Make use of the new DEFINE_PROP_LINK, in favor of open coded the
object_property_add_link. The advantage of it is the property now get ref=
lected
in the info qtree output, for a bit more introspectability.

Fam Zheng (6):
  armv7m: Convert bitband.source-memory to DEFINE_PROP_LINK
  armv7m: Convert armv7m.memory to DEFINE_PROP_LINK
  gicv3: Convert to DEFINE_PROP_LINK
  xlnx_zynqmp: Convert to DEFINE_PROP_LINK
  xilinx_axienet: Convert to DEFINE_PROP_LINK
  xilinx_axidma: Convert to DEFINE_PROP_LINK

 hw/arm/armv7m.c             | 16 ++++------------
 hw/arm/xlnx-zynqmp.c        |  7 ++-----
 hw/dma/xilinx_axidma.c      | 16 ++++------------
 hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
 hw/net/xilinx_axienet.c     | 16 ++++------------
 5 files changed, 21 insertions(+), 53 deletions(-)

--=20
2.13.5

