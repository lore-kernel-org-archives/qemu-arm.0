Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3883453wrb;
        Tue, 9 Jul 2019 09:34:41 -0700 (PDT)
X-Received: by 2002:a9d:588a:: with SMTP id x10mr6430793otg.144.1562690081143;
        Tue, 09 Jul 2019 09:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562690081; cv=none;
        d=google.com; s=arc-20160816;
        b=Vv0+5FJHLp71iQQ/X4R92Gkroysn5EgEqz5cF/i3Q/WK9LjU/kljypsBVasoFKN5c+
         A1RDpY12eR7YIDrLV7ZUqKkFT805+BrKEJykbiKbEuypYcROtwv1vLf327XFUtqAFW/k
         VmVsBXYHf6Rj5x7hKl9enEMPEGB7+viEqssCNssmTzqnBnQBYoEVa4C2tzQ1yEeOUvsA
         GPb4vO8ZzOx3G1vChP3Awjpkfo6LgxLZaSWFxj/SuS/6G8qeTKfVB+KVNE3Ld4U9jaAP
         v07vAQUL5timu8mFCNnwj9Uqtb5mGyWFS9oq/rmm2hnlhU9gDMuqhYKy6zi6LDurY26v
         TWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=62P4WDMRlN9BwwlaipqzXSSIKDC0cyC9/+gfZGB4ssY=;
        b=VXl84A3goNPByRQNDMH7OcfFwktY3iWjn9vThhdd9QM3cI0jMDKjZmCk23uKDyVs0M
         Esl9lgtzjUjwgPteKNPHEz8pTS9sluL8jcsHgJGHm7HWp2GWYwVleTWXPPaNkafBPdYd
         Sf4oAEoEuC06i34ZS1b4Y1eTI4Z3d+EXqpBJs8qmD4/9M9gmY5HZ12EwJnqXlYou1cEd
         i+DEXeejfOX/Kphm8vaMUtVRL6t/785jXHhUgwKBc/6h6S6VzyledyJ4NmwNiUFkEnm4
         XtONpr+V1pVkH9DQBcvOTfAG81NHtL/1J8H944kjygC76vZF01mKc1snIrrZHhiTAh0q
         Uteg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLemL9Lp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z9sor11062428otb.0.2019.07.09.09.34.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2019 09:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLemL9Lp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=62P4WDMRlN9BwwlaipqzXSSIKDC0cyC9/+gfZGB4ssY=;
        b=DLemL9LprlotgdOaiQmpoGx5KhZ3X9E4RHJLaRhXv2d+u62MhZOmvaMpAS34fmwktK
         F/F/gWjOWgrk4r+CwvUFNYYynkwgDJSNL5GJS8WGZgRoX/NoLEcvwvzIXjgD/HGZGo+A
         OXzCYBDGxPd9whNBwAD7CBtCd7beSxTwz4UMp1/x5CgnslUrrjqADlrlTVIIHROniZRH
         TqLbV8QcHBgswhnzzWN6vGKzOdrE5l91NmFP2PLyzEb60Zu+pqX2bEo3jyaM+RtmRCcg
         urfipjuuviMC2i0VaVWVRhy4TTed+eoRNKydwpjmyMIUkwwYuhcfuPceeMySSzaatGNT
         40Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=62P4WDMRlN9BwwlaipqzXSSIKDC0cyC9/+gfZGB4ssY=;
        b=iw8REZm1EDrv+cbCIq5VnxnTrnq/jJQYThlODE6ryobZT6LVVQ9AHsyTegWwfX8COI
         MAP1En40DNMVf0xH1fAFfibFYMwZ0ntgpAhqsIjBdz0xSpewM6Tc3FR/Hzi00BEBI6cz
         q3AlN3MuzfVYcpeevwGlpUk3BAbFCcTU64O+64cJ40lAhA6hIRjweB4NmbUKsJ2KsKaX
         FfbRzGwyfGQIBPjAu6QI9E9ggXVzoVYpDi3T9KJ3MZEWSY/h6H6hnmN0iLmZfdKvZjJ7
         BsKLYCXfBH3yMHwVefeL0Ijj4I+f5l6QYlkwT1YZJUJzrPbyrGJvnNvIyD3tuXI9eSRC
         g6Sg==
X-Gm-Message-State: APjAAAXz64hmQ5ng3wGf8MeAHs9LqHR3ktnFkMRSQeuVmZQZpl3tF8ZD
	bsfPQ7l5Neskg+LH2a8DC7oAU79PuemR9nBn0RzwDRFHGmMnWg==
X-Google-Smtp-Source: APXvYqxv16bmdiL0vR9cElTEVoI4jiNl8gIgOqH0jzzYCn8njQMwNk5ZQMk2EiqZ0hLet1Ubf1VQeMlBAw0Z7nc/L/c=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr18930291otk.232.1562690080504;
 Tue, 09 Jul 2019 09:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190703102208.10086-1-alex.bennee@linaro.org> <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2019 17:34:29 +0100
Message-ID: <CAFEAcA-6Jw6g55AvpHpi3=k+jZ5aMrwdjXz5rE5exsn7eetsvw@mail.gmail.com>
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: poITdV9sZz7B

On Fri, 5 Jul 2019 at 16:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> I know this is just copied from the baremetal.lds, but we
> really should have a license statement in every source file
> (and I should fix the ones which don't have a license at the moment).

I just pushed a new revision to the semihosting-tests repo which
adds the missing copyright/license comments to the current
set of files.

thanks
-- PMM
