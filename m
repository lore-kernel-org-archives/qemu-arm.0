Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4023789lfp;
        Mon, 27 Sep 2021 09:36:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1WNWFqCUYbnZHTO5g9pzCVdPo2pIiQXnRGHPrpytjHQ165abcq86pZeix9X5W/ZTnDYAQ
X-Received: by 2002:ab0:4adc:: with SMTP id t28mr845577uae.4.1632760601401;
        Mon, 27 Sep 2021 09:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632760601; cv=none;
        d=google.com; s=arc-20160816;
        b=TLecuDBDTr2ol+jaEgVRGUlhWTc+I7tsOcb+1PAlbKvgMXQlyyU2SFwIYaS0AF8G13
         at64R0qs++gBwS/8eLrA20qwx41Vn57MzEIom1UOsD1hQP5DbNlvZr0yBMwzEP684oEj
         H5gTE98kmlL7Dgu6KURO/M+BZRkDbkUHuaLrRzL+xktRMsf6peh7oYfzlHYkvwWZztFg
         Cw+IvRqYIm2kSfHEry9kXJNNauRSJ5tI3W4anX0yesTyIX4EpvwvvjNPue8a8aOPPnrh
         laM7SsVSyD4fN+6fhudRbKdyEevLU4n13yoy9uKgMpFUvbifwqTtwSWRmDS4PFBq6slq
         V/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MdnXHTIFHp39KUio8jeORJKWlV1pr/VnQAeVLDGF+MQ=;
        b=YBxNtgJy2jfrX0UywhxaEvxrJ6xoCQcf8433lbnV5oAaeV2b9Q1fPSweY+CgOt+y4m
         PAgk98WtStLk/N0+Yv9PK3zs2OwyvnGD6COZT793ecl7X5LHoZs57TOvuvFYeC4TrDVF
         oJk3BwuXMohfoq1kdXtkcGjQPW9tLjhF5p6CzbDHgJHZmA4LpqIgMt/Ntx+yk979ylMd
         wiz+k1M9+y89ZvlgowZAO32S9Ap5H0Oz4roZR5+AF5qXhHXPoTROOzcX2P7353YJNvf1
         FG1w15Dq3u19ZgeQoSZzZCrEZYsa0B4WQK3JIjWdIcGCrPAfpLrmNNbCpTknOGc/jaGd
         XaVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=B+m4SAM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si4182089vsm.233.2021.09.27.09.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 09:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=B+m4SAM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUtcO-0000Tf-Jv
	for alex.bennee@linaro.org; Mon, 27 Sep 2021 12:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXa-0002bG-JP; Mon, 27 Sep 2021 12:31:45 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXY-0002eb-69; Mon, 27 Sep 2021 12:31:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so1114288wmb.3; 
 Mon, 27 Sep 2021 09:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MdnXHTIFHp39KUio8jeORJKWlV1pr/VnQAeVLDGF+MQ=;
 b=B+m4SAM8KZHFquOBqXBM0Byv2k1NUIYLu6O6sKbEc/mWUlaoZ2Ow3Gb5trOJ+TUBPo
 tydLSSwhwOOUGpaCC2ADJIFCblCJpeCBxszHCa4GelDRQyFDpU6wilmaqVL+PTXc8U8A
 iJQmtnq7ALTntDo7VT90I2muD2LxFGWOdMUyvSwjRBaJYqi4NIiKHOWfgEoadDor9DHL
 K8iSaVeGILwSWZorJ+PVf2/4MVfUdz78bY47n0tUrTF3O1FPiqbm0Wljh9tysKRUAyjp
 0/JBwtoa6ia15nfMLjnT5Q8eIU03D5NRXUXVsvjf1YE/3sS5T/M+zKxnYcgOowp0xjNJ
 eASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MdnXHTIFHp39KUio8jeORJKWlV1pr/VnQAeVLDGF+MQ=;
 b=RpaPxKCZmhho49/uy6JEDOIKM3Y+DtT+MIVA70EpcDQfzFA+mbP8tsWT9nheNHABR+
 T5tNyHeBPqFNbq+KT9zDYjkiKB56JzQanBCM1yN5EW49YvPNNj2ybGz1ajY0YTN9nbIE
 xDGaP8h6mKXVzRtI1+Y96FRF858cQgKtN7qm1x4gevnTsQf7LFYxXfBBLCBV5JEYipX1
 Cf3qBYDatjfFcCozrQbKht9r5et+/P7mbr/0sgr6Wgd83PAhlOYrZ/TWkhLdUrf0sc1K
 43PXVwzioOCa1aas5P7EHUtkHSp+/lAqcy/69SYD5yDvm0X4LeyEbHihpMYrZtJNBCbD
 vdVA==
