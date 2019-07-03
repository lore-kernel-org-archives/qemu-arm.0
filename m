Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp661859wru;
        Wed, 3 Jul 2019 04:07:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUPPr6SzXMKxSur9VBUTbOz40CgDe1lquZsObXmwB+o11jrx9mVkHTN+vqoqXedUCfG0rl
X-Received: by 2002:a17:906:1596:: with SMTP id k22mr34555237ejd.102.1562152062038;
        Wed, 03 Jul 2019 04:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562152062; cv=none;
        d=google.com; s=arc-20160816;
        b=pKZkWbOtSi59U41Nz6rTOYcKge+auPX8gk4oMHzYu7aZyvk/4COrRUPjvVcyrdftSe
         2Uywr+BKcxmac7xIO0VdZUhnK6eryADZBdUEW7DRrcnn1U0HVDSCPsLwts8XeFDZalsd
         zpBA4PeIrmO4td2IPe7zZuq9bJ8GYe2NtdQblAAxtogq36EgZBxDnE83FOJtKzEqdTmB
         u5gPAPyNCRXTOJyu8OH9X9ayAIOrWp7wRCv0cGRm8DV0d/l4uGI4GcP3JUSbl4MuqUZ6
         nuUB6Fm/o+DRZt2ugTLq4HuS8o6oo7WrBS4ods8Sz1MoHHjvlzgE+nI29txenBpuPsZ9
         2rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date;
        bh=t3AvbihFgv1n1Uof4C6u1H83rd6KHfyvOv6+Dl2c4WY=;
        b=CMjawiEkJLQZMIfJlqTTNaaeStZeFTtnj57haH27iS6LyhXIVQ+kPAtTcPnPEAwNbh
         xoCbnYFIOeWvd5k0a8RJY5CbV6bZzAYeaihellBBBFtBjgC7jZ5wllRWr/qCGkNDo0uO
         4IcR2puQyJwWzcBdHu7S3wfuuAYMvfx4UtwYi49+QryKdGNOzago+GXkBitJxnP5Ts+J
         DVKa65ReLca0bH2F2g+KrrT/zqN+mKRFX6GI0PSLQhZAQZzwUZNGFp0xtCoA48rJv0AN
         tX/Raxo7LV0XKvA6kSFoAiqyUBO21VObuYAiUzS4UIGJxBqUJnNAcHDdgwFxHWnBJMex
         1P7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si1439786eju.379.2019.07.03.04.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 04:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hid6z-0007Qr-4A
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 07:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33099)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hid6X-0007L7-Bo
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 07:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hid6V-0006Xb-P8
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 07:07:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:41943)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hid6V-0006Th-CK; Wed, 03 Jul 2019 07:07:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 328C57461AE;
 Wed,  3 Jul 2019 13:07:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F075F7456B7; Wed,  3 Jul 2019 13:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EAACA74569A;
 Wed,  3 Jul 2019 13:07:07 +0200 (CEST)
Date: Wed, 3 Jul 2019 13:07:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
In-Reply-To: <18767774-2460-6f39-2909-de9e37737f4c@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1907031305370.36322@zero.eik.bme.hu>
References: <20190702163844.20458-1-peter.maydell@linaro.org>
 <alpine.BSF.2.21.9999.1907022343160.68337@zero.eik.bme.hu>
 <18767774-2460-6f39-2909-de9e37737f4c@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-618307218-1562152027=:36322"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/i2c/bitbang_i2c: Use
 in-place rather than malloc'd bitbang_i2c_interface struct
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xi/kGtCQXwQU

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-618307218-1562152027=:36322
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Jul 2019, Philippe Mathieu-Daud=C3=A9 wrote:
> On 7/2/19 11:52 PM, BALATON Zoltan wrote:
>> On Tue, 2 Jul 2019, Peter Maydell wrote:
>>> Currently the bitbang_i2c_init() function allocates a
>>> bitbang_i2c_interface struct which it returns.? This is unfortunate
>>> because it means that if the function is used from a DeviceState
>>> init method then the memory will be leaked by an "init then delete"
>>> cycle, as used by the qmp/hmp commands that list device properties.
>>>
>>> Since three out of four of the uses of this function are in
>>> device init methods, switch the function to do an in-place
>>> initialization of a struct that can be embedded in the
>>> device state struct of the caller.
>>>
>>> This fixes LeakSanitizer leak warnings that have appeared in the
>>> patchew configuration (which only tries to run the sanitizers
>>> for the x86_64-softmmu target) now that we use the bitbang-i2c
>>> code in an x86-64 config.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> This isn't the only problem with this code : it is also
>>> missing reset and migration handling and generally looks like
>>> it needs proper conversion to QOM somehow. But this will shut
>>> the patchew complaints up and seems ok for 4.1.
>>>
>>> Disclaimer: checked only that the leak-sanitizer is now happy
>>> and with a 'make check'.
>>
>> I've tested the ppc4xx and ati-vga parts with AROS and MorphOS and the=
se
>> can still access i2c devices so I think it works.
>
> So:
>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

