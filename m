Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a128sm9668372wmf.5.2020.11.19.03.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:45:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 874C01FF7E;
	Thu, 19 Nov 2020 11:45:11 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
 <87a6vhxvit.fsf@dusky.pond.sub.org>
 <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, David Edmondson
 <david.edmondson@oracle.com>, Kevin Wolf <kwolf@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org, "Michael S. Tsirkin"
 <mst@redhat.com>, Xu Yandong <xuyandong2@huawei.com>, Max Reitz
 <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang
 <zhengxiang9@huawei.com>, qemu-arm@nongnu.org, =?utf-8?B?aGFpYmluemhhbmco?=
 =?utf-8?B?5byg5rW35paMKQ==?=
 <haibinzhang@tencent.com>, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping
 UEFI flash images
In-reply-to: <e54fc218-1eae-be1c-b064-049bc1d46793@redhat.com>
Date: Thu, 19 Nov 2020 11:45:11 +0000
Message-ID: <87ft55vad4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RjizvprGzcg5


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/16/20 2:48 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Hi David,
>>>
>>> On 11/16/20 11:42 AM, David Edmondson wrote:
>>>> Currently ARM UEFI images are typically built as 2MB/768kB flash
>>>> images for code and variables respectively. These images are both then
>>>> padded out to 64MB before being loaded by QEMU.
>>>>
>>>> Because the images are 64MB each, QEMU allocates 128MB of memory to
>>>> read them, and then proceeds to read all 128MB from disk (dirtying the
>>>> memory). Of this 128MB less than 3MB is useful - the rest is zero
>>>> padding.
>>>
>>> 2 years ago I commented the same problem, and suggested to access the
>>> underlying storage by "block", as this is a "block storage".
>>>
>>> Back then the response was "do not try to fix something that works".
>>> This is why we choose the big hammer "do not accept image size not
>>> matching device size" way.
>>>
>>> While your series seems to help, it only postpone the same
>>> implementation problem. If what you want is use the least memory
>>> required, I still believe accessing the device by block is the
>>> best approach.
>>=20
>> "Do not try to fix something that works" is hard to disagree with.
>> However, at least some users seem to disagree with "this works".  Enough
>> to overcome the resistance to change?
>
> Yeah, at least 3 big users so far:
>
> - Huawei
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg607292.html
> - Tencent
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg742066.html
> - Oracle
> (this series).
>
> Then Huawei tried the MicroVM approach:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680103.html
>
> I simply wanted to save David time by remembering this other approach,
> since Peter already commented on David's one (see Huawei link).

IIRC the two questions that came up were:

  - what would reading memory not covered by a file look like (0's or
    something more like real HW, 7f?).

  - what happens when the guest writes beyond the bounds of a backing
    file?

I'm guessing for these cloudy type applications no one cares about
persistence of EFI variables? Maybe we just need a formulation for the
second pflash which is explicit about writes being ephemeral while also
being accepted?

>
> Regards,
>
> Phil.


--=20
Alex Benn=C3=A9e
