Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F0C87FDA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:49:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhb9U-0001q0-Hs; Thu, 31 Jul 2025 17:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhapk-0002Ix-9q
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:29:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhaph-0007zx-Jd
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:29:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4563bc166a5so7884305e9.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997340; x=1754602140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Obt7l2dUxC1zZFfVKxnVIXG3NpYsLOMtlWCU49WAEg0=;
 b=rHn+gtU/BZPOYKM1FvdO1B+JDY6UuL+hwppn203K2lKvC+O9cDEzHg7rfJaZOmfyH1
 GVpGx05ro/QKKHaG1k5cqY2ywlSvSO+xLWBjeIEzR1YLqYuNnMRRtqeS3y4bZ/Lw35ck
 Uf6RqXij7zMRrLDcs/Rxz95gt/xNG0ncUmPgwgiXC74rt5Ngjft8kH6Ud3o3zIXY3Vtf
 3vHLCJPB3JX+MOr8Ef3E2UticS2XjBg7pCYu4FRfsz5BOH3SkRyiFFBgsw4Yeat/XQPc
 UIDsJhII3RDeLu7+ntxKhq8r31j98ORSJsDPcnLJim8ENOR0QLIUW/ugbgz8rh8hP2oX
 2lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997340; x=1754602140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Obt7l2dUxC1zZFfVKxnVIXG3NpYsLOMtlWCU49WAEg0=;
 b=lM3wKWNywlFPhwa18v4hdKDJRClyWTUxEMjsgVCwhhgCE/wv9FJUazveYjsPsmxUkN
 QSuaKiSVVApSr6GR3FG6B5ayFopi8jbim4A2fWF6bPlyLLLRWQfm8oJIjrJd2Lbh4GOd
 wkKOrkkCmINxLEUD9WJxKAVmT+sSjKILw4JTy/vqpeXQnCHoHSVMJ+M55FJysktH2VKy
 Psip8A+YaHrfXxH7NClf+2HxXH5PlGh3YvkxePO+SyM0kE0J6ptUJq19rG71XNXZQXS7
 KRzmhTAYd3D9A6+T9bBNmuBPSkjW6hC2p6TLTQ0QY40i41HN1GhE1eXHy7eBj9+dLh/B
 ZvNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4L8MfLzKrF8XQK5+O1KmS9cHNEajS48JF40G3rlskt2gGuJzllCFpj4qoiDv92kW8AoNUg0tORg==@nongnu.org
X-Gm-Message-State: AOJu0YxHn+/m7weGg1yr4rz7x+mnC3ajcCoWMXHqD8/D8ORoPdjr7ugl
 rr9sjAcy/582RGSpptBNkWjOs9Z6lNR5P50661TMIwNIiEelc6+dgUSePhEnMliMZzY=
X-Gm-Gg: ASbGncvt8v1uZsVJmVZDmBRjq6K65+It+Dgvx4u1w/eCdysBAsmKlnS+hiz68hpFQs4
 MRf9SJeQL9mSLgJZvJHRMnZ/5rwB5ilJ0H9QS4VCdD8TjkBfLP2twR4nTvRETtQu1JxBE7bXBxO
 omIXRer0/eY0rHx4HBD1Y9p6xi/WiVIB3WPM2tzC9bHju1IpwhIRdfm9cTzrdr1gy8lHJt0iuQ3
 ZybjaG3m0yCZ2HtbbRBWZfG/rJogtQHjVetFnbwhW+WhP81ppiZHyBLErLCcnBdnzWt3+YfQ8Dm
 hhiz+4wfbKa8dgicsapfuvC03PUPMbxt1RuTxP59nM7nqaHXLTqLNRwMDHOwKGzKfaMyqhQcZst
 /SXhMcx4l6dtQOn/wMkyelWYQgDKa3MWcbrENdpLFB2eHjhQ0n2I9yfUoZludyJIxzT+O5f2c
X-Google-Smtp-Source: AGHT+IF0x1KCEHM6qibFWkF/SRblq0y5j3s9nWHgsDMIjOquYMLJ1MWGmeq0wvW4yyd8xeqMt7qyOA==
X-Received: by 2002:a05:600c:1d09:b0:458:6dea:af6f with SMTP id
 5b1f17b1804b1-458a2431906mr39548015e9.15.1753997339922; 
 Thu, 31 Jul 2025 14:28:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458981d0b06sm82538785e9.5.2025.07.31.14.28.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Jul 2025 14:28:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Weiwei Li <liwei1518@gmail.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 09/11] hw/sd/sdcard: Disable checking STBY mode in
 SPI SEND_CSD/CID
Date: Thu, 31 Jul 2025 23:28:04 +0200
Message-ID: <20250731212807.2706-10-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250731212807.2706-1-philmd@linaro.org>
References: <20250731212807.2706-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The card should be in STANDBY mode to process SEND_CSD or SEND_CID,
but is still in IDLE mode.

Unfortunately I don't have enough time to keep debugging this issue,
so disable the check for the time being and the next release, as it
blocks Linux. I'll keep looking.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ef72ce717b8..79395f7c5bb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1579,9 +1579,20 @@ static sd_rsp_type_t emmc_cmd_SEND_EXT_CSD(SDState *sd, SDRequest req)
 static sd_rsp_type_t spi_cmd_SEND_CxD(SDState *sd, SDRequest req,
                                       const void *data, size_t size)
 {
+    /*
+     * XXX as of v10.1.0-rc1 command is reached in sd_idle_state,
+     * so disable this check.
     if (sd->state != sd_standby_state) {
         return sd_invalid_state_for_cmd(sd, req);
     }
+    */
+
+    /*
+     * Since SPI returns CSD and CID on the DAT lines,
+     * switch to sd_transfer_state.
+     */
+    sd->state = sd_transfer_state;
+
     return sd_cmd_to_sendingdata(sd, req, 0, data, size);
 }
 
-- 
2.49.0


