Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp390397njb;
        Wed, 10 Jul 2024 07:16:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1WupbVhCZKSvXm+1O35HYo/KJwmLpfWOeXvsgKAQO6jHEqufW9brGhoYsdVoaKXxD6uaECCqt+uDdN4aHFzi4Jz2jj3hQ
X-Google-Smtp-Source: AGHT+IHyGyjWLvaSWNEaMWIT9gJOX8UGmjKfmEd3xXS1oB2YqIxCt9luG+L0AXhR0Ichr+1eldwv
X-Received: by 2002:a05:6808:21a3:b0:3d9:2f59:c0d5 with SMTP id 5614622812f47-3d93c006a6dmr6792770b6e.19.1720620966452;
        Wed, 10 Jul 2024 07:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620966; cv=none;
        d=google.com; s=arc-20160816;
        b=f10JSNuYu36Z+tMfTeh6kLNvbjmXMlhGEvACjkTAQ7oYmqcsvLMOm+GdG8LclbMzao
         w84XJ+WD94n7A8HlHY/sPK6KKJVKt7mzHULh89Or3lVCAk/ulA03esArmKKIOcMyhGzB
         Sa1hV3SyqYRIMM2d7r8imJZZ4bNGut5dDPRtGHCyjlXGqGV1o24txwsVmUWIjWnm/bsS
         +mLEt0xByJVQCpkDC5h+k1Gw01kN2h1QAEHA/glnebyHlJpuSkGUxcHiSD+LXmSVzO2F
         7GEXTKIU7PGij3bMRYmUdGSKur6onVhCFYuBHBvHautgkRPeyMS8g+ponoEENF4L2Phl
         HZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5jntY4rbxkV0U31BLAJxtgRo8uMbZXfthoHz8ocRbQY=;
        fh=jdJ/mwHf2H3IdDwMCZxRQ4QtrektEN/o1GI0d9FoM+E=;
        b=VMuD6BZSDsLWYsLO37wmmie7O7kLVfJ7rX6sNquUPwD4wuIQhkpX4kxHCtmzsFMs21
         cC1Wro4Lyx5TwJXitOss1GQvfpZARXbfmcwEXc8cf6cjw2bU2+Z3yOgP4qfMNZnc+QeZ
         OhFC8txZnGbEYxuW+H/jhZzGWWeTLiTgJ8BVLW0gr6FPfMiMzLg7xX6ykrjnL0NZio37
         LMbmMb8oesStFTUhqruz2HCKmkrBP/xK5uRt1H1Dr1Kezs4JFiUIRhyX7i/wZHO2D/TM
         XlO4y5OKs3FsLoQp3R2DHY5zWIEXIOJk0tK1C9aLE6f1sgXOaFPbzT+CPbnnb6gGds70
         BGqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlWJczvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190289f2si467606585a.182.2024.07.10.07.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlWJczvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY6o-0002KE-3w; Wed, 10 Jul 2024 10:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5t-0007ed-Hj
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:54 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5r-0003y8-PK
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:53 -0400
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ee910d6aaeso71485611fa.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620890; x=1721225690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jntY4rbxkV0U31BLAJxtgRo8uMbZXfthoHz8ocRbQY=;
 b=rlWJczvMR9GC/fTqiQ+YzhLt9cpc4IelvTWnhR7MLdKfPofmg69Go6CEk1F1tPlaCZ
 +iMOXrYXb2DFVqtyQN8c8t1BNDzpaIofLEtNoPBsO6aeg0kx9wEQ9chD1DiOPUOlBL1Q
 5x2eHk7LfWyUy1bNTfWBA1jXoUTgzASeKPqZzbLGprliZcjzodMMou6iev1nzamm7CgZ
 Ao5UZozjyJ5kLBfbThuHXrMGburue0QWlOV7pRYLM4UWBwlAp2wR3kAMK0OZRfOfFwv9
 wBSQ5hpqkd22S8kmiL4t5eNqEfRfqJT1a+sys3HrvO6tgD13z/8a2RX21p0drolVjJA0
 /wPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620890; x=1721225690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jntY4rbxkV0U31BLAJxtgRo8uMbZXfthoHz8ocRbQY=;
 b=S8sFyg+fE6Xz0Ey0DHBlFzloHkq5bPAiMRBwzBBtFI6ck+xuqtkY3YtVi014O7Q823
 5T0cJWGUCwYysLa8CKX7XOAAdYkp1RlrrF/jRCQdeOkomSdQ0sRKtSwlI8NSQYVLgAr+
 FN9MrZfDM+M+YDY/3p7ccUO+ARVW4kKbNjPGnf8bVVi4b/RATjU9+h3wnfIC9RKvzAPl
 KcmYyk3B2LwWJgrNmagEj4BWG0a5JZFTXZ9XP6Rpag0fcViPGwl6Ki9WLn53UNuziT2b
 +nofNx3XcNRIJQt/vS9m7t2KVG9A1T+94+Q+WnOA+oR9Ng2qH9djW3KTxAjVHCnxMTm2
 BHCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT2WAAp5r0glqHZ0isWR0RKgTqCiSzruXiYkxK5RnQdm005wA8ufmhn4AiEuqD0HhC9Clil+s/XjWKIFRlBFa4+0Ve
