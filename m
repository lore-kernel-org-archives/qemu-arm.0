Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp58462ejb;
        Sun, 17 Mar 2024 03:41:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTzkWYfmlRtIPc6l7J9BLBuAe3st/rIjtpmNMsSvv6YJ3x8VellQPN236cR7bkcmVj9JTe8PPn5yU8+0+nguUMDoHSmQXe
X-Google-Smtp-Source: AGHT+IEvnTJy8jF2lx+8t3FPPsWr1gjDGSosUG/F0V617MsFSl6Kc141dQDpPo8VXItDljxOvB9Y
X-Received: by 2002:a05:622a:293:b0:42f:1145:71f6 with SMTP id z19-20020a05622a029300b0042f114571f6mr23242273qtw.13.1710672102340;
        Sun, 17 Mar 2024 03:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710672102; cv=none;
        d=google.com; s=arc-20160816;
        b=UERMU4c+I4UALeYB6LoZ7MssRP1lFbZT7ZgJwQNNxMfNgV5ZqPbHVWp6PT0ytJFccm
         u0cEPklDKoquaU5dF6SQBa0NMgcP4XEU87FS/c87J2EnvIY9q5j5dub1pqutRX/V9gGe
         F/649dquH0HT7kiphKJo8bani6SAqc4zCWQbG7/o2eMDXtCJZy5jUNV6vfSCDIbbmPXu
         wgJi6uwvZ468col5BhxFrP+bhXZF7WIwaMX2OZIIl5NmurY8SVtWlDA02s1SPKEO7jeq
         AaGoFUiVZSZ2KGzXyaKY+VOUP+fn2IZb/epIeEsE6ivWkeZTh+13bN4QK+VhqiXbba9v
         7x0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=1onEwCpqfWs3uwQN5dyXddcXZJMtBvmrzTYx9qNJtUc=;
        fh=oFnqSTjBm9mnHO2iEUy4nxRwHSPc72uVfpVJMnLaLdw=;
        b=OW9zJBLD2sYkk2AenOBN6mS999dcKqszSIJLfvu4FKZxPLbPHKJhbXyBYMTBBvPhiV
         /87T67h+KAjbau20CoIxH/BVlNciPecQuazdUTQa0VVwmPNLJ4l9LHGV4z13jRCTxscS
         vXTxv/jJ/haDTPVNxcIWLbmKMQA/iKiQSVBqOmyHOqKUTdMZTBkC33ErIh55uvUasDUl
         pcVdTLx1YaRyKoxzJ2nBm9SOmJgn4D1irQp4MbRv+h4yWnshCTni7lXNeythGMiltKFO
         TgzYN9PaQIS/M7iMgc7HEyhUEwLMs17OYkHzKNvLSK2O6WaVLNGobCeF1fPLVMHAwoJg
         XoWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=JgxK8xvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ac85e4b000000b00430bb4b5f04si3075849qtx.776.2024.03.17.03.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Mar 2024 03:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=JgxK8xvP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rlnxT-0003C0-1N; Sun, 17 Mar 2024 06:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rlnxA-0002qG-Gf; Sun, 17 Mar 2024 06:41:23 -0400
