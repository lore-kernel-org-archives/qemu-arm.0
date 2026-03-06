Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC4CFCB61E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 16:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyXs4-00086C-3K; Fri, 06 Mar 2026 11:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXrw-0007NS-1l
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vyXru-0007kd-9E
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 11:17:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so62311875e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772813856; x=1773418656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFrNo7xt4cWsD82/Y1vv1GAovu90HiLaptxTyNhWut8=;
 b=xjhH6QY9jrEXCaQHUNhsyHO4PWaffxYDeQagALEseE5Um7alA9OlYXrB64IWF6eBjM
 wr1MxQmaZNWElC6aeYowqPf+MWUdMPjGQPTpnOvqNoYU+IYjkXBSugnmti+7Q1op0rra
 C8R7PU84fqqGv+D/d9o7dr3yngwF5cBHOOVjpff9RFcr/7Ic7dTqq+Jqz3g8mua3ePJy
 nZN5vys9ZDULLTtX+lURP+IPZ4GG8Ipib6dK51Du8ipBeiyugYcxiFFnAfu38/XGNL89
 BV1Mj9LD1mG930onC+CVlUcTGQ+rJIFwIIyDpNXAcHJLtr9eH8ifIPuMrJXxD5SMp16j
 VcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772813856; x=1773418656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rFrNo7xt4cWsD82/Y1vv1GAovu90HiLaptxTyNhWut8=;
 b=vjES/PhKdk6WdUsAhQMqt5WZGBaWRGDyHJlz35DjlmDmWqEDPZSG6GvJ1JZ5rHZERi
 Gm6OlAS+skG5AP9FypxjpQrrzqXF7g1gDClsOWs0ZmV6zEL9ij5UnjVXAXPX7n9lKENX
 FFdfcKZv+GPeAJfTyUOoVJbR9maO+FMAj1i16Rhm/ttZjs9UGbOBVV28Yj2PiaRt5JAs
 EjIBsiVdtCpAxeE/BNjQOev5CrB9+FQCY5O/uFrSn4d4alISa+V3tIqyLYREodey0lLK
 gkoPz8yT/z2YyiGcCYbX36Wv2jBpXXSfxoOZPU/WNNj0unvD2uj0+FRvta831tOzdZuM
 jzMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp/A7v0K0zEsT2EgWSGUB2yaBkDwTGmO/xi4j9Xc7Fxse1nD2fiVGReinUFz0IfOWke22gM/Yc1g==@nongnu.org
X-Gm-Message-State: AOJu0YyraoF0axPKhABNL6DzSDZx/KnKJo28lddnzK9VEm41nxc3WKNk
 VzKX5eRh5hwVoNq2y++BR1vbfjZltVgsR24tuzxt3hNhdJl9zhCwoKVCiag1VgleKio=
X-Gm-Gg: ATEYQzwEO+A2SQdDaa4sIajssH6Iy33H72iTZuxaaAHhttF9Ac8bDxMFpgk44JbHvJ2
 Yf7savH2AAOVrsfbuZkzwofJqGbvKqGFOEtwWKzEU20822wzNWyZ0cd1fUjbC8ILOZz3JipOVD5
 //cnK+Qb9OrH7CQDk1LP6KK2ObMmfNcFxByJNW1KjrnxDwvfSaNnps9HixWqZZjET84KV7E6Upq
 +xpYT/uCqf3JEXy/+jpx8HimzVTHGEZGeInSKbLo1tKluank58NDQiBGJGsXDB68pFZvxLEdAqx
 XxZe+w8vRXXIbicc/+J9ngWikaJ6/iFuLrKarbjGIt4pvJbLFlnNGE84or7P2gIUYH7KKs9d185
 Mu8CmsScYceRBJmhYeGGSKuNzVn/UwxCsKM9mK/EUn4PH7azaAV3hn+OzDHD6FvEMKr3x2JRTTO
 KqaB1Imb8vW3bEBEPt2e+4QMQ=
X-Received: by 2002:a05:600c:45c6:b0:480:3a71:92b2 with SMTP id
 5b1f17b1804b1-48526979652mr41566045e9.26.1772813855827; 
 Fri, 06 Mar 2026 08:17:35 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae00absm121465195e9.4.2026.03.06.08.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:17:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6CB69689D5;
 Fri, 06 Mar 2026 16:17:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 6/7] tests/functional: add the ability to send keys
Date: Fri,  6 Mar 2026 16:17:27 +0000
Message-ID: <20260306161728.2657486-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306161728.2657486-1-alex.bennee@linaro.org>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

To navigate things like grub we need to send individual keys without
trying to look for success messages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/__init__.py |  3 ++-
 tests/functional/qemu_test/cmd.py      | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
index 03e5c73d39d..9ed8c6a4b53 100644
--- a/tests/functional/qemu_test/__init__.py
+++ b/tests/functional/qemu_test/__init__.py
@@ -10,7 +10,8 @@
 from .config import BUILD_DIR, dso_suffix
 from .cmd import is_readable_executable_file, \
     interrupt_interactive_console_until_pattern, wait_for_console_pattern, \
-    exec_command, exec_command_and_wait_for_pattern, get_qemu_img, which
+    exec_command, exec_command_and_wait_for_pattern, get_qemu_img, \
+    which, send_key
 from .testcase import QemuBaseTest, QemuUserTest, QemuSystemTest
 from .linuxkernel import LinuxKernelTest
 from .decorators import skipIfMissingCommands, skipIfNotMachine, \
diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
index f544566245b..381e5162f02 100644
--- a/tests/functional/qemu_test/cmd.py
+++ b/tests/functional/qemu_test/cmd.py
@@ -142,6 +142,21 @@ def _console_interaction(test, success_message, failure_message,
 
     return out
 
+def send_key(test, key, delay=0.2, vm=None):
+    """
+    Send a single key to the console.
+
+    :key: key to send
+    :delay: debounce delay to wait
+    :vm: the vm to send to, defaults to test.vm
+    """
+    if vm is None:
+        vm = test.vm
+
+    test.log.debug(f"Sending key: {key}")
+    vm.console_socket.sendall(key.encode())
+
+
 def interrupt_interactive_console_until_pattern(test, success_message,
                                                 failure_message=None,
                                                 interrupt_string='\r',
-- 
2.47.3


