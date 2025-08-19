Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84FBCA0EED
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 14:40:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoNVB-0007PI-OH; Tue, 19 Aug 2025 10:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNVA-0007Ol-Rg
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uoNV9-0007sQ-HH
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 10:39:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e2ebe86ecso6139152b3a.3
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755614390; x=1756219190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bg+k3hCxedWSieuVGpi9ScxqcvbuIhQ+IUaNh83oJgU=;
 b=xpNRU6vtpnZzyg+qBf96mlQ/djRrto1kE+xlNTYS/eBj2r9yeW3aftZ0FNux0KzmxD
 wV11MK9+D1Ml7EfD7mpcUr1uWhkU5ff2PRLy8aiJSS60WHOWGmfFjDnGynbRWNsRx1O0
 E7NrtG9ixsIgqmIjy4YsyWUc/k0riLIkVCNbxs8cvkjDMp8LP+7nYq9RQukZkhPQuFsA
 LSXmzUbcQUjsYZbKyQT6TzbVhXyrpxrK5BUvLb0zk3Rq5jNx7n9XtrvK670pxFfLOtnz
 z/uMUodVbbTO2MHtj7Xu/+jqhgCRiXRLPvdUOwqWNYpg8IolVX3cDuHeFsi6EQdtW3y/
 7HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755614390; x=1756219190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bg+k3hCxedWSieuVGpi9ScxqcvbuIhQ+IUaNh83oJgU=;
 b=iblk/Wine1R8msIJEodZV5DxmMffj0Wno7BBBNM3Zdc4CYaLcn4pAO9gb4Plt4aqQ0
 11V0YWUSZcOd7FD+VaQDlXpK0AxZOmGBtiBmr0r91vQW+frjGE0Gy4FThgzGGdX4S7UU
 H6MxOv/DutPTZfQZZJEtCXo3cWCEEnXQ0DlRxqpyTxZUDZGfkaX0qmKEVPfdfcEMaGFQ
 XzC6SryY+kqhAZOh3E7REPakjYsPS4XSp0yKwKK552bodKVIsEaWq1ktCLcsSqE57Xzy
 eAtZ6PZd0K9ZxP5tBVsaJ6frRYwbG8dRRQK5crLRisaKZnhB2xjRbIq8LPA0aaEvqjTY
 5ULA==
X-Gm-Message-State: AOJu0YwpPTUi2EzPZEVJXMEVRl8jFqui9uPvJSgjH6sIDYO6NJyl8g4B
 2jj/FLH1AFXR4khPV8RbauW//rmc2rpbfJv9nw6+zDOfUTU19PS3wMVGhWJoD47TYzo=
X-Gm-Gg: ASbGncshysBV4MSCKvjt0WE2+4zCg/m7ZcF0WzW1fPZ3OA4pidjApoA1j0VqaenLtt8
 UQLjSH4lrPilrtYMpN5m7c3EsePRvKJoTymm6boUiNnpaEW1m9CW8ajNPX3ps4JsO5hV5aafz54
 pQA+S9FZth8mQjpB/yfRdL1Fu6hShm2ve3suaApLgERygSVjjrOAnv2yDpx6FPXXngJsNGHDFCs
 yJtlrkYP8R4eXB8mCI+UWqXvN/NF+E9nOQIn18S1czbf0oRg6b/Zbn/hSTvUerUudNq/6hEtVVc
 qxxIKdV+XvmcG1MCbHbpa8+UNpIkQx2ursUPzUVSWXprFazzRA3OiCGV/W1HcAg//Bh3lOuv1pi
 +t6P//okBtxiWM18IbQ0Ed0I4dMPD4jokrTkSEoK12pCLSBu4WclSQX6iSbUTWs0iMrpY
X-Google-Smtp-Source: AGHT+IEQPB8dlBCjPRoo4crzTen0dvdrgPYMiDq9BkmQNghMGicvOR5AGdOPpStkm9SS0/utOaEf5w==
X-Received: by 2002:a05:6a21:3394:b0:240:1e63:2e13 with SMTP id
 adf61e73a8af0-2430d4c7384mr4097668637.41.1755614389253; 
 Tue, 19 Aug 2025 07:39:49 -0700 (PDT)
Received: from gromero0.. (201-1-50-181.dsl.telesp.net.br. [201.1.50.181])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d0d98dfsm2769781b3a.17.2025.08.19.07.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 07:39:48 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Cc: qemu-arm@nongnu.org,
	1844144@gmail.com,
	gustavo.romero@linaro.org
Subject: [PATCH 3/4] tests/functional: Mark main in QemuBaseTest class as a
 static method
Date: Tue, 19 Aug 2025 14:39:15 +0000
Message-Id: <20250819143916.4138035-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143916.4138035-1-gustavo.romero@linaro.org>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42e.google.com
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

The main() method in the QemuBaseTest class has no parameters but is
defined as a regular method. Currently, this does not cause any issues
because in the functional tests main() is always called directly from
QemuBaseTest (never from instances), but the way this method is defined
makes its signature wrong, implying a 'self'. Hence, it's best practice
to define such a method as a static method, so decorate it with
@staticmethod.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/qemu_test/testcase.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 5caf7b13fe..fbeb171058 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -235,6 +235,7 @@ def tearDown(self):
         self.log.removeHandler(self._log_fh)
         self._log_fh.close()
 
+    @staticmethod
     def main():
         warnings.simplefilter("default")
         os.environ["PYTHONWARNINGS"] = "default"
-- 
2.34.1


