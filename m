Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D9CD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:17:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXDBh-0004q8-Fx; Wed, 10 Jun 2026 03:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDBU-0004lj-Bi
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:17:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXDBS-0001WX-Ni
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:17:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so4692419f8f.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781075825; x=1781680625; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wdU1404k+TxR02ItnBlHj6oYFXSCi4F+DlqFcTTJ4j0=;
 b=VcphJb5NTHn2MqfzEz+oly90a062xMms37ZVEGY+02f/Dq4N2LjpgwAqVV6ehNdedA
 qDD95O7wKP1IydhMKxOViS/mtsD4Eu3Cs5mlja1aPoWmRXvCfKUD0ISig2lWMayaGIo3
 FTHJn+IUgE+BYXyoUIW2MMH7wmyq/VF31ZCYn19EWljuW9PIaLQV/hLYw4EMdrj4ZOBT
 awia7x2jcbWRRoBKGbwGORtvGwgXKTE0PGJKlFyc0yvS34BFWM8/n/kxPU9CnMT87hbC
 q6MdTqv3IZONpw2Wl+nDqCbw5BaQNl58sHUDdwiFQNxG2eMAfZUR1w1nnawAbecnfHgC
 67/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781075825; x=1781680625;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wdU1404k+TxR02ItnBlHj6oYFXSCi4F+DlqFcTTJ4j0=;
 b=sOwt3NEHX7wOY74VZ58QpgjO1qN8nX1KMWsWmV1bcAvwmICuz2lJ/o1yZklPBvmV0a
 XDJBzoNGkTrZTUKJqiddkca0cmmw4jJXYpaU4lGRuerJ3ss89vS0shRCehbcmHPdTXHu
 BSSwWCRb3A33XOdT4AezbP/TIOzlytZdDSopu8k6Go15b5UbqdRbd6mdiA0uuagsgYxn
 ZVYFZo/2CUr/pAabv0XKjV9Cexq0BZF/6saVgm2PPPPbRJ10INY9RKY7y9zvVRqnqtvk
 UE9TedLFvZvNycR0M6IGCHiXaiqwW3n0tfNimx7rDkddRlDCl50XATEzKM75Mq/hf4ip
 e9aA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+BR1/9qPNeUrH7cH9WFEH9GkxWwH6L0qTyWwTy2No2BTuKBcUM+IMlBi7886Iztq9XoiW4COw8fw==@nongnu.org
X-Gm-Message-State: AOJu0YxrsMcm898XumOEglWujhDfUPnQjC+E/qaALfJor8pQ80+0Rk7Q
 WK3DpVUoMJMMSqspajtXmVW/TU0RRAmUAsf/aI/oX1vZM1T4dG8DopEdU4UjIztGwZs=
X-Gm-Gg: Acq92OELzDtBOWD+ceIKWIyMS//6//byBxnXSg4lL6LWCEQYJXA3sOhsblAoEExigAK
 AH+ksQFyVBNJ91ZmxMbCVhmcFlXGWPDKfTdMUfy8V4D/e9MquUXWyzmaFgfThDUOYCfWFT0M0SZ
 ywpjqRakGXhWZE/ZLaRcKSx72AA8pW8mdYzdpK8xFGdoOcTsbYGyyM12HB6ZgEJ9xTMw+J9jVtX
 G+Dz+RqeJTCHxnN4Dl3Jufr2VSoCssgsiPGx1DuizF3c7/hkMwl2lzBdr1JciCUmDKvM8JSA7gC
 TA64rbxuPNzkQb3iVFwanzrZEDItU4QnGy5gCYx9VJJ1KpVyT6GkLdozBz15weUYphLcGC9Hcpa
 XgRJTBtAfJXsbkOrbuUkJZgwUCXoJfnqW2t8GE2vPP7pAz3Yqi6FVqwfvsliUe3cJQhqMc4qGYS
 pJM/8sQqnoTgdS8P0HtCQRKayqw6DNjQXJKfBELs6LkRB0PZhd4382QfBQcAIYYd0LMWIUFhsH1
 dosnMLVCazntm1zlqERMQ2pPgCrrQbY3xKkOdlX5haE0j/VRvfGUDEP1UrdRYOM
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id
 ffacd0b85a97d-46032dabbc0mr31051349f8f.15.1781075824696; 
 Wed, 10 Jun 2026 00:17:04 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm57712647f8f.32.2026.06.10.00.17.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:17:04 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:15:50 +0300
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
Subject: Re: [PATCH 10/27] tests/tcg/plugins: build list of test_plugins
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-11-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-11-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgemwf.258tji04enkpa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x433.google.com
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

On Wed, 10 Jun 2026 00:47, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> wrote:
>We previously had list of test_plugins sources, but not the target
>themselves. Create this list, so tests can then reference a plugin by
>its name from there.
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> tests/tcg/meson.build         |  1 +
> tests/tcg/plugins/meson.build | 11 +++++++----
> 2 files changed, 8 insertions(+), 4 deletions(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index b6a375e9eee..5cd80f3c030 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -30,6 +30,7 @@ tcg_tests = {}
> # Default name is derived from src if 'exe_name' and 'test_name' are omitted.
> 
> # plugins come first, as we need to build the list
>+test_plugins = {}
> subdir('plugins')
> 
> # Finally, we can create all test executables and test targets
>diff --git a/tests/tcg/plugins/meson.build b/tests/tcg/plugins/meson.build
>index d7f8f0ae0ad..2abc317d1e7 100644
>--- a/tests/tcg/plugins/meson.build
>+++ b/tests/tcg/plugins/meson.build
>@@ -1,4 +1,4 @@
>-test_plugins = [
>+test_plugins_src = [
> 'bb.c',
> 'discons.c',
> 'empty.c',
>@@ -14,9 +14,12 @@ test_plugins = [
> 
> t = []
> if get_option('plugins')
>-  foreach i : test_plugins
>-    t += shared_module(fs.stem(i), files(i),
>-                       dependencies: plugins_deps)
>+  foreach i : test_plugins_src
>+    name = fs.stem(i)
>+    plugin = shared_module(name, files(i),
>+                           dependencies: plugins_deps)
>+    t += plugin
>+    test_plugins += {name: plugin}
>   endforeach
> endif
> if t.length() > 0
>-- 
>2.43.0
>

