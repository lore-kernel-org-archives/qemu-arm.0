Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp598758ejb;
        Fri, 28 Jul 2023 09:42:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFyXCULqCJVhnXISJ79VmxmU7Nf+SaRaPLyo+Id2LO3DsU25o+aQml8Ctcrt2p7CB9nYFCO
X-Received: by 2002:ac8:5acd:0:b0:405:47aa:6846 with SMTP id d13-20020ac85acd000000b0040547aa6846mr4431625qtd.32.1690562522305;
        Fri, 28 Jul 2023 09:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690562522; cv=none;
        d=google.com; s=arc-20160816;
        b=hrIa61asb9+7BSeaJR4tN6NUxKncIudYZuGgePVYZEqCncYFzAFRnh+uE09SqvkpI1
         o1xF1CaZU3lr0I7ZtJLXWo+rtWNRgZW6g38HNbZ/mB1x3XuqsSJAJnyJSfuJTdUC5TNz
         i5+Fqwlq2ZeVQY8nU6bokJPQc7dz8fopKQgpcgCS6nEYVhixtW/TK2aybYA1L2tQ7SCT
         yquLuVGrdSf6lTMbxOECqYI/l7EncwfmlIqo/R+a/ASgRfH9DxmOcYfRmHWzw4QpdCSb
         V8O6Nl0niACP05Z8kMwT60+wGQOEa2w2uyN/QHfIHWDJ/Vin9oxtiHW9YjHXl0AeB/3P
         K8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=5mJBH2avifG4/P8iPdPedQfA6UtFs96ajMwje8eMy2s=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=fL4jCImChDAhueWyr8x6U4H3S7sibzP5pXrFm4KhlckPe6JJEw8AyRQw3rY/uw8qA/
         XdNrisrnIDDFirXCTXZXySHXMDs0SfW04DaHIptYo8Op0wRaQxnhG4fXT2uZv8hpLJbn
         cGUch3Ez9Fpg+lxz1ypS+uVsBUJzRxrnjm0/f8KhpqNmAhXmxd0iNLZQlqg5QiEVlm8k
         RuA1cPN6SgPa6lfiQKCZhyNn6vQHf7lkz4rInnE8Y3Owga/HVmqKbP3BqMEWrGOudoFe
         eSU01YVy4N3G/UD+95hFLhrDE4r7V94lSh3nyIeszjGhdW20viRZ1NS01JPLRn0QBbUR
         L8fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="h4MYg/NM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee24-20020a05620a801800b00767d65297c7si2472106qkb.756.2023.07.28.09.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 09:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b="h4MYg/NM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPPxw-0004xL-Fb; Fri, 28 Jul 2023 12:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qPPxv-0004wm-0j; Fri, 28 Jul 2023 12:05:19 -0400
Received: from mail-4323.proton.ch ([185.70.43.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qPPxt-0004eS-AZ; Fri, 28 Jul 2023 12:05:18 -0400
Date: Fri, 28 Jul 2023 16:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690560315; x=1690819515;
 bh=5mJBH2avifG4/P8iPdPedQfA6UtFs96ajMwje8eMy2s=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=h4MYg/NM9tEY67P1Y6089itidh+DuArYd2t+fC23fOpIGIvEUZuaAqYBNnMRSDwqr
 SlJpZ8CqlrqdYGbdWFdwWRahCqqHNfGEZIZqrh/jzHfu9DqcuPPdTrwRhWH2tP54cz
 ur1YXdV96+nOyZ/pxRfbjJ2Vj30sABO9VOpuGHf90PkSfHx8xejNj/ziy795MSfIXT
 OWAjk2oCsUnZzXnCw1Ca/l0X+8w76DvJS23aYOx7TOrzYreIi6vGqrhlIerFjWBdZ8
 rFPL4XN8ls3mJRsvzlU4oihyN4ut3i79bBgnBQcrIan/DAxKPhgH1OThL1+06p6E9l
 cwdzu1OjL0fEA==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH v3 5/6] qtest: irq_intercept_[out/in]: return FAIL if no
 intercepts are installed
Message-ID: <20230728160324.1159090-6-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
References: <20230728160324.1159090-1-chris@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.23; envelope-from=chris@laplante.io;
 helo=mail-4323.proton.ch
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
X-TUID: MHtKc0NCIphH

This is much better than just silently failing with OK.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 softmmu/qtest.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 66757ba261..35b643a274 100644
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
@@ -435,15 +436,22 @@ static void qtest_process_command(CharBackend *chr, g=
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


