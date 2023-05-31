Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp29492ejb;
        Wed, 31 May 2023 15:35:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vebVN4qaDYtQl20OAbs7f0Y7l+6vfJKjLK+rSIw+BBlGZDUK1HF0LjCJnzljblJ/WrPhE
X-Received: by 2002:a05:6214:d4d:b0:621:451b:6e1c with SMTP id 13-20020a0562140d4d00b00621451b6e1cmr8726934qvr.6.1685572508819;
        Wed, 31 May 2023 15:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685572508; cv=none;
        d=google.com; s=arc-20160816;
        b=Pxo1EssaUgBXQMz7n8s6TLvCkKvJSV+0qaPmurbYBBW/e8jfrIM80G4KrbCkRSrnWx
         I/kfPydEqZi3Wey6AyU3dxOwrlrxuAc4MTk9Xgn6f+irBQN5+uVNqkpFaF9Sub7b2I7D
         OeOuaSLBrvjJ7gvJHeUcOvnlecPBYxkyAcYFOoON4b8N4jr8x8W+PKfCGK8iZsqBiXkL
         IGOlZ1FH/MOXlnqgy0VNjO+7g9mTbWFEJs03cjm+mQzIRIm4GGwHbNYbI9HEjn0uLuD9
         qSK5aC233UNW8Sa/NEU3KV6ODuR8x7IhmZHz0r7Heybp8SA6AlI9Ax8menTZQiLi8kAF
         g0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cytFQrzGMvOi8slgASF27XRO51GqurNYCbfldEiqvjA=;
        b=sGsZ1ESL8hgUogUTWfrJRJDoB51AbIJpQ+LhBxYQJWKqljjua8xtucpp/l6UDrrjv1
         mGShnyWGwLaltL3HI5iDGCmt9GpjkEIaVf3ZNhbdqatkvR07Fp1fSC74EuvJtkR2u/Jk
         5QvGpEed7APFEb87T3fzAVo+U1f3oWPZMCbwLVs8H3YVu4DcmC2OzBHPnZruYm98CTA8
         PwSxvJNC6liYtwaN4EP/2wOOB1WJ8ys+IRTvlCxhr6+0/0ycFSnBW4kYo3SHIVDafPmf
         csCJDEwpdDQaylbCBNehBYzulYqJvIAywG0kTrRv5x5j2SV4wns6UXiRB4zXpfLxqM05
         KAzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K4/ToxIZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a0562141d2800b0062529d9a496si9111454qvd.608.2023.05.31.15.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 15:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K4/ToxIZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4UOG-0002aR-Gk; Wed, 31 May 2023 18:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOF-0002Tg-5Y
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:33:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOB-00052Z-W8
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:33:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so1946985e9.0
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 15:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685572434; x=1688164434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cytFQrzGMvOi8slgASF27XRO51GqurNYCbfldEiqvjA=;
 b=K4/ToxIZHVVXnyynSouEA6kbrFdLazOsGjRujeP4hK5R+TjDVxqilU0DGuVrGcK326
 ij4uX1sqzjEGMCjVtwF8m7nqnz3+1pwmVo+0pcl8AUF9Dy/HeFpBpTgzlIomBWzdSfWk
 Yiwea0jFmuof6ZlMomw7hWPjvVYJQGg0bjEY8zGwGT5ax9flktMVbUrfCPth4FbSqm9G
 nlvFGrYKjYFoi8g+ifK0duMN7NTLHe5BdqldV2lg5QSOU2TxuV/5mFmBJia0EO5B/Yj4
 AbVGIAI1kS+7a4MIkN9QNaloGQ+Ss2usHNRQug5bB/pBq82XZxpbBCWr9pHVf7vsImda
 oP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685572434; x=1688164434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cytFQrzGMvOi8slgASF27XRO51GqurNYCbfldEiqvjA=;
 b=BB77DlidGknLt0CybAmMUF9I4Q53No/Zds+A2MECNoBcgsgB3n2kfvMlqdd4VoKX0S
 s8He5V/GI+6zZU1WCLU4HgtgyxnwpSKZEjzSnPsx2PFyNbsVmAm7fxej5yof0TIgEhpS
 9apEQiIx/Y95BiLjUaivmtwQ/m602ruq9fXrN+imH3TCAsDK64NZHFMQTM2LZRzcEmU7
 4wi3rU0VWlhqcTU9GGBAcctJUHq7hGxPo31WNoGbSbYr4/zUNrWnFQ4CHdqL62cty0hV
 6d/AFnlDVPd6AmqySZrSUWzRMtaMZDuTjzyAfKZUb9uggWTO2zbjvT3AjF9J6l6G3aa2
 A7cw==
X-Gm-Message-State: AC+VfDzqo0381bO/YvpGFK8wLv6BSPMB6NTd2UjiBzxz5+w4+c/u69B6
 EbD77mbwqBbDx3nuansbkb/nVQ==
X-Received: by 2002:a1c:4c12:0:b0:3f4:271a:8aaf with SMTP id
 z18-20020a1c4c12000000b003f4271a8aafmr609146wmf.38.1685572434603; 
 Wed, 31 May 2023 15:33:54 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a1c6a01000000b003f423508c6bsm68086wmc.44.2023.05.31.15.33.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 15:33:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/7] hw/usb/xlnx: Do not open-code sysbus_pass_irq()
Date: Thu,  1 Jun 2023 00:33:36 +0200
Message-Id: <20230531223341.34827-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531223341.34827-1-philmd@linaro.org>
References: <20230531223341.34827-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PDHtfE0LUoKB

The SYSBUS_DEVICE_GPIO_IRQ definition should be internal to
the SysBus API. Here we simply open-coded sysbus_pass_irq().
Replace to use the proper API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/xlnx-usb-subsystem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
index d8deeb6ced..462ce6c3ff 100644
--- a/hw/usb/xlnx-usb-subsystem.c
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -49,7 +49,7 @@ static void versal_usb2_realize(DeviceState *dev, Error **errp)
     }
     sysbus_init_mmio(sbd, &s->dwc3_mr);
     sysbus_init_mmio(sbd, &s->usb2Ctrl_mr);
-    qdev_pass_gpios(DEVICE(&s->dwc3.sysbus_xhci), dev, SYSBUS_DEVICE_GPIO_IRQ);
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->dwc3.sysbus_xhci));
 }
 
 static void versal_usb2_init(Object *obj)
-- 
2.38.1

