Received: by 10.25.0.147 with SMTP id 141csp183195lfa;
        Sun, 19 Feb 2017 11:01:42 -0800 (PST)
X-Received: by 10.55.159.214 with SMTP id i205mr8615301qke.94.1487530902618;
        Sun, 19 Feb 2017 11:01:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si11571854qkb.62.2017.02.19.11.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 Feb 2017 11:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfWju-0007uM-5o
	for alex.bennee@linaro.org; Sun, 19 Feb 2017 14:01:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>) id 1cfWjn-0007uD-8u
	for qemu-arm@nongnu.org; Sun, 19 Feb 2017 14:01:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>) id 1cfWjh-0007oV-US
	for qemu-arm@nongnu.org; Sun, 19 Feb 2017 14:01:35 -0500
Received: from mail.ispras.ru ([83.149.199.45]:47358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mallachiev@ispras.ru>)
	id 1cfWje-0007gi-TK; Sun, 19 Feb 2017 14:01:29 -0500
Received: from [192.168.0.103] (nat-1-33.msu.umos.ru [85.89.127.33])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1559E54006E;
	Sun, 19 Feb 2017 22:01:03 +0300 (MSK)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <076b0d94-738e-252c-1ed8-4640a864ac34@ispras.ru>
	<CAFEAcA-zURkUb28wVA347AFJX5Wa4GyXbFSVmUDH1BSXRMA+rQ@mail.gmail.com>
	<4d2f2d04-e294-bdad-4f77-9a0171357d05@ispras.ru>
From: Kurban Mallachiev <mallachiev@ispras.ru>
Message-ID: <332706f6-7b54-89db-6b89-5684362fb2e3@ispras.ru>
Date: Sun, 19 Feb 2017 22:00:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <4d2f2d04-e294-bdad-4f77-9a0171357d05@ispras.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 83.149.199.45
Subject: [Qemu-arm] [PATCH v3] ARM i.MX timers: fix software reset
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YTnNZKx0yAgt

Hello!

Problem: function imx_gpt_reset is used for soft (requested by guest) 
and hard resets. But soft and hard resets should have different 
behaviour (hard reset should clear all registers, while soft reset 
should preserve some bits).

Patch changelog:
v1 -> v2: use different approach, patch completely rewritten
v2 -> v3: in software reset add preserving of CLKSRC bit as manual says

---
Software reset function clears CR bits that should not be cleared and
preserve bits that should be cleared.

Signed-off-by: Kurban Mallachiev <mallachiev@ispras.ru>
---
  hw/timer/imx_gpt.c | 27 +++++++++++++++++++++------
  1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 010ccbf207..3ea18ff5de 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -296,18 +296,21 @@ static uint64_t imx_gpt_read(void *opaque, hwaddr 
offset, unsigned size)
      return reg_value;
  }

-static void imx_gpt_reset(DeviceState *dev)
+static void imx_gpt_reset_common(IMXGPTState *s, int is_soft_reset)
  {
-    IMXGPTState *s = IMX_GPT(dev);
-
      /* stop timer */
      ptimer_stop(s->timer);

      /*
       * Soft reset doesn't touch some bits; hard reset clears them
       */
-    s->cr &= ~(GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
-               GPT_CR_WAITEN|GPT_CR_DBGEN);
+    if (is_soft_reset) {
+        s->cr &= GPT_CR_EN|GPT_CR_ENMOD|GPT_CR_STOPEN|GPT_CR_DOZEN|
+                   GPT_CR_WAITEN|GPT_CR_DBGEN|
+                   GPT_CR_CLKSRC_MASK<<GPT_CR_CLKSRC_SHIFT;
+    } else {
+        s->cr = 0;
+    }
      s->sr = 0;
      s->pr = 0;
      s->ir = 0;
@@ -333,6 +336,18 @@ static void imx_gpt_reset(DeviceState *dev)
      }
  }

+static void imx_gpt_soft_reset(DeviceState *dev)
+{
+    IMXGPTState *s = IMX_GPT(dev);
+    imx_gpt_reset_common(s, 1);
+}
+
+static void imx_gpt_reset(DeviceState *dev)
+{
+    IMXGPTState *s = IMX_GPT(dev);
+    imx_gpt_reset_common(s, 0);
+}
+
  static void imx_gpt_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
  {
@@ -348,7 +363,7 @@ static void imx_gpt_write(void *opaque, hwaddr 
offset, uint64_t value,
          s->cr = value & ~0x7c14;
          if (s->cr & GPT_CR_SWR) { /* force reset */
              /* handle the reset */
-            imx_gpt_reset(DEVICE(s));
+            imx_gpt_soft_reset(DEVICE(s));
          } else {
              /* set our freq, as the source might have changed */
              imx_gpt_set_freq(s);
-- 
2.11.1
