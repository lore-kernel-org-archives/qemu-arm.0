Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9389EC5AD7B
	for <qemu-arm@archiver.kernel.org>; Mon, 10 Aug 2026 15:35:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtS22-0001HI-Qb; Mon, 10 Aug 2026 11:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wtS20-0001Gy-3O
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 11:35:16 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wtS1y-0005BY-8j
 for qemu-arm@nongnu.org; Mon, 10 Aug 2026 11:35:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso9684135e9.2
 for <qemu-arm@nongnu.org>; Mon, 10 Aug 2026 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786376111; x=1786980911; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=evoH7tn9HwlReMqq40LV/1k6FhTDd6/nIyj6oxDghDo=;
 b=OyawgGg4YLBxK7TbR2a6sra1r/Mih502xxF1tCwNL6KRGDhTNM3CXHY3MF9qA9yb+l
 mLX76eahxc9qkzUgTP7rtFVBE0/BiRQy2iGF6ifTbGX1tkryKmOHVpij4TGsmMCG953o
 WZhX+5+j8J7E7HqlwIWOhK4ZQ7/KBQ3iJyqx0ITTBU10hNksm5sPn2q7XM6VHl20dIIs
 +eL/ZTyANJSpSMlBwke1It8dj947YGtA2zVXEMpNeiCwn5RyAI4Lyt56Ql5Ll/DPlLZm
 KaXBbUA652v7yni+TCB00bz0iIt12IoLyF6/3P1d6MBu0eW2k3yXt7klMXA45WBdTx1G
 gnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786376111; x=1786980911;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=evoH7tn9HwlReMqq40LV/1k6FhTDd6/nIyj6oxDghDo=;
 b=ns3X8Hhvcfp8LLkJGvh4OScTQ3l+P+97lNA2wLG5KI2TrO0L8BI7NQMbBP7OtaRWr5
 2ehvgk6znRZGC9NCnDiX7cq6hxrQULAakoYhMopP2PnixHZGOuVEO+ZbtTBwcGPM5cHc
 tkJeHncY2k3XZgDumBajBXaLFUHXIyFDZA29p387QWpX/DaaMt2gWGdpkbZsrEmQwLtZ
 KhNE7WkWndxwYZJ/i4V2QBB8YlYzXpZXhHCX/pNvGSWWVaWbv7NBlclxAfnM5DsbLFDr
 U2ZmbSjoT2pV+0mZrgXmiZ9jobFNXuZtNYNr6jjITdDif+in8tgiyz/x3N0PfsqKvSZN
 Vpag==
X-Forwarded-Encrypted: i=1;
 AHgh+RqiZrIL0z1uSCJZ+MkosTTVGimO4qo7Szf3Uz3kuda2Y8Q7OkH60uGGwEuzJC/HkfXI6Ea4uecqSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyBOUSafoLQB5a3G99wbZtaHH2tHxH9MYaiJa1cPR8RJA02818r
 CFzS+NdS2FnHE8wQwcgybH4dY1zjbp3XyNrVDraNl6jjH0aBzlq1D6nXCB64Hyiq3vY=
X-Gm-Gg: AR+sD11nz55OUTktOsIkksQaVJrSiQ/E2CQa4ngJfu/GL2dl6k6VF5NxpReTc5PkEdq
 gRR1QmQRBmGp9wkIjCG2/8IhDXLoVBeg3Za8PQxoeArsWXIwLfuc/M8GuqLmzPTGzyna6kU9ON7
 nZZOzc5fnMuwoY2GGmvBAIS8GSwrw0KGd5/Mq3IS8lTODrD6uWRA4ZaJNI3mt/MNvDtDGGMzBl5
 /mZSOwuCtJes88Odrtfn/FdHjsA7CcV5nVtwAEDk0jfqVn4yiU3Q4lS9B8XQ2BMyLhBJhJxwpNn
 EFHp3XmuDLFZUO71ooaW41aDJEY0AtxXOlI7NFaEUB64UO/eloslmibfKveWGOUTlk1/aS76RMg
 GUE89QqY8+HP498QLzoNBcLoU/qfr9bWpq0/UQ4NZ3j0RHzdApChJIId77emC0SgQLhPqjVTjoX
 yasQwHg6pHUEkqMYpSFyKjdNKAnm5/oKYI/t+IfnFBPvUgF7I13IZVHs7oE51R
X-Received: by 2002:a05:600c:474a:b0:496:c361:fb96 with SMTP id
 5b1f17b1804b1-4994e6db5aemr522903295e9.0.1786376111158; 
 Mon, 10 Aug 2026 08:35:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002150952sm31646699f8f.15.2026.08.10.08.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 08:35:10 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5A0FE5F83B;
 Mon, 10 Aug 2026 16:35:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:i.MX31 (kzm))
Subject: [RFC PATCH] char-fe: implement qemu_chr_fe_backend_name
Date: Mon, 10 Aug 2026 16:35:02 +0100
Message-ID: <20260810153503.2652324-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

