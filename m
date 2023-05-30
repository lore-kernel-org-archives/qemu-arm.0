Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2390728ejb;
        Tue, 30 May 2023 12:15:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56RSs9eeD1Cnft1dh3yl39X5/pstP/PDT3QpNDWq0P0ki/fiCzwp5c6T6q75YDDQRxXsHq
X-Received: by 2002:a05:620a:6748:b0:75b:23a1:8320 with SMTP id rq8-20020a05620a674800b0075b23a18320mr2978730qkn.27.1685474140836;
        Tue, 30 May 2023 12:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474140; cv=none;
        d=google.com; s=arc-20160816;
        b=j3uSCZ6A0zMDAMB3HW6cisbruUb/iQARqAEbld5JEb+LI1FkMerSKiJC2SFn+L1YwY
         URdUsIZnXHsBiFiSiKFokYsNkpNwdpvCTRenCuahCnBYAgtv4zNuV/ajaxC3FINKvLnS
         +tsBqukaIwh0VWD2Cner01Wo9ZYBZf+NmQK33riEHr50k4IJZZAnkTvvP/DVgti4+zqC
         scsk90QW5GQhoHZ66eWJzCtNFMoFBch7x1KQoVR2ilX9mzVhxDBoczb/zVzsCeQe/djJ
         C9QNR3VDZo8XON2uCUHg9NwqVfePxwNtQ1HhPDWOeXH2QnJLttIWUFMMrBa7X7DVYY5K
         GsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
        b=BvFPAFVQwVYp1sHyWRM0ptP+vhZYgRRIj1SURuDcnKP1M2hBZxV+wPihB6ma0hr9FF
         6arXGPPdsoPCrAvznXBsuofaJzDoMTp3Gn23hOGHxVobgd5YSSDVXCe8DVOizRMAYbhz
         5oqa1kylFdqe+jRzjH5w8ChJneJtL08bTVHZeFmS+g0B+9H0TasfG3jDVT7hAxuRo2p8
         xqQJ/80PohIhPMf1cmEMgF3T0XgUkf+SRRfhldyhoyFb05q8qSLrf5qnbhkwLlwRP0S5
         KaXpxclRkjq4yS0DKGOySNgUXbm4WQ+zWqS/bYSCuQ6xL9giu6ahqpXzj3Y0dSiJByCY
         mVxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wYJNpFf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ae9c202000000b0075c28678407si6753567qkg.420.2023.05.30.12.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wYJNpFf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44oG-0007L3-Nc; Tue, 30 May 2023 15:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o8-000757-MS
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:15:00 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o4-0004kg-CM
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:15:00 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so3856842b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474095; x=1688066095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
 b=wYJNpFf/g6xQBTZGHrO3bP1/F1g1sE1/U0qAsIDjkuKgyD7sBgFpxh6NO2djJoLL2z
 zS+L3GMUTRaTi/0MdQULRwaL7MkEwU0W26R+Q1wvKg+bCNDIzAJQkTlHlKY926P0gnI1
 az0XCX1NuqkEPcWX7JfRjvx8z43JgYHp44UMbzWAGeMhSWThTzVlsOw7IU2XE3G4L6AL
 agkdQcPEm6rb+ICPWROP1G18F3NuAPgoO6lYQ/EGXmRvxHXLQ06fbpw4RY3RHQfdbkI6
 6c2+clAsEOHGHWjqCU44awCBpJHgRH2wptq0E3wYtcFVLfJgLZy/e8FE14XRw3xReURa
 MGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474095; x=1688066095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmTrzaAymfCp1fyYj9R9fztmY/GgYJekROiEVCv4rCU=;
 b=ORe42000M0OXltAPsuFiiZ3gJD5ERzHoHqPxm3lNYpM6YtFSrfrlPmSJmyyNP2QTEK
 JWiCtxLsT18kL9DPdEzSBIFr8XgwEbpzJE0wAzQWtxrOcK0x8xsrDKKG2KE/jpLeQYce
 qZBsPJi8sILlvXORlN1SXeVH93ZCVwQhOLWaEDFwQT7g3jtqdlEpLWEMn1fi97759Htq
 HeitxtqaCObbWsvYN9Imde3rTOPt9zw2wvyAHySqFGqvDOluxvG7kR6cz4Fg0YXspHM1
 T0ydX1Z5gqtKP//khIU1jY1dDolwsipGvfSDkLju/KRKNPrayvv5owsVUM8q9ROIIZd3
 gY3g==
X-Gm-Message-State: AC+VfDyfNGQQLCbM3LxG4K0oTnkVNw1eAvZHJ4DQMIugPYFcj9wgyyZl
 G2J7uXMZh0+qLWxydfjwWivEgw==
X-Received: by 2002:a05:6a00:21cc:b0:64d:41d5:d160 with SMTP id
 t12-20020a056a0021cc00b0064d41d5d160mr3837074pfj.20.1685474095169; 
 Tue, 30 May 2023 12:14:55 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 19/20] tests/tcg/multiarch: Adjust sigbus.c
Date: Tue, 30 May 2023 12:14:37 -0700
Message-Id: <20230530191438.411344-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: YnSARUAvZ7vv

With -cpu max and FEAT_LSE2, the __aarch64__ section will only raise
an alignment exception when the load crosses a 16-byte boundary.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
index 8134c5fd56..f47c7390e7 100644
--- a/tests/tcg/multiarch/sigbus.c
+++ b/tests/tcg/multiarch/sigbus.c
@@ -6,8 +6,13 @@
 #include <endian.h>
 
 
-unsigned long long x = 0x8877665544332211ull;
-void * volatile p = (void *)&x + 1;
+char x[32] __attribute__((aligned(16))) = {
+  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
+  0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10,
+  0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18,
+  0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20,
+};
+void * volatile p = (void *)&x + 15;
 
 void sigbus(int sig, siginfo_t *info, void *uc)
 {
@@ -60,9 +65,9 @@ int main()
      * We might as well validate the unaligned load worked.
      */
     if (BYTE_ORDER == LITTLE_ENDIAN) {
-        assert(tmp == 0x55443322);
+        assert(tmp == 0x13121110);
     } else {
-        assert(tmp == 0x77665544);
+        assert(tmp == 0x10111213);
     }
     return EXIT_SUCCESS;
 }
-- 
2.34.1

