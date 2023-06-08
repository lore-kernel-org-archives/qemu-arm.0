Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp425924ejb;
        Thu, 8 Jun 2023 08:43:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4eEzGG5J+GkcGAyQ6JLH1mAiTsF07BahobeI3FwAGqJ9WXI3IzEXOYfVyodW7FdB1TfgY6
X-Received: by 2002:a05:6214:2129:b0:628:335a:173d with SMTP id r9-20020a056214212900b00628335a173dmr2491076qvc.43.1686238998422;
        Thu, 08 Jun 2023 08:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686238998; cv=none;
        d=google.com; s=arc-20160816;
        b=fvgOhEk0StEzyzmaC+WSn/1r7P4Mnl68uXYDxHlk4L5UZVrAPOkuh6XGeZt006740z
         WDXnl++ASUNCfO9WGrlLz80pMrvydKXxOezXFqsDZSV9xKBIuEBy3IMLN03XZCQ2uCW/
         SoBrUI60QpHD2g5ibqZy/YRK6j0pROXMLNPcCgWdCFHnZ0XX8/VfkpfXhjWS17XWx0id
         C1ORirdrqi4txK8S9czJNhsWUrVvOc0v+CA90Tw06OH+37jaz8Pdy5bc5+VnP7SHbmNW
         YJ4tI/QO6IccYfPF0hTn/8iPuapEW67Suq68QTQhQGw6CZ7avWZRZAtio6LVpR9VVv9a
         DgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=3tTMAfS0N++QyZtCzq6ElNiH7yCnMX/lpsnNOhBOhqo=;
        b=RVOFvsS8OF6WhWOcZhX5gVrzHwUCMD1YGailBBy0MrBNZHaf3j+pVmVSUUbJkVvG92
         UjFnaKZVWdVufmkAgZJbHfxykrkl14tIypdOOhA/7vrYdtIBFhrahy1zos3omCqgfwyH
         0Phq7B+wlpKkDtcLP1YImnAZKaAsmIkLUdkV1OHex+69epAP6WC/j3beeMmCpHklP7kZ
         RT3967YAxX18eyVRYGriamUkuydHx9soSgV4nCRbID0fhCRjLUv3jIZWacykkKBt0YD1
         dAG2Uggd6MbK7TtE1EdurNsiju1fCi82zJqCWsAktl2dlQMnuTTR6wZgu3R28fxRmNRk
         QUCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a0562140d4500b0062673fff1a7si954224qvr.107.2023.06.08.08.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 08:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q7Hms-0005Us-PX; Thu, 08 Jun 2023 11:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q7Hmq-0005TX-TT; Thu, 08 Jun 2023 11:42:56 -0400
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q7Hmp-0005mX-CJ; Thu, 08 Jun 2023 11:42:56 -0400
Received: from mxap.rfi-global.com ([195.99.241.18]
 helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martin@kaiser.cx>)
 id 1q7Hmg-0003L2-Ow; Thu, 08 Jun 2023 17:42:46 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] imx_serial: set wake bit when we receive a data byte
Date: Thu,  8 Jun 2023 16:41:29 +0100
Message-Id: <20230608154129.133169-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f;
 envelope-from=postmaster@kaiser.cx; helo=viti.kaiser.cx
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 45XfQxkIhMnb

The linux kernel added a flood check for rx data recently in commmit
496a4471b7c3 ("serial: imx: work-around for hardware RX flood"). This
check uses the wake bit in the uart status register 2. The wake bit
indicates that the receiver detected a start bit. If the kernel sees a
number of rx interrupts without the wake bit being set, it treats this as
spurious data and resets the uart port. imx_serial does never set the
wake bit and triggers the kernel's flood check.

This patch adds support for the wake bit. wake is set when we receive a
new character (it's not set for break events). It seems that wake is
cleared by the kernel driver, the hardware does not have to clear it
automatically after data was read.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 hw/char/imx_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index ee1375e26d..44125d5f47 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -321,6 +321,9 @@ static void imx_put_data(void *opaque, uint32_t value)
 
 static void imx_receive(void *opaque, const uint8_t *buf, int size)
 {
+    IMXSerialState *s = (IMXSerialState *)opaque;
+
+    s->usr2 |= USR2_WAKE;
     imx_put_data(opaque, *buf);
 }
 
-- 
2.30.2

