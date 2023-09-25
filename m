Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b00405ee9dc69esm366355wmj.18.2023.09.25.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:44:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CEEA41FFBB;
	Mon, 25 Sep 2023 17:44:58 +0100 (BST)
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-9-alex.bennee@linaro.org>
 <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>,
 libvir-list@redhat.com, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas
 Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>,
 Cleber Rosa <crosa@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bin Meng
 <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, David Hildenbrand
 <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 08/31] configure: ensure dependency for cross-compile setup
Date: Mon, 25 Sep 2023 17:42:22 +0100
In-reply-to: <908ae9aa-11fc-8584-bd60-e269a1026e37@redhat.com>
Message-ID: <87cyy6rylx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qDKsjsCKGngp


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 9/25/23 16:48, Alex Benn=C3=A9e wrote:
>> If we update configure we should make sure we regenerate all the
>> compiler details. We should also ensure those details are upto date
>> before building the TCG tests.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   configure | 2 ++
>>   1 file changed, 2 insertions(+)
>> diff --git a/configure b/configure
>> index e83872571d..a95e0f5767 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1788,6 +1788,8 @@ for target in $target_list; do
>>             echo "HOST_GDB_SUPPORTS_ARCH=3Dy" >> "$config_target_mak"
>>         fi
>>   +      echo "$config_target_mak: configure" >> Makefile.prereqs
>
> This in practice is not adding anything; if "configure" changes then
> Makefile's dependency on config-host.mak will trigger a configure
> rerun anyway.
>
> If you want to add it, you should also add it for other config-*.mak
> files.  However, I'd remove this line and just change
>
> -# 1. ensure config-host.mak is up-to-date
> +# 1. ensure config-host.mak is up-to-date.  All other config-*.mak
> +# files for subdirectories will be updated as well.

Peter ran into a mismatch between config-host.mak and
tests/tcg/foo/config-target.mak in his build system so it didn't get
picked up at one point.

>
> in the Makefile.
>
> Paolo


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
