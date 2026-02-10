Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD4EB2711
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 20:16:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpu9g-0000NK-K5; Tue, 10 Feb 2026 15:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9K-0007rw-RE
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:54 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vpu9J-0008BA-0I
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 15:15:54 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c613161b489so1796548a12.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770754551; x=1771359351; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YT0JTFA3AzBVK9ga3zHInUh8zrTWOg2tWQne/H6KqWQ=;
 b=SAoAYk1ohRCtn+DRTIdZ4gqVv40QK4QhqYkmz3auz3xfZyWwUDBoPqda2QbT2nn9Ps
 kl+UfT2KgnjF1QC9m9amzZm25YTutQMpCKUM6UMiaIXZiX+Q1UetRiTfXlJsjKNYWvR4
 2obI3niJ2xORQUq36fwX9m2lkOI+40TKsXIOVAm9nPYsmYNGim+woNeBHNFu1MalO01S
 ZM4bMEoIB/6dyDAoVnDSusweNoFpNzOZG5D+A0BeB4krhb7wUYRnigCC66L5iSix6tbQ
 iz+k7sag7mJFJEdesWPzfyn/UasW+EQD0rq/qCYtkjgvolcaE3fjD1DrReMwnqkMXvw8
 5aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770754551; x=1771359351;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YT0JTFA3AzBVK9ga3zHInUh8zrTWOg2tWQne/H6KqWQ=;
 b=d5oMtQ31cNMYKKYskujVSKpNhWYl1B4XhI7kAA6p6R9eXW4bSZaIeJC1dw0gqghA2u
 4s0CSj7uBceh+qYhv7Ww2oNEG19eU7+xVPT1PEJJ/R7coO8C4jq3+wW6Rh1JbDfw4lGx
 GnfOx2X31G+gik7hUIFGeg0645dz47bcm6G+rG9bw3/ZtliKoa3GvbLq5UfAThjuXHyh
 Vm6iPY034Zyx52ul/d29T2dGUjznsPCiy5lscDNYUy6EEhVjpS1wi4e2IFrqKOpPdEu2
 DPe5m0MQ1F4flWGn6N0eRux6VznudmfRYyko8P0hLciK9k0M5gJveEfBZz2Fq/343sFk
 31hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsPedBWwtBvjCQDdmdptpds/X4wEVR1JwmxB/bs8BaRuS7CDNpkcqjfY3lPOKeZAsWWewJ6Qi1JA==@nongnu.org
X-Gm-Message-State: AOJu0YxUz/fT8U/FLmxj7gTXNshZGl3VfUVLZm9qjZ2wU456IHVhuy7C
 k4E9nJ24YO4D8keOuhZOAviNp/z2PFCEOkE3Sg3sXua0VNr0mm9E+mKxnYn5p3Nr18c=
X-Gm-Gg: AZuq6aL7LNDucU10iylEXPzm+v3RfEIstGshg56eYRbwVDQdg4+1VE+Lo4bm2I08rz8
 sColGrZafW/BAyw/pT//HYjE+woqBuT24a6BKNw8vh1l0hpumwrLgtCaKDYMhgK6gmOoyz+LwI4
 A4AJCa8IxITATi3odbfD9iCAELjfTElOjp6VI09b+ZhuMLbK2m7I8HuXmuiNkITquRZArcUnUDr
 kXdfKU3eLAYskSTlp4oQ+qQDnI+Ejn40DQApzD/xRlCpjjx7w7E763By1rvVCMxRwTMJZpr43ea
 lEqYXI/AWldde8AybSpsCJdwr3jZkCUzk7EqDHgVTGlRvpuVrjayHjVX0jJMpKDrmLjL+E8V9mU
 7zGNiWDqbamElBZi+CYGbWtFEFUT3zNUM+WEV0Yb1TD6go6JsPs9Pp/rqoO2YCDmvJ8y67xNmtM
 822vs/b0nq5cW8J2TrRb2lK0LYaDXYrFH5HGiK80qUmp3F8PuaFhorh7G69wvDRAgBT5NeVHS58
 hib
X-Received: by 2002:a17:902:f68a:b0:2ab:2311:e4ef with SMTP id
 d9443c01a7336-2ab27f6bf8bmr3637375ad.54.1770754551253; 
 Tue, 10 Feb 2026 12:15:51 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab0b392cb5sm38523225ad.70.2026.02.10.12.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 12:15:50 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 07/12] target/arm/tcg/psci.c: make compilation unit common
Date: Tue, 10 Feb 2026 12:15:35 -0800
Message-ID: <20260210201540.1405424-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x533.google.com
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

Now that helper.h does not contain TARGET_AARCH64 identifier, we can
move forward with this file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/psci.c      | 2 +-
 target/arm/tcg/meson.build | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index bca6058e41a..56754bde951 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -68,7 +68,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
     CPUARMState *env = &cpu->env;
     uint64_t param[4];
     uint64_t context_id, mpidr;
-    target_ulong entry;
+    uint64_t entry;
     int32_t ret = 0;
     int i;
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1b115656c46..144a8cd9474 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -49,10 +49,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_system_ss.add(files(
-  'psci.c',
-))
-
 arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
@@ -67,6 +63,7 @@ arm_common_system_ss.add(files(
   'cpregs-at.c',
   'hflags.c',
   'neon_helper.c',
+  'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
   'vfp_helper.c',
-- 
2.47.3


