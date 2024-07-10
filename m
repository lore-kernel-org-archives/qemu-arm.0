Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp391262njb;
        Wed, 10 Jul 2024 07:17:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFXnY1Bv9Jku1rgYQ2PjnALY+YdlMJ9NpXr3Cdq/MYO7KPsXNHkfUlxttw89ZRgDx0idnWBtHsywH2M3OEcnqgsncy0pnU
X-Google-Smtp-Source: AGHT+IGFQh+G/iwU1KZkjvq0jKb3G1RkuVBn63dLJXXubWO2d/SQaxuB2H1cEjSGdaoLI97XphhP
X-Received: by 2002:a05:6122:4781:b0:4f2:f139:b2dc with SMTP id 71dfb90a1353d-4f33f2d4462mr6794086e0c.8.1720621048636;
        Wed, 10 Jul 2024 07:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720621048; cv=none;
        d=google.com; s=arc-20160816;
        b=l8uddRFcfL9C3CiKV/SiVmvchM0994vHwggd6HHMs4WWxtR2IbCd0Mfam5QwddV21c
         QTPdsFbwEoIRQBVy+hGALitaNOaCdYpIRL8T8buykkp0P0KRvT+AMX8m7JKYDw1XUZZj
         5l9vVovUifNzMsaXrH2lZgSQpVcs7KkOIvSNMTQo6CYIOJu+dM5NGIWYg6VfC5KDLBvq
         iNW1TmAjhjAsw09Cz43KtLupRy6PzztxZIO7n8DiSSnfkMwvAuUxlIYglprc+2yuYSOG
         9UNOk+IoVA9sdFEOIGjHgkxwLKdJ/WyrRs3mBkxRmGB/Rl5oAXVbdLLidk7gS7/C21cs
         ITFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/gFRB+hAQA0cGPCvSBja+2xdFZOixPnxHszPhshqLtU=;
        fh=GH5Q+RtWzBCNH9E515TvTIpLJh2pWY/kifiV2Cu7nrY=;
        b=o5t1at2aM2S+0LL5eJRA7fAgZP7hUrf0O2ZzXSCzu4mz4v92wc5owhtQ4V5Ymg4m4j
         rkCrDcnyLEUrgmLHtsMk7HjE0fKTB1jI+dbA1opi6fWr5Aa7V5YG6si0DorzQB2M6613
         +vf4xJf2vHKbzyQ7ZdYui8Y8tIOQ5itNlCIK6B0ExeR43nyL0uFN1g5o97egzB6vdmdG
         ViI0DvnEpn6NAS4dLoWHmJqxNH/YrAqHOO7D9r3ARZ51+1MOKKFqC+N6mVC5BiSuY5fd
         AOTRP16bJ+lm+wqzcirlRia5x1ufWVWDktj4PR5gYRwizfNB7urt0/uKBZJSMmksYLfE
         dGbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AU/55esw";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f33d9ed674si649698e0c.62.2024.07.10.07.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:17:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="AU/55esw";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRY73-000472-TZ; Wed, 10 Jul 2024 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6J-0000az-Lr
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 10:15:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY6A-00040y-I1
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 10:15:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4266f344091so17264415e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2024 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620908; x=1721225708; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gFRB+hAQA0cGPCvSBja+2xdFZOixPnxHszPhshqLtU=;
 b=AU/55esw4Ppl7nxlbKx3ZFJSQXKMmNiMDtWxZW7GhvEMYijYJesNM1/j/uL32v3pRO
 aii7oHAKiNQnYe8WNoe/nh5wIrkz4c+WaD7bVYD8+09svjb3P2ZNwAkvZexJ2aPILNkI
 MWTregUEI/FurPiNQC1kfQbxNHtQ7vcRcJa7o3aY4s6lqoOQNj61fDMhLWsFggtIKfJy
 t5pw+6DeisAykZCLQddmNjCNvcRBbOzG2tz23tDoF4y8qNMbp9jONlHDI1VcdCIbES6P
 37nGX5bralsjGpgF7A7UuWvdQd4YF+ipJdIbFutyZktnsfTX7AbF9v8TkOKn7KPibOBH
 qx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620908; x=1721225708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gFRB+hAQA0cGPCvSBja+2xdFZOixPnxHszPhshqLtU=;
 b=HpYas9Ke+t981/Yu+jp0Cz8+cUxk5sctyxtYYp/FyRFtHoMSl2rwFzwXuo9E5kEQTK
 lB+aT7Jg7PrkmgCAnaJA75axVyRFswUXeAy6cz60B4m75W0vSvyqw/bA6HRDzVlyvQ0B
 bqTl46tz6S4dU3i2VPkV/4lVAXct/y+9G1eY+HuDnRPsFk3NdkuYSq6sCKJxAeXPfgPg
 M+V9/75Ib3qmMq1pHdIpzG+8McLi2EIs+oXNlNV7V+T5EdMcUmIR74Ypv4jNM40ay5LH
 rjvtGbDVdvLncK42FJKc+3+mML/8I0D5EwmhZzrSOnSHWqzn1eJlreJm8qQ+oStT8m77
 kcew==
X-Gm-Message-State: AOJu0YyoR1SeTGEE5o99vcJNdqQ6Y2b4Mol+cXYL+PakGcteOBi5KPk+
 70UFu+jAnWn1IZsNVSHPHbNcPOmSIqPpM3pchaDo5uynf08wdBKR2hjpo8TDDeX0qqIcVKxjudP
 B
X-Received: by 2002:a05:600c:257:b0:426:6308:e2f0 with SMTP id
 5b1f17b1804b1-426707f8fbamr33784475e9.26.1720620908457; 
 Wed, 10 Jul 2024 07:15:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279731a60dsm9464315e9.40.2024.07.10.07.15.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:15:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v48 09/12] hw/sd/sdcard: Add eMMC 'boot-size' property
Date: Wed, 10 Jul 2024 16:14:05 +0200
Message-ID: <20240710141408.69275-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /zcoFlrpK5jO

Avoid hardcoding 1MiB boot size in EXT_CSD_BOOT_MULT,
expose it as QOM property.

By default, do not use any size. The board is responsible
to set the boot size property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e6f1cc2066..57a9eb91d0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -135,6 +135,7 @@ struct SDState {
     /* Static properties */
 
     uint8_t spec_version;
+    uint64_t boot_part_size;
     BlockBackend *blk;
 
     const SDProto *proto;
@@ -492,7 +493,8 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
     /* Properties segment (RO) */
     sd->ext_csd[EXT_CSD_S_CMD_SET] = 0b1; /* supported command sets */
     sd->ext_csd[EXT_CSD_BOOT_INFO] = 0x0; /* Boot information */
-    sd->ext_csd[EXT_CSD_BOOT_MULT] = 0x8; /* Boot partition size. 128KB unit */
+                                     /* Boot partition size. 128KB unit */
+    sd->ext_csd[EXT_CSD_BOOT_MULT] = sd->boot_part_size / (128 * KiB);
     sd->ext_csd[EXT_CSD_ACC_SIZE] = 0x1; /* Access size */
     sd->ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE] = 0x01; /* HC Erase unit size */
     sd->ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT] = 0x01; /* HC erase timeout */
@@ -2704,6 +2706,7 @@ static Property sd_properties[] = {
 };
 
 static Property emmc_properties[] = {
+    DEFINE_PROP_UINT64("boot-size", SDState, boot_part_size, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.41.0

