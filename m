Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC67FCD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXDFG-0006u6-1R; Wed, 10 Jun 2026 03:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDFE-0006tf-5r
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:21:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDFC-0004Re-BL
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:20:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso54393415e9.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781076056; x=1781680856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Xu9ErmaLxhJkLLu5r/Q5TOUBF/47GHYmfvItnStOga4=;
 b=vETfGaW1kKgfuha2zbcDcFZNuQCLrVxAvL9WPJn/T5Qy3c49KdO+TFxh3c3TGVegN8
 Rv+2YWSrTi0IgSXCQ/oB1wjSV7kKYo+1R4yQxdtsVBh3S1J5ANx6EaWpAFa0VdbcazMJ
 9waUw4UtuP0AVdi+HCCrpSjPY7zx01M7bNBZc3N2tBfCnG4HeWr1Y1mGLs9S+k5ViACh
 UGrAITKfhLpzOx3hvXQxx+6ewb3eAGjUM7dZbtL8sTr5M1rryjQRTNT10k8Ty6YPpBQr
 Gykl4vj312EIBCbORe9Kf9jEkrBNNbwr8YrgeuN8xVVG/v9LBDKo97LmElr/ApIgQX6U
 +h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781076056; x=1781680856;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu9ErmaLxhJkLLu5r/Q5TOUBF/47GHYmfvItnStOga4=;
 b=KdfX+u/d+/LkUx2d5f05icOrbJvl0/bnCRLbscz3RS6YH0yxQBKcYVxwoe0v7rg66R
 kOggnoYruc0Ens7qOJ6WcHlyTXFS61pxJxwUoSg8b+Fx1Sj7joaUniajUjKAjp7c+wi1
 KnuUf8wp/1BtkH7Bk6SFfHtS4XfOze7L5aGP76eDgs2n3li+IwIJ0M6CIksdK9SZOt/X
 OBWYCMox3chkXz2zF1IcAI1yU8Hnmrr6Y6qKXnAuI0dkBSDwZsT5bQjzFqOX6az+6DGE
 FJ9DyzEL81KA5NftTBQDCToDRr/3wKNyPzXz5NLr8XBhjL8POplBYiIFTdI95uiTjvUX
 E6NA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9SLTdyR0sjF/MdxSvotmXDy/ByADDa0fFWRKK6m8RE05qye2OVwhXDsRZsHrq6dt4QeS8Hc7pjpQ==@nongnu.org
X-Gm-Message-State: AOJu0YwidDKYzKEDP6nCna027UwR9RLGbE/3hr+EBv1PNn4lqO4Eqdxl
 j2SDLktbHD21DEg8sGV/5/DhtnKv2IyQBUXBcmAeF5Cy5iSlV8lczcj9CwWI0QaJK3I=
X-Gm-Gg: Acq92OF0VzePPa94jVXMRXJGdsUS8WeV6BxBc957b0XgYa2+VHdeVCYZRqXiamlZ4VY
 2Zg/Efw6WeOYkpNmFmFeLdcMyyJ/1JD3Gf1WSbiL+wqZ9SVV4cLWckefVZz9Z2WA+t9eA7zd/Qo
 yq1IQtIBy7+cOAZIY48Z9dqMZoh0pU4twIM6E3E5JtV8/9Z2Kh3FM7R4U+zl392J8fpN2A4cRMJ
 XCfuSVK6eTFbC+fPNnsatGwDkzEyoH+U32HZAyB+VyGxYOENL05YYDVi4WWEbBQcQCWOqF3Jxh7
 jjq13i0gLkK+Z6Ja7gYEHKinuffwGeg9Ir+2VmOcPKVOMO0Xtdv5FbFyvF5w+awc6oZnkt6lRxS
 nlUwDqcJxIIaqpZND5qD5TE37aVF35vpmVen/EnPKtF1k/ohWg2XXlOwwZbucedWRf8+1ZSMTT3
 l4fz+9dfRcScNFz4Ho+n39WYSBjRbBsEQbbwZ0JpjlFEPXkfxMchjb6rbHSGnbbRc+dZF7A6H84
 MdjFGzB33B/fGRJrjS8JF6t9XpYuxLdQZGvIxeFELd1upqgbk5E3nZvZROMet/2OXDahAFe2l0=
