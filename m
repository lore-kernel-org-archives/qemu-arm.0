Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q7sm1514665wrx.6.2019.07.10.02.30.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 02:30:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 005131FF87;
	Wed, 10 Jul 2019 10:30:23 +0100 (BST)
References: <20190705160421.19015-1-alex.bennee@linaro.org> <20190705160421.19015-6-alex.bennee@linaro.org> <CAL1e-=i08h1j0V7d97p7a-OQqdNXzG1s5QATmLDxfGCDtwE-4Q@mail.gmail.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Jon Doron <arilou@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg behaviour
In-reply-to: <CAL1e-=i08h1j0V7d97p7a-OQqdNXzG1s5QATmLDxfGCDtwE-4Q@mail.gmail.com>
Date: Wed, 10 Jul 2019 10:30:23 +0100
Message-ID: <87o922dyog.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5KpQfK/d+AP/


Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> On Jul 5, 2019 6:08 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>>
>> The refactoring of handle_set_reg missed the fact we previously had
>> responded with an empty packet when we were not using XML based
>> protocols. This broke the fallback behaviour for architectures that
>> don't have registers defined in QEMU's gdb-xml directory.
>>
>> Revert to the previous behaviour and clean up the commentary for what
>> is going on.
>>
>> Fixes: 62b3320bddd
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Cc: Jon Doron <arilou@gmail.com>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>
> Do you plan to integrate this patch in 4.1?
>
> Thanks, Aleksandar

Yes - I'm putting together a PR today.

>
>>  gdbstub.c | 18 ++++++++++++------
>>  1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index ea3349d1aa..b6df7ee25a 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext
> *gdb_ctx, void *user_ctx)
>>      put_packet(gdb_ctx->s, "E22");
>>  }
>>
>> +/*
>> + * handle_set/get_reg
>> + *
>> + * Older gdb are really dumb, and don't use 'G/g' if 'P/p' is available.
>> + * This works, but can be very slow. Anything new enough to understand
>> + * XML also knows how to use this properly. However to use this we
>> + * need to define a local XML file as well as be talking to a
>> + * reasonably modern gdb. Responding with an empty packet will cause
>> + * the remote gdb to fallback to older methods.
>> + */
>> +
>>  static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
>>  {
>>      int reg_size;
>>
>>      if (!gdb_has_xml) {
>> -        put_packet(gdb_ctx->s, "E00");
>> +        put_packet(gdb_ctx->s, "");
>>          return;
>>      }
>>
>> @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx,
> void *user_ctx)
>>  {
>>      int reg_size;
>>
>> -    /*
>> -     * Older gdb are really dumb, and don't use 'g' if 'p' is avaialabl=
e.
>> -     * This works, but can be very slow.  Anything new enough to
>> -     * understand XML also knows how to use this properly.
>> -     */
>>      if (!gdb_has_xml) {
>>          put_packet(gdb_ctx->s, "");
>>          return;
>> --
>> 2.20.1
>>
>>


--
Alex Benn=C3=A9e
