Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C5CD6E55
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Jun 2026 17:31:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wU6Tz-0000hS-Gl; Mon, 01 Jun 2026 13:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU6Tb-0000fl-8d
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 13:31:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wU6TK-0005y9-QJ
 for qemu-arm@nongnu.org; Mon, 01 Jun 2026 13:30:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso6335915e9.1
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2026 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780335041; x=1780939841; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOX4E9NTH4ace2x/yWyLnVDJzJJ1xaxeOxtTYLyOxF4=;
 b=lJ+LRvBk+TwZt1IOoyPrYkJcOWHo43fc4FsPdC++3CO3rBOkMVvADWr6pd/FBGb4c1
 UJIdSfxTpJJomh7JjhYyVAGN2YuPSY79aRerycwPyOhFjSLJWfme3GELaLSm2bE4Ix2I
 1bfkGDx6OKdeEgGVfCnJ4LLyZZho5V7UoeR75HaKuwaYs1k8jNKsit0xtzBJSgLjmFqq
 XXgSWxz/7ddzsALxcSxXaGENbZuEINQCIPFxP1K8aMPBFq1Ie1AdFjOfazkPVI4DW9N6
 5nru1vh0UV5UXcczmM2rdkOs+gZ0vpBZAKasrwNQAndXy5VhtpgBVuTHE1GYPJhCchUk
 57Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780335041; x=1780939841;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOX4E9NTH4ace2x/yWyLnVDJzJJ1xaxeOxtTYLyOxF4=;
 b=U9jrS6MY/kLhM20iNl47suj275fTHpBZbZvOrak4BfCKjDc88KPzcKNwPPcZQhKcM8
 v5YEYBoy0Ekm3pejGItHBrBLpYeVVNKvGT1pINgRKkodbr6yW7DKc6/cIAe7dcAV5HpE
 7P3elDX5TrDcNGmalPV06mQ/kaSxakQ1ez92x1y6iT6bGNYULBBFIAjhSaIiLI4wTaP0
 O8/Fstqh0nQVOuJEmFJkkp9rLA+4ZF3oeX4nInL4hX1SdvCrYapONI8viBQ6E4Ixsra4
 ZRSTmn73xRcT6BeROEjxpHFlSv6hpCQmuZ91px/kENt8ydgmRlsqDcl3bHRFF3yuXq4F
 8lfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ZkRNIzEazpDtrjnLPl+RehOTUBtXdRV9tdkWZ1HIaQm+o6ztVPd3zIoI2LwbYcsn5syfl5bNtgw==@nongnu.org
X-Gm-Message-State: AOJu0YzyEq6dtc4NV390dngAh5IBmvtGqlJXsJz8YlHh5UHR2NVGNREh
 iYvDZCXDBmShu7h46YEhwpx0ZHAG1pzQ4Crj6ZuBrF788RyibYN8Hk4e9Nx+OiUDcio=
X-Gm-Gg: Acq92OGj/IoWf49f3KZEwM1ej7hBGm3hh/bGzBfx47YxqesaOM+LIj7MwJmW1Otp+Mk
 TLmcS3K5dTymBKQNdv+kQZ8EV8FuovXKNvThuehp9IPfzf4QGUVWr9xQzkD2v4PyqTKAbhjf8Ky
 sZ6fH7wPIysrFa/wftO0fz6Ln15sH48SPeAz3OcWtn9HGfopbpFdHR0EFK6Hyj5Wq6snY13/TLa
 Adn4E+uStHc8Np8tgnBFIEm/OzwPdt+zwvpiQ1JZ8Rz5NtENRTLZ83R1xZ9mIKPZJp9yKy4rWIl
 Lw8aAtc29Fs82h7egECCS7VR35MEFzTerz923ae3Gm/RsOnFzMLNw6jBqqac0FmEEFzIEepuYT0
 8BMP8jMoj+nbTDZY4H5Z++T+TGzUyXf/ILmDu8KCgSTNGPSln/3thvaYA2iqE6glLNeDQJzKgJH
 Tf8jCaZKMP/J0+rTabeifdy+z/lBiKeeAmuNPIfnAxcs6y
