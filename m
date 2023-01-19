Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp389529ejc;
        Thu, 19 Jan 2023 07:00:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/W4GH5FmIYFtXO1gaHCLSZoMAOuqwgiT2BW9uSd0lLnJ7895ZHL1OQLjkLqVsPD1oqVjA
X-Received: by 2002:ac8:44a1:0:b0:39c:da1f:f817 with SMTP id a1-20020ac844a1000000b0039cda1ff817mr13792214qto.61.1674140408388;
        Thu, 19 Jan 2023 07:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140408; cv=none;
        d=google.com; s=arc-20160816;
        b=Vj3uO4GaNldaG8pwrPJBrGanSizXUZEMUkQA6odr+GRRpJteqgIsQvDpxm2MzzjePn
         KmRPAhK6sPT+O1aru/YZ8c5PtZTZFRUprkX3nsE13k7eGOGdGyWQ/oRJ0VIrxK06zVr9
         H+zcI3xGDwU3mxamsqFhWwNhxLkF2QZV4xP0CSTjQLu4o0p+UEeT5GXhvhlVDnwA/wZG
         3/sGlbB8qbNyUKjAktIWzJr+/aos0nFI3pIvOYfLV16FP6j7TepDG1CXwh8cdf7EXPth
         NVHgU/heMVYnhisS+0yAcwsZFGMPWBB2wZAp/LVXXGMs3nCRXH/02vmsmE+9rGUufpqd
         oIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PDdmGNe7wNRYvz5eLda5xFcX55ORUlYvsE0xP8qQXTc=;
        b=WafaZFwAUys7ZHBUWvts4oq4dBpbCBMQNaZGlGYZjT4NMZqe2C2wRPn/swdSbM8XbR
         l0fmVHZ2ddAMW5e//jAMnSUouS93eEVTKCiuENxrcYVg7/0dtH99RkPwfsA7Ew6tHpzE
         hO+22YqnTR4jjFV286EHCAMNiI/4AkFZHEvpHZqRlXTsqpAex8KtEKgyF70WEfO8C9Lk
         jJGMtU2HbYiFPb60yvFoNtG9yoGASqXzFr6X4jWQwcdGs6AydAbzp8eILK4KQw3d6WUr
         FQXY88kBaro633ng6I8voz9GAS8THtV9gz2GpC3s6x4wU1Ha92C+PWxS/36EptJYVJfc
         BHPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zw4gwQNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br23-20020a05622a1e1700b003b62b4723fasi5391474qtb.522.2023.01.19.07.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 07:00:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zw4gwQNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWNt-0006aL-ND; Thu, 19 Jan 2023 09:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNk-0006K6-DW
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNi-0003XB-TZ
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:59:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id b7so2145473wrt.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDdmGNe7wNRYvz5eLda5xFcX55ORUlYvsE0xP8qQXTc=;
 b=Zw4gwQNr5o6Kb1CTDQ2lJ/6L0sQSdoltMXeOQROzc/aazNjlkEAqvKsWcMnNpJYJ5m
 Q2noZCyj+jnrdU7FmX40hp2CwcDCpYjNXFPLuO/AqWWJ00rc9+JQJVAA1JMjB/MbaET9
 9CWFwCArBV3FF5gUGtva/tfQymhvpRzHopNe+ibfak+7OpG2nd7iY+pBCscDrdlXWCtn
 lKvZUwtCdOj30zgVwPJzS79zlzUJIxUVTlSKC716vtb9jQ46sUDkEK7wTAEtvzgr+8EQ
 t8pWA5fO7MOBla4mMdaJgPDKUFXR8Rt1rQ88lb6GlPkUM3e1ZhnuppiKngGXXJVlbwVZ
 575Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PDdmGNe7wNRYvz5eLda5xFcX55ORUlYvsE0xP8qQXTc=;
 b=m6W9QfSVJ1IhSWGceS7oDcGjsVa0+W0g8eH2OnW+14BmECgTR84spnnw9HaSD8Ms7C
 aXQgt5FwPbMmvOhoDS3W8/mMf9UDdkBvVHC5U4D4Vgjnfk60vdFGcpSUGL5zSHynw1YT
 AvMyvBjaQfuVZ5sHGvlHokaZ1diK8LCc4stPk5jmAVaB/demzH6MgRPzUPnDt118Vfra
 InkaoYSDCLNBlbG80USXXE4eSeAG91Sb3ZpOFdZVJe9qxMIW7sKdQBd/Ra6FJRv0+7kr
 YDyA81JqJ97mTIvNdkxXceQJqohPcOYziRi+mmVlagYtftgWktLACQ2ppDpHJkmDLtF8
 irRg==
X-Gm-Message-State: AFqh2kqeRA8ustvwG1Mg4PLG/IpzenwNkk7j/a2gb2bY1Xo3tVj+gbQB
 Od5KW9exbb72N3DPEZ9KkYbWIA==
X-Received: by 2002:a5d:5955:0:b0:2bd:e87c:e831 with SMTP id
 e21-20020a5d5955000000b002bde87ce831mr9074190wri.69.1674140350266; 
 Thu, 19 Jan 2023 06:59:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4cc8000000b002bdeb0cf706sm14689922wrt.65.2023.01.19.06.59.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:59:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/11] tests/qtest/migration-test: Reduce 'cmd_source'
 string scope
Date: Thu, 19 Jan 2023 15:58:33 +0100
Message-Id: <20230119145838.41835-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: QfidmE/GEeSZ

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 8beeda4686..6c3db95113 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -584,7 +584,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
-    g_autofree gchar *cmd_source = NULL;
     g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
     g_autofree char *bootpath = NULL;
@@ -672,20 +671,22 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
-                                 "-name source,debug-threads=on "
-                                 "-m %s "
-                                 "-serial file:%s/src_serial "
-                                 "%s %s %s %s",
-                                 args->use_dirty_ring ?
-                                 ",dirty-ring-size=4096" : "",
-                                 machine_opts ? " -machine " : "",
-                                 machine_opts ? machine_opts : "",
-                                 memory_size, tmpfs,
-                                 arch_source, shmem_opts,
-                                 args->opts_source ? args->opts_source : "",
-                                 ignore_stderr);
     if (!args->only_target) {
+        g_autofree gchar *cmd_source = NULL;
+
+        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
+                                     "-name source,debug-threads=on "
+                                     "-m %s "
+                                     "-serial file:%s/src_serial "
+                                     "%s %s %s %s",
+                                     args->use_dirty_ring ?
+                                     ",dirty-ring-size=4096" : "",
+                                     machine_opts ? " -machine " : "",
+                                     machine_opts ? machine_opts : "",
+                                     memory_size, tmpfs,
+                                     arch_source, shmem_opts,
+                                     args->opts_source ? args->opts_source : "",
+                                     ignore_stderr);
         *from = qtest_init(cmd_source);
     }
 
-- 
2.38.1

