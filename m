Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53CFC5CFC1
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 08:14:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wthcf-0007Ou-Mk; Tue, 11 Aug 2026 04:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wthce-0007Of-5w
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 04:14:08 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander@mihalicyn.com>)
 id 1wthcc-0005Ze-Di
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 04:14:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48000c5d6d3so1234356f8f.1
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mihalicyn.com; s=mihalicyn; t=1786436044; x=1787040844; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=R7S39uQxz8DgeQ+qlTnBuuwhWWQyog1pObMiQJSp9Io=;
 b=aVeaUiw4sweSHE9NX0EsZEsk0gu2/jC2TazKmWhmasFTUTpt5AdXDlAER63qtWwF84
 2IwfgUuX30umzPJX6x3b6A4GBlwAuqgJeUnGB+IBFHL6QYIy7pGUw5uJn3lVgzVPyRJs
 QzAcF7pvgtGB5TQUgeB15QYOzDLFzjpg1xf44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786436044; x=1787040844;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R7S39uQxz8DgeQ+qlTnBuuwhWWQyog1pObMiQJSp9Io=;
 b=N2dxjnX03OeSbOImzvetR/WdzuGQgV1QPuG7xFJ6Kx3nw5T4afDSg6nrt0JEPoD/w1
 lZjBa6OVtBQQJ/R89VN/Na6BCwfqXAYKm+CApMyLxK9IHbXXX8GA+R4cVWF4XZqACn+R
 3R0kPW6Ymeg2jrRIjmSHlv/fyM3Br/+6cYq6alC/Z/TZA+rvfnHTpJ2YwqUMhzeWvsSf
 lzSd7adexgA2eC2YcsPk7njTCi/8MCFpWibgIK4A8KmIgDG6+wdvCwUwc4uOWopboxP0
 X0JIuG3I0yWG5GkS8NtqJWI7ZIx1DRZxlBK/ido+AuHbMTRrtREYkGJzXNNI/qm4hhfy
 2QZg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqkkk7IZ+Cj/5VauXnvj52U6iQx5nI5wO4BqN4v+8WMAq8OBBIRC8wQs5Wc72CvrHMlEL/81YpWng==@nongnu.org
X-Gm-Message-State: AOJu0YxArw5F6Zy2enOuogkcGCIbfDTgxYBpJIFyt1IUcVzTNFh2lDkc
 UgRZ7mP6K6YkDO/JVuzMmO5ufM+Q5ldhhTXVAbgyk6XhomTsWACRttyuny32c11NQdo=
X-Gm-Gg: AR+sD13291joacVjGzTPaSlfugh0NO/o9eI/rV27gwRUMVDZCVhAWBo1FT+mYry0Y23
 kSG4QrFFQR1OjOV1qC/Njxw5KZJZMNLrUtbySpZTHPJpsBDHEsq2Ut+79qLYROIj66X5vcBE8jC
 ZItgxYK3gllrERFEghol140jxrtpbm+xdt863stfisObT+P8m9f0liQBwdmbkW/SmTcLFjex61D
 BriP943jQN7TGbhn0F9+4c7YrZnkMRgjBTPKu7n0QTERfV3sGRJd/kWUe1ZnAhddiNxIo1pvf18
 nMfSOQ5shkNd2qn82PQ7M/ptjyWjxH6WRiy/eV9ylRvGN+qr6yhYIOpEKlBuALNFQ0Dvy7XjphP
 Aj2UkHzAc1Q0P6XWEwTW6KASmI44qQyut7QT2+nTJYn0803ZmCC8YN7C0+QUvuAC56/7N2CbIU+
 7Gg9XLw0hqniM/jSN5NQjVwkR6oYIJ6g65JpscEKA+hpp9c3bwkv53PX1tMt4dHNFSLfDkpOm/y
 jgJLp7EK4uYdYSxMZ74OQRuGEx6bMZk6BnkWI4SP/pczfHxBUTcrM/85/vcsGt69rx65w==
X-Received: by 2002:a05:6000:1449:b0:47f:fd05:25a2 with SMTP id
 ffacd0b85a97d-4814ad852b5mr2490539f8f.8.1786436043345; 
 Tue, 11 Aug 2026 01:14:03 -0700 (PDT)
Received: from alex-laptop.lan
 (p200300cf574a72003269960306a2193b.dip0.t-ipconnect.de.
 [2003:cf:574a:7200:3269:9603:6a2:193b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4814a5ac75dsm2164925f8f.7.2026.08.11.01.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 01:14:02 -0700 (PDT)
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
 Alexander Mikhalitsyn <aleksandr.mikhalitsyn@futurfusion.io>
Subject: [PATCH v2] hw/char/pl011: support backend hotswap
Date: Tue, 11 Aug 2026 10:14:01 +0200
Message-ID: <20260811081401.51771-1-alexander@mihalicyn.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alexander@mihalicyn.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
v2:
	- fixed a typo in commit author name
	  [ I did `git format-patch` and copied this patch from my Raspberry PI
	    dev/test machine and it turns out that I have a stupid typo in my
	    `git config get user.name` on that machine. ]
	- added RWB tag from Alex Bennée
	- adjusted a commit message
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


