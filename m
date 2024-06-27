Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310654njb;
        Thu, 27 Jun 2024 09:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV52XxOyDtln63dAcq6BJAkbmWi02NMKNm7TOWzevoYXb6A2amvukEWMe/jrfuOD99IbTMaypJpL03w0oLUPTByC/tqXhxh
X-Google-Smtp-Source: AGHT+IEzCPhE0uX/Fh1SjWzrjqsx2IUymbVBYfjU8r6IJas93PAvtaP01ketSSagp2kCvCvxfKFT
X-Received: by 2002:a05:620a:690d:b0:79d:57ff:ba4d with SMTP id af79cd13be357-79d57ffbec2mr584635785a.60.1719505596210;
        Thu, 27 Jun 2024 09:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505596; cv=none;
        d=google.com; s=arc-20160816;
        b=R6p0XGQlDjLtB3A7p6dWu0ozHKxUfjIGoGjMGy3E4y4YtnfJYcyTJ9zpjLgORGgOfq
         s8zLODSthP9ccR2RRLtB3ue2Hl4KAr5lY1TtFTQ5t7AXR5t7Xw+oRRsDhz5RFSu8A8vw
         D7yOW2p201cEHLm0uYxjxtqCqqb2K9tXy/Ub/cLM/eZNc7SmxLkRdqqQYiu1WDrCrQ1k
         sLnaJ9Tb8Eyp/ES6zqPbu4fjLCqR914IWMSaYIE6Pws7v1Anm+Tsowu/6nCHLOYuB4Hg
         64p5Q0WwOEYK3gkA+CR40Za1ss9F95aNKWcPo/xvhUq/GZu/vrwYtaZ+FD+rITEppz/x
         Xp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lMFKG2q5UbCp1Dyyq8cGhI62qgCIuzAq7XqP054066E=;
        fh=HfT/BOUFpPWn9L+ynLtDeiH4augaqLQLBeboC3psZw4=;
        b=oh8Bt/RmrT9Ri4iBhHL2nTkvjZlRpFVyRU+EKDIDC+3BIEpkqN5G8lqn5yR7ESytPg
         ZOXnp0xYAce7a4wD2abPa1eKxlap1srkLxCYs7vb8EIRlZvResiaOUWeTcNhdxsa6jid
         2vbyu87UG7oEUoRRzlPsfNVzSbixhwTtS6TqQX3CvOa7h3bRT15Cum1g16KVg4XAJ2QM
         zWqc8HQZznKtB6yyaIU3e7rYMvjfBnVnf2z5XPkw2BJVnL7bpyvAYGQeKU6MkVH2eJ35
         N7kgXWn7QOLXY8UNouN7cpPJrzx428XWByxICCfRyM9QjRo/mG2cmHDSmVFSt9BGOfmH
         OVvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FScgS59z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d5c78bf77si161025585a.107.2024.06.27.09.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FScgS59z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrwv-0006a1-To; Thu, 27 Jun 2024 12:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwt-0006GU-Kg
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:26:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwr-00032a-LI
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:26:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42563a9fa58so9445185e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505572; x=1720110372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMFKG2q5UbCp1Dyyq8cGhI62qgCIuzAq7XqP054066E=;
 b=FScgS59ze2BffdTft0IpCZiMhgMvD6fe/hZE0YkksTjOwgDgxcFwtXIjOA2HTg4t6H
 9G3ebbC8S9uwFLUiwMjTrebsTbC0Js9xm0hITFDrvLebNommg/BSo+hJJxHGe44NrhdE
 wXVyCrSkbY0pnMVWH+rNRuYJS9r5FhINGHMMM6e32PL8m0k9USLY9fx4H9deH39Xl5qQ
 X4cI23ar/UbCIpRRC3Hr9O8VWOh3pTMoeb6inYS/2+e+XxaaJtTYPcNNEuQlJCQFJdol
 YjKbtW36aB5AHdGxr12emqmpE2HihvZ2z2oeIQ/LcpVZXYZYPbmnt0OTMYE1VfITqgYM
 /GCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505572; x=1720110372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMFKG2q5UbCp1Dyyq8cGhI62qgCIuzAq7XqP054066E=;
 b=xSN0sfE8pNS2GNJzBQ+jKVoBTkX0cp+XF5+sQ3Yn3JKhtaAKK4tfsyDWmOHmLtO+1A
 Ia+MxbRWl584P9ZDPcfF/zIKszcxP/4NOMsHG7DEwSyd9BkMzzMwHoN9zokr/dvSTq5S
 cjP61vaUYKqM0kRbUiVvzSCk1a2Py8hBWSK+fACS7ANRR/5Xab2Jyjjw7Zg3dl7LQing
 lTvDfNtYombo2icqd4plo4HMnfktKi98iZOskrS2Pk02Vy6AKnqDxMtjRfgqUjj8F9ai
 L0gRwIi7s/uEoC8Ievr6aVq0nvb6jbIWlb1VZdt8UpcHpYdGSwWUS92xyF4rM/xxOEMk
 srZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxhx5eSKOpgDsUNkP7FsMTvnGI3pShybOpgAa4cvT6+VScoHJbWgqPZWfFHHRk1unE9VLYwX+Y5xM4cBSkV43/gvZU
