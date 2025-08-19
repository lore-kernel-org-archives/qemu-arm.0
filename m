Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418ACCA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 14:40:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoNV8-0007N6-3I; Tue, 19 Aug 2025 10:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNV5-0007M0-Vd
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:47 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNV4-0007rH-6M
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:47 -0400
Received: by mail-pf1-x442.google.com with SMTP id
 d2e1a72fcca58-76e34c4ce54so4093223b3a.0
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755614385; x=1756219185; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/VN3GPgg1jh0q/5htuJyzPpfUsFvwOK+Czt3j5TkpY=;
 b=Xgvf/IQParZmoMLO4GTK4CMc2rk79D98R+R+b7YwPWAU3ken21rhNdrkZDmPj//o/j
 T3YkhplUYf4z8r0J+uhlR/BbYW7pP1IgZMW3CgGMFRZRBDcKgIdsj8UnotErYGUjM8uE
 VNZLzH8ikW9ZIXLksP2rTLsRDBJAW58nENoruqgFwNxz3RqFlKtFt06pq+tRU101M3ZZ
 /44B07AGfy+7HwB/zxJdrGCq2aCmV+gSW+/4ic/X0OSiD3RMhb90bY5+eEWJ4Vyt12/h
 KQ1b+sUyaCnLaO6N0nZlwJFKFmp446lWVrneybsFphxyv++bWTfavyMJdaHDeXDzKZcI
 gTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755614385; x=1756219185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/VN3GPgg1jh0q/5htuJyzPpfUsFvwOK+Czt3j5TkpY=;
 b=qWjoJZ68kpusOTfSwXrl4NtmFBlC3izKSF+vQUEKfD+6Xk/GjTE4hBqiKWEFML1H9n
 uyB0nr7kLRxYedX74+VRVkw//hXWB3k6HwUIeZ1kV80eJe+pnza+Qr9lPaE0mu92nz7J
 672Bcq+K/haGebhvzng2um3r2zLYp4b1m1ptgCLfV19TNRF4WeerDUyAH6qnFhKC1gCo
 59f5My3G5yjQIdm18+fai8Lc6dEtdUxcdfqmaxGUGdkiRBV7abtPVj32CAwTXkP19TkF
 WtjJor8zg6vvLfSee7igiyFAOvgNJ8JlZIXX36djvNMJY2GK4H5qIRahKkJI1CiqFcsQ
 uMQQ==
X-Gm-Message-State: AOJu0YwjzUgkbJMGMUp/HIPeNSHnF4+leePUfb9cZNixwl1hoNRTrbSN
 7WC2vX7S0Je09qmaxMH8qf/xrSaghXqwEJeLqs73wJ8lvdtOiziCBXwFSU+jMUeqob329Th/YpK
 CICf5gfpe1g==
X-Gm-Gg: ASbGncv9ax2R5vnXrAOdKy5GkwzyupXmR+0mz4SR0DoW531LrHsajIykNO0LIXIXBn0
 7c9qK3oOw8g0E+5KzhADYAOszX/7qTqNSAU8cjvFriBbYEUrPqBz2/P6E19EEJEHGLo2C2ff5o2
 DfKKqNSHH4XWtylzcZyxQHqM/IRY/OW7wsnxWLWNMKZe9s9y1/HKMQsBGNXzq/S/DgiUlArpJLn
 QDlpnMg/YHLSIW6IJEyG1SMqy8q6c9cFlY0z7ybZzIpRoal5MeSJo0J5It8CRuTOGIC1u5g7GxR
 tl5+KVW8JGGBbmkm8wSLRfReFFqVoW9AQyqTS4DJCVhsoqef7oILYTfv1TNH7ZRgojqOzWpxAzx
 +weULI6d3uqgOcq7wofCXGoU8Ewu9BKdAcUZZYgk7nMiy8fgdT+/Dv5AiWA==
X-Google-Smtp-Source: AGHT+IFvvVzq/mDGhAHxBgNDdgBj9NMOEGMxFSqDozyz8NqRgw2HMt91v5UYyc7sAG21gsR58b/IGQ==
X-Received: by 2002:a05:6a00:27a1:b0:76b:fdac:d884 with SMTP id
 d2e1a72fcca58-76e81407892mr2921789b3a.3.1755614384430; 
 Tue, 19 Aug 2025 07:39:44 -0700 (PDT)
Received: from gromero0.. (201-1-50-181.dsl.telesp.net.br. [201.1.50.181])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d0d98dfsm2769781b3a.17.2025.08.19.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 07:39:43 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH 1/4] tests/guest-debug: Make QEMU optional in run-test.py
Date: Tue, 19 Aug 2025 14:39:13 +0000
Message-Id: <20250819143916.4138035-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143916.4138035-1-gustavo.romero@linaro.org>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x442.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This commit makes QEMU optional in run-test.py, allowing it to be used
as a GDB runner, i.e., to call GDB and pass a test script to it without
launching QEMU. In this configuration, it is the test script’s duty to
configure and run the VMs that GDB connects to.

