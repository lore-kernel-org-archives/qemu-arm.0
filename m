Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3552195lfg;
        Tue, 4 May 2021 05:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt2R6PTLEoOndo216/HfrKXTLd8LtxxNm8dvSOg3pMTqsq5FmmBpyMMwPe/zIZOSpSjWMt
X-Received: by 2002:a17:907:20f7:: with SMTP id rh23mr8865354ejb.276.1620130260265;
        Tue, 04 May 2021 05:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620130260; cv=none;
        d=google.com; s=arc-20160816;
        b=E+M6EwEay+XUppbGp1pn8Ey+A01UwNFkgpeK+H46TEr1VHoMbW/9Sv4Ps9KDcTpGvC
         hX/qLF29VAJg1QxJd1B05ogj0bwECRJnRlLY/QcOADjrMz4agYmIBEsrT6eCA0uRBZG3
         kN9AfY7hJs58MqW6NypfYuMihWItX5Yc5ZEPo4ahmzK6b9sLINJcVv/tts+y1ZZQFiTc
         L63dD62e12tZ3uDpO958Bje/LK4Vur+IW2Mh+X5ejMCrJEgL1S4u0KsgcON2oKzLpmlv
         ybJZIuKkW1Pn2E6/Ezm6Vh8ds+7/oSQUWlMHnU5U89TfMj517wHSOWFAJqYGIWf1qlPV
         H35A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L/Ak9T5/Ybf7tAcf0Rd3JQPpQ3KguyaRrNYfpLxJyhc=;
        b=QYVTUcgZF1zZi1PVtUL3hTIQpwDIuVMC0tT7N5dpE9cdkdvJ0dW5uTI22TShrZ5f7b
         /rbvXAjMB7iJSLzVDL17qHjBdo/fjKXl/PEOFJyVSwOiwd8amMF/KT7wXLfckHPZ+tWH
         ReXQcfFFbI9lhrrPuw4NyoqbgFvWTc4Kpf9Ng6RsXVuVY/VyAUWMqfesHlLJSBYrU3S/
         5SvIgzwBu/fBEOdQD9Pm1BvfwZ2UBC6Aeq+M6b9LZLvatAAx4VBV4gywc2nIQ5IuhpUl
         Zjsc1KUnwl8NexTh0KPWSLrDk4lDjsleOpM29ikw3Qv+XQgisnUqdMxLix2XNYf6TCSW
         KtyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9a0Kimz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si4391620edd.602.2021.05.04.05.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 05:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X9a0Kimz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldttD-0005ko-7k
	for alex.bennee@linaro.org; Tue, 04 May 2021 08:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtre-0005hG-Q2
 for qemu-arm@nongnu.org; Tue, 04 May 2021 08:09:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldtrb-0007aE-0H
 for qemu-arm@nongnu.org; Tue, 04 May 2021 08:09:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id n2so9173318wrm.0
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/Ak9T5/Ybf7tAcf0Rd3JQPpQ3KguyaRrNYfpLxJyhc=;
 b=X9a0KimzEiDF3OWSqeIMc03RSURCRfRj96ARQ0oqSTjh0+kTfOpkLRGEyasdANTc2A
 YaHwuot6plpdZeVaVd0RvfzKx8BzjzrYk2CL6xVM3ALJyvSRKGqqpgLC3fm/WG6F7ewH
 DnyzZ6xUK6eBznRvFFKnf4J7IZFz5mcyaRgnVkNWPbyGztUlPgbyNy+0dNvNqWQXz87J
 ALClj4ua/Yl4VnhlCdz1cpyGL0r0wagqpm9ZGs32BLfVo+ds8cfRqguiGMWhNVHCTwsD
 KfXlRqJRsW0Yu16q+dUqp+AtYi2FA4m8y0zsJ09DMdmKgJHLsvEs9IRm8a4sA0L/pfF1
 uevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/Ak9T5/Ybf7tAcf0Rd3JQPpQ3KguyaRrNYfpLxJyhc=;
 b=HH1M3aM+U/6USASXWPNGZMvQf9vykgeaHzYS5qVaB73WCjWUwCp82J0dkSXBhB5wZU
 UCS7wWGcyDoWyGrxNg8OeqVDY5CvgRPdc4taZl1RMyXkfDTV6pv7v30WUMY11ha8IbXx
 lf+pydGAfSjnaf5/BKaQYaXzW3uuKB7ywCcAlwZRLDxFFpPWDMJmFWsSLeZwZzEWHli1
 PldGOMfewLhYCPq+tEISzr1ZUh+UK/ue69/As2vS2uTi2dTeX025I8gew+obHjmvcDyX
 gULwRXr82ZRdOpRg08KKijngAJKOgebQZaBXUuWLbsHzOrxbb52B/GUdH6qp1FFZtZVx
 NvlQ==
X-Gm-Message-State: AOAM530b5j6R6BgMxMEikV2WKwo4x6KmfQLcjD2QY3cU21vKo3olMRXA
 WZUT4EaKpXbQGQktfkbi+szxfZ2y3rUMOg==
X-Received: by 2002:a5d:554a:: with SMTP id g10mr29205593wrw.174.1620130155687; 
 Tue, 04 May 2021 05:09:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g12sm2331937wmh.24.2021.05.04.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:09:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/misc/mps2-scc: Add "QEMU interface" comment
Date: Tue,  4 May 2021 13:09:10 +0100
Message-Id: <20210504120912.23094-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504120912.23094-1-peter.maydell@linaro.org>
References: <20210504120912.23094-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6KoYFQbjBVh1

The MPS2 SCC device doesn't have any documentation of its properties;
add a "QEMU interface" format comment describing them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/misc/mps2-scc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 49d070616aa..ea261ea30d6 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -9,6 +9,18 @@
  *  (at your option) any later version.
  */
 
+/*
+ * This is a model of the Serial Communication Controller (SCC)
+ * block found in most MPS FPGA images.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the register bank
+ *  + QOM property "scc-cfg4": value of the read-only CFG4 register
+ *  + QOM property "scc-aid": value of the read-only SCC_AID register
+ *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property array "oscclk": reset values of the OSCCLK registers
+ *    (which are accessed via the SYS_CFG channel provided by this device)
+ */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
 
-- 
2.20.1

