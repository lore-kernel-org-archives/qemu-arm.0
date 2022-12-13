Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4371715ejb;
        Tue, 13 Dec 2022 08:27:45 -0800 (PST)
X-Received: by 2002:a05:6830:1612:b0:670:6328:f4bb with SMTP id g18-20020a056830161200b006706328f4bbmr10644536otr.24.1670948865210;
        Tue, 13 Dec 2022 08:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670948865; cv=none;
        d=google.com; s=arc-20160816;
        b=adJHt5NQhbk7Sowh+pzkvacuikdtbcpymjmhLxKm6UErOFBfxpKkYmzpor80TTybC0
         JxokCA2IQyY7bY09LHA7+z+Ww/63AsDFVGH4zrav47UyDZ3+oX2XadOw0haCyfAW2w8F
         Ub+dzKiyqxFhcLLCfKAtCyv7PBNWKW1S/sNWJcrRt2wFJMZagkd9SbGcXmyxYKpn573C
         JJWmYoRZ69+yBVp/FTV78aT6EHC64yzvZxkg9K7py1QxuEQmAedwIN5nKLd1m7vxQCJZ
         TQrjFJehkzsgHWpl3pYzxcE/vyh7Wz7Uzdm7HhAbP8v1Hkb5lIZXYD2iq9aw+m/xBQfm
         dfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/oMA+z00Yw19B/Cul8IeNaINjwJ1SCer6liwMab+nsM=;
        b=wE3VVybQvjePvH9fwXSG0QiY00TRymOa4BuoYC1QXBy8BPAiu1Odffc/WPmF9lzAuS
         Qyae+DKrHvsF+GH6acYz7HDgQcyzv291WngZUOAOB/z4tDo8TgJD/dc/aD0UBJYs2OFK
         lZMaY8lrz//cBdgRuEuEAmnhrHVvUJAu0qM+uqLZj97gvCHzd1Q5feLIzAwBalhZ0fbW
         rwjya5RqEQkEcW9nzFM5IhuPF0JyZCVcgwV3rjWTk+0eXFZ3Hm2ZMcAya618AuSI9oJt
         68z6HoBPOXXusOSppKptsmplGdugBL1vdQnqC4hKi6vD2IPEYb5/QG6TXSPTpsEINawU
         Zzhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewQ5Lxez;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cy22-20020a056830699600b0066ceb89d75asor562252otb.63.2022.12.13.08.27.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 08:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ewQ5Lxez;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oMA+z00Yw19B/Cul8IeNaINjwJ1SCer6liwMab+nsM=;
        b=ewQ5LxezpxJAB2m1ksaGJtzd5kpUg+nh//lXQo7PNwYyfXdnQ1ZwTy7jknLprxh9Rn
         dQpa68hWHKRMeUvlFCvZp/8L1F/hc82kaDy7O3cibZvJFIva5jSuZcXjZWUi45ZPnOkG
         fkncDL/wRR3a2is5wx6x6G6tGIxWM7VBXXdAjAEItVMcuSiM0hE6rcxmmRnJogPKgJXr
         0m4H+K6u9aM/kQiKjVYE43QdSB1EomqzNiFW+d+J2onUt9BYzWwF3G/gzWnax9fhQKls
         qqD0VS1P6Aqq6aLtfhTrZBbQmCiQ6LsGgRGDt21y+vIFi1HwGuZ1QQWTl9X66dV8Bz4m
         2HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oMA+z00Yw19B/Cul8IeNaINjwJ1SCer6liwMab+nsM=;
        b=CxFlTmYOQ5XqTVn2EprKiUqQtxe9fDwZazfSgHAlWucAKVfQE6FuFv+zuf0Q+7wIM6
         R4iePjtDjWDirV/UHKoAM237lNAeGG2jeACFTNEpeEnQ9s5bxsvI/45Yc2Zo49Fepbvl
         bC6cISUsR2RLR5CNl4o3uWBtZ98Akf8As/gMSgPu4j2Ws+pn5UQI0bDlSSYmDM4UblDm
         6SjH8q7k92q7ReHLdExd3O4qA7kcK7/OLEnzohl8dKKwVKCaezZ9HxFjKgFDZCCEq+Az
         9rYqQagg73GTi881oNfdR9oy/uI5xhswylfdn0EDMZXQJQNTrKO/GiTO6OJG7InjyA6y
         YQEg==
X-Gm-Message-State: ANoB5pnZs367AjkKDH4g072glMTgcfoLL0Kd1oTaqILWkBE00nMziKdT
	D47L4l1XThM0xgNQbSbIp8bho0YA
X-Google-Smtp-Source: AA0mqf4bUBNp8VKszMMkYf4/flL3vsYNf0SBOhkGZZeY/vokVqYz0t9j9xhdQLOpPWBiDUnH4QC5UQ==
X-Received: by 2002:a05:6830:2a05:b0:66b:b674:5a5b with SMTP id y5-20020a0568302a0500b0066bb6745a5bmr11202969otu.21.1670948864753;
        Tue, 13 Dec 2022 08:27:44 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0? ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
        by smtp.gmail.com with ESMTPSA id q5-20020a9d7c85000000b00670763270fcsm1321216otn.71.2022.12.13.08.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:27:44 -0800 (PST)
Message-ID: <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
Date: Tue, 13 Dec 2022 10:27:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oyVRf6c8l4ti

On 12/13/22 10:21, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
>>> On 13/12/22 17:00, Richard Henderson wrote:
>>>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>>>> aCube Sam460ex board") were testing on a little-endian setup,
>>>>> they meant to use const_le32() instead of tswap32() here,
>>>>> since tswap32() depends on the host endianness.
>>>>
>>>> tswap depends on target endianness.
>>>
>>> Yes, it depends on both host/target endianness. What I meant
>>> is we shouldn't have system code depending on host endianness.
>>
>> It compares host vs target endianness, to determine if a swap is needed.  But the real
>> dependency is target endianness.
> 
> It does seem odd, though. We have a value in host endianness
> (the EPAPR_MAGIC constant, which is host-endian by virtue of
> being a C constant). But we're storing it to env->gpr[], which
> is to say the CPUPPCState general purpose register array. Isn't
> that array *also* kept in host endianness order?

Yes indeed.

> If so, then the right thing here is "don't swap at all",

So it would seem...

> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
> that the current code is setting the wrong value for the GPR
> on little-endian hosts, which seems a bit unlikely...

... unless this board has only been tested on matching hosts.


r~
