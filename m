Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp920111ejc;
        Fri, 20 Jan 2023 00:25:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtpL6gKnffwW/NvTXuiJt9t6Za+PEZGu6Q/gGfVtr3tiN7Bts6czZuk5GvySVOQ3gkE07bY
X-Received: by 2002:a05:6214:5d82:b0:4c7:7237:76ff with SMTP id mf2-20020a0562145d8200b004c7723776ffmr22550298qvb.42.1674203142294;
        Fri, 20 Jan 2023 00:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203142; cv=none;
        d=google.com; s=arc-20160816;
        b=ORZOlutGm066+9OXDmjLskmGQJQLud9yl6hIdT2vxqZihjVQdhX7muy6phxwXhTpLj
         I7rgU+lcgSRcaRCUrVdX2LRU9vxP0uOWbouHZzu6MkG49LbgkCHj1KkkXBBcg1pUo7pl
         m6clDQxA3zLfIxR4xYkrviLSjxGnHMT1owhLJk0vxAuVrz/moVpnL0eFd+ftXUAiabTJ
         t4CAiWOfe3wFGny5/2UCpkhd1sO3TnMusHVwFd13MiLoGtQAy5SUvuG+s8zuFotbVKDe
         Q43XzX5N75jBYGO1PqURASme49xLeuLOY5X3w6f6kKVJyFLlpmNlFRybPpYqxPaL1tUq
         2MVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lFLQeKMXh/hwQNy/OTcwcNWvQl29Jep2/8SFzcZ0GJ0=;
        b=viIsdZsPR1GFtk6p0LBuyWYCWDYgVlS8T8/1RKWGdkxSfhVsaGeoPE+CdPYeolOvkx
         oOIEMZn7IpClnzxpskH3RRFPATR4s6/vs91gsHdjsXmlFlqvzDeh5tlxuuQhYch71lVR
         Qk33cl26PPTP2aQ0aC+9jnjB7CEv3fEDy8Qif7S+ORZr9G81KO9VGAwsuQ9/yOp9hXru
         a5cG60tn0D1amQIc3aSwaSXLRQArDVgVCKaPHLiOngo0ILTVyxPTr7OcsjW8zEyA+l4x
         9zpvmXv6V6fxeTlj33YjI8CdOJ/ZU00P6Ci1lKWeqW7vPUK8Mt7chG1iYC/nmSiQxany
         QZ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF5pz5Ep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv10-20020ad45cea000000b0053489f8a4e8si13123552qvb.376.2023.01.20.00.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:25:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF5pz5Ep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pImhH-0004tm-Ua; Fri, 20 Jan 2023 03:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhG-0004sL-Sl
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImhF-0004er-By
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 03:24:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso5272144wmc.4
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 00:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lFLQeKMXh/hwQNy/OTcwcNWvQl29Jep2/8SFzcZ0GJ0=;
 b=IF5pz5EprsFwFttDnqA4mYpz1vqAulCqFdgm1415c/oQai+BOzDMRJ+lSz+uQSveBj
 GtzmEx/uiLWnAmp6lWJkD3OIWcKGplUAWSNz7WAs1r0Euw/ZNmRkIePLJybTW1YSvX5k
 AZhQbrcZ+lAxtUR372TG6VIZ9hwEJPWg0Apml16OxxQ1UDE5m0nZ6yyLR0aM6HOg1Yjw
 lEuzCwKmXxbPnKoQDE+LmtqJWR4KfOwV7QU9ePwYV71SqUCOLhVUNI8G/XpsgQAbmX9z
 CWrymwzf60FnSeRQP9q0Eg106RlosCXMD+KUmvsbeWwSaUveM3QwmR8LOIvzSBrSAPb3
 eeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFLQeKMXh/hwQNy/OTcwcNWvQl29Jep2/8SFzcZ0GJ0=;
 b=Wz8Kp/yK7ocbfJutF65Q+aKCz5erKLCDJMs9i3rtJuCpzGn2mMuCcMDtxM3I16T8LD
 LvYOIZXLmeX2UhPVLSFpK0P52ptvnG1l4UOY8Cp0E9FJ2Akne/cOG69ztJ2Xfq7l9cib
 7olD8JMYRPAu0/6aQfjCTDgLBXuah38w0329Upjz2WtQUj5twGjYndPzKpworOOg/Ctr
 ziC2MDnZ4RNtv7iZdViK3YTLPnYWsS61ue8bSRvmrtMfIRiRWkJ2fliL7k4DB+PP0M2D
 cvIvBSe1Rl/nI0xLs1bHPXVd3wOIHbADipbh9ogt/bwYpEJ+kjUB8Z2rEnjU9nct4Ash
 9qfw==
X-Gm-Message-State: AFqh2kpLWH2EZCfSpIsmQlhkoJOUUZun9NVqBp4hGwLEsyyRvDMbvy+W
 4Ra6ydTHwcXF1e29YtvFXfmKJEgipdC/s9MX
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id
 l5-20020a05600c1d0500b003d23be42d9amr12725435wms.20.1674203063879; 
 Fri, 20 Jan 2023 00:24:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003d96efd09b7sm1731671wms.19.2023.01.20.00.24.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/11] tests/qtest/migration-test: Build command line using
 GString API (2/4)
Date: Fri, 20 Jan 2023 09:23:38 +0100
Message-Id: <20230120082341.59913-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: JBmoZ34oBlRx

Part 2/4: Convert shmem option.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/migration-test.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9cdef4fa65..670097a956 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -588,7 +588,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
     g_autofree char *bootpath = NULL;
-    g_autofree char *shmem_opts = NULL;
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
@@ -670,13 +669,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 
     if (args->use_shmem) {
         shmem_path = g_strdup_printf("/dev/shm/qemu-%d", getpid());
-        shmem_opts = g_strdup_printf(
+        g_string_append_printf(cmd_common,
             "-object memory-backend-file,id=mem0,size=%s"
             ",mem-path=%s,share=on -numa node,memdev=mem0",
             memory_size, shmem_path);
-    } else {
-        shmem_path = NULL;
-        shmem_opts = g_strdup("");
     }
 
     if (!args->only_target) {
@@ -685,12 +681,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
                                      "-name source,debug-threads=on "
                                      "-serial file:%s/src_serial "
-                                     "%s %s %s %s",
+                                     "%s %s %s",
                                      args->use_dirty_ring ?
                                      ",dirty-ring-size=4096" : "",
                                      cmd_common->str,
                                      tmpfs,
-                                     arch_source, shmem_opts,
+                                     arch_source,
                                      args->opts_source ? args->opts_source : "",
                                      ignore_stderr);
         *from = qtest_init(cmd_source);
@@ -700,12 +696,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  "-name target,debug-threads=on "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
-                                 "%s %s %s %s",
+                                 "%s %s %s",
                                  args->use_dirty_ring ?
                                  ",dirty-ring-size=4096" : "",
                                  cmd_common->str,
                                  tmpfs, uri,
-                                 arch_target, shmem_opts,
+                                 arch_target,
                                  args->opts_target ? args->opts_target : "",
                                  ignore_stderr);
     *to = qtest_init(cmd_target);
-- 
2.38.1

