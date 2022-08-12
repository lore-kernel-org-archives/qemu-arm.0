Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1206905ejf;
        Fri, 12 Aug 2022 08:18:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CUF7QdhofwRDsYH/n/r4d2r0/1hdJgvg0u/A3t5Y4uns8MCb0smUpnclfNOJhJu5peArq
X-Received: by 2002:a05:620a:1a12:b0:6af:228c:ef65 with SMTP id bk18-20020a05620a1a1200b006af228cef65mr3082609qkb.680.1660317526973;
        Fri, 12 Aug 2022 08:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660317526; cv=none;
        d=google.com; s=arc-20160816;
        b=iJaWJnabZknVrutwG8U5bhh5ByvtjIlmhqS+YolzhI1zpiKuDmJCxHQ1xWzHhmn043
         cwG+nju/+ca2WtROE4YxKO4ngVL5pEJvABPhDVi4Aroz8OXeZF/dT5F6S9kQ3KB70dUR
         tmUaWdGfhBxe6n9An/Cq9ilBr2J0bR6fy+WH0NlUeiqAGf7jOc94oF/bHupYe0m5y5ex
         k/AFMntCUgkyTRhcHzXNVtNjlP4vLEuevCUX2yuiGN17pdGdsua8w1GH1CDe6PrD2A09
         0x7VvlExmtl7oTD0YXaySPrSXl/b1xiNRVBA2EbtprEYB2dvMUzfu6N6kX6Cep5akZrH
         YTHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=eeM1WbY5xSjrbNh4NYz5Cpy0fJXPEdm6o3cJ2Qh23TE=;
        b=LLSNyDIuel7v+lU4B0HueCvzM/H1ZZ+A8w7zudaG0OywUyguJuWhH6XvkRZ3PELG05
         Vn8YV0Ro5JPD4R5e6wBb0xQzw+G3fGhQohGTDfwr02fql1P0qJd+EoOOXZg1auxm3CMX
         jIS9CkcLOChrPj53WpmLcv2plI7HAZpSd0bmO6uU2lGdTUNBP3+PE9JPfsC0hD1ky2Xy
         cC25Zg1+So7Ux4Ef+cdGmEIzODdKMMjd081WlSecvk29O6QX6e2iXaQJxn/FuB5/pjB+
         ri2d/EuhC6PdBDIvbapfL/ZXL4AtXXTNMVQBXmfMRrDpQqqzIYJX9OhigIoN7qhuMI3V
         pGqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf8-20020a0562142a4800b00476b5b4f914si1315918qvb.517.2022.08.12.08.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 08:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMWQw-00027R-F3
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 11:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVlC-0003ln-Au; Fri, 12 Aug 2022 10:35:38 -0400
Received: from mail.inka.de ([2a04:c9c7:0:1073:217:a4ff:fe3b:e77c]:32968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVl9-0007Od-KS; Fri, 12 Aug 2022 10:35:38 -0400
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
 by mail.inka.de with esmtpsa 
 id 1oMVl2-0069do-Le; Fri, 12 Aug 2022 16:35:28 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
 by mail3.berkhan-weisser.de with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <Enrik.Berkhan@inka.de>)
 id 1oMVl3-006fIY-9i; Fri, 12 Aug 2022 16:35:27 +0200
From: Enrik Berkhan <Enrik.Berkhan@inka.de>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Date: Fri, 12 Aug 2022 16:35:19 +0200
Message-Id: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a04:c9c7:0:1073:217:a4ff:fe3b:e77c;
 envelope-from=Enrik.Berkhan@inka.de; helo=mail.inka.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Aug 2022 11:17:45 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: co68SDpt1V15

In more recent Raspbian OS Linux kernels, the fb driver gives up
immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
displays are reported.

This change simply always reports one display. It makes bcm2835_fb work
again with these more recent kernels.

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e94e951057..890ae7bae5 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
-- 
2.34.1

