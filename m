Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3722064wrx;
        Mon, 25 Mar 2019 04:12:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4/x7NAZ8D23n361bMvNVVpPJsOL+cnifCHnLvEXKMMOXjjoFEoQhjZFCj/gOdp3xsxlcD
X-Received: by 2002:a81:3c48:: with SMTP id j69mr317879ywa.471.1553512344399;
        Mon, 25 Mar 2019 04:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553512344; cv=none;
        d=google.com; s=arc-20160816;
        b=J/EhwhVxwUpR5uX/mfeWPY+J6nDLX0qF+IyNZWHjrPLW4UDBEDWSOAiZ649D8vjC2x
         vIgPH3E/pq/SvUJ4ax4j2uwZV96wZnTh7VP1X21Q1XrKCypFTkq5wNIB8gwlg/w+cOg7
         Awl0ZgxDuHS8Nip90diHk1Wnze7d+md0mH44EiPv37KO0p56NaXRkUMCdasb0GBAz9RL
         h+jWlHBxnG6hlJOOFAz5zFZfnkMAXQt9Fpl83ku5u7tRqmHewfnHxa8WbjEcn+FdnOiD
         OG3tFOTRmaSgonTJjBW2StYFqQRfftdf8HF1JfRZlnIBt7qJRcw0m+FmRNu+faiLGAKY
         CTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=njVAgEuhqVPzFKkaade3ZaD27Qp5nuPpFyA9dn/tVBo=;
        b=DnxsXUVknzkLPdnJuUEZHqWgPyXuj1dRzla4s3f0umaDKeQuGk7egKYDNSyLc5F3SF
         U8WgZhALqNYgNVvRIauitJJpRMAbkm7whQ+eZtNiFF0Uqr/rfBmA6AbYfIhQnFJ+LKF5
         FSMWvl+cCuitS3b3EC4GW6rMhJjjfJNvc+rvbLF0oju3NbB2FsbzRdoBkI6wl1bzAL1v
         Ri9As2V7fR3m/YsLVJj9XuT26j2IyKlwWiyrRSyOzn6KYrKMpraHyH4eedQuhG9LK7FT
         sFFwE9UdK2tK1BctAlrzLf8SGMsUNjTOanMO3Z78b5Q3BmKoT9+ox61hFXyvzu7Iecxy
         FFnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=M576576c;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dJTBW0M2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DCYeiaZ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r62si10151840ywb.268.2019.03.25.04.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=M576576c;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=dJTBW0M2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DCYeiaZ7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NWh-0004bb-Ik
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:12:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNf-0005Tb-Je
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 07:03:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNe-00085W-6G
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 07:03:03 -0400
Received: from greensocs.com ([193.104.36.180]:38379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NNW-0007sT-Uo; Mon, 25 Mar 2019 07:02:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 4CA6C7D78B5;
	Mon, 25 Mar 2019 12:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511754;
	bh=WYEcYLOEIGBkhOa2aU0abUg66uqcWe4gaMtFGotmZkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M576576ccElMb0mSy/n9bbkSbmxqkB8QdzV2s3AS2Hb149TiygRO/N5575OGSSh1J
	y+1mg4+49qijZlv1FbE4x/Ifs+XYllyFAOmQPAtYv4hmj/8VAK6g7dyKPSgJBzw4j9
	8cA/OKCqWkcbSHmDcMwD+it/C8zSvzjs0NP5l+Gw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=dJTBW0M2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=DCYeiaZ7
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwN9RSmXw0fS; Mon, 25 Mar 2019 12:02:33 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 667B17D7887; Mon, 25 Mar 2019 12:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511752;
	bh=WYEcYLOEIGBkhOa2aU0abUg66uqcWe4gaMtFGotmZkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dJTBW0M2is/2YCfUp4+QJ6ORlYrrXG/4xiGNRekIuQCYgxDQMf/5LMPXida4LJ1QY
	Oh1e+SeVA1K9vrHYYCrSUkH6egpqBQgz3ZsgJggJxr10xwBsPIF65cvN13lUz/bxDT
	Kz98GjhcOb9hGUxjoVR8kgFoSbekBVaLQvUIz8ng=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4349E7D78BC;
	Mon, 25 Mar 2019 12:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511750;
	bh=WYEcYLOEIGBkhOa2aU0abUg66uqcWe4gaMtFGotmZkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DCYeiaZ7Txq3XDAmFnR36pIeypmNDiDxPYYOvhv438a42zSd5eZyz0glG9AePRVs3
	GcBTQWWK6pQa5liMoSfC//ARoJma/8WLy8m89wm8noOCRkanDA5BSK5NSG32HGsclg
	fdTZAYC+E4od48qMSakc3XqykkOJhI4o1+gavKYE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:57 +0100
Message-Id: <052e5afb8c6cbaf6fac894ee7bfdc7ed03d38788.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [RFC PATCH 14/17] convert cadence_uart to 3-phases
 reset
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
X-TUID: EP6u6PT48jsP

Split the existing reset procedure into 3 phases.
Test the resetting flag to discard register accesses
and character reception.
Also adds a active high reset io.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/char/cadence_uart.c | 48 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fbdbd463bb..694c8ea614 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -222,6 +222,10 @@ static int uart_can_receive(void *opaque)
     int ret =3D MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE=
);
     uint32_t ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
