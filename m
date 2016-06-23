Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b200sm2237333wmb.9.2016.06.23.12.58.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 12:58:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E305A3E028B;
	Thu, 23 Jun 2016 20:58:06 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.95.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: Pranith Kumar <bobby.prani@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>, "open list\:AArch64 target" <qemu-arm@nongnu.org>, "open list\:All patches CC here" <qemu-devel@nongnu.org>, serge.fdrv@gmail.com, Claudio Fontana <claudio.fontana@gmail.com>
Subject: Re: [RFC v3 PATCH 03/14] tcg/aarch64: Add support for fence
In-reply-to: <e10ebfad-354c-a476-7114-17f500551369@twiddle.net>
Date: Thu, 23 Jun 2016 20:58:06 +0100
Message-ID: <87eg7nr835.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: RAOZmGY+/wqW


Richard Henderson <rth@twiddle.net> writes:

> On 06/23/2016 09:18 AM, Alex Bennée wrote:
>>> > +    /* System instructions.  */
>>> > +    DMB_ISH         = 0xd50338bf,
>> As ISH is part of the CRm encoding I wonder if this should be split into
>> the main DMB encoding (0xd50330bf) and a separate set of CRm defines.
>>
>> In fact the documentation of the struct above implies you should
>> probably have:
>>
>>        I6260_DMB       = 0xd50330bf,
>>
>> And then:
>>
>> static void tcg_out_insn_6260(TCGContext *s, AArch64Insn insn, int crm);
>> {
>>     tcg_out32(s, insn | (crm & 0xf) << 8);
>> }
>
> I don't see any benefit to doing this over or-ing in the pre-shifted
> values.

I'm mainly thinking about keeping in line with the layout of the rest of
the code. I would home the compiler would generate the same either way!

--
Alex Bennée
