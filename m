Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B860FC87FD3
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 23:51:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhd3Y-0004p6-GY; Thu, 31 Jul 2025 19:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhd3U-0004o9-Pi
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:51:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uhd3S-0005es-Pi
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:51:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-31efefd2655so1142789a91.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 16:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754005881; x=1754610681; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O4Ss/68Eb3xkDNvM0dCPokwXaAOc0ML4KaN0yo7f4kU=;
 b=YUtGq0KE7Sr/SefLrlc+2n4ODWMmxL2JCVW05wAMf//zfL96S1T6Qymk2htaZ/vJrd
 vc0RCgDGJlAihm+1xsNB4tfHk6REdzsMlzwNgu4fkfvgyD1ED5p/H7SwgXgNDmHbckZH
 163ECwjFeXJRwVMoLedcCHDzk7mjrzNyYF+5N6gHPKjKK7ru5NgRG8ijSf0G0gL/MvZt
 basoUM4P9WRsCXUxT/yA5r3/RooMU+vbv3mWXp0wBsjJ8azG+ZKt5hCz2GXbhsn2jwM8
 w25HPIsimarW9PK5HRsa/Htykm4OXqTGIVVN5+dywLcxRdsSXpjdYcvULHSru6w58b7M
 GUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754005881; x=1754610681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4Ss/68Eb3xkDNvM0dCPokwXaAOc0ML4KaN0yo7f4kU=;
 b=PWF4Xtg0hFhrAD70IvXecA7Op1LF3GkFfXoW6bZZFQljfwXu1sMni0cGs6HpOXBbfW
 joQIoAJWGZ7Wyct/MaeKEDKR/q9ZMR8BC6iEq+Rwm6PtdlFjQgDLwKt1/JK3KfhyVJB5
 41sxpZLUEsj0wf2yHH9AcRdpgQA+WdfhnJUa7vnAGp5GydMmgTXCnSwRunAfoDVJWH1k
 LAdgfS/eGcqjfJIqVcLkRE/UGpk8PK8LxrK+RLCPPwujxv3xMxi3lmeDIC7INDQrIVV1
 Zp2/4J9RXa+MXDe99/Dz9/8Hqr8rAbLwIyfypCUHN8T71dtUrukkAwM4HlFhw69ohF+y
 BPhQ==
X-Gm-Message-State: AOJu0Yyqknlgu4LdW2oOBPMxbBdC3dOBqYYa0Qkge31iBR9fqDxTWjj7
 uD/c+D05cJjel8sD22+ymkcd4tSjjy8ceUbmNypJVh7AQOOvw7WgLtHlSpsWs613hXg=
X-Gm-Gg: ASbGncsVXevwKrCmUS8DLrkKzOoT4rN1YZKfr3y52+xSqXfMdrF7eWWFoN5YwsCUvun
 ruHBQA+h1IOYW6LR454qwU+5AIfWUoLkHRRIrnuy31xoKZGplZ9+MVHwYogE3TwPismS39N4rzB
 GJhsu0o1C5X08jaYi5gmznArz5o7ztSnkjutIrvNyd4OKky4FEZVNUYGCIcH5hEGH8+DWy9lTBX
 rXAF1AoMRswMBmjp4Mfvk0CTsEmXAf+v3MEoWvhPzccswFtt6BWvA7G1zJfg5EZ16dRbxlOWj6Y
 0Mx3PrR8w41nOjz0pjMqX9jyGiWkLLRO3mPm9idNUQOtvqdCi9s/iSPYWTe7fHq2sxfhjmiK1gI
 SH/NiHhn+qjsm8ywTam4DgZx6WPmKlxH3KC56QedTZSYf
X-Google-Smtp-Source: AGHT+IEhWOf8mLmG1T+1qXXMymljXRgsDPQ4/2TLNffvulH3wd1n9HWmGiRDHYeHTyLdw83I1KinNg==
X-Received: by 2002:a17:90b:38ce:b0:311:482a:f956 with SMTP id
 98e67ed59e1d1-320da5a7585mr5162321a91.5.1754005880531; 
 Thu, 31 Jul 2025 16:51:20 -0700 (PDT)
Received: from [192.168.0.102] ([152.243.37.35])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207ebcfdd7sm3009830a91.16.2025.07.31.16.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:51:20 -0700 (PDT)
Message-ID: <db6a1fd0-a338-4e69-a2ce-d45511494018@linaro.org>
Date: Thu, 31 Jul 2025 20:52:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/tcg: Fix run for tests with specific plugin
To: qemu-devel@nongnu.org, alex.bennee@linaro.org,
 pierrick.bouvier@linaro.org, manos.pitsidianakis@linaro.org
Cc: qemu-arm@nongnu.org
References: <20250731185232.2351818-1-gustavo.romero@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250731185232.2351818-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1034.google.com
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

Hi,

