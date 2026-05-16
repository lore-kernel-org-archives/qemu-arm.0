Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8128CD4F46
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcv-00035e-31; Sat, 16 May 2026 13:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcu-0002zl-Cs
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcs-00089d-R6
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so9791065e9.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951793; x=1779556593; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUuTbzCBsTPa5fDwZzVMcoJRytIYgj0mVcNOroys3ic=;
 b=DIfPrY+e08zeA5EikmBlse5txwu2tHr1+24TQ2QPsPHtK26GfjAW8s5M5tUPwdDOmX
 4mWq2/n0gd+YLX/Wlt1VDpOQlxd9SCA1H2As0nvElX2vcdF5QY1KggAhhwfJsvGRlC0w
 kM9zfYXf7oBXgUdIXWz1NDmoND8PS8F9PEOJzd2kjN3rsIOu1AnI4S5kR1F1SQyp8jQR
 FioGqYA1ioGNAULBR3JuGr837W1IrPwOZnwuBkcQvYYhBMsLZTM1z3dq37L1IJgN/RQL
 m/jAOfvJOhlvTba152e0wu2YkSd+QOhnJ8XVr4wAlZG2YsvZjKQE6HFE+Qp4qhQTU9Yr
 Yj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951793; x=1779556593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dUuTbzCBsTPa5fDwZzVMcoJRytIYgj0mVcNOroys3ic=;
 b=emSW2id9KKQtSqf3NhlmOW5qb3m+R5YJaTovuVEvVDyCZfoD7FSnvfV+EaFYA66dBl
 YHnZJ8UvstMGSuE5tu3DLg+sX2KNpQQKKLFwi+WADmMjX93fc/I4fE2AdTE2fSMmuG+f
 RbdXSgMP7A73VsvUXmwolC+tfuIfv+A/J3WvUqceBd4EqR5KgUlsJw08vxH7tybgzKbt
 S/IrtvEOxJfa4538j/v9/COWujHf8YkraSrKImqBD074WMqHdn8rNAqoqxWhQBysWidy
 fOCMVDHSnKV/JZRFOECDcjfZGebIXm2gzkFQIUFhdcZ8DouvDV807Ajet7bFjLMCuR1k
 6SkA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ykfBm2+32LAfbKX/ZBWTPvwnmOexmo2Sx44/EvG18g3JfbIfCvsRmbXTz1AoprXPkMjeLBSou1Q==@nongnu.org
X-Gm-Message-State: AOJu0YyL2Cgzh+umcAq2zYrLR1MqpduaxaRZDk9Hp1/64U0IlKFTP/FS
 r7jHmCozFOozI8NZLmAsI2YWm6dg5DbKD88tSDPiu6JJykCeesE+68/JRPPcZ+ydKkM=
X-Gm-Gg: Acq92OHotg1Iw7DPe8CVAkbYoQRalox5d/CwAJqzsJn0/g4BzLL6C7F9L7iHOIRrkk7
 LUley8GMe6SkvOdBf80k2buryFNOAQbLMeRqh8OsFKMehDnWoCu5i0qgW3PCPgWYoXDT9Zb1t/Z
 B2Lt7K+qJVxrZeXeviuKMGJOpkYBEFdzxKHP0KQEOz1FYrY1dVGIJ/sW+YzMyUsnsKRyc9YDYPq
 tq54zf0133xbBoYdhoFirr5Hht6gNZS69SpUEHrWpctWcw+dwiAd6VB1doxBIYxtFNuKc7fOrA7
 /G6IAk73+LTd+0LwvzcjuhcEYdSKh5eRmC12rYvM1iq1qM1HZOg+btqUJBjtgJXamVli3ToZlUM
 LzYWbAZ/7UTfcyrAJJk73CWLPsly8va4VRk8x83gbZs250ZrT7s2pLaLtdrhWRoNQgz4Tf31us5
 tw5+VS1D6h6pV9BAdOxnFogm8j7pSv52XTLDbJY+IhuD3hskOwMVWQ1tTXeUZyNiSY9joHJk/KW
 YbVUHbXqQA=
X-Received: by 2002:a05:600c:3506:b0:48f:e44c:e058 with SMTP id
 5b1f17b1804b1-48fe60e13e7mr119641455e9.1.1778951792937; 
 Sat, 16 May 2026 10:16:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767ee0sm22053530f8f.1.2026.05.16.10.16.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 09/21] target/arm: Build gdbstub64.o as common object
Date: Sat, 16 May 2026 19:15:11 +0200
Message-ID: <20260516171524.19184-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
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

While gdbstub64.o is already built once, build it as
common object, reducing target-specific set in arm_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index e56fc943bdf..5376be2e3bc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,7 +11,6 @@ arm_user_ss.add(files('gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c'
 ))
 
 arm_common_ss.add(files(
@@ -24,6 +23,9 @@ arm_common_user_system_ss.add(files(
   'helper.c',
   'vfp_fpscr.c',
 ))
+arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'gdbstub64.c'
+))
 
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
-- 
2.53.0


