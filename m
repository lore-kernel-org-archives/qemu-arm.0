Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990B606A31B
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:28:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtlw-0006on-Qw; Thu, 05 Nov 2026 04:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtlu-0006nv-Tp
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:38 -0500
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtls-0006x0-HI
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:38 -0500
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-3ae1b34e0d2so239990a91.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870915; x=1794475715;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=81LMFnXNkVBsPiHYzPBdhJHEHa6ngHS1FUyReoYZJfU=;
 b=b25FcYo98hzVq0v7QajhXquLxLSp5rYWJRLxT7oS93G3nw2W52va0hNR3OxcyBeAzz
 q6/iv/e7dfQCmagiUS5pgzwzTAD2R9JlbaHkznBNaoTWos93A3oUd71ni9+M824PogIu
 HgUGYDqh9yS7wgkOqymWhH0/5GJk3MxGTgbmFKV5eP2g2MoRFAjoqSKqQYhzdxv614eS
 /ATA3h9gHmLfOy9QNf0QuzWDF5ufuIi1c0tq1/mYcNMMYc7RlPAcoWMwBGpqFX6dDBVi
 tuYhciyYIrN9Fm1s3gmqTOzL93+1BdjouHw85nG9AwfpXW1Q3Gb+iV/hgNkHlYzvVw0u
 kYjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNkq3Qs8I4/5j92GQVXkpsu8JesoI/STKRqPOVqCScEZ8aUBQokqhXoqA1GxpuXK9i53nCRsMoVA==@nongnu.org
X-Gm-Message-State: APuU4Z9X+2VoJyLq3SgDRhn2hWgnYRyQEnx3VacwCl4j8P9Ht/Oujemb
 cNQwaSA/g/008GwQGSBtWWtip1H6h9hlI1M+CFJioMaoctezVMwQKB7y
X-Gm-Gg: AYBFou1jDPotEJHv1/HjMrHKoO6KHkxIvCebTYpbeMGxCJkWreZYgGp9pEwycJGg56M
 fXI/RrGo5LVdIzYXaaqvgjJEo0drtF766bQADL4+vnk562TIHhi801EMXN4uwZlx76B0T9qg5g6
 N3uE0P0G5m0QpWS3UtZfH2vB6HLJPC+5FI4FdGF1FE48awLOu7lMjNBwLnjFGqifAgOfxiUJxX/
 d6igIm0t9fFJLrOa4kpWWfCV77CM+qok5ITad/m0RzZYg674zIt+UR+KFTncR1obky3A6zoSYdI
 Ve2bJlkMpTBjCEQlBn0CHG0wkJ2GuJQmqo3QJ3UQQJpUxMjWhW9RTXZVjbNAfH3nnJK5qNFVuGl
 0Kkj5AR1hbajhsHTAroKUV947tXXzYDnfKGh0+KmG2j8iVuYqlu0jBsexqPtN/Kb/P3JeWCVWYU
 m1WR8ktqJaQs1HLP49O4g0DNPG0yPgbSek3evIDrttMBYYKnwjw2GQJgYLr+7CVqfVfBFQvf4yR
 bXQJRI5CACjAWCYhoGfP2BcImbsKVqONI3wZcTqAleh5tWQNfIUXtNXTTbi1Gcdt87YDoe2Ul6d
 6b8N7xeeyIkLYJ8aLXqDJTNpLnxsyAUOb6KzXM5J9qeuCz4v9eA+g16N9eKDFnZcTqB6d8TmNi2
 5
X-Received: by 2002:a17:90b:3cc7:b0:3ae:3b3d:c617 with SMTP id
 98e67ed59e1d1-3b0afc64579mr1671344a91.29.1793870914894; 
 Thu, 05 Nov 2026 01:28:34 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b31638fdsm3090889a91.8.2026.11.05.01.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:28:34 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:45 +0800
Subject: [PATCH 06/16] hw/sensor: tmp421: implement register write masks,
 one-shot and N-factor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-6-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=5041;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=th0BNPuLtBgK0HCmTvU0Ku8z2E6KSY0kShjV+vGaOoA=;
 b=GEqE7/FhvctPDBGn5D4B7rKpWjumCg+M3j6SCP8ecrq6NXYMBCSKrMW2fzQnn25JOLirPbIXa
 K3EDj9ovzRtDCOFTXH7GnOQZejq9BFsnCbJKAv8noG/p9ri58XoG7NL
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.216.52; envelope-from=eblot.ml@gmail.com;
 helo=mail-pj1-f52.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mask out reserved and absent-channel bits on writes to the two
configuration registers and the conversion rate, accept the one-shot
trigger, and back the per-remote-channel N-factor correction registers
with real storage. The N-factor state migrates through an optional
subsection.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 5bb5043839..8c789a2a09 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -22,6 +22,16 @@
  *
  * You should have received a copy of the GNU General Public License along
  * with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * Limitations:
