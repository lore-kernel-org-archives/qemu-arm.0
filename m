Received: by 10.25.0.144 with SMTP id 138csp647865lfa;
        Thu, 27 Apr 2017 01:09:28 -0700 (PDT)
X-Received: by 10.28.223.84 with SMTP id w81mr1356769wmg.32.1493280568746;
        Thu, 27 Apr 2017 01:09:28 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com. [2a00:1450:400c:c0c::241])
        by mx.google.com with ESMTPS id o6si9870117wmi.107.2017.04.27.01.09.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 01:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) client-ip=2a00:1450:400c:c0c::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x241.google.com with SMTP id g12so2845547wrg.2;
        Thu, 27 Apr 2017 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oJpQx/GKeisnndR2jW1t+BJhF2EJ5mxB1QVT+fd/ToE=;
        b=XjvxcpwH9I4Uw5X8uar4oIB/1F6qaUhJiy+eDPv3/PB7mnO194qa/+DhDKxA0qW15S
         5njXP22Bf9mOp9RChKB347imfGFJxpuGd5U9NGlbAk0+kh9ZN27IocjNPXruNQM6Yorc
         JTrmvzjKZhvUdjCE9NBFOoLQTSh+bR/j7rQwpeu3T/70D//vLsvBybNRkn/YKzradNmM
         FieHzG50Kz6h/LvJrpmTikEs0lceMahdiOfkRJSMyiRhsagz/KQzsf6HOtwsNB9RldWd
         D0QFt0bvsf8BqhHa0BjUXnj6ghzr6Dq4qklOS5tLelonwDZHw5sWvVoLx4FBCA3xuSb2
         bNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oJpQx/GKeisnndR2jW1t+BJhF2EJ5mxB1QVT+fd/ToE=;
        b=Mo9spLfvZKQBzrAXT5zc0BjgKMaSvlfdbTxiNhKVhXEPsslhS2yio/U23ccuL5F0s5
         5/ZVT3ckLqtXPp5jjmmC+PwAe1Bu6J/EMRXli7IIn/14my8tVFmK1aCKrYWtouBGGwy7
         BY4odfs0ub9KAJiHgznQVkAtpXznSl3i2665voeBLCR318pQpqBYKdr2pl5MS4igP18n
         /mvlh4U7F/mAajpZkOc4OF09VUkl3FWX7+ZSaN3uxPWJ+KE3Arty9etXqrE8BaD02/aP
         Zzcf7OnKylB5T3eVIIRTkh0OlO2AMNn5VvAnUpjqoZYBBCTdP59MUdj9YoQekooh+zye
         qlsg==
X-Gm-Message-State: AN3rC/5kyWd+naIbE89QqjBzaD/05XMD9qgOFsyRiZHfOyZxok0n5KbX
	icG+JJ1gj6h+og==
X-Received: by 10.223.175.211 with SMTP id y19mr2502345wrd.77.1493280568383;
        Thu, 27 Apr 2017 01:09:28 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 59sm1684703wrl.48.2017.04.27.01.09.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 01:09:27 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v4 03/11] tcg: introduce goto_ptr opcode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
 <1493263764-18657-4-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <7f2ce7e7-4000-275f-1e83-7ce1ec8ff44e@twiddle.net>
Date: Thu, 27 Apr 2017 10:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493263764-18657-4-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: xEJATEgpopSq

On 04/27/2017 05:29 AM, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   tcg/aarch64/tcg-target.h | 1 +
>   tcg/arm/tcg-target.h     | 1 +
>   tcg/i386/tcg-target.h    | 1 +
>   tcg/ia64/tcg-target.h    | 1 +
>   tcg/mips/tcg-target.h    | 1 +
>   tcg/ppc/tcg-target.h     | 1 +
>   tcg/s390/tcg-target.h    | 1 +
>   tcg/sparc/tcg-target.h   | 1 +
>   tcg/tcg-opc.h            | 1 +
>   tcg/tci/tcg-target.h     | 1 +
>   10 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
