Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4360786eje;
        Fri, 14 Jul 2023 16:28:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFnYO2aDireOQ/eiBcsv4Plz66ciNLdgaz01RSWkiEHPFSW28tq5/SRfxSpnUk8XtIKF8dD
X-Received: by 2002:a0c:f5cd:0:b0:63c:5ffc:c679 with SMTP id q13-20020a0cf5cd000000b0063c5ffcc679mr5585053qvm.27.1689377308208;
        Fri, 14 Jul 2023 16:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689377308; cv=none;
        d=google.com; s=arc-20160816;
        b=u10/2e8YGDYEV0u2KIdsOV98GRuW9+DKmZs2/CMEC42v5/H/B1faU6Rlujbk+j7XJT
         NRdPgGrEkRUN1hThSnHtUm1FdzuuI8JXNpWl3JDTumXAxqgBQhsHU3ImVKsU60/iy11d
         RGSDjpcU/V+DuaijrtjTUHOF/ObqdeB/PQmPHDevimoRB28ZDn9/WTGzouTz+9OvWdy3
         FX+TsF8bXYmosBWaAQTGpyDylU7xcewz/V5fOZHwyuLBLQ2Ud85UTsqmg0YyBPkvSEPX
         tsOBYWi9bIYoWdvLiH9FhdNI9C8ThmrgmloU9KV1tbnjPWgI//rXL58ZEQiOrVnlYdwD
         JEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=kCTGZscRn0Vly+yIoAdKyZJzfkd9NkpoIHdFxIsVLuc=;
        fh=51RBXPp2dGsIxW/A/2XX6J9OY4lNIg77Uvb7eAIehHk=;
        b=XHwrrOpLb+jlWpTVfnkDSIJtby+295NbNPpoa8NgOUtq/u+YmvhBeM5Dd96Ag0It6i
         2DHf8oWvRJ10FhkUTAQYYbqpeM4EAjBpfvcfFg0qah6batsEX4wp0Tx5CIBdDeqIIInA
         One/lO0g0kLIPcXp8iAUpl4tElxxQ95KoBOROBeMPb3nNsDu1o9qNHmtGWcMu0QwsH+d
         xC5TFeMKihDtFCsA6VmNWCazRHv/aAbVrGrXLO/Z2eMx+i3bjK47BLZuD5eNb6GqxjCd
         6Os+2uo1XeeDCst3FM7UcOQjV2tMsd4wRzTvpO9NDUWTHV7gZywoHdRDqq9Xx1ufIFVH
         l1ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=AmwSJ46u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0cdc0c000000b0062df1133dd4si5153492qvk.240.2023.07.14.16.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 16:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=AmwSJ46u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qKSCl-0000tc-BD; Fri, 14 Jul 2023 19:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCj-0000sU-Gk
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 19:28:05 -0400
Received: from mail-4018.proton.ch ([185.70.40.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1qKSCe-00043N-Ev
 for qemu-arm@nongnu.org; Fri, 14 Jul 2023 19:28:05 -0400
Date: Fri, 14 Jul 2023 23:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1689377278; x=1689636478;
 bh=kCTGZscRn0Vly+yIoAdKyZJzfkd9NkpoIHdFxIsVLuc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=AmwSJ46uycYMhdBtcgo0j9qVcan+g04NVoOuGO4gg3cSr72OHlyh0XCDtN/14W5gy
 DaQJtEDTF/dj3pBE3NzgK8Zge79eH9qif7zHxGZgihUZ2eBJrmi3LY2qKtO9RNIJ7W
 Lo7VYuVTpc1rQySgcwjopNX47kZRb3iyGDjNHt31alpqX6BAQ8bFwFRKtx82j+bi+v
 L5dMysoI32uUwttTSYtStXUaUZt2cD7qNqJ3Ii8tVlsBfpqNCRi1vRqaSG6ICjSwEi
 upmrzPhY8YqwQFxQd4FqK93geZi2l6GSDV9mgoALhy99v1zpbo7RIV5CtXeJaOi/Gx
 PK24d0fvgO7ig==
To: qemu-devel@nongnu.org
From: Chris Laplante <chris@laplante.io>
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Chris Laplante <chris@laplante.io>
Subject: [PATCH 5/6] qtest: irq_intercept_[out/in]: return FAIL if no
 intercepts are installed
Message-ID: <20230714232659.76434-6-chris@laplante.io>
In-Reply-To: <20230714232659.76434-1-chris@laplante.io>
References: <20230714232659.76434-1-chris@laplante.io>
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
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HE6q/U5uGRwL

This is much better than just silently failing with OK.

Signed-off-by: Chris Laplante <chris@laplante.io>
---
 softmmu/qtest.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 051bbf4177..e888acb319 100644
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
                         qtest_install_gpio_out_intercepts(dev, ngl->name, =
0);
+                        interception_succeeded =3D true;
                         break;
                     }
                 } else if (!ngl->name) {
@@ -438,15 +440,22 @@ static void qtest_process_command(CharBackend *chr, g=
char **words)
                     for (i =3D 0; i < ngl->num_out; ++i) {
                         qtest_install_gpio_out_intercepts(dev, ngl->name, =
i);
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
2.39.2


