Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C9ECD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 19:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL4iG-00030Z-9C; Thu, 07 May 2026 15:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hZ-0002mT-1J
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:48:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hV-0006B0-50
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:48:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso9624485e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778183259; x=1778788059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxuCQv75FqOTgqHf7uhOh33FKyFMH0uLqFU9OhcHcj0=;
 b=wV7CCIE/2rpgp71aFO0kOFdSBy5TG422y3T8y3SCUSvyrWJIzjIoznsPLXF31vfMCH
 63tBTWyY7gBpCFlsBDqikvjRSgITTcdXRaLgCRmxJToN9asn5PLt4cvo2AOjk+x+bxeo
 YXAhXXXWK1rfMU6zCbgGzslwBjQnkYE0/K4tV2O7EhkHsKz7m3KuxcSl9PaYO0zzVlVr
 9yBPnBoymOPm4UTmWBPmaBHEiJbr/uHXkYPqcXaOFTeQw3haB9HJ0gg0A79N7dxv+EOX
 Y2CTjlKajFbMRPwyIbIMNkEHaXWfjOSG6P1/F1CoClLr03fIWNY2A21AOFWeN2kf2+QT
 rScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778183259; x=1778788059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vxuCQv75FqOTgqHf7uhOh33FKyFMH0uLqFU9OhcHcj0=;
 b=Mq1gKrX+SGzXJ+ZzkJ5b5tZWJ/fPrfdrFJjek6oh0YGfqPeh1luD8YXXeOXk3cQNZr
 w3EIu/UGmksXLTv24VSEWZVJBIN/oqJz4mMV4L/43Gzaoe6cwgvfRxve/An8IxPgYQkh
 WS//72B8GBgGDsAjz5uMknBWNnK8N7XLec5TR6hSX99+q1oU996gZRVxGGRtm8+BfsN3
 lEfsEpyaSi/SAsmM5hEC+HYrmIn25mc8WO22ZbADw9aoUkyKjDP3Ims78ZUtS4OA/Gr2
 f/40AHnfrWfHQJ+BdYEFluz0r16kLhqTaeiCPrzGYM76biB+P4j36ZzW12Rq18wHfq/3
 Xk/w==
X-Gm-Message-State: AOJu0Yzjle15LkyoSutj9qAmlGve8X6e8Rh+h32stqMK4sWDS/qeUVAE
 k2ZgMIRUZmM2EffqMRsNqGy4TomVqYFASWH7CTrYTifJuyJ0vIEWsnb7j+kJHTb+mj5HvblvYuj
 wZVz0
X-Gm-Gg: AeBDieu/q/gkNVrbzYcA+kMQQH2xcB33nngZ5P89YH7V4UkX3lEqXRg4RrNQbRm5TvI
 1FFRt8Xrv2UCZ6NjUxt9yMBLgW8Mc0HQhmUeXXVfvcgdRIWTpsZUJDXmKgRY2GsMXEqYXIvsyoK
 JtvZXqOW3z8oM/Cv9t3uh8JhGohebLyHh6YG/0isTGmjEW3ZLaxxKdY0APi9Hyrg+b3iEJRVQoJ
 IvcxYPNDL44E0i+o5lGuWpgyM/9fFPj7VzP4CNzK3gRjuuocrKnKQ7kQ5z3gFJCTVHxnfNh2XTQ
 gUFoDzgn3ralzIxsR3pj4PJ12b4/w2fJsc9cn60ZrkxCTMXYln+EUA/Ujw7lr/mzh7c1K6JahWH
 0jGMEjSUtVmqzB+Sr3g9cVw0DlkgWLa9IxmxpZb75arKZn9VgCLJ+dGTfHElfKpKUzh8smYFsZ/
 M0T1MEu9AMQeNfnagUpbOe29wGyxWApgyUYRgtIOVzoZjnJo+iqlRxqZqxnpKDyYKzDY5m8+r74
 yxdYGizhrF2WvlUpKXq8W3iVJvoe5s=
X-Received: by 2002:a05:600c:1504:b0:48a:525b:e148 with SMTP id
 5b1f17b1804b1-48e51f1856dmr82943195e9.4.1778183258755; 
 Thu, 07 May 2026 12:47:38 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c145aasm958375e9.25.2026.05.07.12.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 12:47:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 6/6] tests/functional/test_tuxrun: Restrict to TCG
Date: Thu,  7 May 2026 20:47:28 +0100
Message-ID: <20260507194728.2034696-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507194728.2034696-1-peter.maydell@linaro.org>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The tuxrun tests specify the cortex-a57 CPU; this doesn't work on a
KVM-only QEMU build, where the default accelerator is KVM but KVM
doesn't support that CPU type.  Restrict the test to TCG, to avoid
failures on KVM-only AArch64 builds:
        Output: qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/aarch64/test_tuxrun.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
index 75adc8acb8..7dd50c3de1 100755
--- a/tests/functional/aarch64/test_tuxrun.py
+++ b/tests/functional/aarch64/test_tuxrun.py
@@ -25,6 +25,7 @@ class TuxRunAarch64Test(TuxRunBaselineTest):
 
     def test_arm64(self):
         self.set_machine('virt')
+        self.require_accelerator('tcg')
         self.cpu='cortex-a57'
         self.console='ttyAMA0'
         self.wait_for_shutdown=False
@@ -40,6 +41,7 @@ def test_arm64(self):
 
     def test_arm64be(self):
         self.set_machine('virt')
+        self.require_accelerator('tcg')
         self.cpu='cortex-a57'
         self.console='ttyAMA0'
         self.wait_for_shutdown=False
-- 
2.43.0


