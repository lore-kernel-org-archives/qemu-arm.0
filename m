Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp597275ejb;
        Fri, 28 Jul 2023 09:39:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHzs8sCOkHZqagADLU1mbEBow8Vgty2JIhtW9DsFLFr50a4D2VQrGdlk4Gmg5Whr28DsKdr
X-Received: by 2002:a05:622a:1353:b0:403:a1d4:deb with SMTP id w19-20020a05622a135300b00403a1d40debmr4482046qtk.41.1690562365930;
        Fri, 28 Jul 2023 09:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690562365; cv=none;
        d=google.com; s=arc-20160816;
        b=Yjxb4cNeVxMWhsTJhF+fw9Wkz6n6VTybn0nLRcTyfC3suhcYc/sA1exsCIhED5ugge
         Mkrk/6X8UF7Iw5qpwQygM9skek7XGh6rCd5eWtud4/s+ncBJLYFsR0qMErJfpK5OW1pR
         IDXN/SLQH+dizoyOsWg88xzz2aG+wBM03e8zPbKURKsGNk1qiaViYSqlmWIWFT0sbiUD
         371o9NDCGVYTwJJpbX2L2nrdoFBk30qAxsNbkGd8T6h8gwETKzx2jriyMhgcDoO1D3x3
         QvQVL4xMPEWf9GmF6uOsCCBtCLz2rDG57h9+1FVtl2gzCTucuausXxNuYcZvKxJzi3lY
         FWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=8kaga0Tq1DHDgh2bcs3qrXwpLVkm/Jqm49BzCQmqlWk=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=zB32M3gsW2FbRb2Vk3JNC4KEADycmVwgmstOmexChn6+dcUcN56qGkopDxhlAY45eF
         MJlSnRkLAuYVLAnaiHZmZv7Vwa73Rt0K0sG3AB3IhPSvPL95IDdLKAy6dG14uOF4u3I4
         gGh0qUmDnYTBQ3+GzIwFbyvVmtr1b6CEzpa8KZO/iR9u3nAiOdjpwBUQjtZcX6tlAGNH
         ODVQJ03BXcWcZuKdxJ8WOqgphVvvNy/+nowol+O9PyfLaBt0k08aU7NXTIcDxNZM1yGm
         NeJeTVu/DDv5XDvG8+qwgspbZLlBLBPZSk3xlrHW61bhV/39L8o05/3iz2zrWe5x0MFV
         y59w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=2Jo1oVGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05622a038600b004034b7077d7si2494292qtx.399.2023.07.28.09.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:39:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=2Jo1oVGt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPPxx-0004yK-CX; Fri, 28 Jul 2023 12:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxv-0004wy-Ls
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:19 -0400
Received: from mail-4018.proton.ch ([185.70.40.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxt-0004eW-PV
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:19 -0400
Date: Fri, 28 Jul 2023 16:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560315; x=1690819515;
 bh=8kaga0Tq1DHDgh2bcs3qrXwpLVkm/Jqm49BzCQmqlWk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=2Jo1oVGtvnE43xpCXAZ7SDPwA0zFniUbeIh8ggtQZcHHqMM4jUjAzTHDnwHqNuQOI
 LrEoNcgeB1uuZb/MdrpwTlI56qPXLCeDJkNLs6kctNBbh3oqez5+ZzSd7qGglz55Fo
 BSJN17nXfpISwsi/DGSEwF8Gr/OW/+KaHivduaRQXQLFqaXITXu8jdRydlu+TZWuIG
 KyVCu2YzqNvkD2HyxOgVR40ZB7vtFV+C5IVuaNm92ybGYra+q/4faVPTwo0ST6n8kF
 p30DrAQmGELXgv+ehIJUC7LgfetFp5xs5ECY9+RzbheaQhC9ziavEf59ulAvbbzLF/
 w6vTEGGtG1omw==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 3/6] qtest: implement named interception of out-GPIO
Message-ID: <20230728160324.1159090-4-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
References: <20230728160324.1159090-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.18; envelope-from=chris@laplante.io;
 helo=mail-4018.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MAFkppuOHbcR

Adds qtest_irq_intercept_out_named method, which utilizes a new optional
name parameter to the irq_intercept_out qtest command.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 softmmu/qtest.c        | 18 ++++++++++--------
 tests/qtest/libqtest.c |  6 ++++++
 tests/qtest/libqtest.h | 11 +++++++++++
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 1b86489162..0f1d478bda 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -397,8 +397,10 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
         || strcmp(words[0], "irq_intercept_in") =3D=3D 0) {
         DeviceState *dev;
         NamedGPIOList *ngl;
+        bool is_outbound;
=20
         g_assert(words[1]);
+        is_outbound =3D words[0][14] =3D=3D 'o';
         dev =3D DEVICE(object_resolve_path(words[1], NULL));
         if (!dev) {
             qtest_send_prefix(chr);
@@ -417,14 +419,14 @@ static void qtest_process_command(CharBackend *chr, g=
char **words)
         }
=20
         QLIST_FOREACH(ngl, &dev->gpios, node) {
-            /* We don't support intercept of named GPIOs yet */
-            if (ngl->name) {
-                continue;
-            }
-            if (words[0][14] =3D=3D 'o') {
-                int i;
-                for (i =3D 0; i < ngl->num_out; ++i) {
-                    qtest_install_gpio_out_intercept(dev, ngl->name, i);
+            /* We don't support inbound interception of named GPIOs yet */
+            if (is_outbound) {
+                /* NULL is valid and matchable, for "unnamed GPIO" */
+                if (g_strcmp0(ngl->name, words[2]) =3D=3D 0) {
+                    int i;
+                    for (i =3D 0; i < ngl->num_out; ++i) {
+                        qtest_install_gpio_out_intercept(dev, ngl->name, i=
);
+                    }
                 }
             } else {
                 qemu_irq_intercept_in(ngl->in, qtest_irq_handler,
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index c22dfc30d3..471529e6cc 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -993,6 +993,12 @@ void qtest_irq_intercept_out(QTestState *s, const char=
 *qom_path)
     qtest_rsp(s);
 }
=20
+void qtest_irq_intercept_out_named(QTestState *s, const char *qom_path, co=
nst char *name)
+{
+    qtest_sendf(s, "irq_intercept_out %s %s\n", qom_path, name);
+    qtest_rsp(s);
+}
+
 void qtest_irq_intercept_in(QTestState *s, const char *qom_path)
 {
     qtest_sendf(s, "irq_intercept_in %s\n", qom_path);
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index 3a71bc45fc..e53e350e3a 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -371,6 +371,17 @@ void qtest_irq_intercept_in(QTestState *s, const char =
*string);
  */
 void qtest_irq_intercept_out(QTestState *s, const char *string);
=20
+/**
+ * qtest_irq_intercept_out_named:
+ * @s: #QTestState instance to operate on.
+ * @qom_path: QOM path of a device.
+ * @name: Name of the GPIO out pin
+ *
+ * Associate a qtest irq with the named GPIO-out pin of the device
+ * whose path is specified by @string and whose name is @name.
+ */
+void qtest_irq_intercept_out_named(QTestState *s, const char *qom_path, co=
nst char *name);
+
 /**
  * qtest_set_irq_in:
  * @s: QTestState instance to operate on.
--=20
2.41.0


