Received: by 10.25.0.144 with SMTP id 138csp170611lfa;
        Wed, 26 Apr 2017 01:28:21 -0700 (PDT)
X-Received: by 10.28.56.1 with SMTP id f1mr5047941wma.20.1493195301567;
        Wed, 26 Apr 2017 01:28:21 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id e125si6254201wmg.153.2017.04.26.01.28.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id 6so14051106wrb.1;
        Wed, 26 Apr 2017 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4YTU6BcIXHX5mp36TVATAagAHKQKwV7O6DMPUsOTgH8=;
        b=ONPRxPODUTd0cmD4hRqsFfRzEdtR+HQc8TkhExrMpcu9jKH6r9kFsMhHTDpoZRJYSX
         9aMGpowlQ6ND1PHYbeO16Ldg0+6xUDDmtjYenKOMsHrVZ5sax1l7lyqOzTh8jg7Wclcg
         stvg5DN0KcEmapTQ+CtcICtsMN7c9ZOpaFKzQ8L7A2x1AAiYYRsoTa1rvLnYmvG8jUQK
         aCpKga+5bxBeMU5Q/m6xffbss3S+s6fRxMbwDU+M3tcUyBkXe7R5cEDum5HJPCta6zY6
         T3B0w6grLDUf0V7WDdewr3+wZDnQ3gkYx7Udr0o/7hnCLzzGnfqAxzOaH1xFQ9Ce+non
         qR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4YTU6BcIXHX5mp36TVATAagAHKQKwV7O6DMPUsOTgH8=;
        b=GSZeFlukZoDeELNdxzTUlfaU2UB3r32TkBKQTcq5Je/lH+ItQA1EwQFU0tgwenknmS
         kieU7M7hQua5CihvECoGofQaNrE8oQv8YiycYs0qqsNiVabGooBomZgWfngHuV1INMln
         zJ2aB3NG2Gm/QO5AUY5V67I2o/9xaMZbeSc/5te9g38huMkVXxZe8xRiN0xBxz/HVkP0
         +qBN5Yxo21LS9o+0Rz/0NabYV8siRntj5mCdWqIlNcHoHa6Vt3qrNx4ZfKjjrlDziGR+
         naag3rinGLvsKfzjquKFOhE3D1nbFjta6ALZKFCWweHt8XIelZyFjehcjta0pLYau6gO
         yi+A==
X-Gm-Message-State: AN3rC/6ZruJ7MqOok3UTA80oGvVQQ/utPsaXLRv+iKB7Knw8pBtAEcwB
	axUOWjOwP3YArg==
X-Received: by 10.223.169.78 with SMTP id u72mr12175336wrc.193.1493195301320;
        Wed, 26 Apr 2017 01:28:21 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id w11sm4577697wmd.21.2017.04.26.01.28.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:28:20 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 04/10] tcg/i386: implement goto_ptr op
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-5-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <b24825b4-c4b7-6ec9-8d65-3039a64cb145@twiddle.net>
Date: Wed, 26 Apr 2017 10:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-5-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Ch9w1x43fVhA

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   tcg/i386/tcg-target.h     |  2 +-
>   tcg/i386/tcg-target.inc.c | 15 +++++++++++++++
>   2 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
