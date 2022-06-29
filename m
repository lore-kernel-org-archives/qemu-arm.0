Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp445762lft;
        Wed, 29 Jun 2022 06:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unKk+P/72eNJ0ZsDsDe41vSVSWMnjt+h8sCBN1Om46h80nNTaf8rWweeTj/F0Xsiwivs5V
X-Received: by 2002:a0c:f30a:0:b0:470:1c38:9508 with SMTP id j10-20020a0cf30a000000b004701c389508mr6713605qvl.66.1656509201860;
        Wed, 29 Jun 2022 06:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656509201; cv=none;
        d=google.com; s=arc-20160816;
        b=o2FU+jVkL/62Fseqo+/mpM/jCj2Lu0r15I+7um55xtvVQoMQJTa3A+U9rTOA/k216n
         6RYpISe90l/e8aHiT7e+/J9KT4N+96ueGyPey9L9oh99uAynY9ERMEDWJzyNPCLwfkv+
         ZXRn74UKxve6DL7hpnaGomzE/GPuEcCKsK7f+IfQCcmwsTtUliKPiRF2jlxUfIUNHCjZ
         vQupDy0stbtzK0ULbxQ2+KI62XzlD1HFy2UWJ1AH2b9jHdwWrID0+ssoEI4T7hqtBfSm
         QC+uPOhmzaCcZ2mIWUiN4YtAFxL802eFw3zNzfHqwR47GE681Zo3UF9DIRJQ+3j86CeA
         wE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=uo8Rl5ib5SBmy64726XOtXcKaieku521mK0ezQnJnfY=;
        b=I4GUwvv+lU4hqbZef0ntxNXx7HFt6edU5JD4O8LAFS4eUR3yMGW4sywkZZdvZubZVp
         bgry3oG3kFFneSiOEH2GFuQoBcUxj0fBRxkG3yxcbYYCmfDV6BU9NyS+GQRIxX6Xe+tv
         KqmGENEyJpfyvtgrLYjSJtzlAp+veepwVBcuQXSPLa9nRe3j/Ux1a2/xTJV+UdDfqA/C
         aR3Df74dyMBEixHD7GsoI0G2qsi9vFv7Hb3j2axnSZbuVdyJnh8wWzUORy9SYmr+uDG3
         kTzI3eZ4NwWZDbcpgc6WYPoXReptzawhnZ7z65PwFnlQ3Al/Yen9PZ3sQe48eHyZDknY
         itZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=IbHGybOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020a05620a401500b006a6a53e26besi985346qko.669.2022.06.29.06.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=IbHGybOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XiL-0000J2-8f
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1D-0000Wh-0f; Wed, 29 Jun 2022 08:42:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1A-0004ku-Ga; Wed, 29 Jun 2022 08:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uo8Rl5ib5SBmy64726XOtXcKaieku521mK0ezQnJnfY=; b=IbHGybOu+wO7F5D9BhtLXtKRUW
 HhEdtuIhxhKji28R0aiZ14qNraK+EWREM80Cp6/x2h2iwCW3cKxWpvTEmNWGkdVL3LJTqQMtuXfb5
 JfBiKpJZfjUdxK0CYaEQeOSErbGNVIeDhiWG/wB3e8uqM+W4Pw27Rb2DnqKdNYVoIAnk1ALCkXWBe
 8PTqD5ebuemWVXd+8IdiRXZ/K50wJM7SXXzvP+Zr1nG6iTXvEcIgzrYmFazA6lov9wlRMCbj8klXv
 0ymuUbQvUE0nUlUBod3tFXEBbg0C7qRE5TI70FvywWTw2+oyq4axjPfJDZEyEicQVP6qDwS+z7xkw
 R7IIGKJB/cRQoyc5ub63fPvdyFwibR1S2Dmy9IKVWT5sQuZOt5mWosqVXokXznmmtOJJWhwM+rrbK
 sZdg8+RP6Wjbume4uHVIL9xiHgqTb8qKTR6/Pgt47jaZrgtchmJO4cAoCoiGmPdacW1e3Df1HPSnm
 oWrZFBiq4n34zI9bcnWrWz3VeRlTHYOkyyEkb2cAO3ahhuNf5ZFWYIbeeZqowbs8Sndd/HefNrwTX
 bWmFLLlEVnnL4qjeb7oFJDQywG0WU1ZPp20403FBhf3Etjp+N9mfA/54JhZKO06FaojegUfR7QeMz
 6iXVs5l2N6pvOFSj+fy/zypU3k99tE+msYN6ZzCvU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wza-0002tZ-8M; Wed, 29 Jun 2022 13:40:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:11 +0100
Message-Id: <20220629124026.1077021-26-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 25/40] lasips2: introduce LASIPS2PortDeviceClass for the
 LASIPS2_PORT device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: crX0KiaJUf/d

This will soon be used to store the reference to the LASIPS2_PORT parent device
for LASIPS2_KBD_PORT and LASIPS2_MOUSE_PORT.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 2 ++
 include/hw/input/lasips2.h | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 6b53153838..10494a2322 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -334,6 +334,8 @@ static const TypeInfo lasips2_port_info = {
     .parent        = TYPE_DEVICE,
     .instance_init = lasips2_port_init,
     .instance_size = sizeof(LASIPS2Port),
+    .class_init    = lasips2_port_class_init,
+    .class_size    = sizeof(LASIPS2PortDeviceClass),
     .abstract      = true,
 };
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index a05f26cbd9..426aa1371f 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -26,7 +26,11 @@
 #include "hw/input/ps2.h"
 
 #define TYPE_LASIPS2_PORT "lasips2-port"
-OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2Port, LASIPS2_PORT)
+OBJECT_DECLARE_TYPE(LASIPS2Port, LASIPS2PortDeviceClass, LASIPS2_PORT)
+
+struct LASIPS2PortDeviceClass {
+    DeviceClass parent;
+};
 
 typedef struct LASIPS2State LASIPS2State;
 
-- 
2.30.2

