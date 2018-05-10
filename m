Received: by 10.28.4.212 with SMTP id 203csp1258157wme;
        Thu, 10 May 2018 10:01:21 -0700 (PDT)
X-Received: by 2002:aca:5405:: with SMTP id i5-v6mr1313213oib.262.1525971681415;
        Thu, 10 May 2018 10:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525971681; cv=none;
        d=google.com; s=arc-20160816;
        b=cZEb5Xq4JeMeYn9YM0CXbj+KwBt/YHNR4sxnvWJ28t/RybpPMm7p1mqD5x0Gv7RWLG
         k9giLhx1DZMl+RYhkMZZleqGzEuX2/sBNXeZ00c6uuptv5dLT4Y+k6t3zPZ3djEHIhQW
         NunFnHQ++mpI3LyWwm5jwESOh1cPIj9kQVuCYUWHqi7I2YnP5geJGkYDW6N7MxkFo9Xj
         nTT17QmJTxyW+q15AuBByG3adUQn/cKX42Lw1uKu9MyP0bnBmvrKCmUZab4bo2Zp1hAj
         CI1NXn40NLvmOuQ6KtBSgzOMUU3uikugcA3qNXpuISfhWLy1MHEfixlRIdUn3g3i/4H5
         SVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=r7YnDvR03sC9bc7Sm12GtFBAT4UW36+ppPALb2O6PlA=;
        b=ZfVBY3G/yU1tOTCtvqcYTjl1xR/298anWPPE/Mmq3NaG/aOxFrhYr6kPSPNijhmvwJ
         NvZc9hrlFQuXLeK9YcEOoqnOPamZXnoSI0NkcA9fXrDkmkgqQVZOSYocDJy93IIHA/dG
         ygommeBCfij7bvW4RmPJOsZ+ibvIhYc09AGeJX37dXp92eWohqW5BylvAAxlFm2JEfMd
         7trrtNK3v0beHiHvQpcJeNM+McSE3dasl9lwc8qrKoiJlSTQz3CVEBNA0V0wZKJ0aNSk
         izMnj/TOXiHCVHqy+iHNI60RWDpxG4sa34jcCo90C8g0/ZW+6/qdpi6XQUo822HIbHEU
         L3MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDlps7T7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z12-v6sor623392oti.267.2018.05.10.10.01.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 10:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDlps7T7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r7YnDvR03sC9bc7Sm12GtFBAT4UW36+ppPALb2O6PlA=;
        b=PDlps7T7H01EMw0Ltcl271WuHg1ik6BNZYGM2tpy6YenLIoRc8N0KL6jCJk+BNlP1C
         sPlnuL0QlZeiDL5VGsaTUNcJxqHgjrvWQe2Ky/UNEe3MeOIfa20TegXtvgaBz/5o4a4R
         0+S3m9NTys9B94BBg1h38/pfmqZbkrJCuTXcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r7YnDvR03sC9bc7Sm12GtFBAT4UW36+ppPALb2O6PlA=;
        b=DIunMDZNWGMVSObpDtzwxTjroU5R+GdxtkoZ7Z0xTNF8oKCvjtMeHBSjuA1QfhWr/I
         THWLwm9c2vb8mwKkYT5JCX/XPPTpy0wvKAfQV8fGmzotkDHixPzEkwAG32bx6EAn8tYF
         2jEbSIf+oKiHNi5yC1PvouxrjJY0FW/y8QYROHdc2PoB01IFBY3x4WjVXAzO9vEOIyyY
         KIXvTsAIA/ptzMC/9f/BbShJnbGzD4t46uZwhjvP7kKdmlH3iqu5EnYNzjKkPjTq1MR9
         3VDL7u1F9xBOpb5AriEE14tUulh/PyKvRAbuZQEtrAkXJNJnMO4/513wTwhpLqk4j6XC
         S1Ew==
X-Gm-Message-State: ALKqPweNv0Prk+GvumC1ZYTvUvTMLR02YX+fq3k/3nDkuxifPqReEV9p
	94dkWTexZQ2ZJAnuMTnkT2CRHVJw3kITm/elMuhUOerJ
X-Google-Smtp-Source: AB8JxZqU7j+/as3e4GLG2J1iRgUl5EbuWD0WqoqHXK9mrbQBWXF+IvDWWCYZX2+HO7rOa37KiCFTFLPvKFQIyjlypF4=
X-Received: by 2002:a9d:5014:: with SMTP id a20-v6mr1393510oth.205.1525971680636;
 Thu, 10 May 2018 10:01:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 10:01:00
 -0700 (PDT)
In-Reply-To: <20180502221552.3873-13-richard.henderson@linaro.org>
References: <20180502221552.3873-1-richard.henderson@linaro.org> <20180502221552.3873-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 18:01:00 +0100
Message-ID: <CAFEAcA9xJMmi2NqdsmtaMu36+tvBu7Ang3jRmSJrU8Y=iQTNNw@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] target/arm: Implement FCSEL for fp16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JAHKgYaWpeUw

On 2 May 2018 at 23:15, Richard Henderson <richard.henderson@linaro.org> wr=
ote:
> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> These were missed out from the rest of the half-precision work.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> [rth: Fix erroneous check vs type]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
