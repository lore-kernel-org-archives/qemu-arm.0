Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp310521njb;
        Thu, 27 Jun 2024 09:26:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4ed70+zHLLmD/4AV5BgVXABrR2N+9Dit4aR7HHqd9wTrr+C+Mdb0yT+pE2rd5o50vjVEQSb81ahEcWpz99dWW76Wvmp37
X-Google-Smtp-Source: AGHT+IHQ0RBP0/5F3XagOQQkusMabpjcDb9SNV/fuwsPFnDP84TcP11OOmI1SGFZHSHgEbn5VL3k
X-Received: by 2002:a05:6808:10c9:b0:3d5:600b:edc7 with SMTP id 5614622812f47-3d5600bf549mr7519129b6e.11.1719505575402;
        Thu, 27 Jun 2024 09:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719505575; cv=none;
        d=google.com; s=arc-20160816;
        b=mcPi+9z1plWNKY5xuxYzISNVM1c5eEFfeMbswF3FWKNjXGZgyK4fqwWAWp+c3oUcOi
         P3vwlOH+Yy0ljKD7Ei28T5EAs/KGKIASAVdZ6vYIDheW+w5/hdoczoeNzRJcTQqvEZGx
         QEBmgAN8zCKHWHNs8N+KENmTX6L/7B4eidmoTh1U8y/ecW/2l+7pwC/BeHO83Brtt/t8
         u+00M/+IFX8JGAybQ4PpxO0Y428HXPxt4UZaFqJnwZrhDDSGindc5YDqWyCymAho9C+T
         qcOPSANpOGvPXi4CCLrCsIDfcnLbhsES+w5Mv9mwdLRTC8PjSeZC9EptMITXO66wUddJ
         OxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ra/Td8NG8gR6eO/UQBLHxrI5ovJA5Z/mboPyl147upk=;
        fh=XyjxE+9k3zd9uwgMQkCMVx6gQ3cMtTYabSIL8hHbr4E=;
        b=D7qcsVA0WwI9p/ha2N3L9zm0KfcgzvNPxkIopUJyZFnqWTFEv/6VcBrxnkPmZlqmWy
         ClAsMIFI1iCdDOpCp3ROE2PjRAYDLD0Rmv8PFw2mhYs+tL9IhYF1eIje9Prt/5yh/FKN
         JhGPesDZ6ZRneabmPPYg1PKFPAAFMmGS+c5XGX8EhQTNAjkVyqHKVZpX0BpDub7ytqd8
         bYlE3wfAaVhNZwD7uCxBqe82BATZRYSiU6bb1zqd6SfmrFkIRZFabHlUI20Bzn3H4y6T
         1gBY3WdFh7DvIixlQfmmsed6/8Bi2hnANipqSjRCSST1WzivlPB3e9Jzl3pLW15K5dQR
         ga0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPa+hjsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44641ef6e5asi15682001cf.31.2024.06.27.09.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jun 2024 09:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPa+hjsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMrwo-0005pV-Hh; Thu, 27 Jun 2024 12:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwj-0005ew-Qi
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:26:07 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sMrwe-0002it-QY
 for qemu-arm@nongnu.org; Thu, 27 Jun 2024 12:26:05 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42564a0d3ceso6602235e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Jun 2024 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719505559; x=1720110359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ra/Td8NG8gR6eO/UQBLHxrI5ovJA5Z/mboPyl147upk=;
 b=pPa+hjsqUuQnpThuuiHvwrVcrFZrth8o3ViEH5sY8OQAeJtfHHghD8g+E79GiiNFAp
 iDZSXyx0cO9MDUXU3VErh/UgwH/qwq3tsrNgU0GoP3iQz0dXLpU0AxYAsCxCaGTaZF/3
 KfPIRFpYVD3hJfDmcYHOVWzI+Cyfk6hKAU5/iCcxAbAnP77q0/VM0yoFOXxsuNLH084/
 vN04xHepoCyyaueGRHHVH4ZX+57TEXFU2e4eG2A+Joc0+aQQ1SNXx37VoscYzMYpK+Gi
 E0HDMdPvU8nG3nwhY8Tb/SALzu4nTM9sl40EbEujaFzL7rTs2zYD3LAxV7GxYlM4fNS0
 qqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719505559; x=1720110359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ra/Td8NG8gR6eO/UQBLHxrI5ovJA5Z/mboPyl147upk=;
 b=cyR28L5rnz6/seMmUsE+d7aEf3//l6tWb9kl6/w+4IGvy705XVT4xQ/dlbJsC299g8
 RQANDOEqKa+8Q4BITCYqzYGF1FrbH0XDBPoTZZolYP0Ah3bYxFrFAk3M9/DOKNItMev1
 +F9S+fzs7Eu30yq/ODisLEyk3Z0DdGdo5B/lSq64cMRbDzY2QD9uYddUzWd4L6oJjsLV
 3C/9P9HmkjbhjphxFhxm3gYbmASnJW48gu87tmxuUChn1go2Cwj4y/cGKRsJoXe51ajs
 xDA/nC1GFo8LqFGR88R+3fxov/9x4Gtw0Nubl4oNmlWocVHEda3xvl8s/Tgz8Obc/Bcd
 iG0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3W0uxGSRpwCrkzZeP/1va/JStHneSOZX1Ew4fgXo+vnnCdbsu9prdf7lP31yqQsyW7barm123s7dVevTmufn2vjhi
