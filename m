Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389504ejc;
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdhqjZdK391q0Lz9QvLa8hL4j0hR6bx8FjNoVoZ7sjeqFKEKFIvG6XXsLvMxjsNas9uU5C
X-Received: by 2002:a05:622a:4a0f:b0:3b0:b9a4:a20f with SMTP id fv15-20020a05622a4a0f00b003b0b9a4a20fmr17794337qtb.4.1674140406499;
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140406; cv=none;
        d=google.com; s=arc-20160816;
        b=B1uWueZc2WO2rAlp2fmj76SxcSlOHPrnXaLJSJKK5Zx5XxyunG+vC3gViGGHXfcHkh
         85OtwScdkjHozZ/3qt5fXpDestYBi8RkdEl9UYNXi9dWOwG++w35tdDBZY79sVp9v4WF
         yZ7aznlTnsxMVoaFok7mD1o7o32G0+PEjktvRxMlo4cisAMpHTePdZDPabHNI7j2asXT
         HDStGF5bJlEiMFq7ZY/AmRfz1rZfQd3ObeopByrnLmzErXXnBTNj1avAXxqs8MsvfNa+
         sEUTyZ1rYaRbUigYHrjulNNFd0xSyNzHwOT0q6bAkWw+Nc3WPPf+c/wkUMXne+3Ith1A
         hW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CThcQ4IXwzbhuIEPH7wu+o1eE9qqn2LCOFCtuelW+qs=;
        b=XqWHT141+vNz449X0Xt25UbMmjeWsnjg84C2mcvVhuh2IdiC6gdAGbv9ozhIgQ0a9M
         du3knvrG13VSNVmiSBLFqkYBvTdr0hRZwTNGlPQuMZhZzgz4Nzz0yZPOqZmYmu2Ps+BI
         BZrIB/AM0PD4b1zkGinEdZQbxqHXPTTJEKNU5ql5sWCdFYfvdF/GKysgUkSSQRcyJdlj
         GbPzWLpD/crzHzMR5hcoT4KBgMArVYljXB+7MBqCfzyF90guwQiMrnclElSIvC/4Ibvt
         98864LIKbw99bSwOFgDdb6ZB5n6ZOyfzetpZdlh/6JNWookuoRwoDdbpFvKMhz0/5C1i
         XWqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoQBug3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw9-20020a05622a4a8900b003b63ddcd0e3si5878892qtb.146.2023.01.19.07.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 07:00:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eoQBug3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNc-0006Fz-VY; Thu, 19 Jan 2023 09:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNa-0006FZ-QU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:02 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNZ-0003Xh-5j
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:59:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1456122wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CThcQ4IXwzbhuIEPH7wu+o1eE9qqn2LCOFCtuelW+qs=;
 b=eoQBug3deQoyR+Jfv0vaED0GlQGC5kNRSzN4lBMPYsNU1mAzqbi8ZVvMpbok2KB1kq
 D/w1Qjuv6V21C9ScLlk2lJwfzcp2CoFKHTgGfad4rd0R229bqIj+JA0U2+g7ud4Xt0OJ
 iGPbGQkKlkDfNvDftYSymT9DW/cJN/wXxUscQTaumWncryWR3RZTN0csMhLpOlPQYbQe
 l/NFOMe18pwpkEM3vv8p6R8wCsDvdGrLhobvUjnU0cOvaVo6Q8aKgUmrWCeV3kYHAWtA
 UAPQg5P33ZYBZ7UuOt5GvrXh0/V7W9TX4JLKDSZkhcKDsouC51UWoSD2tYJrFVoHRpNi
 i7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CThcQ4IXwzbhuIEPH7wu+o1eE9qqn2LCOFCtuelW+qs=;
 b=KriKsurGOY0P523FJ20y9G7zTscVOvZw+VXdPKHGwxK3ia7ciF2JVhxkUfEmLhdmUE
 5KOwRgheKrXvB7+NknHXvMi2bgPOPBE/owNkh6zabqa+eMeZj1qlysesg+rKAVyexIWM
 QiflzUgTZDgRwtqwAT9bBQVJsONJTjExZD7P6KAF4ry4rzMcR2ykdGqZSoiqzTN4LgGb
 BvYG7PO39jWSVsJxUlZj5oS3VSvwUVfCmZlftysKozboFlt4EGGqslFbxoUjWfrdjkAB
 JzC3NSaf5z3URzfmVF7orp4mkha3ghEK9oPxPLRVl8zr/0lfvLr0zvuriCd3ya4ziwyv
 w8tQ==
X-Gm-Message-State: AFqh2kpgpMkbPKiKgN5+Bg7/le9nD+Deje/zx0EjgxNzfbo+UVsdScVM
 fYVtSdcYwgkRUo+G+rew6FWoVHGfSAqg7qdd
X-Received: by 2002:a05:600c:3d16:b0:3cf:8b22:76b3 with SMTP id
 bh22-20020a05600c3d1600b003cf8b2276b3mr10243748wmb.0.1674140340296; 
 Thu, 19 Jan 2023 06:59:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a05600c331800b003d1de805de5sm4793780wmp.16.2023.01.19.06.58.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/11] tests/qtest/boot-serial-test: Only use available
 accelerators
Date: Thu, 19 Jan 2023 15:58:31 +0100
Message-Id: <20230119145838.41835-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iYWHt6OF9RV3

For example, avoid when TCG is disabled:

  $ make check-qtest-aarch64
  ...
  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

