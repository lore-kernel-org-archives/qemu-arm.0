Received: by 10.223.188.70 with SMTP id a6csp6083201wrh;
        Tue, 29 Aug 2017 08:01:54 -0700 (PDT)
X-Received: by 10.84.232.142 with SMTP id i14mr760031plk.81.1504018914147;
        Tue, 29 Aug 2017 08:01:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504018914; cv=none;
        d=google.com; s=arc-20160816;
        b=YhV08TA0KPyRpPzS+hPNh9WfOxlO+E1cu1AUqAU11IMDXrTmkMdSe7uViBQjDxpcfs
         9YyY7fMCeSQQ1nH4Ig5kM3RfU2EsSxesN9upeTo8mft0+rgeXZUb8hstRKE9ruCDYJtE
         XxXiIxKKO2y2pdJjnYe5QbOv7rglWKYUw+qWgqKDyn6sGjlzhIWOIpgBxH/j+lJBa+A4
         GVub0VtJ8VeCVuHNz51wd+mocvFJC6n5RusQwYXDjBgBJ7GcK48H31BqmH4HVvyhU0Av
         WYPISTtNCsTpCE8whdejVFIOYHGdr4hcNpa52ZnFxc6SXpUdq2t7qu0AT5DooYDJp3eK
         eISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature:arc-authentication-results;
        bh=LKBU0WUKPMb/q3fXiJRYxg3Mc4KrXwkY+17UOZ/wFzI=;
        b=YVubWfXDWq3hR6tV9fViIU4Zp6Ln8Od1qsty73z2nV1crPdTqJpKwQ2ak6fYw+eFxG
         E4hJJ0l0wvXH6m6WVDDZIEQD+6NSCoZFtktcJ49Tdg/cG8ob1/3PRB/O/HxjjJRvUXSZ
         qe9wNmu1tEPJWd2DmG8MeuntybLWFEAbRq9uasUUGCvgCDxAePph8q7skq3OVovdkSlg
         JlZ6C2JtMhcJCTndUXA3/WnZXNn8K6T3BVY2CQg/XorteJI/Vspjy2NsvWnBIePz+gC8
         3o6ekpgSmI5Gl9eQQY0yqtFz3Ha4BhiaCy+1f6lJKu+nVrdhtEiXMBMfgQ7R/AS16NDm
         iJyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MH+azhuR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n6sor2068284pgu.156.2017.08.29.08.01.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Aug 2017 08:01:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MH+azhuR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=LKBU0WUKPMb/q3fXiJRYxg3Mc4KrXwkY+17UOZ/wFzI=;
        b=MH+azhuRaoUPIRw83JrRLvOujt3WzSkPjhFSZ3e6XJIHE8aAxreuSLCmf2akHBNtzl
         VyMysuIAEvg69MpcoYN4XYNPZ+81Y5fIDH9rc0zaTagzFF+a7tMJdolNF8Ii+trfNt1Q
         RelyxpAfsPkBJsmZnhSiqyqtcOPbN505bM8GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LKBU0WUKPMb/q3fXiJRYxg3Mc4KrXwkY+17UOZ/wFzI=;
        b=rU6vLgnrtuW6aS7ikk1Y1DPrWOr2iwHRsHrorDgOHbYgFqlCdXnBNf+goH6uWVRe0l
         o9Z3eNP8mKKgBO8P49DNkm8SbYmwNfYvJGM8rdqbW42M1QTjcm2SfeLJEKc/q/0MiOZW
         MHLqw6DbzJkrMV2T2Bc3pNk72r3Be6VM33q+DzUSPTJ9XWLdFxRIW4dsOvjm7SjrzndA
         BcJRTjm91XZxqSDeQwIGbvslTbQnd2j9FZI8gEKq5sSFcTEDS7zVIIktbW8TtvdYvpbP
         6vq3Ds/UVjzm++vuQxSZMUxofABFiBPTuH5KfYIMiRgXO3s2rikJ0104kPpWExgWtHP/
         R+ag==
X-Gm-Message-State: AHYfb5iRddPQ/fd4Wt7wwiDzCrkeikQlOyCwHbn2wnSm08a6y3/y5HTx
	Uwlbydj8sVK6QMFY7Mg=
X-Received: by 10.99.175.10 with SMTP id w10mr561692pge.373.1504018913503;
        Tue, 29 Aug 2017 08:01:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id s186sm5849280pfb.110.2017.08.29.08.01.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Aug 2017 08:01:52 -0700 (PDT)
Subject: Re: [RFC v3 PATCH 5/5] tcg/softmmu: Increase size of TLB caches
To: Pranith Kumar <bobby.prani@gmail.com>, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, "open list:Overall" <qemu-devel@nongnu.org>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>
References: <20170829063313.10237-1-bobby.prani@gmail.com>
 <20170829063313.10237-5-bobby.prani@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3148d084-9bff-2d8e-f1a7-fba94a1e7f87@linaro.org>
Date: Tue, 29 Aug 2017 08:01:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170829063313.10237-5-bobby.prani@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: AXcpOuXCVpJZ

On 08/28/2017 11:33 PM, Pranith Kumar wrote:
> + * TODO: rewrite this comment
>   */
> -#define CPU_TLB_BITS                                             \
> -    MIN(8,                                                       \
> -        TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
> -        (NB_MMU_MODES <= 1 ? 0 :                                 \
> -         NB_MMU_MODES <= 2 ? 1 :                                 \
> -         NB_MMU_MODES <= 4 ? 2 :                                 \
> -         NB_MMU_MODES <= 8 ? 3 : 4))
> +#define CPU_TLB_BITS MIN(12, TCG_TARGET_TLB_MAX_INDEX_BITS)
>  

Ah, no.  This will cause several builds to fail.
You still need to restrict the *total* size of
the TLB to TCG_TARGET_TLB_DISPLACEMENT_BITS.

(That's not a 100% accurate statement, but is close.
See the QEMU_BUILD_BUG_ON in tcg/*/*.c for specifics.)

The upshot is that if a target has 2 MMU modes,
we can allow them to be bigger.  But if it has 8,
we have to make them smaller.

I was expecting you to write

  MIN(MIN(12, TCG_TARGET_TLB_MAX_INDEX_BITS)
      TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -
      ...)

r~
