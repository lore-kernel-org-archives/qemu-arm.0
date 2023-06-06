Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3394526ejb;
        Tue, 6 Jun 2023 03:47:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MXWOBwd6q8ibPyh6/qx4VWPmUtTicumhJYBeAKKs851hscqAJCrAEsV3w3WUGNRdCbuCJ
X-Received: by 2002:a05:6214:29ec:b0:625:aa49:19ed with SMTP id jv12-20020a05621429ec00b00625aa4919edmr1518858qvb.58.1686048426995;
        Tue, 06 Jun 2023 03:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686048426; cv=none;
        d=google.com; s=arc-20160816;
        b=F9hNjL6yrpVycmyqNG0sK59QMABXGoIDBkly3EocZAOad8R7hQeHCRD3iY+gEN6ZCO
         D1qCWZBEXejwsHbHGSMibCdqf1VaTXbmIitEwyaRUrsz5bt9jk0sMmdCWLh758z1UAxE
         ZYQpR0Hin29phVWtivG7S7Ifxx1ldUPE7EQm0nXLJdbR9z01O4jdlbVo+8M5CEbK8W+8
         8+Ai1xtUsCzzLK5V0JN/23frlN+pGkzPdaT2pgaSV+nGTqH6p5b6AliPKcDzVcm6/i+C
         nI9oDrhsGbVmLWLlheM69NUcGmDDpxuUyueOT8/ICY469/V+sCXcGDBG5heSVIFFmtNf
         sdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4aD9+19nYJuVLBjwZpPyQ1i9VBe5ol2xDDEn/QIZ0OQ=;
        b=T44M829eZjqn0DWa9q/VB7evDy5Lu7d0Zyh51aLH0PkZkEOrIsSJqgvv6zBqGKRfm+
         LtUB5f4IuXj64hbxPCt3MGShlV8pwbcmv5074PPwTjAVTyMU2M9f/8W2KhxG2C+K8N7s
         MG2p/1ZgLfdSK+DoU/zLBO+sIwLoSr6VA5I6eO+zbmLp2gJwlqh8BgYGon34hLbYXEBh
         BpvjPmLAhY+oVQyrbgHA2y0ZiMvtS1k1bwOGpD5JIeZ56PakGcOSsBehLiQx8j6G7fdN
         hiFuybjSfRGOSiew/KOxZyHf7IfC2amc3+9Jm1ZSt2WugKQTfHlpkKSQNUnYTOLthY5g
         Nniw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIJ8oOID;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020a0562140c2700b0057049fa63cesi6118304qvd.570.2023.06.06.03.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 03:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIJ8oOID;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6UCe-00013m-As; Tue, 06 Jun 2023 06:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCc-00012u-Au
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:46:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCa-0008Ej-Hb
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:46:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso42832935e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686048371; x=1688640371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aD9+19nYJuVLBjwZpPyQ1i9VBe5ol2xDDEn/QIZ0OQ=;
 b=CIJ8oOIDc6dTDWS1nq6qF9glYAhB1YR/HoIJirnb8WXyKD3d35NJHick7/SorY2z0x
 Vbcrx4TqayC04jpTAf89/FOeBn7hgK3C/5BQb+yTI761D2P5DbPVA6GmONOscP458WTJ
 3bllAoUbFdX8vH6d8xsmgYOBjWCgceEaTWbIg06N808NnmCOohC3Bj8mUwjhWL0oEZeP
 TTQ4S/zuwqkGV/9tb2MHqlxRg2LAq9ccpVQ4WHQV9ztwcp8MIhzHtEUGwygX0lArIWts
 HVlG4dBbhwo8cFEjRwlYcVdS/Ch+yzgPxsxDcA59GYHA8hhAI6X7cNXP7LcF8aTXtSRK
 5gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686048371; x=1688640371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aD9+19nYJuVLBjwZpPyQ1i9VBe5ol2xDDEn/QIZ0OQ=;
 b=Z30NrBybRFCJPPN4U2WDQ9WN2fNUJWtVFibd3piZlTmwEV0OfDKTKpR6aZL5BSYebC
 6t+d4hHbEkEirRXrkCjzvI9aFCya5RsglM+Wl9bknAMiuvG+58khbljaT6fP8Po9nVVV
 Nv3Ky3ka4SNWEKN6+Knx4CT/+CiMNoZUqk2UFuhC+afkeHETyAOksV4vgdZMPjetDEE9
 OY4aEf5WaZhxo50329ee177GVmg3jzMW3UaXQvtafwP2QR5hoySroa5UHga640R1rDot
 yuE6KcdB0V0JiZ/l6BYr5qZnuDAoj/00lBqu5b0baF0GeP3nT3yA5gShql1Yx17N0acf
 ovxg==
X-Gm-Message-State: AC+VfDzKhz963HaEftUHtFHfuMwZ1qpUBrshaDywDcbh9JzQ9Sz6JInD
 +c/FpqPlnI2BjPO9MKpGiG+Yarr8a1ARbaOrvjA=
X-Received: by 2002:a7b:c417:0:b0:3f7:367a:bd28 with SMTP id
 k23-20020a7bc417000000b003f7367abd28mr1552445wmi.4.1686048371156; 
 Tue, 06 Jun 2023 03:46:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm12195508wma.41.2023.06.06.03.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 03:46:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 1/2] hw/intc/allwinner-a10-pic: Handle IRQ levels other than 0
 or 1
Date: Tue,  6 Jun 2023 11:46:08 +0100
Message-Id: <20230606104609.3692557-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606104609.3692557-1-peter.maydell@linaro.org>
References: <20230606104609.3692557-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: F4xnIWzRdF4u

In commit 2c5fa0778c3b430 we fixed an endianness bug in the Allwinner
A10 PIC model; however in the process we introduced a regression.
This is because the old code was robust against the incoming 'level'
argument being something other than 0 or 1, whereas the new code was
not.

In particular, the allwinner-sdhost code treats its IRQ line
as 0-vs-non-0 rather than 0-vs-1, so when the SD controller
set its IRQ line for any reason other than transmit the
interrupt controller would ignore it. The observed effect
was a guest timeout when rebooting the guest kernel.

Handle level values other than 0 or 1, to restore the old
behaviour.

Fixes: 2c5fa0778c3b430 ("hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/allwinner-a10-pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/allwinner-a10-pic.c b/hw/intc/allwinner-a10-pic.c
index 4875e68ba6a..d0bf8d545ba 100644
--- a/hw/intc/allwinner-a10-pic.c
+++ b/hw/intc/allwinner-a10-pic.c
@@ -51,7 +51,7 @@ static void aw_a10_pic_set_irq(void *opaque, int irq, int level)
     AwA10PICState *s = opaque;
     uint32_t *pending_reg = &s->irq_pending[irq / 32];
 
-    *pending_reg = deposit32(*pending_reg, irq % 32, 1, level);
+    *pending_reg = deposit32(*pending_reg, irq % 32, 1, !!level);
     aw_a10_pic_update(s);
 }
 
-- 
2.34.1

