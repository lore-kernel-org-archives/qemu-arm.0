Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5468645wro;
        Tue, 30 Oct 2018 04:53:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fIgR/+lCc1woPVy//PX4PnfiWXhgrIiACNydCzEuAaV5gZ9vHY+rc/W5cOiRPlTN5t1+OD
X-Received: by 2002:a0c:cdd1:: with SMTP id a17mr9783681qvn.152.1540900400026;
        Tue, 30 Oct 2018 04:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540900400; cv=none;
        d=google.com; s=arc-20160816;
        b=iv8mRqDJZmboDk8UMDDeBh+zNySDTGhjTCnemaeqTcd55WwJvCI2NIJZ9N+7M/cJ9u
         zheVEvMla8YCNxR89vbtQD+qqstlmMqq+Ie2YGGqTY2PcmXQYOQtqGo1fsCz2w4QXbou
         QagvIzWH+TRBXSYlVxHvihevZg+WZVMmImchonUmbeIN/IPj/bJEDQ8F/rkB1pW6CBC2
         2CNgDnGHApWgvcX23tLSFEEGBv5e/EHYtt9eY103e5cvOB3UW5d9nhD+tP2XTqPUW0QB
         +7MQUg+cno4sD7M6ewJzd2OrxclHKDUYZGQh7brTlIDR+jynBdmmbQuhGnDwMmAsTm7j
         lgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fsPm9vIxEj5CteFGydcqlVvCAdUCvRhi6MYiejTohKw=;
        b=wYZLscoYufbCMF0iGmh+X+WbAG2/XnNj6Zuqk0ZrSo0TpEonNmif1/LssHNsBtY9+F
         xv3wOfkNGPqJUh9OlXCDVcYc6tNaTPgTA17fNCkZPthcM2b/5H9apoQCv74ZzvzGQOuW
         6mZbJ0WP7+pI/nsI9X2P8JN3H9QpYv+PCLXuXFX809NOfwayT5R2kFEuKYg2cHPVmhBw
         fHo7b3gDuv+ZbvyFoz8ZqxJmEoi/Un/7bTQjihQ+C8Rm4WxN2gJOl6YUUMKpaTgssc1P
         QrHk6UZOBzwjE2HP/9F9f+JP/llM+fSscFkMYxcmLS9lFEWVB8s4wH1++dCgh4LwuXOL
         bOhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1-v6si7205082qkj.159.2018.10.30.04.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 04:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHSaF-0005M7-ET
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 07:53:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOQ-00015g-AW
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 07:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSOP-0003gg-Jo
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 07:41:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34162)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHSOP-0003fE-9e; Tue, 30 Oct 2018 07:41:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 531F430039BA;
	Tue, 30 Oct 2018 11:41:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 705E6611AB;
	Tue, 30 Oct 2018 11:41:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 12:40:47 +0100
Message-Id: <20181030114048.21527-2-philmd@redhat.com>
In-Reply-To: <20181030114048.21527-1-philmd@redhat.com>
References: <20181030114048.21527-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 30 Oct 2018 11:41:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] hw/arm/xilinx_zynq: Use the ARRAY_SIZE
 macro
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 284rwR0OUmPZ

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

