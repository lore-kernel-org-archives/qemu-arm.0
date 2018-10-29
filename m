Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4843170wro;
        Mon, 29 Oct 2018 16:21:41 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ejF122TFon56o9+7KsNJsE9xWL3izIQBKRuIAccvwE6TEt/LeW7CPbnc/xwroL4J2Aq254
X-Received: by 2002:a0c:d5d6:: with SMTP id h22mr14823288qvi.112.1540855301479;
        Mon, 29 Oct 2018 16:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540855301; cv=none;
        d=google.com; s=arc-20160816;
        b=KzrcUjGAwWJd9+cV90oXlMFKC5GfllUG5dDX9INNyM4fcfECOq9A7WwN0i8kqe7Vrk
         jzCA6E5w/ynkEtl0VyQF1TCXZ1h3liuRtiq9YoId4mB6TAeD9/ADE8w3XMCYn5i8qPSS
         wiW5zSGkEXRl/XijcETt6TczSCDwIaVidJ/xOszQvzTaaB6gjlxu75p36iBtEyrpW6Va
         nCZXwezJw6W0uihWVowhkoZZpIemr3DkIxjWcs6hYn+yRyv8zUURGQwFTh1hEESVh5LZ
         qVZFDJkCJQdUz63TmTitaMSJEfsR543XxtGQJcBudGtKZbjqoCQOUY/1ndFHLBqch7Pi
         3ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lg8jFC9+f6SG17qXP8v6YRdg+asrYckin/h9wsMD8d4=;
        b=uoIBp1G12gxop5l7vAvEMJWQWNhzVYYF8HXJcfdiTWzEyzUp68UlEMPpdhZp13jXkg
         fQNFwtWyqcpwRiOFYf/hcEgy5k2QFP0xgdzhjHrxjcqD+JEnb+6luGRBE6BPy3XOwKke
         bfwcO7p56XB5IwfMvpY+LJFSR4yx2ekfs28NEvgMW4y8g3ndxBmvq0J9PIFl8eBXU1i2
         9Fkk493QTwV5TQCCrZC5l01uu/6cQ7C1TAR94zRlZV4DYkxnXzwQ/xklA8UWwAKh5ZYm
         l4LzA8nSCgkxifcpCxg9Qz1djFPGR5VXvqG2dndWva/hRBUkrkwMbPq7M+dsf0IGyfF6
         kHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si2890640qkj.31.2018.10.29.16.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHGqq-0001Hy-Se
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqX-0001Fe-VC
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqV-0008Qy-Tp
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHGqV-0008QG-Nx; Mon, 29 Oct 2018 19:21:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13C6E58E22;
	Mon, 29 Oct 2018 23:21:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB78319489;
	Mon, 29 Oct 2018 23:21:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 00:20:58 +0100
Message-Id: <20181029232100.8454-2-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-1-philmd@redhat.com>
References: <20181029232100.8454-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 29 Oct 2018 23:21:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] hw/arm/xilinx_zynq: Use the ARRAY_SIZE macro
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iey4brrOTjsM

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xilinx_zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index f1496d2927..57497b0c4d 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
     busdev =3D SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, 0xF8003000);
     sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
-    for (n =3D 0; n < 8; ++n) { /* event irqs */
+    for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
         sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
     }
=20
--=20
2.17.2

