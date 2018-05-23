Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp651495wre;
        Wed, 23 May 2018 04:55:02 -0700 (PDT)
X-Received: by 2002:aca:4a4e:: with SMTP id x75-v6mr1343883oia.211.1527076502567;
        Wed, 23 May 2018 04:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527076502; cv=none;
        d=google.com; s=arc-20160816;
        b=rwTF7QqvTCpOHLLq3ckt1JywCucZcIVili5Qrp837Ns4iV10uZzZZ3wMm03vwEYndj
         zGyMSG4uqoX2z1Nq7waJmbXgKhQAeIBKDmfkqLD27SAe2RqmVpFwBhQHwzT7tLqLGopR
         c3GmGU7TL/koLsDu4yuWYt8OZWCZB1gB8+AKPoZl/1qO7M17K33+oehq0Dp7zfs/8jkU
         KNOt5JtavmXGNfl7zJqbZB8lhTp1Mpcdptxyf1eCMj3/W4/69FjEo/pGpEhgg+E6aIRA
         uUDMleIpzmAz6AGG1xkpLea2vkYxE1n12458IwV4qbIvr80WxoY6CEUgGHOICg6kA6hR
         J3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/7cKuQ+Z8+ixzlgV6CD1xCbhzy7+ZwDbJTJo0fkSEcA=;
        b=fOPOkfJYRrIg5i/qmaxq0LXtR3xaojHmE/QvNO0ssjHq8L9CSIg0O0dq3WLWF5F5kd
         T0QdCDVnXHCRYM+SaDQxgB0WwoEdUqWmDm/WH9wtbk47HY9SjyYjdzckuMfvKTF+mmhO
         PPXay2FDxQfoBWJa6nGJ4U8F1k98e8NlMGoWQLeJC3CjYCpgKUcQjrjNWGXgaeQTtL6A
         zoHRy8QxJOxqIcOZc7ICNW7qTvUC6ujUaOfldek7rucMF2JXOivsHiUHxWel8q31Dz1X
         guE8S3b5IXOQe0smLGcy+JMaTOuCfLwn/XWTgfkig7HJpvYPZmM5/bX9uUXDPunqKxqj
         L9iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CHrG/jGL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e17-v6sor8994926otj.306.2018.05.23.04.55.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 May 2018 04:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CHrG/jGL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/7cKuQ+Z8+ixzlgV6CD1xCbhzy7+ZwDbJTJo0fkSEcA=;
        b=CHrG/jGLmrHkjQJe2Vwxp5A9uVVFtb6it+5KQJW1fB/RhYoSRneZ/0NeCrKvhjjS2R
         6d9MWDtvzItvMR/P25jkHQbbL3nr/NCXAhaJqZnXF9Ls9GFRCjuxh/UCp1sAf3Ct51/G
         U54xjjkgOofzdviWipcYI3Z3s93CO2auK5S1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/7cKuQ+Z8+ixzlgV6CD1xCbhzy7+ZwDbJTJo0fkSEcA=;
        b=NpCfdKuppVMGoLkYkGL1BiVJvrQlb+QDeGYw1ptBuzHZHhnSlVdOZ5mK1Mx1r1ue8p
         y7y2u6xOnYQMTfZZDVNrnG/aiFU/mtmC38kMKtEIDTYqD06cuszo3Kb3SrlW6Q4IaIW/
         afpq/VozdfWwMVIqfK5t0yrF5D+BmfX02bXFiIz6icDyY77Qvj+7D2cJ7SM/Zl01o8sw
         7xwTZORxfk+g8ILpabOQMjOoVEev9iKDSKzPcMQJrll0O1+SzDo7Y9n0oura7WOh7R9d
         74buP9CQoR+AKGSNeWySl7QvSQcDiGiWkaNrOV1ExwppfhSYjS41CQLXO3kw/s4wM7fY
         avdA==
