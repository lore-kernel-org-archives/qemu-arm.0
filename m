Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c339800b0040303a9965asm4322681wmp.40.2023.10.19.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:43:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EB4991FFBB;
	Thu, 19 Oct 2023 13:43:11 +0100 (BST)
References: <cover.1697183699.git.manos.pitsidianakis@linaro.org>
 <2e08cff874b2f9fc4143bdcde87ebba9b70b356c.1697183699.git.manos.pitsidianakis@linaro.org>
 <871qdsb4qd.fsf@linaro.org> <2q0zq.6gn2tubfhjrk@linaro.org>
 <87sf689is8.fsf@linaro.org>
 <CAFEAcA9DQ6oR3fNicuUpntfZ8QdSA8PqO5irRuzNrpkpXUJUCA@mail.gmail.com>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RFC PATCH v2 01/78] include/qemu/compiler.h: replace
 QEMU_FALLTHROUGH with fallthrough
Date: Thu, 19 Oct 2023 13:42:00 +0100
In-reply-to: <CAFEAcA9DQ6oR3fNicuUpntfZ8QdSA8PqO5irRuzNrpkpXUJUCA@mail.gmail.com>
Message-ID: <87ttqm940w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IpzyCrGbh2Gz


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 18 Oct 2023 at 14:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>>
>> > On Wed, 18 Oct 2023 13:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>> >>> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
>> >>> index 3ce5f6507b..bf26fadb06 100644
>> >>> --- a/audio/pwaudio.c
>> >>> +++ b/audio/pwaudio.c
>> >>> @@ -1,29 +1,29 @@
>> >>>  /*
>> >>>   * QEMU PipeWire audio driver
>> >>>   *
>> >>>   * Copyright (c) 2023 Red Hat Inc.
>> >>>   *
>> >>>   * Author: Dorinda Bassey       <dbassey@redhat.com>
>> >>>   *
>> >>>   * SPDX-License-Identifier: GPL-2.0-or-later
>> >>>   */
>> >>>  +#include <spa/param/audio/format-utils.h>
>> >>> +#include <spa/utils/ringbuffer.h>
>> >>> +#include <spa/utils/result.h>
>> >>> +#include <spa/param/props.h>
>> >>>  #include "qemu/osdep.h"
>> >>>  #include "qemu/module.h"
>> >>>  #include "audio.h"
>> >>>  #include <errno.h>
>> >>>  #include "qemu/error-report.h"
>> >>>  #include "qapi/error.h"
>> >>> -#include <spa/param/audio/format-utils.h>
>> >>> -#include <spa/utils/ringbuffer.h>
>> >>> -#include <spa/utils/result.h>
>> >>> -#include <spa/param/props.h>
>> >>
>> >>Was this an autofmt change sneaking in? osdep.h should always be first
>> >>per style.rst.
>> >
>> > It should have been mentioned in the commit message and in a code
>> > comment. libspa throws errors because the preprocessor changes
>> > `fallthrough` to our macro definition. I do not like the reordering.
>> > My other thought was to undef fallthrough and re-include
>> > "qemu/compiler.h" after the libspa includes.
>>
>> Ahh this stuff:
>>
>>   #if defined(__clang__) && defined(__cplusplus) && __cplusplus >=3D 201=
103L
>>      /* clang's fallthrough annotations are only available starting in C=
++11. */
>>   #  define SPA_FALLTHROUGH [[clang::fallthrough]];
>>   #elif __GNUC__ >=3D 7 || __clang_major__ >=3D 10
>>   #  define SPA_FALLTHROUGH __attribute__ ((fallthrough));
>>   #else
>>   #  define SPA_FALLTHROUGH /* FALLTHROUGH */
>>   #endif
>>
>> I think this is papering over a potential problem we might have with
>> multiple libraries and probably an argument in favour of an explicit
>> QEMU_FALLTHROUGH macro to avoid the attribute clash.
>
> Is there a reason this thread lost the qemu-devel cc ?

Not deliberately. I think my mail clients objected to open list:ARM SMMU
<qemu-arm@nongnu.org> and skipped the last two CC's and I didn't notice.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
