Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3334469lfq;
        Tue, 19 Jan 2021 05:43:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcMmSxzo6rzk+KZTYDqo3jmeqSll09qmE38+ieNzrAwm6HVyaSz+FKCJWIOi9K59HwlDmr
X-Received: by 2002:a25:ab8d:: with SMTP id v13mr1064789ybi.479.1611063832648;
        Tue, 19 Jan 2021 05:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611063832; cv=none;
        d=google.com; s=arc-20160816;
        b=kiXV/hySgbfIFIocddJFRUZkbwxD4z1/ODt9aG0/YG6PNCH8+6TkhDH7zXJrGEBpR8
         VY2D7AVNkJZp1+VPK0xnXT5FqaFR2TbNb0sPLI7ep7yt+xGVQ+LzsW3Ijca3VHVbzWdD
         WId/gJYwdoGU8cCC5Fm4GBgTbLLfyq6b5NcbJJohZbMefokrGCga4Pc5Q95RK/eoE47D
         2tp+tDNbtOGrY2KihMABFu1l4ZAi/G8TBGLOuHTdh6c+F/tyol+2Cijs7IiUSSDffALz
         IA6ZAa2NNV1Ino8iO2jLZDztyoxEoJKW5S2HYwjfFh0SFgnFlSad/Nu3an1IUMMf1kkl
         YpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SqWEsFEvcxyZ/X/Aq4mkUc4tlPZsiwZEYgKXZtCqeJg=;
        b=e9DY0BlJIriNzl8sE1hKwW4ZPU8G5g42yYDDDzZvk6gvwQRQB5FMRkgqi3e34Hj+uF
         ManiWVMuZ4nYGK9Uq2Sb+JVZJXDra3hwOcjVGccMMF6z+mvpZQZNgCNM0TtOVWSbVV6p
         x/BP1xPP7JZZMzTcc6vG4UnmjdTqs7IA2vU3Qmupo7LpMMdhmp0SWq9c7XGJn4pv4mb9
         cAbUTmTTj8zgdC95v5Z5tzTGZV7qbREdk7Lwd+Jq8yVYCCsXzilNx3cN6zFcTA7Vtutb
         ta9s+QFrjcO8A/BLRthz/rT6W8xUwj/mqWiMnZgsRdWsJZqppLu7/2behG7xCRJ7ndmi
         KxVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b13vNqwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b34si13169811ybi.324.2021.01.19.05.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 05:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b13vNqwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1rIW-0004na-2I
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 08:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFL-0002oZ-Ne; Tue, 19 Jan 2021 08:40:35 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rFA-0003Tx-FX; Tue, 19 Jan 2021 08:40:34 -0500
Received: by mail-io1-xd35.google.com with SMTP id u17so39613917iow.1;
 Tue, 19 Jan 2021 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SqWEsFEvcxyZ/X/Aq4mkUc4tlPZsiwZEYgKXZtCqeJg=;
 b=b13vNqwbiITGojMPjalYj7p5TXbJzDXWRobt3chF4FAMobgWd+7hysyKE5bmTt2SsR
 p0d7ubP947Fj4h6i7P1nfkr6kV4SpuXvOv6FRlcAWIHwcwlWpidYSfJ4okpMxrWunYbI
 gRM9pZx5kc/gB0pbSeT6k0SHr8LwxMy8Iid982G4nsuKWPq4Sg34IUmOb0pFhGMNsxwo
 0btLkMi64HOcttk87QfiDGvIpx1Gj7OuBP2yKhTR6fCeJQ/gHYvSW4zIXctdtthFE1om
 AUGMMw7j6vecfpKc57cTplNTO20QebZWL/9CpUVvmoMix48OyBSy14C6yQYAULokpysD
 y/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SqWEsFEvcxyZ/X/Aq4mkUc4tlPZsiwZEYgKXZtCqeJg=;
 b=uWSpV1MP8SYMsBxfNMZ3Wmxi698q5TXfDrYU9gyV8K1CIC7a/EV1Dub0yRohuxwqIy
 vou97H4tHm9bUNUR2bbWcpe7VThWQF6mq5Dg9An2gcVGFhSMVGyL4FlLpeJjvevRKXC0
 lqnOX0teyMa3ZmrHBqFDTIkqrjbu68ePvDaqZyqMgkaEaLClBG0B08EQf7N/H5THdLlM
 pllY7gNsGo+kpFL1I54X0C8TA7nYsSWThaP4k8Czruniw0cYI6boy6uF2oHaua+w7B6z
 5mmLbrc/4ugeA6qeifQAD1aVLNVRvxvB8lbCIKHhpiUE/37b55zvD0To9RVnObpZW/bI
 6YSA==
X-Gm-Message-State: AOAM531RjcCNFwd5rOXgBDQ0AkSxIIocf3XEPsDXfksQ9xONbEWwuZNA
 XX01YILm0NWNqGuEdrhGVvlt8+rYwTM=
X-Received: by 2002:a05:6602:122b:: with SMTP id
 z11mr2914194iot.210.1611063622638; 
 Tue, 19 Jan 2021 05:40:22 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:22 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 03/10] hw/ssi: imx_spi: Remove pointless variable
 initialization
Date: Tue, 19 Jan 2021 21:38:59 +0800
Message-Id: <1611063546-20278-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F3Ffnbf/Egvu

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

'burst_length' is cleared in imx_spi_reset(), which is called
after imx_spi_realize(). Remove the initialization to simplify.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210115153049.3353008-3-f4bug@amsat.org>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v7)

Changes in v7:
- remove the RFC tag

Changes in v6:
- new patch: [RFC] remove pointless variable initialization

 hw/ssi/imx_spi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 4d488b1..8fb3c9b 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -434,8 +434,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-    s->burst_length = 0;
-
     fifo32_create(&s->tx_fifo, ECSPI_FIFO_SIZE);
     fifo32_create(&s->rx_fifo, ECSPI_FIFO_SIZE);
 }
-- 
2.7.4

