Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1032045lfc;
        Fri, 17 Dec 2021 15:31:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpBW2Fd/5Wwp3TARwpRR6n9r7ccopCzEdoAmnKZ0CxNUj04qTXFJNlkk1fKyj4vzK4h/AJ
X-Received: by 2002:a25:e792:: with SMTP id e140mr7696002ybh.426.1639783874391;
        Fri, 17 Dec 2021 15:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639783874; cv=none;
        d=google.com; s=arc-20160816;
        b=vfAtDZuOCRedWk2L+6QzK1UApMN0R3iVvYv5n4Vo0ukJ1QYA3qt1wHLGuwwTc5a/xg
         TYN7rHNUkP5urXtmGx9cnyWddpxACSByZOKz5o9Oph0FpVmQ7JsxD6tIwCznAJdYIW0p
         P4heBTZv8jAUKwCRALL4l/zikZ1bT/NqaSwmGG3qmZV5OdjZ//DyR9DuI+dH6jeeJ7R/
         vc6lqljrBzNxcP4qobLPVWVu7KI6QNh7ZdJOV4ttSXMAsjMdTg6YSZYBTBjA6j8e+qP4
         c2m1hajo+KlFLkTaBPcl3XFbnV6XXcF4TfwL4vIbyfPGPCuvDGJ8nkjzNc5T/m3XCxE1
         2hTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8PyOdFmZygCGVLNn7Pxdq98PoJywaoUaIsyCZRSl4x0=;
        b=RdEQZbjc7cf5p/vX+2Zg3gIKXIPpb2eH9LeGVTgMvjCawNb9UaNNfCpW0aUgYEYoH0
         Qsmnbw4yPXUBkpmHrbZ2esaKDTCE4TFpygc2D1JjeeRTcxspORgwxokwsFjklnflPvFB
         9CdoFyIvtJ4fjCavK6XHpXQff9ezyVdZhOshWgzaTfsHksAkksr5vCURCjUXqh01i23p
         wdY4D+h1uek/YsX1fejE3ZSQTduQV/5DoVwbGrMGbDWWF86059dkUCEuvHUVFx4UnuV2
         em8Q27Nrdzb+y5QAZM4JAVAWqd+vZCZco1HtDYGerWHyRYGqgmUKd9HDX+KsL0aOFv3E
         R4Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aUkf6ng5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si11784811ybk.127.2021.12.17.15.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 15:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aUkf6ng5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myMgz-00025A-RH
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 18:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMgP-00021H-CR; Fri, 17 Dec 2021 18:30:37 -0500
Received: from [2a00:1450:4864:20::429] (port=36741
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMgN-0000gC-VA; Fri, 17 Dec 2021 18:30:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id r17so6493283wrc.3;
 Fri, 17 Dec 2021 15:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PyOdFmZygCGVLNn7Pxdq98PoJywaoUaIsyCZRSl4x0=;
 b=aUkf6ng5486I00zDM+Iz+BQl+htto9sPtN+tKIgMezSmj/0KY6lLRTPmLblbCqlUve
 a5cFJ06NWEE3uyixeG2SqkMj5N9449lF5koA52D70JaM8WVPj0s5YRNgemxzOXw0aOk9
 4/rnhM7apOkgJm4UkBGVZF25xCvUmV8DqpfVHtuCe9KO6WRsgSQjKMvhPHW7vCQDxmZr
 9/QM+VbBgmsxLEg1f11bVatgz7LEUOyDKasrBgkeO2gjxb2LQ9Emr2X+3XK2YIRdSiTi
 GHajaSHQzalbGsNCfbonuxCThpFYilIpu3myOsWE7sIFcTj30UI+oLDKnmyzkOlFsIGv
 0rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8PyOdFmZygCGVLNn7Pxdq98PoJywaoUaIsyCZRSl4x0=;
 b=Kzsvrr14FFt6SisiSPpi45t/iOiy/t6cvzOGc4u4ozqlBiWD7uTujDda0kLVOHzpwV
 lrlYgoD/DH6jgkl8ePt1QFnmtt/GirkjdSboUWQQ4LSU7EQv6SVRiZbsWivtwN22FdsO
 eUHrtUIKjStDtdFxQRT8PgLWiRbra6UB9UhxeIEjqf3/SJDIEFZjr6vxjA2ricSTzDjg
 +Mngb+uHBWNSTXhIQReVKP2VhO8QLMWTn0npnSGfkKd0o+3gUlL/oT4H0HtDJ+ZJWfbf
 I5D5vf+G0/S47tqgTuqr88HccznnZ3yoDPNw22FYzfywiK9X7DudYhnQLTGrw2yCDXtS
 p2Wg==
X-Gm-Message-State: AOAM531nt1vn8ty+0URoTSONx6ZXFX0dK993COjXC7jZIvIaUzLZzIlK
 IATQ+vfVt9bBLsmB5cFbUT5ziQFM5g0=
X-Received: by 2002:a5d:6349:: with SMTP id b9mr4132758wrw.152.1639783819487; 
 Fri, 17 Dec 2021 15:30:19 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f18sm8433841wre.7.2021.12.17.15.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:30:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/arm/musicpal: Fix coding style of code related to
 MV88W8618 device
Date: Sat, 18 Dec 2021 00:30:05 +0100
Message-Id: <20211217233006.1466747-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217233006.1466747-1-f4bug@amsat.org>
References: <20211217233006.1466747-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A/BOOjJeYatt

We are going to move this code, so fix its style first to avoid:

  ERROR: spaces required around that '/' (ctx:VxV)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 2d612cc0c9b..6b5310117b8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -309,13 +309,13 @@ static uint64_t mv88w8618_eth_read(void *opaque, hwaddr offset,
         return s->imr;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        return s->frx_queue[(offset - MP_ETH_FRDP0)/4];
+        return s->frx_queue[(offset - MP_ETH_FRDP0) / 4];
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        return s->rx_queue[(offset - MP_ETH_CRDP0)/4];
+        return s->rx_queue[(offset - MP_ETH_CRDP0) / 4];
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        return s->tx_queue[(offset - MP_ETH_CTDP0)/4];
+        return s->tx_queue[(offset - MP_ETH_CTDP0) / 4];
 
     default:
         return 0;
@@ -360,16 +360,16 @@ static void mv88w8618_eth_write(void *opaque, hwaddr offset,
         break;
 
     case MP_ETH_FRDP0 ... MP_ETH_FRDP3:
-        s->frx_queue[(offset - MP_ETH_FRDP0)/4] = value;
+        s->frx_queue[(offset - MP_ETH_FRDP0) / 4] = value;
         break;
 
     case MP_ETH_CRDP0 ... MP_ETH_CRDP3:
-        s->rx_queue[(offset - MP_ETH_CRDP0)/4] =
-            s->cur_rx[(offset - MP_ETH_CRDP0)/4] = value;
+        s->rx_queue[(offset - MP_ETH_CRDP0) / 4] =
+            s->cur_rx[(offset - MP_ETH_CRDP0) / 4] = value;
         break;
 
     case MP_ETH_CTDP0 ... MP_ETH_CTDP1:
-        s->tx_queue[(offset - MP_ETH_CTDP0)/4] = value;
+        s->tx_queue[(offset - MP_ETH_CTDP0) / 4] = value;
         break;
     }
 }
-- 
2.33.1

