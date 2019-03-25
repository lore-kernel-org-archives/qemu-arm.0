Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3723799wrx;
        Mon, 25 Mar 2019 04:13:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwziMTMPR1h/rVcDKHfLo5lg9+n8Ih+ixD7VAWCey83uDs2P7PsrH3mxqn2ajTolbVYPbFo
X-Received: by 2002:a5b:986:: with SMTP id c6mr19267955ybq.363.1553512439085;
        Mon, 25 Mar 2019 04:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512439; cv=none;
        d=google.com; s=arc-20160816;
        b=l9Zxza6D2lmXKI6q0Qh84QF5/7grx5atKWhoMRgYKUfcYlmDszppHN0TuDfCiYq2NO
         g8gzT3hBmCbE3KJlsUCivckRD3tdM3NOaLkRhE/rLnL/7mtC2SvwjSGolhidR3sXWcPb
         C6pmHwhmFAvfuxEkxnR5lhgTJq8tNPDLu+7uc5lf6NSe2gxlBcc1zZqRiQjogCSexFUY
         pAYY2LTqV402WVgFsLKJarKJArkv3hiMeltG+8nsbfdbNQcbxFMjU1jfgtm8cbPdJcf3
         NFDQv6f4agVhuHoLupBWYoFxkwL5fZhK9iYYZk5Pg4qedjakkMV7vsG6N2nssR1LaqiO
         Fpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ajt52M0z2gQgSlA7q4a+YC9IAmBkuL3NAfuWIzKgydk=;
        b=dnWIPVNUhpmnsxyw98UCswQ0vtt7awNh4wadsjX/0sQ2GxjG0Eo28fjsB8Q9gU+CeQ
         Q7MEAbb6ReYQBQODX6G6N5aoQDUZBz1QCu3Iw9qXvuGh33PfOdIzITIPMRWa8YZnbq1G
         P4ONzE7RqFCVUp0nkSTv4KlZjAbJrmBjhk3K/YUkMAztkv+jo3o/iXAW0MtFU/yCIGVD
         kBkroWQH/5mJmHzaL99nmOeNF3Y/6++IXErLNFqpRqa0AlwY3m5Oe8yr461iX8dqTVXK
         e8VTNG5rKUQYcR8t7sw+YPzo3CGzKM1ro1PZ0rk8CrfIA//CPN+yvH/PK7Xu41HRqHM+
         lz2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iMsmu9kR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3dFuaE6J;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b9ti8lX+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c190si9232444ywf.397.2019.03.25.04.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iMsmu9kR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=3dFuaE6J;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=b9ti8lX+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NYE-0005nD-Dm
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:13:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNh-0005Vp-NK
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 07:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNg-00087d-K0
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 07:03:05 -0400
Received: from greensocs.com ([193.104.36.180]:38406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNc-0007uj-8I; Mon, 25 Mar 2019 07:03:01 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7F4057D78AF;
	Mon, 25 Mar 2019 12:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511756;
	bh=cHW197nSVdJdU8mrnmNppk6kPW0LZpeckZV4M1rzKSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iMsmu9kREy11cFz1q4qYLycqCMGrVIcaAL50u6ZUTZpyDxKxtmLxUurfTzQHwjdr9
	QtBBjhrVBDQMzCseJYcr8k6cXe0tBuZhWMXejNRT5TgWVO23lfn171G4j77x0mjASO
	3XmP+S93ZqLLqeCAhQgOP8q4Lvb/qipXo7LiWxhE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=3dFuaE6J;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=b9ti8lX+
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iw8qMQxap1Ud; Mon, 25 Mar 2019 12:02:35 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 500597D78B6; Mon, 25 Mar 2019 12:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511754;
	bh=cHW197nSVdJdU8mrnmNppk6kPW0LZpeckZV4M1rzKSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3dFuaE6JK0FQkbEHN+eADqTGGM986siG1DRmx50h+eTuP+6eofiTILtMmgt0HpIAO
	jFVPbsw0OzepB6zyJH6P5UCarulWcfKiSbgkGO7TZih4dJo7YOswAYQVmO2g7BbMzh
	Sq+uSdjH7QUcZA9wc3anUO6GHcZvyd2ym2iliTws=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6AE907D789E;
	Mon, 25 Mar 2019 12:02:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511753;
	bh=cHW197nSVdJdU8mrnmNppk6kPW0LZpeckZV4M1rzKSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b9ti8lX+1jB/p50Qd+i9TV7PY51AjPUyWodE4uKylVctOvIokpeZfQjtSrgebl7I2
	eOFE4wTt3/ajXzPw5FCia4PYOCO8SIt2FWpPKrsSWcR9ESOxcy2loX51iWt4LH9Kle
	tjhZHbNBphnIyJkfAkENNNq+clqokFhW0zuF68+E=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:59 +0100
Message-Id: <afa87f30396920ba2cd5fe64fb6edc96e033cb71.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 16/17] Add uart reset support in zynq_slcr
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +jWAYQxYqJSx

