Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d5549000000b00307acec258esm7534496wrw.3.2023.06.26.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:39:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BA31E1FFBB;
	Mon, 26 Jun 2023 14:39:39 +0100 (BST)
References: <20230623122100.1640995-1-alex.bennee@linaro.org>
 <20230623122100.1640995-27-alex.bennee@linaro.org>
 <0c245101-77cf-9e9a-3c84-0293a75125b6@redhat.com>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>, Peter Xu
 <peterx@redhat.com>, qemu-arm@nongnu.org, Eduardo Habkost
 <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Alexander Bulekov <alxndr@bu.edu>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Leonardo Bras <leobras@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Stefan Hajnoczi
 <stefanha@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: Re: [PATCH 26/26] docs/devel: introduce some key concepts for QOM
 development
Date: Mon, 26 Jun 2023 14:39:14 +0100
In-reply-to: <0c245101-77cf-9e9a-3c84-0293a75125b6@redhat.com>
Message-ID: <87cz1i2vhg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +6/Yd+r8/YqK


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 6/23/23 14:21, Alex Benn=C3=A9e wrote:
>> Using QOM correctly is increasingly important to maintaining a modern
>> code base. However the current documentation skips some important
>> concepts before launching into a simple example. Lets:
>>    - at least mention properties
>>    - mention TYPE_OBJECT and TYPE_DEVICE
>>    - talk about why we have realize/unrealize
>>    - mention the QOM tree
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> Message-Id:<20230619171437.357374-6-alex.bennee@linaro.org>
>
> There were review comments on this series that haven't been applied.

Sorry I'd missed those. I've fixed that for the respin which is
currently checking on CI.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
