Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d590b000000b003247d3e5d99sm4405132wrd.55.2023.10.19.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:40:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A1ACC1FFBB;
	Thu, 19 Oct 2023 13:40:24 +0100 (BST)
References: <20230731091042.139159-1-akihiko.odaki@daynix.com>
 <20230731091042.139159-3-akihiko.odaki@daynix.com>
 <8df33f0f-c394-5eb8-ca0c-5601790745f8@redhat.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Juan Quintela <quintela@redhat.com>, Peter Xu
 <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Brian Cain <bcain@quicinc.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Song Gao
 <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Aurelien Jarno
 <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek
 Vasut <marex@denx.de>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/2] tests/tcg: Add -fno-stack-protector
Date: Thu, 19 Oct 2023 13:40:06 +0100
In-reply-to: <8df33f0f-c394-5eb8-ca0c-5601790745f8@redhat.com>
Message-ID: <87y1fy945j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iemykcIYOqQf


Thomas Huth <thuth@redhat.com> writes:

> On 31/07/2023 11.10, Akihiko Odaki wrote:
>> A build of GCC 13.2 will have stack protector enabled by default if it
>> was configured with --enable-default-ssp option. For such a compiler,
>> it is necessary to explicitly disable stack protector when linking
>> without standard libraries.
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   tests/tcg/mips/hello-mips.c       | 4 ++--
>>   tests/tcg/Makefile.target         | 2 +-
>>   tests/tcg/aarch64/Makefile.target | 2 +-
>>   tests/tcg/arm/Makefile.target     | 2 +-
>>   tests/tcg/cris/Makefile.target    | 2 +-
>>   tests/tcg/hexagon/Makefile.target | 2 +-
>>   tests/tcg/i386/Makefile.target    | 2 +-
>>   tests/tcg/minilib/Makefile.target | 2 +-
>>   tests/tcg/mips/Makefile.target    | 2 +-
>>   9 files changed, 10 insertions(+), 10 deletions(-)
>> diff --git a/tests/tcg/mips/hello-mips.c
>> b/tests/tcg/mips/hello-mips.c
>> index 4e1cf501af..0ba5f1bf23 100644
>> --- a/tests/tcg/mips/hello-mips.c
>> +++ b/tests/tcg/mips/hello-mips.c
>> @@ -5,8 +5,8 @@
>>   * http://www.linux-mips.org/wiki/MIPSABIHistory
>>   * http://www.linux.com/howtos/Assembly-HOWTO/mips.shtml
>>   *
>> -* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -mabi=3D32 \
>> -*                  -O2 -static -o hello-mips hello-mips.c
>> +* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -fno-stack-protecto=
r \
>> +                   -mabi=3D32 -O2 -static -o hello-mips hello-mips.c
>
> You've lost the "*" at the beginning of the comment line here.
>
> But apart from that nit, the patch looks sane to me.
>
> Cc:-ing Alex Benn=C3=A9e ... could pick this patch up?

Queued to testing/next with tweak to comment, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
