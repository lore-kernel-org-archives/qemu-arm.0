Received: by 10.28.4.212 with SMTP id 203csp4201533wme;
        Tue, 8 May 2018 06:59:36 -0700 (PDT)
X-Received: by 2002:aca:e889:: with SMTP id f131-v6mr24385451oih.324.1525787976190;
        Tue, 08 May 2018 06:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525787976; cv=none;
        d=google.com; s=arc-20160816;
        b=bn7qSoFN00rJSMu6OHu3Wu/qL5ZIT/lkJZL6KC4nDCh9nerThx7RSBqm4pvp6sZUfd
         FiWeiVQKqzDeHw9fr4CuOtwYeggIRZ7h+exHBmaQZ+wRCckSYvYLEGmpvMaKRWXDxbIU
         rqra1fcWVksWMMDTFTxFG2dU7+JIKoMKg4SFjnzQ/z/mal4XEtE8cncpBS2gk7NMeOcS
         oKz8xagdfxAH4eyZMXAwS29XnX+PHsCWIyrVCpjvpYlGC7iVhgzvrcbwZDzHImBKAk6s
         6MNZkqFNSI4xQ8vjI9oYa3O8IDCDvVNPMQME775U4XY+P1H43uXuG1CYxL2l0AkwRQVg
         NeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0TXK3JnTxg+spqBichJETNsdlknWB/XZSGznBXfcImE=;
        b=iChv73kZENwC0cpjLToD0wyAoj65vkYLvshz03zyhpWBGWr1k+u+UVn1l524LXWmEv
         3naNxtPzavG6l8iFu+akdc/R6neCvGKedk5Hs9nHBt46Kv6PzJWbawbeMPiT2fa+Wvgu
         oh53qR0vMakBDgOuepiXW9gDdZUJbvty1FR8PFOxNLEc2Dum1uSkZIFDcdcSG7vIBLdk
         7ud7NFLgMGycWaHO8XRpUeiBZpNQIMXIV4NDr6SyGuU2yJR2mLk4fwPBnqOy18RYX+ov
         ntIjH6mu/g+1ecHSYK7ZypPRf1Z1/tzNfwFtooFM+qBQKEMQOoUf+rnzG6bJ1xqgG6B1
         NHJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rh8X8XgI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 66-v6sor11170979otv.180.2018.05.08.06.59.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 May 2018 06:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rh8X8XgI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0TXK3JnTxg+spqBichJETNsdlknWB/XZSGznBXfcImE=;
        b=Rh8X8XgILNDA3JM69xgPNlQED+go3w/dNg/RjbHcZ+POL2m27G1HC7puUC8xk/EnE5
         sAVFtRdPtCieQ9BRGSeXikPRTfML49U2VMzHLAxHWc3v72ih6a/1DmZRbdm+23hmo3lo
         9lLFKeQBAMbDdPrHP4Rj06ASLCYr1cmrrtxLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0TXK3JnTxg+spqBichJETNsdlknWB/XZSGznBXfcImE=;
        b=ASYmoa1U2dYbxKlmFL1spmbHDslRd6e9FnVU/7WNWa5PSuSs9AMn+njSBpDr4Ya5FW
         XjPPPENF4h2aZRkBkYJfxdUyAyiIw3I5jhqDom64bvpKp08go96B+vZouCmhXxorcODE
         5GlIb0Z8xM8EMKptPavGyBQB4EvcBDr7qAu41y209WcQNavzo67CPacg9adY0eK6hUZF
         TOg7vKWr6TPd9Ga7aFnrH7K24OBLfY2NQ0bc76ND2S4vulIsyqyKOEWSJN7NautOJe3a
         BbkhmurwBmiwWQ/Aglr0kF5xmU6B5C9q3N6dKEjtPV7zJraVfv+Brl9GKE6Pm6bCOMrF
         NM7Q==
X-Gm-Message-State: ALQs6tBgedwXnBZC1jJLRLULE6leAoiKUJcO0McfNJV3Hy0Dw/TsJ7CT
	iI7q+LnCrBWpREMOFmE4ukLHOqz7Vrqk3KVL6aRFaXwEuxg=
X-Google-Smtp-Source: AB8JxZqKyXZXA0RQA7sKMGrzf0q+X0HhApR8nMKvD9ltTABbXF+4TXmdOO/fWlWfD7s5OIq74Xkad7+OQ43MJz3RuuA=
X-Received: by 2002:a9d:16d0:: with SMTP id s16-v6mr31150608ots.294.1525787975781;
 Tue, 08 May 2018 06:59:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 8 May 2018 06:59:15 -0700 (PDT)
In-Reply-To: <87tvriv0yz.fsf@linaro.org>
References: <20180504100547.14621-1-peter.maydell@linaro.org> <87tvriv0yz.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 May 2018 14:59:15 +0100
Message-ID: <CAFEAcA99c1XNdCNs3aNwzvZJFOtmVX22kU-twDuFMLYy8an=qA@mail.gmail.com>
Subject: Re: [PATCH] softfloat: Handle default NaN mode after pickNaNMulAdd,
 not before
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ObZBmJPMXv1e

On 8 May 2018 at 12:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> It is implementation defined whether a multiply-add of
>> (0,inf,qnan) or (inf,0,qnan) raises InvalidaOperation or
>> not, so we let the target-specific pickNaNMulAdd function
>> handle this. This means that we must do the "return the
>> default NaN in default NaN mode" check after the call,
>> not before. Correct the ordering, and restore the comment
>> from the old propagateFloat64MulAddNaN() that warned about
>> this corner case.
>>
>> This fixes a regression from 2.11 for Arm guests where we would
>> incorrectly fail to set the Invalid flag for these cases.
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks; applied to target-arm.next.

-- PMM
