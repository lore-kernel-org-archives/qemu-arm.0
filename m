Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7437CD98C8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0D1-0007do-Lb; Tue, 09 Jun 2026 13:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cd-0007Kx-MG
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cb-0001po-1Q
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTdK9UhiIM0qRwABF6UWGsM5x1elL2UrbbjIZlAcG7s=;
 b=fy+0aOJQ2WRpXC6N/DJqi9ogHzuo3V5Oi9AScJ7AgmiDAQZr59MJQjg/oH5NdRJNG7L23Y
 0RizHloUKzpFiVXY1yn11v/xIRCgX5Qg0nNcfiF7UyA5wGhwkljMdyIYsAnu4bfr1g8S2H
 RKVhtbN6yUibhIEzpYWswoYwLtMslU8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-XJIPeG_vPn6jgw8Tuz07rg-1; Tue, 09 Jun 2026 13:25:22 -0400
X-MC-Unique: XJIPeG_vPn6jgw8Tuz07rg-1
X-Mimecast-MFC-AGG-ID: XJIPeG_vPn6jgw8Tuz07rg_1781025922
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517878a92c5so128747481cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025922; x=1781630722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RTdK9UhiIM0qRwABF6UWGsM5x1elL2UrbbjIZlAcG7s=;
 b=Zh81xtlcZAqhz3ILtMV6DKeTGLDyh05slirG4VU3juDNhY/6wkzzITcKpP+HCUmMwx
 qAoQmDAXsncOxUFw/kU1JdzF2KeKMzUzxGt0X3dQK7EUETeLbyK4gOwbrqLEMrb49A/W
 zjvNnic6iIUSRd+6rOVsApznYU2/kH0w6xgEX/gaYAwjcjKSEEQ7Y8NKMgWXZ2vhy5Kr
 zsuXGiymK5PjynCrytX44Szj6P3P2T4W4eAXmFfAF/0ZapV2J6M45V1Gnm6cxXLuWsUs
 FH8T0nUgDROPfuEB7YVXYIxMPT7EqBEaTncUL3OiWL4vRCIzU28XkIw7ojr4dCEa6j78
 2YJQ==
X-Gm-Message-State: AOJu0YwCVhMYFj4wZFOKARd878a5X40tzM/uWjhBWG6hzWngxwiq8qXp
 5eZmVpx4ZXrw7emEyO+9TN4ykfsfiPYJC3AMseTzAVzPgfH3seDpF4BKyQYuOGU8+fwE/VBT59l
 Rr3xO0bIgJIUpprK2CiOi9lL+I5B7R0i65XhPxWa1YVQRWakKgksoxA==
X-Gm-Gg: Acq92OFzrSxTeCVj5W9vwqEJMlm243QMm51WGbBI9ZL0vT1urukttRf9BA46LI+FMRg
 wOSJScEEo4p+Xd2JcdtbQ+mTsyVxbfU9sx5kCmEF4c/Oo+EeUXdZxAukcMO2gLMHEP7HI8lyNT/
 Q/8vr0tLkU/yOqAD4fIt1vbcg9+0xKrVyJRVnhEMfO6Y204asgSesZWp10q4I9xo+YeNGiZeNQw
 gtHNPia6sEJVHVkcPPemghDPhp2tpLwW34zljKSieCg+CYDKP41vLq1nhxOhG00cbfiQpzYJRNe
 o5Jsb4/o4f32dgZMZuNSDal4FpTX4XVUvDzGHMXdUpkH1xzRT4DJNc1wNsUdPfuRNBK5tPMFXWE
 JCoZsutpvfMhlsNJF6HlHTIw=
X-Received: by 2002:a05:622a:1b09:b0:50e:631c:c390 with SMTP id
 d75a77b69052e-51795c5be37mr317022911cf.44.1781025922037; 
 Tue, 09 Jun 2026 10:25:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:50e:631c:c390 with SMTP id
 d75a77b69052e-51795c5be37mr317022371cf.44.1781025921523; 
 Tue, 09 Jun 2026 10:25:21 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:21 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 02/10] qdev: Export global_props()
Date: Tue,  9 Jun 2026 13:25:06 -0400
Message-ID: <20260609172514.2037645-3-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FyTyENd9kR3T5stW0e6dKK5lVr9pgEdxJnufKvCB-Tc_1781025922
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Make it accessible from outside (to apply -global properties).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/core/qdev-properties.h | 2 ++
 hw/core/qdev-properties.c         | 2 +-
 rust/bindings/hwcore-sys/lib.rs   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/qdev-properties.h b/include/hw/core/qdev-properties.h
index eba5436e53..248bbcbba7 100644
--- a/include/hw/core/qdev-properties.h
+++ b/include/hw/core/qdev-properties.h
@@ -321,4 +321,6 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
                                              const char *name,
                                              Object *val, Error **errp);
 
+GPtrArray *global_props(void);
+
 #endif
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 34d7b26a73..1d531189ec 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -958,7 +958,7 @@ void qlist_append_link(QList *qlist, Object *obj)
     qlist_append_str(qlist, path);
 }
 
-static GPtrArray *global_props(void)
+GPtrArray *global_props(void)
 {
     static GPtrArray *gp;
 
diff --git a/rust/bindings/hwcore-sys/lib.rs b/rust/bindings/hwcore-sys/lib.rs
index 8cef4a7961..85e71f5145 100644
--- a/rust/bindings/hwcore-sys/lib.rs
+++ b/rust/bindings/hwcore-sys/lib.rs
@@ -20,7 +20,7 @@
 
 use chardev_sys::Chardev;
 use common::Zeroable;
-use glib_sys::GSList;
+use glib_sys::{GPtrArray, GSList};
 use migration_sys::VMStateDescription;
 use qom_sys::{
     InterfaceClass, Object, ObjectClass, ObjectProperty, ObjectPropertyAccessor,
-- 
2.53.0


