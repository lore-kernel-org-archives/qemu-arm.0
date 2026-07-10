Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FEFC44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 13:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiB52-0005ud-L7; Fri, 10 Jul 2026 09:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wiB4n-0005so-6t
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:15:36 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wiB4k-0008AL-4k
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:15:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so6649485e9.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783689327; x=1784294127; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gLSBGq58bejmiCRbB0BERo1JTcl6+BWisQrAiENcIRY=;
 b=nQv6lECSqjU3CwFTcfXpGGI8u9q0QsC3ll0OobjFZdgtyB+rCDfnjnsNvDi4tJm+Jq
 f6C5TEAbEqxEosKMOqA/IKGC4BU/nbaoWa6hqNoNOAVnRhTGWgzbUADnu3bLceFNgIHV
 ABdMyTOzXQnuVaZlI0Mgjy17BkmzwDAJvDMBnbILP728eFq7YpEwTYvi8328uMERLotp
 7StvIEpT1EU/lKiBC2FWWNOMw+BFOcAOF+uJsaN+G3+y0uN2fxkk3yAriuD9cWVnmhCG
 CJHxFhEDxzOtO4vci6wnnNRHImo7+JUBX/xicLcNt2wUukUbJbTpao3jyCfjyMhTAjnb
 r7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689327; x=1784294127;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gLSBGq58bejmiCRbB0BERo1JTcl6+BWisQrAiENcIRY=;
 b=YPLLO6lOKUGKaTvm1ZGGc6DQ9z3NZ6eLUAUt9gQguf4GlTVm49xqihCK9AJLM4QcRK
 BEPYfYA7+3iOaVDJ8rHsJlSDV5aVkgSl4q083EBb5dBro+CoaH8GfwOxlVroKsOh1jk0
 QlIMGll4PyRI0o//9hKsCag3WEFHyhKdNO4jf7E8UMdOv52Kg7DwDPugivagCVYQLq3F
 omhloS14D7iINYwlyQ5xk675Lm1Sgmmu6NFPbjADyrPBOSKs93ImKvM29+7D805ncrZW
 xwDhKgT1TED4m1TwOUdmkuzdT/9F83nc68oy6DldqdQBbIN+qn/dUjFEXHVg3XT/xh7L
 QTZg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3/cDGou+u+VsXjYWVoNNXmvEhQenxYzhmbpiJn5rg8qgnv65LaBB0YQZNRsIlR2ZkbTGGpdOZsw==@nongnu.org
X-Gm-Message-State: AOJu0Yy+04/YSEM5zkTFVo2UPdkUgdzaTfaUJJwxHVIgjplPI/iiQ9hM
 4sestttl4ff0NIGwlHLvoUhZLVAktkmThyOt1VIH9fJit75odSXqBJkhVrfCtC/l64U=
X-Gm-Gg: AfdE7cl3YqDa+FwcGStyEaslPGlG+8MsCQFT8PRQN6J3nZm4HqjCGP7QF9P3uiHrZzs
 DbS03EVAMsM4h4yvlX88/mBg1E0bvuuG8QIgLyzFk+GnWQU4HvY1vgdL16vXfnxztXcIh4etvkw
 Ar2UyAk8ggHPsKRj0KOhdssARox91A80kqV7rRVunwNPbtaso2GBUduqHw0HQ5NB33nGUFABRSa
 zHQIK69TpPQnb5af/YMdDRgNiP2onIsIzY1+ON5y1SEKrq/5TKi2W6DKJqtSLpevkJp+BT/d5nH
 u/OTSzfhShHXEhSrCTwU/qLdt6dCz2qY6flma2T7/OCITirKn5UP/cYAWDQuWuls//vrooed28b
 UZ0WZ0l3BXs8pK9QOIecF4F8SUHv71bQOv6Sl976LZMaejhhwmNNwWy44w5v4Krj2LZ82ERL2Io
 bwZM27mKszSHFS
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id
 5b1f17b1804b1-493e68f03damr119628095e9.32.1783689327229; 
 Fri, 10 Jul 2026 06:15:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.114]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff432sm133999465e9.4.2026.07.10.06.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:15:26 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9E5525F7C0;
 Fri, 10 Jul 2026 14:15:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH v2] hw/dma: don't allow weird transfer lengths for bcm2835
Date: Fri, 10 Jul 2026 14:15:00 +0100
Message-ID: <20260710131500.2323848-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The datasheet doesn't explicitly say that TXFR_LEN has to be word
aligned but the fact there is a DMA_D_WIDTH flag to select between 32
bit and 128 bit strongly implies that is how it works. The downstream
rpi kernel also goes to efforts to not write sub-4 byte lengths so
lets:

  - fail when mis-programmed and report GUEST_ERROR
  - catch setting D_WIDTH for 128 bit and report UNIMP
  - add comments that the DEBUG register isn't a straight write

Yodel did some digging into the specs (see discussion link):

{A} AMBA AXI Protocol Version: 2.0 Specification
    https://documentation-service.arm.com/static/64256e84314e245d086bc88f

{B} BCM2835 ARM Peripherals
    https://datasheets.raspberrypi.com/bcm2835/bcm2835-peripherals.pdf

[1] {A} (p. 10-2)
[2] {B} (p. 51)
[3] {A} (p. 14-5)
[4] {A} (p. 4-3)
[5] {A} (p. 9-4)
[6] {B} (p. 53)

However was unable to come up with an unambiguous conclusion without
testing on the real hardware. So in the absence of certainty and for
the sake of addressing the DoS I suggest we merge as is for now.

Link: https://lore.kernel.org/all/20251111105429.3993300-1-alex.bennee@linaro.org/
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3201
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - remove test case
  - expand commit message and link to discussion on RFC patch
  - add TODO should anyone want to test on read HW
  - drop the debug comment
---
 hw/dma/bcm2835_dma.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index d07459de2d0..b842aef4b74 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -86,6 +86,23 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
         }
         xlen_td = xlen;
 
+        if (ch->ti & BCM2708_DMA_D_WIDTH) {
+            qemu_log_mask(LOG_UNIMP, "%s: 128bit transfers not yet supported", __func__);
+            ch->cs |= BCM2708_DMA_ERR;
+            break;
+        }
+
+        /*
+         * Datasheet implies 32bit or 128bit transfers only
+         *
+         * TODO: test on real HW and report back.
+         */
+        if (xlen & 0x3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: bad transfer size\n", __func__);
+            ch->cs |= BCM2708_DMA_ERR;
+            break;
+        }
+
         while (ylen != 0) {
             /* Normal transfer mode */
             while (xlen != 0) {
-- 
2.47.3


