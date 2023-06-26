Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j9-20020a5d4649000000b0031118d80246sm8278477wrs.29.2023.06.26.13.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 13:23:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7DB6E1FFBB;
	Mon, 26 Jun 2023 21:23:07 +0100 (BST)
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-8-alex.bennee@linaro.org>
 <CAFEAcA8QX55yeTb+DFxwzd=ntOS8nH95xtQKPNGLiQRvC1=Fcg@mail.gmail.com>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss
 <erdnaxe@crans.org>, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Bandan Das
 <bsd@redhat.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Bulekov <alxndr@bu.edu>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Qiuhao Li
 <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leonardo Bras <leobras@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng
 <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH 07/26] qemu-keymap: properly check return from
 xkb_keymap_mod_get_index
Date: Mon, 26 Jun 2023 21:21:14 +0100
In-reply-to: <CAFEAcA8QX55yeTb+DFxwzd=ntOS8nH95xtQKPNGLiQRvC1=Fcg@mail.gmail.com>
Message-ID: <87zg4m0y8k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ELEG5/WDWsHT


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 23 Jun 2023 at 13:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We can return XKB_MOD_INVALID which rightly gets flagged by sanitisers
>> as an overly wide shift attempt.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Same comments as on the first version of this patch:
> looks OK code-wise, but have you eyeballed the output?

I've eyeballed it but practically it doesn't seem to make any difference
to the output:

  =F0=9F=95=9921:20:36 alex@zen:qemu.git/builds/all  (399fc0c) (REBASING 2/=
22) [$!?]=20
  =E2=9E=9C  diff -ub gb.before gb.after
  =F0=9F=95=9921:20:43 alex@zen:qemu.git/builds/all  (399fc0c) (REBASING 2/=
22) [$!?]=20
  =E2=9E=9C  diff -ub ara.before ara.after

> Does the keyboard layout that triggers this have no
> AltGr at all, or does it call it by a different name?

Certainly not ara or gb:

  9: Alt
23:#    11: LAlt
24:#    12: RAlt
29:#    17: AltGr
294:Alt_L 0x38
1711:Alt_R 0xb8
=F0=9F=95=9921:22:14 alex@zen:qemu.git/builds/all  (399fc0c) (REBASING 2/22=
) [$!?]=20
=E2=9E=9C  ag "Alt" gb.after=20
21:#     9: Alt
23:#    11: LAlt
24:#    12: RAlt
29:#    17: AltGr
338:Alt_L 0x38
1757:Alt_R 0xb8

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
