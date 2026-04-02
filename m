Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA011D6AAF5
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 17:08:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8LUs-0002Cx-Rb; Thu, 02 Apr 2026 13:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LU6-0000el-C7
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LU2-0000yZ-UB
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-486ff201041so11257655e9.1
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775149529; x=1775754329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyOQuMfSmwVXZQAsXLr0uzFcWkRrczcFtO2oxCssQ7s=;
 b=xo44Zz5UhlE9T35dVynv4OA6qFw7cNgF6vR8bkR973iBcZ1SryR2PCdGc4/vUYwvXv
 yHJ6Jz8m11E4zUduvu6H0mbvrsMsP+ytf04ZO0bA7N1yfR+VR4dQhpLhkMiegJsZHxP+
 sWNpGQBgrnBm1S/58usUr8aVSBuyeHUNa8fxR5KINhvABHJFiF1/TwWeeJQA5UZlbDIL
 ZNvsucwLQNYx6++RPXU+YmNDj270XThpDEsOzH75ytze2wUE6DXIcE4xvIo2lIcsY0sp
 5bDc+kqTzLid91U/mmOUjUyPDdqrtUgYigDBZtZFpgoQxDHWi8NN1lIle5IMip30Tit6
 9Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775149529; x=1775754329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FyOQuMfSmwVXZQAsXLr0uzFcWkRrczcFtO2oxCssQ7s=;
 b=jTnwO4Aml07Z28CZiqtzp8+zCgMDL+dqn8Mm9wCSypS1BnYSj5oEohqFnyn+U20egy
 YGwauLbtauOYo0Yy/I3aRuUJbcTqY3j3Zbs0cKCQAZXlN+1+IPjjyz5/XPuL0hun/MQT
 pM2K3Fn+2jH6SrxHCAZei9HhkH0F7nMwhnhmpWL8MqqjlIbowP2pyyD/eQPNF+PUh4F0
 zjuKuj0ZNbETJMX2KawRn0L8LwrqiH7pGoeJJWh09ad8lxhYnr0VNJdwaO3nb+s7UInW
 +c7kKRhKOQvVbN2FPHB3IHz5qEu45Imu2ILMbcls/8OfhFsAQ+l56NcWUzQUaq1pwhJW
 OtdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxtF0hhWBGG1AbFALi3Wz7j+ErH9JlWjzfS+pBpYYF18G9gywmx0j7I0rqXEsYPYoc0q5HDU4QLw==@nongnu.org
X-Gm-Message-State: AOJu0Yyy5BKJml7zjXdSUxODuDxPmrfpNZr214YpiRWBoWnjSjxXXiaQ
 kqg6SZxP0BjZdFX6YKFtrph80ruFNw3c8s0pXZ/6HViDRTl+vbREGRXuCRUjJ22osFo=
X-Gm-Gg: ATEYQzxYYZ65yJQZOtNTDo9ga0zjwtvZdusr6120KwH61zEcET8/rc4pnhg3WgvrGZ0
 s+cI/bDEp/fqbOntrg8tM9ASSHxsE1PiotqRK4hY0IFLtIxYz6ih0ocdOUnZlNzt+An0Br55rN3
 MvdugEzTL5AozgwN0AstO/bbN3JUh67LQyIq8daWYU84+vrsSLfDxedEqRYTFDpiBECNE+uBfNY
 CpQya5QoI7Bd7x7Sepr6KwFkJTFDmNK+k/RIIQARrAowZvbydQJfoJIAzwtJGRgsQ1/eoa8x9Y8
 AyrcAkBpyekm7il/e58X5cU3msghjLjo0I2fcpJ9YS9qCbTxD4wwNeL5M/gXLP21KEobDzaxV6Y
 MPPbESZyoIABIK4Z82CTGdpCoL3s+4H37W6d4Ri6k4tinYDFIJHY4egyYlkouER11/EF7KWh8dq
 JIUKIkpDkEu4UXdaxzMKtg8OnF9isii8KwMXqEuxbQKOeFCRM5wHqkvEv/wnpgOkIIWIR4617u
X-Received: by 2002:a05:600c:8708:b0:486:fa35:aef2 with SMTP id
 5b1f17b1804b1-4888b6d502fmr71864155e9.4.1775149528976; 
 Thu, 02 Apr 2026 10:05:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e56fesm9461416f8f.27.2026.04.02.10.05.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Apr 2026 10:05:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>
Subject: [PATCH-for-11.1 v2 7/9] target/arm: Compile HVF as common object
Date: Thu,  2 Apr 2026 19:04:32 +0200
Message-ID: <20260402170434.94783-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402170434.94783-1-philmd@linaro.org>
References: <20260402170434.94783-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Neither of hvf.c nor hyp_gdbstub.c use target-specific code.
Move them from arm_system_ss[] to arm_common_system_ss[] to
compile them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/meson.build | 2 +-
 target/arm/meson.build     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
index afc509a470e..ccb0d338af6 100644
--- a/target/arm/hvf/meson.build
+++ b/target/arm/hvf/meson.build
@@ -1,3 +1,3 @@
-arm_system_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
+arm_common_system_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
 ))
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0e504a403..f14debc6a2f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -20,7 +20,6 @@ arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
-arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
@@ -41,6 +40,7 @@ arm_common_system_ss.add(files('cpu.c'))
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+arm_common_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		                 if_true: files('common-semi-target.c'))
 arm_common_system_ss.add(files(
-- 
2.53.0


