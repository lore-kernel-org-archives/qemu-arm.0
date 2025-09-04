Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6125CA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 15:48:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuCBh-0004xE-HO; Thu, 04 Sep 2025 11:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCBJ-0004l0-0p
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:26 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCB8-0008Px-IV
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:23 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-544c15d4eeaso241146e0c.1
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757000830; x=1757605630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYDFXmXqCAGa3H4P42CKPPrpxXB7rIYCvJObU3+Iajg=;
 b=yJdPSlRln6wVAbyQOuvQyFdlZEtIFXcmdWwpAR7z6W2N8+VXDoN20ckRZ/KFB0Qfas
 gruJOgU8ZC98fzEy7yBp/fHYKbgh1aMgyICFVoVO6kxjYNDSBoC7aVWhhyz4CGEVdaFY
 KG8iQFenVKTUNLxKxzc30LyEmwv5OkUJvdBAoe78IOQCZ8G3wnhO32aCckKQaY9SH/ev
 0ZzgqMCS6gl5ka0U4ifWqTRe728cPnrjiMAuXz54LGHSl6xeoAi5q6kE7j5SSQ6oZEz+
 KELiAQY9HJsHe7fqEkHkfGkaNb3ZryPHVWz4Vbb0ehcTfGf0FbGI/yoE07hQTcQ6w4Tq
 +/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757000830; x=1757605630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYDFXmXqCAGa3H4P42CKPPrpxXB7rIYCvJObU3+Iajg=;
 b=wzO2bcAbGS9Fw+mfFHDICgBk8snp4rpUs9jue5srkV/1Z5nTZS8LSApMvSKqd/0wEI
 8bh4Zuh7UPerrdww3n26qv0cm3G4ObSAGqXO/KEY4BkcU5neZa1VxtHHwImWDEdVOal2
 WlCJecNXfsw2RWbfDwmOQmbdfgsGfePuhYGPW+9ML8mTqC9sqJ5Z8e2DMQFORQ4OnUvI
 9WiunvEs/xMu+IHToCPrBn0Z8FwqOMiRts4rlDm3rOyz4kThyM+lczoxylWeWKxSR6Gh
 fofB1jW+j6vIUk2eQFF+zYQnOjzkWp4folpsrLJPPuYdq0t3oZyBXe8kMZmqn6VeB8oV
 DaDw==
X-Gm-Message-State: AOJu0Yz84EOavReroKM0pdM66lO7H3H1aY10wTtOLWeadfGd8HelhE2f
 rCzoT2D5dsV/GHJMifOtrc2s382dFYw+N0VNZE5VI5r5Exvb9UfVe5YXJtNeqK65wqE=
X-Gm-Gg: ASbGncs7s1Lm6OzIR7OmZmHyajc12xa/ySKGYfex8Gw2g/ol2BxX0fxnIvg9K/Y8mId
 1IFqFFVzKU/yfpCSkkYsxydbQzqzPAzQN7qhlPejH9bGyNShXnenq9WkmZONkzHMmDJGvxS8rt1
 8ugEnQIqXXzQRIeUmcqOiVGjRCB60z+ff6sKRlZiihr3bAltO+KqPaE0DMt61DIgSWKZsU2w+SO
 9STuOJzjG16fEhp8+4WCtIvm+NI9VH1Ljh2ZH78ui9w2gzIXIKJbzH6wLMTn5NAG9xkrZsQ3oHr
 v0RttPbqnvrAgyxtJ2UNWzexSCf4VGrgnAJPk160Pfi7Zm5lUTBTYIBOALDI2b8HKXxi/g8+K9Q
 D/PiHlgmWz0guohcLB31ZameSeKiUmrBqIzhncyM=
X-Google-Smtp-Source: AGHT+IEfdF/8MTudAgTz1GKf4FI7P0iY9BfPuKxefZGnKr/uKjEuglZ8oN5EPxrYTIZ4IfY4cxLhSw==
X-Received: by 2002:a05:6122:1d8f:b0:531:2afc:4628 with SMTP id
 71dfb90a1353d-544a0190d7amr6131606e0c.2.1757000829781; 
 Thu, 04 Sep 2025 08:47:09 -0700 (PDT)
Received: from gromero0.. ([186.215.58.133]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-544a666da0csm6497022e0c.28.2025.09.04.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 08:47:09 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH v2 3/5] tests/guest-debug: Add quiet option to run-tests.py
Date: Thu,  4 Sep 2025 15:46:38 +0000
Message-Id: <20250904154640.52687-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904154640.52687-1-gustavo.romero@linaro.org>
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add a --quiet option to run-tests.py so it can run without printing any
messages to the stdout.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/guest-debug/run-test.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index e051e8947c..cf8b37b8b8 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -39,15 +39,17 @@ def get_args():
     parser.add_argument("--stderr", help="A file to redirect stderr to")
     parser.add_argument("--no-suspend", action="store_true",
                         help="Ask the binary to not wait for GDB connection")
+    parser.add_argument("--quiet", action="store_true", default=False,
+                        help="Don't print any messages to stdout")
 
     return parser.parse_args()
 
 
-def log(output, msg):
+def log(output, msg, quiet):
     if output:
         output.write(msg + "\n")
         output.flush()
-    else:
+    elif not quiet:
         print(msg)
 
 
@@ -91,7 +93,7 @@ def log(output, msg):
             cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
                 f' {args.binary}'
 
-        log(output, "QEMU CMD: %s" % (cmd))
+        log(output, "QEMU CMD: %s" % (cmd), args.quiet)
         inferior = subprocess.Popen(shlex.split(cmd))
 
     # Now launch gdb with our test and collect the result.
@@ -117,7 +119,7 @@ def log(output, msg):
 
 
     sleep(1)
-    log(output, "GDB CMD: %s" % (gdb_cmd))
+    log(output, "GDB CMD: %s" % (gdb_cmd), args.quiet)
 
     gdb_env = dict(os.environ)
     gdb_pythonpath = gdb_env.get("PYTHONPATH", "").split(os.pathsep)
-- 
2.34.1