X-Gm-Message-State: AOJu0YyG3cv1V2oW32c6chi4TEIL8WZNDyLAWFIVOIV0v/XkimRU0MyA
 AfVRNblSRb9ZwGq7owmogwhJWSnI78kDw6p3uBCENvDImoXwkNPVEodfIrjIpn8=
X-Received: by 2002:a2e:9c8f:0:b0:2ee:bd1b:84c with SMTP id
 38308e7fff4ca-2eebd1b173cmr20288141fa.0.1720620890154; 
 Wed, 10 Jul 2024 07:14:50 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427165c69f0sm60227135e9.30.2024.07.10.07.14.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:14:49 -0700 (PDT)
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v48 06/12] hw/sd/sdcard: Add mmc_cmd_PROGRAM_CID handler
 (CMD26)
Date: Wed, 10 Jul 2024 16:14:02 +0200
Message-ID: <20240710141408.69275-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2/pgRxapo50a

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/sd/sd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 550f63418e..3628686832 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1568,6 +1568,12 @@ static sd_rsp_type_t sd_cmd_WRITE_SINGLE_BLOCK(SDState *sd, SDRequest req)
     return sd_cmd_to_receivingdata(sd, req, addr, sd->blk_len);
 }
 
+/* CMD26 */
+static sd_rsp_type_t mmc_cmd_PROGRAM_CID(SDState *sd, SDRequest req)
+{
+    return sd_cmd_to_receivingdata(sd, req, 0, sizeof(sd->cid));
+}
+
 /* CMD27 */
 static sd_rsp_type_t sd_cmd_PROGRAM_CSD(SDState *sd, SDRequest req)
 {
@@ -1917,9 +1923,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 26:  /* CMD26:  PROGRAM_CID */
-        return sd_cmd_to_receivingdata(sd, req, 0, sizeof(sd->cid));
-
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
@@ -2478,6 +2481,7 @@ static const SDProto sd_proto_emmc = {
         [20] = {3,  sd_adtc, "WRITE_DAT_UNTIL_STOP", sd_cmd_unimplemented},
         [23] = {2,  sd_ac,   "SET_BLOCK_COUNT", sd_cmd_SET_BLOCK_COUNT},
         [24] = {4,  sd_adtc, "WRITE_SINGLE_BLOCK", sd_cmd_WRITE_SINGLE_BLOCK},
+        [26] = {4,  sd_adtc, "PROGRAM_CID", mmc_cmd_PROGRAM_CID},
         [27] = {4,  sd_adtc, "PROGRAM_CSD", sd_cmd_PROGRAM_CSD},
         [28] = {6,  sd_ac,   "SET_WRITE_PROT", sd_cmd_SET_WRITE_PROT},
         [29] = {6,  sd_ac,   "CLR_WRITE_PROT", sd_cmd_CLR_WRITE_PROT},
-- 
2.41.0

