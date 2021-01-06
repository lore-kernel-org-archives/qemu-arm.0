Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp581297lfq;
        Tue, 5 Jan 2021 21:57:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAeUXlPvCHADykWDf4EIbKxtwh7JsP48utmCYycAbl1L46rUJzF81j1v9MTpZGEvh4MSnc
X-Received: by 2002:a25:bc41:: with SMTP id d1mr4232229ybk.100.1609912667640;
        Tue, 05 Jan 2021 21:57:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609912667; cv=none;
        d=google.com; s=arc-20160816;
        b=av/N8Yj05IxHTEiRwSUIFyc+SJOCEwRju+bwPenFmxBhVDTmWEAwQVJm0VD1egGSgs
         Oj2kFgsekcK8IU4X3+apc336nXDPWGImC2qgKQWDlMiVx4dXq0TyXyji+hsxKGd0LjMr
         wMhKLquvgiHlaP6omQeddpZjM8HSqxKJ2ZwHN8dh8Yiy3JbE/l/YZns/yQMpfxhf1jel
         0Lhpe6KyxbWs+K9gM5x/690bGtN1/FLCvI4l8lQBg5wYxqyrshT7rIQEQ46jmwIhqLpH
         heGaak+EeWF8DQCagkhLrw5PDzrWNAhV//VJ26NGuJPpM5YFIdEc6SCs0jvfZ+v+aj+w
         e9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ctjrb0wLEu8UMxmCsMBYWKVGQJNBDXEyUZiU0DSOVTU=;
        b=oikiPPXKFFg5ux1ba/tuU6ApfLGFHuTmrk1kjYFxyaQcLQKBOzY5LVGg47+OjjgFkA
         QtlGLZBrjUHmjVEPhHyHsVKWx3Zi2U3tl/qgLMgiZ8899I2aenEgG3JQ8NdpEP9NtGZS
         3Z0pEfwV3UUeOnhIHFx4s39F0ms273Fsns0TyfIc2BdAoOcHT7VfWF7ivvKoWsPjYchN
         pL1L/Set/aXqaEG9TOFouaba1AtiJaeN4ZqV4zV3XYr6SUfly2bLefJkhGQmcKxHjpOj
         bEsYGwfOQ6of9xYjVQpzz3YYd2kW5BCxx1D6yXPRKzyw07Ul+hFA827HJVlPdGgd5pe+
         RBvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="saG65mL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si1660653ybm.220.2021.01.05.21.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 21:57:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="saG65mL/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx1pL-0007oV-1S
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 00:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nR-0005CA-Gt; Wed, 06 Jan 2021 00:55:49 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx1nP-00050O-Rz; Wed, 06 Jan 2021 00:55:49 -0500
Received: by mail-pl1-x62c.google.com with SMTP id x12so1006426plr.10;
 Tue, 05 Jan 2021 21:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctjrb0wLEu8UMxmCsMBYWKVGQJNBDXEyUZiU0DSOVTU=;
 b=saG65mL/nb4ayK6cIqYmLIkPX9wzVH23XMeJpwM0Nehd8UjnofpivGvFIKf+CUgJae
 iBVIaQfl1svNtAh1aiSm/7jX3PVcUZnIe7rHZD0IB7v6WcRnCWTVUGKNkqkCZcKDdLhO
 8X395mpswr9uFl2UoIgtkXxn7v3JBIc9vBSycbtKOGLdYfMAT0sESdi+/nyi7PFnm/MH
 UM2qWtGztKfSpvCYxS3MZT5DsN1HC3z6CMo3KxihEChFOsK3b6ZjxTjZk7xqjbyEGj96
 Gk6VlEO4bYMtOeBE1ZV29CP9Jv3Arfc/4hVkWFCrDgm+ibe8VKfpFJYWdgoUTUmeVHuE
 kt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctjrb0wLEu8UMxmCsMBYWKVGQJNBDXEyUZiU0DSOVTU=;
 b=CiYddmx0bhNhl2hjf0c2roz4w7oppeKYCKKUuiCZHAJTt+3nM+65qx3yfd3FZxkcuI
 f40UvqxJ1jRFOHsdbPlS9G1WJ45e6jouxtikzTY9fuQVVY7+4YdAEiNkhDbOieMO41jj
 0y5zFriuMfJHJ9QAq9ku7EBs0p5JVE+kvLEJzY03T6xXtNGvth/3ZIo4jck6m9821Pho
 ezB4azwHJzm9NRjBr72vUNkhLyrIp6PjYlkL3gKVI7tRoU2tB/EG0yYk+YnHX/trOes6
 EiWJUagnaOVPAdRfVGRYYg7lBSQH49vm409hX6jdtgIlsomeGT55LO3GhFgXbGzXaOOY
 AQDg==
X-Gm-Message-State: AOAM5328YPMHOCYANaJUqGvUBQ4qC3NYJRrk9eJUn+HSjhqUMNJA7aeX
 0H83VNXRl3zbTb0D+XPapKA=
X-Received: by 2002:a17:90a:68ca:: with SMTP id
 q10mr2795801pjj.15.1609912546272; 
 Tue, 05 Jan 2021 21:55:46 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id c62sm1070503pfa.116.2021.01.05.21.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:55:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Wed,  6 Jan 2021 13:55:21 +0800
Message-Id: <20210106055522.2031-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106055522.2031-1-bmeng.cn@gmail.com>
References: <20210106055522.2031-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSBd26vZsV0a

From: Bin Meng <bin.meng@windriver.com>

For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:

0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.

Current logic uses either s->burst_length or 32, whichever smaller,
to determine how many bits it should read from the tx fifo each time.
For example, for a 48 bit burst length, current logic transfers the
first 32 bit from the first word in the tx fifo, followed by a 16
bit from the second word in the tx fifo, which is wrong. The correct
logic should be: transfer the first 16 bit from the first word in
the tx fifo, followed by a 32 bit from the second word in the tx fifo.

With this change, SPI flash can be successfully probed by U-Boot on
imx6 sabrelite board.

  => sf probe
  SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes in v2:
- Use ternary operator as Philippe suggested

 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 85c172e815..0cf07d295c 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -178,7 +178,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1

