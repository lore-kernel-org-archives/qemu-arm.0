Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A241CCAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:40:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0x-0004r7-VK; Mon, 22 Sep 2025 05:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czq-0002VO-Ka
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czD-0000fW-C1
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so40131435e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533844; x=1759138644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcPukW9mtIUHAUBp8jxaYoUAYF89W1SMYnteBY4oBnY=;
 b=m22+zmulqqKV1+4/jESIxTzHuJboLqMz0/h40d5HSPS2KtoTxG4pm08q44Q5NClz+k
 ovGZC38R4qwAjOnOMWHjcBaVLFYn71+Rhkf10T8rtVHGDushlCITNP9XYzBx+61eGinS
 sQc82UCIEKCeYaMuQHJdlUuQilRugMDlfz/xun2e+NaqYx7Pham4cnANA8J5Mkn8gaKJ
 GZuRPRFM9yJC34uXBv7uIXEUiEStZcD2iNiluSeIix5swGnSkk6o0VHwDhYwJ/XCB+OY
 cLhGZZUEZbSbBXbTF/jwPEiSOafl1nMb67Rz3sfyR7a7EHERUDreHFgmeF8UDWZiJPyg
 MqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533844; x=1759138644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcPukW9mtIUHAUBp8jxaYoUAYF89W1SMYnteBY4oBnY=;
 b=JVN8ibF3jqaYX7l1Y+KO0XXd5FTw+xsfJogrI3r8p9z6nWfkyFshJMVAegidKPb5wI
 TKeZoQ99QXgjX5LNi8DQpJ+gpPt1C82VvGo9IvZw+guVew7NGhXxc106+Y9/o3ThvRtg
 0h2d3r89E/CGUYxxLA3yX2EVmJBzqIZyVfrbL0mfwb1DaFjdw4Lf3PuKNSRS9ZcVL81U
 tbUZimBdZkNLhzpLCzMdzylhnELLIoD8avPWPFmtEKF5NArJE350yt5qBxiMgWlpM6oM
 gQ10sIwu3CKV0ShdcBZx7AENcMq4LT71Y/QOgO8ofFA/RHB9klfNH6Me02FKz1H5YrT/
 WFZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU39Qquj89/Az1uDZlv3ItC2RaLn1sWjhbtxnfsasEyFDpLYJvPBBqu/AZtg+00zB0HqdGfdKPYdQ==@nongnu.org
X-Gm-Message-State: AOJu0YxxwZWcExa5L4moj+usfSEEjxtlrhvYK/6Th6sASLE5NATXhXT7
 3eswJnok3hKcFN8h75aDK1XbAJki0Qv0MaYXgufG20N32BJ3ullYH4wafUKTakt4MRU=
X-Gm-Gg: ASbGncs/kp2OscOMHK3eokF6Vdd6FPp6p1PdXArhqKnA375xyyZrirk6P+94Ieneqwh
 Gdapt8QqNtbxECgOObZ4la2rl2a1ce4ahebpc6MLShs5yr/4FmiIuvaVzq9Uv8p5lxKOsBqs/Tz
 YK3pCNJZIQiUXWVKaiybWkWPXWlwm5jqxdjfbCbE5giTDZ4kQeHq09F1rp69apSQWtSle9SbT8Z
 kfj1rQ5wR4I1zhJ+2hh0nl8Uy0GLHbqnSuxNsaWMjUIdV7WJbXcw3l+YEPQN34i7MWP8kyhELkk
 rhph+GN3uo96DDHHqVAgOGdFpE0uj5e1EcThun/HxaWEvFTV36xBVArrT7Dy2JRt/u/5ADOnFAM
 2G1wx3pSDVDzpc5DYoASsl60=
X-Google-Smtp-Source: AGHT+IGsUBp1NqafwcbALwg7UwDN4rTjCYc92dl7M1piUEbdRsb5ea8yuyhueyCJpDcb+0E7dS+OzQ==
X-Received: by 2002:a05:600c:3593:b0:459:e398:ed89 with SMTP id
 5b1f17b1804b1-467e6b64adbmr110656125e9.1.1758533843575; 
 Mon, 22 Sep 2025 02:37:23 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee1227cc37sm17817268f8f.7.2025.09.22.02.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0112A5F9EB;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/25] semihosting/syscalls: replace uint64_t with vaddr where
 appropriate
