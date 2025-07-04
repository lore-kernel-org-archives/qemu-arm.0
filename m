Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1206199dyc;
        Fri, 4 Jul 2025 06:17:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHyXcNPfEt6d//QpLZKk+5ZEFHsQ1j5SBE1tIEi7FN7qR0W7RY8E2t0nOVp8Qt8dhZ+1MU26kBanDxeA==@linaro.org
X-Received: by 2002:a05:6512:b89:b0:553:5135:69fb with SMTP id 2adb3069b0e04-556dbd96b6amr738224e87.10.1751635047718;
        Fri, 04 Jul 2025 06:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751635047; cv=none;
        d=google.com; s=arc-20240605;
        b=Og7PPEAvV08+968Eab/zhFu8/EfHn3sgZ3F1tZQZTZeGluXSKhoNjWGr/fIClPxBx5
         JHDrBIqTg2UJcDeDOe/C5RXjKWlNtYbK925uvu6QhT8XJQiHuTXKHg9JkoZWFN91Agk1
         t5ClhsXpiGp2bgeITDKz8EMB8p3umPbus+blYVMVocDYdLb7ZSiYVO+ysAZaKTmeAVIb
         AUSlXfTgDXK797k1vH9mnAi7WYGUF4sFOzigLzcN2V40Gz581MgIzyeF+0PFAOUOoA4E
         gpUfr57WQhAur1YBGi2GPEAV0FpP+0gxuzjGDtehWrt2BoZfQJKR2q6tyYKgp0JYSG9O
         qYVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gZ+i/+5+N8ewOkII9wT2HLBtCT2glQpVzPe1qJqXJDI=;
        fh=EZOBYU2JwcgTByjjpC4hbOVip4pj7bd8bJ94/W9ihqY=;
        b=URejmr1y7wSAWm+kWON8/Wv6aUahi0deiMhnB4AUDs485cQJ7Ntwfgx5E6MC32DWnd
         99smgVGjbBh5xwfZ2vFCvAZKvEgKkPARz7V9VQEM6PVyN3dGk65papTnqfo+ICPybYhp
         hn6aGyf7hxdDBvlvMXswx+xXWFzGVco8nS4+3SLf3f9MvD4D1BjgXgA6t/ZdeWtQjBNf
         vJs0qQsPFMoARUDX/n8GnExqHUs5hwEMKer/5GYI+zSvAjIFWMbVafEAxblREY75VECy
         KA7wGRo3y0OeyRY/iserKVSeX4YbxtNgmuPr2aG7D2M7pOzDvGq9tIep5nkD+aIUGDdQ
         rnNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGRTSzx5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5563848efe7sor414716e87.16.2025.07.04.06.17.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 06:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YGRTSzx5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751635047; x=1752239847; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZ+i/+5+N8ewOkII9wT2HLBtCT2glQpVzPe1qJqXJDI=;
        b=YGRTSzx56gKehGAXnHI/TOuCV0jq0GCkw79k9MxnbcpZgnv5bjL8qtxwMF3QLem+J5
         LiDRPKGz/oBmk2IQelMN7kVh6yzSAmaoDBO5c8NjigzaoTWWJpGaFNr8LUW8Ng9AsqH/
         Jd9eHcelwokybVkkiUBQGOotSZO4J5vakqXg7zGWEFRpi0Sb9+AS/kgAqrf/rJCUG608
         kWoSnD3ulUhEjmnu5jzN8PtzfMTQ9PwyW717sGg8gOuJQQtxTvTXeGTutW1P1XkN5HQ4
         W0FNgHt662tyutRAJz8elDzuRd2F+0S0dDYS56ey4V2v/rKDdq7OAy89b1A0dkAq1jIS
         Up9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751635047; x=1752239847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ+i/+5+N8ewOkII9wT2HLBtCT2glQpVzPe1qJqXJDI=;
        b=QCjC5q0rXF1M3ItFuy1t3/iG6HKSCwdKEfoAAuYDpqLa1Zpv9nijchioHVq/dUQDa1
         T3h1tkP+hrm9fAzUFBojp3KjUg5jFYXzgy8n6FC8eJwE9h6i5wcqfYwlRaTTZMy1i1rH
         ul5Nlj3uZpdpkiPSRwjta2W8ryQrhTQ92+4BYVVTKSy1VXZhu+ZXRMQxq8z4OwxsVsS8
         FK32/L/dZvrtMEd/Y078m/GAL0i6HWClDwEKc+aMXc+XdLfJxXjFhQXUs73UfqAwfV2L
         PeUGipeZRFF2Ti2SvK4wE3dGyricLgxN13ZgQetz2XstbimxKVtnn+p0ZOa3r/o57VAW
         YxcA==
