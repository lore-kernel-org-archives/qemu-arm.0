Received: by 10.25.0.144 with SMTP id 138csp171017lfa;
        Wed, 26 Apr 2017 01:29:46 -0700 (PDT)
X-Received: by 10.28.94.194 with SMTP id s185mr15116799wmb.103.1493195386361;
        Wed, 26 Apr 2017 01:29:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id 1si1515140wre.175.2017.04.26.01.29.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id y10so20188582wmh.0;
        Wed, 26 Apr 2017 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eL4CEChqf615jKcCars1uRyL17qCsrK5LRl6uP6uIrg=;
        b=kemteWjGq0OiT9mx4zuhWIpqiyof+HBXCGwH/a1X+bTav7khNOJmx2Fi0zZUVEqKNu
         NrLbOaatKN716x4xkuAUtd9vaYgJ2SwknB5F3lnyv3imhtZduhUI5G2ouNfilaNdxjsy
         NVSMfnzuXkohZiRbARAq5hsyZJPhzv/mGquM1fDqn6tNeZBXcK4f3BzRl5ONZTOGbY1F
         WN2aaq2NuLFcRUnmlgqkqfM02wSiJNNnMYo+8/vXmeNvaOsLzKOoDYu0cVObCkKdAcn4
         PVJhotADe4XjYm9GuoYIa5eIH8TIa/mj9gLJQSpPuVZ5EDxsoqpmGZgM0zkQRGArPTnp
         nSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eL4CEChqf615jKcCars1uRyL17qCsrK5LRl6uP6uIrg=;
        b=rb1VHsVxUc/A5Pw2jK8MtLZ9qaVfio39P6dNphHO2yjN5jWei8Vb/Y9JJnfBzA2tM3
         t3iuPYhSKs3X1S4alzdndUudhEmeJsDZBpSSfUmsM+Z/DGpbJfdZPJHtb2hk4yBOSPT6
         1prDgnBuoB5K8ky0rbqLYa7EpsE8LVzwYU8lH2aGpQe6fOUM0eaUl1wRQoqwbUDdRck5
         k9+hpd1ERaf5y6jifp6aW/w5IMpxBVXKNfhDqE0GDk9AIUMe53T/icm5baM7Ys352YkZ
         UTbBwVwOIxt0OVQ/305VwhH4GELCeAcunk11NU89DHAqB441xEY/Iykv/WFGcNZ3iKwK
         whaQ==
X-Gm-Message-State: AN3rC/6kTXW00L+xyUJhClLk+0+3D22q7m4C5ddvUfiRnR4jrJbMz2ZD
	ZM0krzhQSoZ21dsa2W4=
X-Received: by 10.28.95.85 with SMTP id t82mr16081271wmb.3.1493195386121;
        Wed, 26 Apr 2017 01:29:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 92sm28927354wra.18.2017.04.26.01.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:29:45 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 03/10] tcg: export tcg_gen_lookup_and_goto_ptr
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
 <1493187803-4510-4-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <931dacb3-892a-6e13-ecfd-8ce4b0aae52b@twiddle.net>
Date: Wed, 26 Apr 2017 10:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-4-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 53TSd67G3ZoI

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Instead of exporting goto_ptr directly to TCG frontends, export
> tcg_gen_lookup_and_goto_ptr(), which calls goto_ptr with the pointer
> returned by the lookup_tb_ptr() helper. This is the only use case
> we have for goto_ptr and lookup_tb_ptr, so having this function is
> very convenient. Furthermore, it trivially allows us to avoid calling
> the lookup helper if goto_ptr is not implemented by the backend.
> 
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   tcg/README   |  8 ++++++++
>   tcg/tcg-op.c | 13 +++++++++++++
>   tcg/tcg-op.h | 11 +++++++++++
>   3 files changed, 32 insertions(+)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