X-Gm-Message-State: ALKqPwfEJ4rcyPJ+OFtS58gtpIMmCUaccdxv5HU+CC2DfDJhpiMoxkDl
	XuTLlbqWXlgoJk+A8EyU7jL0Tx69lK/huuAXklf7tRFnCHA=
X-Google-Smtp-Source: AB8JxZqesVoKn+XWwDppFPiCg/OD1vV209FFMvXtRjS7WBLYQFx3wFI6R+DpfzR0CLT7yRCSXB+vrQ49X86dK0/+Qpg=
X-Received: by 2002:a9d:429c:: with SMTP id r28-v6mr1436900ote.126.1527076502107;
 Wed, 23 May 2018 04:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Wed, 23 May 2018 04:54:41
 -0700 (PDT)
In-Reply-To: <87y3gatznc.fsf@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-21-peter.maydell@linaro.org> <87y3gatznc.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 May 2018 12:54:41 +0100
Message-ID: <CAFEAcA82=CU=Pksgs5YO9_Vw5jqFgQqxnuFN+KZ1dw-ao8D7Xw@mail.gmail.com>
Subject: Re: [PATCH 20/27] hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0uYs6uNzBl7Z

On 23 May 2018 at 11:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> The MPC is guest-configurable for whether blocked accesses:
>>  * should be RAZ/WI or cause a bus error
>>  * should generate an interrupt or not
>>
>> Implement this behaviour in the blocked-access handlers.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 48 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
>> index 93453cbef2..39a72563b7 100644
>> --- a/hw/misc/tz-mpc.c
>> +++ b/hw/misc/tz-mpc.c
>> @@ -43,6 +43,9 @@ REG32(INT_EN, 0x28)
>>      FIELD(INT_EN, IRQ, 0, 1)
>>  REG32(INT_INFO1, 0x2c)
>>  REG32(INT_INFO2, 0x30)
>> +    FIELD(INT_INFO2, HMASTER, 0, 16)
>> +    FIELD(INT_INFO2, HNONSEC, 16, 1)
>> +    FIELD(INT_INFO2, CFG_NS, 17, 1)
>>  REG32(INT_SET, 0x34)
>>      FIELD(INT_SET, IRQ, 0, 1)
>>  REG32(PIDR4, 0xfd0)
>> @@ -266,6 +269,45 @@ static const MemoryRegionOps tz_mpc_reg_ops =3D {
>>      .impl.max_access_size =3D 4,
>>  };
>>
>> +static inline bool tz_mpc_cfg_ns(TZMPC *s, hwaddr addr)
>> +{
>> +    /* Return the cfg_ns bit from the LUT for the specified address */
>> +    hwaddr blknum =3D addr / s->blocksize;
>> +    hwaddr blkword =3D blknum / 32;
>> +    uint32_t blkbit =3D 1U << (blknum % 32);
>> +
>> +    /* This would imply the address was larger than the size we
>> +     * defined this memory region to be, so it can't happen.
>> +     */
>> +    assert(blkword < s->blk_max);
>> +    return s->blk_lut[blkword] & blkbit;
>> +}
>> +
>> +static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttr=
s attrs)
>> +{
>> +    /* Handle a blocked transaction: raise IRQ, capture info, etc */
>> +    if (!s->int_stat) {
>> +        /* First blocked transfer: capture information into INT_INFO1 a=
nd
>> +         * INT_INFO2. Subsequent transfers are still blocked but don't
>> +         * capture information until the guest clears the interrupt.
>> +         */
>> +
>> +        s->int_info1 =3D addr;
>> +        s->int_info2 =3D 0;
>> +        s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>> +                                  attrs.requester_id & 0xffff);
>
> Does this actually need masking given the source is a 16 bit wide bitfiel=
d?

That might change in future (eg Eric was talking about wanting
to put SMMUv3 substream IDs in transaction attributes, and those
are 20 bits wide, so we might want to widen requester_id to fit them).

thanks
-- PMM
