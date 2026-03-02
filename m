Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC189C624C2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:24:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU8-0001Lu-AB; Mon, 02 Mar 2026 04:22:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU6-0001Kf-TW
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzU5-0007i1-0G
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-480706554beso48648805e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443355; x=1773048155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvpDgdF204oqNvD9LAg+6U4IK6hUPz8IBO7coI28nAM=;
 b=p1poQJtzZ53Wz/z5JhnBfLiyioRCICH7NRRfljHAYdbLSjkUklueh64j4YdG4uPbzJ
 IzupAVWj/XVfbuAd0IUc7nL+TTbhzK77gdAPOxMD9ixm6+R0hTlAA3nRFulqbTdBNT4p
 Vg4a855tXOld6pwYuK9Th8p+XqiCUXSBnnt+WO/R+QqIb3Tjul4SJg8/h8NInLo22/Hx
 kIj8bBE6yoEsK0x2epFB4i5s6plUMxuul8Ky4ZBUzLEmnPkBIec9tO+FMX88Zs3v0Cu+
 aInFAS6vflWrW0kh/YejnyyT1wOyr2lq7eWj4rE8/3UUl5eq15WRSTrTpJlGkom+q9BD
 CaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443355; x=1773048155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XvpDgdF204oqNvD9LAg+6U4IK6hUPz8IBO7coI28nAM=;
 b=iCQNGMP94cFOxMhq9QBQiFDs14g5qhmROqRpxFpZgi0oT3kjk8DjfkEOP+8BW/6EqQ
 T2Y+4j0V+TIBwzKWk0TiRYeWIretC+O8KBrPRvt0jjB9oL7c6da/eGbWkL077d2EXA2o
 JX8MRv6NkARAm0D9h2G5J+rppeVDT2Fzx/irtEkww6f7p3HJyP8EKjBc7MnOgsLzFuV9
 Z10ulLocyRg02Mfi6T9/pWzXR+y/b95Zx3iQe2zmLHX7ZFj72glWNPTBM5714Ybir5SZ
 bKFMBx4keF7crbtsUY/PNMpoB08vJz7pTw39v03WoRrw3WSMi1wTyUkMio8xBxBd3eue
 XgyQ==
X-Gm-Message-State: AOJu0Yw+rQCggnhFjd2LbHCxRnROn5xzPQE7quV61nckkq62BsTEyKMc
 XV8FdLW/Y0k805s0p9Kl5tuQ7kWgMDJwgfqxKAXi6iXuCYCH4lhuN75LzV2NbuUgyWn0BvtOFNz
 kINAk
X-Gm-Gg: ATEYQzz68DI4I9Zt549vbCQdp4g52lShuZ9Op54G743aBo5kIktAfH2oWqtWJmv3FEE
 qiNl54+ssVBELxs2UkTdWjsx9p/ZMZFq4V5WvVjUvA9Uv6hcl+yvFap3Eulu+PeI+mmRJhWc0eY
 YsmlwBWEclq7whwAA5+PQyDJrKuflpvRBASOpHNXmlANKJbcyJ2abIVhBltqu46jyAGUobWRQlL
 qpQXeDur4ZYlfONrn5XdTBZrcepDsg+UapICvr4arKCEUWuaXdI5Cs9diG0vDJ+BUp0VKUoDFlb
 /FQSnb2+egCyFhqC5wCcnUR5Zq/2eA2QREnLDsdpkYKGqD+hKpcZmMgZHPaqUBeh0QEvlbboyTj
 v4gCHPnUUObXZ56lKmYogEhpIuCICX7vWI0R4ZVUS/fGzMxwGCMSbQrijW7NNm1MoJ9dAKhk3Gt
 jj+kl/C68U7JNNvjjGid4p4o0jgwwjXVtDO3/MIeVU3fqxcTHcrXKHTcwyopMjb5yxSZodTMibt
 S712Cd0SokMYVXmGbWkrKcsDwUMvbE=
X-Received: by 2002:a05:600c:4e56:b0:477:5cc6:7e44 with SMTP id
 5b1f17b1804b1-483c9b9eaddmr206430225e9.11.1772443355359; 
 Mon, 02 Mar 2026 01:22:35 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 7/9] chardev: Consolidate yank registration
Date: Mon,  2 Mar 2026 09:22:23 +0000
Message-ID: <20260302092225.4088227-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302092225.4088227-1-peter.maydell@linaro.org>
References: <20260302092225.4088227-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Fabiano Rosas <farosas@suse.de>

There's currently five places where the yank function is being
registered and they all come right before tcp_chr_new_client(). Fold
them into it.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
[PMM: rebased]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 chardev/char-socket.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 4e82915cf1..e064b105c5 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -905,6 +905,12 @@ static int tcp_chr_new_client(Chardev *chr, QIOChannelSocket *sioc)
     s->sioc = sioc;
     object_ref(OBJECT(sioc));
 
+    if (s->registered_yank) {
+        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
+                               char_socket_yank_iochannel,
+                               QIO_CHANNEL(sioc));
+    }
+
     if (s->do_nodelay) {
         qio_channel_set_delay(s->ioc, false);
     }
@@ -943,11 +949,6 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
     }
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    if (s->registered_yank) {
-        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               char_socket_yank_iochannel,
-                               QIO_CHANNEL(sioc));
-    }
     ret = tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return ret;
@@ -962,11 +963,6 @@ static void tcp_chr_accept(QIONetListener *listener,
 
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     tcp_chr_set_client_ioc_name(chr, cioc);
-    if (s->registered_yank) {
-        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               char_socket_yank_iochannel,
-                               QIO_CHANNEL(cioc));
-    }
     tcp_chr_new_client(chr, cioc);
 }
 
@@ -982,11 +978,6 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
         object_unref(OBJECT(sioc));
         return -1;
     }
-    if (s->registered_yank) {
-        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               char_socket_yank_iochannel,
-                               QIO_CHANNEL(sioc));
-    }
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
     return 0;
@@ -1002,11 +993,6 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc = qio_net_listener_wait_client(s->listener);
     tcp_chr_set_client_ioc_name(chr, sioc);
-    if (s->registered_yank) {
-        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               char_socket_yank_iochannel,
-                               QIO_CHANNEL(sioc));
-    }
     tcp_chr_new_client(chr, sioc);
     object_unref(OBJECT(sioc));
 }
@@ -1180,11 +1166,6 @@ static void tcp_chr_connect_client_async(Chardev *chr)
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc = qio_channel_socket_new();
     tcp_chr_set_client_ioc_name(chr, sioc);
-    if (s->registered_yank) {
-        yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
-                               char_socket_yank_iochannel,
-                               QIO_CHANNEL(sioc));
-    }
     /*
      * Normally code would use the qio_channel_socket_connect_async
      * method which uses a QIOTask + qio_task_set_error internally
-- 
2.43.0


