Received: by 10.25.0.144 with SMTP id 138csp1808855lfa;
        Tue, 25 Apr 2017 04:01:00 -0700 (PDT)
X-Received: by 10.223.136.75 with SMTP id e11mr9650803wre.14.1493118060622;
        Tue, 25 Apr 2017 04:01:00 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id y95si6916044wrc.2.2017.04.25.04.01.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id u65so24015724wmu.3;
        Tue, 25 Apr 2017 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xpkxq/IRi/Dk3Wac6FRTYS9jpQh61uQu+Zim348kOwY=;
        b=kM6o667kA2lPraoLXvquhfSwJ7/kGqAyUeCtB1KWXZD7B9+3zLxN2jSmC+AmKf5Av9
         UEdojNWS8hv0m5PMNn6kO2C8ZrbNHJdbW626OHv1+uAa/EvKK7IVGRAysrWf7s8mUysV
         1w98RxO0ikci1iXF+A1LCxi76NSBIzujGINDi96X8/yC9k1+DM7qQnnKl/Fq8GLARhuD
         79wC/SCkKYrYyAE8ABzjmiS/rIvWEUTiuNgLm8zBTy2U2KzikPpkqm+Ol8Hizm7oLDNf
         crWH2VwYHZNJpMIY19RLsV+ZNjAme9nBnbGwq4wYj7LvsCczY6mE6oG4gEbeKNWi7E9h
         /8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xpkxq/IRi/Dk3Wac6FRTYS9jpQh61uQu+Zim348kOwY=;
        b=bcxnLU++6EO6PPUmCEJFCBEe5kABdDe9kd3JXM69v9lDxEgJqPZRYHoiEEueZLY27t
         bwR+ZY3Z8BwmvU1Zgtb0ki3p+YgA5xRAHNaKgfomgozJd/V8JqU79dglLKIEQ9f/UMwE
         YNYBVFvK/88sa/xdGsy60GhX16yrW/l5Nr4m7f2hBG3v36xT2k01bDnzH3fC7quhKJig
         hbWaRI0SwGlmfH1vts5j3apLU8Yq6YqEoZJD9vd5V3kwBvJbxKDGOcmICliiBTGpuPxU
         LrZv5/1pcLgumOm8WZ51JL2/SlGTM2HoM7FD0LcrYI85HahsEX6jZuEsCO5iax4QhD3f
         jaIg==
X-Gm-Message-State: AN3rC/6nIa5+HiFGWnixau6y2ShpU2+SADgrLRM46wQexTKpZPXsq02T
	XespxuGp4DDrXV5+adI=
X-Received: by 10.80.148.186 with SMTP id s55mr4650408eda.65.1493118060389;
        Tue, 25 Apr 2017 04:01:00 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id c2sm4937177edc.34.2017.04.25.04.00.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:00:59 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 02/13] exec-all: inline tb_from_jmp_cache
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-3-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <50bc6227-c967-5309-0fbd-96f71ea36979@twiddle.net>
Date: Tue, 25 Apr 2017 13:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-3-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 8xG4cJ6ahZ+c

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> The inline improves performance, as shown in upcoming commits' logs.
> 
> This commit is kept separate to ease review, since the inclusion
> of tb-hash.h might be controversial. The problem here, which was
> introduced before this commit, is that tb_hash_func() depends on
> page_addr_t: this defeats the original purpose of tb-hash.h,
> which was to be self-contained and CPU-agnostic.
> 
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   cpu-exec.c              | 19 -------------------
>   include/exec/exec-all.h | 24 +++++++++++++++++++++++-
>   2 files changed, 23 insertions(+), 20 deletions(-)

Is there a reason we should just inline this code directly into 
HELPER(lookup_tb_ptr)?  I think that would save a bit of churn, and I can't 
think of any other reason we'd want to use this function.


r~