X-Gm-Message-State: AOJu0YyvIj+6Y7Rk2PGEDXksyJ8SGCk8mtbiMyoO6s6XC09Lb4ACz5Kp
 zr4R6oBqQnNGJrDxSGoiQKOTwA0MRB6b+pwRjlSBrYx2btr2lBIqhlA73Z+z7b0=
X-Received: by 2002:a5d:526d:0:b0:35f:b7c:5330 with SMTP id
 ffacd0b85a97d-366e4eddc42mr9294730f8f.31.1719505571937; 
 Thu, 27 Jun 2024 09:26:11 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674357c1c8sm2395796f8f.9.2024.06.27.09.26.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:26:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 devel@lists.libvirt.org, Luc Michel <luc.michel@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 17/17] hw/sd/sdcard: Introduce definitions for EXT_CSD
 register
Date: Thu, 27 Jun 2024 18:22:32 +0200
Message-ID: <20240627162232.80428-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: VH1l6rv3CujF

From: Cédric Le Goater <clg@kaod.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdmmc-internal.h | 97 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/hw/sd/sdmmc-internal.h b/hw/sd/sdmmc-internal.h
index d8bf17d204..306ffa7f53 100644
--- a/hw/sd/sdmmc-internal.h
+++ b/hw/sd/sdmmc-internal.h
@@ -11,6 +11,103 @@
 #ifndef SDMMC_INTERNAL_H
 #define SDMMC_INTERNAL_H
 