X-Received: by 2002:a05:600d:10f:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490b0e0427dmr6221195e9.33.1780335040907; 
 Mon, 01 Jun 2026 10:30:40 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c0495fcsm131085785e9.0.2026.06.01.10.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2026 10:30:40 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 212FC5F7C7;
 Mon, 01 Jun 2026 18:30:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Fabiano Rosas <farosas@suse.de>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Brian Cain
 <brian.cain@oss.qualcomm.com>,  John Snow <jsnow@redhat.com>,  Thomas Huth
 <th.huth+qemu@posteo.eu>,  Brad Smith <brad@comstyle.com>,  Warner Losh
 <imp@bsdimp.com>,  qemu-arm@nongnu.org,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Song Gao <gaosong@loongson.cn>,  Cornelia
 Huck <cohuck@redhat.com>
Subject: Re: [PATCH 2/3] gitlab: work around the inability to build targets
 for MacOS
In-Reply-To: <22a283dc-38a5-44f5-b402-c334205e81cc@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Mon, 1 Jun 2026 09:44:28 -0700")
References: <20260601143129.144786-1-alex.bennee@linaro.org>
 <20260601143129.144786-3-alex.bennee@linaro.org>
 <57d0477a-3bbd-4948-8e18-33df41991545@oss.qualcomm.com>
 <87bjduxmne.fsf@draig.linaro.org>
 <22a283dc-38a5-44f5-b402-c334205e81cc@oss.qualcomm.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Mon, 01 Jun 2026 18:30:39 +0100
Message-ID: <875x42xj5s.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:

> On 6/1/2026 9:15 AM, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>=20
>>> On 6/1/2026 7:31 AM, Alex Benn=C3=A9e wrote:
>>>> Unfortunately a previous fix to ensure .ninja-goals was set for the
>>>> TCG tests broken the ability to run check-functional-FOO. As we have
>>>> now reverted we need a solution for the MacOS gitlab run. The simplest
>>>> is to add an explicit make invocation to build the signed binaries
>>>> before we run the tests.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>>  .gitlab-ci.d/macos.yml | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
>>>> index f61750a3f4a..8366b4ad564 100644
>>>> --- a/.gitlab-ci.d/macos.yml
>>>> +++ b/.gitlab-ci.d/macos.yml
>>>> @@ -29,6 +29,7 @@
>>>>      - cd build
>>>>      - ../configure --enable-werror $CONFIGURE_ARGS || { cat config.lo=
g meson-logs/meson-log.txt; exit 1; }
>>>>      - $MAKE -j$(sysctl -n hw.ncpu)
>>>> +    - for TARGET in $TEST_BINARIES ; do $MAKE $TARGET ; done
>>>>      - for TARGET in $TEST_TARGETS ; do $MAKE $TARGET ; done
>>>>=20=20
>>>>  aarch64-macos-15-build:
>>>> @@ -44,6 +45,7 @@ aarch64-macos-15-build:
>>>>          --cross-prefix-i386=3Di686-elf-
>>>>          --cross-prefix-x86_64=3Dx86_64-elf-
>>>>          --disable-plugins
>>>> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x=
86_64
>>>>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-te=
sts-i386-softmmu run-tcg-tests-x86_64-softmmu
>>>>=20=20
>>>>  aarch64-macos-26-build:
>>>> @@ -60,4 +62,5 @@ aarch64-macos-26-build:
>>>>          --cross-prefix-i386=3Di686-elf-
>>>>          --cross-prefix-x86_64=3Dx86_64-elf-
>>>>          --disable-plugins
>>>> +    TEST_BINARIES: qemu-system-aarch64 qemu-system-i386 qemu-system-x=
86_64
>>>>      TEST_TARGETS: check-unit run-tcg-tests-aarch64-softmmu run-tcg-te=
sts-i386-softmmu run-tcg-tests-x86_64-softmmu
>>>
>>> Could make all be enough?
>>=20
>> No - not without the goal having the signed binaries in them.
>>
>
> Which comes back to my initial (unanswered question), why do we need
> signed binaries for running tcg tests?
> Signed is only for HVF access.

Because it exposes a bug in our build system: 20260505103649.68361-1-alex.b=
ennee@linaro.org

Ideally we should build the final product - whatever it may be - from
make all. However I suspect we can't achieve that given the circular
Makefile dependency until check-tcg is integrated into meson.

I will review you suggested path forwards tomorrow.

>
>>>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

