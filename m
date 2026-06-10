Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962FECD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:07:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXD2A-0001R8-VN; Wed, 10 Jun 2026 03:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD26-0001Qb-4o
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:07:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD23-0006Xp-Lk
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:07:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so81018715e9.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781075241; x=1781680041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ssf7N5KP1JOsJG8f/+T1wuGPDqauVBhL2BDu1HgtoKY=;
 b=rGOTwSVeLZaDghG4q1lvvZ4AtGolLKvkNQRpPTJ0mqxfuefeBixjWzkHNf9kfJcbHC
 xIl6zEWpLgVHYUns8xPBRhT5ll5h+GeEXopFoGf/oKiKBTqmywTAObmRmqlIxN9yYES4
 PNfSGAaqnTdv6HYIvS76QgKGP8LxT1SOEBYHuK/i5gB/0/MdhISWlbCUuWX46LniMWC9
 mUA3zCVsk6dXVaGVTca0CEqP23QygN8y4FfvMJ075+3pOZP+WsdooJXGKWZruTvGxQ7B
 gvImzG16FfAQBrgtnnSjYQrvB6qfxAVNZRnabiFUgDcDv0BRir2gvaUte+/uBx8eaDj7
 mwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781075241; x=1781680041;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ssf7N5KP1JOsJG8f/+T1wuGPDqauVBhL2BDu1HgtoKY=;
 b=NXH0iZkxdmktwCzgCq0zzy5GYKomP1kL6puVANPGuuEiCF1ScWRVzp4mU50jpKoBLb
 aUk/i9zYb6sjMx9GKxkF86At5CkAqCvz7U/vMp9v3fdYhlkDjTunx1HliPvUd9utfoSv
 6CZeJp6WmOck/3+3dLlwOrFaI5CpwWbY49iXNF4ylP2RKVfPFfV/o60bopICEhMDAVh6
 OZaLj1VCyczOcQfSHQQrSC1l8pqmePMZ9IoTlMpgB1Uyu9WtA6iePcXBM9XlUHwSTyFJ
 Ik1upnuXPtfXr+19TwzaugqWahBjewnLfJYz5x+J3xC1yVJORZrREXVOKZZxewL/ZJGv
 orpw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FtiCwiKcU3CXcPudFRCNQUbgxOcUqMPV8wiE1o2nASNYs1E5sj5ZXgzluDqvr0UVtYN/u5RuYTg==@nongnu.org
X-Gm-Message-State: AOJu0YxpRDsPFNVll5oMjf4wa7bspqG+eDD3H2lZ+lyOT7sgtVkpNF7A
 KZr9ZYjOvYztAddTViJu+XVwIlLAwl7JqUcaYNsm/epYmSA4rQ77JL2ctwPFlT8Z3MY=
X-Gm-Gg: Acq92OHrCy4U6PeWHBj4RAAJGYK3KAVeO/8UrtfQqvHZ5LD61hojNJvJFQoS6IFJjoo
 iqJ/wjKb5JVKpri3TObw+ypkFXc6vwJ2qvNuB3qPfMrrbx8fXAxV5vOP+IhK/X8/DAkyBPoAVPW
 joAkslqZVol201tbQSeGWdo9uLvyZKYYFkXrHPe7o6vAMTOZMGTq3nKoUYV3/FTxUdqmKSQiuzh
 EG7qyUnk7sFOVf92puQHEsnTdjj4fJDC0Jn/9pvmhXrZwTHYOW9bSSbmmg5iHye1BLMIUE7HM8p
 1dETVf4O49FOn4sLYxdseb5aqhDHdlawEmx6t4UBuRTW9cOmb5/evlN+8+CslzdSHfARiTMfiXE
 BM8ip8nfsdcIxI4z5YIsc8oraIv5Gucx+t/mJRL1k+8gcAuHTpIx0ClNIseUR3zYzqxwdzM7wxe
 sHeUA0Q4xC6RpOtFIeXgLE7ib8h8A0jz5KzVgW7gSnenv43L68DuICwJYf5PKuaVSzVn9I7R3U4
 UlLa2VdJJETCKzN4mrj6DrOooRhrmY/jZClNAzflEPl71AqCiVXtpQLIjMcPz+b
X-Received: by 2002:a05:600c:314e:b0:490:9d1b:2022 with SMTP id
 5b1f17b1804b1-490c257bb25mr378369275e9.13.1781075241279; 
 Wed, 10 Jun 2026 00:07:21 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc39e024sm721819585e9.4.2026.06.10.00.07.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:07:19 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:03:42 +0300
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
Subject: Re: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgemg6.297pm0qzw7mjt@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x329.google.com
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
>We add possibility to duplicate a test executable for a given source
>file. This is needed when different cflags need to be used (like
>vectorized vs non-vectorized for instance, like sve tests in aarch64).
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---
> tests/tcg/meson.build | 17 +++++++++++++++--
> 1 file changed, 15 insertions(+), 2 deletions(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index 72d1a9f8986..2c6d85c586a 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -11,6 +11,7 @@ tcg_tests = {}
> #     'tests': [
> #       {
> #         'src_file': {
>+#           'exe_name': ['provide an alternative binary name'],
> #         }
> #       },
> #       ...
>@@ -18,10 +19,10 @@ tcg_tests = {}
> #   }
> # }
> #
>-# Every test executable, is built only once.
>+# Every test executable, identified by 'exe_name' is built only once.
> # Tests for a given src use the same executable by default, and their definition
> # is guaranteed to be unique also.
>-# Default name is derived from src.
>+# Default name is derived from src if 'exe_name' is omitted.
> 
> # plugins come first, as we need to build the list
> subdir('plugins')
>@@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
> 
>   foreach t : tests
>     foreach src, setup: t
>+      # return a clear error if user mispell a setup entry

Minor typo:

  If user misspells*

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>+      foreach key, _ : setup
>+        if key not in [
>+                       'exe_name',
>+                       ]
>+          error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>+        endif
>+      endforeach
>+
>       # meson '/' operator drops left operand if right is an absolute path
>       src = folder / src
>       file = files(src)
>       test = fs.name(file)
>       exe_name = fs.stem(src)
>+      if 'exe_name' in setup
>+        exe_name = setup['exe_name']
>+      endif
> 
>       exe_name = target + '-' + exe_name
>       test_name = exe_name
>-- 
>2.43.0
>