X-Forwarded-Encrypted: i=1; AJvYcCVg9WLMLobOPMtGzirR913U8VC+2kCzj41TkSX1JNrOQEPjJbg0RRA2//kkvOuBVqaNEDBV+CG13UUrcA==@linaro.org
X-Gm-Message-State: AOJu0Yxza7nVnNclGllXpxJOhMf6mAE1LzCTt8EbDVHIwBLGP5gjrPSt
	Co+2yxRMvPKPjrAQoguxNffEpRVC/7gvUPsfunPYQl+KGqidOvis+SVoqpkn+BlxtDUr5Q==
X-Gm-Gg: ASbGnctuvhJNzew6hRMNj1XX8x644P4aHj4j/8ke5kbwG2Nglu6BYQ64T5D5TDR7urh
	0nAA1Ji0jISpUHh0c8WubOjkECthYkf3XfyArNM0WV4tdjGHdyr5sJflgCHS0IsVxLXwhDAf0GT
	QqU4m3edveQMONHkd6j7fPeQXSFRaP1oYKIfmqbS01HpOrbtk8AeNWm13ycBZ0reWRqfx5DIOfp
	HW4qVafEvkZn3KntXOc3YTZECYh1hdKrtG0UCNJ94a2RlFdCnJ34+ceMb1SHeTrxDgtEcr4+Qgs
	Ig5xWPdsYRLp1+iU7Fa36yXddXtKXcz+UWKbPVxS2AjmB7ffx9PZHys3I3xdu2sKOgwMUCbyxXE
	LyFqLFNTSRFsxjBY5mGONdeQ0n9917jSpp1k=
X-Google-Smtp-Source: AGHT+IFMIpYwULNg+lU45xyfQ2tIwlIKt9q9LpasQiHw0WDa8dR4mT/eYFUNz1hUoByo8ABQ9vBfSg==
X-Received: by 2002:a2e:bea5:0:b0:32b:3aeb:5533 with SMTP id 38308e7fff4ca-32e5f55bbcdmr8785901fa.3.1751635046949;
        Fri, 04 Jul 2025 06:17:26 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b120281sm1933051fa.59.2025.07.04.06.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 06:17:25 -0700 (PDT)
Message-ID: <eab8d30e-011a-4ec0-ab70-827f6a33a5c5@linaro.org>
Date: Fri, 4 Jul 2025 15:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] target/arm: Only allow disabling NEON when using TCG
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-3-philmd@linaro.org>
 <CAFEAcA8KBTfJqUbBeUm9_=JoMf133Tt3tcWhJ=sSSy-Yc6Cdcg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8KBTfJqUbBeUm9_=JoMf133Tt3tcWhJ=sSSy-Yc6Cdcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: L83/1eiiyX18

On 4/7/25 15:03, Peter Maydell wrote:
> On Mon, 30 Jun 2025 at 14:09, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Only allow disabling NEON when using TCG.
>>
>> This avoids confusing user experience:
>>
>>    $ qemu-system-aarch64 -M virt -accel hvf \
>>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>>    qemu-system-aarch64: AArch64 CPUs must have both VFP and Neon or neither
>>
>>    $ qemu-system-aarch64 -M virt -accel hvf \
>>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>>    qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
>>
>>    $ qemu-system-aarch64 -M virt -accel hvf \
>>                          -cpu host,neon=off,vfp=off,vfp-d32=off
>>    qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: Property 'host-arm-cpu.vfp-d32' not found
> 
> I don't know about users, but I'm definitely confused.
> Aren't these three all the same command line ? What's
> the problem it's trying to show ?

I should have only shared this confusing example:

$ qemu-system-aarch64 -M virt -accel hvf -cpu host,vfp-d32=off
qemu-system-aarch64: can't apply global host-arm-cpu.vfp-d32=off: 
Property 'host-arm-cpu.vfp-d32' not found
