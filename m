Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D57FDEE2C
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:04:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxSG-0000bd-4A; Thu, 23 Apr 2026 13:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSE-0000aL-RT
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSC-0005BD-Kt
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so88618855e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963783; x=1777568583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5QlbpkhLSFbpydkuquJtvxsAHOyc0Gt7hSL58Wv5bM=;
 b=x6DkY8h2cbp+2SIg3lJkDW5cmx39oYnLc1jU1YC3Me0FgNDkCQZOcZZfAaCJbBZSL6
 SNXX4/9F2l/zOr7HLpE3VZpfdGPpeuQn6C9mJN+NFRqr5i63W6sVxm3HnXCPGfb505P1
 4shihyK9asLwX39gJ0t1Kvj9rKrCjNyPUFJ+iTAvPfEmhpsEWI008h69JVLwP+tIqAAu
 OqQndSlZtgzw3JsGg+XEc+qzwfGOzqCibwfoCVgX/Cwv+BBrvxxc6SndnwTTMBSp662n
 9pbJTDa5/h77y33ntWEo4LqCZoxSBIxxSKI/EwyP4H+4Se72KkLX2ad7D+fGxC137Y3T
 1izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963783; x=1777568583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q5QlbpkhLSFbpydkuquJtvxsAHOyc0Gt7hSL58Wv5bM=;
 b=kDPdA17XlL0exa2SRi9OreK6jHVA4H3ZN1Tw2y8I8aqDdh3byV+QqkjX3AHhmHrFFB
 fdaUEMp8+8r/4gH+zD8Ctlt5O2dHK7U3mksaGdeExddP8YOK+igGWSgD3eqIxkZexOyl
 BSbURNSG7PHrTDxRo0QKz0oUNFMNQy2wsHfUntldANSCSWsb2wBZUbI3jHP+BSrCHg/S
 DTXvtzOp3JLLEoIZmJIifuMSvDcIVLGKSER3PDz5bhfTPBwNjtTjBxtdZtHzzJ/Sm3qO
 S5lK9vnuxE8mfriReOBJNqiIQ4ebQTzpy9BqDICpSK7rGSkoeAJzDqwC4ZlMdte6bW9T
 vGOg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8MA8Xt72xvPozFT3r7On1l4R6U0pUZvxNSEyUoyVYwYiU+ybPiryqp6I0VzSJ3zDyN4WUUVKJYaw==@nongnu.org
X-Gm-Message-State: AOJu0YwE/xU43nF8Vr+sV5lYYThNSCPiD0UprGaXAYiTb0K9JHD9Bfig
 1QUUIZYQbOXg0fPt2TdmLHSGMb1J3/CpjdLw3GXvZQyxY+hj+vINhLJrxbs7jmq2UxQ=
X-Gm-Gg: AeBDiev5g+U4I/3EAMVhXxSP6HD4x/YzaVQY3TevVseN+BmdlBShuzRo7XzEPbxdFvn
 sWJMIHESO+kLaIKwwH7h2pGU0/qNKF+ndnmDdxMP6iNhPF0hWqsnZ1Sj9AIIxqmzBwGNdkgFVlK
 S6mekbRnDDhJuvEPyNm1qDOIj1iq2tu0BWYGxzA4S7AYwwTkFnsEgJYg48J1QPSQLNhBDtrNr5z
 J61Kc27dOP4cWgQCoIiE9AjDBPFXKFHTRXEWE+B13ZciEPoXLMOhnhEBCJsYbL/aQoYufj4i5x9
 ILxnWfXzk8TDP9um94+6z0qfF/0MIhQo9kTqudMmpbctRxgF1cHPh+UG2mYuOjFMjrfA2XkMgmU
 0yNJ8sqt2vvbLCugfFTYw6OLObI2gHws1qAqVEZGrc+F93b8OF6F136Cit9a228aQ8KVQgQmAnR
 xr42Q1X+0S0JZnTP7cDQ5CXZtCWiOSumeeR1ISwiAXWFtDpFpwi6oOEAjrKpcc4iyQTsEDRquqx
 VTnYZB4Q+g=
X-Received: by 2002:a05:600c:8183:b0:488:b187:d898 with SMTP id
 5b1f17b1804b1-488fb771445mr339012825e9.14.1776963782997; 
 Thu, 23 Apr 2026 10:03:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0b60sm156040625e9.17.2026.04.23.10.03.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:03:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/16] tests/functional/test_aarch64_kvm: Stop dumping kernel
 ringbuf
Date: Thu, 23 Apr 2026 19:02:16 +0200
Message-ID: <20260423170229.64655-5-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Avoid the following kernel message to interfere our stdout parsing:

  platform gpio-keys: deferred probe pending: gpio-keys: failed to get gpio

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/aarch64/test_kvm.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index 7545f5ed554..a03a6134626 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -48,6 +48,7 @@ def _launch_guest(self, kvm_mode="nvhe"):
 
         self.wait_for_console_pattern('buildroot login:')
         ec_and_wait(self, 'root', '#')
+        ec_and_wait(self, 'dmesg -n 1', '#')
         ec_and_wait(self, f"export PS1='{self.PS1}'", self.OK_CMD)
 
     # this is just a smoketest, we don't run all the tests in the image
-- 
2.53.0


