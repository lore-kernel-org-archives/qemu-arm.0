Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2822223ejb;
        Wed, 4 Oct 2023 10:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5z3HlgCpXrSf39vBGYVhhhE1zaleuegX60Ao7uwClGkm/dhPn1fb6tLMRlDZWIWHHKFJM
X-Received: by 2002:a05:620a:2116:b0:774:1c2f:ac48 with SMTP id l22-20020a05620a211600b007741c2fac48mr2857972qkl.45.1696441216627;
        Wed, 04 Oct 2023 10:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696441216; cv=none;
        d=google.com; s=arc-20160816;
        b=X5QdIQHs+6ZzPOHrX45UAiyQSP/5unDO0knT5m9LLFXNSRvyGyHA7u/Fj2uEY/m4zL
         YJWWfe8SgqcBj0A0YKhxKfhVf1d9t6pQ3sgA+ln/V9QdDVXrIAxiF/+0WInN7fD3ZRSy
         CNYi0x4MhI1EP++4yMgF/IyO7+bQWVaIrPIjeDMsQWEeQYccjuv3P7UbT5RHIzCplayh
         K1C/1FjQbk88yei5u5n/ndj/Xu2NMax9r9w7O8ZlFg+fGE3KT+wiR/8AFTz2AVXlzIma
         xP6HoJpt0gu2nVRNbeQy1yBqP6oKDZdfUYU9ah/EtvfzUd9Z1ZYcV0VjqBMVb8K4Zn7b
         q0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
        fh=8qiUTrAt8Z6J+jITn8q3RC5xQQwhIhm+3Dgt8vaKbR0=;
        b=lcJVuOZOyxSqmuJBIyDLe/isuoqNydEvrRvzzhnssMgRH/6pUBN09/WS1gfUpuuMu2
         EEhwWCBLf/zjQCqfApG5olNMnCeG5b2w3ars7OfIgjZ275Nh/r8zSZxI6YzI9K9Nx7rg
         hMpXmPYEt9xJcJ2uVqd3F3HO+dwjLbkuHy8RSo8yiLxnZS145jXIm+R9W/OgaSPwM5IZ
         JbNgZospsIotl6uV2G2KKM7J13HqqduQptNZo4Xlu7zWuYmPvuQAJWgXSnO+W2oP0aXM
         e9bQ+sBRa69lL+BmCAFiiXsxe1w2JG4TdOr0oQ7oT5VJdl3xPeTDlJNtxPYlqhIYF3te
         gRLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESdxJKxt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a254e00b00775719c51adsi1670080qko.667.2023.10.04.10.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESdxJKxt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qo5mY-0006vv-Kd; Wed, 04 Oct 2023 13:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5lN-0005lK-Hb
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 13:34:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5lH-0001M9-KV
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 13:34:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-405417465aaso493345e9.1
 for <qemu-devel@nongnu.org>; Wed, 04 Oct 2023 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440851; x=1697045651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
 b=ESdxJKxt0pIV9/8opF4/xCqE11XKvMbvHy9zLbfzYLJgakO+TFl68jjWNZc22r/bUe
 tIT9E2sJ3ujnZYE0FVx5O4tI1J33Z8EYK+agGatUlmOZIplHsURV4mc6pu3qg4iVxin/
 SGdNIHOEdoySQADNEUtJVEEbAwRPWEnxPZisgEAXIcYl/GoKF/BZcXmIr0fY/dV5a6AL
 CstWAFa5QXAutDbvnh/NvL1jiXaNEA4LgQY6wMmYWU9bjyIEDe1REx4VVJ5BMzqDUEGJ
 Ko7YKvV6649bzuphft2UUKVCGszBL4Z1cUgOqysqc2FRRverNFXkBATtFazQu86VB+x2
 Nnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440851; x=1697045651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgzZrOytqrUApWTqn24h2uNs6StZKBnGHRMADJvQBG0=;
 b=kd2MhOSaf88lw8bXZWNJgLOub3hsXyUBbYzk2F5g0MFWy4m/oTuI7xBF/XZstykKxl
 p1Al0qckWoleoDN62HY2pmiu+UteEzsbc17TBHSe35qqQd4FzBj6rhPY5ig6PgPTdFYH
 cJIzSUF9Tetn+s39ywQz7rw57VhixkfbTBjqAG1D+FTzTBBKsMXTke4GUwq9wMsQcTqP
 wB/VLQBaUpXe0mXvvikGdo39toyQqKUfYyYl5/aiAqlJXn6HeeJhD/q25r5xPP9nvDQH
 UDxS2Vxt7f1V7KuXGGjZlBmx6NXhknFPVeD/+AO2WtAjLZJgUDyE4wqzpCfqVeQlaBMh
 VDlQ==
X-Gm-Message-State: AOJu0YyEVjjkhG4sIsNpH/61/+QIqelkAH4tF6sl9tiPV80NJFwWj89C
 Jj2GmOwzC+b1uhPrJMcpgHHdw4xACPbaIxhaizQ=
X-Received: by 2002:a7b:cc8e:0:b0:401:38dc:8916 with SMTP id
 p14-20020a7bcc8e000000b0040138dc8916mr2831246wma.10.1696440850986; 
 Wed, 04 Oct 2023 10:34:10 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d4a47000000b00321773bb933sm4520859wrs.77.2023.10.04.10.34.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:34:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 19/21] qapi: Inline and remove QERR_QGA_COMMAND_FAILED
 definition
Date: Wed,  4 Oct 2023 19:31:54 +0200
Message-ID: <20231004173158.42591-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: ip7j56L2jcOG

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

