Received: by 10.25.44.15 with SMTP id s15csp2284964lfs;
        Thu, 20 Jul 2017 08:18:08 -0700 (PDT)
X-Received: by 10.28.228.84 with SMTP id b81mr2747266wmh.133.1500563888732;
        Thu, 20 Jul 2017 08:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500563888; cv=none;
        d=google.com; s=arc-20160816;
        b=S04WIQ8L4Z1kkRI3EV2j7qVuDRUzH5r7nJRd28QzJC7Kwsp8LbeRWf4NlTHssg8eGz
         eqnw6w/sB+c1KLtI6Xm5jCL/PS7lZNlhDfE1mOUqc20/fzUrLkkOECC0tMmRy/pah0Ss
         PJVnmjYb6l2kfoa1ZbhAnA1A5aZ8d6A44x9k+1etUG8M5+dLnXgO0AZmSfTgRLC+gZ+S
         L5Ex910tFTlXXLhAOGMI/ImgN92rnDzZAKDZyZmaXbECtSGD8tvSbMexu3m5x/xMnGGu
         XNEGMli9ebnfphiTjxn8vup6XYnFScjI9eogrAetbOp81Bj/UW+lfTG66iOYxx0bkpC8
         TGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YOZiS0fT32l6cp9cPFG3duMCkjEqvoAUgPkSgVExF0s=;
        b=xuysq/COWgQHCLbe/P4O5AzgwAFqasB1bzu46wghMiBa6kUSg0H4318/aLllZsfyOr
         KxH2CU6TeNLS6JxcxaYAPJZkpfIP0WuFRsWIDikQqNlpAK39XIRTEQLkt06Vn7ycAeNr
         5TGeAIXZDd7rZ83OoaofENOnfyphaHX0YQmgaWesPiiwYPfE2OoO3NBFpWF2v7dw3CYq
         ySj2uOnUDY9FkYiDUWw2RLFp5ojd4yXQoyQX/HoJBByJZn1FLWP3T+U+ew6dLkqXeSHY
         4ISWxgRGnCSNxvPJCMpmlEs/qhiDyXHP4zadQklvJCcJd5o7Vsd5B7jNPpgoVdX0f79P
         FRUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=NJu4NXbN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id l77si525237wmi.128.2017.07.20.08.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=NJu4NXbN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id w191so30052323wmw.1
        for <alex.bennee@linaro.org>; Thu, 20 Jul 2017 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YOZiS0fT32l6cp9cPFG3duMCkjEqvoAUgPkSgVExF0s=;
        b=NJu4NXbNodjETIKXgCaY3i1X9EcNw8OD3O5ITCPBmD/vY1DxkfIcdGfeSQK2eqXubJ
         vOxxMB1NzocyzOkNfVhDMwhdA2OYthm43p1XCAaYg5Y4iqnUIDRwv+6HvnVRi+ezAaDq
         Qe9v9Du1Nl8FQNFACZ+6jAx7y2f3Crsof3UoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YOZiS0fT32l6cp9cPFG3duMCkjEqvoAUgPkSgVExF0s=;
        b=pN67/GGXKnpjGu365nPXavrLyJHjz63wgPyrL+ljAHJ0jYps/sk5HpKEUqeNU2QHLm
         Z2pWb6LzPQlUHW9NPkvE/c8QUiPqxsonjZR18NwC1TMOCYZBa7qTfiIsOO8vFfjtCof9
         67gVFSWdBBii9n3v2w5eWmHjznZ9u1VF8BbloP0vpH3+6u1R3Nw2VwLLSMc/AtbKKIyR
         aXClS/CSNlDn7Bs+nSBsxvelFgrNvX9S57q/Z00L1QxrrgsJ9V0LXCWwfwGbxu0mGPxi
         Ltof5DSi++Qrha8iNw3zmPfzvuzH5MOaHhQZu7JcEIUARZADucQB9qXhhqFRjqniZAy9
         8XeA==
X-Gm-Message-State: AIVw112qKjWY4zG2IMpiEfEuVJcFHo39ZiIBsEcoMeYGaswKdYFvijvs
	lQqLhyhYdGl5jz3hM9QLXqlR7dk7yqEkaJW9WA==
X-Received: by 10.28.40.215 with SMTP id o206mr2688860wmo.74.1500563887597;
 Thu, 20 Jul 2017 08:18:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 20 Jul 2017 08:17:46 -0700 (PDT)
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jul 2017 16:17:46 +0100
Message-ID: <CAFEAcA-EkJq0Gx98+xhvK9_ssFXhYiA80SKF8_us=Of4+OsT5g@mail.gmail.com>
Subject: Re: [RFC PATCH for 2.11 00/23] Implementing FP16 for ARMv8.2 using
 SoftFloat2a and 3c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 51w8TjGeRJ9h

On 20 July 2017 at 16:04, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> So while any review is gratefully accepted my main interest is if this
> sort of duel approach is worth it?
>
> I think the long term aim would be to move fully over to the newer
> library if we can but I appreciate a not inconsiderable amount of work
> has gone into the existing 2a code. Having said that as long as the
> testing is good we are likely to pick up bugs in both implementations.
> While its nice to have a more modern SoftFloat library it still lags
> somewhat on QEMUs general requirements claiming only direct support
> for IEEE754 1985 whereas most modern CPUs are closer to the 2008
> revision of the specification.

I'm definitely not a fan of having two different implementations
of softfloat in the codebase, except perhaps for some well defined
*short* transition period. Otherwise we'll end up carrying both
of them around forever, given our past history at success in
transitioning things to new APIs.

I don't have a strong view about whether we're better off
moving to softfloat3c and forward porting any bugfixes and
improvements, or backporting 16-bit fp code from 3c to our
current codebase.

thanks
-- PMM
