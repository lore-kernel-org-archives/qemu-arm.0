Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1858314ejb;
        Mon, 9 Oct 2023 03:06:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM715Njc1QxV/KJagM5P8BFKWao3ux5oCWDAs+2CMoopHx2Xff8OtK/TBt5Hmda6x8qCvF
X-Received: by 2002:ac8:5c91:0:b0:419:af26:fc72 with SMTP id r17-20020ac85c91000000b00419af26fc72mr20365945qta.27.1696846007529;
        Mon, 09 Oct 2023 03:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696846007; cv=none;
        d=google.com; s=arc-20160816;
        b=RRk2Qm3NatEf0cQLo5tPS3RW16AZgdl0uztaCVd1qn91rfZL1BHucgjC6LulB6W/uJ
         9qrEyKrzaX9JtJNdhbk0/7dmljQshAkL0rw8sFmEzXgD65HxwEEXv7ITZ7ro5NL0MQXM
         9j27lx4afn+YYJRaoOCpWcDeO9Q6oCkw9dt/qs7QFTFdkhkv/rjoZntYRdOH4tXk72jR
         zz2F+mJV/bBreQZv6k64fvvdwVbBrkoDFGFk8vTV3xOp64Zag+2QfndFMkbq8EUcOEJk
         S3BYREotjFqWO8XfdlglkR8wLyWXloWUC4ywQKqESh4+lbaVIURjU93V/0KBPYiC/+m0
         sdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Csk84OALb8Q47k8SHL9RxynHS9qNYD6xloMNS+mez1Q=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=s301kHoe6gj57cqg1cWbGT2JmsW+kUG+kFPctx19H25pifwxvZQo5JPnl74lQjcDKS
         b9tv3fZP3LoOyrYl42bd9FIx/b5HUo0jY3kmneGDMrASnm/hdmfbUePdeuMETh6lvL6m
         ZFxuPjpzMRDe1w66NgVp+lGFeJ12Jhc7BplK0GzQYVe7vHZzvPpByQ7tb3T5pRcvNOrQ
         c1G/YKXKmLMsuQadiRJqKMPvh6X78xGMi5SYXHMIVZJcQuXb4OEtVcYrD5yaNAjiBrYr
         O8aEa3dnhqzSmIg42/xTOhB5iokFzvhhguZFVc36JRktIAp6Cx3JkHuUDJdyQN4ddR7e
         Fyqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN6Cr1B4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a05622a02cb00b004197310859dsi6069104qtx.569.2023.10.09.03.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zN6Cr1B4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn74-0003Uw-1n; Mon, 09 Oct 2023 06:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6z-0003M3-4m
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6v-0000Ex-9X
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so4139961f8f.3
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845815; x=1697450615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Csk84OALb8Q47k8SHL9RxynHS9qNYD6xloMNS+mez1Q=;
 b=zN6Cr1B4PBnB8FvTSS1rtyEe2t/72GT18eWWuem3OErfj9/xw+WoDeuGwOHyOOexgx
 /y+xIz8SpZV9AuUb+O+OKyllmz1QyI/2oAaOVcSxugFr2ev+Jb1lS2NP6IP1VDv8V4GF
 EsbrctDLssFhxNDmCiG+lzkoR2yeAzZqLyqoLWF2EiPnci8GjpWJLLmTneW7J9/D70No
 o9AURB2MmcJ1Yirx9a32evQCLpWxpZfz+uCtAhi2uU2yh9JXz2JZeaVpSCrqOtUVF2eO
 8v/74vb0fVO65GP0p0EcWhpniCMFC1gPWqH+7JHxCZgIBtBzSswNG3NEYxaLqO7Vsq0U
 nmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845815; x=1697450615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Csk84OALb8Q47k8SHL9RxynHS9qNYD6xloMNS+mez1Q=;
 b=SJSt/4UZNwzd+lXDKBEVBQ90Ukn11HKzhPyDUpWeid3tBOYa72GBEn/NUppND2dMDm
 qr16/kLT3SFOTGjkwoHQt63BpbRcBOQsffjxObBX3l0oB48aK+sgquPTzq5gdsLA4pyk
 Jj/CaeNXTSjqfVqy1zjN7uc9NPiFtolyUbp7e5tG4dENqxlRbbk1MIrvY5klzRyf80qi
 eMwf72o0bLtHyNnhtI5YKHVAP4b/d1NhTFLjWgEWDuhwv/uOjX/FF7dLqMCtS+/2ht08
 faGENQvaNP4S2zlw6Lq6kLbEJ9XUXcl5z4mNa7jGiATECC7q/28Q2uwpseDSVqUpoRsn
 FUQw==
