Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D15DD6AAF5
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 17:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8LUr-00024F-QJ; Thu, 02 Apr 2026 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LU0-0000cy-IK
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LTw-0000wT-GC
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso15015045e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775149522; x=1775754322; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5um0Hkp4gUlr+ZAZ+thc8PXoevdikb9WS1n3IueTF8=;
 b=G9TeWzQA1BbVbPctZ+4nyUt+ffMBiVUsvJRVaAooOOqrN5ySehVYvN9+dPcgGUIPXQ
 uGgOh+r48cbV1lTkYyCm3fmTprHmUhiK5YATvsRNikE8dm/EHhHOzXHwzKZpymZSYdLQ
 uGwgUD66EsGgFQqdNOiCZbilNnuLwBDrGXiB8d8nRVyKkaj0SacGBYZQH7jzbyKX8Osd
 QCfPEJtPZ9Xntyra7wWo4cJhX3EHedMoFApHqjU0hSHeiUQOf587A2f5Z1YYr9b62fx6
 9X7VV8JEvbvU+dXy81/K7lPKsMdlr3J1hQjdz9WEOxzsXSN7jqSyLYV/2BBw64vHeEQe
 u+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775149522; x=1775754322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G5um0Hkp4gUlr+ZAZ+thc8PXoevdikb9WS1n3IueTF8=;
 b=Z957ieeV7Rfw/hyrnGhWqvUQP0aE0eJG7duLy66WSvBTc3vdlBx7cPkj4NWFnEKlLq
 KPAiCG5jNv+CsFCECBdTvonUxxel1UOwAEq1alY9NU1A5tsg4/v++9tdJqYoKbeg+WHP
 lC0dOSDzzMl9vGuYo1OuWogSp3JlzC/t7S/rESR8alAkMGKKSB85tniKdt4rLdbHYWZ8
 DHxRscjfsrkn6SVtWV5YqAUWFYwNVeLiFWbp7Z03CXV7FuXJpxAj6Sm01AS1Mi4eU9VL
 cei7rgS/KrDx62B/Yd7LWutVmdrVkXo76Ws5PgYcJugNBmLLt77BbjWeX8tkK3sYil7/
 ip4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiIf5AC6Zz7SuMbsaymRSEdnyqehNaNC8zH4rtbnFbMehmoM0YOfJMZZ+oIgfNGytFb0IvV7sw8g==@nongnu.org
X-Gm-Message-State: AOJu0YzfN1mlT876uIHjOKUT2QI/UR4xX7jsH+HqixeQ4e798UZ+OL0H
 KdFD+4DVNHytNQYi1NqvOvPwFyLNldY8P3Pl17TDiqsdEnS8CFzjIZzXCehNfx36u6c=
X-Gm-Gg: ATEYQzygw3qfr6X5fXxyvOxv54psMX300oBaKpE+/kixJxbwWFYQVviW5sM2VUoHBH8
 R94p9fKjYuD8xkIbHBKsTvAVA8J/D2uaOfUfrNphDNyxMeHyoJArdvufbrr2Ep5+VzjsN7YSX/Q
 0Zw/EV6wUTlIoWogfHjWevlLJfkDyVOrzvyRnpd3t3+KYhl6CHKrROdXAQNhZyP6/oUwpIRsAlQ
 ILXAE0yjij5JyPu0TX8qNNg2S8Kzz3Bb7/Gn8vhYTvbI1fgGmlsaDBvgvrEeqLlAuc543PBcE/J
 3wagXGFWefK4JohSafZJJAWHG0Sto2ATuuAZ41L3xJXyEZT036Cfd7qV9y92Qs7OAo5YxbpFQ9K
 X/LYDJZ7JmCO6IluqZ3dXGw6aVRxMhEooUi2mOXVuqr7/5QBJHnsrZ5WmGiZvo2b9D+CU7OVOwq
 /7aoeS5kXqN5dVHTPuxHSrkEwMDI7Fv4UCA3Gsi5ZoMLufaLWNETQhfoD8Fyg/eQ7XBM9hyCm8
X-Received: by 2002:a05:600c:3515:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-4888359cee3mr152160325e9.16.1775149521759; 
 Thu, 02 Apr 2026 10:05:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e832585sm385581555e9.6.2026.04.02.10.05.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Apr 2026 10:05:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>
Subject: [PATCH-for-11.1 v2 6/9] target/arm: Remove target_ulong use in
 hvf_handle_psci_call()
Date: Thu,  2 Apr 2026 19:04:31 +0200
Message-ID: <20260402170434.94783-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402170434.94783-1-philmd@linaro.org>
References: <20260402170434.94783-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Similarly to commit 3580aa03547 ("target/arm/tcg/psci.c: make
compilation unit common") which replaced the target_ulong use in
arm_handle_psci_call(), replace the one in hvf_handle_psci_call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..678afe5c8e1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1418,7 +1418,7 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
     bool target_aarch64 = true;
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
-    target_ulong entry;
+    uint64_t entry;
     int target_el = 1;
     int32_t ret = 0;
 
-- 
2.53.0


