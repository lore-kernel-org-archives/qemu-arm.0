Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp919695ejc;
        Fri, 20 Jan 2023 00:24:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs7UqoYLhilkrN+DqhqrkOHSP9igscC1QzRprCh0xeic+QB2nRf78aMAQNsTdk2V1MpGTda
X-Received: by 2002:ac8:644:0:b0:3b6:84b9:d2d0 with SMTP id e4-20020ac80644000000b003b684b9d2d0mr10562524qth.23.1674203085655;
        Fri, 20 Jan 2023 00:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203085; cv=none;
        d=google.com; s=arc-20160816;
        b=TVoFwSC0Kq5K7tU8q+LnkbuaQSZhDqtpMoNfqqwDWFJjUJf4fwJeUawv1M2d+TYO1T
         zLNoFPe1ARiGq6CIV7ROZ+P7lYeSi/Rf8C/Ks0HgP+Q1+aR7+kG5UemCDWvfkTv8WLFw
         me9/o1u0RSZoLB4BNDZDIwK1E357LPB0GV30oh4OTxtjd9HzDaKJBrHtPdNaBrmtp158
         RKeofSDuQEZkvsBl6AIqdQNwFt2FWOiJKa99jFDyaxizDd6onnTyqZLU80b9itwrrC6x
         HdBUJwcy7qjPBlU2dkmMGkqP5gehxbN9TNh63Di+IRj0a9s59r99fw/HmQH/r6Fd7LY2
         dgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cm+umm3mYxK9+2vcvx9AjhkEUHA7aStmnl97320UCkM=;
        b=ApilB4Uh5Q8tl876LSrpaT+xhgJnh142cPnKYwYAel9BQoS96rBGwBIMfjh37b2axK
         6/qzjl6UgICMnslVcEHOyOU8CZnOMc/CFr/9tCbUbYxnMHPDrvJKyqKXe2EW4YYojj22
         KdhtZiv9EF/vAWxZuNF6mMpdIKfSv35/EYhhkC3i20rfsewbm8wXfcqUsUQJBwn9yW3F
         jbpzpk6XEFU5AoLzThodT+nbyJiwWsOu0AHTFJ8DVD6YIrHHpEs1VrEn4J6FLwgC+yqT
         0OP8H9N6wdBtUpfwGalpouE7e7uhkUQo9l57lbC8TpJ6xQ5p4Ys+VFbNJpeTn9ENDmqb
         3tlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpunFXMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id he27-20020a05622a601b00b003b63be7d05csi6577065qtb.178.2023.01.20.00.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZpunFXMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImh1-0004iv-Ld; Fri, 20 Jan 2023 03:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgw-0004hq-7m
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgu-0004bG-Rb
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id t5so4150939wrq.1
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cm+umm3mYxK9+2vcvx9AjhkEUHA7aStmnl97320UCkM=;
 b=ZpunFXMVSA4HnDYLCxUAriPXIak+DVQgFJdJ2EuMNuyS4tj/uWIf8PWhBitRFop6yM
 pZg2ZYBwWNXuqkCEu3FrSdWX/fiVN3a0Nu4s22Ptreha+vqxjn0w7hofupOEswa0ASiW
 B7Ws4CDr5rYpBswrj92vVOGSHQETB0E9euM+Dn32W5ySyheZcrpixWE9OApSqHEysK9u
 d+fPWpWjF+oqtke4aQ+78zL/2eSEh8erc5RaNGAfa7DQBmbpsOK2WSr1Px+TCK25DB5U
 m4p4dDUX2+oT9lJZbOxUTMp+1J2A4EtTcLiSTA7f7uJ1uTlkak7w3StJ0ibhty+THl3r
 OgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cm+umm3mYxK9+2vcvx9AjhkEUHA7aStmnl97320UCkM=;
 b=o55djBTwZkhJqsjzz/zNnmDTW7PuuhhQfR3Lc+TpSVweqg5ThZRRN+DI5mn31sXoJG
 OCUwd6/1jbmtZLbN/Hn+XU/Gi7przqj9Rxwk1HZhbIFl7KVH9LLnLQQBMWXxY9F9A571
 cmRp1l5R+178tz/5czAkdprfCzF4MR/wZMw3LG5v83FWf+2FHFZRS81c+bFvnQEnJSaf
 qwR0tbuUTk39FbX0mFWw3QUYwqtrIz/FbLYW+nBJZO1iUiFMByZ0TknQnqIPVX16OFjT
 jmCr9y+MnQ5o3Irhfm9CVVN4ucrHPb8X0DTLN0aSwjhocx9TscUT1rhnmln5E4qyZ/+S
 xW5g==
X-Gm-Message-State: AFqh2kpfaQVCqoxIB515j1A2xckO67G9ONpR7/aquuWEN0VnipmQq4Bw
 qvjOuxK9xVjwlpMPKehleMxVyg==
X-Received: by 2002:a5d:4dcb:0:b0:2bd:c1de:a33f with SMTP id
 f11-20020a5d4dcb000000b002bdc1dea33fmr7516960wru.19.1674203043574; 
 Fri, 20 Jan 2023 00:24:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm36048130wrj.94.2023.01.20.00.24.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 04/11] tests/qtest/boot-serial-test: Only use available
 accelerators
Date: Fri, 20 Jan 2023 09:23:34 +0100
Message-Id: <20230120082341.59913-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: foM8ylkeYStV

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/boot-serial-test.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 92890b409d..f375b16dae 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -17,6 +17,9 @@
 #include "libqtest.h"
 #include "libqos/libqos-spapr.h"
 
+static bool has_tcg;
+static bool has_kvm;
+
 static const uint8_t bios_avr[] = {
     0x88, 0xe0,             /* ldi r24, 0x08   */
     0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
@@ -257,8 +260,12 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    g_string_append(cmd, "-accel tcg ");
-    g_string_append(cmd, "-accel kvm ");
+    if (has_tcg) {
+        g_string_append(cmd, "-accel tcg ");
+    }
+    if (has_kvm) {
+        g_string_append(cmd, "-accel kvm ");
+    }
     g_string_append(cmd, test->extra);
 
     qts = qtest_init(cmd->str);
@@ -285,6 +292,9 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int i;
 
+    has_tcg = qtest_has_accel("tcg");
+    has_kvm = qtest_has_accel("kvm");
+
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
-- 
2.38.1

