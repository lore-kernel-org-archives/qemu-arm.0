Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E8DCA1013
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 15:49:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuCBh-0004wH-4G; Thu, 04 Sep 2025 11:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCBD-0004kQ-Tw
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:22 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uuCB5-0008II-QH
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 11:47:19 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-544ad727e87so948805e0c.2
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757000827; x=1757605627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJUU2u1tzC1eXmbzNgouEyqDdukQnt6LnrP8qMtdLmo=;
 b=Dy1lhViLudkXBhvcAKfRz/usZITdTfbfODnoOoDSSBhZhoCS7JisgdrfW+T20py/2t
 9ScTvgM+e6l2uP1g7RipTYwCWdLnOPyITgwwwP/QuPZYntxayMD8HHujHMebneFwfJIS
 kc3MWXSd4j73aj0SjBOw0RyiteluWcfKf7fj44ReSsAKgfjoTcDHF2/8qfpnFCmh0J/h
 P1LVm7O4+ar08Mo1IdxF7Izi/YrgISJ2OW9ojGosNLnbU3DBJGxWrypxOW3CQfm4vc09
 0EmvRwee2ZWnuDgL5RJmhrQieETAfCBz+uI41I4K3mCuoYziiaHuQ2b/JyUxBbZYPbqR
 TssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757000827; x=1757605627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJUU2u1tzC1eXmbzNgouEyqDdukQnt6LnrP8qMtdLmo=;
 b=Amjp0Ue3qABdWgHzVBPDh/JwbpEMBOTK1YRULdt2/fZCk2v60NwSViRG9WBgTFYCnz
 bk4mOPERdSvCBYQljq+0ioWza+Jddy+LrprQNgXARiu6gdkBniLflWwFvMeLb1+hsjVt
 snr/ye4LQhBXXZQek1ZKtzdy1Cu0Kf8yzkCXLeEJjLfvkk3OdOJA/mDmKslZb/X750dD
 QIWOt3xA0x0sbypshKQqATqrYXHfzr33sk9AjrwdWs9JVcsjtyvaVpNy+hfWSHuevn9P
 TUPfyD9aWYUQ1jKBlpLKuMyQjVyPwoaCr5C5uDNGuzNRMY4He8iK7qtOTfI0qaIdD0AQ
 3L6A==
X-Gm-Message-State: AOJu0YzkrGkt3yJgwH6JsHivjusHIrC4aYdaGjPJkMm5KngEmmv79KOC
 LIimu0aZg1EWuQhIZgHTOgfXSIPVyzkjrkU0Dzw33qsvK42X+KkhFDtFqmabBxmSbSEeAy9JWwb
 Ear4i/D4UHA==
X-Gm-Gg: ASbGncuqfetHOVRhhaIFBgH9+V2XpdOTClu7BHco1Fh1vKMNdJVptsrk3f3pA//7LOP
 CLgQ7ELSHR8Zet6Sie6FTrZJrQ3FWe9Z5n6wCc0Nn1LL01F0w90xhdeoTwfR0hdCWXVE38nXY0n
 09UPD9VtRmDgDGAHWTSq0gW9TJN7VKoCydlsDqCy3JrLYKWuU9So65cUAlFBhzH6eJ6b1rS23Q1
 V4vPxoUwwiMakpTVvl2+0CnBzoUxisOT2cbDWalsGMfPCWYv5TovQ77+CPfMK4KDKdHrhXtYSVY
 4VGksju19yeswfjoR9MieW2EpdWNo5hxTGA0ZXh71CVKGt8MZWubZ/trWQPsUeRq9G5M0Qr1Mqe
 fV0UfL+E8gPyi9MY1RaRWswZqhQnntRAT1RZAXWI=
X-Google-Smtp-Source: AGHT+IESD09FhaRWqFv/jDR5+zmzGS0I7CeSClFxHhefAuOcy70hbViiiCCMNb2+oYX6IZDbKF01/g==
X-Received: by 2002:a05:6122:3d08:b0:545:eca2:1c7e with SMTP id
 71dfb90a1353d-545eca22169mr688729e0c.0.1757000826773; 
 Thu, 04 Sep 2025 08:47:06 -0700 (PDT)
Received: from gromero0.. ([186.215.58.133]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-544a666da0csm6497022e0c.28.2025.09.04.08.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 08:47:06 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH v2 2/5] tests/guest-debug: Format comments
Date: Thu,  4 Sep 2025 15:46:37 +0000
Message-Id: <20250904154640.52687-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904154640.52687-1-gustavo.romero@linaro.org>
References: <20250904154640.52687-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Capitalize and add periods to comments.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/guest-debug/run-test.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index d21a5dda77..e051e8947c 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -54,7 +54,7 @@ def log(output, msg):
 if __name__ == '__main__':
     args = get_args()
 
-    # Search for a gdb we can use
+    # Search for a gdb we can use.
     if not args.gdb:
         args.gdb = shutil.which("gdb-multiarch")
     if not args.gdb:
@@ -94,22 +94,22 @@ def log(output, msg):
         log(output, "QEMU CMD: %s" % (cmd))
         inferior = subprocess.Popen(shlex.split(cmd))
 
-    # Now launch gdb with our test and collect the result
+    # Now launch gdb with our test and collect the result.
     gdb_cmd = args.gdb
     if args.binary:
         gdb_cmd += " %s" % (args.binary)
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
+    # Connect automatically to remote only if QEMU is launched.
     if args.qemu:
         gdb_cmd += " -ex 'target remote %s'" % (socket_name)
-    # finally the test script itself
+    # Finally the test script itself.
     if args.test:
         argv = [args.test] + args.test_args
         gdb_cmd += f" -ex \"py sys.argv={argv}\""
-- 
2.34.1


