Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389345ejc;
        Thu, 19 Jan 2023 06:59:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsfzX+YTXh6iXV13g9GoYkkUKxDnroebeQFBkwGiYIdXsnG4zyIeI0OYlKSQ/KvDl8gPz7J
X-Received: by 2002:ac8:70a:0:b0:3b1:c477:eb65 with SMTP id g10-20020ac8070a000000b003b1c477eb65mr15391561qth.60.1674140392543;
        Thu, 19 Jan 2023 06:59:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140392; cv=none;
        d=google.com; s=arc-20160816;
        b=E2QD7Zk80L0/Un2glCaG6c/o4dI1Ft9gI18Bu+W48GRdRgV0oDVUoqs764mF8ChtEj
         e/B/cr9qX8XEktAA4Nt5uK1sm9Big7CzJ6LkhPfAQRjfnmJCuId0S+YTfUl7OB7j9vCZ
         v9FXxx+7iQ/BZR9k8HDSIopvWVH6ZCzsjqeUYTCGUYuDNJ2a7sPDRDuzo+aWqb3zkE/x
         A3KRcuCjhvvehATg+R9euNimEF6ZYds0btCh1C2wcbr7NmIzgKMszxMaL6BwuhNbuTSf
         CRf9/+Bky23Wfc86h7kGxXP083mMUXKx7pXSb0jGPoxt1jVoj89gK7tk21lDW9XMRAWr
         4gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PHvSg/mQjdmpWjiVzZNybtfs6HzFLrJQQgtlLJ8QVaM=;
        b=kROcugybG3wyt3PcNTCmZn/5KcVk5IcwlrtnRpS9QnBLRmPOryzMJvp4cRHSi41wv4
         rmXb6Duta+W0fB9KnefOsihZ0BbthLAdxaHh+lolirRSef4YnI+oEJGh57R+RG19TqfY
         hFSLFpjh5mjO9lE+TS3sDI4dMPcz/YuQdVtk+EKiCYzz927b4i0h7F7q3huTtkIhO/xl
         AB1iF0EY/xReBJ9XpPndqxB1nNLApdWGTFFIwvNY6ohuzuLILkwKbzVHdHaWSbj4qmRv
         aTTug1C4q0dddFhC0XzLWT+BNVe7OA5ywHdbb/Hm2mUzYyZlK74zHJV/bNijobUisq9o
         Kpkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=grtJredg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl11-20020a05622a244b00b003a8271939b8si23913597qtb.238.2023.01.19.06.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=grtJredg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWO9-0007rd-57; Thu, 19 Jan 2023 09:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWO7-0007nP-2D
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWO5-0003Z2-Hp
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so2114949wrb.11
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHvSg/mQjdmpWjiVzZNybtfs6HzFLrJQQgtlLJ8QVaM=;
 b=grtJredguK6Odurr8v7Nd4MFu1fynCqzad4KflFqBvCOvKX+FXGkUunlfMNyIT4oFH
 z16/A0Uny8/UNv/i6+UzFR38ZVcxLJm+VQ744tmpB1GFODIms2l9/odSdjaEp6g1rCAT
 XmlumW/NeuNl9QFTab9UKA3c4fWgpiEGg5laOQCB2BQ129FW7fnLQbpZJwqpL69XK27j
 kltJG7DG+qeDQKxf0NRoS5iOzpw387teTPKoc9NApqEw6Zey5WHbi5qJDtNoTEGxaJJ3
 yLyrxYYRjrnWuRAoxG+T+eWlp40CeRadvvxp39lGkM+VWDOChkTJyYfKsROvpm+1jI0S
 iCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHvSg/mQjdmpWjiVzZNybtfs6HzFLrJQQgtlLJ8QVaM=;
 b=J8MeR84kSo0VXxLh2wn1cgFrqTs1/Q5wgYCi1h4N1WAwxd4TWttdccv1eyaEz1T9BI
 nTpeyP+0GaQ45+OfG33ldvk0A+3ClPs7ZZ0vME8dBkovcumtb7vo6CarsfZwPxPOOnEW
 +C1Yi/2Bk+w7xWSl5txbzUopK5+yjDt2+yOu9M9OZ70+1m11oDGJfr/nR5dthWpZOi9b
 pGj6w0wK1lIRBe8j2Dli+/MSyzweij3PEkw8pwalD4H4UZG0no5+CKb+pjZlildU1Atu
 a4FyKRdWS8Lb6U/ecJy+aSklMt/jURM74be4XJ9MqKDcNgjRt+nSQSGlewixsvgmKtjG
 cRuA==
X-Gm-Message-State: AFqh2kr4UAcyk0Y910yRcgzazE730M4TNZnQmYcGhc6ZvPlwRT91Hfo2
 cGwqCCbftWAdMAnN9OaOF6y1hg==
X-Received: by 2002:adf:dbc6:0:b0:2be:12a8:9f75 with SMTP id
 e6-20020adfdbc6000000b002be12a89f75mr8304705wrj.55.1674140372843; 
 Thu, 19 Jan 2023 06:59:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adffe4f000000b002bdd155ca4dsm19683640wrs.48.2023.01.19.06.59.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/11] tests/qtest/migration-test: Build command line using
 GString API (3/4)
Date: Thu, 19 Jan 2023 15:58:36 +0100
Message-Id: <20230119145838.41835-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
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
X-TUID: mwPDXhnwedtq

Part 3/4: Convert accelerator options.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 8377b3976a..015b774a9e 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -603,6 +603,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     got_stop = false;
 
     cmd_common = g_string_new("");
+    g_string_append_printf(cmd_common, "-accel kvm%s ",
+                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
+    g_string_append(cmd_common, "-accel tcg ");
 
     bootpath = g_strdup_printf("%s/bootsect", tmpfs);
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -678,25 +681,21 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     if (!args->only_target) {
         g_autofree gchar *cmd_source = NULL;
 
-        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
+        cmd_source = g_strdup_printf("%s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
                                      "%s %s %s",
-                                     args->use_dirty_ring ?
-                                     ",dirty-ring-size=4096" : "",
                                      cmd_common->str, tmpfs, arch_source,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
+    cmd_target = g_strdup_printf("%s "
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
                                  cmd_common->str, tmpfs, uri, arch_target,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
-- 
2.38.1

