Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1284275lfq;
        Sat, 9 Jan 2021 04:47:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxljrcWixYeGS33zCLmhQ6Nn8w/h5W6E0nr4jFvNnu+i2FJwtt9Fgw/sdscOLcZLAnqzSU6
X-Received: by 2002:a25:b43:: with SMTP id 64mr12730913ybl.57.1610196454584;
        Sat, 09 Jan 2021 04:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610196454; cv=none;
        d=google.com; s=arc-20160816;
        b=L3zUoseVYnUUnIJb/Zv12wvBEDDjQqjBL+pwXhIebgY+rjhRs3b3L4XeDJJiDqZRys
         NqaC1xYwVAGe6hQW5t1aZlN81un5W49yePwgGel3Zir2gTLDAA26co5aCOReAOskvXgv
         YybgJhVpy+MGv6d0z2qAKFzYZUhSiV1oUlEwrZ0NYi1E8BtlKKPZLUU9FdlJj/8uNyn2
         MR0uBA1GH9QxH4H4nCSyOUKz5fICRm+on1NCjaT/4JQRWiqvcD1sHzVcGsHdCLjzYSod
         mtXgtSkCCtjdDQQaXNs0ur7l6cExYcE+kmiCtoBj40S1n83ShyrhSaRsUGHndgDdlhuH
         zHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B2jAlpjFw7XPhC0HC48VFfcY7gcoBuUEhgdvZgD7bo0=;
        b=ZTCgjHTccseuhJ8hSwgHKhhvJbjziTQjme4kMyH/Rbu0VXkwCWSbQ0FXwckpRk/8cU
         5I5s5Ksxx4/rhayosCvFtXzbx3uC5RtxSsmjmvZjOV2yjafiBPpekpC6oYmxvYotHd7N
         LolilAsC3WzO9J2ip061U/QAcr9AyemwTJzIulY8deO43llaBazY/Ivyn2FzmDpqpq0M
         MFDfAerFvugc238P4SMd29UBIx8PtXSJEWASr/yxRnbItOEWodDewVmOIlZ3RtGYpONQ
         EguJV7iwY5UyEBoQc+BJIfCAlRBrYheIz6ZHhXbLRD4mxQFvwpbPNWFF3ScrAIYckH+P
         ILVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hP8DW9ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 201si11970558ybf.130.2021.01.09.04.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 04:47:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hP8DW9ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyDeY-0003lW-0A
	for alex.bennee@linaro.org; Sat, 09 Jan 2021 07:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTs-0001MM-Cx; Sat, 09 Jan 2021 07:36:32 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kyDTq-0001kd-6D; Sat, 09 Jan 2021 07:36:32 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so9432533pgj.4;
 Sat, 09 Jan 2021 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2jAlpjFw7XPhC0HC48VFfcY7gcoBuUEhgdvZgD7bo0=;
 b=hP8DW9agdXeqI+RMPb09GuMDQF5cuJlmvKV7kaR7lrAbDASzxGesPsSHaiLDZlkNur
 KHiqZVSAkD07BZ2VRK5xPHce1Kt1oIJ+8OZeGwc5dYJKhyNPtURIXDg7IZspVV4XZYz3
 E/KcUCqT1zb1XKySZ6UlKKWsfSnXyCjdNU9p+m/f+PZi6Yf9hYYvM5oMEpEg6tsrmCrH
 K6UCpaDz9My+o1QZI9kR6/orf/KxKhn4AoVi/61whBRqjYEqI7/8oNLKAndoeNNA+/AB
 7FBKXlBRcUl10f0f9HHZbFWCivPXiVLnXbScLTkxJWiLo/sT0DiKKkkhyhGH2XFnW94c
 KZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2jAlpjFw7XPhC0HC48VFfcY7gcoBuUEhgdvZgD7bo0=;
 b=DkUPxIp6KYl9oCCOPrsUSbnThdQkf3qEidxBF62A4psPK49nXPXE5OjMjBGsk7CyN/
 ioCWDDFXF/RUCPU0OC0Sxn7GfkjgnYZvlT9t4cKIa/tX9idSRhCsSeojVSlkJheZka0L
 Xu4mhA1/gnvhSixmLKD6aLEijSXZXE5HY1FhwYR5w/JDGW4cbADbgKmXBjar8hJwF1z5
 O/i9y6cX9JhlNnyAXpaPP9VcOYI04UucJoipSsDMmClFuO8ytk+VjBbxa15xk8fG/y7A
 TU88oQOZR65K2qaceFsStzA3U2PJ3EAYqw5ZvM/ZPEjTI8h+n1NyzID8ELyLGfK+uz7d
 kH1w==
X-Gm-Message-State: AOAM533viWHVrDFQ8gs0mxkHvJKx1OL7xgJdX2clOAvvG9M53xvXrON9
 22S1H3Ihc0bY8u15ozthIi0=
X-Received: by 2002:a63:174f:: with SMTP id 15mr11537566pgx.49.1610195788448; 
 Sat, 09 Jan 2021 04:36:28 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id b10sm12840748pgh.15.2021.01.09.04.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 04:36:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
Date: Sat,  9 Jan 2021 20:35:44 +0800
Message-Id: <20210109123545.12001-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109123545.12001-1-bmeng.cn@gmail.com>
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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
X-TUID: 9vsdnSSxWrep

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

(no changes since v2)

Changes in v2:
- Use ternary operator as Philippe suggested

 hw/ssi/imx_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 609d4b658e..68a32b689e 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -187,7 +187,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
 
         DPRINTF("data tx:0x%08x\n", tx);
 
-        tx_burst = MIN(s->burst_length, 32);
+        tx_burst = (s->burst_length % 32) ? : 32;
 
         rx = 0;
 
-- 
2.25.1

