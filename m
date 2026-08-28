Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9AEC61DB9
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 12:14:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzvSy-0007pS-DH; Fri, 28 Aug 2026 08:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wzvSw-0007oR-BP
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 08:13:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wzvSs-0005Xf-5Y
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 08:13:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b96837ca3so4190595e9.3
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 05:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787919223; x=1788524023; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xxUQuue+45sjSBDzqHelkuxu3O0UusPEmFZcaSMD8a8=;
 b=DnoynUoMrQktgmt1h4tEE2Ln7y+KuRjbJp2yY46H8VO7Gz+4Ma+mgl25Tlvpa2nKdb
 XYw4v83aJAxFvGthcnkWvdbbXdQeIav2aY0UoS7/EalTVhxk/CTsXwH2EO+R6NBt/S2z
 2M7hmBxhMATV2nPpBMYXZDE1X6o63qozp1O96+CrBiB9EdPfesOF0d5nQA42laHWmwzT
 lZpjVXNnonKXj1eH1XhE1Khl701NmtW/enLLMGlcU3U52xBGnL4AmFgdlpSfIdu8BCVW
 1YNwiqSA6hjd6mD0+CBa05K38rcfLrRp6bI81vKBr7tlwffrvpjf52TCunWb0MoBJWz3
 Dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787919223; x=1788524023;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xxUQuue+45sjSBDzqHelkuxu3O0UusPEmFZcaSMD8a8=;
 b=NKvFlOTEEq9LUobQjIgTUUg9iEyVl9iSqDLM7bRfrE+BJpoXAqvvkuEu2rrQheZzyV
 08aXb3Di82UFstDGL4nZ7ztKRYgd65k8qjwP21ngDJxkFkvdMYs+5BCRvSsqTabg+G/L
 vgUAuP7e11IqQceEZA0L0tKQqs4bCgDObso2rxSzpCInseMH6DfJXp6nG20O1e8zqoM1
 WLUOiPzUklukTVdWwHzm+I15nlwMD690tVNsza5kf4a6nBW+QQ+bi1ypeuO0fqyiYJru
 CPDpzFfCfac0xIhXWchPVDRJ00NlfdRUoli84vUs3splzWrJJ81xidDzD5LIfE51iV5e
 DgEA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpyS4WFGghyTK8fzOmBHRyZsabq6YaJgGKJRJS7zSwxTcYF90WaishCCBqlmPVMqdkKkcyhMc4nOg==@nongnu.org
X-Gm-Message-State: AFuF++kiWwFEgGKUEVlP37esaZqJEsFVXCXSf3YFxzQYIEu7ykRVEozP
 XD7hag9K8ikeYvFISCXxVAw3mh9BK4uLrYp32Z97lCVoCH3xBV4LuCOKgsyC0Lj1zPs=
X-Gm-Gg: AR+sD12ARyNmbBRfkA/W0/52DYhq0QokxKYqBaYaJZpL79uFWq/4My3Ms/SxiMbW1LD
 RP4tHhLEH2jZIDB7m4HjlMZXUMTaIhCBJrqZxuonY0ivdHhy+jRHVrVrwiM9lrk84kpHOx7Lfip
 T/HNdquwiXBGOcNEveps7i6S71wJEhrlouA73K3Xt/S2wgSOMPGVfObWyAqsbsTEXYygrT3yjy4
 HahJEOo1Ter6sHNbqTqONhwUHKRCOYK8IsT3umoabCTXb7xSYPLj1fr/amhLxK8ixKD3F72KqCb
 Vog3LVJIyud4X7fN5zcL0ia4H8L0g2O/+7IzE2FQ8oUo01jRVIUrVDj+0v1y2Ftbd3RUyJvnXd1
 9CyGfXs7l7eLTwZw2vMpDXKCw73XZjKY/g+f1S7qtNYCITJDR7RgxzcC1ijWO2qm88HKk8RnKEa
 c0COYPIQK/Vxr/LSjO6EjB6zPBO75kLkD6pTRPlW4pXi2GvVzcMCu/jRcNg0d1
X-Received: by 2002:a05:600d:8498:20b0:499:dbae:86be with SMTP id
 5b1f17b1804b1-49b91c4de9bmr77065585e9.14.1787919223264; 
 Fri, 28 Aug 2026 05:13:43 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b92679be5sm52594735e9.3.2026.08.28.05.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 05:13:40 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3E7D05FC24;
 Fri, 28 Aug 2026 13:13:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org (open list:i.MX31 (kzm))
Subject: [PULL 4/6] char-fe: implement qemu_chr_fe_backend_name
Date: Fri, 28 Aug 2026 13:13:35 +0100
Message-ID: <20260828121337.2277303-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828121337.2277303-1-alex.bennee@linaro.org>
References: <20260828121337.2277303-1-alex.bennee@linaro.org>
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

A number of chardev users where calling qemu_chr_fe_get_driver() which
is discouraged as it blocks backend hotswap. As the pattern is common
and need for the string is transitory add a helper and keep
qemu_chr_fe_get_driver() for those that really need the funkiness of
poking around the backend setup.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260824-fixes-for-11-2-v2-4-352c6b890402@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
index 5f8a6df17dc..a82894e1d51 100644
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
+ * qemu_chr_fe_backend_name:
+ *
+ * Returns: caller freeable string or NULL
+ */
+static inline char *qemu_chr_fe_backend_name(CharFrontend *c)
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


