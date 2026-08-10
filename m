Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0054EC5AD7B
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Aug 2026 12:51:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtPTc-00062R-3D; Mon, 10 Aug 2026 08:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wtOuh-00073R-QC
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 08:15:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wtOug-0001Db-21
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 08:15:31 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-480033bdcf4so986351f8f.2
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mihalicyn.com; s=mihalicyn; t=1786364127; x=1786968927; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f6w3W8atRrqKQaVtE38r1TC6G0N7Trc9YGRXReVzOaM=;
 b=Mt4zGmnCU68zW8MlTtoBaP+B/vDb6uKKVz9QDsblwdmQMIhEMSBQMJQyP5CkJI4lsL
 FNdr11WeFjPk+xIv9WWDphR8sE7jTd0XLJ0R2w+jQCZzlG0iie50atbRyodbLRmkOe0Z
 XxZxoEqzUpDokosobyBOjyzL+52xZgkZD/ejo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786364127; x=1786968927;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=f6w3W8atRrqKQaVtE38r1TC6G0N7Trc9YGRXReVzOaM=;
 b=WbvSDz5pW/E4nQ7E8KMSisKh8i6LEcT7aypQ2SYaZg+C3dTmmh+nNfJGcCTqChI3us
 WoWgOuI1g4QFSiZZghWauYxy9UgJckUhzq+ov9M6Yuj2LxwAuzTKx3sq+TS2f3HWPyap
 u0ZJS4mbO8aHXpCsPCXGFAQrB9TcDC0d6YvKIwZV355jhaTBhftEFWxX2ciEPM1npkGt
 EUlQh2QKd2qG7qk0ENF07LLt287iB64d4zR6V3Ac7qYEX626UtvF/OoyE9Yq+ivJqvvf
 5A8SB/VD0mZrqyUmygjtCl9LoQ043m8XosuXq10mMPjBTmmPM2kF6RNgbjtkMRnvo/Kj
 CwaA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoCLWf2x2ZYSLZJBSlxHT4VBI9N4XCS2bYtt04Wob+RuUs5YrXR6+QxuU4rcfRxmOBO1FLWQ/GpWg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2HhH9etvINGLQ+6cPONw5YZnmffp12nQwG/uD4wW4HWNQnFYo
 KN/eVyh1GHUrtyw1f5mDehQJcVf9G3KYG1QpRm6i3bb33K9t5ovGVxx1adVxdhImNAM=
X-Gm-Gg: AR+sD12nLoUrNls0V/5lLBbqptJvY4k3/ZFIbnDPXOs51jarg+hN26177Dywsvgj/xB
 lChxHBUoW2qFNsizAt7F/zsXh8LALtE0usxOGKz+WXsPoX2rDOFeT6m/qwbUyLBsSHdTtu2r6vH
 byBK3PTEtu/+ZSNlGx5pg93/g/6cAYAP91xfu0kHgDCxkj7HdydMMDDjN0xcigpbIDAa2iXCQ/I
 UtIJP/NZ+Y+ak33LdudcXP0G2r2Okb820lR33PfL5dr4/D6LhI41p2UFkmcFUJu2Cu16ZHOd/D6
 T6y/cb3hs306i6nu6qL0tmRdvvJpq3TzT8UZ1mLUutR5+Rs4RYW3Yh2VdR/QwFfw2F5X0doWiYK
 TK3wR3JCOep52939tzhSukxrItyaj0CzVhBrPPZx3y0DjWXUNoGOCvG/Oamr1wvGYjbd5W/Bqjq
 7CeBJ9mO85RgJ0sEwQ8AYWON84VKFghd9VQwNTosZVAOF9/c0mMhxCLdh2Wbn353/d7eAfY5Dz8
 s+Wza0PSe7y8J8TdvXrq9tTgpD0KR9GoGn8i+ahQweX9aXUPK+3rd0mJ4JD
X-Received: by 2002:a05:6000:29c6:b0:47f:6e23:64d6 with SMTP id
 ffacd0b85a97d-4814562d12bmr1632037f8f.16.1786364127476; 
 Mon, 10 Aug 2026 05:15:27 -0700 (PDT)
Received: from alex-laptop.lan
 (p200300cf574a7200f46c63e7a2c45b35.dip0.t-ipconnect.de.
 [2003:cf:574a:7200:f46c:63e7:a2c4:5b35])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-480021506cbsm35872061f8f.14.2026.08.10.05.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 05:15:26 -0700 (PDT)
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Aleksanr Mikhalitsyn <alexander@mihalicyn.com>,
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Subject: [PATCH] hw/char/pl011: support backend hotswap
Date: Mon, 10 Aug 2026 14:15:25 +0200
Message-ID: <20260810121525.100540-1-alexander@mihalicyn.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alexander@mihalicyn.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Aug 2026 08:51:31 -0400
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

From: Aleksanr Mikhalitsyn <alexander@mihalicyn.com>

Currently, when Incus issues "chardev-change" QMP command to change
chardev backend from ringbuf to socket it receives an error (with aarch64 VM):
"Chardev user does not support chardev hotswap" [1], [2]

Let's fix this by properly implementing BackendChangeHandler for pl011.

Link: https://discuss.linuxcontainers.org/t/unable-to-connect-to-vm-console-on-arm-architecture/23096/3 [1]
Link: https://github.com/lxc/distrobuilder/issues/892 [2]
Reported-by: Stéphane Graber <stgraber@stgraber.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
---
 hw/char/pl011.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index cb12c3e224f..3622248ec0c 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -660,12 +660,26 @@ static void pl011_init(Object *obj)
     s->id = pl011_id_arm;
 }
 
+static int pl011_be_change(void *opaque)
+{
+    PL011State *s = opaque;
+    int break_enable = s->lcr & LCR_BRK;
+
+    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
+                             pl011_event, pl011_be_change, s, NULL, true);
+
+    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
+                      &break_enable);
+
+    return 0;
+}
+
 static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
 
     qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
-                             pl011_event, NULL, s, NULL, true);
+                             pl011_event, pl011_be_change, s, NULL, true);
 }
 
 static void pl011_reset(DeviceState *dev)
-- 
2.47.3