+/*
+ * EXT_CSD fields
+ */
+
+#define EXT_CSD_CMDQ_MODE_EN            15      /* R/W */
+#define EXT_CSD_FLUSH_CACHE             32      /* W */
+#define EXT_CSD_CACHE_CTRL              33      /* R/W */
+#define EXT_CSD_POWER_OFF_NOTIFICATION  34      /* R/W */
+#define EXT_CSD_PACKED_FAILURE_INDEX    35      /* RO */
+#define EXT_CSD_PACKED_CMD_STATUS       36      /* RO */
+#define EXT_CSD_EXP_EVENTS_STATUS       54      /* RO, 2 bytes */
+#define EXT_CSD_EXP_EVENTS_CTRL         56      /* R/W, 2 bytes */
+#define EXT_CSD_DATA_SECTOR_SIZE        61      /* R */
+#define EXT_CSD_GP_SIZE_MULT            143     /* R/W */
+#define EXT_CSD_PARTITION_SETTING_COMPLETED 155 /* R/W */
+#define EXT_CSD_PARTITION_ATTRIBUTE     156     /* R/W */
+#define EXT_CSD_PARTITION_SUPPORT       160     /* RO */
+#define EXT_CSD_HPI_MGMT                161     /* R/W */
+#define EXT_CSD_RST_N_FUNCTION          162     /* R/W */
+#define EXT_CSD_BKOPS_EN                163     /* R/W */
+#define EXT_CSD_BKOPS_START             164     /* W */
+#define EXT_CSD_SANITIZE_START          165     /* W */
+#define EXT_CSD_WR_REL_PARAM            166     /* RO */
+#define EXT_CSD_RPMB_MULT               168     /* RO */
+#define EXT_CSD_FW_CONFIG               169     /* R/W */
+#define EXT_CSD_BOOT_WP                 173     /* R/W */
+#define EXT_CSD_ERASE_GROUP_DEF         175     /* R/W */
+#define EXT_CSD_PART_CONFIG             179     /* R/W */
+#define EXT_CSD_ERASED_MEM_CONT         181     /* RO */
+#define EXT_CSD_BUS_WIDTH               183     /* R/W */
+#define EXT_CSD_STROBE_SUPPORT          184     /* RO */
+#define EXT_CSD_HS_TIMING               185     /* R/W */
+#define EXT_CSD_POWER_CLASS             187     /* R/W */
+#define EXT_CSD_REV                     192     /* RO */
+#define EXT_CSD_STRUCTURE               194     /* RO */
+#define EXT_CSD_CARD_TYPE               196     /* RO */
+#define EXT_CSD_DRIVER_STRENGTH         197     /* RO */
+#define EXT_CSD_OUT_OF_INTERRUPT_TIME   198     /* RO */
+#define EXT_CSD_PART_SWITCH_TIME        199     /* RO */
+#define EXT_CSD_PWR_CL_52_195           200     /* RO */
+#define EXT_CSD_PWR_CL_26_195           201     /* RO */
+#define EXT_CSD_PWR_CL_52_360           202     /* RO */
+#define EXT_CSD_PWR_CL_26_360           203     /* RO */
+#define EXT_CSD_SEC_CNT                 212     /* RO, 4 bytes */
+#define EXT_CSD_S_A_TIMEOUT             217     /* RO */
+#define EXT_CSD_S_C_VCCQ                219     /* RO */
+#define EXT_CSD_S_C_VCC                 220     /* RO */
+#define EXT_CSD_REL_WR_SEC_C            222     /* RO */
+#define EXT_CSD_HC_WP_GRP_SIZE          221     /* RO */
+#define EXT_CSD_ERASE_TIMEOUT_MULT      223     /* RO */
+#define EXT_CSD_HC_ERASE_GRP_SIZE       224     /* RO */
+#define EXT_CSD_ACC_SIZE                225     /* RO */
+#define EXT_CSD_BOOT_MULT               226     /* RO */
+#define EXT_CSD_BOOT_INFO               228     /* RO */
+#define EXT_CSD_SEC_TRIM_MULT           229     /* RO */
+#define EXT_CSD_SEC_ERASE_MULT          230     /* RO */
+#define EXT_CSD_SEC_FEATURE_SUPPORT     231     /* RO */
+#define EXT_CSD_TRIM_MULT               232     /* RO */
+#define EXT_CSD_PWR_CL_200_195          236     /* RO */
+#define EXT_CSD_PWR_CL_200_360          237     /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_195       238     /* RO */
+#define EXT_CSD_PWR_CL_DDR_52_360       239     /* RO */
+#define EXT_CSD_BKOPS_STATUS            246     /* RO */
+#define EXT_CSD_POWER_OFF_LONG_TIME     247     /* RO */
+#define EXT_CSD_GENERIC_CMD6_TIME       248     /* RO */
+#define EXT_CSD_CACHE_SIZE              249     /* RO, 4 bytes */
+#define EXT_CSD_PWR_CL_DDR_200_360      253     /* RO */
+#define EXT_CSD_FIRMWARE_VERSION        254     /* RO, 8 bytes */
+#define EXT_CSD_PRE_EOL_INFO            267     /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_A      268     /* RO */
+#define EXT_CSD_DEVICE_LIFE_TIME_EST_TYP_B      269     /* RO */
+#define EXT_CSD_CMDQ_DEPTH              307     /* RO */
+#define EXT_CSD_CMDQ_SUPPORT            308     /* RO */
+#define EXT_CSD_SUPPORTED_MODE          493     /* RO */
+#define EXT_CSD_TAG_UNIT_SIZE           498     /* RO */
+#define EXT_CSD_DATA_TAG_SUPPORT        499     /* RO */
+#define EXT_CSD_MAX_PACKED_WRITES       500     /* RO */
+#define EXT_CSD_MAX_PACKED_READS        501     /* RO */
+#define EXT_CSD_BKOPS_SUPPORT           502     /* RO */
+#define EXT_CSD_HPI_FEATURES            503     /* RO */
+#define EXT_CSD_S_CMD_SET               504     /* RO */
+
+/*
+ * EXT_CSD field definitions
+ */
+
+#define EXT_CSD_WR_REL_PARAM_EN         (1 << 2)
+#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR     (1 << 4)
+
+#define EXT_CSD_PART_CONFIG_ACC_MASK    (0x7)
+#define EXT_CSD_PART_CONFIG_ACC_DEFAULT (0x0)
+#define EXT_CSD_PART_CONFIG_ACC_BOOT0   (0x1)
+
+#define EXT_CSD_PART_CONFIG_EN_MASK     (0x7 << 3)
+#define EXT_CSD_PART_CONFIG_EN_BOOT0    (0x1 << 3)
+#define EXT_CSD_PART_CONFIG_EN_USER     (0x7 << 3)
+
 #define SDMMC_CMD_MAX 64
 
 /**
-- 
2.41.0