On 7/31/25 15:52, Gustavo Romero wrote:
> Commit 25aaf0cb7f (“tests/tcg: reduce the number of plugin test
> combinations”) added support for running tests with specific plugins
> passed via the EXTRA_RUNS variable.
> 
> However, due to the optimization, the rules generated as a shuffled
> combination of tests and plugins might not correctly generate the rules
> for the tests passed via EXTRA_RUNS.
> 
> This commit fixes it by correctly generating the rules for the tests
> that require a specific plugin to run.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/tcg/Makefile.target                     | 21 ++++++++++++++++---
>   tests/tcg/multiarch/Makefile.target           |  2 +-
>   .../multiarch/system/Makefile.softmmu-target  |  2 +-
>   tests/tcg/x86_64/Makefile.softmmu-target      |  2 +-
>   4 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 18afd5be19..e7bc66b5a0 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -170,6 +170,10 @@ endif
>   PLUGINS=$(filter-out $(DISABLE_PLUGINS), \
>   	$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c))))
>   
> +strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
> +extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
> +extract-test = $(subst run-plugin-,,$(wordlist 1, 1, $(subst -with-, ,$1)))
> +
>   # We need to ensure expand the run-plugin-TEST-with-PLUGIN
>   # pre-requistes manually here as we can't use stems to handle it. We
>   # only expand MULTIARCH_TESTS which are common on most of our targets
> @@ -179,6 +183,13 @@ PLUGINS=$(filter-out $(DISABLE_PLUGINS), \
>   
>   ifneq ($(MULTIARCH_TESTS),)
>   
> +# Extract extra tests from the extra test+plugin combination.
> +EXTRA_TESTS_WITH_PLUGIN=$(foreach test, \
> +                        $(EXTRA_RUNS_WITH_PLUGIN),$(call extract-test,$(test)))
> +# Exclude tests that were specified to run with specific plugins from the tests
> +# which can run with any plugin combination.
> +MULTIARCH_TESTS:=$(filter-out $(EXTRA_TESTS_WITH_PLUGIN), $(MULTIARCH_TESTS))
> +
>   NUM_PLUGINS := $(words $(PLUGINS))
>   NUM_TESTS := $(words $(MULTIARCH_TESTS))
>   
> @@ -186,19 +197,23 @@ define mod_plus_one
>     $(shell $(PYTHON) -c "print( ($(1) % $(2)) + 1 )")
>   endef
>   
> +# Rules for running tests with any plugin combination, i.e., no specific plugin.
>   $(foreach _idx, $(shell seq 1 $(NUM_TESTS)), \
>   	$(eval _test := $(word $(_idx), $(MULTIARCH_TESTS))) \
>   	$(eval _plugin := $(word $(call mod_plus_one, $(_idx), $(NUM_PLUGINS)), $(PLUGINS))) \
>   	$(eval run-plugin-$(_test)-with-$(_plugin): $(_test) $(_plugin)) \
>   	$(eval RUN_TESTS+=run-plugin-$(_test)-with-$(_plugin)))
>   
> +# Rules for running extra tests with specific plugins.
> +RULE_TEXT := $(foreach f,$(EXTRA_RUNS_WITH_PLUGIN), \
> +  $(f): $(call extract-test,$(f)) $(call extract-plugin,$(f)))
> +$(eval $(RULE_TEXT))

hmm this is busted. It doesn't work for when  EXTRA_RUNS_WITH_PLUGIN has
multiple tests.

Please ignore this patch, I'm crafting a v2.


Cheers,
Gustavo

>   endif # MULTIARCH_TESTS
>   endif # CONFIG_PLUGIN
>   
> -strip-plugin = $(wordlist 1, 1, $(subst -with-, ,$1))
> -extract-plugin = $(wordlist 2, 2, $(subst -with-, ,$1))
> -
>   RUN_TESTS+=$(EXTRA_RUNS)
> +RUN_TESTS+=$(EXTRA_RUNS_WITH_PLUGIN)
>   
>   # Some plugins need additional arguments above the default to fully
>   # exercise things. We can define them on a per-test basis here.
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index 38345ff880..8dc65d7a06 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -201,7 +201,7 @@ run-plugin-test-plugin-mem-access-with-libmem.so: \
>   	$(SRC_PATH)/tests/tcg/multiarch/check-plugin-output.sh \
>   	$(QEMU) $<
>   
> -EXTRA_RUNS += run-plugin-test-plugin-mem-access-with-libmem.so
> +EXTRA_RUNS_WITH_PLUGIN += run-plugin-test-plugin-mem-access-with-libmem.so
>   endif
>   
>   # Update TESTS
> diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
> index 4171b4e6aa..98c4eda5e0 100644
> --- a/tests/tcg/multiarch/system/Makefile.softmmu-target
> +++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
> @@ -77,5 +77,5 @@ run-plugin-memory-with-libmem.so: memory libmem.so
>   run-plugin-memory-with-libmem.so: PLUGIN_ARGS=$(COMMA)region-summary=true
>   run-plugin-memory-with-libmem.so: CHECK_PLUGIN_OUTPUT_COMMAND=$(MULTIARCH_SYSTEM_SRC)/validate-memory-counts.py $@.out
>   
> -EXTRA_RUNS += run-plugin-memory-with-libmem.so
> +EXTRA_RUNS_WITH_PLUGIN += run-plugin-memory-with-libmem.so
>   endif
> diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
> index 3e30ca9307..4e65f58b57 100644
> --- a/tests/tcg/x86_64/Makefile.softmmu-target
> +++ b/tests/tcg/x86_64/Makefile.softmmu-target
> @@ -40,5 +40,5 @@ run-plugin-patch-target-with-libpatch.so:		\
>   run-plugin-patch-target-with-libpatch.so:		\
>   	CHECK_PLUGIN_OUTPUT_COMMAND=$(X64_SYSTEM_SRC)/validate-patch.py $@.out
>   run-plugin-patch-target-with-libpatch.so: patch-target libpatch.so
> -EXTRA_RUNS+=run-plugin-patch-target-with-libpatch.so
> +EXTRA_RUNS_WITH_PLUGIN+=run-plugin-patch-target-with-libpatch.so
>   endif


