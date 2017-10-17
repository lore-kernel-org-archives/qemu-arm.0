Received: by 10.223.197.9 with SMTP id q9csp4132905wrf;
        Mon, 16 Oct 2017 19:34:48 -0700 (PDT)
X-Received: by 10.159.253.65 with SMTP id b1mr10638435plx.330.1508207688761;
        Mon, 16 Oct 2017 19:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508207688; cv=none;
        d=google.com; s=arc-20160816;
        b=DKaQ8jGphNdlQFUKoSghIc04OrMpQKN2oCu8GZhxQD3dYlHcG86gwyeN414oojoZR1
         IaCpOczGBf+DDN6zo2d7IA7XrtKwqiCFImITmhE5JK76pYXtGR1FSM8tsCjfdGwZ5peJ
         q0XvjY9Lx6/1qORBBDdtpZlW4lzHRzQERp7Aswt8Olttb+MrUaujoGtehzjS1UFmfCmO
         MtPh2sMu9+wjbcf+HWUeRO8/NBvvNfEAFhRzlRRWYBqh3R9hQiVuvZw/YCl4MmX45JcF
         AkGCkyE5D5PFQ5NNaqkexlQzNgZafWf4a2V5R2JHKH37Nwseza0CQPml8tLeJxE3GWZz
         Iqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=oixr6cHnh/lzPFILFn5eoakbkxRNbteiCy8MXkiJ43I=;
        b=IUFbc2wG6c7o72I7v8p0urTGNZ49sws27ZhAeP1bMg15ZSSusdJs9HaN7wvmcxxKkL
         ENT5FRrm8gRa64cm1oqDFxnnVNkt4ttLxHlF7u7WNg8wL4cQp/DPzBX4kJN1OXTYfJPM
         Gp9DyJFC7I7go6SHiaGswY2xBDmCoCRlwAlDidxyZ2c/RAkkbodmN8YNf0WIErFbchaf
         wXSAtGQ+oMbih9lOaQPEg0KEnk7CY523HrZCnUInvUvyw4u313Wi78nq+R0pEMmjlJZ6
         1nzzHAyvPrGIt3Po5TyXhkX1YO9ox1/9GwZtGoGX08iVJ9QpQfwoQjkN/PpW5uk4fGwb
         FWJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmtCxKu/;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w66sor2207861pfj.100.2017.10.16.19.34.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Oct 2017 19:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmtCxKu/;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oixr6cHnh/lzPFILFn5eoakbkxRNbteiCy8MXkiJ43I=;
        b=PmtCxKu/AvaoFllsV9X68PpM+Jpd0LMEobXxJC92mNdmcFDJlgWey8ZsNgaMgph1J3
         49wBoklZabyOqo8Ms+9BOD6JL6Pf1RKThJeuqtiOSb9f1fyMGG4pNy2xF4tF2VSydqnq
         G4nn2mwdacU4Yl/fVwobn2npg1ZtRddYzWVYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oixr6cHnh/lzPFILFn5eoakbkxRNbteiCy8MXkiJ43I=;
        b=rpB8KiH2p8RcJ+gT3AWEq0AB1gzrWj1uLHGTHs7x8F6cqo/Pa0wjf+80w0JSBQO1Cs
         sftAHVk7AWaBzHXu0aXZmVq4L61+fFDtjw0Rac4L7rtD7vrDZJKh6cp+Yh0l9bPs5ia8
         A595Lu9Bl1Ywrk1dQiDzLu7UB2nddRZtZP3eMLi2YpeY+JIGrXv9qWIvT56bCW+hhPwj
         8p36gVK+GaPpWlll7Xqc6E3e/N/gb2yRKC/176XOCJdLRTNR39Z89Au64nsUqic8z6W/
         Fij7ras52NYTVwf9Cse0hE9ucS+kzNSAXc9LeR6AGrfN/+B0C9L4X3eKIgLjBQINaCws
         PHOA==
X-Gm-Message-State: AMCzsaUl+9aqIRXgAKixaRxNBl3vG9/PRPlxJwjkDSljAywOl6CmvvaS
	nkbCXHE641dnv94iSAs2PB4GHHYdTtX1ZA==
X-Google-Smtp-Source: AOwi7QCpEENY+mFo/SWQ/L+Ru2QVYFPe+lI1dqoBWmEUWYCCDZWuJM/1th1cg1wtZVhu8uFDSwW1Xw==
X-Received: by 10.98.7.85 with SMTP id b82mr10478083pfd.262.1508207688300;
        Mon, 16 Oct 2017 19:34:48 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-104-76.tukw.qwest.net. [97.126.104.76])
        by smtp.gmail.com with ESMTPSA id 68sm17637076pfx.105.2017.10.16.19.34.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2017 19:34:47 -0700 (PDT)
Subject: Re: [RFC PATCH 00/30] v8.2 half-precision support (work-in-progress)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171013162438.32458-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1b0c3ad-e3db-8d76-7706-0df497e13072@linaro.org>
Date: Mon, 16 Oct 2017 19:34:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /p18IWBF392x

On 10/13/2017 09:24 AM, Alex Bennée wrote:
> SoftFloat
> =========
> 
> Previously I had pondered if switching to the newer SoftFloat3 would
> be a worthwhile. While the upstream project is certainly open to
> accepting patches it would be a slow process given the changes we've
> made over the years. As a result I've decided to stick with expanding
> our current code.
> 
> Most of the helpers have been done fairly mechanically by copying the
> float32 equivalent, filing off the 32's, replacing with 16's and
> adjusting the constants appropriately (min/max exp, NaNs etc). I've
> done this in conjunction with reading the SoftFloat3 code as a sanity
> check although in places the design is a little different.

I think we need a re-think of the approach here.

For the most part, the code would be sharable *if* our internal representation
between float32 and float16 were identical.  So that all that's different are
unpacking and repacking routines at the beginning and end.

Unfortunately, the existing float32 code does lots of random unpacking in the
middle of other classification.  Fixing that would be a prerequisite.  Is it
worth upending our code base to make this happen?

Failing that, we need to stop using magic numbers, since so many of them were
wrong.  We need names for these.  We can start with float16 and then later
backport those numbers into larger formats.


r~
