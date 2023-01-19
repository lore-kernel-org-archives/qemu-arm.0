Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389138ejc;
        Thu, 19 Jan 2023 06:59:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuKCbxPGVOKM9Vz/YAMtnv4bL4zJNXZcXcxkcVBzr+teNUHxcCZpj0f41aWPxLpSDg7VKRf
X-Received: by 2002:a05:622a:5917:b0:3a8:175a:fd48 with SMTP id ga23-20020a05622a591700b003a8175afd48mr16539466qtb.64.1674140371607;
        Thu, 19 Jan 2023 06:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140371; cv=none;
        d=google.com; s=arc-20160816;
        b=T+GCH7ze8zTP0MCMRnxu6hasPxg4IEnDGd+ZEuhkzK1yXdM1VsbMGYxMStGK0RaavH
         u/l9BnVH6Zez5+5JPNoYvRF4U9WfeGWEPZ7iiF1DEEOP507+KYZZRJsk7WlGhhjruBb1
         1DFVnksAP0MHZNH1I7GTL7DUBh7jNe8yCPO4OHWHhJUW9udxlzAdgtJ8KEpMNtdLTOOK
         jZFmF49haQrYAeKfFkgPuxxsADQhrsSsV1oIUTreraAy8WkX1tM1HKTw5i0va58u76vz
         Q3WX5ET2f4VVjFDV7GC2bmzJr8svXDDdr1py6L3KoZT8lw7/YddaHPc/1/KU3pxmMv7T
         yeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dbql9l7vSKPentsKxfsPytXlVVV9PrWNWaeeTqrtx+A=;
        b=t1Ti/f2H5SXgFdx1F6oAaycfB+J//R358L/FXhkTmunWct9UxnkMYsU2hzIRz2cAqZ
         g6pG94ZRxOpRsad9ZXto/25tZkNuygTBZT1HNGPNVW9Q2FSWuAnlrx8qMK9hLG0RkD20
         3uz0buabd+VMNm+Gvb+JnIUDsBbQXXz6sNKT+TwX7ZQ6p4VImlsezzRohBJdObeiYbL6
         PJIrrmvtzO8eTW2P7sJ0eRsd3BUsnZEi3PrGKNJp2NLxLd/cUZREM8+l7nMnx2thPWsQ
         apBFsfVJFOZVk6AqNrsRYFox1k58PHcjgdgIXIL0jp/DNTPWfvRKGucpeYPu96Kq+uf3
         SY8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEOk9AIQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc9-20020a05622a1cc900b003b63221a1e2si7273475qtb.325.2023.01.19.06.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oEOk9AIQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNS-00066U-Fg; Thu, 19 Jan 2023 09:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNR-00065I-7z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:53 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNP-0003Xh-Ox
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1455828wms.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dbql9l7vSKPentsKxfsPytXlVVV9PrWNWaeeTqrtx+A=;
 b=oEOk9AIQ/Fvj26tENwefQ4Gk1I/NGhdiZwSqLMwxte9ZzMTIZAKIgE0pXqFONYj2gq
 FBw0altoZ/+Dc6qpuF3XQFDmPdqPl1EtLggluXdCwy59w6lp9a9fmTtfLYAAkDFz+p0x
 +8PGA0AXy/NPs4dsh9ZhAO7Moqmt31MLqkafg0QNMGpPwcu3GwF5oZjUb4ajojO1plEo
 U17DUwgu1GN0dU1FgDzHiMXWkCQPUdE18u/gjClQxzFAv0AUD8y7Q2gEaB0/KNMlucCv
 nOVmyeyTO0SSKJ4OocqNVWHkjCkMlLKpqmV1Q+XYEPIXiP2FKSZPz1xG9ispuXd2BPxU
 5gMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dbql9l7vSKPentsKxfsPytXlVVV9PrWNWaeeTqrtx+A=;
 b=dQVbOALwtwO0Zu648+TuWDNrMkyLAOY4aezO2PiKlu5m+HgEAnUh8MGzDs9KF9wLL+
 wZRPFXrQD2goG9Nh5TQrkSK9L6vema+wmS9grOmTDma3P4pEeHN2Jhc4v1hbF4PPd2un
 u5ZSP3ATuSeHsXosqSfcjS1MXuEO47OhhE0B5FIJTZDSEv/jLSpR9vVQnrHkbxax3pob
 a3j1a2mIJOP13Alb2IbCwlF+hc2vyLAAbYU3cOkXTBHME+UMXM0X+IpFxjV36Qrq/Hzx
 inqZMI6i14zA7H6aT5ShZS4OsG+YZDakAsa5eff1fuw1z/CpHfW9CPXc3xuNVnnDqFNh
 dxcg==
X-Gm-Message-State: AFqh2krMzgzQQwuDwh031ogRPGBH7c4jz89wGLJKoub/JE6nTNLnNM6H
 2f04ELd5u4KflKxpBWljatz7CjEen6PHvd4f
X-Received: by 2002:a05:600c:4b0f:b0:3d6:2952:679b with SMTP id
 i15-20020a05600c4b0f00b003d62952679bmr10446693wmp.34.1674140330223; 
 Thu, 19 Jan 2023 06:58:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003cf71b1f66csm5521830wmb.0.2023.01.19.06.58.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Date: Thu, 19 Jan 2023 15:58:29 +0100
Message-Id: <20230119145838.41835-3-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tUx/9epiDSte

Slighly modify test_machine() to simplify next commit review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3aef3a97a9..3a854b0174 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -227,7 +227,6 @@ static void test_machine(const void *data)
     g_autofree char *serialtmp = NULL;
     g_autofree char *codetmp = NULL;
     const char *codeparam = "";
-    const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
@@ -235,21 +234,13 @@ static void test_machine(const void *data)
     g_assert(ser_fd != -1);
     close(ser_fd);
 
-    if (test->kernel) {
-        code = test->kernel;
-        codeparam = "-kernel";
-    } else if (test->bios) {
-        code = test->bios;
-        codeparam = "-bios";
-    }
-
-    if (code) {
+    if (test->kernel || test->bios) {
         ssize_t wlen;
         int code_fd;
 
         code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
-        wlen = write(code_fd, code, test->codesize);
+        wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
         g_assert(wlen == test->codesize);
         close(code_fd);
     }
@@ -258,12 +249,14 @@ static void test_machine(const void *data)
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    qts = qtest_initf("%s %s -M %s -no-shutdown "
+    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
                       "-chardev file,id=serial0,path=%s "
                       "-serial chardev:serial0 -accel tcg -accel kvm %s",
-                      codeparam, code ? codetmp : "", test->machine,
+                      codeparam,
+                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
+                      codetmp ? : "", test->machine,
                       serialtmp, test->extra);
-    if (code) {
+    if (codetmp) {
         unlink(codetmp);
     }
 
-- 
2.38.1

