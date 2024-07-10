Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp390031njb;
        Wed, 10 Jul 2024 07:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwyo2afJJ0jEM2oltN9UqOP++KC4xnBEYvIKW8H0rNkLAw8WIkCr4roM2Sg6wK7jZ7ZC69ipjmuS62z4yI1GoeAMIWAaZu
X-Google-Smtp-Source: AGHT+IEYS3ZAXifb6f+Jvvog7NuECRvu2ZOCwKNsm4neYFM7QDnPLYnUvBJKngPW4jUs8YbYiFEO
X-Received: by 2002:ad4:5be5:0:b0:6b0:7a5a:a3f9 with SMTP id 6a1803df08f44-6b61bca16acmr73917876d6.22.1720620937888;
        Wed, 10 Jul 2024 07:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620937; cv=none;
        d=google.com; s=arc-20160816;
        b=LFbSdgqUIi9TF2WViYGVtRg3pykvEHLaXyzt7HOYY+sG61c1gv3cdHClTucKKI7NdG
         7iwRtO3uQIDR2YNk+L2uCURTJCxV7t47CbFqGdsX97JKnJKsoHMQ+JZK6vogiAFkWKef
         xVpwdesIt+hOi5oEPi9SzDI4jdPALzgljyVRXNaVCVWicQKWcoMgYiMvfOcp+uhR+LgJ
         oyr1czqGEhg4K6AZqgvbZI46PRQ7mSJdW/8nWOFWISFTSDj6sGyRwDdZ4KimUW9+doja
         iSOlrWnQLZDVDtE9X6k3mb6yqtewNwHWQaFGxZzQBIAfvEyOMlprL/FQxNpa/BuAA/ex
         2v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5A72BhSEgW2r7oVyXyiETrkNoXhVnGhowikXNWfzjCw=;
        fh=vGxA0LcD4j8NxejBsUPRXHtZM89P+PrenqDtTZB5PJU=;
        b=nZkh5DtkUdeeB6jk29RoOt+BQEBqL3oZ3EZPAJPQm2tPRSy0Bt2BiFqFWJClFEXF2m
         rVQAeROlYUS/X9AqLL5f8SUQoUv2uwzHjoSl3ixc2xEwjGRjZ87Hu2mWs3mbdcr6DHlt
         s0lHfJ7dTJ0uqX1kqkTQ4RuUszQHVwdFSmfjDi1MhKzZB1EtFRfPSKXfPgajHj/PxJTT
         IjcjivSAHgo/zObOqHHRQvV3KeQ1VJIHdkcQtSTWMKfI9lkI8fCRTO10bdOEcDR1kiOo
         CzUbGRLsEI7Ykv9SCT03LGKmv9Z+rZBYtvYi9/aDv3JqG6/lRJNIRvlDgcW9dRV9MMJU
         JIDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZPa7TqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61baa3f23si47565236d6.313.2024.07.10.07.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:15:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sZPa7TqL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY5Y-00060q-UB; Wed, 10 Jul 2024 10:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5W-0005mg-HR
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:30 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5U-0003pQ-Hj
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:30 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so34344061fa.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620865; x=1721225665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5A72BhSEgW2r7oVyXyiETrkNoXhVnGhowikXNWfzjCw=;
 b=sZPa7TqLzfYK8tHyPob2zJulumiKbUdkhSpFSYu072oVeQCRab3MLQtu84IQGPnHto
 UQzUms4VXAS4TrUbp0/j0phyRS5zulOAhQ/Mtu07t7Ot16Ap9UkM6Mqwt+rm+23X530V
 AOZ/ebzw0OZBNkSpR1LGIwECksqazE0YcWz8I7Y2tpr2ni2T2JjfTUAbpOGbebh92XTZ
 tKJwolzLl7XXAdpub0/r54OZQ24OaWtYQKr0Qq/NPl5GVC76fGaOF6bnjokKl8/WMudM
 fz8roZRIVVPc8KBUMT4IglfcCBeTaxvrZ4VdJooZU1s4GQi/TyCCflfySNZffX4Hz9GP
 TDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620865; x=1721225665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5A72BhSEgW2r7oVyXyiETrkNoXhVnGhowikXNWfzjCw=;
 b=ZdLqwchzTpQf0xz4ZgN2TypBe58SIjlA+npInFQywIoLFo+FiwkPEjLvv0D13k3cXu
 aMcsJJ5W61cWQrA2TYtMdPzTrUsaIjxrm3NlImI5RuqDE+Mg23x+nrFWp3j0XHcCOmIQ
 4iqDYWMK3qVmUW8xERkz6qOdQCPicsP04Jnw1P1b1fvOMaJYnOkxCriNt5ef+fc61tDU
 xKcNAXFiqPR3G5LhS5z/0pRntoVaEaeuypKqYOa5ySJvsppDnmfIRCV90nPSJRUk5VEw
 91HozxlzovZdPU/yvxEwNm2H4RpubommZhxj+xYcyI0oVxyDD6AA7XQqop7UksZtrwo9
 bV4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULcP/beEiRrpQ3/WvUy7+5OMkoduwf2z7PgF7qFiKSteNNO48828M1Ei/G7jq//qevvTm5Zoan/1i87LfeHTDv51pJ
