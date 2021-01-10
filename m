Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1825888lfq;
        Sun, 10 Jan 2021 00:17:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmdM4DIJrMkPadRZCfzFH8a3OlwNJdB4E+uJY5xHOicVc7v1B14qUIoJe1IBM10rc9qZVo
X-Received: by 2002:a25:5582:: with SMTP id j124mr16881890ybb.309.1610266666779;
        Sun, 10 Jan 2021 00:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610266666; cv=none;
        d=google.com; s=arc-20160816;
        b=QEk0SPWmE3oJcqovyn8kQGEsOp4cy64sdnqle2tr9TGgOWQuZGKpeG+ZmI8YyDzZv5
         rxQecs9SqTNPP6OBPChZhIm4vRUsnMsPjFmwglYLX0FuOJawmxxJtfrrsu/lKpajMd2R
         4egE9JPkX53mQyudkHPZ92VamyfZZiypCzvQvVnSB7MlmcjpYqFLcVgZCNiDBmP8toSz
         FtgbFYqLfF9jzRdgmr9+0qhTRWbA3zpWb09+1VUZ6CzGSMz7UGlmLC+6Sdf6dlxCZwuZ
         vBtxl7jhevbnQmPG75DGGdDNbzlj9UGKJyJDOmw2JLo51TYJ4GVsIj+6dETUqWoTPXHp
         Wqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iq04GWIRz/WrU8q6UvIbx7bFtBJren64Lt595RXDSaQ=;
        b=RfW4YZrD9lcJ5OvtG9sAxGymt2BxT/48WKZWjSIWHKwioA+V0Py9Z4Ey/X4bGsKbVK
         0IgW0m2KYMOSyX+yJIu2zkOwbIvLeCqawLnwfm6nfyXqsLE+BkssvLQzRbI8oayrcY+x
         cmh6uoqZUCx0FkNrwKcokYhmxQc36RZAclEUTLmq88AsGUWeHCXZBU53AF1vaNIjlSDz
         ZxDdo7NmEB6P0A9+Ejg5q4Sk0ifL76TLpkiQtgSIjO5IEGeRQ3RXRY/I5HMEj9wpIP3p
         woMHTCPaHAu1hupnLY8wGJnUObu1zuY7QlDswEE7miG4iVMe0OPW39Gu4I1tv0Akjc3o
         DZxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="KzFnZI/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si16002912yba.276.2021.01.10.00.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 00:17:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="KzFnZI/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyVv0-0006AE-6b
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 03:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsl-00035M-Tk; Sun, 10 Jan 2021 03:15:27 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsk-00067Q-Ac; Sun, 10 Jan 2021 03:15:27 -0500
Received: by mail-pl1-x629.google.com with SMTP id 4so7894566plk.5;
 Sun, 10 Jan 2021 00:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iq04GWIRz/WrU8q6UvIbx7bFtBJren64Lt595RXDSaQ=;
 b=KzFnZI/v16JvTQygJMGC3WtYBrCfx3May+8cxFp+qU8MuCo/8BNkfHB65r4iJv3o6a
 AY0lKPn+6tKQFOOl6lNQNwreFTLMAS+H7raiIMd3TrJcfz9vvUkIfLrdgUfCkwfVfQbU
 2PPTChGFhSweTcdESA1Lh69o8jvnkOLSaSVgfAlCrdkSIg4gJWwqKC/X3WXACd12DGLl
 YNlbgK94JjtQxQ5MdKJ5ezuMYtTcd2MMfGm0mWvRe/1mAzHtL3ki35KpY+LBoqJ4vapZ
 Xe0Gik8mOgqr1afTOhomb/1g6daQslSI2pKHRyMG6oKlLC7ZADRElmBKJlfRjx7heQhD
 h8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq04GWIRz/WrU8q6UvIbx7bFtBJren64Lt595RXDSaQ=;
 b=FJBn0W6EWUsh/HpNkDSK9PkJ7m8AJiAkBtWkOzq6Kw1MmnrZcVZpKsdG6cT9CayZl2
 yuhX3MeGgmkwXH0QUb436nQSIADapDihEJ2EXH+srMfBNS0lLzPxt8W9FK6JHpvNdt/X
 bf1TAj1ZpXsoKnj2Rp9hhtXSWNN12oeaiPSRZDFGDUpV8gkIDT3G92mXhU8kyMyYilR5
 /xMQQ/l5AOE7VoQN1ahzcAhUjasXiE3fqu4Xo17ezJvqaEOUC3/jWZfZP+ugNoIOLK9g
 nPeDoxBvhbT1FTMjR2+qioPnCfH9ISl+tC02fBxJfxTMkhXk9TVLXygQSckY5tSdTsNC
 cDmg==
X-Gm-Message-State: AOAM532BB5Gg1Y248AtLM3exjUsUpc1p/HBVqJGen5PoYYU0xrmivng3
 Fl4+RGYAfYKwzaeaCNP0Jtk=
X-Received: by 2002:a17:902:b693:b029:da:e92c:fc23 with SMTP id
 c19-20020a170902b693b02900dae92cfc23mr11504616pls.55.1610266524801; 
 Sun, 10 Jan 2021 00:15:24 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] hw/ssi: imx_spi: Log unimplemented burst length
Date: Sun, 10 Jan 2021 16:14:27 +0800
Message-Id: <20210110081429.10126-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210110081429.10126-1-bmeng.cn@gmail.com>
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x629.google.com
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
X-TUID: 96lacFGK7gO9

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

---

Changes in v4:
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: log unimplemented burst length

 hw/ssi/imx_spi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 168ea95440..7f81b329a4 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,16 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        qemu_log_mask(LOG_UNIMP,
+                      "[%s]%s: burst length (%d) not multiple of 8!\n",
+                      TYPE_IMX_SPI, __func__, burst);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
-- 
2.25.1

