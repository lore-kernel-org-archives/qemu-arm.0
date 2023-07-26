Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp266438ejb;
        Tue, 25 Jul 2023 20:34:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEVugcV/WOJgaeyM++JUwKOOEcGEjapSm/KJan8cTijTkiDiHKq8K/bA5RyJz1AKlZFFtVQ
X-Received: by 2002:a05:622a:1108:b0:406:a592:756c with SMTP id e8-20020a05622a110800b00406a592756cmr1214410qty.58.1690342463829;
        Tue, 25 Jul 2023 20:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690342463; cv=none;
        d=google.com; s=arc-20160816;
        b=QTiVPr5gXVZcoiJrSRUh+ZdM3vJxmYiGyzfpdEzgFYkbZpufYJbm+tpZUUz8Emxmjy
         G5SeaIHgXpQ8uDJiXvxaBc/+F53fXRl8XBFX2VeqAV2RWRswhbPdUMRXa9aNoC3Rz1U5
         fj3wW0LjTyvfa7HsedApkGC7kL2rVCj0FON1mgumjzcqJ29LJwffHqGmQDWSbbHrJoth
         dDQrJr3fmBtaG90qc6ZEPW/MOypDWfiFx1ShdE1wwSZMH9I3V+kBWrs3HnX4KhMGhsnu
         AdF4IJXSGgW1WTppPvVZ1vHhkqMEQm7gxowpwFtui16UuaUnnZH3gH1puT095xtPrl2K
         7BMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=EtuSgrXwZhMLjgs507zxk5ZwlCfmtLk/i7vXQX5lOqo=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=zlKm4RxkiHanU6nh6emj2E8q4IkLb6GfSI3y5nfWePKK+pf7UVWh/wjQWrTvjHY/Cv
         aVlHdhc6RtEVS+2FUrO+P3gbhrbburblxd27KccXK5kQM1R+kdMRQvh5xo2Tk5M9ibzu
         MIVwVHUocMvZWaNuLmloe0t6565veWpfJP3EdxdHE4UoO4o6EQXrJed+yAAAMyUOjFuO
         KAWvcU+r4wei2KzRyn5QdPG/0FTPRC8hqd2zF3WtZU3OF1yL8pRsDha1WgmvEjp9i9c5
         b718ruEEGDxiyPyYZl6CW86E6QK3U9269dFU7wt+1pifB71+MdBGREDlRDucC5BVEGrl
         w/gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=dl4edW6M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020a05622a025200b00401e365034bsi7607482qtx.404.2023.07.25.20.34.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 20:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=dl4edW6M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOVGP-0005Tf-Lg; Tue, 25 Jul 2023 23:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGN-0005RU-Nn; Tue, 25 Jul 2023 23:32:36 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOVGL-0007dv-QZ; Tue, 25 Jul 2023 23:32:35 -0400
Date: Wed, 26 Jul 2023 03:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690342351; x=1690601551;
 bh=EtuSgrXwZhMLjgs507zxk5ZwlCfmtLk/i7vXQX5lOqo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dl4edW6Mlfg15e9sPMpyi5q4xwjLYviBzeHQTvzzJHwEx113gUuVNHHdc4rErNAed
 3rB7t5Wm3fQa7h1PNBslDQF6su/Zsp5axNol/OgZ1PL8FqQX/L8L5ZlgUh9+ZfuPOv
 8pq/Wj3fMimCA0NNZmYV2ny2At6OLkN5f4GsNFoDbUr79EvnFHbysYJ6zxDBOoZl7d
 G7JTqlkIH743TsS9XWqsWF61Saxn2mDXa0jfTXlDjLN0EWbIoYjME+METNWIimzzmS
 pzDtGX6v4yh0JskOx5Qq125WtiqCRay3xfOdT2oaJ25zICW/oevoxd6tzH5Xrjef8r
 tqvDf6TQzwIkg==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v2 5/6] qtest: irq_intercept_[out/in]: return FAIL if no
 intercepts are installed
Message-ID: <20230726030450.757462-6-chris@laplante.io>
In-Reply-To: <20230726030450.757462-1-chris@laplante.io>
References: <20230726030450.757462-1-chris@laplante.io>
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
X-TUID: C58FcAGYtrZY

This is much better than just silently failing with OK.

Signed-off-by: Chris Laplante <chris@laplante.io>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/qtest.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 1719bbddc3..c9751f527f 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -399,6 +399,7 @@ static void qtest_process_command(CharBackend *chr, gch=
ar **words)
         NamedGPIOList *ngl;
         bool is_named;
         bool is_outbound;
+        bool interception_succeeded =3D false;
=20
         g_assert(words[1]);
         is_named =3D words[2] !=3D NULL;
@@ -431,6 +432,7 @@ static void qtest_process_command(CharBackend *chr, gch=
ar **words)
                 if (is_named) {
                     if (ngl->name && strcmp(ngl->name, words[2]) =3D=3D 0)=
 {
                         qtest_install_gpio_out_intercept(dev, ngl->name, 0=
);
+                        interception_succeeded =3D true;
                         break;
                     }
                 } else if (!ngl->name) {
@@ -438,15 +440,22 @@ static void qtest_process_command(CharBackend *chr, g=
char **words)
                     for (i =3D 0; i < ngl->num_out; ++i) {
                         qtest_install_gpio_out_intercept(dev, ngl->name, i=
);
                     }
+                    interception_succeeded =3D true;
                 }
             } else {
                 qemu_irq_intercept_in(ngl->in, qtest_irq_handler,
                                       ngl->num_in);
+                interception_succeeded =3D true;
             }
         }
-        irq_intercept_dev =3D dev;
+
         qtest_send_prefix(chr);
-        qtest_send(chr, "OK\n");
+        if (interception_succeeded) {
+            irq_intercept_dev =3D dev;
+            qtest_send(chr, "OK\n");
+        } else {
+            qtest_send(chr, "FAIL No intercepts installed\n");
+        }
     } else if (strcmp(words[0], "set_irq_in") =3D=3D 0) {
         DeviceState *dev;
         qemu_irq irq;
--=20
2.41.0


