Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1211767lfb;
        Wed, 2 Dec 2020 06:46:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnL95TmFpKx06wcK7EfyyhcDOxF3awBG6kLfien9mofH1D+VInrRVxASd/XZw8yvBWgHnx
X-Received: by 2002:a25:51c7:: with SMTP id f190mr4487844ybb.299.1606920402399;
        Wed, 02 Dec 2020 06:46:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606920402; cv=none;
        d=google.com; s=arc-20160816;
        b=hilqfA3mNBpdoHe7ZJASy8vBtHTgK5DcDtevHF87pGdY0w4+2gf6s3KFWO+WhxTxKG
         BrYfDVnAFAD2wE/g/DVunaFyCThelKx2VA87QMrw3wUbtd3Kp5qWSoYb/v2eaW94kfKu
         5yPX+VhUna+CGCG9DcoRcaKBZMPP4yn7BxFGzkzYfGIhQFV34Oj7Ny9D7xnVT/bQJJSF
         b/YIHKejfTAEKLJ216awnijYox7XEAZIcxOb30vbkrFzn2q4OLqT50m450leaUmDY5dQ
         Hqp2A2Aufi/QZcOvSLvG0EtWcfjrqMscyOg9l0ACUgpDgzAJ+CiTyZ5D4pelAhu3dd52
         HHGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
        b=stFChcxdeHvnmGqJqJNGbCBGuIOny6zCFl2qaoLsGmweXDjweQ42p39bGdI98tIc2X
         vRRBVoZCBbBUsi8G2v1bL8C+VD2YLoaHsZJvYODZOVuYB4i+q8KS5zFTWN7Kg9Xhaimy
         lUnfPSWAobaJaSwGlNBW4S78Q+DngtFH+jsSNXWx3UR9kaDBEqLfov2tkinVm6vCtYSy
         fsiHRSV5w/F0x2lAFLlyjQQVajAaJfdiq4LuH6iQH8fs+U0z70LFQArjDX+dKFJQZRTM
         s3GmgpTTWyis8sa+nZXwTLOAUqibJ5B18fsEUgSBXhCLrs7Gv0/lmyWfpGlcX0rnub7G
         fj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rcVFF/7M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si2192680ybj.453.2020.12.02.06.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 06:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rcVFF/7M";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkTOz-0003ru-QN
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 09:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTO8-0003nd-61; Wed, 02 Dec 2020 09:45:48 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kkTO5-0006N3-4A; Wed, 02 Dec 2020 09:45:47 -0500
Received: by mail-pl1-x644.google.com with SMTP id s2so1230535plr.9;
 Wed, 02 Dec 2020 06:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
 b=rcVFF/7M+zeDyLVhrBorBVBBQXnvER90HVH3kl+HonZd0KbrvZ3W9aciDoHJFzTyHF
 RRX+5jXB965Qt+p1TQwGelzen1fEcBs2zwnFVExGgjD1ZP0py6Dtpw4nsgb10ABKhLHN
 wR3ywfpJUNV0tx5mcfm257FN1W9aiVSoCT/+NNdSB7V6IMi8oWJgg7+Jim8SWC6FgIpr
 eJhIRE2hVLN5H1Tq8SGzLGUmpOO1q0uW93djpu4H1trTqIeJq6PxALpXP+4R/PhuvYcd
 P63JmqxPUmeOoHLgYvbJwMDR1igOLQN32Y3bMnuFPAD0Y/+ap4ojyQQpqjGD6sA4bzfs
 g66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkbY38y+uyqMVcJivAUjLwtmcJVovS8vLBnCWge6hes=;
 b=nFgOvipCweiLRA/PuvWDtQpVO4fBKKHOzTiLoo9AhZr+8quQHogceBfl/W9XsZzVDB
 Y37E3BW+In85IbqyhlzrJHB0vBF+fWsV0LwbgbkV4cD0ssRNxZs5AXDus27emLayRD5u
 jnGG9xr0Te38lHLV5WRsbe+MgiQ4/557DYorbOPeHGyjNjGODUvpyRce+bYnqqcfNli9
 cxz8hjSQLjNKu2JV9loAqRzBbzwYPHostowr9w8yUPRSNCirZry0Ac/KlQwVE0AQUyF0
 j3T8KYODMCGTF8ZjdQYwjFDxyjfIrCTY2joJ0ODBhfJwADaxLocLVnrk7KaV6oVJ7gda
 UNVg==
X-Gm-Message-State: AOAM5311lCfvLtXMHGMzKB6+MwmIn6sTsnRFF+74BpNyFAvvUgopZX4U
 ox+UrrQ3j/dFZqWrvns7d5M=
X-Received: by 2002:a17:902:bd98:b029:d9:7b0:e1e5 with SMTP id
 q24-20020a170902bd98b02900d907b0e1e5mr2948568pls.77.1606920343531; 
 Wed, 02 Dec 2020 06:45:43 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id u6sm92367pfb.197.2020.12.02.06.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:45:43 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/ssi: imx_spi: Disable chip selects in
 imx_spi_reset()
Date: Wed,  2 Dec 2020 22:45:23 +0800
Message-Id: <20201202144523.24526-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202144523.24526-1-bmeng.cn@gmail.com>
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EFgSkNM0j8P7

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

When a write to ECSPI_CONREG register to disable the SPI controller,
imx_spi_reset() is called to reset the controller, during which CS
lines should have been disabled, otherwise the state machine of any
devices (e.g.: SPI flashes) connected to the SPI master is stuck to
its last state and responds incorrectly to any follow-up commands.

Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v2:
- Fix the "Fixes" tag in the commit message

 hw/ssi/imx_spi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index e605049a21..85c172e815 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -231,6 +231,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 static void imx_spi_reset(DeviceState *dev)
 {
     IMXSPIState *s = IMX_SPI(dev);
+    int i;
 
     DPRINTF("\n");
 
@@ -243,6 +244,10 @@ static void imx_spi_reset(DeviceState *dev)
 
     imx_spi_update_irq(s);
 
+    for (i = 0; i < ECSPI_NUM_CS; i++) {
+        qemu_set_irq(s->cs_lines[i], 1);
+    }
+
     s->burst_length = 0;
 }
 
-- 
2.25.1

