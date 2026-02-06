Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EA9ECD9BF
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:23:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDMB-0004NS-K0; Thu, 05 Feb 2026 23:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM9-0004LZ-VS
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:09 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM6-0003Sg-OG
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:09 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-354b20c1112so344091a91.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351725; x=1770956525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5cXOVfc0cfcELp2wbWGKaUPyMU0neuGXQOK5SCrE88=;
 b=InEQfkioflr2GLN65dhPQw/RRgMxa40wq2RO7Yf8xkxYgpt56ewyPCiLG0YQBEWKgS
 NMc0AkYjsnVhVPk+5Xd453jtS1epf8aRzGRBVj0YPJlyZbcq1M5I5vWG7Q+KcGVz3RxK
 QAQsimI7isCDg+kilv3TjzQcSCyUeuUhQBAEv0OhyV7dT99WMDVv1l02J21kgKj/j/0N
 Z7OHiEIc98VvVyCRfvRI47WmRYdZjF/elJfnBojGliFJ6pf/OyIikiyt4tlTNZTYgH9J
 I7I/P9Dl222JEcGu7ht1mHnlNrZEcC/7UJsSQ/r0zRti0rTNmWLP7GrnH9Xp7hK70bJd
 l9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351725; x=1770956525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H5cXOVfc0cfcELp2wbWGKaUPyMU0neuGXQOK5SCrE88=;
 b=DEOeXwr6mVBxG1QJhlojidZYHoI51nK2MUBCDKmy5v/YnLGq7Icw6KWc6TXHMkjo2Q
 n4FvzGPmUuju6aQ8rdCf8h99zqYkhzMJmmQglQlVZsmFzo2NZ/hhx2uTlvZa6op/upXS
 ArZuuw76lzFsllQo70enxjyq4p7o23P4JzQFttnRfnsOjMp3SDm7eWPtJLyj9Qtfcdyh
 TNZjYntQMFSkFY8N4b22HmEan9/W7UFaKd7dsIv2yw1esSBC4QMfJPXe6xcBP3hWEmyH
 kg1Ee4uiuElAXRaDqx57slD2RVdus0aLW4DSC1fParrITlFoNtcootT40JODtNpKwM13
 +d9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUZtk6HnS0WUSeJrkezzdv33bQoHjqS2EzacjbEQfCgukEpWfuzPd/rB+F9nxJKk4xAh6wI6ZsFw==@nongnu.org
X-Gm-Message-State: AOJu0Ywb/GWbo8imyd3uBobshQN11gbjL2p1+RBhdKXov9M6eGTZxrgW
 MNBAOgWrIU+IP6o1c99rXHtwjVB5CagJ9y3zhD9QOO+HGHcGsSK52+usDGqVN3UJqqg=
X-Gm-Gg: AZuq6aLK2ZtENRAOkS0KUGfE8oJpI4tutHc9T0irFmRh3gMwemVZUP2Ku7GILNB1d92
 5pf+IpvaehswXR3dQNwRQoAZwWfzKGnLLVQiIjwxq2O569oMsOQxY0kFQGV0ZO9QmfMLOReWayR
 NDUks2zNil87KCuMEABGsYsrWKeZI6jaSwrghjZP5MenRjpHOou0FTzbryoBm/sycyhj1XOInEk
 wdH292RgR53cncnUn2o6db3Nw7duFklwn8b7YXjbGnceqHGgq4Yg1dwlMW3Cg3isRRmOSr46ySB
 BGUo2Qg9w1ECe4PHYChduHzGiZ0cGmJmxewumU00VWPYjCzEcR2VjjJPbpBOYfwF0DK79RSMNkb
 kbxaBWNZBxYyCcYlGzKnnm+E7KDtGts2hRDAnLscNX6BpK+p/gJwgjVUEjdkerrcHnkW2kCELhe
 CIMNSKERPBVP2ZKIe4K7JYDBObWRonG00y4B1To/2gZtBPOR6ydgNcNa/BKJSNxsGw
X-Received: by 2002:a17:90b:35c5:b0:34c:f92a:ad05 with SMTP id
 98e67ed59e1d1-354b3bc38ebmr1131436a91.11.1770351725298; 
 Thu, 05 Feb 2026 20:22:05 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:04 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/12] target/arm/tcg: duplicate tcg/arith_helper.c and
 tcg/crypto_helper.c between user/system
Date: Thu,  5 Feb 2026 20:21:44 -0800
Message-ID: <20260206042150.912578-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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

In next commit, we'll apply same helper pattern for base helpers
remaining.

Our new helper pattern always include helper-*-common.h, which ends up
including include/tcg/tcg.h, which contains one occurrence of
CONFIG_USER_ONLY.
Thus, common files not being duplicated between system and target
relying on helpers will fail to compile. Existing occurrences are:
- target/arm/tcg/arith_helper.c
- target/arm/tcg/crypto_helper.c

There is a single occurrence of CONFIG_USER_ONLY, for defining variable
tcg_use_softmmu. The fix seemed simple, always define it.
However, it prevents some dead code elimination which ends up triggering:
include/qemu/osdep.h:283:35: error: call to 'qemu_build_not_reached_always' declared with attribute error: code path is reachable
  283 | #define qemu_build_not_reached()  qemu_build_not_reached_always()
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tcg/x86_64/tcg-target.c.inc:1907:45: note: in expansion of macro 'qemu_build_not_reached'
 1907 | # define x86_guest_base (*(HostAddress *)({ qemu_build_not_reached(); NULL; }))
      |                                             ^~~~~~~~~~~~~~~~~~~~~~
tcg/x86_64/tcg-target.c.inc:1934:14: note: in expansion of macro 'x86_guest_base'
 1934 |         *h = x86_guest_base;
      |              ^~~~~~~~~~~~~~

So, roll your eyes, then rollback code, and simply duplicate the two
files concerned. We could also do a "special include trick" to prevent
pulling helper-*-common.h but it would be sad since the whole point of
the series up to here is to have something coherent using the exact same
pattern.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1b115656c46..41cf9bad4f1 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -58,20 +58,20 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
 
-arm_common_ss.add(files(
-  'arith_helper.c',
-  'crypto_helper.c',
-))
-
 arm_common_system_ss.add(files(
+  'arith_helper.c',
+  'crypto_helper.c',
   'cpregs-at.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
   'tlb-insns.c',
   'vfp_helper.c',
+  'crypto_helper.c',
 ))
 arm_user_ss.add(files(
+  'arith_helper.c',
+  'crypto_helper.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
-- 
2.47.3