X-Received: by 2002:a05:600c:450a:b0:490:c2a2:b1d3 with SMTP id
 5b1f17b1804b1-490c2a2b3c6mr352082145e9.34.1781076055627; 
 Wed, 10 Jun 2026 00:20:55 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc413adbsm547220935e9.15.2026.06.10.00.20.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:20:55 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:17:10 +0300
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
Subject: Re: [PATCH 11/27] tests/tcg/meson.build: introduce plugin_test
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-12-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-12-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgen2u.3c957rnxjp0lu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x330.google.com
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
>We add possibility to declare a test that is based on a plugin.
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---
> tests/tcg/meson.build | 40 +++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 39 insertions(+), 1 deletion(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index 5cd80f3c030..a47f1ada779 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -16,6 +16,10 @@ tcg_tests = {}
> #           'cflags': ['cflags to compile test', ...],
> #           'qemu_args': ['qemu command line flags', ...],
> #           'env_var': ['VAR=value', ...],
>+#           'plugin_test': {
>+#             'plugin': 'plugin_name',
>+#             'args': ['plugin_args', ...],
>+#           },
> #         }
> #       },
> #       ...
>@@ -57,12 +61,25 @@ foreach target, plan: tcg_tests
>       # return a clear error if user mispell a setup entry
>       foreach key, _ : setup
>         if key not in ['cflags', 'qemu_args',
>-                       'exe_name', 'test_name', 'env_var',
>+                       'exe_name', 'test_name', 'env_var', 'plugin_test',
>                        ]
>           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>         endif
>       endforeach
> 
>+      # return a clear error if user mispell a plugin entry

misspells :D haha

>+      if 'plugin_test' in setup
>+        foreach key, _ : setup['plugin_test']
>+          if key not in ['plugin', 'args']
>+            error('unknown tcg plugin entry \'' + key + '\' for test ' + src)
>+          endif
>+        endforeach
>+      endif
>+
>+      if 'plugin_test' in setup and not get_option('plugins')
>+        continue
>+      endif
>+
>       # meson '/' operator drops left operand if right is an absolute path
>       src = folder / src
>       file = files(src)
>@@ -76,6 +93,12 @@ foreach target, plan: tcg_tests
>       if 'test_name' in setup
>         test_name = setup['test_name']
>       endif
>+      if 'plugin_test' in setup
>+        # remove lib prefix
>+        plugin = test_plugins[setup['plugin_test']['plugin']]
>+        plugin_name = fs.stem(plugin).substring(3)

Why skip the first 3 chars? Maybe add a comment like you do elsewhere 
for unclear lines (suggestion).

Regardless of my comments:

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>+        test_name = 'plugin-' + plugin_name + '-with-' + test_name
>+      endif
> 
>       exe_name = target + '-' + exe_name
>       test_name = target + '-' + test_name
>@@ -116,6 +139,21 @@ foreach target, plan: tcg_tests
>         qemu_args = setup['qemu_args']
>       endif
> 
>+      if 'plugin_test' in setup
>+        plugin_setup = setup['plugin_test']
>+        plugin = test_plugins[plugin_setup['plugin']]
>+        plugin_args = []
>+        if 'args' in plugin_setup
>+          # add empty arg to generate an additional comma
>+          plugin_args = ['', plugin_setup['args']]
>+        endif
>+        plugin_args = ','.join(plugin_args)
>+
>+        # since we turn plugin into a string, add dependency explicitly
>+        depends += plugin
>+        qemu_args = ['-plugin', plugin.full_path() + plugin_args, qemu_args]
>+      endif
>+
>       exe = built_tests[exe_name]
>       cmd = [qemu, qemu_args, exe]
> 
>-- 
>2.43.0
>

