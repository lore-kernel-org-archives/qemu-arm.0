Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD016C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:49:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMnf-0003FI-8l; Fri, 21 Aug 2026 06:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wxMne-0003Et-4D
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:48:38 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wxMnc-0002iJ-B8
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:48:37 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c214e625259so118646266b.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mihalicyn.com; s=mihalicyn; t=1787309314; x=1787914114; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=F+0CD52geVbAnj+JLHfj3iZ7QCvQAELc6Kfran7U1FM=;
 b=Atc3wTth7kAIqEOpzBbLsbftFuxt8CFcKcy5l+ZAyHtGlVYyJD4UDuHn3KkITU1WdR
 RJMRqphRqNg2FbKAkWY7FyLH5Ke1TrZFBg0HfXe03bh2p7euiI40GpryVt1nDbls2ab2
 DSHJvzP9b2xwFjrEFyfVZJ0a2t9gkV5dzgrIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309314; x=1787914114;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=F+0CD52geVbAnj+JLHfj3iZ7QCvQAELc6Kfran7U1FM=;
 b=Y08YlgmpFjl82rWDjDlmzG7lQ0aPyG6F3POpmPaCnA0Gy6eDa18kQKM2YrDFMHk2gZ
 v3OQA6jTMk2HXA78RWEjQBNzkU9cCcitKbgcu6dwJ8DMHvXFaC4w3r9Xg3NJSfSXMC74
 KbEFCcfhHVYNB/pTvEoU1ntWjtD13dNz+6WzexXWMYOlzad4VlsK8ClFC2cf/hsE4Pga
 ODnbvLqvVZPQSt0qtCQ9vPubLkR1NpcZ3B8TypJuOyFel6p0IDG8EvOdxsVVEykPpAc3
 Kx50X+XN2Ry2qWdRywG9Xa4btPwIfKIDPJHqU+nza+33UMvxMaZgYcRV/luJRXh9Zd5i
 nebA==
X-Forwarded-Encrypted: i=1;
 AHgh+RorfVIzj3XnfldJMyiis0F3PqjF+AV8qEJpTuLwXZLUFDpKNAflMzT4q03mGI2I4wIMOM9MsfLh/g==@nongnu.org
X-Gm-Message-State: AFuF++kU0/hV5eaqb9d7qZ9nVGBF+nEtlqGTq9yM33RO2wBJuv37A0i5
 C59/gOagl/PSgqNwzWex8Wztpck9Far9DXRMKTbq94uFpbMBxqw44M9kOfGuH9C8XZY=
X-Gm-Gg: AR+sD126MzEFyMzm2sxvBrw/PlX4rW7PyDspMux6Z+oYU6pXKkpnQrB+zlqXybyJHc1
 zFOU0KluYRWDHCvxBmGqfkOS4t4EqpSzg9mxklW+WW128kZRivOmmD0uq2CQi8RYFSQKCadSi4d
 jckr94SJYOP4BqF3XLQokAS9zNMsPeCRzzihrBOF3vwZ2TbMbzpWhvxOCdq8ZoJC1fg7PPH1klQ
 6A0sq2PmUD/z02Z6NYU9yqtFLQPxMLD+/ovxSrULRBfhghjKpLTERnqn7K7Z/pbSNTwIRK4tH48
 muFMvyczaTnno0mYEHDM0E27EbqBRvoYPHkF6ewekTZ6Ncn5U19eM4HnR4IYOhkBaV92OV7W7Ct
 bb8pT/AV56XXSMJiggVAGQCForxn7CBtgu+07hArCBf4y5BmmLgbY0Nr+J/jJVlllwPg1H4SZ6Z
 YMM5uLhF0ZwFDKxmjVPK552pdF+/BzJbNPz8lwP9x4YPGONTlXMcz+0bCaXP77fxzAdr9K1g3Sj
 hcmZ5SOh5pVGls6hce1lqtm3s+jo2IjxjYU1GyJLzalbKFnYEhJ+J+xFe8=
X-Received: by 2002:a17:907:d649:b0:c19:6d4a:425b with SMTP id
 a640c23a62f3a-c246a626403mr490436766b.18.1787309314396; 
 Fri, 21 Aug 2026 03:48:34 -0700 (PDT)
Received: from alex-laptop.lan
 (p200300cf573be100f155523960c6bbe7.dip0.t-ipconnect.de.
 [2003:cf:573b:e100:f155:5239:60c6:bbe7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459223816sm459070266b.57.2026.08.21.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 03:48:33 -0700 (PDT)
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4] hw/char/pl011: support backend hotswap
Date: Fri, 21 Aug 2026 12:48:32 +0200
Message-ID: <20260821104832.151452-1-alexander@mihalicyn.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alexander@mihalicyn.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>

Currently, when Incus issues "chardev-change" QMP command to change
chardev backend from ringbuf to socket it receives an error (with aarch64 VM):
"Chardev user does not support chardev hotswap" [1], [2]

Let's fix this by properly implementing BackendChangeHandler for pl011.

Please, note that we have to "replay" CHR_IOCTL_SERIAL_SET_BREAK, because
if BRK bit was set before backend change (i.e. (s->lcr & LCR_BRK) is true),
then after change we need to send break to a new backend too.

Link: https://discuss.linuxcontainers.org/t/unable-to-connect-to-vm-console-on-arm-architecture/23096/3 [1]
Link: https://github.com/lxc/distrobuilder/issues/892 [2]
Reported-by: Stéphane Graber <stgraber@stgraber.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
---
v4:
	- changed pl011_set_break() signature
	  [ as suggested by Peter Maydell ]
v3:
	- introduced pl011_set_handlers()
	  [ as suggested by Alex Bennée ]
	- introduced pl011_set_break()
	  [ as suggested by Philippe Mathieu-Daudé ]
v2:
	- fixed a typo in commit author name
	  [ I did `git format-patch` and copied this patch from my Raspberry PI
	    dev/test machine and it turns out that I have a stupid typo in my
	    `git config get user.name` on that machine. ]
	- added RWB tag from Alex Bennée
	- adjusted a commit message
---
 hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index cb12c3e224f..5ad9e7358d5 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -425,6 +425,11 @@ static void pl011_loopback_break(PL011State *s, int brk_enable)
     }
 }
 
+static inline void pl011_set_break(PL011State *s, int brk_enable)
+{
+    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK, &brk_enable);
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -462,9 +467,8 @@ static void pl011_write(void *opaque, hwaddr offset,
             pl011_reset_tx_fifo(s);
         }
         if ((s->lcr ^ value) & LCR_BRK) {
-            int break_enable = value & LCR_BRK;
-            qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
-                              &break_enable);
+            bool break_enable = value & LCR_BRK;
+            pl011_set_break(s, break_enable);
             pl011_loopback_break(s, break_enable);
         }
         s->lcr = value;
@@ -660,12 +664,29 @@ static void pl011_init(Object *obj)
     s->id = pl011_id_arm;
 }
 
+static int pl011_be_change(void *opaque);
+
+static inline void pl011_set_handlers(PL011State *s)
+{
+    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
+                             pl011_event, pl011_be_change, s, NULL, true);
+}
+
+static int pl011_be_change(void *opaque)
+{
+    PL011State *s = opaque;
+
+    pl011_set_handlers(s);
+    pl011_set_break(s, s->lcr & LCR_BRK);
+
+    return 0;
+}
+
 static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
 
-    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
-                             pl011_event, NULL, s, NULL, true);
+    pl011_set_handlers(s);
 }
 
 static void pl011_reset(DeviceState *dev)
-- 
2.47.3