X-Gm-Message-State: AOJu0YwjOjnlxSFXobFPglHp7w0Defox08IRitz5o57Q/MuKiC873n0k
 TA1Rk92pas4CEvFp+1WF/bhxFg==
X-Received: by 2002:a05:6000:186c:b0:321:6779:944d with SMTP id
 d12-20020a056000186c00b003216779944dmr19359600wri.47.1696845815218; 
 Mon, 09 Oct 2023 03:03:35 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d4c4a000000b00323287186aasm9142230wrt.32.2023.10.09.03.03.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/10] tests/npcm7xx_adc: Clean up global variable shadowing
Date: Mon,  9 Oct 2023 12:02:48 +0200
Message-ID: <20231009100251.56019-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G4CGlihuat6n

Rename the global 'adc' variable in order to avoid:

  tests/qtest/npcm7xx_adc-test.c:98:58: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static uint32_t adc_read_con(QTestState *qts, const ADC *adc)
                                                           ^
  tests/qtest/npcm7xx_adc-test.c:103:55: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void adc_write_con(QTestState *qts, const ADC *adc, uint32_t value)
                                                        ^
  tests/qtest/npcm7xx_adc-test.c:108:59: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static uint32_t adc_read_data(QTestState *qts, const ADC *adc)
                                                            ^
  tests/qtest/npcm7xx_adc-test.c:119:53: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void adc_qom_set(QTestState *qts, const ADC *adc,
                                                      ^
  tests/qtest/npcm7xx_adc-test.c:135:57: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void adc_write_input(QTestState *qts, const ADC *adc,
                                                          ^
  tests/qtest/npcm7xx_adc-test.c:144:56: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void adc_write_vref(QTestState *qts, const ADC *adc, uint32_t value)
                                                         ^
  tests/qtest/npcm7xx_adc-test.c:162:59: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static uint32_t adc_prescaler(QTestState *qts, const ADC *adc)
                                                            ^
  tests/qtest/npcm7xx_adc-test.c:175:64: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static void adc_wait_conv_finished(QTestState *qts, const ADC *adc,
                                                                 ^
  tests/qtest/npcm7xx_adc-test.c:196:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:207:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:235:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:267:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:293:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:311:16: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
    const ADC *adc = adc_p;
               ^
  tests/qtest/npcm7xx_adc-test.c:93:5: note: previous declaration is here
  ADC adc = {
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/npcm7xx_adc-test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 8048044d28..e751a72e36 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -90,7 +90,7 @@ typedef struct ADC {
     uint64_t base_addr;
 } ADC;
 
-ADC adc = {
+ADC adc_defs = {
     .irq        = 0,
     .base_addr  = 0xf000c000
 };
@@ -367,12 +367,12 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-    add_test(init, &adc);
-    add_test(convert_internal, &adc);
-    add_test(convert_external, &adc);
-    add_test(interrupt, &adc);
-    add_test(reset, &adc);
-    add_test(calibrate, &adc);
+    add_test(init, &adc_defs);
+    add_test(convert_internal, &adc_defs);
+    add_test(convert_external, &adc_defs);
+    add_test(interrupt, &adc_defs);
+    add_test(reset, &adc_defs);
+    add_test(calibrate, &adc_defs);
 
     return g_test_run();
 }
-- 
2.41.0

