Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C3CCDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 17:27:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcRNf-0003dO-6a; Wed, 24 Jun 2026 13:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcRNY-0003ZA-Dg
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 13:27:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wcRNV-0001ji-6w
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 13:27:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso9781285e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782322027; x=1782926827; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yRVV7/eFbpbkCMGXUXw0L3SSwHfWwpq4buXl41AsEs=;
 b=S9+GgMUEWkq459nwjjahZLuYEETd9F4iVRhntcUKVCitFl1Vueo2Ligs/aPI1gNfEj
 ehQFxUR0FHw+t4V8k3/wQyLm34rEZ1iB5xnhz4RNK6ArpcjNCkHZ65KvQk75oaw2aEMW
 9iJyZQL6SpuXR6BIihUapDnGBk1GPQuvFG1Audsu2DCfvp20k9siBOtaw/Q0nPPYzuEx
 X+tICn16rwrs8MrAkJNS7TikExYYNARPW9GTuuH+U6z69PCJc4j2te9tXmoxjz+cO/bH
 YqF6GkrX7PHfthikW3GROPrFrGVtMd3m62YX4x5bslx88w49briQcnxM/1hgigjuZABU
 XV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782322027; x=1782926827;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yRVV7/eFbpbkCMGXUXw0L3SSwHfWwpq4buXl41AsEs=;
 b=gSTWMHsLnw2dPqTVVZbOwO94s+xXGEa2mljjgpKEUbLktMEHPVEyYw6yUilFqVgA/1
 FSp/rpTvu3K5Fg5iG3/Mst5uwOeJ88QVGmX8wqKzacWbova9pL9E1k74IIo9eMzcdFmX
 NeAGXRNpgbwjDYK145zSQZLXlkt+6uxcSNSIKR6Tx76ae1YbExN4EMZ4LYaH6hI9sWVM
 cCtTafWKXHKke93SPJEL9zoZAUEF0A18ONcgnw5BpKeYOHa0IARDJz+eXOyM72aUzq/2
 Lg+D8IB/l9iynLXOrDKV0J0mBRUirURPZSGbNy9sfidO1tYdoy12p8cN4tffuJNQOgWt
 ikcA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8lxKojQXY/ejho22y7KhkJc9n7bV3YNzrTkqVG30xM6iQLjSCNQnQT0adavIrk2LP96W9EIEHkvg==@nongnu.org
X-Gm-Message-State: AOJu0YzFqFlzUp3n70iloF338Ap2cAM4Pt+CzgE58zPfWK2BqwVWAx2R
 kwC+McaNlNE1nhyqoW9kLuowqsJBtX7TLBvBRdJKxk2Fskh3Nyh7TBRzBE7vKMbqgOo=
X-Gm-Gg: AfdE7cnlTvkqxsga5Kvzuf1eL3Sq2Mx5VGEiAq6X9QzghBKk+nblxEdPKoFp57l712L
 kB3wHAFA5+6tgaYINvvTe1orVAODfBcKhnCJXpEsfTHPIVALXSuW/QHcuqzsp70EyS51LgfNCjQ
 xi1V84o6hWkTjf2r5l6oKgokdfy5jdorNqLCsKWCeXCoQ62/BEnll7XtFGDv5f4uaM838BSbfu2
 HbZflZ7phjLLqD3e+8F/PKO3Rt0R/JkDWRTUvLTlR+Th6Eem/ZAHD6TfKWVW0jMqSbF5z3qxuF8
 EyYZAHoS7hOTjDNkh32/62Dp1e6VbkQWbLgm68yqSukwh+2ZN0MWME3c4Xn+o+ObAbg84y7z+KT
 NYFzZ/K7+Cs8H5vc+Q1IsDa7nFjjmicy6qris0Kn8+IKlCW/CKdCPLoodmBc1TlPMrdRHClAuuj
 yDJNuSTpkrn1k4tbtxPYqQ5QM=