+ * - Conversions are instantaneous. The conversion-rate register and the
+ *   shutdown bit are stored but do not decide when a measurement appears,
+ *   and a one-shot write is accepted without scheduling anything: a read
+ *   always returns a fresh value.
+ * - The N-factor correction registers are stored and never applied. The model
+ *   has no ideality factor to correct for.
+ * - The sensor-fault OPEN bit and the PVLD bit of the temperature low byte are
+ *   never set, so neither an open circuit nor a low supply is reported.
  */
 
 #include "qemu/osdep.h"
@@ -45,6 +55,7 @@ struct TMP421State {
     /*< public >*/
 
     int16_t temperature[4];
+    uint8_t n_correct[3];   /* remote channels only */
 
     uint8_t status;
     uint8_t config[2];
@@ -86,6 +97,8 @@ OBJECT_DECLARE_TYPE(TMP421State, TMP421Class, TMP421)
 #define TMP421_CONVERSION_RATE_REG      0x0B
 #define TMP421_ONE_SHOT                 0x0F
 
+#define TMP421_N_CORRECT                0x21
+
 #define TMP421_RESET                    0xFC
 #define TMP421_MANUFACTURER_ID_REG      0xFE
 #define TMP421_DEVICE_ID_REG            0xFF
@@ -204,6 +217,11 @@ static void tmp421_read(TMP421State *s)
         s->buf[s->len++] = tmp421_temp_low(s, s->pointer - TMP421_TEMP_LSB0);
         return;
     }
+    if (s->pointer >= TMP421_N_CORRECT && s->pointer < TMP421_N_CORRECT + 3) {
+        unsigned idx = s->pointer - TMP421_N_CORRECT;
+        s->buf[s->len++] = idx + 1 < sc->nchannels ? s->n_correct[idx] : 0;
+        return;
+    }
 
     switch (s->pointer) {
     case TMP421_MANUFACTURER_ID_REG:
@@ -234,15 +252,29 @@ static void tmp421_reset(TMP421State *s);
 
 static void tmp421_write(TMP421State *s)
 {
+    TMP421Class *sc = TMP421_GET_CLASS(s);
+
+    if (s->pointer >= TMP421_N_CORRECT && s->pointer < TMP421_N_CORRECT + 3) {
+        unsigned idx = s->pointer - TMP421_N_CORRECT;
+        if (idx + 1 < sc->nchannels) {
+            s->n_correct[idx] = s->buf[0];
+        }
+        return;
+    }
+
     switch (s->pointer) {
-    case TMP421_CONVERSION_RATE_REG:
-        s->rate = s->buf[0];
-        break;
     case TMP421_CONFIG_REG_1:
-        s->config[0] = s->buf[0];
+        s->config[0] = s->buf[0] &
+                       (TMP421_CONFIG_RANGE | TMP421_CONFIG_SHUTDOWN);
         break;
     case TMP421_CONFIG_REG_2:
-        s->config[1] = s->buf[0];
+        s->config[1] = s->buf[0] & sc->config2_reset;
+        break;
+    case TMP421_CONVERSION_RATE_REG:
+        s->rate = s->buf[0] & 0x07;
+        break;
+    case TMP421_ONE_SHOT:
+        /* starts a conversion in shutdown; conversions are immediate here */
         break;
     case TMP421_RESET:
         tmp421_reset(s);
@@ -292,6 +324,24 @@ static int tmp421_event(I2CSlave *i2c, enum i2c_event event)
     return 0;
 }
 
+static bool tmp421_n_correct_needed(void *opaque)
+{
+    TMP421State *s = opaque;
+
+    return s->n_correct[0] || s->n_correct[1] || s->n_correct[2];
+}
+
+static const VMStateDescription vmstate_tmp421_n_correct = {
+    .name = "TMP421/n-correct",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = tmp421_n_correct_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(n_correct, TMP421State, 3),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_tmp421 = {
     .name = "TMP421",
     .version_id = 0,
@@ -306,6 +356,10 @@ static const VMStateDescription vmstate_tmp421 = {
         VMSTATE_INT16_ARRAY(temperature, TMP421State, 4),
         VMSTATE_I2C_SLAVE(parent_obj, TMP421State),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_tmp421_n_correct,
+        NULL
     }
 };
 
@@ -317,6 +371,7 @@ static void tmp421_reset(TMP421State *s)
      * The measured temperatures are not cleared: they model the physical
      * input the ADC re-samples after reset, and boards may preset them.
      */
+    memset(s->n_correct, 0, sizeof(s->n_correct));
     s->pointer = 0;
     s->config[0] = 0;
     s->config[1] = sc->config2_reset;

-- 
2.53.0-Meta