X-Gm-Message-State: AOJu0YwbHB8looOaQtGEb5Fpoe/fS7DkgrAG1BfsRah/CFcQOL48GF1V
 PYhmjm1Dliz1Bp6R/b9ka35kaSoshIyjncMS1ntmH2JuO/u5+QQ9HbSfv9eUvvw=
X-Received: by 2002:a2e:8297:0:b0:2ec:6639:120a with SMTP id
 38308e7fff4ca-2eeb30bbb0fmr39555241fa.10.1720620865522; 
 Wed, 10 Jul 2024 07:14:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde84707sm5367623f8f.35.2024.07.10.07.14.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:14:25 -0700 (PDT)
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
Subject: [PATCH v48 02/12] hw/sd/sdcard: Register generic command handlers
Date: Wed, 10 Jul 2024 16:13:58 +0200
Message-ID: <20240710141408.69275-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
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
X-TUID: 1BBzB2+OebKK

Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a4b6c7baba..fc78d4e561 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2442,6 +2442,29 @@ static const SDProto sd_proto_emmc = {
     /* Only v4.3 is supported */
     .name = "eMMC",
     .cmd = {
+        [0]  = {0,  sd_bc,   "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
+        [1]  = {0,  sd_bcr,  "SEND_OP_COND", sd_cmd_SEND_OP_COND},
+        [2]  = {0,  sd_bcr,  "ALL_SEND_CID", sd_cmd_ALL_SEND_CID},
+        [7]  = {0,  sd_ac,   "(DE)SELECT_CARD", sd_cmd_DE_SELECT_CARD},
+        [9]  = {0,  sd_ac,   "SEND_CSD", sd_cmd_SEND_CSD},
+        [10] = {0,  sd_ac,   "SEND_CID", sd_cmd_SEND_CID},
+        [12] = {0,  sd_ac,   "STOP_TRANSMISSION", sd_cmd_STOP_TRANSMISSION},
+        [13] = {0,  sd_ac,   "SEND_STATUS", sd_cmd_SEND_STATUS},
+        [15] = {0,  sd_ac,   "GO_INACTIVE_STATE", sd_cmd_GO_INACTIVE_STATE},
+        [16] = {2,  sd_ac,   "SET_BLOCKLEN", sd_cmd_SET_BLOCKLEN},
+        [17] = {2,  sd_adtc, "READ_SINGLE_BLOCK", sd_cmd_READ_SINGLE_BLOCK},
+        [23] = {2,  sd_ac,   "SET_BLOCK_COUNT", sd_cmd_SET_BLOCK_COUNT},
+        [24] = {4,  sd_adtc, "WRITE_SINGLE_BLOCK", sd_cmd_WRITE_SINGLE_BLOCK},
+        [27] = {4,  sd_adtc, "PROGRAM_CSD", sd_cmd_PROGRAM_CSD},
+        [28] = {6,  sd_ac,   "SET_WRITE_PROT", sd_cmd_SET_WRITE_PROT},
+        [29] = {6,  sd_ac,   "CLR_WRITE_PROT", sd_cmd_CLR_WRITE_PROT},
+        [30] = {6,  sd_adtc, "SEND_WRITE_PROT", sd_cmd_SEND_WRITE_PROT},
+        [35] = {5,  sd_ac,   "ERASE_WR_BLK_START", sd_cmd_ERASE_WR_BLK_START},
+        [36] = {5,  sd_ac,   "ERASE_WR_BLK_END", sd_cmd_ERASE_WR_BLK_END},
+        [38] = {5,  sd_ac,   "ERASE", sd_cmd_ERASE},
+        [42] = {7,  sd_adtc, "LOCK_UNLOCK", sd_cmd_LOCK_UNLOCK},
+        [55] = {8,  sd_ac,   "APP_CMD", sd_cmd_APP_CMD},
+        [56] = {8,  sd_adtc, "GEN_CMD", sd_cmd_GEN_CMD},
     },
 };
 
-- 
2.41.0

