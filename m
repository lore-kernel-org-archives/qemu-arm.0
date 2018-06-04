Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp737204wrq;
        Mon, 4 Jun 2018 08:23:52 -0700 (PDT)
X-Received: by 2002:a9d:2371:: with SMTP id k46-v6mr15989242otd.210.1528125832862;
        Mon, 04 Jun 2018 08:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528125832; cv=none;
        d=google.com; s=arc-20160816;
        b=byOB9MCCvu3M4hbwM4cNENLzKOlEq1hp9+fynVPSc9014jqyuiIHYJ/pXs2TSvro1T
         bbohKWnICyGq5J/5LTdyHeINB/C5R2X+pKkRvOs3ZKpPf2US8j7mWYrLa7OQ0rGTXfj8
         hZOY2wVL1mRhK2NRnafOWQ+KEXj4dGaDxnfRnBGZls+3r+zOJM9J7OyqY4u/LOdHx3q/
         JY8AkQ4AQC+qD0ENE5PVybql6AlXiiH+DyZfwlJyNunEdyqCRxurCoetrPrTPBVxg/pH
         ZMMUeM4Ei6liP8o0ODLBjZpTuT18IrxFn3oGQvDhGefIb8k1oCjkbYf+jAhu3PN7srEC
         XiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Za/TQp5ek7RUTdgPESbCFiaBgH0N6ep42euGU2TQVvQ=;
        b=mtusPWv7mo3QThogs8JsEZsvqfuXJ/LaY5YXGcPEP+UGaBuv/IJbaZUQRimPX+JKlN
         FO95+A5bYcZjupm+DACX1Pfk0m4TukSYrdp4wLRNNmMK6Hd5r/T4+fKsz5suJoVdZThx
         gQ88DpNSuiN5s+QriOps6qURGXYOtG6fHEwoXwd5SivtQSxO7bNSH81lnNrHvmluIHoc
         oPoF8IIpQAXOObVXD70F5QArwNYL3659Ne37divKcESl/Kev3/dslI9tt4Xkau/byQIC
         ajYAWOTa89yrU59OYQseR3fHwUG4y+yWZ+pJu9mqoIj8+8nQKXuQsAI22hckn6aef/1+
         TMXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqhBSWva;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v101-v6sor3302476ota.33.2018.06.04.08.23.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Jun 2018 08:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqhBSWva;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Za/TQp5ek7RUTdgPESbCFiaBgH0N6ep42euGU2TQVvQ=;
        b=NqhBSWvagWGM6u8ieCsZyCkWvGy0VaTVYcdS3RGshB05MSdmtbAHgxlxdX06kXCa7B
         5RnJU9aEdHY2eKMomSGfK7UFauVYs44ecbOqTRAYelGEjClmNOse/PNTxmMnSI/3Ck3t
         mTG3T+SgrBPbGa1zd/NL+2p1w+h/Xughd4rIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Za/TQp5ek7RUTdgPESbCFiaBgH0N6ep42euGU2TQVvQ=;
        b=bd/VOz6EiUhL8tqRHjnKinXKFaQPsgfC8fAE56/hrQq7alKlVIRBiXd8NWMLjPjNSL
         bC12jlZQPKOcob41CCSZa+uOsnCz0nBRZJDhs41/wjSzXrbTWzsDLDcXA83QQ//DKw5M
         cU0VB9m4B2i7wtD9I0EEOZld2ZK5+gj1YnWo+/6IWpyDF24dA4gkfyPIG+k5xXt+L1y4
         0Va1pCsAjJh1Ey8dN7wri7ikn8hLbkunlgmdJPWRsj+GEz3/jx9GYsdYsYjacnxkglFs
         M3+HWTpl4fx7P5v5jmk/3Wkjq/hyE3xVCjOGfFD11+HTrCf61+7jjsC7hTJvsD6eFXk9
         LPCw==
X-Gm-Message-State: ALKqPwdsZ0q5AmSaS/WiAIXBVKZ94yWeMcgB9T/VpO52yYRB2UsAhCOA
	JjCtOzHy4DKedYlmWLx+INnK/gxy5QQGaLqNth1+bLY/p3I=
X-Google-Smtp-Source: ADUXVKJ2GaBudUXa9DsBqjryThA7TZQXrYufoQxZV95aRtSJs3fC0r2HG3qaj2zPG1/mnECVm+8+HsIo9LNcAtdPf3U=
X-Received: by 2002:a9d:2371:: with SMTP id k46-v6mr15989004otd.210.1528125827470;
 Mon, 04 Jun 2018 08:23:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 4 Jun 2018 08:23:26 -0700 (PDT)
In-Reply-To: <87k1red1w8.fsf@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-16-peter.maydell@linaro.org> <87603evivz.fsf@linaro.org>
 <CAFEAcA8xRj5CWkAMdUVvT_cZJWSL5ysvt8qb6fbypSp5ZJF1sg@mail.gmail.com> <87k1red1w8.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 16:23:26 +0100
Message-ID: <CAFEAcA9+KRDi0PVLV-YZgYNF-Vr=Jy5AjThom_MSio1WWmHWjQ@mail.gmail.com>
Subject: Re: [PATCH 15/27] iommu: Add IOMMU index argument to notifier APIs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hjYtw711gs3L

On 4 June 2018 at 16:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 23 May 2018 at 10:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote=
:
>>> Its a minor thing but are we ever expecting iommu_idx to ever be
>>> negative?
>>
>> Coming back to this one -- no, we don't expect negative iommu_idxs.
>> But on the other hand we don't ever expect negative TCG mmu_indexes
>> either, and we use 'int' for those...
>
> That's a clean-up right there ;-)
>
> As I said it's a minor thing but I generally favour clearest type for
> the range you are going to see. That said the enum stuff on the older
> clangs did confuse me so there is that...

I prefer the "don't use unsigned unless you need the
unsigned-integer semantics" approach. (For instance most
loop indexes won't ever be negative, but "int i" is the
usual thing there.)

thanks
-- PMM
