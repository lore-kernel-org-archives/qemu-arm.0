Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02901C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 14:59:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiwee-0003gJ-RJ; Mon, 04 Aug 2025 10:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKv-0000jZ-0A
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 09:34:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKq-00007S-Jr
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 09:34:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so7701295e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 06:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314479; x=1754919279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Uzbc/9L5Pzkd4K6o0zmm99krPdgkAOBzf5hBdRfajU=;
 b=UbqGDXIcpJluEzFdOg505sxM49p0GdbFz6afW+XE25/GFxW1dAZY+Bni+f8POrZ0dK
 lppaCeJcQRL+Zph2/iNPw+z9k8QvpiLsRw3ZSSuE8oIHaxd80VBh4Pm+/SRnb7yc+RUy
 G7GebPGjiSJYYPvlia8RShDgALPdAv68ffQwNGJHLy7R9WZ/s3hvzWow3gT3Bzm//I40
 5ZxCWruZxOtAViiCMoZV/SkJ/ckR6p8x8CLWyZAl/39g1uSl9VSWXgO4ZWNPR+4Df9gd
 gdM/RA6l+VvYfzdShvoMJ3k48wPAaIFyzDp+AtE1AC2T6YQFQ+woZbNHwwaKaHG7MSZq
 vgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314479; x=1754919279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Uzbc/9L5Pzkd4K6o0zmm99krPdgkAOBzf5hBdRfajU=;
 b=rmwW+dep7QEqfQTvYxW1KCtb72QA6dSVqWGSs380+nIKu9qC7RNOUB/sOLMSpi/v7Z
 2u6c7tVw8gqe+rYAqlHFymiQaGpkKvbL93kdYcnL/+VMOzmdqLrmMyZVJwU7LUPpbjBu
 zku2gQnSEX3mXw+0qG0WJUFGd3iUsSt0f9DQ7WbLcO7uQQacukxGJ9tn0ZpfmGyCLbfr
 WyTEk6AqQFNPOvYFvOT5/YlWTX6p0l2pPIbVFV7XBAfBBYq60AsFPfSQKBPHZzSPHVm/
 25agVB0jPu7PQKhLMhDQPRlLR4B/2rgweSZfSvlymvXUMJiK0dzrbMNyXbRsE06u+Bkd
 RZ2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8PnZQzp8pQzwutCYivnZrTGUPaSYfKS2Qmz66NNjJ0UspZqaT4jWv13yXBuoEflVQ6ECUPimSMQ==@nongnu.org
X-Gm-Message-State: AOJu0YxDVvtWsP4MChdphDAMBKuiOhsk84IyahOrlKogK7YCUtFaJa5G
 2L26Qjl+wHarGmM+Moq28IQi+zcBHbNASyEZwQATZzl5OXGR+BQy7NIfC3dnIVv7TgY=
X-Gm-Gg: ASbGnctN/010SOgG1uRkeAdtBfK4B5QRepSdGaDtaId0YH2Z0JwK3beImEdcKviORkH
 RMMWNAd1IUT+TqkI0RISHRmQ76AynTd1U6HFWEFmWM7B1VnCexqcHC/LmnK8RDUBCEYiuLjc4vP
 es9WbyOVtTwuhGozsve14BFCrjwAgcwyzVtVBY/4ISdDXgqYWAR4jaPwtyM0EbxigO0NicXDuGg
 BGTsWgBu/CvU7doEXSJPrHcT9fHmFVUWWG5IMxGU6dGBh76T3Hx3kfOF5rpPlm2a+2C0R17W923
 5K3uvMyyGIU8WfUnwdwkAgH1cE9yTjCxvlbC9vYT9d7NHE6tvhKP+gvZWGFARLHeNyJR9Tvo5/s
 MocE6Avzuy6LHtHOFcqFw1pq8FiYsMRudDnYwqZtqoJDoI9hoh9ClMka47H+VuipD4+H2zvQoCz
 Co97DVdJU=
X-Google-Smtp-Source: AGHT+IHdQV3ZZ7y0hcsW5s0sE6REmong0zZ6FpRzcsHdqr0+Z8yx2mEad8dQ6KedYSuApn3+hceRpw==
X-Received: by 2002:a05:600c:1554:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-458b6b316a2mr72524415e9.21.1754314478960; 
 Mon, 04 Aug 2025 06:34:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458f713eb44sm69385015e9.14.2025.08.04.06.34.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 06/11] hw/sd/sdcard: Use complete SEND_OP_COND
 implementation in SPI mode
Date: Mon,  4 Aug 2025 15:34:00 +0200
Message-ID: <20250804133406.17456-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804133406.17456-1-philmd@linaro.org>
References: <20250804133406.17456-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

While spi_cmd_SEND_OP_COND() is incomplete, sd_cmd_SEND_OP_COND()
is, except it doesn't return the correct value in SPI mode.
Correct and use, removing the need for spi_cmd_SEND_OP_COND().

Fixes: 775616c3ae8 ("Partial SD card SPI mode support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 01ec6d951c8..df2a272c6a2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1414,14 +1414,6 @@ static sd_rsp_type_t sd_cmd_GO_IDLE_STATE(SDState *sd, SDRequest req)
     return sd_is_spi(sd) ? sd_r1 : sd_r0;
 }
 
-/* CMD1 */
-static sd_rsp_type_t spi_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
-{
-    sd->state = sd_transfer_state;
-
-    return sd_r1;
-}
-
 /* CMD2 */
 static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
 {
@@ -2046,6 +2038,9 @@ static sd_rsp_type_t sd_cmd_SEND_OP_COND(SDState *sd, SDRequest req)
         sd->state = sd_ready_state;
     }
 
+    if (sd_is_spi(sd)) {
+        return sd_r1;
+    }
     return sd_r3;
 }
 
@@ -2590,7 +2585,7 @@ static const SDProto sd_proto_spi = {
     .name = "SPI",
     .cmd = {
         [0]  = {0,  sd_spi, "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
-        [1]  = {0,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [1]  = {0,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [5]  = {9,  sd_spi, "IO_SEND_OP_COND", sd_cmd_optional},
         [6]  = {10, sd_spi, "SWITCH_FUNCTION", sd_cmd_SWITCH_FUNCTION},
         [8]  = {0,  sd_spi, "SEND_IF_COND", sd_cmd_SEND_IF_COND},
@@ -2626,7 +2621,7 @@ static const SDProto sd_proto_spi = {
         [13] = {8,  sd_spi, "SD_STATUS", sd_acmd_SD_STATUS},
         [22] = {8,  sd_spi, "SEND_NUM_WR_BLOCKS", sd_acmd_SEND_NUM_WR_BLOCKS},
         [23] = {8,  sd_spi, "SET_WR_BLK_ERASE_COUNT", sd_acmd_SET_WR_BLK_ERASE_COUNT},
-        [41] = {8,  sd_spi, "SEND_OP_COND", spi_cmd_SEND_OP_COND},
+        [41] = {8,  sd_spi, "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [42] = {8,  sd_spi, "SET_CLR_CARD_DETECT", sd_acmd_SET_CLR_CARD_DETECT},
         [51] = {8,  sd_spi, "SEND_SCR", sd_acmd_SEND_SCR},
     },
-- 
2.49.0