Received: from zproxy4.enst.fr ([137.194.2.223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1rlnx5-0001PV-T8; Sun, 17 Mar 2024 06:41:18 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 59231207EB;
 Sun, 17 Mar 2024 11:41:12 +0100 (CET)
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id UDVJRWpCNm4Y; Sun, 17 Mar 2024 11:41:11 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy4.enst.fr (Postfix) with ESMTP id 822FB205F4;
 Sun, 17 Mar 2024 11:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy4.enst.fr 822FB205F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1710672071;
 bh=1onEwCpqfWs3uwQN5dyXddcXZJMtBvmrzTYx9qNJtUc=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=JgxK8xvPKc0WlTe97dUlOEyaF8teNCGdPK5hNnJnyA3GRjl/8H9kRb7PRBKAvzb8p
 EYQHE8Bd4Q02Kbl++jsIK7qqdhN7QwpMHlTwdPN615j3iTDQD+nBcQ9FLy8YZPmE2W
 7ZVR+zmYe2PXViM//d9Yimx2y27bY6ilUi2faUF4=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy4.enst.fr ([IPv6:::1])
 by localhost (zproxy4.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id Lg13qi5U1sfI; Sun, 17 Mar 2024 11:41:11 +0100 (CET)
Received: from AM-Inspiron-3585.. (cust-west-par-46-193-4-103.cust.wifirst.net
 [46.193.4.103])
 by zproxy4.enst.fr (Postfix) with ESMTPSA id E754520619;
 Sun, 17 Mar 2024 11:41:10 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>
Subject: [PATCH 5/7] hw/char/stm32l4x5_usart: Add options for serial
 parameters setting
Date: Sun, 17 Mar 2024 11:39:16 +0100
Message-Id: <20240317103918.44375-6-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240317103918.44375-1-arnaud.minier@telecom-paris.fr>
References: <20240317103918.44375-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.223;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy4.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I3ZuAit/34Tm

Add a function to change the settings of the
serial connection.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/char/stm32l4x5_usart.c | 97 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index 958d05a56d..95e792d09d 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -165,6 +165,91 @@ static int stm32l4x5_usart_base_can_receive(void *op=
aque)
     return 0;
 }
=20
+static void stm32l4x5_update_params(Stm32l4x5UsartBaseState *s)
+{
+    int speed, parity, data_bits, stop_bits;
+    uint32_t value, usart_div;
+    QEMUSerialSetParams ssp;
+
+    /* Select the parity type */
+    if (s->cr1 & R_CR1_PCE_MASK) {
+        if (s->cr1 & R_CR1_PS_MASK) {
+            parity =3D 'O';
+        } else {
+            parity =3D 'E';
+        }
+    } else {
+        parity =3D 'N';
+    }
+
+    /* Select the number of stop bits */
+    value =3D FIELD_EX32(s->cr2, CR2, STOP);
+    if (value =3D=3D 0b00) {
+        stop_bits =3D 1;
+    } else if (value =3D=3D 0b10) {
+        stop_bits =3D 2;
+    } else {
+        /* TODO: raise an error here */
+        stop_bits =3D 1;
+        error_report(
+            "UNIMPLEMENTED: fractionnal stop bits; CR2[13:12] =3D %x",
+            value);
+        return;
+    }
+
+    /* Select the length of the word */
+    value =3D (FIELD_EX32(s->cr1, CR1, M1) << 1) | FIELD_EX32(s->cr1, CR=
1, M0);
+    if (value =3D=3D 0b00) {
+        data_bits =3D 8;
+    } else if (value =3D=3D 0b01) {
+        data_bits =3D 9;
+    } else if (value =3D=3D 0b01) {
+        data_bits =3D 7;
+    } else {
+        /* TODO: Raise an error here */
+        data_bits =3D 8;
+        error_report("UNDEFINED: invalid word length, CR1.M =3D 0b11");
+        return;
+    }
+
+    /* Select the baud rate */
+    value =3D FIELD_EX32(s->brr, BRR, BRR);
+    if (value < 16) {
+        /* TODO: Raise an error here */
+        error_report("UNDEFINED: BRR lesser than 16: %u", value);
+        return;
+    }
+
+    if (FIELD_EX32(s->cr1, CR1, OVER8) =3D=3D 0) {
+        /*
+         * Oversampling by 16
+         * BRR =3D USARTDIV
+         */
+        usart_div =3D value;
+    } else {
+        /*
+         * Oversampling by 8
+         * - BRR[2:0] =3D USARTDIV[3:0] shifted 1 bit to the right.
+         * - BRR[3] must be kept cleared.
+         * - BRR[15:4] =3D USARTDIV[15:4]
+         * - The frequency is multiplied by 2
+         */
+        usart_div =3D ((value & 0xFFF0) | ((value & 0x0007) << 1)) / 2;
+    }
+
+    speed =3D clock_get_hz(s->clk) / usart_div;
+
+    ssp.speed     =3D speed;
+    ssp.parity    =3D parity;
+    ssp.data_bits =3D data_bits;
+    ssp.stop_bits =3D stop_bits;
+
+    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
+
+    trace_stm32l4x5_usart_update_params(
+        speed, parity, data_bits, stop_bits, 0);
+}
+
 static void stm32l4x5_update_irq(Stm32l4x5UsartBaseState *s)
 {
     if (((s->isr & R_ISR_WUF_MASK) && (s->cr3 & R_CR3_WUFIE_MASK))      =
  ||
@@ -318,16 +403,19 @@ static void stm32l4x5_usart_base_write(void *opaque=
, hwaddr addr,
     switch (addr) {
     case A_CR1:
         s->cr1 =3D value;
+        stm32l4x5_update_params(s);
         stm32l4x5_update_irq(s);
         return;
     case A_CR2:
         s->cr2 =3D value;
+        stm32l4x5_update_params(s);
         return;
     case A_CR3:
         s->cr3 =3D value;
         return;
     case A_BRR:
         s->brr =3D value;
+        stm32l4x5_update_params(s);
         return;
     case A_GTPR:
         s->gtpr =3D value;
@@ -409,10 +497,19 @@ static void stm32l4x5_usart_base_init(Object *obj)
     s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
 }
=20
+static int stm32l4x5_usart_base_post_load(void *opaque, int version_id)
+{
+    Stm32l4x5UsartBaseState *s =3D (Stm32l4x5UsartBaseState *)opaque;
+
+    stm32l4x5_update_params(s);
+    return 0;
+}
+
 static const VMStateDescription vmstate_stm32l4x5_usart_base =3D {
     .name =3D TYPE_STM32L4X5_USART_BASE,
     .version_id =3D 1,
     .minimum_version_id =3D 1,
+    .post_load =3D stm32l4x5_usart_base_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(cr1, Stm32l4x5UsartBaseState),
         VMSTATE_UINT32(cr2, Stm32l4x5UsartBaseState),
--=20
2.34.1

