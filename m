Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496619ejc;
        Fri, 1 Sep 2023 02:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcA2JAy4Pe0TA3qx9OfmAMUOJ0BKvSrAKNRgIE0xL9bWCtpUjKgXZqgRw+9y1OOWs/2Xqw
X-Received: by 2002:a05:620a:385a:b0:76f:3a9:bd5d with SMTP id po26-20020a05620a385a00b0076f03a9bd5dmr1618737qkn.42.1693561496532;
        Fri, 01 Sep 2023 02:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561496; cv=none;
        d=google.com; s=arc-20160816;
        b=fuzTg+3tGYTIqazeDJige1QukLLHFmjXO9Sa/iXNGFcaN0sy1JbgGV1H5bDEDSSUja
         4OiD/DwHK1xuQI9ahekvFynnKFc1p9WJmbAf4IoW1l74XcWr47lHTJk6wNyRkNt6zYa+
         w4M7NDn2yWZGSCMVZrKgcmdJrZfvoVxswbluIw9Ab/w+gZM9bILf3vx8oH/YcxqPmqCn
         N/dVoEfQzClCPKTw+U6dHnZwlNyrRGR3CsqqxczPUT3EO6OwA5L+4f8YlHVawK8rt2NN
         5cF5+xtoQRaklnznppEtl6TY1MZIQs4VnEmc4HVwdePjv5JaFFX5KVsrXYeTT6AQl6+V
         6chQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=EGEDk8TfESpb2jaQTDwyMomp/1h2Qs+UivBpvTtwSFY=;
        fh=sAFxsovMRUpeK1m2ZrUTkWk2zuchzNgVidyR5jMbIm8=;
        b=Ny9OYplPLf5ymFdZkVlqrJ6XXDYxdrKatwTtw7xiLGCuv4UJkNg70Am7WFn9B/BTKp
         MHEm6PrRj79OY49X1OEUUTEm6DFiRgMEeKZf9+9Se+QFnI6OpMRM9KuNdf66Bd/HBbqJ
         v/AQffufEsaYNxHnsLN++j/ixVVwn3vBG8ZJcGrafXMzs8olz2dZQmSvwD2aJX69d6gJ
         wFe4xGwCswYgeHXiGhY/hOzamshhUQ2GXLZ2j7JY/z6tR1f0Yt2L3LsxMS3MAgbyng6R
         8HvMh2Bw6/nxCHWsrHqfN9KOVv29fvdCG06S4Qa23GotOkIRUg9fElzvRWwOXFOBT3tA
         Ergw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rh7-20020a05620a8f0700b0076c81d93400si2060906qkn.773.2023.09.01.02.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0gG-0002HK-FX; Fri, 01 Sep 2023 05:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g6-0001yu-Fv; Fri, 01 Sep 2023 05:42:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g2-0002wb-Ea; Fri, 01 Sep 2023 05:42:58 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3x3WTYz4wy9;
 Fri,  1 Sep 2023 19:42:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3v59hhz4x2D;
 Fri,  1 Sep 2023 19:42:51 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/26] hw/sd: When card is in wrong state, log which state it is
Date: Fri,  1 Sep 2023 11:42:02 +0200
Message-ID: <20230901094214.296918-15-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4VAIBcAObwoA

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We report the card is in an inconsistent state, but don't precise
in which state it is. Add this information, as it is useful when
debugging problems.

Since we will reuse this code, extract as sd_invalid_state_for_cmd()
helper.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-2-f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0be9ee965ac9..4412559c05be 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -966,6 +966,14 @@ static bool address_in_range(SDState *sd, const char *desc,
     return true;
 }
 
+static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
+                  req.cmd, sd_state_name(sd->state));
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1534,9 +1542,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
     }
 
-    qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
-                  req.cmd, sd_state_name(sd->state));
-    return sd_illegal;
+    return sd_invalid_state_for_cmd(sd, req);
 }
 
 static sd_rsp_type_t sd_app_command(SDState *sd,
-- 
2.41.0