X-Gm-Message-State: AOJu0YzX7A1hTDe8Mjjo7fRDJeHQyWcUrwbm1y7NGnFuH3wTt6+6aPYn
 rYXMOvou/yrZi8wt56Gl2U9/xSx3MNvTC8IgzC3qvOae3U13mimydbIqjwz90GK+KwtroxQGv22
 4Bgo=
X-Received: by 2002:a05:600c:3c8d:b0:424:8ef1:816a with SMTP id
 5b1f17b1804b1-4248fe36550mr88926515e9.5.1719505559497; 
 Thu, 27 Jun 2024 09:25:59 -0700 (PDT)
Received: from localhost.localdomain (33.red-95-127-46.staticip.rima-tde.net.
 [95.127.46.33]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c84248afsm72601705e9.31.2024.06.27.09.25.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Jun 2024 09:25:58 -0700 (PDT)
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
Subject: [PATCH v3 16/17] hw/sd/sdcard: Generate random RCA value
Date: Thu, 27 Jun 2024 18:22:31 +0200
Message-ID: <20240627162232.80428-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240627162232.80428-1-philmd@linaro.org>
References: <20240627162232.80428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: IW1Yd/q3o/Kk

Rather than using the obscure 0x4567 magic value,
use a real random one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c         | 11 ++++++++---
 hw/sd/trace-events |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 5997e13107..d85b2906f4 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -46,6 +46,7 @@
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
+#include "qemu/guest-random.h"
 #include "qemu/module.h"
 #include "sdmmc-internal.h"
 #include "trace.h"
@@ -488,9 +489,10 @@ static void sd_set_csd(SDState *sd, uint64_t size)
 
 /* Relative Card Address register */
 
-static void sd_set_rca(SDState *sd)
+static void sd_set_rca(SDState *sd, uint16_t value)
 {
-    sd->rca += 0x4567;
+    trace_sdcard_set_rca(value);
+    sd->rca = value;
 }
 
 static uint16_t sd_req_get_rca(SDState *s, SDRequest req)
@@ -1113,11 +1115,14 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
 /* CMD3 */
 static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
 {
+    uint16_t random_rca;
+
     switch (sd->state) {
     case sd_identification_state:
     case sd_standby_state:
         sd->state = sd_standby_state;
-        sd_set_rca(sd);
+        qemu_guest_getrandom_nofail(&random_rca, sizeof(random_rca));
+        sd_set_rca(sd, random_rca);
         return sd_r6;
 
     default:
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 43eaeba149..6a51b0e906 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -43,6 +43,7 @@ sdcard_response(const char *rspdesc, int rsplen) "%s (sz:%d)"
 sdcard_powerup(void) ""
 sdcard_inquiry_cmd41(void) ""
 sdcard_reset(void) ""
+sdcard_set_rca(uint16_t value) "new RCA: 0x%04x"
 sdcard_set_blocklen(uint16_t length) "block len 0x%03x"
 sdcard_set_block_count(uint32_t cnt) "block cnt 0x%"PRIx32
 sdcard_inserted(bool readonly) "read_only: %u"
-- 
2.41.0

