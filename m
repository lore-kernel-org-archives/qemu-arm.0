Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4360936eje;
        Fri, 14 Jul 2023 16:29:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvgpCSC+wLYHKyjzcduoraiuuuX63XxHHJ22mxP246lsXBIBQ51r5DC+9YaeW7FzoXKesE
X-Received: by 2002:a05:620a:40d0:b0:767:e73b:d051 with SMTP id g16-20020a05620a40d000b00767e73bd051mr7551807qko.32.1689377339909;
        Fri, 14 Jul 2023 16:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689377339; cv=none;
        d=google.com; s=arc-20160816;
        b=QY2k1kCBnhID1DorywJHlK0pFpLjGawhkLHc4n2cZJTblCvQ+jToa9MF6C1LR+dhCL
         Jqw82Hl/0fqY0ra+N2k+qehu/NmbThbqmtPTFQs5Yb6LSqTqnhYkx9MkGAadH/0vDm8o
         vEIXAM/FCFTYCtcUU4vnlF0fPdXMaXVtSNmiSEKgs1cVOceUbohGamKYFMvNeAT2+jUf
         yX805RLYSv+/DfvOOZxLO4hRoL9goQINHsdrQwm+Db8A3bR/YGLjtLW+wc3mc7w8dg24
         IRJWC2P3PoVpeE92KvvwhHWKGKL6yeNrTY0nGRgmY++VuAeUKhbzIFI36bF3vK9igtXb
         tGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=NYu5jlkZSkIqIRSOGkwaCvk5BdLhtCKzeYg2plVUhzo=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=zG+1gg0aty95b8VjrOZAvQPJmMPZGOZjZgZx+8yRgPuX/0c5LiLs3SFSDR7GP4s4H+
         SFfON5pAkJIesknkKb53oWa/mvYsv7RqZoU6vmr2KxDR6pkY+1/ST/xdOnGsSqC8wu72
         bDHkUWjRMzR6tzDfV0wgOpebhI3Ve6QWhU0NI5sPtOsxBlZO4wACtwLQt9rP0FXtXPYu
         sujFHPm8AR79XngKNZ9vlbsp3kxK0PnZTn6ryg29W7LK/jSKWHvkd8vj/DcIfgXXia5Y
         9vHl+G/CZqCFgTeryd7HQLTiVRt8cJDXRTt9ReOA9381T2bYVahW/C4C1cqBdGjQjDKP
         BVMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=1wkHJuE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a37e10c000000b0076781e2a202si4986355qkm.779.2023.07.14.16.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 16:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=1wkHJuE7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKSCR-0000lC-G4; Fri, 14 Jul 2023 19:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCQ-0000kv-91
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 19:27:46 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCO-0003zd-Mx
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 19:27:46 -0400
Date: Fri, 14 Jul 2023 23:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689377257; x=1689636457;
 bh=NYu5jlkZSkIqIRSOGkwaCvk5BdLhtCKzeYg2plVUhzo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=1wkHJuE7qt14zGF0B5UL2CPBWUL5g3cOcOMTpWUdPgAQg/SIPLL5cmX2XvokKsOL5
 1sZ39sJxkO8IZ3KRDZJ+s7U1Pv3sPTrQhNO50zP3x4+hFELdsGsV3r9iRZPzivLx+u
 3oKdZq7zvZXaafV5GjDFzVH38FLJTZAAZLasiVQP3TliimkaR98PgjXVi9gRI/N0H0
 CqLX7YE16Pa4TirhlCrNvZj2LVjN2cqpbgEIZqMy0uPqU0AxghnSWyO5efOUxGlNuw
 baku2PwG9BBouNqFN/EuOtR40k1Xaq6CSwIZNDXBkW8KNk1MOA6NZCvojwem2GFDmJ
 8wgjiilslAUpw==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH 2/6] qtest: implement named interception of out-GPIO
Message-ID: <20230714232659.76434-3-chris@laplante.io>
In-Reply-To: <20230714232659.76434-1-chris@laplante.io>
References: <20230714232659.76434-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17; envelope-from=chris@laplante.io;
 helo=mail-4317.proton.ch
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
X-TUID: jkdqJNwvc/2j

Adds qtest_irq_intercept_out_named method, which utilizes a new optional
name parameter to the irq_intercept_out qtest command.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 softmmu/qtest.c        | 39 ++++++++++++++++++++++++++-------------
 tests/qtest/libqtest.c |  6 ++++++
 tests/qtest/libqtest.h | 11 +++++++++++
 3 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8d764b719..7c3dea5760 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -388,8 +388,12 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
         || strcmp(words[0], "irq_intercept_in") =3D=3D 0) {
         DeviceState *dev;
         NamedGPIOList *ngl;
+        bool is_named;
+        bool is_outbound;
=20
         g_assert(words[1]);
+        is_named =3D words[2] !=3D NULL;
+        is_outbound =3D words[0][14] =3D=3D 'o';
         dev =3D DEVICE(object_resolve_path(words[1], NULL));
         if (!dev) {
             qtest_send_prefix(chr);
@@ -408,19 +412,28 @@ static void qtest_process_command(CharBackend *chr, g=
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
-                    qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
-                    qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_handler,
-                                                      disconnected, i);
-
-                    *disconnected =3D qdev_intercept_gpio_out(dev, icpt,
-                                                            ngl->name, i);
+            /* We don't support inbound interception of named GPIOs yet */
+            if (is_outbound) {
+                if (is_named) {
+                    if (ngl->name && strcmp(ngl->name, words[2]) =3D=3D 0)=
 {
+                        qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
+                        qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_hand=
ler,
+                                                          disconnected, 0)=
;
+
+                        *disconnected =3D qdev_intercept_gpio_out(dev, icp=
t,
+                                                                ngl->name,=
 0);
+                        break;
+                    }
+                } else if (!ngl->name) {
+                    int i;
+                    for (i =3D 0; i < ngl->num_out; ++i) {
+                        qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
+                        qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_hand=
ler,
+                                                          disconnected, i)=
;
+
+                        *disconnected =3D qdev_intercept_gpio_out(dev, icp=
t,
+                                                                ngl->name,=
 i);
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
2.39.2


