Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3063235lfh;
        Sun, 22 May 2022 11:24:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwsn6ZVR+8atrw34ASqKUPcSL3NM31+jarg/r4oHTXPuhwHUajxCebTaEcXUji422Qqglg
X-Received: by 2002:a05:6214:1c83:b0:443:6801:6d06 with SMTP id ib3-20020a0562141c8300b0044368016d06mr14895391qvb.40.1653243892099;
        Sun, 22 May 2022 11:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653243892; cv=none;
        d=google.com; s=arc-20160816;
        b=crLzNoiD2FELuPJH0ExgmREQ2Q+662fLRTT11nKtw4TSp5RecpKzlQ1XaccL06Q5cG
         A/wwdMutTXOFpiFhS5QAQWmGyCaXHxiZWd0oBu4tlMdcooe5CfAi6d+O4FgLlOkZFxmR
         +qCkNwIXL7x0huJbu8B6vkXj4msS3JP/aUW+22t6i1JElZ4PpB9I569CGebJFeNYpQQ5
         aefeh1U+5lnWRY4p0jyEqYQwr6x06FsQbCcFETmNJFHh05ExC2qedGkfpAs09i157nV4
         VafwN+U9jTo8so+DE2c+xQ2kik4f8/wjlzhNW21Sn2eH05sfjj1e4JgTfNgkhTF2bFxZ
         yXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=oBbrmboxI2bOPyV9kjKCEFJMiErNmCGv2G8E9N42jsY=;
        b=xHsSb6QxW6aWpQRqXIBmA5NQl7roQt2NxmE/dkG3Ur8sH1OdB9sQ/rzrDdzV0xs7ry
         LFmIMcrxXvigX57Z3XOEViWy6WbNIW+J6B18S8yHgNZlBvvN551hcxVKsmRg6oO1sDj5
         n4OKqgWvkPwnLnv7UdMGihxb3fIDs888InwpH+YUvcNEc5tNwqvJqkYGH1YUQXG+cJWj
         8Mh4wzM7MlPxJC53p5TyTzO1PP8o7NdyrlMvMe9oTGihEivS7F0XrBSP+aXSbXre6J/P
         DDSGjRTmWObZrHKKoy/l8suO8gFicTl33jhsz3ucedpEpi5SWPl1MwbUsgT7IaHAAmCe
         j+vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ZECAW4yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05620a22f200b0067e4be2382bsi1104946qki.112.2022.05.22.11.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:24:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ZECAW4yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:60962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqG3-00077M-K9
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBL-0007lv-PH; Sun, 22 May 2022 14:19:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBK-0003aN-7t; Sun, 22 May 2022 14:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oBbrmboxI2bOPyV9kjKCEFJMiErNmCGv2G8E9N42jsY=; b=ZECAW4yBfvPn4dvbwclvXNZoMh
 o7e7oW2NWSLzcb7muSsvhaI4dXInbn7p7+01lWDMu1EdygVLUS/n9hVOM+yg+r+ETemteieK7w4bu
 9OnoR6W9WQT0AiDt/mt8f+HEe2xOn3DzWwjSbV6fHv6dJtJ7V+uNzlbT8EQB1LKGw3X+rpcfZBUct
 q2C9wwbFtq5Z3yhu2WXLmdYDmx6LY9NloIPKgLA13dwsdtvXIm1dNRrysYvECFoYG8+X8Dr7e9tmQ
 htL+GTY/kBCG4kRVM3IihWD9gJTFgwQBJZ44YvTNhxafLxf52Xfn9FWyl+h2LOwaMGkCeyfFavrqc
 BwZLfOWx/2WuTeyGuGWtYlUyOF77NNBOs92QbrODvbeSG/bq7I2PtErm2xCYcOLq390KgzIuuGOH9
 Osz1IhKDSWPNbMemgeoLSjN0cZQQ/9qoFbBX5hIfOIF4WAsjIRhvDOc8wSQgdnGW6uHQ3g8vIkt5o
 nKmeeLYnuGF2tlgmjRfhu8qZ5Hs7OqVeQ9WrieU5afrbMaYiztr0UrEeXGQI8PvB/UQwPkM9yTgks
 c+asEoJR4Zn6ECovcCNFWtRDmIPw8F8Td6oO83+Ss5WQXZp7W6KWLs064HLsVZhhwc6UlTXz5AujB
 8CzX+ywWhlc1CzKDa07fenh0mZnq/vgKTAwvSh0+Q=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsq9q-0007pH-G7; Sun, 22 May 2022 19:18:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:02 +0100
Message-Id: <20220522181836.864-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 16/50] lasips2: spacing fixes
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWr1IPpj4Qm/

This helps improve the readability of lasips2.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 94f18be4cd..2ac3433014 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -205,7 +205,6 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     case REG_PS2_STATUS:
-
         ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
 
         if (port->control & LASIPS2_CONTROL_DIAG) {
@@ -238,9 +237,9 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
                       __func__, addr);
         break;
     }
+
     trace_lasips2_reg_read(size, port->id, addr,
                            lasips2_read_reg_name(addr), ret);
-
     return ret;
 }
 
@@ -257,6 +256,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
 static void ps2dev_update_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
+
     port->irq = level;
     lasips2_update_irq(port->parent);
 }
-- 
2.20.1

