Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634ADCA9EC5
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 15:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGHd0-0007U1-AS; Mon, 12 Oct 2026 11:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHcz-0007Ta-Nx
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:07:49 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xGHcy-0007Ea-6o
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 11:07:49 -0400
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so1868259f8f.2
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 08:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791817667; x=1792422467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8pehCOpu14U96pPALBKxZw+FwtcRSZWqcNAlSAWQxRQ=;
 b=qi0ccwOg8f/DpNRRqkQn+x20cSbija1n7Ix7+c1WIcR0+LzrfG0NZwBMRbO7OtY8VN
 xhwDpUL4YFW0wq+mq0bS542Q5X/xwvlXwJWuCGjF+sqefJgmsQFneHJq/qx0uc0WYHsD
 oJ/hkgotXqdW5buUmrNcC1cAJPvFVMiMjzH80ORWvK1J2FcD6l16/E5a+VGCNbTVEc0U
 Wbg5CQABV21s3alSJUqisIDg98eUPxh/Al8wH4UE1FiNwUDifOgIDv5pdQhc4Icg/WA2
 JEpFzNRUN07Qbe3a2OyjlKAmZNxi5TtifpuVdBxo2k0NHB7QFSzOGuPsjC11epLHjKdE
 DaHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwq0YGFcJGyDrHTru7CA+cIosO9nuvKbV4T5SVyo5s+5J2IU5MinqQ5DEFC73YMyr0Dabm6ngYkEg==@nongnu.org
X-Gm-Message-State: AFq9FYIcCUncd20EiM9xhUMyzPP2ywFzoya34YVucNcqo2mycG3E1XSC
 i7yeQ3kKKLMG8d3YHx1dkoArvuplN0NgZfe50kJS06A++0Ra2WRWuYRm
X-Gm-Gg: AYBFou0aRKIvFvSqbriowBfKlDUR929k37CLJK+9vDaFdOUyVTCBubfv/JtPhL2Jaug
 X0K+c7AWqcKOlaDd/vn4rD6ZwlCGXk+yTV90WUujkKha8CnV/cS2hIavZz5+QkdsA0NTs/PmVAl
 J7UjytC6Fi0HdIH8Jch5rIUPh76PENK4npBGCaqxPX98XSKYHH4EtHJOneUfouJfZzjn0t682ML
 DNItq4W3wpeTFs7kCmMzLUgjTnkyT699MpIYlzbiamTRiBZR64afjrSGYGKCZEQc0v18UDBGgF7
 NG4pc2tP1V67kIyInmy1ugGaSmINT6vQ0DsX9VlpiygDl+kiJwQNnID5gAoI6sPnloZfNFo4h8n
 qBMVNLdpcj1JKOGLXdPlAIo4N+Im3j5Y8QK1qFq0yJIIH7bNhLp69i4ik62eT20acFpN5sK/PRU
 sggCUzqe++uherMtQARE7ppFF0mp1Yd880lMD6Iqdl9KHWcafsmvGml64LNS5mJMdOcZIRfiG/X
 Kg4ynH8iD0twJiYliH6hFb/IeL2iYLIXJOOi99qqFgcww==
X-Received: by 2002:a5d:4748:0:b0:488:8111:6f4e with SMTP id
 ffacd0b85a97d-48dbaaddd64mr13130331f8f.9.1791817666529; 
 Mon, 12 Oct 2026 08:07:46 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c2800sm19908900f8f.26.2026.10.12.08.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 08:07:46 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:32:08 +0200
Subject: [PATCH v2 15/50] hw/rtc: ds1338: refresh the user registers on a
 read rollover only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-bmc-minerva-v2-15-4c3dff084ec9@free.fr>
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791815520; l=1980;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=/o1Te60tyzFbC8yX3wDit9+fgGxpiXPXZOuAAft1sW4=;
 b=kyaQZtTIK81J5Ez4N+xGy9A27RRMagoh+yw19yATn0YTxSbtB3kAAMavF4+UJ9yRUSNDUzf+V
 d+tLPpQKZTtDcej5Ds+OaWkbILkMZQN/yVYOSVz3/C9IrvJvEyjeirA
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.47; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f47.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Synchronising the user buffers when the register pointer rolls over to
zero is a property of reading them; hardware routes a write to the
counters themselves. Doing it from the shared pointer increment meant a
write transfer long enough to wrap overwrote the bytes the guest had
just sent with the current time.

Move the refresh to the read path.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/rtc/ds1338.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 79bcff4599..c5fc74e6ca 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -12,6 +12,8 @@
  * Limitations:
  * - Writing the seconds register does not reset the internal countdown chain,
  *   so the sub-second phase of the clock is not modelled.
+ * - The user registers are refreshed on a START and on a read that wraps the
+ *   register pointer, but not on a STOP.
  * - Leap years follow the Gregorian rule, where the parts stop at 2100: they
  *   derive the leap year from the two-digit year alone.
  * - The model comes up with the clock running; real hardware comes up halted.
@@ -157,15 +159,7 @@ static void ds1338_inc_regptr(DS1338State *s)
 {
     DS1338Class *k = DS1338_GET_CLASS(s);
 
-    /*
-     * The register pointer wraps around after the last register; wraparound
-     * causes the current time/date to be retransferred into the secondary
-     * registers.
-     */
     s->ptr = (s->ptr + 1) % k->num_regs;
-    if (!s->ptr) {
-        ds1338_capture_current_time(s);
-    }
 }
 
 static int ds1338_event(I2CSlave *i2c, enum i2c_event event)
@@ -201,6 +195,10 @@ static uint8_t ds1338_recv(I2CSlave *i2c)
     trace_ds1338_recv(s->ptr, res);
 
     ds1338_inc_regptr(s);
+    if (!s->ptr) {
+        /* Read-only: a wrapping write must keep the bytes it just sent. */
+        ds1338_capture_current_time(s);
+    }
     return res;
 }
 

-- 
2.50.1


