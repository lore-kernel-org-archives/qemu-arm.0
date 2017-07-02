Received: by 10.25.227.6 with SMTP id a6csp481089lfh;
        Sat, 1 Jul 2017 18:14:28 -0700 (PDT)
X-Received: by 10.55.79.80 with SMTP id d77mr31618296qkb.155.1498958068860;
        Sat, 01 Jul 2017 18:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958068; cv=none;
        d=google.com; s=arc-20160816;
        b=HwbE+rwqpZvwHfrmfgsFlGnPdPC7BN1S4ag23hARRypnmJNUBZwT1BL7RQBZ+6Bsb4
         RtLLrWqIQ51A+cuX32GCPSO/OXEovgWgNpMfPb9vjYmA7A0zv0CZKVsQrFZ8QYIdTjeZ
         zVjKLJXrkgkwG4PanWKw7yTeidPjChLEnBwxNfM8a6GYyYDi59IdPxwue1+ztJ7R3PYw
         dn0Ok6P4yBYHOU0AZUt9bD4zr4iKVHcEf6i3dIRSoXWtTz6NTftcdUtdRF21kE7oE0O6
         O4hjVBe01WqUufocOFgxR7V99d3HHuBeMciECv9RYztSeDRNW6/4wI1+5zR8Hs2kI9kl
         TMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=djUH/rFAHl+7prnysqs3k1L+OYhVv+KiZHuGpYawmYs=;
        b=s897IFgUqo7xncV284QGiX4znE4lPuLf1nxYPmgt21qMuNXz+DxNW56qItG4GINN9D
         FGFkznqvSFHn4GGRfAFPnEZktYI6B7PECRl08tvJ89LeGpTuAe8nVwmHX8/LRWAjAHjw
         Tit4CLy+5gEzpBsizMLw68Nh52G+lvk7G7UVYL+HkOfFFv50flZXf1gd5+4UqD14MkqO
         xEcOwHOBdQpgB+TnwK+sSBwD/rQV7nuCpu13Lrne+RYkOZ3J7ALNDNqhHR6ss0gbcHXu
         NrLvAl390o6rvl6K0FjVD9gqA+255eRMwsqFgIVxI6845NsbPumLHoAsMWD1S0Sl63mv
         bGdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=MzNTJ7o1;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id w5si11325356qkc.373.2017.07.01.18.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=MzNTJ7o1;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id 91so20071539qkq.1;
        Sat, 01 Jul 2017 18:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=djUH/rFAHl+7prnysqs3k1L+OYhVv+KiZHuGpYawmYs=;
        b=MzNTJ7o1eOiFm2M9A1EHSEHjnhUJ/iD+9eNDyzC1SNoSS0w6QHHvRp3a1AdSX3zjFF
         GQsByQ5I2B0MdBwbEqdgw/FMnZUZHe6G5+LB1sleji0MkF0dk9tdVjplWX0VTvjkieSO
         sv8mWAnQ3Xnmt4qOCQ9+kQtiDMWg8MVOpTE6OQnb2YHQK0Lk/Y/C/gjQCXbEiwor0hUE
         E2uqJTNdfhcTn3M1l7HHoZ3MXosJMcMRa63qrBRUh/E8PZhfXYMbjZygUQjP+C8G/W4O
         XIgVzdbtk+QfbXW3GKXXEFOu2SHsmKvfh8jATm5axFCWHixlKVc/ec1/YYIpGBj7eW0O
         Y3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=djUH/rFAHl+7prnysqs3k1L+OYhVv+KiZHuGpYawmYs=;
        b=m27NOJQWpPgk0OVXh1jKbJ3jMJwNJVepdG+QSwqjKeAAZgBJiIiRFZM7Je3Ys11HT6
         VDJZ0F3DqNXuSpGhQb+oEDFzNpkyHZIq3pEBS+6Bkc1uRrxOzNJnY5uzfZYhkTnhT+1F
         U7tW1e5KspfXdrniRfJwQeWmHO+okeV37Kt51Y/TtUuAy0R9sVmEVkkKqGnsreuopWQw
         7rHBOAcFb8AlmZIfmD7MyLa422GSqGoYtHFqsuUPfWH9JoNsSaHe/vJnB9K4pV9azGHl
         s6M5ZZo1Yg6/fI0CG5EnER2Ojs7uyGCie1nmPKgb6UjDcnjqMRvqfKQZ923EiUQgVEWQ
         Q+mg==
X-Gm-Message-State: AKS2vOwv8dblNbKCpcHFs67jHLucQuoYrmtfJrRPUR3sqqehK44Jn6Rj
	KYl02q7ICUKAyVqN+2s=
X-Received: by 10.55.188.69 with SMTP id m66mr32139832qkf.63.1498958068303;
        Sat, 01 Jul 2017 18:14:28 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id 79sm9697049qky.50.2017.07.01.18.14.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:14:27 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 17/29] target/arm: [tcg] Port to
 init_globals
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865631443.17063.7093785957776924619.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6892be07-cc3e-485e-0f26-8569b1ca3a1b@twiddle.net>
Date: Sat, 1 Jul 2017 18:14:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865631443.17063.7093785957776924619.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gdSArJspoxqa

On 06/28/2017 06:25 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate.c |   21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
