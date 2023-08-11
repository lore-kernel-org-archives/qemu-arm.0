Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1145015ejc;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrrbfVXfFH5Kl8Kdi6vslZgEaDQt+AF0KEDndMIHW7k4r/ea9Ct5oLeDZg0XygSmtTMhwm
X-Received: by 2002:ac8:5fce:0:b0:405:49e0:899f with SMTP id k14-20020ac85fce000000b0040549e0899fmr1124449qta.39.1691733024453;
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691733024; cv=none;
        d=google.com; s=arc-20160816;
        b=lckU1BIqPWSOoGpwMpn3rGuuX/XwSeCh4/IrtShwR5rDA4OHV4ll/CKN80txQdEvC8
         ZLOK7qoxFrHGmPjoUAR+ct9k9i/mGzmbFHMHZMFiGfVQiSQglNlciyiL2BN8Ilcbb9Dy
         kgCrMgBM5wq0c3I66weCUpxGfVjKei3NI9MLNpUiBScJic1g3HzelqBmBjqVjnOv/l5n
         +52ZEm73ut50deXYNsU+G19BNTUsUhEsK4gKZS+LJahGeH5M9DPxnm4GzVTfavT40Io9
         XyoVcJ5d3VI+RIxe2qD57yoZe8tkTZwsR9ktxGONN4o+/y+eHvOmQmOaDK6QWUH5fPz0
         ypbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=3uiSJr3/aO5IcLe0yFFWTRemrluX44+NMqNcEERfLA0=;
        fh=AMR19zN7UeIFFKOHDQxut6BsIZvSGFg2htn/sF8xGRE=;
        b=q+mvkrFoiz/MksK/Wgk41lby5fpzEiuaUDqxQAW2nG+RwXqC3dFv9w0KhUxPtTNemZ
         7wbxe9RCn0fXFzEsePbb56hyS6UX9bkn2p+8VnUm8HiZkNshMxmuXG3aeEJYowBCKYcE
         t2mwgkzu5yCJsbRuhXRS+CRhV8ho9awUxhoPi4/dnifI3d2w2RXMatsbEmlvRvnV4mau
         8Lv9QXqceXxR/cDsjrcwczGJ+Lni2GatFN1MIKZFMBknWXzQisLGkJxu4BUDFO3NMRkF
         2f2jgdXgFvxvBiPtQPdAfA8wpICPxi0UZrN7c1+t5ewKhFh2sUJ15uwnuPXon3W9Qydi
         sSRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ov5-20020a05620a628500b0076cab6e9e69si1662193qkn.158.2023.08.10.22.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 22:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=stu.pku.edu.cn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qUL1l-0007w8-W6; Fri, 11 Aug 2023 01:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvX-0006Kt-Mf; Fri, 11 Aug 2023 01:43:11 -0400
Received: from [2401:b180:8000:2:9109:19ec:a055:9652]
 (helo=B-L8MBMD6R-2342.local) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <francisyuu@B-L8MBMD6R-2342.local>)
 id 1qUKvV-0000JX-HX; Fri, 11 Aug 2023 01:43:11 -0400
Received: by B-L8MBMD6R-2342.local (Postfix, from userid 502)
 id 5F01F38B141; Fri, 11 Aug 2023 13:42:52 +0800 (CST)
From: Hang Yu <francis_yuu@stu.pku.edu.cn>
To: qemu-devel@nongnu.org
Cc: komlodi@google.com, peter@pjd.dev, Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PATCH v2 1/4] hw/i2c/aspeed: Fix I2CD_POOL_CTRL register bit field
 defination
Date: Fri, 11 Aug 2023 13:42:16 +0800
Message-Id: <20230811054220.99562-1-francis_yuu@stu.pku.edu.cn>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2401:b180:8000:2:9109:19ec:a055:9652 (failed)
Received-SPF: none client-ip=2401:b180:8000:2:9109:19ec:a055:9652;
 envelope-from=francisyuu@B-L8MBMD6R-2342.local; helo=B-L8MBMD6R-2342.local
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 11 Aug 2023 01:49:26 -0400
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
X-TUID: egSBoZuihobs

Fixed inconsistency between the regisiter bit field defination in headfile
and the ast2600 datasheet. The reg name is I2CD1C:Pool Buffer Control
Register in old register mode and  I2CC0C: Master/Slave Pool Buffer Control
Register in new register mode. They share bit field
[12:8]:Transmit Data Byte Count and bit field
[29:24]:Actual Received Pool Buffer Size according to the datasheet.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
---
 include/hw/i2c/aspeed_i2c.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 51c944efea..2e1e15aaf0 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -139,9 +139,9 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
     SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
-    SHARED_FIELD(RX_COUNT, 24, 5)
+    SHARED_FIELD(RX_COUNT, 24, 6)
     SHARED_FIELD(RX_SIZE, 16, 5)
-    SHARED_FIELD(TX_COUNT, 9, 5)
+    SHARED_FIELD(TX_COUNT, 8, 5)
     FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
 REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
     SHARED_FIELD(RX_BUF, 8, 8)
-- 
2.39.2 (Apple Git-143)