A number of chardev users where calling qemu_chr_fe_get_driver() which
is discouraged as it blocks backend hotswap. As the pattern is common
and need for the string is transitory add a helper and keep
qemu_chr_fe_get_driver() for those that really need the funkiness of
poking around the backend setup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/chardev/char-fe.h       | 13 ++++++++++++-
 backends/cryptodev-vhost-user.c |  8 +-------
 backends/rng-egd.c              |  8 +-------
 backends/vhost-user.c           |  8 +-------
 hw/char/imx_serial.c            |  4 ++--
 5 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 5f8a6df17dc..13218d04c8d 100644
--- a/include/chardev/char-fe.h
+++ b/include/chardev/char-fe.h
@@ -52,7 +52,8 @@ void qemu_chr_fe_deinit(CharFrontend *c, bool del);
  * associated Chardev.
  * Note: avoid this function as the driver should never be accessed directly,
  *       especially by the frontends that support chardevice hotswap.
- *       Consider qemu_chr_fe_backend_connected() to check for driver existence
+ *       Consider qemu_chr_fe_backend_connected() to check for driver
+ *       existence or qemu_chr_fe_backend_name() if you need the name.
  */
 Chardev *qemu_chr_fe_get_driver(CharFrontend *c);
 
@@ -70,6 +71,16 @@ bool qemu_chr_fe_backend_connected(CharFrontend *c);
  */
 bool qemu_chr_fe_backend_open(CharFrontend *c);
 
+/**
+  * qemu_chr_fe_backend_name:
+  *
+  * Returns: caller freeable string or NULL
+  */
+static inline char * qemu_chr_fe_backend_name(CharFrontend *c)
+{
+    return (c->chr && c->chr->label) ? g_strdup(c->chr->label) : NULL;
+}
+
 /**
  * qemu_chr_fe_set_handlers_full:
  * @c: a CharFrontend
diff --git a/backends/cryptodev-vhost-user.c b/backends/cryptodev-vhost-user.c
index cc478d9902d..3334e280a27 100644
--- a/backends/cryptodev-vhost-user.c
+++ b/backends/cryptodev-vhost-user.c
@@ -373,13 +373,7 @@ cryptodev_vhost_user_get_chardev(Object *obj, Error **errp)
 {
     CryptoDevBackendVhostUser *s =
                       CRYPTODEV_BACKEND_VHOST_USER(obj);
-    Chardev *chr = qemu_chr_fe_get_driver(&s->chr);
-
-    if (chr && chr->label) {
-        return g_strdup(chr->label);
-    }
-
-    return NULL;
+    return qemu_chr_fe_backend_name(&s->chr);
 }
 
 static void cryptodev_vhost_user_finalize(Object *obj)
diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 1d92bd71cf7..c2207f40c5c 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -126,13 +126,7 @@ static void rng_egd_set_chardev(Object *obj, const char *value, Error **errp)
 static char *rng_egd_get_chardev(Object *obj, Error **errp)
 {
     RngEgd *s = RNG_EGD(obj);
-    Chardev *chr = qemu_chr_fe_get_driver(&s->chr);
-
-    if (chr && chr->label) {
-        return g_strdup(chr->label);
-    }
-
-    return NULL;
+    return qemu_chr_fe_backend_name(&s->chr);
 }
 
 static void rng_egd_finalize(Object *obj)
diff --git a/backends/vhost-user.c b/backends/vhost-user.c
index 380d8250233..46dadb74800 100644
--- a/backends/vhost-user.c
+++ b/backends/vhost-user.c
@@ -152,13 +152,7 @@ static void set_chardev(Object *obj, const char *value, Error **errp)
 static char *get_chardev(Object *obj, Error **errp)
 {
     VhostUserBackend *b = VHOST_USER_BACKEND(obj);
-    Chardev *chr = qemu_chr_fe_get_driver(&b->chr);
-
-    if (chr && chr->label) {
-        return g_strdup(chr->label);
-    }
-
-    return NULL;
+    return qemu_chr_fe_backend_name(&b->chr);
 }
 
 static void vhost_user_backend_class_init(ObjectClass *oc, const void *data)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index fb41ee2ac50..8ac4efbb5e9 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -278,10 +278,10 @@ static void imx_serial_write(void *opaque, hwaddr offset,
                              uint64_t value, unsigned size)
 {
     IMXSerialState *s = (IMXSerialState *)opaque;
-    Chardev *chr = qemu_chr_fe_get_driver(&s->chr);
+    g_autofree char *label = qemu_chr_fe_backend_name(&s->chr);
     unsigned char ch;
 
-    trace_imx_serial_write(chr ? chr->label : "NODEV", offset, value);
+    trace_imx_serial_write(label ? label : "NODEV", offset, value);
 
     switch (offset >> 2) {
     case 0x10: /* UTXD */
-- 
2.47.3


