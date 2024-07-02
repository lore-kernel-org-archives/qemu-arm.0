Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1993300njm;
        Tue, 2 Jul 2024 07:17:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUo09nDq1/25wpqJQxTXV9RrykJP2IWCzo0sZlWF6gDunGTyfGjtnHrKfm8soQvqAfMyvvPOTInsasYHHzOOQwmU+rCVQ6l
X-Google-Smtp-Source: AGHT+IG/DzRWVQgFlupdL+/nx0m/SSIpbF15Nracr1rrNY/Z9WEY530jfzZuh5EdLnw/ZU71Fu+q
X-Received: by 2002:a5d:69c9:0:b0:367:526a:5bcb with SMTP id ffacd0b85a97d-367756a9db9mr4414018f8f.19.1719929846287;
        Tue, 02 Jul 2024 07:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929846; cv=none;
        d=google.com; s=arc-20160816;
        b=S0aZ9h4a9Lr+ctlGeudSAho8TFTSvWy9HyFENxEZVsx4MwWaMdCLcNDwbZJhPgA4Ur
         Ajj2j9GQpT7JQ2TbZVTKCVkEjshz3kt4RM7L1bTa7VXUMx+gLdkIUuAmeYTl2vvrcwOQ
         btRxLlCcZUXS7IgKbEqWo79v88NMfYpWA6iaoQBV2uRh8Ux43zZkId+XaPab8fmgMay6
         5qj0sMM0Sj4lmHelVrjNPjiYnTHeilY2iLP4mWJXHssYTtPJRBYvFLnZwrBPLCoLI1Ge
         bZ1HjMTf34M8mNgAqDR6BZMZIJNR7wQGWUxp41b3xHEW687+I/Og6ucTMwdr/wzp0OK9
         WaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OvsDqyOLxb1We4xAO26ZSKOk+5yWllmPJC+X7Ugk7Rg=;
        fh=Fiyx0s0UmgQf3pWvIZqaDiyI8K8WGd3X1IqR22ZXQPI=;
        b=AvUWYfQfwHl3VNP+leUdmWZxwY/Hvy9Je77qVkO4U0U4rmhSBD3QNRgqNSei4GmKwE
         SPrg4axj5+MiowROL2YJgegN84F1uLuz297+k0gd50nbTzBOKLWGiPthcsHg6/EitPLV
         bYMNHk3PpaM/09Smj6USac+bvcTCYEi0C0IYqR+ydfD4IqhwIvz3XCXlA4QboONzw3e6
         79v1hHiIK7r7FNkR46HlbjyiX5BRKnGshJEegXa1KlFoP6p4oEPicJhDeiOZyQA11WyK
         GaCbI1aUuSyIDQBfPLLcR2mEtRgLoxPwXQpBKkJnuAW8JnhemiZYDxmJKhbliPOtDwmt
         xEhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gWkO9/D9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3675a10b424si5837920f8f.931.2024.07.02.07.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gWkO9/D9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeCZ-0000Ve-0F; Tue, 02 Jul 2024 10:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeCI-000781-Vc
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:09:31 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeC6-0008Ka-Dj
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:09:30 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so4429600e87.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719929355; x=1720534155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvsDqyOLxb1We4xAO26ZSKOk+5yWllmPJC+X7Ugk7Rg=;
 b=gWkO9/D9CN2GiRotl8BjLAwtu/J+BswaAdjFItiGpqxDRxbUSt2rdaAsrCeMIa+1v/
 qRC/IzWuitgjq31nlDHH9Q/UZrySC+XjBP68SZFVuOSOoPfFG83tziOMHQLUaDMkqX9v
 TMnaKjaISUzh4NEsW7FNbvxbvIuiFDxTDPTJNyQ4X4e9xLv/zUnlWaIPpHO6a+QW8C0h
 uX3YuZVVM4ZG1ya11C8dQgcsERYZAwliWEFXCWNqjjYcCoYFwKjFjY75Epf3AeGUtNc5
 6xPr5Bfe/sW/1BIQ4glYpzBP3XhwzzMut1sRZlQwBaf2Ar1FZS1ImQUzCFgdOu6kSHy7
 arrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929355; x=1720534155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvsDqyOLxb1We4xAO26ZSKOk+5yWllmPJC+X7Ugk7Rg=;
 b=UChoWjxgjg5/tCtZN9JWILPn4FS2GzVO/710OC0s3l9iYlkQfu0N8kN9m6APWgpyHs
 YPnp9OJTmUp++ynxaXnew4jkda7urom0AMXmECY1vIqo7WRe8UejI0uDsJWrN+90nFhR
 0RkMljqElZOBHVrg+pybNlrvqb8cWHUTfp6ZSWM+AZ0k6pCLhDa83RkvuQYAEXFVIcso
 7Szv5gy8Y7ZsY2/6wgXU2OymPreFN0RxAH9ehlyrWm66ixpM6MLlp4GT+lW5zFL0WSBr
 IpjAYeat0XzsRaUIHxqn3VFPuWsbIB04sS3uQSOj9UACslydWXYX2Mon/zNOYG8eOWP5
 fjiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVssiC0cvibaZJLPSt4uJq5qvA2eWpYXoVEIz330LA4gJfMctz5TZtQYwRXJbHeWCGGiW6D7gOrZiZ6KlRmi6SjG5Lz
X-Gm-Message-State: AOJu0YzDfmuFxhympXFEOsjvzYbCR67C048jQXAa+Jqk6ADcG88rPtxc
 aVg7JhBk2Lc14wyWd2KILAaPXmw/ahyB+iMD/KnhQc1PWj49KMmmAalo3snrNWpsD66dzSOjtqC
 0
X-Received: by 2002:a05:6512:2255:b0:52b:c0b1:ab9e with SMTP id
 2adb3069b0e04-52e8264bc11mr6428691e87.5.1719929355583; 
 Tue, 02 Jul 2024 07:09:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42588492b4fsm59489235e9.4.2024.07.02.07.09.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Jul 2024 07:09:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Patrick Venture <venture@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 4/4] hw/sd/sdcard: Generate random RCA value
Date: Tue,  2 Jul 2024 16:08:42 +0200
Message-ID: <20240702140842.54242-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240702140842.54242-1-philmd@linaro.org>
References: <20240702140842.54242-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YiFY5kTzY8R8

Rather than using the obscure 0x4567 magic value,
use a real random one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sd.c         | 11 ++++++++---
 hw/sd/trace-events |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a48010cfc1..9443a9439d 100644
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
@@ -490,9 +491,10 @@ static void sd_set_csd(SDState *sd, uint64_t size)
 
 /* Relative Card Address register */
 
-static void sd_set_rca(SDState *sd)
+static void sd_set_rca(SDState *sd, uint16_t value)
 {
-    sd->rca += 0x4567;
+    trace_sdcard_set_rca(value);
+    sd->rca = value;
 }
 
 static uint16_t sd_req_get_rca(SDState *s, SDRequest req)
@@ -1103,11 +1105,14 @@ static sd_rsp_type_t sd_cmd_ALL_SEND_CID(SDState *sd, SDRequest req)
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
index 724365efc3..f1281aecd3 100644
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

