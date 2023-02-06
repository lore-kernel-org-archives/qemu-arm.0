Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4124103ejb;
        Mon, 6 Feb 2023 04:20:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+NG6bRzC3diE6WTm1AkRNcxV2Pa7/1HZn1TkHc145PmAxrqDQyuUbebninpFlQ5LGTk4vz
X-Received: by 2002:ac8:5703:0:b0:3b8:2175:fcff with SMTP id 3-20020ac85703000000b003b82175fcffmr39219617qtw.31.1675686009555;
        Mon, 06 Feb 2023 04:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675686009; cv=none;
        d=google.com; s=arc-20160816;
        b=OaDnOcv774lYgp+k/LpICgZpl3gyaoO445u+DifxsXKbo4GuRPNWBbXxrgyHFJ0BzH
         y5xmvch4L/ZUrEnAh8uDgF976j3WdvbVJKsno0Rq+ZuFyh9u6/NzZLME/RMZuX2mEJ21
         OWO1BU/Bfc4Ihk0zSMs6iZVoEJ2X6ObYXNdr/JCCZFbQJF1K876I57/rUI5YEw+B5vb3
         uBAfCYYBKvnB+bAAu2a5+9luzMyzAClkCxudmUFnL+cZPtvFvZ5EcKmppUCesqzvNddm
         YQZVRZRV98hzs+uRFiNs8TEV2V+/xCcVUt0M0jnqFhuDuZXqBG0uUeLn0sFeYTueptsQ
         T/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rzCkZaPJCZSEraFSTj2+J2muivnIDDfC7A8FV2foZu4=;
        b=cLK6+HPLKctVODseD/FaRl6/OPddYA/L4+nLdGsC2R6A+exyOtbI6WgNr/oy9pD9Ac
         w7d0d1/hz0AofUhbhYAaihX+ZEekkp7PsdtYWgBIybhZmWbsKF0rWv+Ev0N6gl0zjiWX
         Fck+5Z+113pVC8OMHtVx/e76A+FlzPDwk7ZlxzPPspsbL4hu2Sh/xGWp5ChyQLwt3jpQ
         drZgeNi4ZCPIhqwQ/cAeQolPP2ephpsgYuOpSgpFWQhl2IbfxFIddvAL5QRx1VQcm9R5
         jAq/W70qOZedjSVi4Of4evxBUd7e4fOtjMCMCcUiORp9xeDVO3Ax6/LKZJ0f4pU36y57
         Kw3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zMt8DT/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05622a174400b003ae4ac84058si8201074qtk.78.2023.02.06.04.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zMt8DT/y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0RX-0007xO-1M; Mon, 06 Feb 2023 07:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RN-0007mW-KC
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:45 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RM-0005pu-04
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id r2so10161883wrv.7
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzCkZaPJCZSEraFSTj2+J2muivnIDDfC7A8FV2foZu4=;
 b=zMt8DT/yCGraGKiJNUu6Ja5sm1HGACvgwj4q3t32FCZA+gqQTv32PUp9cSYtWWrFEM
 YtRBh91QTzdcWPENJZRTo01TTNlHdjjOiwd56oxtzC1X04vZOKt4Xx56dycApS+PvmMB
 bbn/oHwp6RoTaNdLynV2R0Gm3EfPqzMsRZwhnnL4tX9LcOHCDk1RZaaqlVNCC7+T7Mt4
 MsR4Y/lCfigbqwLFGxcSPDvinl5Djzi1NRPTRKxS2Z0819HeF1y4qv67I0BWbORJlXF4
 Se36U6uu/EM8yXXeG53w2q1NfVrucl2qnfA+Z02Tw0XT3t5cl+v/weyr0yapVXHtDPTO
 4hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzCkZaPJCZSEraFSTj2+J2muivnIDDfC7A8FV2foZu4=;
 b=2uZq/deyD1Pup2yWvwUw3/gI43hd3x050pZ8J/jzgHwvclSzfJRXHElQhPnArNWHpZ
 pOjpIz31jIqvdPTLohigBQob4Lp+khVOwyF2d8DIHerg+VFrBLlUhp4Fe6vBzkkbVCEM
 +LSJ5keoEjT4S5gRBEn7eouYDB58MTLCKG4o2HQ7QO9D4+NQL8sv4WR93kxe28wxKPRG
 dJbrR4NQsxDBGoaCZlxPq7Qq0zeEF2ZeycKGY/WAUKToqC5/bszj7t9jIJTsUUR/YJa5
 MWFR6gUnI/mYz6XpTL2neNk2gc7yMTTCQvz+mXgJccsPo/j7EJfL1vu7BMtZy13tMO22
 ps2A==
X-Gm-Message-State: AO0yUKUuoKTT8RCp716esGnJhdG4SwBzkoPt2xhfK8/qSIMc+YhcaI9C
 TxLh5f81MwUEMl/QYh8ENGJluw==
X-Received: by 2002:a05:6000:10c2:b0:2c3:dd96:d5f2 with SMTP id
 b2-20020a05600010c200b002c3dd96d5f2mr7598691wrx.35.1675685862491; 
 Mon, 06 Feb 2023 04:17:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfdb91000000b002bdd96d88b4sm8815797wri.75.2023.02.06.04.17.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] target/arm: Restrict CPUARMState::gicv3state to sysemu
Date: Mon,  6 Feb 2023 13:17:10 +0100
Message-Id: <20230206121714.85084-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: shOIvXosed4s

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 01d478e9ce..61681101a5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -772,10 +772,10 @@ typedef struct CPUArchState {
     int eabi;
 #else
     const struct arm_boot_info *boot_info;
-#endif
-    void *nvic;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+#endif
+    void *nvic;
 
 #ifdef TARGET_TAGGED_ADDRESSES
     /* Linux syscall tagged address support */
-- 
2.38.1

