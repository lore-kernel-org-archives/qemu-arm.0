Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp919562ejc;
        Fri, 20 Jan 2023 00:24:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsbTgjOZYDs6mDPEZzvu6/Y5tSL7eKlM7J1O5qvWMtXMF+C307JN85bB619YkKmTG5qJUQo
X-Received: by 2002:a05:622a:1b25:b0:3b6:9d64:a3a5 with SMTP id bb37-20020a05622a1b2500b003b69d64a3a5mr757579qtb.43.1674203067619;
        Fri, 20 Jan 2023 00:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203067; cv=none;
        d=google.com; s=arc-20160816;
        b=Fh0iXveXEmjg/01WNYYd2xOEeaMkwqEngc1z29Iymbm0Mf7A7Og2WwrPNFyvqUf6o/
         jNPbnSQ8eIldAKQDZJ7VAFOhBHnh8IWKvd8t6+821KOUh1BKCDSo7xy4giTSSw61tMSw
         wBlgYeKQUeFYPSxPerXVr/kyw3+/lFqA7mf0kebGyqAYbnGQZ8l4/KJxqIKLEMTwT/bQ
         KczV3rlpqQlGqsBUOeW4y82YcoXnChcjqZrduFF9XaNAV2cybaxzBAVifDeM4Mr8L3fj
         RSUv2/4B2+tpBha2L9dCiuZisQCIP5PC6eS53uPEr4LHDU5bVhx4O9mNlcIOSGqXzW//
         kfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1A5XESI7TZ+yAtbO2UTL/bHexDg6E6J3DUKnc81TIsg=;
        b=S0Q8c0dbvBP2P96H3cNQPEXlDC6a1l0p5IiU54G2PLoUwHBDGTop4sQYnfucr5JfLa
         gfe26JO61ABuZ0yy6bYM4r1HbhG20UCp3hMcL3rGL3S7eqNcNj3myLkXEn/Ob1SJxAKH
         2lI4KMmkd6qAOl7v+iJqmnFMbjrAEywMg9bWU2F8+mTUsss30q7kdSv3oZ2cw/w66LHn
         vxYmT5EDRYQrYBCbIZdYbwB53YfBlLuRmkk3iSn2rhWerdtSVgaR0Iqn3EA9Odp+ENGz
         SKZ8rAhClHbxFDv3mzUSBKxs0qRtd4Ut4Ek/WFD9o7ym0dgxPsRnyME0zuaMnmyZr23g
         tnAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sij4FTf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey14-20020a05622a4c0e00b003b62c493e72si8327646qtb.648.2023.01.20.00.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sij4FTf8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImgv-0004hX-Tq; Fri, 20 Jan 2023 03:24:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgr-0004gM-EK
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:02 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgp-0004aS-Ry
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b5so4181192wrn.0
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A5XESI7TZ+yAtbO2UTL/bHexDg6E6J3DUKnc81TIsg=;
 b=sij4FTf8IkBYLrd8CAQVgE2UQ7XoNGnRjyz4CuHxqJ5axll55NYvvPM++dJGCBMbW7
 gQLLsZ4bjPl3pTq7+7ASYx7fZ2tWD35dIhf4w1QqU0eaqdpWdun/3DrDEypBIDcb9BNE
 dzuVHpYP5D+toXTbos1pgLwNQLlz9hZMpRwcE5SDOFUwPPDqvPfyLN1Gg/Kahpxnvw2Q
 rWh/nzhKEo61zV/Y/lDcbo+MlsyVSsDOXkoCqDYDiIJq6TrN0IBwIo0MJw9QmLm9+eH4
 bAgSHRwY5yIg+BGbTBuZQpP81fhAeRFcwJBH5woEBNuZtH881ww9zI1xkcYfs/xMOZEV
 WGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A5XESI7TZ+yAtbO2UTL/bHexDg6E6J3DUKnc81TIsg=;
 b=miDjhKBknRwJa+8ERZ5Ae3+eLBDtdH40dXluGCh2LgNgvN822qCICqbI082fmO7d1R
 idmit8hsTs1bFy7ElnmbE4V/JJme2GjyyyBP8IDnXP5ByZs5WS/p2ql3DBBMEme6a+h1
 DCOSrT/cwSej/Y01T7lcfREB8dtyP5GLuCYLxj2uofL9R8BGn3ee7NxxztouSIGTj/TS
 ZKSXu7flS8vpU/54iZmOmD9umGxQtNmrSGF0FPF7CKjefWRZbbrL5J/B951S3/nC9HZr
 bqYIjIQDQiCz4a8fd0sbnuQc4/H4rRj3T4pU+TMXz/K1JgynZz8Z0KcQsER9TA5dMeoq
 nBSQ==
X-Gm-Message-State: AFqh2kqYSCdX6SZk6oPrsm3raIRvxmRzJZ714Lxsz+xCvirZ7KUBDCpn
 AZDioKvsdTNdbAKc6nCAuK5YBw==
X-Received: by 2002:a5d:4842:0:b0:2bd:eccd:7ea4 with SMTP id
 n2-20020a5d4842000000b002bdeccd7ea4mr12256356wrs.47.1674203038501; 
 Fri, 20 Jan 2023 00:23:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm26774409wrm.108.2023.01.20.00.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:23:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Date: Fri, 20 Jan 2023 09:23:33 +0100
Message-Id: <20230120082341.59913-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: JUFpx4KgpUQ6

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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

