Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5373211lfg;
        Wed, 3 Mar 2021 05:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP6jh2MMLgL8UY3LxI9gY3C6Lg3yO9eXcFaCJ5oheE82e0z3ta+nTc8lL3zZLXVEmrS0Fh
X-Received: by 2002:a4a:c316:: with SMTP id c22mr16963288ooq.65.1614779915667;
        Wed, 03 Mar 2021 05:58:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614779915; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcenpxPs0BfnOs7LRLQ/JWzxq+QH5OB65sxBdPhVJcSWV3lcFyB5sI6WMMyYG+3ZEv
         whGIE8rCaWBPQatMO5nItt10XmqoBptilBoauRUSE3wAP7QYClRATIIq/xWjr38l5MtR
         YrD7Hd2J+f4v1buD0o48xtv25JyeggX2i+ms5224SxQvcQHlwYaqTDw96JC7Vro86iTq
         ogSa3ZiA568vzdIrtMtq8hxWcEck3cKbd84tEuXcssVSDbjfukHxIWpgqTMfrcoLD95K
         xQ+nfuhPLBOFcnfCq8jlkavxOc99XRVpLmij+ZDIf3Y0tIyypgKWgtVrms8KlLxAXKUd
         oFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
        b=QbgfddDTIITwvCWjBxkuUlC7YAz7rcinv6KmqJNExYxp5kOIK4tb7cdmJfJOW/88Cp
         KBfCyP/BnACdTx4LAc32Cx1ocsVxpSaImOztwM8mnO98FB3CWMlXWwJtCQHasXqDZkuZ
         iDFLaWh1yvXA0VdeaV3+USEb403P3UM2XV5YKTWSqJLAGyGDUyo3ksnb9e0SwcjsmSBK
         uF07/i5RVOnyRIm//29SyRvCDXOK0DJUwT/UAb9V40Fs5YX7+UxkjCjtXnHUvS4L8ymy
         oaxT4VRcFThbrJi/EA1x2zGAvDMYqTZh5hdlcP4IFl+ftZkBg9D01XtIhgoGNXcacVeH
         KAUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYw24AjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t125si19434937oib.141.2021.03.03.05.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 05:58:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JYw24AjK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHS1L-0003oz-06
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 08:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwl-0005RD-Mr; Wed, 03 Mar 2021 08:53:53 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwb-0002ET-70; Wed, 03 Mar 2021 08:53:46 -0500
Received: by mail-qt1-x830.google.com with SMTP id d11so16789384qtx.9;
 Wed, 03 Mar 2021 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=JYw24AjKaKuedRhgHkirdQ5Ih/cpHdsyQbXqOl/ExsD80e16ggCtO0vLiXKIvHZO69
 +mX21bmsomvSBMrhihAiREOdAdTmHumxZz7mJI4KB8yE1dGUgLMJ/zia9TMkxWqYNRo6
 kqUm36qaFFZevoFdvsuE40PyrxC6jP1q1rCI1aszWFZcealBQa8cDp9wAdI4BdY3ZnsH
 blwv5HmWIhE6wBLUpaOb2/7Ge0gy568slhdLVePxpNvLjUBqfUnnsZajJYITV5qIU9IK
 IN4zkRTmJM32HsuIntG9AGcq64Ya4eFDdaM3KGDZZpmUVQtejIgMBa3y/sze1+0BVMaW
 Ej1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AvmXxELlSPq/Cqpu0ZFOXyo28njZpHc7YVv+Gg5cBAE=;
 b=PM6i3XzJE1Ur8TB2xP8nLpRUQEjkGzHU1JU0m7QJDmjKvxleSgfIZHp2heDpDLs2++
 fFokJgB6P0sSIFMRdaff8gE3N+Qr83AQFRFndQ71tX2TpSNUWjUEjr9BQFXQPUSdxvH1
 NGuV/oFcBiCCaTNZUHwOW+OGP36tOmh+iD1Y+3tqCoQ/yjjPXTDHY+IdOmwjlae7vIg9
 MKq5jFCVxlNp6N2/aumJiD1y+Tg1+CrtzqqefWQbSIGdzjhzFFMzTaeP8ydvisZIKTqX
 Ut1kSSKkRfA6g81vGUO+6WwL48ReFebY4EMGDZUaUfU7Wp6RsLLG0PdW4YSs1ZYssgya
 76Eg==
X-Gm-Message-State: AOAM5304gSadytluVZy60PlsN5BM311Q+djg5PW2dHoh8pEpYrxPd2vk
 zlsPSucn5hj6zQfVaUPSw94=
X-Received: by 2002:ac8:7257:: with SMTP id l23mr22754643qtp.350.1614779618084; 
 Wed, 03 Mar 2021 05:53:38 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x187sm17425500qkd.83.2021.03.03.05.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:53:37 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 5/5] hw/ssi: xilinx_spips: Remove DMA related dead codes
 from zynqmp_spips
Date: Wed,  3 Mar 2021 21:52:54 +0800
Message-Id: <20210303135254.3970-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303135254.3970-1-bmeng.cn@gmail.com>
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cGu/9U8Xp0VM

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Now that the Xilinx CSU DMA model is implemented, the existing
DMA related dead codes in the ZynqMP QSPI are useless and should
be removed. The maximum register number is also updated to only
include the QSPI registers.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

---

(no changes since v4)

Changes in v4:
- Modify XLNX_ZYNQMP_SPIPS_R_MAX

Changes in v3:
- new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips

 include/hw/ssi/xilinx_spips.h |  2 +-
 hw/ssi/xilinx_spips.c         | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index 3eae73480e..06bfd18312 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -34,7 +34,7 @@
 typedef struct XilinxSPIPS XilinxSPIPS;
 
 #define XLNX_SPIPS_R_MAX        (0x100 / 4)
-#define XLNX_ZYNQMP_SPIPS_R_MAX (0x830 / 4)
+#define XLNX_ZYNQMP_SPIPS_R_MAX (0x200 / 4)
 
 /* Bite off 4k chunks at a time */
 #define LQSPI_CACHE_SIZE 1024
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8a0cc22d42..1e9dba2039 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -195,13 +195,6 @@
 #define R_GQSPI_MOD_ID        (0x1fc / 4)
 #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
 
-#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
-#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
-#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
-#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
-#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
-#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
-
 /* size of TXRX FIFOs */
 #define RXFF_A          (128)
 #define TXFF_A          (128)
@@ -417,9 +410,6 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     s->regs[R_GQSPI_GPIO] = 1;
     s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
     s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
-    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
     s->man_start_com_g = false;
     s->gqspi_irqline = 0;
     xlnx_zynqmp_qspips_update_ixr(s);
-- 
2.25.1

