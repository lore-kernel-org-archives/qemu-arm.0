Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1689104wme;
        Tue, 22 May 2018 09:13:14 -0700 (PDT)
X-Received: by 2002:a63:2f41:: with SMTP id v62-v6mr19515331pgv.33.1527005594357;
        Tue, 22 May 2018 09:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527005594; cv=none;
        d=google.com; s=arc-20160816;
        b=p8j/lk8/O7Q6k/Om3pBxlVY7OxKiOWjJ6fudIdf9FkNfs32oAylLzSb84Bd7/7NKBZ
         UFeBq7o5GUkBBv7gqEpomoSi83fyfPHo9bZKed7jIZKbiPQaDqrSATBQryhI3XD1msnb
         u2ZwxIqAaNv9Z6tMKVpDXCS4rG+6woaWsO0ETl8wPF46RxRcL/iphjuXr5snMMWzHUx7
         JzmfoGV1pZZKHdeLm04BFuQVBJ28g5yXhDpizwAhDPM87Rp43rCBXRJFLF5/iZr0+22M
         DdJ7TpBLylti1SEMv5oA+jQXkFdo1FuAVL8HXkADDwvobYIyWaLMxD4cdpL4cAfQog6q
         peGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=e+L4yytaShQOGW+DV40EjeqLJnAhUOIwx8W5Mjs49mI=;
        b=qPwnsCKoD0Csc+ZZ564XZ4SjuvgeNTmDOrGscvItoNUFNVQu/S3rxDXB4PvSiziJ4r
         T8q3jhKxKU1xHvBRMKPjwR6WrD2nlbgGoevz2XAAmttr3+qAWhM6Eqy633bNIXwbo+yh
         dQwkEjJ8stAIE378bGuh07ItuR5FDE0cRVxRrtuDGEBqtWyx9TrCQEYPbllglwi+MbMd
         DoMIIodWSENKIGtej3D++erEnQDQtJ7kikyFozesCG2ssA58lZ1WCzjQrQVEbkJse/lA
         bjaqwRH4HIKlPGnxrI8U495iMopicjVN2yQbNTGSUbRfU1BUBITtElvSrUWq3LVuH6TQ
         fz5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OZYfu0a8;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h9-v6sor5141452pgq.147.2018.05.22.09.13.14
        (Google Transport Security);
        Tue, 22 May 2018 09:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OZYfu0a8;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e+L4yytaShQOGW+DV40EjeqLJnAhUOIwx8W5Mjs49mI=;
        b=OZYfu0a8GaPe/DRMMvXhI7iQgpLkSxoWsb/uaRieW8iInpULCT7nTj4Pp52UT7uBEi
         mH+jsqXU4mdmP5niHaBnucZsVSc9UC97aGCD1oVHocWldJNBF9W3vLuBDvglu0tuYmfr
         NGAd1RJFrqpRPxredF7ljNDGTPM06KWn6EZlIZOhzswq1C7N/UkS73GznvnyuUJ0L0+V
         aEP86EVP5hZWiqj5CIhlmtsTW2Ymz/mbwHhEY3ol5czsuWaQ3nG6+IatPRjPAhtGag2b
         PpViIAvw8O0KPU2rOFe8N7A/FbaoZkDPWnJdv2zvIiE823zZhyrQZ8gko1z4d3At6i4D
         d80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=e+L4yytaShQOGW+DV40EjeqLJnAhUOIwx8W5Mjs49mI=;
        b=slj2Gaj6YeR+RFNZCnoBk1Si+88TmZRIyXOphP/YoY3bUTMnUPi283ZfACEIkm7qjY
         yGkyD6pSAusAORlVHknpg2HqCWrYFU5S6ulQETHN2+eqZfZJoXiG6lqQakK82Dfw88sV
         zUQZbkR2RjB0zL3r6RovxNjk29GUIGWGikGl/AHhcmpCLhfeu/KSeg7oMxeH3bgjXYPl
         W3YgrGdC6VV3EFH7PAnK79IE+AxsFqOzcoOjvFhAcBCL7r7xOeQcQMKUxN2486C6Vnxq
         Vrk7L5zT+sQgxooZ2/r5PDVXghkTFO+9Q85rrrnVIvuhO8zjA8hqmd+u1daHDjei+OdZ
         Evag==
X-Gm-Message-State: ALKqPwcJz1EH6SQFcPhc1KEVDPpXeiYy9fvFO3fC3eAUQIY1oCRzZqOJ
	dtYiqAMO2N3yOGxKQ0IWSFf3fqq3
X-Google-Smtp-Source: AB8JxZrfRpnRSI7KXDXQyq7b+VDa+v8+u1/dWxY8UEmgjNQCdNpC/o3lmJvU+Y/OaWWIjgKbC+lW6g==
X-Received: by 2002:a63:5f01:: with SMTP id t1-v6mr13043978pgb.94.1527005593620;
        Tue, 22 May 2018 09:13:13 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id x10-v6sm58106447pfd.162.2018.05.22.09.13.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:13:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 04/27] Make address_space_map() take a MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-5-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <2be6da2d-b8dc-9540-477f-d0e2154ecf44@twiddle.net>
Date: Tue, 22 May 2018 09:13:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 9AMyN2Aexsw7

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to address_space_map().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
