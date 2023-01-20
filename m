Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp920134ejc;
        Fri, 20 Jan 2023 00:25:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCekLVvyAiYMNTbmTqoUTPO0/53m+aKz3yZjLwzFSUGohsWpUohDKzdYxg+7+eZzAm4Y+f
X-Received: by 2002:a05:622a:998:b0:3b6:30e6:adb1 with SMTP id bw24-20020a05622a099800b003b630e6adb1mr21408166qtb.49.1674203145101;
        Fri, 20 Jan 2023 00:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203145; cv=none;
        d=google.com; s=arc-20160816;
        b=uv9Ps3gO67cphsbH79vCvFtBkvofPjwAr/Q5WWZBkEDMWVgyM7yQnVwRhBT7ZnbRrT
         5yZahWAPgPpRdB63nEbMcB2bQaUZePma0M3p7SHG9iXO4t0RRZQVPM7DjgKL9blaPMlZ
         XnvAzio/p/4Hy4vwtBC2QSMXfMf2LKTOxn5AkuJV1vXP/2agsbeqZUTytpZZeBocOvYx
         W71iyPPHxStHh7YN/qKNp78yHDcnCXv9ET5HrgNClkNEL6Pg7EqV4LCfd8PrCWWIkiQu
         1DS35uUsacTUgQcw/qM1hvbuIvigE/bR4Yn60dH7Q02fqnAP2fk2YMDDW+tXd2W0bAPM
         uxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=96awe59Bl1JmrEDLbt0RIPfUyUqBQm6nbi4HGeicux4=;
        b=vzGnrK7R8+oZ3ICBkuh6PrYgefJ8XT3MJN3A6i8uF8LwDhw3ZSpqr7bU9k07f2Q0dk
         cimcm4h8+mp2YSpr8oJ+gJS53mJORtQxvcxCt3I3J2X9o3Q375guPQCv3l5NM5ioa+vZ
         1QkiZ5WyQm7vaPpy8WwSNDFUSAk/U4SiJaRlUKEautawGKvyHj989YwHG7Bc62yLKGo6
         9wpZ0db1vUYb3uvPVAz6CkG96/P4hH9mezcVAgNuafYnqnBjBTpY8x/dNqcQQls2jLO6
         75fvSZFLCC04uaMlvVDyY/N4XvjskWEAdIjnEXHoLThuU2xyWsHYJSdKYHvyYGornZmC
         ehSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SiTX1Vhs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020ac85443000000b003b63338abc6si7837486qtq.12.2023.01.20.00.25.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SiTX1Vhs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImgp-0004g4-AB; Fri, 20 Jan 2023 03:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgm-0004ck-DB
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:23:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgk-0004ZR-SK
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:23:56 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5288028wma.1
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96awe59Bl1JmrEDLbt0RIPfUyUqBQm6nbi4HGeicux4=;
 b=SiTX1VhsgcvxE1cKCro2n5Mi9jtOQaep9/ODJ5g0I8+IccdsjcoIpUGTPMAivMl57Q
 OaRxlXCu+tR9/p3M1Y5Tud8mXI0nVmo2kgJ7S9qBnKY0dh0PqQkuHEZr0TcmC86xsd3O
 4vPMCgQSXG+msdPBFmNTR4OJiiTutJ8O5KeQhuE9R6jza0UaWXZJgdSGX/BxJRsEq2v3
 zHeGDMqOrRGAFzDaVmAjOAMRiLxz/ubqnvgCGANAgh+oH9hQNlzHMkYNTOX/M8PcxeGj
 tESNWrq6K+XPjPacohfOGBXxO86UDMcXnYxAgVjbfs/+2nztFZLYBjfjjNkAO29ceibc
 KMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=96awe59Bl1JmrEDLbt0RIPfUyUqBQm6nbi4HGeicux4=;
 b=dAeJoenWmczjdwpDZyFKrbeEb90ZnSsvzIlvSfu96x8fSqYmiNKftEN7tDNsvS6mA2
 ACq80jZfvPRsW88O5lccVwzQIpFZT5YIosZ8/HRZImM9HCioU0cmNCDqZb8VO6FWuLCh
 T5TVos40mklOn9ttMmIfdjt7r73Uz0zx1bTA6vhz++OVi7RDIJbY2jele8CL3eO5Z8Eh
 DFMxckKb2oKFfelYnuHo3nZPxd+JHFtBh0Ox3X8d5LDesYKLwwMGx334hATuoXj2So/x
 vVPlWMmvJFsQp2DwNfI7N6ublvNis7Jf8b5DfkNOFJozMvgsDsC+VWwKX8M6oZdTTxr8
 qELQ==
X-Gm-Message-State: AFqh2koGgxJ5+AzlM7Ga8fnnVu4vTr2hXbish+5pyFj0r9k2gMq55y0D
 eBcX3qUHdhaN1W8R3IkTn2oWww==
X-Received: by 2002:a05:600c:3d9b:b0:3db:1afd:ac36 with SMTP id
 bi27-20020a05600c3d9b00b003db1afdac36mr6977627wmb.32.1674203033493; 
 Fri, 20 Jan 2023 00:23:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003db0647645fsm1571932wmq.48.2023.01.20.00.23.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 02/11] tests/qtest/boot-serial-test: Simplify
 test_machine() a bit
Date: Fri, 20 Jan 2023 09:23:32 +0100
Message-Id: <20230120082341.59913-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: ldkoljHZPfOx

Slighly modify test_machine() to simplify next commit review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

