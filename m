Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5A7EDEBFB
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:22:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY85-0004il-2r; Tue, 03 Mar 2026 17:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY84-0004hx-1n
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY82-0002RE-LG
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-483a2338616so38546395e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576529; x=1773181329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TykOcg42N3v23e/MxBmcDCzlMjizZHJY8EyEUhsuAq4=;
 b=TABUdYsTokHoi+WQVS/6yiWPOL5JjNQj+HhbY1iKJKseqMTj2jee05Yxb94XXoNWIa
 yL0HfZ5/3U9HLFZyqfTKAkN+I4aXzYqphd13+ffhTFE2+Jv1yHUct71T9Uci2MrEbXhH
 bdW1IkO8/te4vmF1MKSHV1P7TDnp76rMjxIOserT8FuxHznpe6aqdFaRZgBIj/1fLW09
 jMqWqwu5bppdwHXgGsIXdUXtkFhHaHR56iyx2DqV0gwcaxfgDMPj9AgarGIjyz4J1F1f
 esp9qmrM9kB0zPODRlJBN84A5IpKvBEuJ+YWc20Y+Eo4ntPRVWRPfAnVE+q7DT8P66MC
 D4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576529; x=1773181329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TykOcg42N3v23e/MxBmcDCzlMjizZHJY8EyEUhsuAq4=;
 b=jWicPc/7Lyc7syBgOPFTn/f5Ao8fSdHxoWJwFFLEZt4BLl+0fxbtgJGnSeuT7Q0vKO
 HEiuxVXHB0L2tF6gU7Nz5NiIYezzXZeapQB8Uu0l+qDQBOOMlq4gGqO09QFbNENXXJfr
 EVvq1ysGrxeeKtK6/wjHS5q5hPJh6nm9m8ghbFMjDA1CjDCiDALVzSxSAGJS0FRj+Jup
 t+ZBEo6NvIVRZ/oreaCyP0RQfkUHxr9R3Cs+HnZWtfT2a0mLgBvWV7WMxcPgnBQSMZtK
 tEA08yn4xVnpg0aZN5emI38zFOMYilj5g6HGBxZUwdOcG1ac+A1iq83/iEVF7hyn0HBL
 cHCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuD7ywEPXXgvSNAoreoRkG9S84w7oj6jXQpzZ48INWH8lbR2+8pnkOmGUcaLIctr5Omi/2CGyK7g==@nongnu.org
X-Gm-Message-State: AOJu0YwbiWSHanRL6LEckwh1Dh6u35FdJpl9FwHoywh51fcVs2AK8MZE
 82rccHU4GqPXP5Y7Hpqp40eaebD+GpNxdWEkW86/hr6S4+ikXd57GOGR
X-Gm-Gg: ATEYQzyWuq0CcYW9SBAGfM8ux1Sf/RoFwYH+VMLZq/VhTOFetmwHRbyz70Zhvdib6HB
 9WAwgtwIcBe0pTkxmuZxHJirY0j/849lntqeaYrW6nG5cZ8Y0zCURfzsEP39hVkEkg/t9jolGJl
 1s6SyRQETSZXCl3OrFkcYkiqGNyrGQr8qwMy0m8abCafYrkfE19EAIKzxRkFEN6jJPPAjaAhjut
 ZnOyTwfyruAPt5j96KSpd20NI9RgCQZUO1DstoJ5ZYx8/5qIh/mM8y5Q6NKTinXXHaoefps3Eh5
 gxTE3Uw3UnIF4cm9MFMj9neWeJqhDep2XxqyjnHRbEMfHRP/QXHwh8DKvIGPhDah/LuclJMvAnl
 UZn3Q+KiEmnq95pMGJlEqzKmccud6wsJa7oKVz7bhEh9GA1s6RXwFwwnSBvZDsm3/UtfpBWRegA
 YfbrZnvsoudGpT+Lqb5jLP5mLptL6oyMGK5eJX0NabLDaO51SlhBF53AYWxV/5K8+OD5/FqPXjE
 K/mDTIU8XszV+kXpNnwBPeRg82fT5s=
X-Received: by 2002:a05:600c:1f91:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-483c9ba7dffmr299940525e9.1.1772576529052; 
 Tue, 03 Mar 2026 14:22:09 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:08 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/13] hw/char/serial: Reuse fifo8_num_used()
Date: Tue,  3 Mar 2026 23:21:36 +0100
Message-ID: <20260303222143.142741-7-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Avoids accessing private fields of struct Fifo8. Now, TYPE_SERIAL only
accesses struct Fifo8 through its methods.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 20f68fd2f8..2c558cb9fc 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -128,7 +128,7 @@ static void serial_update_irq(SerialState *s)
         tmp_iir = UART_IIR_CTI;
     } else if ((s->ier & UART_IER_RDI) && (s->lsr & UART_LSR_DR) &&
                (!(s->fcr & UART_FCR_FE) ||
-                s->recv_fifo.num >= s->recv_fifo_itl)) {
+                fifo8_num_used(&s->recv_fifo) >= s->recv_fifo_itl)) {
         tmp_iir = UART_IIR_RDI;
     } else if ((s->ier & UART_IER_THRI) && s->thr_ipending) {
         tmp_iir = UART_IIR_THRI;
@@ -563,8 +563,8 @@ static int serial_can_receive(SerialState *s)
              * the guest has a chance to respond, effectively overriding the ITL
              * that the guest has set.
              */
-            return (s->recv_fifo.num <= s->recv_fifo_itl) ?
-                        s->recv_fifo_itl - s->recv_fifo.num : 1;
+            return (fifo8_num_used(&s->recv_fifo) <= s->recv_fifo_itl) ?
+                        s->recv_fifo_itl - fifo8_num_used(&s->recv_fifo) : 1;
         } else {
             return 0;
         }
-- 
2.53.0


