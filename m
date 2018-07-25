Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp482453wru;
        Wed, 25 Jul 2018 02:22:11 -0700 (PDT)
X-Received: by 2002:a02:3344:: with SMTP id k4-v6mr19264309jak.45.1532510531455;
        Wed, 25 Jul 2018 02:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532510531; cv=none;
        d=google.com; s=arc-20160816;
        b=AZZfOW7FFPQG0MjX8QNUfTlUxk6IJgG5yxJnpVrd23wSFRAjCbJ63lKqIVl6SoME85
         gpXlOLRTiS4XGOhPwzWAGBowTtTbpSYauoXz6XKl4RXR//CyVK6GIV4mcG+ipnwj8vd9
         b3ZMwWjbMhlo94Or6YZUTOPGZS9k8qDfkd6tQnLU+QyTDsjux0IabtUv0tKoqpX/JB6Z
         JyVkeQwmyjR8xBqNvuiVDdvsGeKV2QmORxASv3J4zS0E9fhQcvqMN0Do4zTXaaKkpcwy
         1+yy8Chnq+YTeZfD6qQtnOnYas4oUIvKa1zdAbCXPuReEnSgbijEhaGIpT+AnozV7GzA
         j0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=brw4o0D/M5KWZyDjm5P5XVRgMdrojYqc/X0WxwRvW54=;
        b=DfLvi4GBX42YnZy7CXcmCyirdxGaN08fvmH4kwwRbu76q4qDn0ja/rszWNVZWc96D4
         XWdYAXGA+0ndo9lHB9+21M9urHTpWzCeivnyfJSSuo1rLv8PZ2jkQc4f/7+hFmLJCfgy
         /ADdmOiSPRPpOYK0szPeTPyF7eauYpcnSqWOOuu4AeOaxoPXHOjEuHS5MklqLUHaVWnv
         U/1Z4yVnFzTzlqCivEAFs6cAbEVxojLXGK9CVGy9EUYSEGq8k8N/P0yRcG396wkoe7NY
         W3Dft8zge17EvBFxQcKlb0255OaS+GLNLlq7LCTP4WQgAOMBOpY8TXuSUJYodiFfDFVE
         sbKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDy9R0zG;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g188-v6sor5668942jag.79.2018.07.25.02.22.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bDy9R0zG;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=brw4o0D/M5KWZyDjm5P5XVRgMdrojYqc/X0WxwRvW54=;
        b=bDy9R0zGeO03pV8JzZpPvrDknu30KhnHIP1PhEcgUi2i9XIzniB5yJoLw2e2HvODJk
         S3AWdXmdC9Q6F+ez215Qd3E7LrVwvEyVjZiYpkYATo1QpgEW8lzQdoIpgL6CmisLo8FZ
         +0Shq4FPn7WRMvoV8lZnHMY344OsCD/BtSVJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=brw4o0D/M5KWZyDjm5P5XVRgMdrojYqc/X0WxwRvW54=;
        b=bwDtXz2JSmxSQmlAlCJXce3t6uXOgYbo6tMi0zMkwaCNIqFgEqaS0H/e5mo9NszPb8
         m+2kUY/I6vW1it1VNrpOgwVzI6Q2gQu1NzAkfLcnq7Bh/1ii8DjZjbmr0ieorTzAL7pe
         EI4CucknKnRTiUp5D/2p7kxGTlOWIU6mCGIHZsa93ktrQ+/PH8YIPuXqxaQTEHvbNbQC
         OlvD1cL3Nhe1k+LmeJpgUt/04YzlhbxduW1eskxcNgyPFNgmMjPdkLr5fCimk7zCaPb7
         vVuygEMBd+uamn5n1wO+Y1rZOfcB/e/gTa/EM+OLyrN9II4WfHrCt9Eei0o+d00fXvbI
         jEVA==
X-Gm-Message-State: AOUpUlFX7hWZDc9nPOY2Ia4kq4kabGSdnuG7g7wchyS7JpngaXE+HgLx
	dP2wp2aNgShJUqM62nedxnXOaCGWBu0As2NWpPgjSEJ51l0=
X-Google-Smtp-Source: AAOMgpdJaFvurg4obXWzbZWM+8nOA+gbUmS//PyL4SLxkUgdjafNvCklZ3Ke0kCZsc+biaX5qQ+n12j8W7uYrOerWJw=
X-Received: by 2002:a02:687:: with SMTP id 129-v6mr18231601jav.59.1532510531153;
 Wed, 25 Jul 2018 02:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:22:10
 -0700 (PDT)
In-Reply-To: <CAFEAcA-WVfswDpDGoDCTqv-ZRege8kJ5hPjcy43DkODRKZfGZg@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-WVfswDpDGoDCTqv-ZRege8kJ5hPjcy43DkODRKZfGZg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 17:22:10 +0800
Message-ID: <CAHmQWvBG6QA9pn6cTUb2o5GzCbq2Xwt2WuKNZ_yZ7kH-uFMCOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm: check fw_cfg return value before using it
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: x23rk7GijlDq

On 25 July 2018 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> The fw_cfg value returned from fw_cfg_find() may be NULL, so check it
>> before using.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>
> Hi -- this patch series seems to be missing its cover letter.
> Please could you include a cover letter for any patchset
> with more than one patch -- some of our automated patch
> email handling tools rely on it.
>
Get it.
2/2 needs a v3 at least, so will remember to include the cover letter
in v3 then.

Thanks.

> thanks
> -- PMM
