Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1287062ejb;
        Mon, 22 May 2023 08:32:43 -0700 (PDT)
X-Received: by 2002:a05:600c:21d8:b0:3f6:8c0:85b3 with SMTP id x24-20020a05600c21d800b003f608c085b3mr450870wmj.12.1684769563579;
        Mon, 22 May 2023 08:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769563; cv=none;
        d=google.com; s=arc-20160816;
        b=GJL1jAW4u/PxDCLcFojsLZ3d3X4jqbZLaU8XLmodM199EkiwqJc/pWwDW+muWB0+CA
         4Pm+4vzcEGCG/PicfmFDD5uwlJ/IOHjBSO73eGqaSkjKb0TU8zUdLRK4K4bzQEdo8vSG
         TkOmMF3Upgcko8y5SDpklHfeBQVNjVSNullVVgyKQaWo9DgxMNthmg+KSfRP/23uiXEV
         4gd2omvXpAH1oi3P355kOBtHuDrRNuirSFgaBPGr3CidUb+kUt3T2e+TUvKVbTNSZehG
         OFh3ZqovDF24SQmNN8YIpclalfEgbWmzBLjE316OgnHHX1LW/IyRJkSZTHBKyIgKI9v6
         wRoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Cw30KRr0qwwjcjVLXiu2a6Jw/GDPIIDdtlKN9G+WEg=;
        b=cpJyGfkpxJzOyOMEZIuOebF36RYXSn1ihyxuk4HDKI/2752ypQa2weVhd50q/sLBHB
         2SdyrvFTmZIxe+dwPWA9Wra4hVwJXoyWVqlfHFGGX4dUKyerNH/H/UGfziPhZOAxJnyz
         vOjIVzysHDuekEXq89q5GrfiB9zOllCG3ozLkBPJRQNbdEuQfgTMgq2QoMW3wGF3Y02X
         nD+hMKfmJa4vde5e+6F87g50A5ra6qVowD9+boJtVrw20aMXxjxhKgV2pKlp8cTpM1PA
         qfm/Gp+MTTVaqnsmQvF68V6H8hLMJIY592hTViXNsGRioGIdi4oBPd2DfI5I7wccPtW9
         q3pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jZVIhtxg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s24-20020a1cf218000000b003f435652aa4sor1565147wmc.9.2023.05.22.08.32.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jZVIhtxg;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769563; x=1687361563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Cw30KRr0qwwjcjVLXiu2a6Jw/GDPIIDdtlKN9G+WEg=;
        b=jZVIhtxgsZKCPAyVJ1rubFhXRwSyB8yBf951IXSK22A8pvhlLdv9fEUSwo8Md8NWYg
         Fdgor+NAr64RrgZ+I653NYWxogB3UAB0pJQVVpsKh1gBDJqW3az+RCeMONd8U/cI8z+h
         SyS0IGSDNWx5h0Wdg5PaTsEsmUgg0gLB2GomrRRN9Pq4kIExCWsgDrRFhH/YFIw9234z
         BJYmoNeW8LkTcQ/xWT4BE1pLU6XpJMKTmZgdVfNmZrrGibgtwqMLOC4KlQkvHCU+yDd/
         giRI1DsGTdZp9YkuRb3sVO7arCM0qlqHOfZwBKEQW+CueT00kbQxWyEsWqQThmwYnepE
         Jraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769563; x=1687361563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Cw30KRr0qwwjcjVLXiu2a6Jw/GDPIIDdtlKN9G+WEg=;
        b=ZhDwylDN3IfqMxByQkTMzHy3UsJIGvWhBqvnccN+PpQMV6q6q16uSoKqcemdYg4pfw
         +xANZWDBt2eYmqYHVZolEwM3fANR4BQlAtjJ2r5+G62Vc9Ovw/w0BewlnLwWH656YB7w
         Cn4X5BFCwlmTECwKi3pq/kMM0+Lt87/SjsZ5cMFNauYN63FcSVpZtt+VGQj2Gc2RXWDJ
         jKVdno92VLZ8sfdN9mWqn+M+CN1sWksbzeWw2cLCIUkAZ1VUnSWS/Gv1IW8OEpO2rKRt
         0f+ItBhnDrfDXPYFMLBK4VIfixfucZ6llMYUxWmrfjHSES3LgQiLP7U5+CfcHfo6z3OP
         3zAA==
X-Gm-Message-State: AC+VfDywPDGaBotcBLvo+X4DpfHymYi+e/7IrmAJV5iSj/fFIr0WM415
	vTKbswPOeR9AY05+RpMHNee/hceX
X-Google-Smtp-Source: ACHHUZ7V+Ar12+UJMLcbWfJE71sPxCd6cPLuMDkPRtta0A4DvstrTKk/Jri6QgCzk2oKZJjqCMvO7g==
X-Received: by 2002:a05:600c:22d7:b0:3f6:8f5:f9e4 with SMTP id 23-20020a05600c22d700b003f608f5f9e4mr200948wmg.35.1684769563339;
        Mon, 22 May 2023 08:32:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id j17-20020adfea51000000b003063938bf7bsm8019037wrn.86.2023.05.22.08.32.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/12] hw/char/pl011: Check if receiver is enabled
Date: Mon, 22 May 2023 17:31:42 +0200
Message-Id: <20230522153144.30610-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P2Ojf4TAgg+C

Do not receive characters when UART or receiver are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 30bedeac15..1ec102d8de 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -77,6 +77,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_BRK     (1 << 0)
 
 /* Control Register, UARTCR */
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_UARTEN   (1 << 0)
 
@@ -348,9 +349,11 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    int r = 0;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if (s->cr & (CR_UARTEN | CR_RXE)) {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.38.1