Date: Mon, 22 Sep 2025 10:36:50 +0100
Message-ID: <20250922093711.2768983-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 78 +++++++++++++++++++++---------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index f072d919193..20f155f869a 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -22,7 +22,7 @@
 /*
  * Validate or compute the length of the string (including terminator).
  */
-static int validate_strlen(CPUState *cs, uint64_t str, uint64_t tlen)
+static int validate_strlen(CPUState *cs, vaddr str, uint64_t tlen)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char c;
@@ -51,7 +51,7 @@ static int validate_strlen(CPUState *cs, uint64_t str, uint64_t tlen)
 }
 
 static int validate_lock_user_string(char **pstr, CPUState *cs,
-                                     uint64_t tstr, uint64_t tlen)
+                                     vaddr tstr, uint64_t tlen)
 {
     int ret = validate_strlen(cs, tstr, tlen);
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -71,7 +71,7 @@ static int validate_lock_user_string(char **pstr, CPUState *cs,
  * big-endian.  Until we do something with gdb, also produce the
  * same big-endian result from the host.
  */
-static int copy_stat_to_user(CPUState *cs, uint64_t addr,
+static int copy_stat_to_user(CPUState *cs, vaddr addr,
                              const struct stat *s)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -128,7 +128,7 @@ static void gdb_open_cb(CPUState *cs, uint64_t ret, int err)
 }
 
 static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
-                     uint64_t fname, uint64_t fname_len,
+                     vaddr fname, uint64_t fname_len,
                      int gdb_flags, int mode)
 {
     int len = validate_strlen(cs, fname, fname_len);
@@ -139,7 +139,7 @@ static void gdb_open(CPUState *cs, gdb_syscall_complete_cb complete,
 
     gdb_open_complete = complete;
     gdb_do_syscall(gdb_open_cb, "open,%s,%x,%x",
-                   (uint64_t)fname, (uint32_t)len,
+                   (vaddr)fname, (uint32_t)len,
                    (uint32_t)gdb_flags, (uint32_t)mode);
 }
 
@@ -150,17 +150,17 @@ static void gdb_close(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void gdb_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                     GuestFD *gf, uint64_t buf, uint64_t len)
+                     GuestFD *gf, vaddr buf, uint64_t len)
 {
     gdb_do_syscall(complete, "read,%x,%lx,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
+                   (uint32_t)gf->hostfd, (vaddr)buf, (uint64_t)len);
 }
 
 static void gdb_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t buf, uint64_t len)
+                      GuestFD *gf, vaddr buf, uint64_t len)
 {
     gdb_do_syscall(complete, "write,%x,%lx,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)buf, (uint64_t)len);
+                   (uint32_t)gf->hostfd, (vaddr)buf, (uint64_t)len);
 }
 
 static void gdb_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -177,15 +177,15 @@ static void gdb_isatty(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void gdb_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t addr)
+                      GuestFD *gf, vaddr addr)
 {
     gdb_do_syscall(complete, "fstat,%x,%lx",
-                   (uint32_t)gf->hostfd, (uint64_t)addr);
+                   (uint32_t)gf->hostfd, (vaddr)addr);
 }
 
 static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
-                     uint64_t fname, uint64_t fname_len,
-                     uint64_t addr)
+                     vaddr fname, uint64_t fname_len,
+                     vaddr addr)
 {
     int len = validate_strlen(cs, fname, fname_len);
     if (len < 0) {
@@ -194,11 +194,11 @@ static void gdb_stat(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     gdb_do_syscall(complete, "stat,%s,%lx",
-                   (uint64_t)fname, (uint32_t)len, (uint64_t)addr);
+                   (vaddr)fname, (uint32_t)len, (vaddr)addr);
 }
 
 static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t fname, uint64_t fname_len)
