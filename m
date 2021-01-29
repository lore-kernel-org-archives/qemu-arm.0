Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1122427lfo;
        Fri, 29 Jan 2021 05:24:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxn2Fxsq6fhMgJNNgzGR8xqNNHZXUInrgojByX7CCTF6qL1KK+Skg9ywsIVO9ZJBBLWJXdJ
X-Received: by 2002:a25:81c7:: with SMTP id n7mr5796347ybm.171.1611926651145;
        Fri, 29 Jan 2021 05:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611926651; cv=none;
        d=google.com; s=arc-20160816;
        b=ROpkJMtAUEu9Cc30fSe75mDDW1tZ+NwyQRXGdLlPMUpmL/aovFDty3+VSgOoCiRRce
         yaSoVTll8kfWtmQo4nP0c3K0egFx+Y1DNUpAIcbUAmaCl6U58+buf6vI/O0iM2vgZFgx
         KSJRaCSeb7TQYsg+Mnm/qP3lfjT82qypMuaaH5Tsna0ZNr/lkVj0f8KD+szbHBosfLhg
         ChO8N35OYjvjx7FJvSNweBZqRWFF5fG8Bp5ZyLokCD/Y84DG+aQ0bTUwZbU577kXQcN8
         Rk0xYwXVXRYkjNWSGKDblN35Rk4R/TezYNhVQL5C4fexsqKqTQMzIPHmOGdU+levvuMp
         iLGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=lmqeHCWqp9qghkyoc/CrFvAqWcZrXsJSJffMK75rvqg=;
        b=JKWJdLzNXbiEFqBQBIT5WGFKD2ZN5THhjtyQPCYp1EXQV7u5ORDdrneWy9bGtlfHZ7
         K8AzmPP6cXZLxZNl/8DUHHXdcRqj27qpfO/qoO8B/wFTXQU4TT7F2FC5K4T86vGneV0X
         6nPcQOo4lKCj+PCNTpqJuNnwoP/7Fgr2/2q4Sau+9XtvjgcfiGa6liEJ6LYIf8JRUdrT
         xZDiB7dkC3T5FElX8og5LRwwWH3G10VSPNLRFHim22BXbmglmoxN+Esj3AYgKDT6fFE4
         EpRBv1BWSGRzGc3AaG2DloKKTDSoN4kopHYDu+XhRwlniSMk1iWyEp8/TgMhKnOknH7M
         bwRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTvqqt3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si8520877ybq.166.2021.01.29.05.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 05:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=WTvqqt3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Tkw-0003Wr-HW
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 08:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkd-0003Wd-N2; Fri, 29 Jan 2021 08:23:51 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l5Tkb-0007qW-Ml; Fri, 29 Jan 2021 08:23:51 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t29so6216959pfg.11;
 Fri, 29 Jan 2021 05:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmqeHCWqp9qghkyoc/CrFvAqWcZrXsJSJffMK75rvqg=;
 b=WTvqqt3TparG65WcKlpBXF5YgNWgklHPIm1phSSqCJIpaQeucW1M9gSpxHdrAFvqWB
 lGLiXO3nkYdWyTU+i+hfcDmSctkLs16yA8bxFDEEp6yUN8oPV4qgdtevXIQjsRoduymn
 Z0iAXjUrMF00yIs0zmj8ZrIhdjyXPO5OwSjYzjtbt0CVjaWbMazRQHCFN5edwWcxjAEj
 a+MTpQPo4PoSQS9cTJa0A55hbeGR6bF4ujwE3qEopIYrchUEuV+MDcsMVLeEqlSZYm7h
 KOYNgvp2h12K1zKnbY5gdTDjq3V9Rmg1DI2FbjgbhrqC4exEV4NUPyw7rXgnyUSuPljH
 9fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmqeHCWqp9qghkyoc/CrFvAqWcZrXsJSJffMK75rvqg=;
 b=mctN1NkQnz9BBj3q3BxUWY6qmkdHAoblIJV8zxEoUuLzc9mEboDqE0L7fKMtdThvV8
 8FCHVjDgKkyPQzuINdjqF6IXChoba0sStHdpYmmfqLJxYJh1Qvy+oGdzSjUwHPfNlceb
 i7kwHnxyUhUyBnkMro+r1KFZXWGj4xotNW3pNFvrPlkiIXc5DCLNqH+Q3r74YXm2L15F
 V8N8d65HRcSDQQ7aqliuD9CkfiwmxMABVj5E4lw3PzDiB76+kK6w5PDaBWvBzTGl2VRF
 zx2Npci3NbNs2Pfn340xSk/nZnYnPAEdC7IzpVGjSGZ4Db1b6qBx812Iv2U6jl2x63ij
 YxKg==
