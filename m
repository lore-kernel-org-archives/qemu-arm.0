Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444383ejb;
        Mon, 4 Sep 2023 09:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUCkHoaQ8qPvaA3W+UEgd4yDu3gh/OAetZLwVUDIR1XBLArpl/c3HBLVz/vpxPuhko2Aa7
X-Received: by 2002:a05:6870:c228:b0:1c0:b03d:cf97 with SMTP id z40-20020a056870c22800b001c0b03dcf97mr11903540oae.44.1693844075333;
        Mon, 04 Sep 2023 09:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844075; cv=none;
        d=google.com; s=arc-20160816;
        b=mp+puMrDvs0Kwc/VmMFoMqlP4G9Kyz9TZKRzP0tkZOL69F64On0vQiHK3FYSCZ+6Tk
         7+wBvb4cb4htQZGgMqSn1FeBiL99h2Mxeb0vC6bfGgiRHeIf1mERSq7ZhdRly8bzOyk+
         1sk9B5TAFQLNA1XXJYyxMFrLMFzczony+oEWMQ2e5cVq/OE70VqILI2hIkoLAjDU7+pf
         zZa148hAG/MC1WJPeNwl4WA6gltPl6l7FFjHp4ojig6lZCLvutVycDuIyfreS/9DF8Wl
         /KP6UDxXsNlHGfv/ZNjN6b+zxH/9FgcjPV2tmVcTj3biV7QMl74gbXJWt0x5+H8Hzo0y
         zqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
        fh=AtxmCag4qEbqn9xG4sHIYGW2U/bX6/m/Of4KaQ2VYN0=;
        b=m+tCDs0mr4zI1z5He6hGYRvoybsCrfuk7s+2UjS0ujZPXOP+ejUizdnyczN5DjwFXs
         9rn8wFnk+b8I06VYj+tEzmYA7FEhB0fgZVFZOKXv1EupF7SmEOwBjYSvRsuNjcUpExV1
         beBse5/iVg9QuY3i+IKoAj22OHjohKkl1rUUh6Gocc2UqQJXapJeXtMRLZ9X6TLqOPNx
         R9hicQ2ChRk9kJMvhBJfg63lsq+VWIwpBmGshwyZpatQcKdzQQ4adb3JMdIpPh0FTXSJ
         UWTcT29ZXERAbKyVgGoNI615CN6sdfnNDfwpqcsA6AS6EN3nKnGtEGNAdjIKtTk9grcb
         1U3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b8IvZ87j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a0cf4d4000000b0064f5b24c6ffsi4341705qvm.426.2023.09.04.09.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b8IvZ87j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCD2-0003H8-Hy; Mon, 04 Sep 2023 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCv-000310-S5
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:47 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCs-0007cI-Ow
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:45 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500b6456c7eso2877911e87.2
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844021; x=1694448821; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
 b=b8IvZ87jR2GMzz8uuOa7KA12NFZ86sBzeaWoM4fN4k90H7hQP3NKHVqG2a89RQlgOo
 e1zUgnp6bf5moaIxAeXukqdZTz3TwUlphMWcSYbRY2j/LUyLfM27wJll7c4mRAOXvvUs
 GKCcCxefKfqEihNp+rJuGXNNrPNH/v4FdqYwNnhvv5Hb6dte6k0v1RmilYdgSaOY/kSV
 lQZvEVAAwyXK13wxwq6Ys9pnuOICTWDXMAqB16ytOhbpuBBWBwvSOnHGims3pcCLeaKi
 Hn+BkbmK21VGkaJHl4CRa/3dsHdcKb7n2K9pFr4YX8sel4lvPbQ/h49SXHNGoo+QmkKy
 IKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844021; x=1694448821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KLx6XBhwZsbEqcvd2/L0DAF2KnkpBlHb/IZBmOztIQ=;
 b=EH1GNxSWBBVG1rOWTw15LqaTC/nGDng1alF1stWqagOwji2YLtc2CHK5htr4c70MzM
 ECuaaM9GZoRNf2MB5kTrLtUJghlyR4XzuPzJxLxjsq1U/F7y3F3r1KN3w+khkdk89tfL
 GmiEZ8CRnhd7jLDsqja3hkrJkqoEZ9fYvNKN107+CoXdGOha7ivzklc6P792Xlor0QjP
 6vRlVFICify9Kcj2jb3uZcyOSeXKCPH/jd0A2hpzoSYEd/1MAvBKjaoMUwpGlA1ehBiL
 uOlt4rBkLMC8XuM9YapRtGPaJNiXbgDNcleU/fr4Lf29O/YsSqNB8ATyDz5HSYH0iD4N
 yD5A==
X-Gm-Message-State: AOJu0Yz1sT2vbkMqvEUnmitpi12ItjetPDE8rG4pt7C3T/P2VpBz3J69
 Q+MNOIGN1h7lbf3EkyBG0yilQw==
X-Received: by 2002:a19:6914:0:b0:500:b2be:61e1 with SMTP id
 e20-20020a196914000000b00500b2be61e1mr6672295lfc.58.1693844020699; 
 Mon, 04 Sep 2023 09:13:40 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a1709067e1300b009a198078c53sm6306103ejr.214.2023.09.04.09.13.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 11/22] hw/ide/ahci: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:23 +0200
Message-ID: <20230904161235.84651-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: Qjn5evpKeVl7

  hw/ide/ahci.c:1577:23: error: declaration shadows a local variable [-Werror,-Wshadow]
            IDEState *s = &ad->port.ifs[j];
                      ^
  hw/ide/ahci.c:1569:29: note: previous declaration is here
    void ahci_uninit(AHCIState *s)
                                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 48d550f633..8c9a7c2117 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1573,10 +1573,8 @@ void ahci_uninit(AHCIState *s)
     for (i = 0; i < s->ports; i++) {
         AHCIDevice *ad = &s->dev[i];
 
-        for (j = 0; j < 2; j++) {
-            IDEState *s = &ad->port.ifs[j];
-
-            ide_exit(s);
+        for (j = 0; j < ARRAY_SIZE(ad->port.ifs); j++) {
+            ide_exit(&ad->port.ifs[j]);
         }
         object_unparent(OBJECT(&ad->port));
     }
-- 
2.41.0

