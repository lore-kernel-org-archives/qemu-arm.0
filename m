Received: by 10.25.227.6 with SMTP id a6csp502163lfh;
        Sat, 1 Jul 2017 18:42:13 -0700 (PDT)
X-Received: by 10.200.35.21 with SMTP id a21mr5360581qta.56.1498959733432;
        Sat, 01 Jul 2017 18:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498959733; cv=none;
        d=google.com; s=arc-20160816;
        b=L9WIn7Jf9Kp+QFy0buZMTkkci9v3kj3mxFGIyam8a6CjZVCsSYayhc3rPkAb5phBfD
         8j6RakBiuabsvJKCFeFpB8arYzRcYwTY6JZ6vPxFIPPa1oMY6BHDsLSrw+WwPoPm83jy
         7kGKbEfbpfIzfSAxpHTLiEp8ruLMLlJMOFUigLBC+LMEIkW4254s+/qYikcJFZmzfLcI
         CrPUhRsSTbHH7SNg22AEK6eUGKvjYhdK5CbUG6UiEJNzdSvKr1eGVvqEK9TWAH+PPa5P
         vnwLc+8JI2tdgOJjw9n0PDUNbQOGx1aZ20u8fENjBCTtRNzbDWDtQM/dDDPqbOlOObdq
         AQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=/jsQ1EGIH5ilVBv/Vh+8E7Sp3iFb/j4d0uE0nNtD2EM=;
        b=zizIbHChv4Cqr1XnRVm9GKK0qo/S6RMKRVd8vAPqUfJs4EzVGoToXMkAaA0fON/abF
         Fn/u9DwWBHYF21B8sGBUjRmbiqNuEiqxJUd3kHwt1P1cE8HcljnmGXusAqXiG02+szt+
         2apqeBWffouzKQod3kFpaHvPJYaFz9wVlUH7o4K2JpQbstQJzVP3JX/3W3GcLT0GY4Gl
         64q4b7h15Xf533w9aynKJ4D5RqVmFhC7h8PTyFEqBY1VpIWTNwVLbNNAfCYsQ4as8col
         rovJShph3UU3Ew2SRH4X3kkN9P8jEDzg7eiZErYKThETe1c79NGg5EYhwNbLCMm78kAA
         t0Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=NuTCMoKZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id x46si11475821qth.258.2017.07.01.18.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:42:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=NuTCMoKZ;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id p21so20131138qke.0;
        Sat, 01 Jul 2017 18:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/jsQ1EGIH5ilVBv/Vh+8E7Sp3iFb/j4d0uE0nNtD2EM=;
        b=NuTCMoKZC0vJsePZUaqZLI2iVbOWjqW+L3yWfpysBygcXAeXjk/Mj7KNeUEqePA2p4
         TuVzu8eGP6ctF0/MTnKu6A36LJqdWHa2MhH9uDTv6AR/J7Kry4n2w6qZnTnH9nOhLB15
         g/y+Kd0dm0DgP1RkeAUZUincaEMGJPMQ33fPmTpK+BIJzo80elH4/88RdXXzfb/SXF6z
         TjuPfhDNKMq+ov3lzJR3degl7ockT/r9F5ySBJ93eR1slpi6vM3fglj2XXFtTGQxLf/Y
         8huKmx3qsTewOmeFzBLfSVZ7HAmf6vtFh7JopsjsUSlIb2ExELeYmnSQKUehQh/rMmSl
         MSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/jsQ1EGIH5ilVBv/Vh+8E7Sp3iFb/j4d0uE0nNtD2EM=;
        b=LyjmA3Hejr1+5/+rS+AEshCgJN5KPYuoqitIKHLancb/A0DZEvEGfwsVV3klB2FBFO
         gLqdJFpGG/2BBRad0VdpyZAAF5ZG5HMHmOoHm/mk4sTyflPmYdnWYLD7ldwSXurbagKg
         Nlga20YhZ5F0/0NCfB2lFgG3rcqCrZF8V1H04iAFVEOucaL73YGQXHAWQ7afWWkTnLnh
         jlbWB7SARvFJVHXMsdsZgNCuH2d4HTeLpiJcTxniz/cnTQ5YNvXgH9g8slXbyjeKTRKq
         ciHbf7zmKQhl0e/iUHC9Y4CIsoPhSkkXgIkWL1yf0KHLCzIgTGeD3OvHpaYTLKasz/Zj
         xQeg==
X-Gm-Message-State: AKS2vOywwyP/M0zJVCqsMVuCisTGrv1wBTa5rjKUd2Ayc1uS15YIfMeS
	3CgcIIo1OKxK/6NWhA4=
X-Received: by 10.55.111.134 with SMTP id k128mr32292398qkc.206.1498959732843;
        Sat, 01 Jul 2017 18:42:12 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id y6sm6041408qka.55.2017.07.01.18.42.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:42:12 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 24/29] target/arm: [tcg, a64] Port to
 translate_insn
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865801156.17063.15618379976159104550.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <244b5aab-8863-3139-f252-09cc02333eda@twiddle.net>
Date: Sat, 1 Jul 2017 18:42:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865801156.17063.15618379976159104550.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: T8pNoAMLfQyr

On 06/28/2017 06:53 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |   74 +++++++++++++++++++++++++++-----------------
>   1 file changed, 46 insertions(+), 28 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 9c870f6d07..586a01a2de 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11244,6 +11244,9 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
>       dc->is_ldex = false;
>       dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
>   
> +    dc->next_page_start =
> +        (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;

I think a better solution for a fixed-length ISA is to adjust max_insns. 
Perhaps the init_disas_context hook should be able to modify it?

And, while I'm thinking of it -- why is the init_globals hook separate? 
There's nothing in between the two hook calls, and the more modern target front 
ends won't need it.


r~
