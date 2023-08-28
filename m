Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1748181dlb;
        Mon, 28 Aug 2023 15:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Qyg+bUi6twATHykXVK55qEAzZ7thoqbJFGkme5BhyoOeslqsytsqEQpBG0vSi070gFt9
X-Received: by 2002:ac8:5dcc:0:b0:410:919c:3234 with SMTP id e12-20020ac85dcc000000b00410919c3234mr28495756qtx.59.1693260877990;
        Mon, 28 Aug 2023 15:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260877; cv=none;
        d=google.com; s=arc-20160816;
        b=KjSdTOqT0iWIksAyK3vQiaIDFpuyv36nYGemhAhhAzXcn8RPnKAa0Njl2iBcI3plod
         T/Q6z5vBpTEWfc/R0GjTB9m98YTPlCirHiklI2NfZ8vwljiatOEQj0yUdsLFoyimcEcn
         xIETo7yY+xBcgB52l7qFaYLk2ZlfAxPLKJ4AKunUfzPRp1+RRpAVZrwpHFsfIkQDNWc5
         HgkWsSPPNFIuObav9dZdrGmw4/Aklh1lR1JCaPBZtxAtFTxUg2xIGl/Mc0nQR1KC530I
         xlyxC2l2C1KqqFcAsuLh/VAQjYw/mu6L0G36Ac2RFp0XcXx7awQEqoH1IgsKfs8199Or
         h8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OR2t1S0ttCGvBFU5E6vcS7ExCprp94yTFLK0sZMvoOs=;
        fh=CBJPxJEjNCibwfpZfKrPGtkERKtYgP+G6TPhM7p5XaM=;
        b=cOU5jYs9Xpsn21RcE0wCNDao/QiZYhvZxNLoOBRZ4vzJQ3dHRxudT7DT8dynaJn74n
         m4mlK36lIzFbibosTWZJxyK/H6zF48FRJg3QUzjHDmkeNyAlHv8z1I4hIOt5fdISydj0
         BcvmkfowLzQwP95bqslGMfqGyhikLXpiH2JAUuH5LUGxt8UuvbJW6KQExRAt0r8+ExCW
         3uqLLSla5Wdr7wgTlBrwXtcMA0naWBvqjJtGaR7e37Na0GQm8vJ7DBNUPZ0EwRJuVSiO
         C/yKR1GPcdU8zFOnrYOzxim9oZYpsr92Tq8XLBte7COkfSvnOIw7SpCHsBga44wL9QSn
         wHTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/ZQcSkV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020ac85ac6000000b0040fd23153e3si5178648qtd.68.2023.08.28.15.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S/ZQcSkV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakV5-0006ng-1M; Mon, 28 Aug 2023 18:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakV3-0006ak-4K
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUz-0004I6-M3
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:20 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fef56f7248so34752185e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260856; x=1693865656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OR2t1S0ttCGvBFU5E6vcS7ExCprp94yTFLK0sZMvoOs=;
 b=S/ZQcSkVLgX19BJ+tgcVctbK7w2mjfIqpChSOf2Q9B2GI13xVls8DefVwpOXZtkBN6
 UNTxPFK0GZKi8XcC6UB7cV/REOHocM8L25wMvAQVAlejRO1X4GEXvzmwmntDA1Qx2M/e
 0I9TD0wk1JuENiQGX5pDMnykq/oL4/ppbWzAJi0VAr2jVxODyZjVgp1N4w70KtG58x63
 XXHtgSlRwcQ4kl7EqVEG26uENC1BJdt0CarqLF0vAcv+2RbTRCxfSOdT4AJQTXD/6kT4
 qTmQiSMjrca/6mQFI3x/jfZv8rZe9UO7aAqMLyCEriyinKt5jTThWowyD7fydVOV/0NQ
 P//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260856; x=1693865656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OR2t1S0ttCGvBFU5E6vcS7ExCprp94yTFLK0sZMvoOs=;
 b=BHo/NurULoHWtX2626FOWjvQe4atOeB8k8CoPZikNz5KD8RGr6avGXkF6tFoLbKidu
 dxXPQz6uvpZ/xn4MAc8uUI6p/Rrtyxo0DA3h8inR4y8Jmyc7s97FzpzaOTT+VN6ZJ1If
 2m6m6Y8bGp+5xu/bKnzjFTVGDXhXTyJb4wtCN25Va4uvwP5V3Vt0NG4Qfix3k7bj91XC
 dLRD5NgFADXYmjdIXfAENlXSnYcN+nAQbk48i9azrrV1ME/PMys9wPHTmnN0bCl7YBTk
 RZQCa/FTrPfYO2RjyuN+1R/9NV8LOSH9e55605iYqlJsKc9e6ySEdQEWVPFomspIdFul
 fnqQ==
X-Gm-Message-State: AOJu0YwUDhnsA6GsUxvS5ytcj4PuHbp+Bh6P/XWfCo3plb/7OSTjUtS1
 +4FyUVbcyfuoHxypSDtju1GO5g==
X-Received: by 2002:a5d:5101:0:b0:317:e515:d623 with SMTP id
 s1-20020a5d5101000000b00317e515d623mr19508673wrt.60.1693260856203; 
 Mon, 28 Aug 2023 15:14:16 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 v18-20020adfedd2000000b0031934b035d2sm11710874wro.52.2023.08.28.15.14.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] target/xtensa: Include missing 'qemu/atomic.h' header
Date: Tue, 29 Aug 2023 00:13:12 +0200
Message-ID: <20230828221314.18435-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: kXLqHZT+dZMe

Since commit fa92bd4af7 ("target/xtensa: fix access to
the INTERRUPT SR") these files use QEMU atomic API.
Explicit the header inclusion instead of relying on
implicit and indirect inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/xtensa/pic_cpu.c        | 1 +
 target/xtensa/exc_helper.c | 1 +
 target/xtensa/op_helper.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/xtensa/pic_cpu.c b/hw/xtensa/pic_cpu.c
index 6c9447565d..8cef88c61b 100644
--- a/hw/xtensa/pic_cpu.c
+++ b/hw/xtensa/pic_cpu.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qemu/atomic.h"
 
 void check_interrupts(CPUXtensaState *env)
 {
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 43f6a862de..91354884f7 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -31,6 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
+#include "qemu/atomic.h"
 #include "exec/exec-all.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 03e2c1889a..7bb8cd6726 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -30,6 +30,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "qemu/atomic.h"
 #include "qemu/timer.h"
 
 #ifndef CONFIG_USER_ONLY
-- 
2.41.0

