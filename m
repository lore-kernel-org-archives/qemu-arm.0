Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2602049wru;
        Mon, 1 Jul 2019 05:31:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9IM3rL8fKkjUGsgH81AY2LgSMgzrJ4bHW4qqJgBacIeeX/BcLQPiYRWWDzdINUyZ4i8Pf
X-Received: by 2002:a50:b561:: with SMTP id z30mr28786389edd.87.1561984301140;
        Mon, 01 Jul 2019 05:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984301; cv=none;
        d=google.com; s=arc-20160816;
        b=BP3z7ksgT5ayl++fuuPxHWnz2aGZhsSR2CoNQG5kI01XEsYVaakrxu9udM+HHrAE46
         LAV+DC6qoXHsYuaurjs+So2KUxKzatz/MJpbz/2rzJ7y4wKaEucm9CV7lg5vjUUWHtb/
         tMMNWnh0KSUzYbQXSso1JRaEJWrDr5hF47OgH9Q0Gi96mI8ResjKCgc8lZsZ22nu31qv
         KOht/HuzMNbWNh4IOMXXzacdKytbZkQHlL7nKjvgUXKys+bCz5p+//+PIaJyvq2dYC8d
         FPhljRFBGp5GtzyXqVMRApHNQQwengFZHf6sPHsgO9eLYCFk9UudklO4IKc9D4SeIPHr
         W/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=54jS8qXWtbAsqQlrrk0y6ex9YFKUvvYfmwAQ/9jNWZg=;
        b=xjpYCYzjpxERDNr2FjexhMV8R5xXYpT1rlYjokRRv0QcdjiNVLCdUa9sPw5ZYCsinL
         flIQmZrCOZ+pV/9bQt5jovWb86L2aKaF5BkO2/APfidlMhuCwKRn1ZFKS43N3qr7mb0b
         Gjb8NxaaaHJnla9iCO8ujv2zRBgRBfW6/T+MBAPtSiiwMh7INQUabeDyMTQhPEy+A70K
         HpTKZbB+HlmI4QleDn+S/ljTKi7vnPCsKrOPOC/VI8DRjDj/LvUZkLVBQJ2rFxn8wEzT
         OfhHUiwXF6luamjfpyVfck4U7H7/1/60BjersU46yoTB7t1aZt/GHoFpnMcbhzVJA8gf
         eV0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q36si9305789edd.153.2019.07.01.05.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:31:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvTA-0005te-8C
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57531)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvSu-0005tW-Hv
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvSt-0002Tf-62
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 08:31:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvSs-0002Qd-Vn; Mon, 01 Jul 2019 08:31:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 06CDD307D915;
 Mon,  1 Jul 2019 12:31:20 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AEEB17CC0;
 Mon,  1 Jul 2019 12:31:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:02 +0200
Message-Id: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 01 Jul 2019 12:31:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/6] hw/arm: Use ARM_CPU_TYPE_NAME() and
 object_initialize_child()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k+FTyQHWhpcW

First we use ARM_CPU_TYPE_NAME() when we should.

Then is follow up of
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01492.html

  This series looks at Eduardo suggestions from [1]
  and Thomas commit aff39be0ed97 to replace various
  object_initialize + qdev_set_parent_bus calls by
  sysbus_init_child_obj().

Finally, some devices are declared orphean while they have a parent,
let them be together again.

[1] https://patchwork.ozlabs.org/patch/943333/#1953608

Philippe Mathieu-Daud=C3=A9 (6):
  hw/arm: Use ARM_CPU_TYPE_NAME() macro when appropriate
  hw/arm: Use object_initialize_child for correct reference counting
  hw/arm: Use sysbus_init_child_obj for correct reference counting
  hw/arm/fsl-imx: Add the cpu as child of the SoC object
  hw/dma/xilinx_axi: Use object_initialize_child for correct ref.
    counting
  hw/net/xilinx_axi: Use object_initialize_child for correct ref.
    counting

 hw/arm/allwinner-a10.c  |  3 ++-
 hw/arm/cubieboard.c     |  3 ++-
 hw/arm/digic.c          |  3 ++-
 hw/arm/exynos4_boards.c |  4 ++--
 hw/arm/fsl-imx25.c      |  4 +++-
 hw/arm/fsl-imx31.c      |  4 +++-
 hw/arm/fsl-imx6.c       |  3 ++-
 hw/arm/fsl-imx6ul.c     |  3 ++-
 hw/arm/mcimx7d-sabre.c  |  9 ++++-----
 hw/arm/mps2-tz.c        | 15 +++++++--------
 hw/arm/musca.c          |  9 +++++----
 hw/arm/xlnx-zynqmp.c    |  8 ++++----
 hw/dma/xilinx_axidma.c  | 16 ++++++++--------
 hw/net/xilinx_axienet.c | 17 ++++++++---------
 14 files changed, 54 insertions(+), 47 deletions(-)

--=20
2.20.1

