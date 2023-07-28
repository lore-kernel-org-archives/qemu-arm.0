Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp599968ejb;
        Fri, 28 Jul 2023 09:44:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGaNBRMLXv1nCZfx121OthSCecSdGc59HbepHxBhnymlfM+0oJlxw62KMF0DXD6FzAVAcrq
X-Received: by 2002:a05:622a:5cb:b0:405:5b23:b259 with SMTP id d11-20020a05622a05cb00b004055b23b259mr3051121qtb.46.1690562654807;
        Fri, 28 Jul 2023 09:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690562654; cv=none;
        d=google.com; s=arc-20160816;
        b=IIlmfWvWRvu2ItNEv0SRi1mHDWFlX/cKKo4pYQewhlP3LkEpaSTZwNGvHn3snnsffe
         THXza9pWBwLtGLpAxCidXGazLE8aW/i8e/QBPjls5qIvOiNii1Lad0ahi/gT/80pCht3
         FlQ2JQftsjvhAxba4V3uJtY//3i8K6WmsGv+5kWzVLAABlhWqF7HY7wO8T2v9upsoY/K
         dChJuKz786Rbd/mqDBBH5vL+HvdEQFVJzD15dRM4gNhM8zG6y56qVt/iorzSo3Zb5PVb
         PyC/9giMJvLcr2FHhH3kTrZMQpp8AuOllzNlAlUkzyvQ6GQP9Cst182TUI+CQ3c2Awh8
         OhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=Rk0N/XPmjneuAZccDgJuKpf3b/CK7sC2+1J9idvSmWo=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=epKHXGjM/OuYRari1bvF9fDm4UKuOcTB9oKbvqexo4u53Al7EMBMvi7VczzsO9M8CO
         55PJSwxvdVTlDxPbPGB2XdGRCn4o2DdNpH2G5lpAskIA8Gc40cuVEHKqvvXw6S4DK/MP
         zECcMKgUa9DAZSG/qvxRBmOkj41ZlplaQ4JSUIx7JVRn1Li+wBplrY3tZwFSGD0fkPvS
         22s52o95Dy7P/Pn+bbvlp7JuoQItNvWNXPDqH0ZDEMym4d30XXdIUEzEHN/IBXNMiL2O
         2cOr60Dym95oMA5N04MaDPAQ3nAviguhKlYc728zphTkkTSPuP/T5Y6HjWQYjZ29uzgf
         2DPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=OwABK5eh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020ac85bc8000000b0040696bc925csi2427070qtb.446.2023.07.28.09.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=OwABK5eh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPPxh-0004sK-TJ; Fri, 28 Jul 2023 12:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxg-0004s2-MQ
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:04 -0400
Received: from mail-40136.proton.ch ([185.70.40.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qPPxe-0004NE-Sw
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 12:05:04 -0400
Date: Fri, 28 Jul 2023 16:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560300; x=1690819500;
 bh=Rk0N/XPmjneuAZccDgJuKpf3b/CK7sC2+1J9idvSmWo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=OwABK5ehC1D9P2acVBNiqDjdAz9nTw1mPatjHZ0qYd8qKn3/dEGKHf9HgCSNzEccv
 vcNeA6PG4LiDDTa7fG5GpMa3uDskO9UbyBxk95OIHuIAhsNds7eRqfTVRAwapdc2IT
 +/ALjZFeGmfBy2fsYsyTLyWoL2S9zlZg5/kU4473UIsOO0Gbh/n43bQjWhHcxRvxpG
 ypME+b/8yDpSb7i/wRX2FLCXGJ1FjuZfvIOxuE6zDOWNWr8Na3Oo3r7A7nbHHBFBVg
 Y9fWBO9sV/wYBJuItB3f8q5o/903kB0C4W077AqaVvsj1ANdi9SnTdZgmBMwGIiHCw
 qPiqK9kb4UQZg==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 2/6] qtest: factor out qtest_install_gpio_out_intercept
Message-ID: <20230728160324.1159090-3-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
References: <20230728160324.1159090-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.136; envelope-from=chris@laplante.io;
 helo=mail-40136.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6INOhphox8Su

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/qtest.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8d764b719..1b86489162 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -365,6 +365,15 @@ void qtest_set_command_cb(bool (*pc_cb)(CharBackend *c=
hr, gchar **words))
     process_command_cb =3D pc_cb;
 }
=20
+static void qtest_install_gpio_out_intercept(DeviceState *dev, const char =
*name, int n)
+{
+    qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
+    qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_handler,
+                                      disconnected, n);
+
+    *disconnected =3D qdev_intercept_gpio_out(dev, icpt, name, n);
+}
+
 static void qtest_process_command(CharBackend *chr, gchar **words)
 {
     const gchar *command;
@@ -415,12 +424,7 @@ static void qtest_process_command(CharBackend *chr, gc=
har **words)
             if (words[0][14] =3D=3D 'o') {
                 int i;
                 for (i =3D 0; i < ngl->num_out; ++i) {
-                    qemu_irq *disconnected =3D g_new0(qemu_irq, 1);
-                    qemu_irq icpt =3D qemu_allocate_irq(qtest_irq_handler,
-                                                      disconnected, i);
-
-                    *disconnected =3D qdev_intercept_gpio_out(dev, icpt,
-                                                            ngl->name, i);
+                    qtest_install_gpio_out_intercept(dev, ngl->name, i);
                 }
             } else {
                 qemu_irq_intercept_in(ngl->in, qtest_irq_handler,
--=20
2.41.0