=20
+    if (qdev_is_resetting((DeviceState *) opaque)) {
+        return 0;
+    }
+
     if (ch_mode =3D=3D NORMAL_MODE || ch_mode =3D=3D ECHO_MODE) {
         ret =3D MIN(ret, CADENCE_UART_RX_FIFO_SIZE - s->rx_count);
     }
@@ -337,6 +341,10 @@ static void uart_receive(void *opaque, const uint8_t=
 *buf, int size)
     CadenceUARTState *s =3D opaque;
     uint32_t ch_mode =3D s->r[R_MR] & UART_MR_CHMODE;
=20
+    if (qdev_is_resetting((DeviceState *) opaque)) {
+        return;
+    }
+
     if (ch_mode =3D=3D NORMAL_MODE || ch_mode =3D=3D ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
@@ -350,6 +358,10 @@ static void uart_event(void *opaque, int event)
     CadenceUARTState *s =3D opaque;
     uint8_t buf =3D '\0';
=20
+    if (qdev_is_resetting((DeviceState *) opaque)) {
+        return;
+    }
+
     if (event =3D=3D CHR_EVENT_BREAK) {
         uart_write_rx_fifo(opaque, &buf, 1);
     }
@@ -382,6 +394,10 @@ static void uart_write(void *opaque, hwaddr offset,
 {
     CadenceUARTState *s =3D opaque;
=20
+    if (qdev_is_resetting((DeviceState *)opaque)) {
+        return;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value=
);
     offset >>=3D 2;
     if (offset >=3D CADENCE_UART_R_MAX) {
@@ -440,6 +456,10 @@ static uint64_t uart_read(void *opaque, hwaddr offse=
t,
     CadenceUARTState *s =3D opaque;
     uint32_t c =3D 0;
=20
+    if (qdev_is_resetting((DeviceState *)opaque)) {
+        return 0;
+    }
+
     offset >>=3D 2;
     if (offset >=3D CADENCE_UART_R_MAX) {
         c =3D 0;
@@ -459,9 +479,9 @@ static const MemoryRegionOps uart_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
-static void cadence_uart_reset(DeviceState *dev)
+static void cadence_uart_reset_init(Object *obj, bool cold)
 {
-    CadenceUARTState *s =3D CADENCE_UART(dev);
+    CadenceUARTState *s =3D CADENCE_UART(obj);
=20
     s->r[R_CR] =3D 0x00000128;
     s->r[R_IMR] =3D 0;
@@ -470,6 +490,18 @@ static void cadence_uart_reset(DeviceState *dev)
     s->r[R_BRGR] =3D 0x0000028B;
     s->r[R_BDIV] =3D 0x0000000F;
     s->r[R_TTRIG] =3D 0x00000020;
+}
+
+static void cadence_uart_reset_hold(Object *obj)
+{
+    CadenceUARTState *s =3D CADENCE_UART(obj);
+
+    qemu_set_irq(s->irq, 0);
+}
+
+static void cadence_uart_reset_exit(Object *obj)
+{
+    CadenceUARTState *s =3D CADENCE_UART(obj);
=20
     uart_rx_reset(s);
     uart_tx_reset(s);
@@ -498,6 +530,8 @@ static void cadence_uart_init(Object *obj)
     sysbus_init_irq(sbd, &s->irq);
=20
     s->char_tx_time =3D (NANOSECONDS_PER_SECOND / 9600) * 10;
+
+    qdev_init_warm_reset_gpio(DEVICE(obj), "rst", DEVICE_ACTIVE_HIGH);
 }
=20
 static int cadence_uart_post_load(void *opaque, int version_id)
@@ -532,6 +566,10 @@ static const VMStateDescription vmstate_cadence_uart=
 =3D {
         VMSTATE_UINT32(rx_wpos, CadenceUARTState),
         VMSTATE_TIMER_PTR(fifo_trigger_handle, CadenceUARTState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections =3D (const VMStateDescription * []) {
+        &device_vmstate_reset,
+        NULL
     }
 };
=20
@@ -546,9 +584,11 @@ static void cadence_uart_class_init(ObjectClass *kla=
ss, void *data)
=20
     dc->realize =3D cadence_uart_realize;
     dc->vmsd =3D &vmstate_cadence_uart;
-    dc->reset =3D cadence_uart_reset;
+    dc->reset_phases.init =3D cadence_uart_reset_init;
+    dc->reset_phases.hold =3D cadence_uart_reset_hold;
+    dc->reset_phases.exit =3D cadence_uart_reset_exit;
     dc->props =3D cadence_uart_properties;
-  }
+}
=20
 static const TypeInfo cadence_uart_info =3D {
     .name          =3D TYPE_CADENCE_UART,
--=20
2.21.0

