Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp533362lfk;
        Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:1aa4:b0:2cc:4dc4:bd6e with SMTP id l4-20020a056e021aa400b002cc4dc4bd6emr2217330ilv.101.1650641053433;
        Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650641053; cv=none;
        d=google.com; s=arc-20160816;
        b=t4VF/N5I4xnKfdXSiq4uvvfr9McznQnove/m/YtAavFmZZ6qE7etR2pSLK15gTw66X
         KuzQe16X9vP2aLRbE7D7bUJqqH1fO0gmgLincWcd0m6dbkS8SNFElulXJv7WggUF4X9z
         xFSEAfusUIPS6racJ02wlBrUuu3aPJl2cB0bPEV9UHVWAhK/2j9p4g3pe5xuhWT7qJHX
         ThyThnYgHv/Qql6DLWcsqrb/Q+QxvknGumrMcq5IQs9VkYTmMR58fKNXPRLfhioCa6Kj
         K2kUcX+STlffZMl6IMFj11ByLXOhUZe9OdV5DkwpBYuJI0Ecs/jZNXUBy2bGInsK77ic
         /RtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WrJYfGheHWQkQvRjP30ZrWXH0n54pBSaeAKlBsdQl04=;
        b=XqWh6f3u65HUVZ60ZkvUMlHBY5YqOnELBKgYaclqa67ro5edBiX0TBxMsOmWs8o9ek
         ZMy8VZ0qmgttXot5RnPv2SGa/puU/5EnfzEVhobDfFmivNU1WF53nI4zK+TgCVV2cTjH
         8QizS38czh6SMAbMWak16lDSN0O8ZptEOgLqxo5PdYi8mednIYb1CuoZCtaTzEq8iacN
         FdIIORSLxhl38NF8PjihvfvyMAIhJwmAW2wI2LzOTySe5/lqUbM2TZyl2fBO7GXe9R14
         fmqlhXmH75IjHqwdAH1VQCv37asTXeTWcfsmm+Avb1xCdOxMvW2gfAudKRo54i78sKCf
         hTpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWre36P6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3-20020a056638190300b00323915d25e9sor2451025jal.75.2022.04.22.08.24.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWre36P6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WrJYfGheHWQkQvRjP30ZrWXH0n54pBSaeAKlBsdQl04=;
        b=CWre36P6s4FM4g11BIWOAMsCpt7FpN20oQFbQv8D6ti5npDhQhhOsYpC8oqTNf+bHi
         CRb6ro1GZzAKqzo8XyK3ior5Ywi1SoUvFmFngW9HUn0EoACaX66liuBBLe/YsOzFeIeq
         35YJ+w/xGRrvcx0O/Q/OVR+ydx/RdlpefzanBl2T3J/2N3y1hvSUEvkTC3ciTw1HLtd9
         DK53SnSWM69gIaU6FF8v2lsbGM55ckvOAKxeEbM7yGXTQMGTXGjCcCvqOqTWH2Nj0JjG
         FQV9HJOURIvr+Y073NOOJs33BX++CoHKFHf5tQKizp/C9b+nZ1M/mg7yMusR9FVLnK9Q
         N9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WrJYfGheHWQkQvRjP30ZrWXH0n54pBSaeAKlBsdQl04=;
        b=f/Fr4aIhiHEIfPEcqcOVNtM3KeUFQFRj7Hmy9PPMetq3lC9ZrDjHgCJh7d9ZCGCNaj
         w/HYVAkmi1LEYFGjd9DflvbzKP4p3q2aptBon8adRDcssUYILdDC+/SSz1ORRPVg1xGN
         U+DzBPMSXocg3qQK551edSdIRLD8lxhezPy9JVA5fD9uQ363e3f1k39wvI/wlKFv/uNy
         YoLIWxEpB77xQzFNRdz/a9ULUf++SJg+cE8kC5VI27SWViwuMB9zG7gwqeOCM1PD9z0w
         RI1gi/DFW59mR+u+E9mQBzPepvC/GXOQ7vcG3stiFAXYkAwDloylSn+fIKwJU1StkMs1
         00nA==
X-Gm-Message-State: AOAM531El2GOVn/4LpUlSOc8cS/jRam9gOFBxKRETPBaEexrcPsfY/U7
	zWnLRCCHeA/OgEkgvZNizmD6HEnb
X-Google-Smtp-Source: ABdhPJxe5vxENw2HhP5++WKlEhRkg+IgeZB2chiaQAJEmvqnzth3GwwO/oM5sWj+SZ+s3xKN7P3+ig==
X-Received: by 2002:a05:6638:2405:b0:327:d930:bc9c with SMTP id z5-20020a056638240500b00327d930bc9cmr2335926jat.70.1650641053042;
        Fri, 22 Apr 2022 08:24:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1? ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
        by smtp.gmail.com with ESMTPSA id j18-20020a92c212000000b002cc3f380cf3sm1457310ilo.39.2022.04.22.08.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 08:24:12 -0700 (PDT)
Message-ID: <4b4e8791-795e-0037-d9e8-b85a66ce2a42@linaro.org>
Date: Fri, 22 Apr 2022 08:24:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 08/60] target/arm: Change DisasContext.thumb to bool
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-9-richard.henderson@linaro.org>
 <875yn1uskp.fsf@linaro.org>
 <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Evh0mTHOzsk=dv9MAKjPcKmSVTFfKzV42zzRyZ4hUfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gmRdKlNqyP7Z

On 4/22/22 07:04, Peter Maydell wrote:
> On Fri, 22 Apr 2022 at 15:01, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> Bool is a more appropriate type for this value.
>>> Move the member down in the struct to keep the
>>> bool type members together and remove a hole.
>>
>> Does gcc even attempt to pack bools? Aren't they basically int types?
> 
> It's impdef, I think, but it'll typically be a 1 byte integer
> rather than a 4 byte integer, with the usual struct packing
> rules for 1 byte type sizes.

Yep, it's 1 byte for all extant abis except macos where it's 4.


r~
