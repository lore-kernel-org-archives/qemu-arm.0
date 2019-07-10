Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x24sm2656648wmh.5.2019.07.10.08.28.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 08:28:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 97B621FF87;
	Wed, 10 Jul 2019 16:28:27 +0100 (BST)
References: <20190705160421.19015-1-alex.bennee@linaro.org> <20190705160421.19015-5-alex.bennee@linaro.org> <aec9314d-c1e9-2521-6170-d8ce6be97a97@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 4/5] gdbstub: add some notes to the header comment
In-reply-to: <aec9314d-c1e9-2521-6170-d8ce6be97a97@linaro.org>
Date: Wed, 10 Jul 2019 16:28:27 +0100
Message-ID: <87k1cpewo4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: azwiU6g7/lzS


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/5/19 6:04 PM, Alex Benn=C3=A9e wrote:
>> Add a link to the remote protocol spec and an SPDX tag.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  gdbstub.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 8618e34311..ea3349d1aa 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1,6 +1,10 @@
>>  /*
>>   * gdb server stub
>>   *
>> + * This implements a subset of the remote protocol as described in:
>> + *
>> + *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
>> + *
>
> Ack.
>
>>   * Copyright (c) 2003-2005 Fabrice Bellard
>>   *
>>   * This library is free software; you can redistribute it and/or
>> @@ -15,6 +19,8 @@
>>   *
>>   * You should have received a copy of the GNU Lesser General Public
>>   * License along with this library; if not, see <http://www.gnu.org/lic=
enses/>.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>
> Nack.  The text is for the LGPL.

Fixed in my PR.

--
Alex Benn=C3=A9e
