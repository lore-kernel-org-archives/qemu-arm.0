Received: by 10.25.159.19 with SMTP id i19csp1079693lfe;
        Fri, 5 Feb 2016 06:29:41 -0800 (PST)
X-Received: by 10.31.141.2 with SMTP id p2mr9801765vkd.37.1454682581335;
        Fri, 05 Feb 2016 06:29:41 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com. [2607:f8b0:400c:c05::231])
        by mx.google.com with ESMTPS id 69si14689279vkf.196.2016.02.05.06.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 06:29:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) client-ip=2607:f8b0:400c:c05::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x231.google.com with SMTP id e6so57223423vkh.2
        for <alex.bennee@linaro.org>; Fri, 05 Feb 2016 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=UQiDHPUDJhVwpWzH9m56xAolpjiotuTai/6WBv8oiys=;
        b=Pp4sRRff6rp1142sxt9MEOaHKl/F4MMkUjHyz7QM8oix4iEBfZUlrKf9tObN9D1MPl
         PMLb9seoNKnftvaymAB8bNoGruo2HgDGsZDPpsTEBMgFAUSEzhY2pVBFJt9kQL4gc4Ww
         hOSAZDDIRcYq5piBrIzARXygatGg2mUmKFqI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=UQiDHPUDJhVwpWzH9m56xAolpjiotuTai/6WBv8oiys=;
        b=h/mhJI+wLAd90VDqQfQBZLW8lhiJmp118KdrgHNz0PtVSEvCBF5rITfX6FqZWzFv1R
         M+cZKnaW4FzosSqyre3qQbEQV1ItUCadf0MzIUeyJb3toYXWR1u/IM4jUC1dlT+M/gTi
         AIcxsh10cTWmq1ZVM2tRN+oIz6uKIMZb7TSTWCZu4eiKO1f5bxpyccxockh3P1RLPnFc
         wfqANl7B1KPMJkHXXqQOXvbZbECBGFwndo996lkJ4gpQd100KrVIdFnZ2wGA3uwtoGwM
         QIaoCunhBHapPyafYL0L/0UjzPqmibmqPlBVwwlI2US8JRShiOlQu8FkHz8AizvnGlTV
         2zQg==
X-Gm-Message-State: AG10YORs4qWE5FP+7cm2TQfkpRgA9MKITltcMsqT2jZhe2coTOcNgtZzBnKWtf6sXG+ROH3ZbmuZ6XOf6xA4G5ak1bo=
X-Received: by 10.31.52.147 with SMTP id b141mr9898338vka.82.1454682580976;
 Fri, 05 Feb 2016 06:29:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 06:29:21 -0800 (PST)
In-Reply-To: <87io23nsqe.fsf@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
 <1454506721-11843-6-git-send-email-peter.maydell@linaro.org> <87io23nsqe.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 14:29:21 +0000
Message-ID: <CAFEAcA_RJs_DaBa2YqP3z+-ykMntPULEWAYO8LnQz8Qzs+dyXA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/7] target-arm: Add isread parameter to CPAccessFns
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gsZhiSW5h+hs

On 5 February 2016 at 14:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> -typedef CPAccessResult CPAccessFn(CPUARMState *env, const ARMCPRegInfo =
*opaque);
>> +typedef CPAccessResult CPAccessFn(CPUARMState *env,
>> +                                  const ARMCPRegInfo *opaque,
>> +                                  bool isread);
>
> I guess my only comment here is we've extended the call for every access
> check with another parameter (and associated TCG activity) for something
> only one handler currently cares about.
>
> Is there an argument for an rwaccessfn() that we use for just those
> registers that care about the detail? I know system registers are hardly
> a fast path priority but I'm concerned about knock on effects on
> performance. Have you done any measurements?

I haven't measured, no, but since there are only 3 arguments the
third argument is going to be in a register on any host architecture
we care about, which means the overhead is just going to be a single
"load constant 0 or 1 into register before the call". I think that's
going to be lost in the noise compared to actually having to make
the function call at all, the work the function call does, and then
the second function call later to do the read or write.

thanks
-- PMM