X-Received: by 2002:a05:600c:46c3:b0:492:3214:cbe6 with SMTP id
 5b1f17b1804b1-49260873578mr55196115e9.23.1782322027376; 
 Wed, 24 Jun 2026 10:27:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926404ee91sm7360145e9.14.2026.06.24.10.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 10:27:06 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B40865F807;
 Wed, 24 Jun 2026 18:27:05 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH 05/27] tests/tcg/meson.build: introduce exe_name
In-Reply-To: <eac12939-fa27-4282-8913-1fbf463702a9@oss.qualcomm.com> (Pierrick
 Bouvier's message of "Wed, 24 Jun 2026 10:01:12 -0700")
References: <20260609214745.772536-1-pierrick.bouvier@oss.qualcomm.com>
 <20260609214745.772536-6-pierrick.bouvier@oss.qualcomm.com>
 <87pl1gj7vh.fsf@draig.linaro.org>
 <eac12939-fa27-4282-8913-1fbf463702a9@oss.qualcomm.com>
User-Agent: mu4e 1.14.2; emacs 30.1
Date: Wed, 24 Jun 2026 18:27:05 +0100
Message-ID: <8733ybkfx2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> On 6/24/2026 8:06 AM, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com> writes:
>>=20
>>> We add possibility to duplicate a test executable for a given source
>>> file. This is needed when different cflags need to be used (like
>>> vectorized vs non-vectorized for instance, like sve tests in aarch64).
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> ---
>>>  tests/tcg/meson.build | 17 +++++++++++++++--
>>>  1 file changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
>>> index 72d1a9f8986..2c6d85c586a 100644
>>> --- a/tests/tcg/meson.build
>>> +++ b/tests/tcg/meson.build
>>> @@ -11,6 +11,7 @@ tcg_tests =3D {}
>>>  #     'tests': [
>>>  #       {
>>>  #         'src_file': {
>>> +#           'exe_name': ['provide an alternative binary name'],
>>>  #         }
>>>  #       },
>>>  #       ...
>>> @@ -18,10 +19,10 @@ tcg_tests =3D {}
>>>  #   }
>>>  # }
>>>  #
>>> -# Every test executable, is built only once.
>>> +# Every test executable, identified by 'exe_name' is built only once.
>>>  # Tests for a given src use the same executable by default, and their =
definition
>>>  # is guaranteed to be unique also.
>>> -# Default name is derived from src.
>>> +# Default name is derived from src if 'exe_name' is omitted.
>>>=20=20
>>>  # plugins come first, as we need to build the list
>>>  subdir('plugins')
>>> @@ -47,11 +48,23 @@ foreach target, plan: tcg_tests
>>>=20=20
>>>    foreach t : tests
>>>      foreach src, setup: t
>>> +      # return a clear error if user mispell a setup entry
>>> +      foreach key, _ : setup
>>> +        if key not in [
>>> +                       'exe_name',
>>> +                       ]
>>> +          error('unknown tcg setup entry \'' + key + '\' for test ' + =
src)
>>> +        endif
>>> +      endforeach
>>> +
>>>        # meson '/' operator drops left operand if right is an absolute =
path
>>>        src =3D folder / src
>>>        file =3D files(src)
>>>        test =3D fs.name(file)
>>>        exe_name =3D fs.stem(src)
>>> +      if 'exe_name' in setup
>>> +        exe_name =3D setup['exe_name']
>>> +      endif
>>>
>>=20
>> Would it be better to put exe_name =3D fs.stem(src) in an else leg?
>>
>
> The rest of the file follow the pattern
> var =3D default
> if (different)
>   var =3D other
>
> So better to stick with one pattern for consistency.

Sure - but the other meson files seem to follow the other pattern, e.g.:=20

if cpu not in supported_cpus
  host_arch =3D 'unknown'
else
  host_arch =3D cpu
endif


> It absolutely does not matter for "performance".
>
>> Anyway:
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>>=20
>>>        exe_name =3D target + '-' + exe_name
>>>        test_name =3D exe_name
>>=20

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

