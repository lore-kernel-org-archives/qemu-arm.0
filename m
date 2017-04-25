Received: by 10.25.0.144 with SMTP id 138csp1814040lfa;
        Tue, 25 Apr 2017 04:12:03 -0700 (PDT)
X-Received: by 10.28.206.195 with SMTP id e186mr11670810wmg.37.1493118723198;
        Tue, 25 Apr 2017 04:12:03 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id z91si12015219wrc.261.2017.04.25.04.12.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id y10so13064248wmh.0;
        Tue, 25 Apr 2017 04:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QuWVgPrQWXUvPpyS+1DcmnyboVyXreMIe0G/cnMvm84=;
        b=I/1tPqEpZvsEW9vVFEFE0HbtLdSteIH1JKNuGfXZatvzZ+wJ8NHvIXDByTsg+d6JJ2
         Tz85+pFiOCrOZkmqTkOr8Y7zZ2PSUrWtQ3MRgNAY6lAgDy3WwMl4NBjg5LJSq6o6LL0v
         Kv7PMJNfoFyXXD6k9LXKV08gH5eLJhy8xppidLzv6/uJHAGyM8vZy0ozqyetBjxusN/g
         vXVI9m9OxJ8y7KaQzmqxWCoJOncXSyFksW4wnD6lYOqF4otcSA+FiM0zNaTXdUk9tfvY
         Uj/OkN4oQa8yFwi5rNnSOfLXFg+wBjoua1fRwEqe20IhE2TomL2iVbtUS3um0qnU6aDg
         OKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QuWVgPrQWXUvPpyS+1DcmnyboVyXreMIe0G/cnMvm84=;
        b=JhXWnghG7dtiVVfIJfXkE+BB4LYyQ5KXo7ERzeKV6Pu7kL1kuxPl5LKAR4A7mLxpBK
         kUuo1YofeDni6C44Jp4j1MWQO/lpi5Unw8BG0zdcLnwZxJR9m3y5SLXl8Jx2YdoogXCW
         omi0nWKqnyiVDGRXcWfHn/W7PtsHE3q5XjASfT2ogi5Na6JaGP1a+mVf+i/P+u+jAFe/
         IIdxU+SA7LoeqFswtdwUWcVzXjjwIINA+aKtDupODyU7c67qEIGwtrwqZ1WgDwEzd5uL
         3PtsIldoTuJWDPwUzuTv2j3ls/mu8OdE9Gm1Qorp7otubpD8y7Y9J6IqQr4CS1eKe3WH
         BaQQ==
X-Gm-Message-State: AN3rC/4yqz3Bp28H+8MzXNq2ZqsuUYesE9wBQZVAMU47OdLCEp7+CARS
	eO9KFZPmxUZFJA==
X-Received: by 10.28.182.69 with SMTP id g66mr1649499wmf.112.1493118722933;
        Tue, 25 Apr 2017 04:12:02 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id s49sm26006933wrc.5.2017.04.25.04.12.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:12:02 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 08/13] target/arm: optimize cross-page block chaining
 in softmmu
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
 <1493106839-10438-9-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4415f093-84b7-6dfe-43c7-524507cfa41b@twiddle.net>
Date: Tue, 25 Apr 2017 13:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-9-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: sczFhDVL1sD8

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> Instead of unconditionally exiting to the exec loop, use the
> lookup_tb_ptr helper to jump to the target if it is valid.
> As long as the hit rate in tb_jmp_cache remains high, this
> will improve performance.
> 
> Perf impact: see the next commit's log.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   target/arm/translate.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index e32e38c..574cf70 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4085,8 +4085,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>           gen_set_pc_im(s, dest);
>           tcg_gen_exit_tb((uintptr_t)s->tb + n);
>       } else {
> +        TCGv_ptr ptr = tcg_temp_new_ptr();
> +
>           gen_set_pc_im(s, dest);
> -        tcg_gen_exit_tb(0);
> +        gen_helper_lookup_tb_ptr(ptr, cpu_env, cpu_R[15]);
> +        tcg_gen_goto_ptr(ptr);
> +        tcg_temp_free_ptr(ptr);
>       }

This does not compile for aarch64.  You need to tcg_gen_extu_i32_tl first.


r~
