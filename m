Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389215ejc;
        Thu, 19 Jan 2023 06:59:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZJVRcbQ32O/zVW2EjscqkRFU4G+JyEVtgqA5q/upFJWq76dKsmRGFXCPVrbyKmIYV2b08
X-Received: by 2002:ac8:4787:0:b0:3a6:a43a:8ba9 with SMTP id k7-20020ac84787000000b003a6a43a8ba9mr15439455qtq.3.1674140381648;
        Thu, 19 Jan 2023 06:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140381; cv=none;
        d=google.com; s=arc-20160816;
        b=gdueBJiUcc4xcge+JkTddRmWVfbwhCuQaIjZQahJmAp0Dlqf/1uQno5vc7xzGyLbsG
         77SG28RWK2PEmeBCGU157seU+RB88NPQEB48sqooYkxN/4fwucjWeMi6geR7TfqJnjip
         78iPUDgAgt4Fwn0m3ZZ8uP3P/tXuEFl6THMq946GEjxCf+HinkJ7w9lThhYirsXAsLMv
         fvISV57pcbOfNlvjn+34uENBI/qZ1oo0PoLMtBoAQMLoKoU8G4Ct0xg7wLCw+PEd6e1a
         wbDf/psctSxunVsOnTMFezB7mgVzwi1wKe0Vb6I/O/Tai8hjfz9JtSwbjrb83NlrAIyI
         39Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=es3Dw8MLiqLXATzoVsMpPJx/0iri3aBMV7qIVLaAL/4=;
        b=k+GCAxo3hPbMm6J0gy4J6ZRopBEUtFYeImsBhUuzKWY13bzvwQMaodSdn0BGjJlx+C
         rx//VrbEwCRUjSona/1vAmZ8kVvAVSLoFpxERcTa2SlK5qDi6QWYY7x/JfXOk2kDJ7ke
         pDvy6LktaXJt4UGosrBsL3kl5htlelPcI/MWiVXju/pQzq7d+gxZukQkuOaukUi99zPb
         BRDATWjc3pJsmsg3Xcljdr1WeZ6E7xbT4CV6nn/YFaWlTJ9/xYG+WF/jZ5y9ggChQt3G
         Adp7aIqPLl3azPKA0fL3CYV+qpesfQSQlDPi6RYAoVvy5K78KVuiOndGWWR2VQPRte1w
         AN5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0S64k3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05622a000a00b003b62f0d1920si8083702qtw.377.2023.01.19.06.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0S64k3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWNY-0006DB-1X; Thu, 19 Jan 2023 09:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNW-0006BJ-Iy
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:58:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNU-0003Y6-Qo
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:58:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso2262638wmn.5
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=es3Dw8MLiqLXATzoVsMpPJx/0iri3aBMV7qIVLaAL/4=;
 b=s0S64k3YCGevc0R0oTZIH8fIMdDLMa6BHjCYopC0QoEYw3dMbRGT2SJkPn2oxAS29S
 5pgEK/hzdaM3N0gsH93FntPpHWRMX82EeqE0lCxAI2SPdHDeNVc58iPG0ZJGtvYelZop
 1BEuzraGBDQXNsM7Sw8QBMHAt/Edu+h1OKQ+0opkndkrNh9FEhRhJxq0zG9GZ0i9bJN0
 aXrxlghJiCzsjgRBeHAsDkyaGL7kHdiOmxUeVcENUvBEi78eTe4mo2Auw2gRm/0YBuqN
 M3G8d4NO7r6PG8vZU8QU8TGcGc52y0AlU/Ttjm4Xf92iyeI/wYYMlHcDYNTtlf1aEBRs
 jFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es3Dw8MLiqLXATzoVsMpPJx/0iri3aBMV7qIVLaAL/4=;
 b=taRr5FeTFsPRTNKqn9frobMq2l9SPweCYKLLZN+8BBrJET5FKzrZohzQUfqaVGtaQr
 +xk156Xq5PN9aTlIN/l3cW9Apb06Av9cLurxU/v1IQrFQ+gONfE7dbwipkAXzZflqQHi
 st3/3s0YK8FtAPdiFPxwfIasz/QO9bQJpFWMl2E52kGP3p7Kx2QKw6o7e0Rk9U/Vdwps
 oP0/E8//dwKMc4GPXNCtlb6qF3uEwBtEV2aXJA26XZZMpLvF0EXSd8s/y/T5A2JR2fpa
 lsArbr41KEH53IGP1iB2dX2slcQ1JP5lRNs4GFTcuRrySg2Ze0ZiEV1cGNeuLbg+5+q4
 GS7w==
X-Gm-Message-State: AFqh2krZ9g6GWqtDm5B14MOKpMsUBoAIhAPcdyTPSfUdCWFx9Ai+SEYH
 KDGWsXs2OnWkYNH/f7Ms2yftmg==
X-Received: by 2002:a05:600c:198e:b0:3db:1d7e:c429 with SMTP id
 t14-20020a05600c198e00b003db1d7ec429mr3422988wmq.40.1674140335259; 
 Thu, 19 Jan 2023 06:58:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c35c100b003db06493ee7sm5425204wmq.47.2023.01.19.06.58.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Date: Thu, 19 Jan 2023 15:58:30 +0100
Message-Id: <20230119145838.41835-4-philmd@linaro.org>
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
X-TUID: Dl0sJzsmzoWO

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3a854b0174..92890b409d 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -226,14 +226,17 @@ static void test_machine(const void *data)
     const testdef_t *test = data;
     g_autofree char *serialtmp = NULL;
     g_autofree char *codetmp = NULL;
-    const char *codeparam = "";
     QTestState *qts;
     int ser_fd;
+    g_autoptr(GString) cmd = g_string_new("");
 
     ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
     close(ser_fd);
 
+    g_string_append_printf(cmd, "-M %s ", test->machine);
+    g_string_append(cmd, "-no-shutdown ");
+
     if (test->kernel || test->bios) {
         ssize_t wlen;
         int code_fd;
@@ -243,19 +246,23 @@ static void test_machine(const void *data)
         wlen = write(code_fd, test->kernel ? : test->bios, test->codesize);
         g_assert(wlen == test->codesize);
         close(code_fd);
+        g_string_append_printf(cmd, "%s %s ",
+                               test->kernel ? "-kernel " : "-bios ", codetmp);
     }
 
+    g_string_append_printf(cmd, "-chardev file,id=serial0,path=%s "
+                                "-serial chardev:serial0 ", serialtmp);
+
     /*
      * Make sure that this test uses tcg if available: It is used as a
      * fast-enough smoketest for that.
      */
-    qts = qtest_initf("%s %s %s -M %s -no-shutdown "
-                      "-chardev file,id=serial0,path=%s "
-                      "-serial chardev:serial0 -accel tcg -accel kvm %s",
-                      codeparam,
-                      test->kernel ? "-kernel " : test->bios ? "-bios " : "",
-                      codetmp ? : "", test->machine,
-                      serialtmp, test->extra);
+    g_string_append(cmd, "-accel tcg ");
+    g_string_append(cmd, "-accel kvm ");
+    g_string_append(cmd, test->extra);
+
+    qts = qtest_init(cmd->str);
+
     if (codetmp) {
         unlink(codetmp);
     }
-- 
2.38.1