X-Gm-Message-State: AOAM530xES2UlxqZGSbH/75ybrAW8VITJzC+Urrn/zTCas2xi74J8WzS
 5QLAiTaJw7sabYKHY3UIg4P7aFJZ0HQ=
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr798423wmj.163.1632760298051; 
 Mon, 27 Sep 2021 09:31:38 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v18sm16746695wml.44.2021.09.27.09.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] tests/acceptance: Share useful helpers from
 virtiofs_submounts test
Date: Mon, 27 Sep 2021 18:31:14 +0200
Message-Id: <20210927163116.1998349-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o4NzNJGs9zM6

Move the useful has_cmd()/has_cmds() helpers from the virtiofs
test to the avocado_qemu public class.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 57 ++++++++++++++++++++++
 tests/acceptance/virtiofs_submounts.py    | 59 +----------------------
 2 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2f59e171e49..a497a24f823 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import logging
 import os
 import shutil
+import subprocess
 import sys
 import uuid
 import tempfile
@@ -49,6 +50,62 @@
     tcg_available,
 )
 
+def has_cmd(name, args=None):
+    """
+    This function is for use in a @avocado.skipUnless decorator, e.g.:
+
+        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
+        def test_something_that_needs_sudo(self):
+            ...
+    """
+
+    if args is None:
+        args = ('which', name)
+
+    try:
+        _, stderr, exitcode = run_cmd(args)
+    except Exception as e:
+        exitcode = -1
+        stderr = str(e)
+
+    if exitcode != 0:
+        cmd_line = ' '.join(args)
+        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
+        return (False, err)
+    else:
+        return (True, '')
+
+def has_cmds(*cmds):
+    """
+    This function is for use in a @avocado.skipUnless decorator and
+    allows checking for the availability of multiple commands, e.g.:
+
+        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
+                              'cmd2', 'cmd3'))
+        def test_something_that_needs_cmd1_and_cmd2(self):
+            ...
+    """
+
+    for cmd in cmds:
+        if isinstance(cmd, str):
+            cmd = (cmd,)
+
+        ok, errstr = has_cmd(*cmd)
+        if not ok:
+            return (False, errstr)
+
+    return (True, '')
+
+def run_cmd(args):
+    subp = subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=subprocess.PIPE,
+                            universal_newlines=True)
+    stdout, stderr = subp.communicate()
+    ret = subp.returncode
+
+    return (stdout, stderr, ret)
+
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 21ad7d792e7..e6dc32ffd4e 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -6,67 +6,12 @@
 
 from avocado import skipUnless
 from avocado_qemu import LinuxTest, BUILD_DIR
+from avocado_qemu import has_cmds
+from avocado_qemu import run_cmd
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
 
-def run_cmd(args):
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=subprocess.PIPE,
-                            universal_newlines=True)
-    stdout, stderr = subp.communicate()
-    ret = subp.returncode
-
-    return (stdout, stderr, ret)
-
-def has_cmd(name, args=None):
-    """
-    This function is for use in a @avocado.skipUnless decorator, e.g.:
-
-        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
-        def test_something_that_needs_sudo(self):
-            ...
-    """
-
-    if args is None:
-        args = ('which', name)
-
-    try:
-        _, stderr, exitcode = run_cmd(args)
-    except Exception as e:
-        exitcode = -1
-        stderr = str(e)
-
-    if exitcode != 0:
-        cmd_line = ' '.join(args)
-        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
-        return (False, err)
-    else:
-        return (True, '')
-
-def has_cmds(*cmds):
-    """
-    This function is for use in a @avocado.skipUnless decorator and
-    allows checking for the availability of multiple commands, e.g.:
-
-        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
-                              'cmd2', 'cmd3'))
-        def test_something_that_needs_cmd1_and_cmd2(self):
-            ...
-    """
-
-    for cmd in cmds:
-        if isinstance(cmd, str):
-            cmd = (cmd,)
-
-        ok, errstr = has_cmd(*cmd)
-        if not ok:
-            return (False, errstr)
-
-    return (True, '')
-
-
 class VirtiofsSubmountsTest(LinuxTest):
     """
     :avocado: tags=arch:x86_64
-- 
2.31.1

