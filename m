Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1024041ejc;
        Sun, 5 May 2024 07:16:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwq3bNbGd3hPkoNL+gCDfGi126RsiWui5IDzXbtuuPLaG6Rvi7KtnqZAMGIC2yn13ExVrky1qGMCtIzHcLDGQo40OEEt/D
X-Google-Smtp-Source: AGHT+IHZ63gIbU3u/hg3XRycN05Il3z9JTWVvkfeoVwLslFM/EO4ilYINmOrCzJST0aE6q0/uaZz
X-Received: by 2002:a81:4808:0:b0:618:2381:2404 with SMTP id v8-20020a814808000000b0061823812404mr8835130ywa.44.1714918618403;
        Sun, 05 May 2024 07:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714918618; cv=none;
        d=google.com; s=arc-20160816;
        b=sMkihnHgyt/AOg16KgKuAK9IBGh/3Mdjci4OO4eJeZkSFsKOYZ4nctt5xhovqQ6y17
         upvxSO7ht4Q5ggnOIl642eH519kZxO6rEKga2tWE/uwMzMVUkIayHVcchr8QIxT8b04r
         zHRphnLQ252fPS9mr7dISQZRsK+sTtU2rNkCOgchX5SMr3iBIjGJFpdtpw4kcMKhEmQ9
         W7qu1s2IdfPozMUPKg2A9XZdSHCYcGzB6Gunb1LGMkO6zRMqSfzwXFadYg3vAkrrcf5u
         UDTZCscVf6HGH72iu5dyI54FSxFnrV9F+a9DMtDwglAfAPhd65e2j4ktVN888SC4ToA3
         g1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=vcFgVjRGgW/7vYVh6RD7B1Vto6HuZOvfgObdLod54wg=;
        fh=6pcb5+dp30T4OJBgwllO9TA2DKUhZ9AywmJPJQmRiz0=;
        b=OxW1Vm+T74wMLtUha6aNavcXyIMBAfYG78kNEgym0BiXBDOI4KnusGOMYLIwhUOwr2
         ikU6vmaNafwBD+4yDmi6apzJ0LV3DCeRExmB5J2MNpai6LPPrGDQKQr7XVkSJAtGi4rY
         He3CbJ0Wd0QfxwriyrNA4mdG6fGiIZIW/gB+R4rvCGQ50Cm3d6XYd+BNIWqTR84H/K9b
         jgG/g2PCL6tHFhdtFjzOgOhVvdPkkDuUsVyfBXpQw8tRxuU3NOqPZ+8rzdsniHRK618Q
         C3wUj7iq14wOEJiHdyS0YtTC1FTQg5jlx38wzl/uS6IkrkXBaBLMnKz06dP1SqgY9W29
         7ZQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="txQN/c9H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a67f54c000000b0047c3b535c85si1106674vsn.814.2024.05.05.07.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 07:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b="txQN/c9H";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3cfI-0005g1-8x; Sun, 05 May 2024 10:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cfB-0005cK-Qk; Sun, 05 May 2024 10:16:28 -0400
Received: from zproxy1.enst.fr ([2001:660:330f:2::dc])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1s3cf9-00052o-Mx; Sun, 05 May 2024 10:16:25 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id C3C3BC062D;
 Sun,  5 May 2024 16:16:19 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id RB6ty0b616Pb; Sun,  5 May 2024 16:16:19 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 5F32CC05F5;
 Sun,  5 May 2024 16:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr 5F32CC05F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1714918579;
 bh=vcFgVjRGgW/7vYVh6RD7B1Vto6HuZOvfgObdLod54wg=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=txQN/c9HWZRJvSHD4VC7/WNopOltIncwDqJn0y/k68CCZC4EhLa5u/wQ3wf5PMWK2
 jezThd6kVdhy/IHSTTPMzaPamzX9Ow2g3/cXzT/V/kKvG51UNTafg/C4GYRnX64miP
 Bvdge12WvXs6L3vXZLkf5d5LT+Eze1kvT5by1uog=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id B-vYFCQw5Vi3; Sun,  5 May 2024 16:16:19 +0200 (CEST)
Received: from inesv-Inspiron-3501.enst.fr (unknown
 [IPv6:2a04:8ec0:0:124::190c])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id 92831C056B;
 Sun,  5 May 2024 16:16:18 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] hw/char: Correct STM32L4x5 usart register CR2 field ADD_0 size
Date: Sun,  5 May 2024 16:16:08 +0200
Message-ID: <20240505141613.387508-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dc;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
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
X-TUID: MSBLLbsbHPOV

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/char/stm32l4x5_usart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
index 02f666308c..fc5dcac0c4 100644
--- a/hw/char/stm32l4x5_usart.c
+++ b/hw/char/stm32l4x5_usart.c
@@ -56,7 +56,7 @@ REG32(CR1, 0x00)
     FIELD(CR1, UE, 0, 1)     /* USART enable */
 REG32(CR2, 0x04)
     FIELD(CR2, ADD_1, 28, 4)    /* ADD[7:4] */
-    FIELD(CR2, ADD_0, 24, 1)    /* ADD[3:0] */
+    FIELD(CR2, ADD_0, 24, 4)    /* ADD[3:0] */
     FIELD(CR2, RTOEN, 23, 1)    /* Receiver timeout enable */
     FIELD(CR2, ABRMOD, 21, 2)   /* Auto baud rate mode */
     FIELD(CR2, ABREN, 20, 1)    /* Auto baud rate enable */
--=20
2.43.2

