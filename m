Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E9ECD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:57:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabab-0007Gb-W8; Fri, 19 Jun 2026 11:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabab-0007FO-2I
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaZ-0001GZ-Al
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so21923515e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884622; x=1782489422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+0maHJPoQsOIdBJYfxwPQteHhPErzszZzDg/3TOUYc=;
 b=slBWzBcv8odG08eGHg/ltWLRZT5Fy2ACg3ySsj7rRmlHnTDChPxzx/lqEHS2XYRtwt
 KiNnlp8caeLM1cjEV0GRvNXYfcGBeUnKClVzaXFbjSSgrNJWpVr7u95EEN7wPhqc1hSz
 9xJyMrTMrlmlzOvYTYqC5jPOH+QApGaMwWN8Isz9wPOyk5ZGTqvwdVcgsfF50HwkugpX
 TjCod6NkrjRbWky/zqnvajwRzQTtiW6HtlSVmqVWaNNbKbvYmBvzEBZB0lNb8iwIg0rZ
 33DTo06PeUwHw+tWQyPIOYXDp609LQnL8Npod3JbO88WqWAjrWUBFlErNB+h9owch/VL
 yuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884622; x=1782489422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m+0maHJPoQsOIdBJYfxwPQteHhPErzszZzDg/3TOUYc=;
 b=fmaomcybyCU7DraQk4GCxqCn0BQ2OnlLYS9el4Wpk0Ivjhd40q7AX/4l572sTdYLXu
 tvkP5PAwztDqnY54X6KOEI8W+qnIWdEG7+EYdubFoAQq4kKLULV1YoZpTiG7C33pAj5Q
 40fCHevc6k2sNQYChpUPdz7NmR05UZzc/cPiR2/mnFpkKmy21IwRhaetTbm0zMfLMi7R
 nj0Bjer8WdzyBLn7T4B8cHnaa4fCSgHj3kOhuyCc69Q9CjKbOdxkDvlJNCTKqhYJRc1T
 dqktNyIWriEPRfoKO6Utkyq5nHmrwjNohejHW5vwGWvYE2MwTe7+Nun2JOxrp+UAAe2X
 bR+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qcZjl+08ktRR29ZaZtvPKTGIC/9AZMnrUEAn5Pa5uvk7gg3SUY/gGIgpGtBbluZKTjcHdrqXxnQ==@nongnu.org
X-Gm-Message-State: AOJu0YwFT4fQK8BuOb6BqfcsaA33z+WDSPPrqmNCeZQOSXqgntsWmQmG
 w3siAcYBRRdES6mdseUNxis+8FGruySVUwPNFAdjw/NKhZxLtVRp3fTTmTUNwN1fzIs=
X-Gm-Gg: AfdE7cl89W185qs4EDWuCerqhxJBOd3osRDKQZsHP4b0pxnPHEVuVAoRsNLiaZaywbW
 u7MQLqVB1poiFPpX0IhGluxIqPopZA3debGiin30oX0XvMeRzBVRZUOkrN4AfSnOiNOBEIE9PK+
 Vhe2rp7Dtc74fR6LYkh5V5InfPl1W/xV3cXouaK0uxjwwf9cOh3Wrc7MQIt0+f8TdjixqxGOR9x
 ViztulM8g8MgeVQ+ViHTuOicwfazLXQpYJDIJw31vRsbSr8MZgoV86VAZGEOtr+Ayf3qnGcZxLB
 J8DUnhZoKdu5JbU3f9tJ/nrtetXX9pTXF3UivbfS8JuFNcLJ66TNxPgJZ/QV8maLWDIoE4VbQqw
 aljyNnLVneUhItbI51QThl0OzKBLZqb10lRj1O7YkBYA8DFBzSAEVTdgyeiLpn8T21bBKsssbRB
 6jvlSDQoEqNj5O
X-Received: by 2002:a05:600c:5493:b0:492:1ea2:6258 with SMTP id
 5b1f17b1804b1-49240e7b049mr62330625e9.33.1781884621709; 
 Fri, 19 Jun 2026 08:57:01 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240ee9bc2sm46627685e9.1.2026.06.19.08.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:56:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 96BB25F946;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 3/7] python/qemu: dump a developer friendly version of cmdline
 to logs
Date: Fri, 19 Jun 2026 16:56:52 +0100
Message-ID: <20260619155657.944220-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619155657.944220-1-alex.bennee@linaro.org>
References: <20260619155657.944220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Now we have the arguments nicely split up we can make _console_args a
function call and present a slightly different version to the logs to
save developers manually hacking the command line up.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20260614100902.885698-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/machine/machine.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 18ee5ec0147..26a7bf5948f 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -308,12 +308,15 @@ def _harness_args(self) -> List[str]:
                          'chardev=mon,mode=control'])
         return args
 
-    @property
-    def _console_args(self) -> List[str]:
+    def _console_args(self, interactive=False) -> List[str]:
         args: List[str] = []
+        # redirect pre_console_index serials to null
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
-        if self._console_set:
+
+        if interactive:
+            args.extend(['-serial', 'mon:stdio'])
+        elif self._console_set:
             assert self._cons_sock_pair is not None
             fd = self._cons_sock_pair[0].fileno()
             chardev = f"socket,id=console,fd={fd}"
@@ -376,7 +379,7 @@ def _pre_launch(self) -> None:
             self._wrapper,
             [self._binary],
             self._harness_args,
-            self._console_args,
+            self._console_args(),
             self._base_args,
             self._args
         ))
@@ -485,6 +488,11 @@ def _launch(self) -> None:
         """
         self._pre_launch()
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
+        # Log a simplified, developer-runnable command:
+        # Exclude harness-managed infrastructure args (harness_args)
+        # and wrapper.
+        debug_cmd = [self._binary] + self._console_args(interactive=True) + self._base_args + self._args
+        LOG.debug('Developer-runnable command: %r', ' '.join(debug_cmd))
 
         # Cleaning up of this subprocess is guaranteed by _do_shutdown.
         # pylint: disable=consider-using-with
-- 
2.47.3