Add two gpio outputs to control the uart resets.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/misc/zynq_slcr.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 47f43e1d8d..5aa8f55b45 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -96,6 +96,10 @@ REG32(SPI_RST_CTRL, 0x21c)
 REG32(CAN_RST_CTRL, 0x220)
 REG32(I2C_RST_CTRL, 0x224)
 REG32(UART_RST_CTRL, 0x228)
+    FIELD(UART_RST_CTRL, UART0_CPU1X_RST, 0, 1)
+    FIELD(UART_RST_CTRL, UART1_CPU1X_RST, 1, 1)
+    FIELD(UART_RST_CTRL, UART0_REF_RST, 2, 1)
+    FIELD(UART_RST_CTRL, UART1_REF_RST, 3, 1)
 REG32(GPIO_RST_CTRL, 0x22c)
 REG32(LQSPI_RST_CTRL, 0x230)
 REG32(SMC_RST_CTRL, 0x234)
@@ -178,8 +182,14 @@ typedef struct ZynqSLCRState {
     MemoryRegion iomem;
=20
     uint32_t regs[ZYNQ_SLCR_NUM_REGS];
+
+    qemu_irq uart0_rst;
+    qemu_irq uart1_rst;
 } ZynqSLCRState;
=20
+#define ZYNQ_SLCR_REGFIELD_TO_OUT(state, irq, reg, field) \
+    qemu_set_irq((state)->irq, ARRAY_FIELD_EX32((state)->regs, reg, fiel=
d) !=3D 0)
+
 static void zynq_slcr_reset_init(Object *obj, bool cold)
 {
     ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
@@ -276,6 +286,18 @@ static void zynq_slcr_reset_init(Object *obj, bool c=
old)
     s->regs[R_DDRIOB + 12] =3D 0x00000021;
 }
=20
+static void zynq_slcr_compute_uart_reset(ZynqSLCRState *s)
+{
+    ZYNQ_SLCR_REGFIELD_TO_OUT(s, uart0_rst, UART_RST_CTRL, UART0_REF_RST=
);
+    ZYNQ_SLCR_REGFIELD_TO_OUT(s, uart1_rst, UART_RST_CTRL, UART1_REF_RST=
);
+}
+
+static void zynq_slcr_reset_hold(Object *obj)
+{
+    ZynqSLCRState *s =3D ZYNQ_SLCR(obj);
+
+    zynq_slcr_compute_uart_reset(s);
+}
=20
 static bool zynq_slcr_check_offset(hwaddr offset, bool rnw)
 {
@@ -416,6 +438,9 @@ static void zynq_slcr_write(void *opaque, hwaddr offs=
et,
             qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
         }
         break;
+    case R_UART_RST_CTRL:
+        zynq_slcr_compute_uart_reset(s);
+        break;
     }
 }
=20
@@ -432,6 +457,9 @@ static void zynq_slcr_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &slcr_ops, s, "slcr",
                           ZYNQ_SLCR_MMIO_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+
+    qdev_init_gpio_out_named(DEVICE(obj), &s->uart0_rst, "uart0_rst", 1)=
;
+    qdev_init_gpio_out_named(DEVICE(obj), &s->uart1_rst, "uart1_rst", 1)=
;
 }
=20
 static const VMStateDescription vmstate_zynq_slcr =3D {
@@ -450,6 +478,7 @@ static void zynq_slcr_class_init(ObjectClass *klass, =
void *data)
=20
     dc->vmsd =3D &vmstate_zynq_slcr;
     dc->reset_phases.init =3D zynq_slcr_reset_init;
+    dc->reset_phases.hold =3D zynq_slcr_reset_hold;
 }
=20
 static const TypeInfo zynq_slcr_info =3D {
--=20
2.21.0

