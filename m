Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp750470ejq;
        Thu, 9 Nov 2023 12:59:34 -0800 (PST)
X-Received: by 2002:a17:906:c153:b0:9d4:2042:775b with SMTP id dp19-20020a170906c15300b009d42042775bmr6036546ejc.30.1699563574447;
        Thu, 09 Nov 2023 12:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699563574; cv=none;
        d=google.com; s=arc-20160816;
        b=f5aRCTE+oNJdAe4czOHA2WeC57TB+jrDvZXjLVGmW5oOAtnxAVOp1hR0bQoCeXIj1J
         BNtg92tlTdcuAMR5yQhtm/OmFxth/NtFSAMWPMZhVnld1rRhntt+Zgq3YCzndS2LgFlV
         bgWQh0E3o+SBUgLurGso7GqEV69AU03NH8FEvAsbM0g6XAq7Hlt8H6BJMLbn6gKwPDTF
         k602+IRe7gZtxkSsj15LsUiE5ZzkB1Dy1LF9hyH3abJYAwbtbRZ5WFjPLwoKN/+eYEkb
         30iHKchhjeCPF7GyUBlKwelUFPqyfv8T2FCmj5smE6fsP8UGnwPDfOK7PPFjEZzk6V7h
         fwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=svm0yThTtq8dOQFqwbF6rfIJTlUxfuXW5nfvYjPCdUY=;
        fh=t+AN/Md3GxUjryJfDw39JOexvMw48rPh4mHl9wi3K9k=;
        b=WyOx0Dae+fTD97PiqYg9Glb0gg/uukyCx8oWeMj4uCtIBNqXF5O8GiswVKIfhNQ9vA
         /Zm1mqAVziRyzHXg9092Y3G/z59D0oJc+Zo/xkb+Q9v8FZBChrtfFFzjlSGhOsJpv0RG
         FG55NzOKvFwP8rOmIs9QxPZbqtXJYsIaDNAy9V2xft+17wIMGtQhWGkgm6wVMjmRQpan
         HS9DsIzenCJt1PpQA2H5o6bjUhdEf0YZBscHnsWvrdOH8ZGEwg14fkmg3TZAiZlIx+5U
         ChllldugtG7a/vdeAmu/OqZ8MJHL7QBr/hoWS56ZREWVjFh2KAF9+ye7C2yreCSBVqGL
         +GVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vJwolxT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y20-20020a170906519400b009bf54269e3asor3332640ejk.1.2023.11.09.12.59.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 12:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vJwolxT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699563574; x=1700168374; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svm0yThTtq8dOQFqwbF6rfIJTlUxfuXW5nfvYjPCdUY=;
        b=vJwolxT4Ts40gjxlRoIAIfEFM9e0+3Aq3CG/fnrT/bXR2bvdztdH32SuxTcqYYLaIS
         +srVt6rgxIIqAaU3NYMmcnbkfEDBuyePl/EDlYA5F/2DbnLlbRxXaW1pZHkTMRYgeykQ
         fU38LM1GVoDUNPtYfxa4VvqGWFxUhOiclUCHXG4OW+PrDThgtibJKJOtmg/aIC8ey24l
         A/sAQe36yv8KFvQFsUfmzR3NHkeSykFOfTlAilfBxU8BZG4LBqzOu6u8G41RDMFI1qXR
         XAxCA6CdKOH+nPuuP8WwxiOT2amWl6C4GfcO+9E7cq3nAbi3+m+SYDNON5jmMI/QS82Q
         N4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699563574; x=1700168374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svm0yThTtq8dOQFqwbF6rfIJTlUxfuXW5nfvYjPCdUY=;
        b=pZIx330bQzvPNIVJa96YJ3WtNomtCkFxyvilCNwE8ZQuLHPpHUeZ0RkU0B17ZDma9I
         pukhNdFgg4zbH8NMqnSAK1uz4fKX5L+Z9UOjcAWmS11Shq1hpU+05aaASuvFA46fzU0U
         byF3ZJYuyW5HQi8hK+LmzILDkA4G3YhFOlKuwCI7wO7yt1eI0cjurpvBru+B8fdvGoGH
         QwUe+bZZo3cxUY8eFgItX4+1w/OiiyDdA62yuUPLX0SJjFAiP9fHC7TC+90mZz0vs0V+
         JMGD8aKFuSt09owT1+KK3BWOg+cq3KmzNRl+kviRLac1jm5OkRNuNcj2ogVF7zMuJCFQ
         B/PQ==
X-Gm-Message-State: AOJu0YySkFeLQRp3Y1Se2vgoOqhDcXQF0VStuwbFscFfkRJxhsC1SFCO
	IfxIP1c7Xpt/BLaWUelgpWJKc3yVMKNM3f4JCNK+smtv
X-Google-Smtp-Source: AGHT+IEFkXsFm9Iw2dGE6OGl4HAHkXfMURlEyDjaVT2ZvsI7z4/1Qq7HRM1gCVE1/IkP7IJGB/GKxA==
X-Received: by 2002:a17:906:d553:b0:9be:45b3:3116 with SMTP id cr19-20020a170906d55300b009be45b33116mr5920986ejc.71.1699563574062;
        Thu, 09 Nov 2023 12:59:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id lg5-20020a170906f88500b00992b2c55c67sm3029093ejb.156.2023.11.09.12.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 12:59:33 -0800 (PST)
Message-ID: <4ffed8f5-6624-4488-a74f-567cbd926b78@linaro.org>
Date: Thu, 9 Nov 2023 21:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO
 to avoid blocking the main loop
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mUokqa4CSy0C

Hi Peter,

On 9/11/23 20:29, Peter Maydell wrote:
> On Thu, 9 Nov 2023 at 19:28, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Missing review: #10
>>
>> Hi,
>>
>> This series add support for (async) FIFO on the transmit path
>> of the PL011 UART.
> 
> Hi; what's the rationale for the "for-8.2" targeting here?
> What bug are we fixing?

The bug is on Trusted Substrate when the ZynqMP machine is used:
https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574

Regards,

Phil.
