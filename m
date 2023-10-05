Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70611ejc;
        Wed, 4 Oct 2023 21:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG97/lwZ0Axz1JSjK1fEfS/abZVM+4R05JUhjfMQjJDj6xvU0btgLxNYkJsvQwEEbJOLUmf
X-Received: by 2002:a05:620a:1a24:b0:769:89c8:4fae with SMTP id bk36-20020a05620a1a2400b0076989c84faemr5612788qkb.52.1696481665537;
        Wed, 04 Oct 2023 21:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481665; cv=none;
        d=google.com; s=arc-20160816;
        b=fm6o0JSsngU+KUAVTgzx9qAODtyO+9lA+/D+39uB8lpktDP0gdLIM1jd9amI8DQgDY
         +qcCOihoULz/Zpy3zI9+G5WFoTPUp+/vnjihVmXtXUlznMU8LIDJ9Qh6Zju1IDq+L6qK
         jOvpql0XSHCRqYGJvvcvRTruVWDeKAjYzkdGFTru2NEKe4zvGVgy0J/5QCSJTwwk31Yv
         Vdx/Re9Yu61PfqdxDiy8xizDXPl67E/8ndK+iFVUuzc+0oHVHEAMVcR1EBb2L3b1DdCh
         7gIQJC3cBqmfDsAJhaQskTTcVuduFKch9iobikXuXBS15sJFaFWyINvdepkYegXAKda4
         2WTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
        fh=ZoAjrgjP1RJGSa9RP9dEtrBjzoYOJeMjdGtN7WHGfK4=;
        b=G4JhHhITRBsP32AOk8RIDAWOMu4m9gjLaKM2kHgrmiFRE7lfJcLFx0tL9KXKA8jWT+
         mwYSViJM2PeFk10VQwqp3Y3ZntQHIxF5LxI6thZeoqCrNwJQ+LDLp2basyqOR15FOrzU
         xjyoLyIntKedNyD6/nQn+L9TD6kmTv6WFXuDnBATWr1dAUeamEvJjZzn9ULgxcwOQ7hK
         P5z0aB67j6wxcsuoEChJTCHDx6/KI7BE7gyhLkKnMjUQK/PPAQ9Gjke2ibuggC6Z1sST
         qAWY6NnIjdFiKpCtc2fu9SPacyfBk2KKdHG7T+0JWko6aHBnEh1baoOQsn39Bm9/XI3R
         uYTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6N156Se;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020a05620a240b00b0076ef3e972d8si425647qkn.201.2023.10.04.21.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6N156Se;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qoGMS-0001Al-Kq; Thu, 05 Oct 2023 00:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGMB-00089S-AN
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:53:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGM6-0007iG-S4
 for qemu-devel@nongnu.org; Thu, 05 Oct 2023 00:53:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so550344f8f.0
 for <qemu-devel@nongnu.org>; Wed, 04 Oct 2023 21:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481576; x=1697086376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
 b=r6N156Se1kVQOmjFZjLRcDk/AJgw0EhnC+gTgib438FetR7fQ1BzwJdZSKZuet4Tn/
 EhYcH1o2r12itPsn5N/exjqUdG0iFndsouFw3Q43MsFtA+Np8DuvomaBq5c9ivP77aMz
 /7Q7acpc84rxTYCDpiaE69ePYPODozTXSRSJVYLFXHsg6oq1wCG7ijMaNdaTbb1ZR9RL
 bod47kt1I0KJONzBOB8O7rvK5w+3UOxDNkUb4sg2qtkUBGX9l+ZHsssir4v4cWT4r1Cj
 Du50LDAXUTkb0AHxf0Ijmkvfh+0qEEL4DrYUzp6W6yP3aZ7XZIONSWrcx2uCB5hi5ZhD
 DQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481576; x=1697086376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
 b=DNRH9hIyvSLFvrG/4ESbgQUtuV2C8UNWJ+4Nw3emVJ24gISK3h73IJOQiPfNrWreXu
 HhG9IZugkl/735m7gAmTv4IIYx31M+/Wz+co20OLFV6MwcphhnGx9B6TBHGPTWD6nyki
 SYI54KWI4Ya8j7IpEoOQjgKWcEd+yyXQtr3acJO3YJckZEWaKjKr1QgRzyJzOivCjRmW
 wBJC01rVYtVXGkNXMNQBmzAl6ifrpZf/gNYzQnxCpFJQ37Q0hsF6Rl83ffCEE1wSjQ7M
 rDS2cJt6L1WxL77JJWT16aW5nxobG3rYusvJhBNV/ctj2S3EFOLyu4hZMv6mRyvRqGXC
 04Mg==
X-Gm-Message-State: AOJu0YzSQIJBCoDmen1/X387+Xq9MRI829bxe8xMWaHejNHuJ/63zOiA
 mYbbXFnP/vsUhQshx1p8ZoWd+d1ACuOmKnnU5ow=
X-Received: by 2002:a05:6000:118d:b0:31f:98b4:4b4d with SMTP id
 g13-20020a056000118d00b0031f98b44b4dmr3699522wrx.42.1696481576065; 
 Wed, 04 Oct 2023 21:52:56 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 g14-20020adfe40e000000b0031980783d78sm748747wrm.54.2023.10.04.21.52.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:52:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 20/22] qapi: Inline and remove QERR_QGA_COMMAND_FAILED
 definition
