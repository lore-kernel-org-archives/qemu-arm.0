Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp270528ejj;
        Sun, 24 Mar 2024 09:57:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViLMfINx0pH12yx4dQeSv85rZdHJS0hWuvvR0nlQDqqsquHkjzWmStp13r5PhnNcRfrGrFuPnA1qb5FmlCXTp7hrzrb69B
X-Google-Smtp-Source: AGHT+IENmKHebiQgSMiZe2nIBIaN94RoOpTNWjSZhbHfCWDvRXqgmI3iwgLVo/PJx4lsxa4bkXwA
X-Received: by 2002:a05:622a:185:b0:431:5b06:9464 with SMTP id s5-20020a05622a018500b004315b069464mr52534qtw.62.1711299420117;
        Sun, 24 Mar 2024 09:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711299420; cv=none;
        d=google.com; s=arc-20160816;
        b=uDnimAlkNFue93qRJrk36KTWCzMTUYvTGeWI1dloscW4+66PllqMnwM8KY/RGSJNcx
         oOrl86av86j6Qf7aR8emaWPQ2+VHbNoP4gyajVQqgO3S9MdyuZnhHGeJUe06/o27yzh1
         6hI5yFHa5/Ve1IXa+O25xwiwYFh8kh9pOJBZhyPqzjxD1bzDuW4pITJhcadqOKbH9py4
         VthRDoiNrorTERpUpuwDPbehVYp4qVtBA3mUFchfaHjO+11ZQzxgOpg9tq6jTNTJIROv
         rLxzZfg3yHqu2Kvs3Lo2kPlxyDI8HYiGzFKoOuMXahp+jJwqiKQA3zOrItZ7uVsiDv1B
         rTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=z8vP61lOqCHtPIe/NMBtNrdjHVIxDoNiy4/4Xzg3S5o=;
        fh=EsR1pYVLfRVJvpelbFzln9vs9h7oPSeWdjYRcFXVeQs=;
        b=WOlh0+X+G/bizlkBV2n4YVyThO4RMzBmA1PiymI7iQfpkawuEPsS3IA/i2G1kTQetm
         PHWIcZTlIZwz7/EFlGDJLjzbZyXRzXSujlV/WYQ2lIXKOWrPwOkM8JS7aG9nn3emYe8j
         1vQYlZih++plQwCbnSDRxvpD+xGLqM9hAES58oeRwStQjcsEoza99cOOxqfVZG4j+PVP
         SoKLkNwGSmYVtDIEgOGKiByn2BJgskENhhIUmiQe6JSkrM+pqmD0Hubdpz7v92zrQijB
         7w7pBCbop719MYEr0aAkx5AeRUA9nrhwX3GYPvJj3enqNlXiI5KmAwQb7F0PkwGbFpaP
         XnPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=6b23ArY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac859cc000000b004315ac3ad7dsi67284qtf.538.2024.03.24.09.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2024 09:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=6b23ArY8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1roR92-0005gY-I2; Sun, 24 Mar 2024 12:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1roR91-0005fO-EZ; Sun, 24 Mar 2024 12:56:27 -0400
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnaud.minier@telecom-paris.fr>)
 id 1roR8y-0005ON-Uf; Sun, 24 Mar 2024 12:56:27 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 3B3C9A05B3;
 Sun, 24 Mar 2024 17:56:19 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id XMf3RiLmRfx5; Sun, 24 Mar 2024 17:56:19 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id F2B87A0132;
 Sun, 24 Mar 2024 17:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr F2B87A0132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1711299378;
 bh=z8vP61lOqCHtPIe/NMBtNrdjHVIxDoNiy4/4Xzg3S5o=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=6b23ArY8Zn9MlRR2vLop3DlVFE7O9cE1+tYsXf0zgd7p4CzCebotQfIe34qcLO5zJ
 8hjGfp2DfPOgIinuFFPGFVQ/Qly/XV7fbF8yvVPW0xGYRddGHEeKwUfC99Sg+vitog
 ZOxkow0zY7uFKE9xH4ltyHlzvkxpsp2+zwyxRo80=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id cnRldenplYPb; Sun, 24 Mar 2024 17:56:18 +0100 (CET)
Received: from AM-Inspiron-3585.. (unknown [78.208.223.3])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id D000CA0576;
 Sun, 24 Mar 2024 17:56:17 +0100 (CET)
From: Arnaud Minier <arnaud.minier@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/6] hw/misc/stm32l4x5_rcc: Propagate period when enabling
 a clock
Date: Sun, 24 Mar 2024 17:55:41 +0100
Message-Id: <20240324165545.201908-2-arnaud.minier@telecom-paris.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
 envelope-from=arnaud.minier@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +WQLXwhF9FX7

The "clock_set_mul_div" function doesn't propagate the clock period to
the children if it is changed (e.g. by enabling/disabling
a clock multiplexer).
This was overlooked during the implementation due to late changes.

This commit propagates the change if the multiplier or divider changes.

The usart tests will ensure that this behavior will not regress.

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/misc/stm32l4x5_rcc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index bc2d63528b..4725ba4f1c 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -59,7 +59,12 @@ static void clock_mux_update(RccClockMuxState *mux, bo=
ol bypass_source)
         freq_multiplier =3D mux->divider;
     }
=20
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+    if ((mux->out->multiplier !=3D freq_multiplier) ||
+        mux->out->divider !=3D mux->multiplier) {
+        clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+        clock_propagate(mux->out);
+    }
+
     clock_update(mux->out, clock_get(current_source));
=20
     src_freq =3D clock_get_hz(current_source);
--=20
2.34.1