The --binary option continues to be required when --qemu is passed.
sys.argv now includes the full path to the test script in addition to
the script’s arguments, which allows unittest introspection to work
properly in case it is used in the test script.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/guest-debug/run-test.py | 81 +++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 36 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 75e9c92e03..7fa17aedca 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -22,10 +22,10 @@
 def get_args():
     parser = argparse.ArgumentParser(description="A gdbstub test runner")
     parser.add_argument("--qemu", help="Qemu binary for test",
-                        required=True)
+                        required=False)
     parser.add_argument("--qargs", help="Qemu arguments for test")
     parser.add_argument("--binary", help="Binary to debug",
-                        required=True)
+                        required=False)
     parser.add_argument("--test", help="GDB test script")
     parser.add_argument('test_args', nargs='*',
                         help="Additional args for GDB test script. "
@@ -53,7 +53,7 @@ def log(output, msg):
 if __name__ == '__main__':
     args = get_args()
 
-    # Search for a gdb we can use
+    # Search for a gdb we can use.
     if not args.gdb:
         args.gdb = shutil.which("gdb-multiarch")
     if not args.gdb:
@@ -73,41 +73,49 @@ def log(output, msg):
     socket_dir = TemporaryDirectory("qemu-gdbstub")
     socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
 
-    # Launch QEMU with binary
-    if "system" in args.qemu:
-        if args.no_suspend:
-            suspend = ''
-        else:
-            suspend = ' -S'
-        cmd = f'{args.qemu} {args.qargs} {args.binary}' \
-            f'{suspend} -gdb unix:path={socket_name},server=on'
-    else:
-        if args.no_suspend:
-            suspend = ',suspend=n'
-        else:
-            suspend = ''
-        cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
-            f' {args.binary}'
-
-    log(output, "QEMU CMD: %s" % (cmd))
-    inferior = subprocess.Popen(shlex.split(cmd))
+    if args.qemu and not args.binary:
+        print("QEMU needs a binary to run, but no binary provided")
+        exit(-1)
 
-    # Now launch gdb with our test and collect the result
-    gdb_cmd = "%s %s" % (args.gdb, args.binary)
+    if args.qemu:
+        # Launch QEMU with binary.
+        if "system" in args.qemu:
+            if args.no_suspend:
+                suspend = ''
+            else:
+                suspend = ' -S'
+            cmd = f'{args.qemu} {args.qargs} {args.binary}' \
+                f'{suspend} -gdb unix:path={socket_name},server=on'
+        else:
+            if args.no_suspend:
+                suspend = ',suspend=n'
+            else:
+                suspend = ''
+            cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
+                f' {args.binary}'
+
+        log(output, "QEMU CMD: %s" % (cmd))
+        inferior = subprocess.Popen(shlex.split(cmd))
+
+    # Now launch gdb with our test and collect the result.
+    gdb_cmd = args.gdb
+    if args.binary:
+        gdb_cmd += " %s" % (args.binary)
     if args.gdb_args:
         gdb_cmd += " %s" % (args.gdb_args)
-    # run quietly and ignore .gdbinit
+    # Run quietly and ignore .gdbinit.
     gdb_cmd += " -q -n -batch"
-    # disable pagination
+    # Disable pagination.
     gdb_cmd += " -ex 'set pagination off'"
-    # disable prompts in case of crash
+    # Disable prompts in case of crash.
     gdb_cmd += " -ex 'set confirm off'"
-    # connect to remote
-    gdb_cmd += " -ex 'target remote %s'" % (socket_name)
-    # finally the test script itself
+    # Connect automatically to remote only if QEMU is launched.
+    if args.qemu:
+        gdb_cmd += " -ex 'target remote %s'" % (socket_name)
+    # Finally the test script itself.
     if args.test:
-        if args.test_args:
-            gdb_cmd += f" -ex \"py sys.argv={args.test_args}\""
+        argv = [args.test] + args.test_args
+        gdb_cmd += f" -ex \"py sys.argv={argv}\""
         gdb_cmd += " -x %s" % (args.test)
 
 
@@ -129,10 +137,11 @@ def log(output, msg):
         log(output, "GDB crashed? (%d, %d) SKIPPING" % (result, result - 128))
         exit(0)
 
-    try:
-        inferior.wait(2)
-    except subprocess.TimeoutExpired:
-        log(output, "GDB never connected? Killed guest")
-        inferior.kill()
+    if args.qemu:
+        try:
+            inferior.wait(2)
+        except subprocess.TimeoutExpired:
+            log(output, "GDB never connected? Killed guest")
+            inferior.kill()
 
     exit(result)
-- 
2.34.1


