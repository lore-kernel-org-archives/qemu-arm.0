Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1559563dlb;
        Tue, 9 Jul 2024 08:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUy8PTr2Fjtx46oQcYyg74X32V0twKOs2/iaZrueb+wRo63OB9CteGfePtapMuhDWNVXKpcj322bW0RNdPO67+/K2U0SrL
X-Google-Smtp-Source: AGHT+IFkZcI7TrmSRs6Tn3ZwMYKYib2ga7oqlGWiFzw/bpX/RP2BYEKDMQh4DOnQyEg86IxR4yv1
X-Received: by 2002:a05:6214:2a46:b0:6b5:12c:b345 with SMTP id 6a1803df08f44-6b61bca6ac2mr36242266d6.16.1720538817158;
        Tue, 09 Jul 2024 08:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538817; cv=none;
        d=google.com; s=arc-20160816;
        b=XLn+fKuSo5GJLhxJ/vMgWZOpyexsE5wctTpo/pT2dy9z1bFr32SEIWqjXUmUuJTjMj
         EtFartYwfA5/HkOLCYQmHglFk++drSKYhWpxPWh9V+ybc5SKZGUbqMMsRn53xpyAE6/d
         xClxGWAR1C3NLq0LGVt7tzQewRgDC96rPU+MNUD5pFx4CwC8OCyt13zroasTiPmkD2Op
         KxJWTjjVBgAvHkL/RDHahYQL+VuvGSDR0YeyY7qjCbYVPRWfvjIwnaPnqWH9OGpRgrYE
         /ho4H/cdnCwAk4c4GFF8vvfHM4hyj5P4x25zmup7b5dKPc3rIMnjVC6WL09sdQ7tLad9
         2z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=whoLRb2gVbD8Sem/KoA+COzzbDt33IZ9HQp6/Mjesmw=;
        fh=zTR2DIZxB+EjUIADI17pmMbbiq3j3O+7JcocDxdvvR4=;
        b=VS8EbRVfGp39Ke3mPgM/bGkmohhjXMb5kEGJGZUOcTxZMRwsOXyNOqoQQsWXL3R7+K
         f8lLDHrlh79SSUkti5omKTif8oJe4wZV6d74jCFYiBtwrsa70pIBiHjarlKV1812Dm0m
         oz27ZhJIGkzSByWGzFTKinqcYyd2XXmHFLm6RjVoPEMBetJQE+jYnYk/x+ogjxTPjjnL
         gR8R8B9cy5tsjJt+6IZl8smFlWv66nyTNEknTb6djM80o1zm4LzNWZcMb2IS8VuJmasY
         5A+z0jN+uNR6CYTRbxPGgDLCSpVm4bzZnG42bXmlAA8/5S9awQ9OGP5WmRzCleBMehcY
         GrLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb9+az7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f76fbsi24301926d6.24.2024.07.09.08.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gb9+az7O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCjV-0003O7-Bx; Tue, 09 Jul 2024 11:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjT-0003El-JJ
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjQ-0006CZ-64
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4255fa23f7bso35937075e9.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538774; x=1721143574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whoLRb2gVbD8Sem/KoA+COzzbDt33IZ9HQp6/Mjesmw=;
 b=gb9+az7O6MAMpfAK5CrC0wEO54m7yN5+/H/rixrwkIpzA6bQ0GgOVBVa01zxlI6B2i
 T8tc6zc7ACuDN+9zVpx1Gxvbuj1+UgndVDRD5byTk/4PQCv32ajjngnPp4wrVFnltAiT
 4xDbJnXG3bxSaX5fAun/foTVpNmIX4bQQDKjc/UWn9mIIKfMk71TYDN1gN5Z+XakrmT+
 aJlSUBt75EjzKeiARwEaMkfTzDEMXN12XGRpEXllYsOYZCc7AEA31Xol7oq2JHXvKeei
 pRyRhIgcuNAFXf9JXbKFYPeslYQAMMJ3UZBsnz8TGocG7fLBU2/2l7nhcmCzwG4GfiJ4
 9JWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538774; x=1721143574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whoLRb2gVbD8Sem/KoA+COzzbDt33IZ9HQp6/Mjesmw=;
 b=kgbj5jqXWZJWk1srFBPvWw4rZQlSPZo1MHGHHmdsap0XakKby56jqMSMocGr0i3OUb
 2+i4yBj2MNAfXHryWBMN2u7k7PM4Z6FxvJ3liMP4MnMec6JKmxdP3qhWeXnolGKZzKsc
 h3oeSSmX+yzjM0yNthSz55xE3Akm3TzhbQTpy6cQhmy2qn9RfQD67Hh1xNiwF/9dabNG
 MLmykHFv4+qj0kAKZSTesimYHvZ7JxGp/uShMV6+xHZ0pBa98dkbhHQ35H8ylIakF4iF
 dry5cNQXym4qAoQxWZdcrZiaW7CmaQtEnI8MFYIyEAOQC53xWty43TUa3b+phLf5aVyN
 rPQQ==
X-Gm-Message-State: AOJu0YyE9jgCSexICsAm7oE4lWKwcxOMkp5HPgLGL8qSYvYYR0r/JVSI
 6SMsLYphCkXlCBoTeG50jZ7zTJ2PUFqau//7qiqAQG1xWcmzBDiqhuPEGU0QuuPhXGV/HsMoLev
 c
X-Received: by 2002:a05:600c:6541:b0:426:6364:c2c4 with SMTP id
 5b1f17b1804b1-426707cf9c4mr18535505e9.14.1720538774580; 
 Tue, 09 Jul 2024 08:26:14 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa065bsm2855862f8f.72.2024.07.09.08.26.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v47 02/19] hw/sd/sdcard: Register generic command handlers
Date: Tue,  9 Jul 2024 17:25:39 +0200
Message-ID: <20240709152556.52896-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uwnDq4Oyjs4X

Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240628070216.92609-84-philmd@linaro.org>
---
 hw/sd/sd.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 91a73aea8d..eb50862adb 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2387,6 +2387,29 @@ static const SDProto sd_proto_emmc = {
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

