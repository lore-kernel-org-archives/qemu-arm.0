Received: by 10.25.77.4 with SMTP id a4csp1585547lfb;
        Tue, 14 Mar 2017 04:53:11 -0700 (PDT)
X-Received: by 10.28.217.83 with SMTP id q80mr14258323wmg.58.1489492391610;
        Tue, 14 Mar 2017 04:53:11 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id 48si4817331wry.53.2017.03.14.04.53.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 04:53:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x235.google.com with SMTP id n11so61757291wma.0
        for <alex.bennee@linaro.org>; Tue, 14 Mar 2017 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8nyfODCTh86WjOq0yvS8KppVosu+CJL9Kq42SYk/RyM=;
        b=Ew2OA3TbPi4CtWe3s8lQZeo25Xf5H5eA9TBEIxnmE9v1RnaUY6Ii8bzPcBg24e4p28
         aqXkaZSz78Tm40MpIYHo+PtzgVV9E17OI4wlabfzKZrX7voPEKPu83/ICR+LqcMRfS/3
         URBO1Rpnc9VlHxMp/lge1rkdQqk0S1+9MwVxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=8nyfODCTh86WjOq0yvS8KppVosu+CJL9Kq42SYk/RyM=;
        b=Ig+3xaoy/+fEl5Kd+c6Luo+q1JfBEWvM8pOf0uaF6XSQ1//kFU8yLgaqA4fccspQgK
         wls0gde3yhIfTpPusDFoTEx+hq1QXxo8PsvfZQPyir32bjgw4QHhkfBox7R7A4yTOS48
         NWaPWC0MmFWbjG2UjuEOyo1BWOSSoC9hAHIE4rMI0016ROvO+gThkLBL2maW3U1LhWl1
         epjAT4ntghE8GUpNUBueLdN3D5uq844/ShKveDTAeGJDQN6pIA2zqJqAJbTwlRIo5g4N
         UAapsFH86cRaiHJDkWs+mM/mi1skM9NAk9pcTrHL30u70OuNkpJI27/4Dz8fTnuIQlv+
         GUkA==
X-Gm-Message-State: AFeK/H3v3e7+PqF1FVDVw51tHL9wLUxTBcn8DYwKq3eqGJMK7kAiSOS8JDDREAriG7hE62bCxC+uKFl+pzaKPyV99LE=
X-Received: by 10.28.226.215 with SMTP id z206mr13576946wmg.92.1489492391257;
 Tue, 14 Mar 2017 04:53:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 14 Mar 2017 04:52:50 -0700 (PDT)
In-Reply-To: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2017 12:52:50 +0100
Message-ID: <CAFEAcA-j1NSm=_H=V5xJNx=Hv3_P7M+UdVB6gMpL-dS+5NXL1Q@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] arm: Fix M profile MSR/MRS
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Michael Davidsaver <mdavidsaver@gmail.com>, "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: TKOjPzeXxTp8

Ping for review -- since this is a bugfix it should go
into 2.9.

thanks
-- PMM

On 20 February 2017 at 19:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchseries fixes up some deficiencies and one nasty
> bug in the M profile MSR/MRS handling.
>
> The first three patches are just cleaning up the decode
> so that we UNDEF where we should in the MRS/MSR space
> for M profile -- this won't have caused any problems in
> practice since real world code doesn't generally execute
> UNDEFfing instructions on purpose.
>
> The fourth patch fixes a nasty bug that I introduced in
> commit 58117c9bb429cd which broke APSR writes via MSR,
> and brings them into line with the pseudocode by allowing
> writes to the APSR GE[3:0] bits when the CPU implements
> the DSP extensions.
>
> Alex -- I should have paid closer attention to your review
> comments on the patch that became commit 58117c9bb429cd;
> sorry about that. I knew we didn't get the GE[3:0] stuff
> right yet but I didn't spot that we'd managed to invert
> the sense of the SYSm bit 2 test in that patch :-(
>
> thanks
> -- PMM
>
> Peter Maydell (4):
>   arm: HVC and SMC encodings don't exist for M profile
>   arm: Don't decode MRS(banked) or MSR(banked) for M profile
>   arm: Enforce should-be-1 bits in MRS decoding
>   arm: Fix APSR writes via M profile MSR
>
>  target/arm/helper.c    | 26 ++++++++++++++++++++++----
>  target/arm/translate.c | 26 +++++++++++++++++++++++---
>  2 files changed, 45 insertions(+), 7 deletions(-)
