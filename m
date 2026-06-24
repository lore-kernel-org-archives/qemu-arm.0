Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EBACDE001
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:53:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPui-0007gH-2H; Wed, 24 Jun 2026 11:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcPuf-0007fg-SR
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:53:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcPue-0000bB-1p
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:53:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-46255b269c2so839481f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782316394; x=1782921194; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ZpPczxO2onEBhX7cgVjiZzCd0z2iIMUj2syRzJFcOg=;
 b=sENbT2Jc2taxV5KluMTmoS59mGmKN6pHnVh/HTHe+K/+wKOBhk+BQH4FGePj4htWgr
 Se236diSAW4+/vhi8t13JPIOSv0t6YoIKO6pUh0ot1d8VzLmSer4TWxbVSumT+UM80Ne
 Q8ZaR9evQf2TDBHq6E8b3ZPq1tqcH97Uadr4LUeR3PtXYBTL7qN1A+4ygki/WNFuxD88
 B0uJp6GbpIX7dUZ+bbRm4S+EBo21ewxmKXTYVJtiU4pPGHO9DpPjuiFfb2OyNytBPWni
 tVtArOCyRMDYQUGn6dVE46fQ6sB1kUSSo5WvI6/H6kNHk/kXbFdgNi/ul/xJbO1AmA3i
 2+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782316394; x=1782921194;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZpPczxO2onEBhX7cgVjiZzCd0z2iIMUj2syRzJFcOg=;
 b=TL5pGtZ/C55EIKNdNzF3OW/6WM0VeNdi9bcZNrCm3070qoqbGddIqP0/x0c/OWeqVM
 m3CaSCtjqGrCb/hPoUHEnQ2+M5O277SxUnK2f5XdpTYAyV+yJI51BfMyV1BoCnoul7Mx
 YH0vCHR9Vt4zFsWiTyY1iHzO4cUtDTYKIM8ALLeMZYlPsdAmX0DCq7M/nHloseUILgZa
 40p+dLtiybCuxNEhATRE/iwR5u0JfeeBDH2sbRnUDseHLg36TArK2wMtIfmfHMe40Oj0
 8mOk+u65hkSPswg+XhS9BuMTRcZGIqkQTCcXZSP7DbxzFbhSExoNL63JA+A9ak0+yu5c
 j7ag==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro9qHl8OHmOj4LCmvE6KCS8ct91p4atfEnK6/jp9/JlYb/H39lC34+WoUbXs2pXYZ8pfOzXb0rW8Q==@nongnu.org
X-Gm-Message-State: AOJu0YwNB/AKozgIimTzRzmRVKSL2LgXF3tzabNm68AmLUmqw27rlzEW
 A5C8Aq0kmnBYzhpcqF4a3Chp+/Y1oQ3dguFniPmCNuaycd69C04K3qspgVHVaG8pxXk=
X-Gm-Gg: AfdE7cnJPZTs040hVMYxJBf+AWJxf9tq5uq3hgPaTlTeSA7LpiTB/ycYPfoqVwGcTSP
 qh0dCxx6NQJvhA+MP603+zCkSZzW2YoWUjKnG4W/pc8ziWPeE0vYmQTkJIxg7A+iyD2Bp3KTlo7
 ig5aaYan8vUmuFiBYP9+6Hxv3JPMwtUblhjhb9T0B+2eqrkWNnJbjTGTHO1EvEytlbxHostJLDt
 Q0hCTC0Kc65vbIbOEjW0Sz+I1ufOR1FH8sbn3rRAOpBUaTepKux966TUnwr22vk0JtVipLF39HG
 vNiWBvBFMEo6Gm/GP/CXnQEF+dfN7GQypcv2aSuGXemleemR6cEF2wl8zSLe6cmvxcYq3EwHkvP
 vZv3WXRM57AWSBJ9Q/RamavwGrtxpnFCl87asiXeMLX9Ne3n93dhXEizqwd1bZ5QbmqiKl42hw9
 RU6jr//STrpqqh
X-Received: by 2002:a05:6000:44d7:b0:460:2ee5:67b8 with SMTP id
 ffacd0b85a97d-46c07569d64mr4593194f8f.36.1782316393381; 
 Wed, 24 Jun 2026 08:53:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee01c3bsm8633576f8f.10.2026.06.24.08.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 08:53:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E43CD5F807;
 Wed, 24 Jun 2026 16:53:11 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 07/27] tests/tcg/meson.build: introduce cflags
In-Reply-To: <20260609214745.772536-8-pierrick.bouvier@oss.qualcomm.com>
 (Pierrick Bouvier's message of "Tue, 9 Jun 2026 14:47:25 -0700")
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-8-pierrick.bouvier@oss.qualcomm.com>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Wed, 24 Jun 2026 16:53:11 +0100
Message-ID: <87echwj5p4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> We add possibility to declare cflags for a given test. Since we want to
> preserve the uniqueness of test binaries, we prevent repeating those
> cflags later, for an existing binary.
>
> This ensures one executable =3D=3D one set of cflags, and if dev needs
> duplication, they can use a custom 'exe_name' to override this.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  tests/tcg/meson.build | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
> index bb0184732fd..ad56fdf4ab5 100644
> --- a/tests/tcg/meson.build
> +++ b/tests/tcg/meson.build
> @@ -13,6 +13,7 @@ tcg_tests =3D {}
>  #         'src_file': {
>  #           'exe_name': ['provide an alternative binary name'],
>  #           'test_name': ['provide an alternative test name'],
> +#           'cflags': ['cflags to compile test', ...],

additional cflags to compile test?

>  #         }
>  #       },
>  #       ...
> @@ -20,7 +21,8 @@ tcg_tests =3D {}
>  #   }
>  # }
>  #
> -# Every test executable, identified by 'exe_name' is built only once.
> +# Every test executable, identified by 'exe_name' is built only once, an=
d we
> +# ensure cflags are specified only once, on first declaration.
>  # Tests for a given src use the same executable by default, and their de=
finition
>  # is guaranteed to be unique also. They can be duplicated by setting 'te=
st_name'.
>  # Default name is derived from src if 'exe_name' and 'test_name' are omi=
tted.
> @@ -51,7 +53,7 @@ foreach target, plan: tcg_tests
>      foreach src, setup: t
>        # return a clear error if user mispell a setup entry
>        foreach key, _ : setup
> -        if key not in [
> +        if key not in ['cflags',
>                         'exe_name', 'test_name',
>                         ]
>            error('unknown tcg setup entry \'' + key + '\' for test ' + sr=
c)
> @@ -80,6 +82,15 @@ foreach target, plan: tcg_tests
>                'specify a different \'test_name\'')
>        endif
>=20=20
> +      cflags =3D []
> +      if 'cflags' in setup
> +        if exe_name in built_tests
> +          error('test ' + exe_name + ' was already built with cflags: ' +
> +                'remove cflags or set \'exe_name\' (if cflags are differ=
ent)')
> +        endif
> +        cflags =3D setup['cflags']
> +      endif
> +
>        # build executable if needed
>        if exe_name not in built_tests
>          exe =3D custom_target(exe_name,
> @@ -89,7 +100,7 @@ foreach target, plan: tcg_tests
>                                        '-MMD', '-MF', '@DEPFILE@',
>                                        '-Wall', '-Werror',
>                                        '-O0', '-g', '-fno-strict-aliasing=
',
> -                                      ],
> +                                      cflags],
>                              depfile: exe_name + '.d',
>                              output: exe_name + '.test',
>                              build_by_default: false)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