Yes, but I gave my Reviewed-by so I thought no need for both but if you=20
want can also add Tested-by.

Regards,
BALATON Zoltan

>>> ---
>>> hw/display/ati_int.h???????? |? 2 +-
>>> include/hw/i2c/bitbang_i2c.h | 38 ++++++++++++++++++++++++++++-
>>> include/hw/i2c/ppc4xx_i2c.h? |? 2 +-
>>> hw/display/ati.c???????????? |? 7 +++---
>>> hw/i2c/bitbang_i2c.c???????? | 47 +++--------------------------------=
-
>>> hw/i2c/ppc4xx_i2c.c????????? |? 6 ++---
>>> hw/i2c/versatile_i2c.c?????? |? 8 +++---
>>> 7 files changed, 53 insertions(+), 57 deletions(-)
>>>
>>> diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
>>> index 9b67d0022ad..31a1927b3ec 100644
>>> --- a/hw/display/ati_int.h
>>> +++ b/hw/display/ati_int.h
>>> @@ -88,7 +88,7 @@ typedef struct ATIVGAState {
>>> ??? uint16_t cursor_size;
>>> ??? uint32_t cursor_offset;
>>> ??? QEMUCursor *cursor;
>>> -??? bitbang_i2c_interface *bbi2c;
>>> +??? bitbang_i2c_interface bbi2c;
>>> ??? MemoryRegion io;
>>> ??? MemoryRegion mm;
>>> ??? ATIVGARegs regs;
>>> diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2=
c.h
>>> index 3a7126d5dee..92334e9016a 100644
>>> --- a/include/hw/i2c/bitbang_i2c.h
>>> +++ b/include/hw/i2c/bitbang_i2c.h
>>> @@ -8,7 +8,43 @@ typedef struct bitbang_i2c_interface
>>> bitbang_i2c_interface;
>>
>> Maybe this typedef ^^^ can now be moved to the struct below instead of
>> coming first (or even written in the same line as
>> typedef struct { } bitbang_i2c_interface;
>> as there is no need to have both struct bitbang_i2c_interface and the
>> typedeffed name available).
>
> Agreed, from "hw/i2c/i2c.h" to "hw/i2c/bitbang_i2c.h".
>
>> But I don't really mind, so
>>
>> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
>>
>> Thanks for fixing this.
>>
>> Regards,
>> BALATON Zoltan
>>
>>> #define BITBANG_I2C_SDA 0
>>> #define BITBANG_I2C_SCL 1
>>>
>>> -bitbang_i2c_interface *bitbang_i2c_init(I2CBus *bus);
>>> +typedef enum bitbang_i2c_state {
>>> +??? STOPPED =3D 0,
>>> +??? SENDING_BIT7,
>>> +??? SENDING_BIT6,
>>> +??? SENDING_BIT5,
>>> +??? SENDING_BIT4,
>>> +??? SENDING_BIT3,
>>> +??? SENDING_BIT2,
>>> +??? SENDING_BIT1,
>>> +??? SENDING_BIT0,
>>> +??? WAITING_FOR_ACK,
>>> +??? RECEIVING_BIT7,
>>> +??? RECEIVING_BIT6,
>>> +??? RECEIVING_BIT5,
>>> +??? RECEIVING_BIT4,
>>> +??? RECEIVING_BIT3,
>>> +??? RECEIVING_BIT2,
>>> +??? RECEIVING_BIT1,
>>> +??? RECEIVING_BIT0,
>>> +??? SENDING_ACK,
>>> +??? SENT_NACK
>>> +} bitbang_i2c_state;
>>> +
>>> +struct bitbang_i2c_interface {
>>> +??? I2CBus *bus;
>>> +??? bitbang_i2c_state state;
>>> +??? int last_data;
>>> +??? int last_clock;
>>> +??? int device_out;
>>> +??? uint8_t buffer;
>>> +??? int current_addr;
>>> +};
>>> +
>>> +/**
>>> + * bitbang_i2c_init: in-place initialize the bitbang_i2c_interface
>>> struct
>>> + */
>>> +void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus);
>>> int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level);
>>>
>>> #endif
>>
>
>
--3866299591-618307218-1562152027=:36322--
