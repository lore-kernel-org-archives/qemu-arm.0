Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe74d000000b0030ae499da59sm903980wrn.111.2023.06.29.06.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 06:47:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB4341FFBB;
	Thu, 29 Jun 2023 14:47:48 +0100 (BST)
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-16-alex.bennee@linaro.org>
 <fd860df5-f8d0-77ef-f99f-629f1631d577@linaro.org>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Juan Quintela <quintela@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, Radoslaw
 Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>, Paolo
 Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das
 <bsd@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Laurent Vivier <lvivier@redhat.com>, Qiuhao
 Li <Qiuhao.Li@outlook.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, Riku
 Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH v3 15/36] tests/docker: convert riscv64-cross to lcitool
Date: Thu, 29 Jun 2023 14:47:44 +0100
In-reply-to: <fd860df5-f8d0-77ef-f99f-629f1631d577@linaro.org>
Message-ID: <87o7kyxtvf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cYBpRhhlqugk


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/27/23 18:09, Alex Benn=C3=A9e wrote:
>> --- a/tests/lcitool/projects/qemu-minimal.yml
>> +++ b/tests/lcitool/projects/qemu-minimal.yml
>> @@ -4,6 +4,8 @@ packages:
>>    - bash
>>    - bc
>>    - bison
>> + - ccache
>> + - findutils
>>    - flex
>>    - g++
>>    - gcc
>> @@ -21,3 +23,5 @@ packages:
>>    - pkg-config
>>    - python3
>>    - python3-venv
>> + - sed
>> + - tar
>
> Same comment as against v2: Why not squash this patch with previous,
> which adds qemu-minimal.yml.  Especially since you're changing it here
> in the next patch.

Done.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
