Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1825912lfq;
        Sun, 10 Jan 2021 00:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzq8JEsMYHlwSckWttpxvw3Y8VWurKiasZKiVPJcd1m7BY7gJey4wiozRpXOoEZtzMZkCmS
X-Received: by 2002:a25:c54b:: with SMTP id v72mr16815306ybe.258.1610266671013;
        Sun, 10 Jan 2021 00:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610266671; cv=none;
        d=google.com; s=arc-20160816;
        b=y1b01vs1UqeDHgV/WtSqE33d8mRQFMy1ygfIbOdyObuQpAQM/mTkkhsC0rDPc4CpXB
         lpaYWcpGS4navgR553vZTFbEzhvJFv2k4bejg9bIc3krPHaLp0CwBANETZVAW2FFrVje
         CF62AA7UkBazjc2/9aghC48OzPpyUUTbacgDMiLNIG6dr5ZkZNQJJC2IM2jyKXmih5X+
         lRoFt2cOSMexJhDgbX1+ONOw3xQlX/aC2gKGJZnf/QOaHHh2yMINWjqjsxyzIH2dL+dr
         Rvb3K3pfJSzpchwFigEx1sJjJtmt6Kylf9Ld1T4qtOIWpwpp8rkkyYOBxJdigm3TJc7I
         ApOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=raxUFNmH8R2fISFPC7w8bqWEMorGOUJfhPU9VBrmArU=;
        b=q4AzncQFzr8gbLg0AuvNkLn3W+utRxjG54bMtWY7SU+sp3Sm8Jn6In2RD6OBULqcXd
         7uPXI0xHsKD9SBTDxbJnX3eko835lZRc5yG46RHh9p7NSClWmKWOM6vgkD/b9DfLwtag
         DB5MUAJDJCWkLM9xI1RxQBufEkbQ0ds+wX4CWjstKaHX+Gi1NOUEklkZ3g5HmeQRqN0W
         7er5iYk5Urq1zX1TyIXQx6CIqafjdhnyNBnmnBtoK2Y5CXyHb+VX6de67Vea5uOqjWfb
         uU846U8JMxRxlqeKAThCoEWIGhXf6/WVni+eY0VPgHAMJL94cg1zyeGJYzV1rFSlfqkh
         rL4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="SPz/O9MQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i140si17624218ybg.20.2021.01.10.00.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 00:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="SPz/O9MQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyVv4-0006Jy-D0
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 03:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsj-0002zm-Hg; Sun, 10 Jan 2021 03:15:25 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsh-000662-W1; Sun, 10 Jan 2021 03:15:25 -0500
Received: by mail-pj1-x102c.google.com with SMTP id y12so1715223pji.1;
 Sun, 10 Jan 2021 00:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raxUFNmH8R2fISFPC7w8bqWEMorGOUJfhPU9VBrmArU=;
 b=SPz/O9MQTzZR4oyly2n7hULf+XN52ErN7r1Jwh/49PixjST/66u9OPC/LUpNOEIQns
 WukwvNWO6hywMfQKFJMlFIHAmDXyvh0XaCvtg+oT4VlUDAHv1dc7Hjz5WkEaOhX105w4
 Cp49R8tecY/m/BfwBEVLXGcTShvnsRK9GfMSmBibj9lbXnJwDWypI8cntGjX2F5VmlWH
 SaPOQyKrt/sqt95pRGsW6fxnzMktcoghfQPqAZN1A4K2+2Ra4nSmTNi3Lt64In9vITwG
 i8+eUQl1XIXp6lO3gHF+gXmge/4Dcfbk2WzZ0Uqq7tabwcguRNoiaLWbqX16LEDmhR2t
 aCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raxUFNmH8R2fISFPC7w8bqWEMorGOUJfhPU9VBrmArU=;
 b=RLvoDqP3oje6zzn1HU33e9g01o4CkYP/HYX2R18i7X3pyIAFs3izce3/l3IXV7huCJ
 TxC/ki8CCAFJ/I1xceP5X5Nr1+aErIDBdPpVU8q5AvvXCAk29ijBmIbz5bcpOtqUXEPk
 Gldbbo1iDjEaRWHnzFYCSHvZruD7RyX3In38so/c7CG3p8VZk5cfvqSJcfrgHoxn/rki
 P2lLrr0r8bMdITyI/Nt04qWHu3xymkjIYe0FnDGzzGXQrAWq+mgysdg4m6tzZv92pLva
 +eoR/UnDlqKLTYoDifSe7RuyOo1Lnu7+ldqZi8J+r17VOJyHM5ibeYVyEVcovtTcn8JP
 taYg==
X-Gm-Message-State: AOAM5326Y4bsdbUPDGOtxcm0ryeLW9ipG+lV4PetsnmxdDblOEA/CAgn
 yosGQrGW7Gn2khZr1N63Znk=
X-Received: by 2002:a17:902:bb95:b029:dc:e7b:fd6e with SMTP id
 m21-20020a170902bb95b02900dc0e7bfd6emr14576164pls.12.1610266522279; 
 Sun, 10 Jan 2021 00:15:22 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:21 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] hw/ssi: imx_spi: Disable chip selects when controller
 is disabled
Date: Sun, 10 Jan 2021 16:14:26 +0800
Message-Id: <20210110081429.10126-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9F9PcOVfIyn

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, but chip select
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v3)

Changes in v3:
- Move the chip selects disable out of imx_spi_reset()

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2c4c5ec1b8..168ea95440 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -246,9 +246,15 @@ static void imx_spi_reset(DeviceState *dev)
 
 static void imx_spi_hard_reset(IMXSPIState *s)
 {
+    int i;
+
     imx_spi_reset(DEVICE(s));
 
     imx_spi_update_irq(s);
+
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
 }
 
 static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.25.1