Date: Thu,  5 Oct 2023 06:50:37 +0200
Message-ID: <20231005045041.52649-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: W1pp7QNV6xo3

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using the following
coccinelle semantic patch:

    @match exists@
    expression errp;
    expression errmsg;
    @@
         error_setg(errp, QERR_QGA_COMMAND_FAILED, errmsg);

    @script:python strformat depends on match@
    errmsg << match.errmsg;
    fixedfmt; // new var
    @@
    # Format skipping '"'.
    fixedfmt = f'"Guest agent command failed, error was \'{errmsg[1:-1]}\'"'
    coccinelle.fixedfmt = cocci.make_ident(fixedfmt)

    @replace@
    expression match.errp;
    expression match.errmsg;
    identifier strformat.fixedfmt;
    @@
    -    error_setg(errp, QERR_QGA_COMMAND_FAILED, errmsg);
    +    error_setg(errp, fixedfmt);

then manually removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h |  3 ---
 qga/commands-win32.c      | 38 ++++++++++++++++++++------------------
 qga/commands.c            |  7 ++++---
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index e094f13114..840831cc6a 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_QGA_COMMAND_FAILED \
-    "Guest agent command failed, error was '%s'"
-
 #define QERR_UNSUPPORTED \
     "this feature or command is not currently supported"
 
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 946dbafbb6..aa8c9770d4 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -245,7 +245,8 @@ int64_t qmp_guest_file_open(const char *path, const char *mode, Error **errp)
 
 done:
     if (gerr) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
+        error_setg(errp,
+                   "Guest agent command failed, error was 'err -> messag'");
         g_error_free(gerr);
     }
     g_free(w_path);
@@ -279,8 +280,8 @@ static void acquire_privilege(const char *name, Error **errp)
         TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &token))
     {
         if (!LookupPrivilegeValue(NULL, name, &priv.Privileges[0].Luid)) {
-            error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                       "no luid for requested privilege");
+            error_setg(errp,
+                       "Guest agent command failed, error was 'no luid for requested privilege'");
             goto out;
         }
 
@@ -288,14 +289,14 @@ static void acquire_privilege(const char *name, Error **errp)
         priv.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
 
         if (!AdjustTokenPrivileges(token, FALSE, &priv, 0, NULL, 0)) {
-            error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                       "unable to acquire requested privilege");
+            error_setg(errp,
+                       "Guest agent command failed, error was 'unable to acquire requested privilege'");
             goto out;
         }
 
     } else {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                   "failed to open privilege token");
+        error_setg(errp,
+                   "Guest agent command failed, error was 'failed to open privilege token'");
     }
 
 out:
@@ -309,8 +310,8 @@ static void execute_async(DWORD WINAPI (*func)(LPVOID), LPVOID opaque,
 {
     HANDLE thread = CreateThread(NULL, 0, func, opaque, 0, NULL);
     if (!thread) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                   "failed to dispatch asynchronous command");
+        error_setg(errp,
+                   "Guest agent command failed, error was 'failed to dispatch asynchronous command'");
     }
 }
 
@@ -1423,22 +1424,22 @@ static void check_suspend_mode(GuestSuspendMode mode, Error **errp)
 
     ZeroMemory(&sys_pwr_caps, sizeof(sys_pwr_caps));
     if (!GetPwrCapabilities(&sys_pwr_caps)) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                   "failed to determine guest suspend capabilities");
+        error_setg(errp,
+                   "Guest agent command failed, error was 'failed to determine guest suspend capabilities'");
         return;
     }
 
     switch (mode) {
     case GUEST_SUSPEND_MODE_DISK:
         if (!sys_pwr_caps.SystemS4) {
-            error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                       "suspend-to-disk not supported by OS");
+            error_setg(errp,
+                       "Guest agent command failed, error was 'suspend-to-disk not supported by OS'");
         }
         break;
     case GUEST_SUSPEND_MODE_RAM:
         if (!sys_pwr_caps.SystemS3) {
-            error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                       "suspend-to-ram not supported by OS");
+            error_setg(errp,
+                       "Guest agent command failed, error was 'suspend-to-ram not supported by OS'");
         }
         break;
     default:
@@ -1971,7 +1972,8 @@ void qmp_guest_set_user_password(const char *username,
 
 done:
     if (gerr) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
+        error_setg(errp,
+                   "Guest agent command failed, error was 'err -> messag'");
         g_error_free(gerr);
     }
     g_free(user);
@@ -2180,8 +2182,8 @@ static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
     HMODULE module = GetModuleHandle("ntdll");
     PVOID fun = GetProcAddress(module, "RtlGetVersion");
     if (fun == NULL) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-            "Failed to get address of RtlGetVersion");
+        error_setg(errp,
+                   "Guest agent command failed, error was 'Failed to get address of RtlGetVersion'");
         return;
     }
 
diff --git a/qga/commands.c b/qga/commands.c
index 871210ab0b..936634c50a 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -475,7 +475,8 @@ GuestExec *qmp_guest_exec(const char *path,
             guest_exec_task_setup, &has_merge, &pid, input_data ? &in_fd : NULL,
             has_output ? &out_fd : NULL, has_output ? &err_fd : NULL, &gerr);
     if (!ret) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED, gerr->message);
+        error_setg(errp,
+                   "Guest agent command failed, error was 'err -> messag'");
         g_error_free(gerr);
         goto done;
     }
@@ -586,8 +587,8 @@ GuestTimezone *qmp_guest_get_timezone(Error **errp)
     info = g_new0(GuestTimezone, 1);
     tz = g_time_zone_new_local();
     if (tz == NULL) {
-        error_setg(errp, QERR_QGA_COMMAND_FAILED,
-                   "Couldn't retrieve local timezone");
+        error_setg(errp,
+                   "Guest agent command failed, error was 'Couldn't retrieve local timezone'");
         goto error;
     }
 
-- 
2.41.0

