Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp321799lfg;
        Wed, 5 May 2021 06:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRlkoch8lMuzDsG8YLszbM78+OaFJ1L1rG9EQp3invrL+KWxOlEWGky6BEPpnJk/uGwY7Z
X-Received: by 2002:a6b:784c:: with SMTP id h12mr23709406iop.63.1620222958548;
        Wed, 05 May 2021 06:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620222958; cv=none;
        d=google.com; s=arc-20160816;
        b=H1c1u9y3CgtGSu3mEqmQyNGnDGEMB+cS1mBqeIxVJJjKD4r3hemKQg1hcMzLToDhB6
         J5ag2l2GZb26RiwbmIIHDXAIusY21lbh/4psinQlH0eAS8Q6eFVkTkE8/nYf7WM2/hbk
         MJsmUl+aO3ZF4f74BdVhlxOh70F5y1SFRyn5A9yIJHCTdUcnSw0aKgXZ88s0ndk87qjE
         2VkpdcsZDmXrk0pggob6jrvOGwCfFv2eNmiW0bBSsbedelHpjBCP/+5SDGad7vQuTOai
         KYh76DnRPTY1DG82v23ASDwaKmQuuCDxN74rJXATPyJ9YaEigBSQ0vOx4UppevnM9APB
         s3KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LtYc437Hrc+F/cT+QMDIG4OwrJNHfRhNlqkrK9EuWuQ=;
        b=sPOo+11oKfJw1aVU8GDEYmNoqVlNndavThW9C9gBoA13ttAUElRm+HhaN1X0kqq1fk
         XfmTZTT0R/H7quwyUc/r2xosHlIXTM4H1Y+mlQd3Y+1awpfvD8P7bR5skxffLuISdUou
         aKGl6CACY0ladaGt+Jek6eRF4B5px5xWGUxb/sDlWPI1CjfIZDClud62m+Jz+QuA13Od
         K91v6T4TNLyMoGa4lZyXCfccNUsIzUfSGRyyjhcpMUSH4IwnfkzoFKjTxbFqD3khJ9Z8
         WvklOrisS8Fn/VOAyRoVAwFXjyXQHZfvZnKoe1HDjxSeYQ1i/c/MWb14Zd1DRIppaCnR
         z41g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MfP+vF/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si26132423ilm.103.2021.05.05.06.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 May 2021 06:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MfP+vF/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leI0L-000842-Px
	for alex.bennee@linaro.org; Wed, 05 May 2021 09:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leHzn-0007yw-TS
 for qemu-arm@nongnu.org; Wed, 05 May 2021 09:55:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leHzk-0003ai-Tn
 for qemu-arm@nongnu.org; Wed, 05 May 2021 09:55:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d4so1940045wru.7
 for <qemu-arm@nongnu.org>; Wed, 05 May 2021 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtYc437Hrc+F/cT+QMDIG4OwrJNHfRhNlqkrK9EuWuQ=;
 b=MfP+vF/SdzhAJrEWx+atZ3xblmN9sPRcaNQ9VnasZ2j0MWdb4kIWkF19rTJ8JPbPw+
 OiGTcPnebC7SKhpN+OwwBN9wxJm64je/GmzVedluFjfzs+Vm/lt5yGbW6ad6r22i9gMc
 694cJx3V2/vF30MogVOKNVqlcp02AnkYTamQ98+kGWRw6oS+3e12Oi+waXvPyfPYZeeI
 tDkkQXWGC+vGGHyQ+dOCfRovrVt3BUzd6ODPHDoRo9nE9lgsrjMFco+Il87n1Fo8WHSL
 /ueHjpAxtKfE4iSaAZbQq8aTRnFagtLPYVRUl+lnZQt6nHCM1hudyAQtdjQM0L8coaYd
 aMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LtYc437Hrc+F/cT+QMDIG4OwrJNHfRhNlqkrK9EuWuQ=;
 b=q8h9fwRJyIIGTMDckNruJE0oaoiFvWbrv08gNQkq3ozVVV/IuW1gFZCiC02tbYCb+3
 0xNf9RzriU3KJTDrE539RjwwlcH2lsR6++qOUNPP4o1w4Nc6oWkhZKy94ZfBLEwqAXxR
 fHms4jLmLM4I91X92EmCP/Y0VZ7OKuYwPiblKNwoZrtGe0cAHwfE3RG0s70J5tTzKHAN
 wQbmUSDYtDDItQaJyVvEi8s1UBNH0U6GDZLHLFxQHvnbzZ0cJMnN+cyndUaKR3ESmxNm
 CvwhuJFYx+MxIUd0o179GAA5qB4S/nEPr73MC0TzBogt2nYHNtA1qp4ud33Tr3x+RW/L
 BHKw==
X-Gm-Message-State: AOAM531/TzFjTlI+NQE0VewfS1gjBSvEsuaD9sx/hazgkSi3g2B2JjLx
 49dziDYisg2wXudBT/lnhQ8jdsdNviW0xA==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr11949800wrm.379.1620222919498; 
 Wed, 05 May 2021 06:55:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z6sm5878680wmf.9.2021.05.05.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 06:55:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/npcm7xx_pwm-test.c: Avoid g_assert_true() for
 non-test assertions
Date: Wed,  5 May 2021 14:55:16 +0100
Message-Id: <20210505135516.21097-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 Thomas Huth <thuth@redhat.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wfzFDGqGHRrD

In the glib API, the distinction between g_assert() and
g_assert_true() is that the former is for "bug, terminate the
application" and the latter is for "test check, on failure either
terminate or just mark the testcase as failed".  For QEMU, g_assert()
is always fatal, so code can assume that if the assertion fails
execution does not proceed, but this is not true of g_assert_true().

In npcm7xx_pwm-test, the pwm_index() and pwm_module_index() functions
include some assertions that are just guarding against possible bugs
in the test code that might lead us to out-of-bounds array accesses.
These should use g_assert() because they aren't part of what the test
is testing and the code does not correctly handle the case where the
condition was false.

This fixes some Coverity issues where Coverity knows that
g_assert_true() can continue when the condition is false and
complains about the possible array overrun at various callsites.

Fixes: Coverity CID 1442340, 1442341, 1442343, 1442344, 1442345, 1442346
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/npcm7xx_pwm-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index bd15a1c294b..a54fd70d273 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -201,7 +201,7 @@ static int pwm_module_index(const PWMModule *module)
 {
     ptrdiff_t diff = module - pwm_module_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_module_list));
 
     return diff;
 }
@@ -211,7 +211,7 @@ static int pwm_index(const PWM *pwm)
 {
     ptrdiff_t diff = pwm - pwm_list;
 
-    g_assert_true(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
+    g_assert(diff >= 0 && diff < ARRAY_SIZE(pwm_list));
 
     return diff;
 }
-- 
2.20.1

