Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1691192ejc;
        Fri, 13 Oct 2023 11:14:25 -0700 (PDT)
X-Received: by 2002:a92:1a46:0:b0:352:a73a:16f9 with SMTP id z6-20020a921a46000000b00352a73a16f9mr28321138ill.18.1697220865341;
        Fri, 13 Oct 2023 11:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697220865; cv=none;
        d=google.com; s=arc-20160816;
        b=IWUYf+9XcIdedsq2QaLGBWUuBbExI0dbX4TrIKgyZJdipUmmQ7ceDPRNyGdUrtNTqp
         M40qGtZmkwxeTm3pcKL9rrTUZ95uDkUYMSKbFk90VHjY9a00Y9Mo35TYAnuuvoESgyCv
         VGmyGoRy9WzMoHhTDFNj2wFtuc7fMDIg7dBiG3II+R8ggIFEF/cYgWhRxSaFsO1tj2ZV
         HHVUILHBUWACHJaqjnlynxBlqKKDgZbn7/VvejPz9KN5p8+TUL6Q3xRT6APQbJidsvTB
         PVCMe6kjuFD1MAVdlr9QDZ4wh2+XRlgIozf1lnVZwEVgjdC4txrLID5P5nyT7TusQ4iw
         BG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fw91ChDt+rOcqpsYAbBMyeyFK8OsZN5cm1R+uomjBGw=;
        fh=qaXEkIxbaqNloPQL/FT1tmYxQJ5wxkMY1YwIUrL/c6A=;
        b=fNlvEpeu+2+zJV6PrDfP5y92JZIgkN/vlHTwJnnuaDyA28eCAp/4WJYOVX/5ZqWcTc
         B5Xp/NTDbf55Dz++4n0tY3UV+58ybPKKWakhXigYUBIf5faN+VroEXtmMBipfg+KlvTa
         1lqAJT11IGc1cjHOH7a21qiD/TloM8t+6jvDaz4+6kKjtJGrCmkvmfXD8PKY4rzWJN+E
         Z7wJMnrO2FazkEq0yP6ibt/NAn6UnS2+P14WqNN0dmybsdEc9/r3j/VNAAygSmxNjQkk
         5O2BD1iju2bSRGhTSCDfvE0QR5nUiO/ID9nmdTq6Yz4N/v44EV67/TngDmfOxFcGAYGx
         MtVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jxCzfbuP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b62-20020a62cf41000000b00690284b179bsor8324540pfg.7.2023.10.13.11.14.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 11:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jxCzfbuP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697220865; x=1697825665; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fw91ChDt+rOcqpsYAbBMyeyFK8OsZN5cm1R+uomjBGw=;
        b=jxCzfbuPqKPmEZB/PnNqrRBX8I0PoNqD6Ugy38ilJPnp+FkUIvIPZLONoAhS+ldI2e
         53ypud0GFcjWY6inEBH6ciD6/buQJzLFVOqw3kcEk+hUZTctqfEOgQLTFMTHNfKGSglF
         0wx6kK4vUM+lweu89kOXwMKPEnWOw/dgBd43Q1v+e/CcPmc7m7PFm8R3o68kG/OKuqhi
         sI0TzWEotBiwaNt72z/hfWlu53SoExseQlXxdCdDZ9Q9jkrKbmen5MHXTKopaHpJJHgG
         lImjPmDuP63fN01Z4IzJgn8zSjbl6styGs6h0sFGQBGzAVMmXkKoesrKf6MjwMuiVavE
         CpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697220865; x=1697825665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw91ChDt+rOcqpsYAbBMyeyFK8OsZN5cm1R+uomjBGw=;
        b=hP7b0oyMkhqN/puIvdLA0fMCFfqdc0KdDWAQ4hnKBMHsq5QTy5kJsFZgCoIJv7jKj0
         cBs7LdT+Y08mahKvZGs2iNspBfyvAPojbBAJdxJPvy5aHeiKGaNVQrsrYKewk+6NymhC
         HYvuKmX1iTY5GeB+urD0aBc58oRGncGcZNwbi/LILRAGpfBiQDPsIR6DetJyIrpIWtYV
         FL0ixmSx4JUoKNbxeOc/OqOLRACD1fhjJW/KjukkPFPnAGZHetAlC6evgrj2wFYT4BeG
         70YeoCdFB6a8UDGLpOQKRirC9mXmLkXMtW2dEm0nXMFeHf6YWFg5FxSTexQB0hYie2a+
         E7iA==
X-Gm-Message-State: AOJu0YxA7o1pSq/QuM+DTohCN/GKKKzWImfoXtY+FInvGs/eiLPgZZaB
	jPNVnMDGorHbb9Tnp3I96apzIEtr2ybcVgJK7KHzKw==
X-Google-Smtp-Source: AGHT+IHMbOsGt3IaMEehF2X0v9zMKUF9GjM1BYuxgVM1cOlWnpCX4IxChicef9+CEJ2B9JW2X5DL3A==
X-Received: by 2002:a05:6a21:191:b0:155:5c28:ea67 with SMTP id le17-20020a056a21019100b001555c28ea67mr34781275pzb.38.1697220864813;
        Fri, 13 Oct 2023 11:14:24 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id v5-20020a63bf05000000b005894450b404sm3182968pgf.63.2023.10.13.11.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 11:14:24 -0700 (PDT)
Message-ID: <fb26bbac-e573-431e-a4b4-13ca65a24455@linaro.org>
Date: Fri, 13 Oct 2023 11:14:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/10] hw/char/pl011: Add transmit FIFO to PL011State
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
 <20231013141131.1531-10-philmd@linaro.org> <87edhylac2.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87edhylac2.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aesJGCLQANXL

On 10/13/23 10:05, Alex Bennée wrote:
>> @@ -487,7 +505,11 @@ static const VMStateDescription vmstate_pl011 = {
>>       .subsections = (const VMStateDescription * []) {
>>           &vmstate_pl011_clock,
>>           NULL
>> -    }
>> +    },
>> +    .subsections = (const VMStateDescription * []) {
>> +        &vmstate_pl011_xmit_fifo,
>> +        NULL
>> +    },
>>   };
> 
> Doesn't this necessitate the bumping of the migration version data or
> do we not worry about new -> old migrations?

We usually don't care about new->old, however:

If the fifo is empty, migration will still work because of the subsection.
If the fifo is not empty... I think the subsection will be ignored, with the only 
consequence being that some characters will be dropped.


r~