+                       vaddr fname, uint64_t fname_len)
 {
     int len = validate_strlen(cs, fname, fname_len);
     if (len < 0) {
@@ -206,12 +206,12 @@ static void gdb_remove(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "unlink,%s", (uint64_t)fname, (uint32_t)len);
+    gdb_do_syscall(complete, "unlink,%s", (vaddr)fname, (uint32_t)len);
 }
 
 static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t oname, uint64_t oname_len,
-                       uint64_t nname, uint64_t nname_len)
+                       vaddr oname, uint64_t oname_len,
+                       vaddr nname, uint64_t nname_len)
 {
     int olen, nlen;
 
@@ -227,12 +227,12 @@ static void gdb_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     gdb_do_syscall(complete, "rename,%s,%s",
-                   (uint64_t)oname, (uint32_t)olen,
-                   (uint64_t)nname, (uint32_t)nlen);
+                   (vaddr)oname, (uint32_t)olen,
+                   (vaddr)nname, (uint32_t)nlen);
 }
 
 static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
-                       uint64_t cmd, uint64_t cmd_len)
+                       vaddr cmd, uint64_t cmd_len)
 {
     int len = validate_strlen(cs, cmd, cmd_len);
     if (len < 0) {
@@ -240,14 +240,14 @@ static void gdb_system(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
 
-    gdb_do_syscall(complete, "system,%s", (uint64_t)cmd, (uint32_t)len);
+    gdb_do_syscall(complete, "system,%s", (vaddr)cmd, (uint32_t)len);
 }
 
 static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
-                             uint64_t tv_addr, uint64_t tz_addr)
+                             vaddr tv_addr, vaddr tz_addr)
 {
     gdb_do_syscall(complete, "gettimeofday,%lx,%lx",
-                   (uint64_t)tv_addr, (uint64_t)tz_addr);
+                   (vaddr)tv_addr, (vaddr)tz_addr);
 }
 
 /*
@@ -255,7 +255,7 @@ static void gdb_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
-                      uint64_t fname, uint64_t fname_len,
+                      vaddr fname, uint64_t fname_len,
                       int gdb_flags, int mode)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
@@ -315,7 +315,7 @@ static void host_close(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                      GuestFD *gf, uint64_t buf, uint64_t len)
+                      GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     void *ptr = lock_user(VERIFY_WRITE, buf, len, 0);
@@ -336,7 +336,7 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                       GuestFD *gf, uint64_t buf, uint64_t len)
+                       GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     void *ptr = lock_user(VERIFY_READ, buf, len, 1);
@@ -394,7 +394,7 @@ static void host_flen(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                       GuestFD *gf, uint64_t addr)
+                       GuestFD *gf, vaddr addr)
 {
     struct stat buf;
     int ret;
@@ -409,8 +409,8 @@ static void host_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
-                      uint64_t fname, uint64_t fname_len,
-                      uint64_t addr)
+                      vaddr fname, uint64_t fname_len,
+                      vaddr addr)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     struct stat buf;
@@ -439,7 +439,7 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t fname, uint64_t fname_len)
+                        vaddr fname, uint64_t fname_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *p;
@@ -457,8 +457,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t oname, uint64_t oname_len,
-                        uint64_t nname, uint64_t nname_len)
+                        vaddr oname, uint64_t oname_len,
+                        vaddr nname, uint64_t nname_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ostr, *nstr;
@@ -483,7 +483,7 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
-                        uint64_t cmd, uint64_t cmd_len)
+                        vaddr cmd, uint64_t cmd_len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *p;
@@ -501,7 +501,7 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
-                              uint64_t tv_addr, uint64_t tz_addr)
+                              vaddr tv_addr, vaddr tz_addr)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     struct gdb_timeval *p;
@@ -546,7 +546,7 @@ static void host_poll_one(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                            GuestFD *gf, uint64_t buf, uint64_t len)
+                            GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     uint64_t rest = gf->staticfile.len - gf->staticfile.off;
@@ -604,7 +604,7 @@ static void staticfile_flen(CPUState *cs, gdb_syscall_complete_cb complete,
  */
 
 static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
-                         GuestFD *gf, uint64_t buf, uint64_t len)
+                         GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ptr;
@@ -621,7 +621,7 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
-                          GuestFD *gf, uint64_t buf, uint64_t len)
+                          GuestFD *gf, vaddr buf, uint64_t len)
 {
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
     char *ptr = lock_user(VERIFY_READ, buf, len, 1);
@@ -637,7 +637,7 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-                          GuestFD *gf, uint64_t addr)
+                          GuestFD *gf, vaddr addr)
 {
     static const struct stat tty_buf = {
         .st_mode = 020666,  /* S_IFCHR, ugo+rw */
-- 
2.47.3


