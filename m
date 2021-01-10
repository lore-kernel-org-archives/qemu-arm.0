Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1824838lfq;
        Sun, 10 Jan 2021 00:15:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgkNWBNsfawwhIy9nzFP837uqERTfP33TXwjtPkFXtYyLWo66SjbPVS6BRsyvStce+DCSh
X-Received: by 2002:a25:6a88:: with SMTP id f130mr16815407ybc.5.1610266529530;
        Sun, 10 Jan 2021 00:15:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610266529; cv=none;
        d=google.com; s=arc-20160816;
        b=C1M59rLNIgIB7i2/rpFAaYBPnUDiOEI3ZPw+EzcR1UV2JPydDNtS5r3XdnVDRJwzyO
         o9oi7shY1Lud46OPnKFMzWuE8A+6CE3X8CE5HtCpyDctOoIjS+dz1FoMkO9WBZezeVt/
         Ognk+Jab/uM78WrQmqUVLZANszVDHFWM+dd3/h8zhqK3yh4Gjd7XhWsBJbxjXZSgT9dt
         zisa+MMBlH3DSrALcqd2IuIMcOHFTjucfvu+c/cj5sYv5JXaC3v+FSRiVBZZFU3dJ6pm
         n1+2k/75+yw0gdBPxOtL6oedMg1nPsTsLX5GAPlMpOmYHVcdoEXAMz3HIFQQN8jOOexP
         mOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Uth7qFYZcAGIlpDOu6/OFlBV9OZB6Hp44dj92RTEM2Y=;
        b=kXrQztXIIu8+FuN2OagfIQglMtwbcw5U0iOXhNnqOz2itfDws0OpUyuhO/bWqBfg/Z
         Gb0CfjDCejk96rEivHCHLRient31OvlrxFBERjKvscJIqgIJNXpLOyf6/vk27hu2kcT7
         hDtoIEUqiDnWDkZzkstpXSIneryVqZH57HmJ4Gw2Q8Be7JxfYX6Ezh3vYbWkMnQuLAAe
         63gmlbpGL7/CDga54URGxCKHnojIMFmfppcF4k2LyiDHjp/dDjXnc2GxPRoLIC931b8n
         ISDgci7XfBpcZUkE6fukbuSwycahPYFPq4u1rSPlF9jHFkLngn8Q6n+Ce+8cD48qd0NR
         PZIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aj6nIjKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si15574720ybp.477.2021.01.10.00.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 00:15:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aj6nIjKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyVsm-0002pd-A8
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 03:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsc-0002pS-2P; Sun, 10 Jan 2021 03:15:18 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyVsa-0005wV-9A; Sun, 10 Jan 2021 03:15:17 -0500
Received: by mail-pg1-x52f.google.com with SMTP id g15so10546158pgu.9;
 Sun, 10 Jan 2021 00:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uth7qFYZcAGIlpDOu6/OFlBV9OZB6Hp44dj92RTEM2Y=;
 b=aj6nIjKftcjdfPVQivkwQ1BVAO+XE4P9ILDpZV6dlITFk+zxIPFqYbbTnYFC3BzC0q
 45TwuCIzcbWlSlkExS/akjD5DLQHPNUDaSi+GTL4tnXZjUldppclIcCCHJWvW4Vatiad
 P9kYfckqggtpPv99Cb9/CpjgfD6C6m3DOqlnm+A+uB+Ls7gUnxlVCqZiDjGSkRG3IhtG
 hN+9m+vwvCG2HZEqm++lEVxegm5U+ZtMIR45b4c7WtCSXfEvhT0YaGKISdiew3Z/iQ7b
 vU99eQaXWCP58ZL62AvA9h5L3RiGxTJ1qOfntIIBORCxYI29N/O9/WNu0uU+w/9ACeTR
 EkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uth7qFYZcAGIlpDOu6/OFlBV9OZB6Hp44dj92RTEM2Y=;
 b=Oj7Xce5Y3KxxleID+Oq9ybrrEbeUjmJwwReRmiT7Zytz5CcXnbCJaXxPIU3NT9BSYz
 NXzqeGg4JgL+knEXOVnbVXfm2whJe9lbds3NiNTfhVyS8Yjbn6Y3EPLMszqsqYuquYI7
 zv4vZRwqLM088OvubS6wmPEcOyAXgXhdlPaRL+1KqcT6t8PXUVEKNcTSAfeIVTFmOOPT
 TEnzgsXzLEsOty1nDBpV5aNxc+NYX3m0yICVlrMJwWRnXTsyL/zdMzD9qXYKCb7GIFMZ
 hWa+NCpNSI1Ao/EOJdYMcUrJf/JkaQ8vaAfGcrGJqGm9TWlFsNuE0wjMM08aE4oeFr5z
 WwnA==
X-Gm-Message-State: AOAM532rUV7BZIzLeI1QrVDyUpOtaa4pn1f0wxTjZEGunDDAyxNEcvbL
 tmGIQlwPSo308PuenZ7TXPM=
X-Received: by 2002:a63:5d10:: with SMTP id r16mr14606872pgb.406.1610266514474; 
 Sun, 10 Jan 2021 00:15:14 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id jx4sm13519070pjb.24.2021.01.10.00.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 00:15:13 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] hw/ssi: imx_spi: Fix various bugs in the imx_spi model
Date: Sun, 10 Jan 2021 16:14:23 +0800
Message-Id: <20210110081429.10126-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
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
X-TUID: V7G0a4tM4UoS

From: Bin Meng <bin.meng@windriver.com>

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- chip select signal was not lower down when spi controller is disabled
- remove imx_spi_update_irq() in imx_spi_reset()
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v4:
- adujst the patch 2,3 order
- rename imx_spi_soft_reset() to imx_spi_hard_reset() to avoid confusion
- s/normal/common/ in the commit message
- log the burst length value in the log message

Changes in v3:
- new patch: remove imx_spi_update_irq() in imx_spi_reset()
- Move the chip selects disable out of imx_spi_reset()
- new patch: log unimplemented burst length
- Simplify the tx fifo endianness handling

Changes in v2:
- Fix the "Fixes" tag in the commit message
- Use ternary operator as Philippe suggested

Bin Meng (5):
  hw/ssi: imx_spi: Use a macro for number of chip selects supported
  hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()
  hw/ssi: imx_spi: Log unimplemented burst length
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |  5 ++++-
 hw/ssi/imx_spi.c         | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.25.1

