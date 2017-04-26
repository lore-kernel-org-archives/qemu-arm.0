Received: by 10.25.0.144 with SMTP id 138csp206320lfa;
        Wed, 26 Apr 2017 03:17:49 -0700 (PDT)
X-Received: by 10.223.136.75 with SMTP id e11mr13258682wre.14.1493201869649;
        Wed, 26 Apr 2017 03:17:49 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id p81si6558297wmf.2.2017.04.26.03.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id w64so45808248wma.0
        for <alex.bennee@linaro.org>; Wed, 26 Apr 2017 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=BAMUdzL2NXia+Vb+9Bo86gadjTWJ9LJTVEPNhvpotMc=;
        b=QKd8IxKzcMkfzDTCZQb08tTi981HBGXLEwVaX3XreHKzj3yF8JXcWzXY12Fs1eI1GT
         nZaf5AHuVmvmSGmIeDvSz0LF0UhohQcYofborAv3DKyj7p778kcft1mZltMjEcLnsgUq
         2ScAVvykZFuNa2HwvQSZ6CFT/mPp4SM/NeDQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=BAMUdzL2NXia+Vb+9Bo86gadjTWJ9LJTVEPNhvpotMc=;
        b=NhJa4pbfrMxXjAPDP/C/SswzB4NP8qMiEn3dh6S+XlrUvUqm2Gt0BFJC5Vg5f4vlqS
         tELQwSDsFEOOO6U9T/7n7NmG08te2dzziSYf+0yWkpoF7nncIhk+e0nkmB9w/yeGCnj0
         Pei3lkU81R9cwqAVSCWRz5a509xHOGtPf4pYH4abkn+fxzFfySTWyYOr0krM2E2pHZqU
         /nfIdfG/2UIeVHom7YivDnCscZ2t6Eh0Y1z3m0Tayv/iPY3FcE9zVlLynwQ8nccVB0xr
         6FLFY7OEuaL7huTzRxK45+glouydriKaqU11QA/69NkHk44GHyIGFZRyQ5trS5UdYWwx
         c64A==
X-Gm-Message-State: AN3rC/4jVhUdLPn9neVXj38R+GhfYM/RUCzdArq/Zo0PzRjECASL9nRL
	0AAgRi/xREJdQmF0I3Dkh2t2jjDG03Ufkts=
X-Received: by 10.28.67.68 with SMTP id q65mr5258105wma.142.1493201869405;
 Wed, 26 Apr 2017 03:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Wed, 26 Apr 2017 03:17:28 -0700 (PDT)
In-Reply-To: <b196d1fa-3db5-6d9b-8eff-dda153f23a01@twiddle.net>
References: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org> <b196d1fa-3db5-6d9b-8eff-dda153f23a01@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Apr 2017 11:17:28 +0100
Message-ID: <CAFEAcA_fD-MZR2RP4yXmskhqe9VJVKvwXPOzeU-T1+TboyzE1A@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC 0/3] split core mmu_idx from ARMMMUIdx values
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: F3RakskyIHIw

On 26 April 2017 at 11:07, Richard Henderson <rth@twiddle.net> wrote:
> On 04/24/2017 06:33 PM, Peter Maydell wrote:
>>
>> Overall questions:
>>   * does this look like it's workable enough to justify taking
>>     it rather than the simple-but-worse-perf-on-some-archs
>>     option 1 ?
>
>
> I think it's workable.

Yes, I think I agree overall.

>>   * this does risk breaking A profile in corner cases, because
>>     C unfortunately doesn't typecheck int vs enum so if I forgot
>>     a call to an index conversion function somewhere things will
>>     break. are we happy the risk isn't too huge?
>
>
> If you like, we could add a tcg_debug assert somewhere that verifies that
> the given index is < NB_MMU_MODES...

There is one already, because in my testing I ran into it.
The problem is that since it's a runtime assert, it's not
certain that I caught everything.

thanks
-- PMM
