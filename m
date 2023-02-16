Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp304446ejb;
        Thu, 16 Feb 2023 01:23:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/WZyTGDASnDTG9PaQFsOD2KnmMVQIquWeC8gc1GLyzE/FX3g2lAsgEv41dcLUJW1G2qpIa
X-Received: by 2002:a05:622a:304:b0:3b9:e1a2:6261 with SMTP id q4-20020a05622a030400b003b9e1a26261mr9333108qtw.36.1676539431411;
        Thu, 16 Feb 2023 01:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676539431; cv=none;
        d=google.com; s=arc-20160816;
        b=x3Q6/kbTYqvTMxK521Icp2G0E4IbS6wij3RTqras3VWDPG66KNQ6ctNZaDkafbEKlZ
         r5aIbpVydCOf8VjGW8TXvtWwjj4Pm6Vuc0D+2VvV8efSsiNt+1jX5tWBLahS2tFI3WDc
         IDzk1Qyi4TsjXoaGnu/mEOFLBLkrswLPeumiSEzHcBZBf8Z0lP4fMJ87ujTSDiNhZ4IK
         Y9VYEkDZYYfCrQQ25O1Q1QrtDcobT7Ht13HDbR11Lkf2X6IuFvkUZRahRUWyX0WOJBcX
         gxLPtMyGh2sHiUrEIiQIHUbcpZHlDOJgEybjIDTqYOXhlt7PzvKdwRBPXeuAPuQl3TLg
         ov/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QI7Wf9G0Jc39nSEj59pWqN6n18XGhfwLUbGwL8xNPRs=;
        b=reIyk9i0gE7UJu2uPKbfyJt4myuA46g5vF90pjqBoE6TtKAaY5+UuJlRRXwy5Nh6fW
         AgY8fMEyQERE3Tsv3MxLtEHxS0P+2ANpMac+mOKE64T+RKMkDxL/aC0ia646G7Ms5Fzu
         1g4P3BZn4Bo9hPsby0hQKVcmkcL5v+gqOw9f5qVmP8G7z3kjXrrf2lN5ZN3yvHWEMbIt
         rAZ8sNnPk7G/QTindUuhZoEIBkaB0GBgsSbDWylNvWgQoDjNAyXTWLrd9luD6ipp/buX
         7Tz6mZfS0HKWrLCeqSJtvcvaPAE/RXMHUaA/JmDkmCjzL73vl3hfOtaZJ8EJ0do1odvj
         cu2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIRpQNVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac87f4c000000b003bd0eaf04cfsi364989qtk.401.2023.02.16.01.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 01:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lIRpQNVn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSaUI-0006a6-1e; Thu, 16 Feb 2023 04:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaUH-0006Zq-4z
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 04:23:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSaUF-0006mZ-O7
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 04:23:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso3701728wms.0
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 01:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QI7Wf9G0Jc39nSEj59pWqN6n18XGhfwLUbGwL8xNPRs=;
 b=lIRpQNVn2UeERbZn/Jw3ftlwGwvZYCfIQaqO7skkjjFM3uRzzskkC1EIcik16xL4BE
 qdOnDkUoCmTh3emsZpcQB9pu8fLEUVdMdSzYfwzaxXG0Rhgwm2mqIltvn0APmSmsmHQu
 J+v/CnfB5aDq2LnDd035Kqm7AEDKwUaVF7RzUcqECRMjKUTUxUQRAwMB+pjm/EEvkqvH
 LneoiIT3tzpXTlB/NG0ZCkY9kyEHcyQXALFf5TI8h1qZiJ9l1OnGO7z//k6txwhdJs9W
 +WdSnDTeJk6+Re4oXVF/7k6gsGQeEuZgWW/otHVpnyZBl+GaBr0FpALvn8qlNhjHnDdK
 X0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QI7Wf9G0Jc39nSEj59pWqN6n18XGhfwLUbGwL8xNPRs=;
 b=nzSDW/Tgv8DH9F2TQlXX7XYHgrvYKQbLrwHW37wgBXsSZsMOTLYKsvBotQTN9tZBym
 d1DIo7FPGAojA+2Z8QhKqPoDQvlTh6DhekvWJrj/RCCGxn6o0TfmrtWzWqTaUKkY8PIl
 FdQebq50utM2tkl8ZSOQj1f2lOKmMIVN5bo+48XIKwZjZ2pstdKE/GeySUCW1nYMMheM
 4GO9RgMawKxZun3MdgQPzlUzL0kqP6MMQV9J+PvjJVmaR5IaVldWvSWrJGNOktLQBpmn
 qdyk3qHntdJcoHlCrZ2zyhWHMLqzfcyMNZUwaRKHEznFdqeW26yvxLzLlp7kbmWBGvHm
 NhXA==
X-Gm-Message-State: AO0yUKX7qqv2JBkHZ23QDm0JUK/xPwBCVlHU4SZl83b+PAfOPgjp8iA7
 aqDFNF6dZqQxsxWU4KeC9L7zvQ==
X-Received: by 2002:a05:600c:1f1a:b0:3df:ee43:860b with SMTP id
 bd26-20020a05600c1f1a00b003dfee43860bmr4322069wmb.23.1676539409870; 
 Thu, 16 Feb 2023 01:23:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a05600c211600b003e2058a7109sm3924358wml.14.2023.02.16.01.23.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 01:23:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Francisco Iglesias <francisco.iglesias@amd.com>
Cc: qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Add missing ZynqMP ZCU102 -> USB_DWC3 Kconfig
 dependency
Date: Thu, 16 Feb 2023 10:23:27 +0100
Message-Id: <20230216092327.2203-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
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
X-TUID: jyytbwoR9xDD

Since commit acc0b8b05a when running the ZynqMP ZCU102 board with
a QEMU configured using --without-default-devices, we get:

  $ qemu-system-aarch64 -M xlnx-zcu102
  qemu-system-aarch64: missing object type 'usb_dwc3'
  Abort trap: 6

Fix by adding the missing Kconfig dependency.

Fixes: acc0b8b05a ("hw/arm/xlnx-zynqmp: Connect ZynqMP's USB controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..b5aed4aff5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -389,6 +389,7 @@ config XLNX_ZYNQMP_ARM
     select XLNX_CSU_DMA
     select XLNX_ZYNQMP
     select XLNX_ZDMA
+    select USB_DWC3
 
 config XLNX_VERSAL
     bool
-- 
2.38.1

