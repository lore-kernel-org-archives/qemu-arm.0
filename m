Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF895CD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:14:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXD8U-0003h7-Aw; Wed, 10 Jun 2026 03:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD8S-0003gN-BI
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:14:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD8Q-0000a7-L1
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:14:00 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so54882725e9.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781075636; x=1781680436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gT3r0Gjp0UD3CZTQt3Jc15vVz3SQWN7a7n/I78Oo7hU=;
 b=tnFudUVUJSQBkbQorS2w0UqkrkOhksq4JfMq3U61xHMl0Mj0ZCvDoVTbB7AuJzs94E
 Jdh+p20wdlzCRsDfoEu/Ey9OgiKK0a9ajaGMgKRqbeYwDs87ISW0nPMuJoIgKd9MqsBb
 Afzal1uj4zZsySnrVe3I9OioOJJ97sQHLI3GJHdr0uc8b49Lw1cal723jNtsajPlR1zk
 hqZL4ZEJ0DIUh2l2h5sB5M+NvBqV5vp9SsoMwMPgS4rh1xzrhn6gbP+cyMXke4tUEM3a
 1ajx45S9a4Z7Q6PeqsP63WOHurvDb8vFWSRBL0mxjBhtN74BQhtjjS4pZIfGEag3Csco
 tJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781075636; x=1781680436;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gT3r0Gjp0UD3CZTQt3Jc15vVz3SQWN7a7n/I78Oo7hU=;
 b=Vsz5RiPjotwnV4QYmoKMBUgWZiVHqXtuvGLUovTgRMutqdBNjeyJtMWa+r0YJQFsgv
 iWCiWNEMCVDPG7JsqSab+F9FiPs7VjdNfz2if0nGd2LfK6t6vu+TRX2WthGmaO14pRz9
 mk75WXyxDFonKE+2fxb5gfC2DEpRQ8n2jSMdFpFFgAoX0ylY5aRDckWDyjatzde9EFN9
 OF2gRnVqj0WJtuCh6yUbOOuC6RiTHpDsU1kUAErdoqSTOFVoP4WyD5pIh57+XkQ+Aj0F
 ETbllpf5HhHkj1sEUE6g/oNAnI84h2d+x7twMfcRtKhQxLw8IEqwxB/6CU+ama5+Vx48
 nI6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yh+wnGhBZkPyYYvs2o8M9n67UjeWqRzbPtzv1hfVBjMESpvXgSXCCTDvaWbPHwpHwA555MtJZbg==@nongnu.org
X-Gm-Message-State: AOJu0YxMdZzyUyK73kztQutXNKIQPCIu5DPsFZ7y+QcZfHJ7VbOYIwrg
 2FdHmRl8ZnyVhuFzW9TYy1lP/00Nvy23geyGlF22VELy8IONXu5aOCAw8GFj60YnW4Z0zDhNM/z
 WF7GWFLs=
X-Gm-Gg: Acq92OE0AawIfrorhKTiDdp7ENoQNqLWGxtVqcFpLimRSMABe66caANEbNL+QthZSah
 mAv1RnOTTJH8p0oOOn5ylKenvh7+Q/pHNykMnofx27phD7I+Jeax60RKz0EGjQp7O3wZvocXRve
 g1sufF7e8rfoKVkBS0seaLVDY89eOsde3KfEvjmtHQ9WZXI+IyLs5m9RexgoCO/Bqp83/y8Q/Mt
 g3dYaO2lV5v4nUka79+NvL6FntzCXpzS/n4NtOvBgMj2LNdrX0r5Hp7OwFgxAgfrMQt31ckOufW
 xfUBz3dFfeZNp0M6y91OuGBbguw2i+KsSoBW48zXqj7aYPWgrI+ND2jCDRMurltbUBiHgGohd41
 GprbSSTSYxVO7zKnX7AsLGKFfpRaYIHXjEix/67/WN65WaqRdelf6FdS67SfzIhpJQZk4gVtHIz
 dYvW6exPrLjsI1I81fFIC8ab4xxReyoaboV4wRTNWY6ukFP69O3dvVqv+rS7gsrw6iZz339vcwe
 nbMKsUVSD5iN2pj7LWUH3AXELOtuqpGeAH9vYwhH8JF4KeNx+Sdw2nxO/cJtr2o
X-Received: by 2002:a05:600c:6995:b0:490:9d1b:f06a with SMTP id
 5b1f17b1804b1-490c25dae8dmr369391235e9.10.1781075636329; 
 Wed, 10 Jun 2026 00:13:56 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc471b6dsm34489655e9.0.2026.06.10.00.13.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:13:55 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:12:01 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Daniel P . Berrang=?UTF-8?B?w6k=?=" <berrange@redhat.com>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 07/27] tests/tcg/meson.build: introduce cflags
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-8-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-8-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgemr6.2xu03vqbxogke@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32f.google.com
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

On Wed, 10 Jun 2026 00:47, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> wrote:
>We add possibility to declare cflags for a given test. Since we want to
>preserve the uniqueness of test binaries, we prevent repeating those
>cflags later, for an existing binary.
>
>This ensures one executable == one set of cflags, and if dev needs
>duplication, they can use a custom 'exe_name' to override this.
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> tests/tcg/meson.build | 17 ++++++++++++++---
> 1 file changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index bb0184732fd..ad56fdf4ab5 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -13,6 +13,7 @@ tcg_tests = {}
> #         'src_file': {
> #           'exe_name': ['provide an alternative binary name'],
> #           'test_name': ['provide an alternative test name'],
>+#           'cflags': ['cflags to compile test', ...],
> #         }
> #       },
> #       ...
>@@ -20,7 +21,8 @@ tcg_tests = {}
> #   }
> # }
> #
>-# Every test executable, identified by 'exe_name' is built only once.
>+# Every test executable, identified by 'exe_name' is built only once, and we
>+# ensure cflags are specified only once, on first declaration.
> # Tests for a given src use the same executable by default, and their definition
> # is guaranteed to be unique also. They can be duplicated by setting 'test_name'.
> # Default name is derived from src if 'exe_name' and 'test_name' are omitted.
>@@ -51,7 +53,7 @@ foreach target, plan: tcg_tests
>     foreach src, setup: t
>       # return a clear error if user mispell a setup entry
>       foreach key, _ : setup
>-        if key not in [
>+        if key not in ['cflags',
>                        'exe_name', 'test_name',
>                        ]
>           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>@@ -80,6 +82,15 @@ foreach target, plan: tcg_tests
>               'specify a different \'test_name\'')
>       endif
> 
>+      cflags = []
>+      if 'cflags' in setup
>+        if exe_name in built_tests
>+          error('test ' + exe_name + ' was already built with cflags: ' +
>+                'remove cflags or set \'exe_name\' (if cflags are different)')
>+        endif
>+        cflags = setup['cflags']
>+      endif
>+
>       # build executable if needed
>       if exe_name not in built_tests
>         exe = custom_target(exe_name,
>@@ -89,7 +100,7 @@ foreach target, plan: tcg_tests
>                                       '-MMD', '-MF', '@DEPFILE@',
>                                       '-Wall', '-Werror',
>                                       '-O0', '-g', '-fno-strict-aliasing',
>-                                      ],
>+                                      cflags],
>                             depfile: exe_name + '.d',
>                             output: exe_name + '.test',
>                             build_by_default: false)
>-- 
>2.43.0
>

