Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AADCD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 07:15:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXD9f-00042J-Ji; Wed, 10 Jun 2026 03:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD93-0003oy-QX
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:14:41 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wXD92-0000h1-Av
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 03:14:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso53061225e9.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781075674; x=1781680474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uxE4K7lLubT16c5SzxhZ+NfQWuXh/aic8A1k66NTTaE=;
 b=E7HV1NpBPMUf90ypY3ayEn8vqGe1Zy70ZgTqeNluSXmL4FLGfONGrdR27lXANnxTVc
 sCANc59YQpg4JJE4WqvbaB2O6bWhXGeVmXmGbRK7Ho0+A1ipz4P5uCrp4jgGr79tpJKm
 nrJybNCfTd0Xup1WkGeJVk2GqCU1GFiFO3mTgV2eMvggr0ihN5z/KSktAwpkTL89EBuF
 y6oteFC1dwiGPcCxUloo+LEZVGAhJ7xPaoXaO/jhUwdFWXiYxU+i369loNa6MLwReM3h
 q+wige+78BTGY30uko7JXIsxtDb0zMe7Yw98qRooDPN234jNlowCksTDMrxCyfO+U8fF
 KkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781075674; x=1781680474;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uxE4K7lLubT16c5SzxhZ+NfQWuXh/aic8A1k66NTTaE=;
 b=f2e0s9c3Y0bs+Ska/iaaA7vCE5ah1weWsxraFw54M8rFuiodT9koVFa15wTPVuW8Jy
 5jTrktcB3j+H5Whc2xJoSH0LrGTbvCmygU2NBIfwamV7cJ2HdPEU7wTGlHHgPz4NJIq6
 br6/JF1X+VNVxHHAEuBxvf+ce+tdBv1/pJkdVXpaIe2qtASWkZK9AexMP9aZTGT09NH1
 sgEG3SKJDCniM5eNjmBcmk12RBFFfmE/DMkCFzpmRIAk0kjZmEN2s1LV5f+IV3o1+7Xf
 8J2HaEKZ6RMvKNThLC2EpiKIpRlL7pe/WBvkGiV7iAcuOk/RhlDsKdlKDfft4WCnOal3
 /BSQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/PfQa0/GU8hUIhOvm3s1+nw0c3S5Uro0sFUB9PfNsAQURw9QYC6optir9HdPEHxutLezJywcSr4A==@nongnu.org
X-Gm-Message-State: AOJu0Yw+JF86mGZBgqWtUkC5qrgoLwkoODePNFr1mjCkim/t4tcjy22u
 muPmP2godKnWTDgClgNupMhq/3z/4RTtmU3uLsImU58x0eNh+PTRMtSwnITa/Fqv8l63ptHfMvP
 IZ4VM+T8=
X-Gm-Gg: Acq92OGkHpLgf4R02ObRIj4pX1FChULu5e24x7TMx8IxHCdz8wYxf1jzGkOTT7VBKZ3
 ox5/OxS3A2LyYculb+FS2W23a4hBKpjjjx8n8HND/CnrICJ6tFtLOJJ8MlD6TnU/HlCo9jUtA7k
 0v2JHioCKbY5h2lp5dM1h7MmX6WAC7HyXU51Mi0FQzUDDVx8D8TX0raQ4JB2XG0AyjpIqYpjo0V
 ZPzKCAUiGvilc6UAKUgHHq3EyKTIk3EeMNd4sL+92+xMr/y0cGou+virI/jyMdtZI3+T1cJtMwA
 qvUtH2OhzJQGr90K3o8iSpsM71X12wDBHkvzm33teaRVduY4IaNkIkcBBk8+bBVFasjgS7viDbp
 O2e+EKKtIS0G11zlxnTQcIE8GhPs757/niC1j7ZQxzXSjuaTOykLSOgxTIm6ktu7TmOl3X8XWUM
 0P4FhDkGetjlFBbdi3lcDcOi7qA82qqP26PlEW5H+dD4qCUlzYKbpddoCVAXaGEKOTjaWpScHf1
 n0opj3PCBrf+22pJx+zI+dBR/QYxXzPHsuQd+JEQwianQ79fNlWt8mv5V7yOTU8
X-Received: by 2002:a05:600c:83c6:b0:490:bcc1:4edb with SMTP id
 5b1f17b1804b1-490c25fc11cmr394799975e9.27.1781075674255; 
 Wed, 10 Jun 2026 00:14:34 -0700 (PDT)
Received: from meli-email.org (ppp-2-86-144-251.home.otenet.gr. [2.86.144.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3c15cesm525369495e9.5.2026.06.10.00.14.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2026 00:14:33 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:14:03 +0300
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
Subject: Re: [PATCH 08/27] tests/tcg/meson.build: introduce qemu_args
User-Agent: meli/0.8.13
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-9-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260609214745.772536-9-pierrick.bouvier@oss.qualcomm.com>
Message-ID: <tgems8.1gwrpv3zatbxb@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32c.google.com
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
>We add possibility to use custom arguments when calling qemu for a test.
>
>Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

> tests/tcg/meson.build | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>index ad56fdf4ab5..28a7e529c7e 100644
>--- a/tests/tcg/meson.build
>+++ b/tests/tcg/meson.build
>@@ -14,6 +14,7 @@ tcg_tests = {}
> #           'exe_name': ['provide an alternative binary name'],
> #           'test_name': ['provide an alternative test name'],
> #           'cflags': ['cflags to compile test', ...],
>+#           'qemu_args': ['qemu command line flags', ...],
> #         }
> #       },
> #       ...
>@@ -53,7 +54,7 @@ foreach target, plan: tcg_tests
>     foreach src, setup: t
>       # return a clear error if user mispell a setup entry
>       foreach key, _ : setup
>-        if key not in ['cflags',
>+        if key not in ['cflags', 'qemu_args',
>                        'exe_name', 'test_name',
>                        ]
>           error('unknown tcg setup entry \'' + key + '\' for test ' + src)
>@@ -108,9 +109,13 @@ foreach target, plan: tcg_tests
>       endif
> 
>       depends = []
>+      qemu_args = []
>+      if 'qemu_args' in setup
>+        qemu_args = setup['qemu_args']
>+      endif
> 
>       exe = built_tests[exe_name]
>-      cmd = [qemu, exe]
>+      cmd = [qemu, qemu_args, exe]
> 
>       # some tests expect QEMU env var to be set
>       cmd = ['QEMU=' + qemu.full_path(), cmd]
>-- 
>2.43.0
>