X-Gm-Message-State: AOAM530myQ4nqhaTYe57ZYpLd37GfD+hR0N4F35lNao8a7h3dFzRmerc
 2BaQyqUTRvg/Rq0KUTAZcXU=
X-Received: by 2002:a62:a108:0:b029:1c1:119b:8713 with SMTP id
 b8-20020a62a1080000b02901c1119b8713mr4340831pff.74.1611926627431; 
 Fri, 29 Jan 2021 05:23:47 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id j6sm8857259pfg.159.2021.01.29.05.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:23:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v9 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
Date: Fri, 29 Jan 2021 21:23:13 +0800
Message-Id: <20210129132323.30946-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42a.google.com
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
X-TUID: HaodanczfR2I

From: Bin Meng <bin.meng@windriver.com>

Starting from v8, the series is based on the following 2 versions:

- v5 series sent from Bin
  http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
- v7 series sent from Philippe
  http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612

This series fixes a bunch of bugs in current implementation of the imx
spi controller, including the following issues:

- remove imx_spi_update_irq() in imx_spi_reset()
- chip select signal was not lower down when spi controller is disabled
- round up the tx burst length to be multiple of 8
- transfer incorrect data when the burst length is larger than 32 bit
- spi controller tx and rx fifo endianness is incorrect
- remove pointless variable (s->burst_length) initialization (Philippe)
- rework imx_spi_reset() to keep CONREG register value (Philippe)
- rework imx_spi_read() to handle block disabled (Philippe)
- rework imx_spi_write() to handle block disabled (Philippe)

Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
(interrupt mode).

Changes in v9:
- Add a 'common_reset' function that does most of reset operation,
  leaving ECSPI_CONREG clear in imx_spi_reset().
- Do the LOG_UNIMP when the unsupported burst length value is written,
  rather than where it is used.
- Squash the 2 LOG_UNIMP warnings down into one line

Changes in v8:
- keep the controller disable logic in the ECSPI_CONREG case
  in imx_spi_write()

Changes in v7:
- remove the RFC tag
- remove the RFC tag
- remove the RFC tag
- remove the RFC tag

Changes in v6:
- new patch: [RFC] remove pointless variable initialization
- new patch: [RFC] rework imx_spi_reset() to keep CONREG register value
- new patch: [RFC] rework imx_spi_read() to handle block disabled
- new patch: [RFC] rework imx_spi_write() to handle block disabled

Changes in v5:
- rename imx_spi_hard_reset() to imx_spi_soft_reset()
- round up the burst length to be multiple of 8

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
  hw/ssi: imx_spi: Round up the burst length to be multiple of 8
  hw/ssi: imx_spi: Correct the burst length > 32 bit transfer logic
  hw/ssi: imx_spi: Correct tx and rx fifo endianness

Philippe Mathieu-Daudé (4):
  hw/ssi: imx_spi: Remove pointless variable initialization
  hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG register value
  hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled
  hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled

Xuzhou Cheng (1):
  hw/ssi: imx_spi: Disable chip selects when controller is disabled

 include/hw/ssi/imx_spi.h |   5 +-
 hw/ssi/imx_spi.c         | 153 +++++++++++++++++++++++++--------------
 2 files changed, 101 insertions(+), 57 deletions(-)

-- 
2.25.1

