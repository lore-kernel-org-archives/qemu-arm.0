Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp736203ejb;
        Thu, 15 Feb 2024 10:00:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYs89r+mtajAHc6zqT8V23H3XyAfK55inSGG4MW0YA5Wc1ZFCtrWXBth8uqQLpmr3cdvtBpmDf/pM1BMQ7zx+M/wPMjUu5
X-Google-Smtp-Source: AGHT+IFhUqQnlpkBFHy2gMWHy9wyEmaVy54JvzOohFDSHA+5VVKJ/yz1oDpsAFdzqP+OGxWrwUh7
X-Received: by 2002:a1f:ea44:0:b0:4c0:3bf0:29fd with SMTP id i65-20020a1fea44000000b004c03bf029fdmr2280976vkh.0.1708020053159;
        Thu, 15 Feb 2024 10:00:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020053; cv=none;
        d=google.com; s=arc-20160816;
        b=fR0xPpe1+9jC7I2yI64o5/ZR1u4dZI1+edaWmYqd+nLmzIRxCSc4lGsEapr6MJP2Du
         cpawWcKmUcneC3VvX7A9MEMOEdOr8DoBf3YKUkjiI2eNG92OuumetGz4CXhP1M/ZWB5H
         m0Qa+hv/73WVgO8YEphDog5rxQd7ZE+UmhBRhi11Cri8q08g7T6WP4q6bq1hHM9Ty5Ha
         sDjWmYbhrOuUSvxq07aMw/7+iAGhzV9HBFPx9RHuGDi3wYNCxQA92+dkSMa0ZoJy+v3t
         bANCHhaZYPwTsTcB6dJTR96HtSeSoMhxlD+8s2pgT2e7gkUDuKDRJYFqJrgH4R6Ra1nQ
         ay8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DEY5Q9cN6dyZ6ENA20XPMsBoCTRW9qgX5vERomv9BCU=;
        fh=SFvmxjL51ANfXOHyf8WEKMxE0DGuy8HqoetUZtzHSSc=;
        b=HHD3R+jNkxnWwGfyLUeEDKvqxkNmzJVZ0F6avUYXnhnC4rh5ljlsVQXx5kjuBbbIXB
         BWAkIILYodn2fYuCRJp8jygkmuWVy4Qvx2WGgvhVpFTFEmxAngCbkBMijwmH1V0NHIVc
         DNAVnBYDVZ+uycAWJg7DFKvYZfojPEn96tr8xq0gytknUHk9VNgbVDv0WpPCqlduOwpK
         CCqfNQ30VFFOAqryMhniNTbcx/bpaK3dtsifuVEoGIQ4CqoZBARh5w5PWYJjmDZ94Sie
         slyY6hd7MmxKle22Jrt35qa2RUezaXygYAq2THgCiB+OUz9m8iU9lSRq5aNe7eXlSDel
         n1Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gISc223v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27-20020ac5c85b000000b004b9697a8bf7si380363vkm.140.2024.02.15.10.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:00:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gISc223v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1q-0007Z4-Dm; Thu, 15 Feb 2024 13:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1o-0007P8-T7
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:09 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag1m-00021Y-S7
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-339289fead2so669586f8f.3
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020005; x=1708624805; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEY5Q9cN6dyZ6ENA20XPMsBoCTRW9qgX5vERomv9BCU=;
 b=gISc223vv85RqmfTBjyHfX7Yom02HvnP7aeXJ3DB+LkJqz/bV/lDqZnLcMZHFNsjAB
 3ee73owj8x3OvCgjLKTcYo/0gXio8znOqtEZyiqjXT4fhSBSJf0Lr6xWay1idF4v7XpM
 FfH+S2fPMmaJTSe8HytSPvPV9Nm7KahG2Ky2A4tuYw01Kh0dVJ75r0NKGMjn6KUjWkCU
 QjuOLBtbBSCrNmLK3N7TJ/WXAqhf1+nG7OZ/HTaPeHoKyRePKuM4xrdBzboR1WaRz9/v
 8uViySEbLk41gd+h9nmii+sIfXkMhT6EXUwtcSdUfPtGV9DAdyNtvFyz1AjJDg4oW1FP
 mMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020005; x=1708624805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEY5Q9cN6dyZ6ENA20XPMsBoCTRW9qgX5vERomv9BCU=;
 b=STH6fFzDSA8iWgHpv0ZmFsX4P2BLXuGzs+gVVLo4pYje7nOL/SEIVmeOXLf1bi6kgT
 fz46HxCOEpcp/2KlljAlBXshZPmP96NJGrWbFCnyFJSHniQ0WXpAaQ49yBR/5vwp/9c4
 6MR75uN+K/4iCTlmm//fCo/cdzFEMYGG95dPDJ+itvA4e7eLXblbcqm2yzL7aHE8ujP6
 oCLh8N7g/ZlaJ1vG0NTxDfhAZ6R16QtAG5209JaueFt2m7a1GD84Wc7EqXHlD5DjsfDH
 fdXAPw0txTWTUf5dvAXk2A4l04Fh9DUAf2Ey72ysJC813Cu/V0hmdjPZ5OlsGwo3R2Qh
 aBMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmvrHt/1/0tpmvYxOIN8D+ZiSQvuO11J9t9Opreg4H+/TVk3+wWoO2iLNwF8SIOc4hEzJ5iCi00xL/pNlnIJxbUzVf
X-Gm-Message-State: AOJu0Yz8VV66jqd19R3huMglmGAsNB8NrGC52JDKiN7AUsJqxFQKC7vG
 pGirnfX0BB2AOGAZjiTSSDJzr/japhf7xUwbFKtSSJgAM8EPvO3fzqT5AAXnCLU=
X-Received: by 2002:adf:e7cb:0:b0:33b:6773:1481 with SMTP id
 e11-20020adfe7cb000000b0033b67731481mr1883493wrn.56.1708020005318; 
 Thu, 15 Feb 2024 10:00:05 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d43c9000000b0033afc81fc00sm2374790wrr.41.2024.02.15.10.00.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 20/56] hw/rx/rx62n: Reduce inclusion of 'qemu/units.h'
Date: Thu, 15 Feb 2024 18:57:14 +0100
Message-ID: <20240215175752.82828-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: O9tV7sbKL/jC

"qemu/units.h" is not used in the "hw/rx/rx62n.h"
header, include it in the source where it is.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-3-philmd@linaro.org>
---
 include/hw/rx/rx62n.h | 1 -
 hw/rx/rx-gdbsim.c     | 1 +
 hw/rx/rx62n.c         | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index 73ceeb58e5..bcda583ab3 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -29,7 +29,6 @@
 #include "hw/timer/renesas_tmr.h"
 #include "hw/timer/renesas_cmt.h"
 #include "hw/char/renesas_sci.h"
-#include "qemu/units.h"
 #include "qom/object.h"
 
 #define TYPE_RX62N_MCU "rx62n-mcu"
diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..bb4746c556 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -20,6 +20,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 4dc44afd9d..d3f61a6837 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "hw/rx/rx62n.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
-- 
2.41.0

