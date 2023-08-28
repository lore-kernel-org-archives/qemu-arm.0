Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3284935ejc;
        Mon, 28 Aug 2023 15:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeqdbgP13Aq+5FpP9N2ncbxlDlTeKge7ZdRF/KVTmOeLc6SgNtmPPAgsGHfzZZIexg5ap6
X-Received: by 2002:a05:622a:cc:b0:406:9466:6962 with SMTP id p12-20020a05622a00cc00b0040694666962mr31752218qtw.61.1693260959254;
        Mon, 28 Aug 2023 15:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260959; cv=none;
        d=google.com; s=arc-20160816;
        b=ddgY6Pw2/pcR+k1A6p2PGMg9FpxyQI9yxlWKiGrMUQSkwrE3pxy0ysits/TZZSzhTF
         fuv1o/+oIlMeftJr6hndcPFeLBTzMzc16cmpUFFUnApuGgNIl5CsKS/1Gd5vwwkNzWww
         c1v5HOO4QbcYR89Qn7BqGR0pByGwruTXyKUnGmHRdmMpHsbv3Amgj7L2CnXSshGIlrNn
         cEwocef9x4b3vtkd360FMxybc72stQ+U3T5ftJeq9i1YeZ0GRE8Q8dICWIxYrTDXCw9Y
         vtZ/NBhVny72QVonxEMp7X5s71xvliwKfv8PVwfeC2rE+FXCwzY7BZTKCW6g0rYgosxR
         Uaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DcV1pV5u9SuvcmRud4Mp8xFzvcnx8scdTw95EYi68HA=;
        fh=CBJPxJEjNCibwfpZfKrPGtkERKtYgP+G6TPhM7p5XaM=;
        b=giQy/X1AYVg5djAB8IJrS1do9ZbXP+7DS5msYpFeP3HOiC87r/4761qqxL8+FSqB3e
         wKLp+vnrRb3kL7KIWuRkMQ6xjzLggjWsrcocRDcLokG7vrUBL5LgGNj4Pa6/K3aOgPnM
         A98Yie/beF6rWpGmWuw/IaskMbHTfdnXUla2eEqq1n9pck0cCH7Y6wqYovEZ5AtpsbFC
         LtmCeZUasMN5s5J4UmGXUMajOXsJD7He07/Mn4LUnNOH1F8gV40gJHTmRQqDkI20BdFO
         hwxqZgY+OU92PMInkb5Fp8/DYPUHVi/+be45o4v/pBcT03ISVb4u39i65Xe/t/b5wQAc
         Jz2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxys3YdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20-20020ac85b94000000b003f9c53b7d70si5247985qta.703.2023.08.28.15.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bxys3YdY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakVH-0007Uq-Mb; Mon, 28 Aug 2023 18:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakVF-0007RZ-U9
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakVB-0004KL-Rm
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:14:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso34709915e9.2
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260868; x=1693865668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcV1pV5u9SuvcmRud4Mp8xFzvcnx8scdTw95EYi68HA=;
 b=bxys3YdYXJMKN8Kf6vU6UW4r1EKUcN2fNWrONVtP01NlPtiYRw27SKaD6bmMD6VRzW
 Ky+oyZgPLMcQPvgufNSDSpXcCknrPeDiP9zKOetvIJuqurbAko6sc+5bx7BZ8HSwJCgV
 FtkBLRA0dPESqjxg/BOjyt8+VacRJ6A1AHkwr1mHSIsWTwhKEqXJPkYH+guOhIhSF0Uz
 ZeUEOaAGzlfWwnEoBoeyJs0oYWrnER9CyXCwxkUof+5v4ymtz/UpT4omvWZlK+FPNfk8
 6aMlIGhiLwFU37h3a1A44dktaQK7OC0l1GsiI9aw8at5iunAWKy9padnz+SMFX3yGPmF
 Sl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260868; x=1693865668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DcV1pV5u9SuvcmRud4Mp8xFzvcnx8scdTw95EYi68HA=;
 b=gRWryWNN6Fk/wvV1OCWVyJ1WTSzEPsaUp/WD1vaXLC+yihFRSW9LNLOoCI5Ag5MAhh
 3cTLcod0ZsUbzxKb2Tfyizd2KQilgqCwlUBV/fIcC/YXOYwpiQVSn3aYzPrAHO0/k/Be
 2aVbVr5sx7HvbhH9de39tmJ4iafqcoYxpvsRpJt2Al9K7bHBOjv2m5Yd0GXdsojUJOs4
 uSSkP1dQ3aHxUPQivaiHwOXEg8XYER54hEevpOeUpshP06YYUCh+xWbNE9BYz1FEst1O
 Y2936m7CnrneDis88AH4ZktY1+NohiSZ4ae9X5hF9e545EveJqVArdx0UXZOJp/4KD3S
 GWQQ==
X-Gm-Message-State: AOJu0Ywwa9CXoUcQ3j4lruC+YV4uIXGx4dlGJckCfIQdJzQx3KFuqE4b
 6xL+bjE8Z7zzje8XPIml6ARdTQ==
X-Received: by 2002:a05:600c:b42:b0:3fe:2b76:3d7 with SMTP id
 k2-20020a05600c0b4200b003fe2b7603d7mr19786764wmr.10.1693260868477; 
 Mon, 28 Aug 2023 15:14:28 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a7bca58000000b00401b242e2e6sm13062052wml.47.2023.08.28.15.14.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] exec/translation-block: Clean up includes
Date: Tue, 29 Aug 2023 00:13:14 +0200
Message-ID: <20230828221314.18435-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: m0cuFR+WvQnO

'qemu/atomic.h' and 'exec/target_page.h' are not used.
'qemu/interval-tree.h' is only required for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/translation-block.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 5119924927..b785751774 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -7,11 +7,11 @@
 #ifndef EXEC_TRANSLATION_BLOCK_H
 #define EXEC_TRANSLATION_BLOCK_H
 
-#include "qemu/atomic.h"
 #include "qemu/thread.h"
-#include "qemu/interval-tree.h"
 #include "exec/cpu-common.h"
-#include "exec/target_page.h"
+#ifdef CONFIG_USER_ONLY
+#include "qemu/interval-tree.h"
+#endif
 
 /*
  * Page tracking code uses ram addresses in system mode, and virtual
-- 
2.41.0

