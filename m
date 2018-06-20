Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp913116wrq;
        Wed, 20 Jun 2018 08:41:53 -0700 (PDT)
X-Received: by 2002:a9d:577d:: with SMTP id x58-v6mr14246483oti.196.1529509313799;
        Wed, 20 Jun 2018 08:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529509313; cv=none;
        d=google.com; s=arc-20160816;
        b=utV3Bl1kdu4y/aOr4X6tPFYEPp9ca+hmRHPUCyRbrpVd+dcK4OeHczovoA5jYIMzPA
         HWrygA3+b9CMMKkXJUm72DRI31HwKQNETiQDg7BpD2PRgiQ9EyxxwE1wwZ4LToeZbTJb
         0YRXfYBV9KJ56xLQ5yVB8szHB2i0I7YnogbG1CDDl4x5qlfGbRH1GoKFVY02YLx0eRio
         Z7qMQHtbp/6KKxq/5ReOkkq9RspA6YsZWQeqZMALmdqG7f9KmVgPjRK/y6hFdq/lgsjF
         oy9/yhDHa0ylUpwLKvgG3VsPu7mdS02gFc6uMIvlinhYqx2BZf3KIpU+Z7j9jUyjK4qT
         xXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=iTxIst6HifHtGWVTKLjnF78MbaQJ4mPhS2teeIDpHyQ=;
        b=YSPcGEfilMhQmqaE7bkkDr4d5LkjkObTR46sxjl5NKtQMusTePviHhMJTfzz4DONZi
         XSKRGJyp1hwwpgpaXpkNoRqBEyeMPOQvMCAqzpSgsJm7q80Ucyssy/zZ3P9qrG7n7YmZ
         KRAInxmGjtMbqr2NJ12NCMphEOZDjf7WuyqkTuefhIbuncKH4d7BeGxu1GeWPX+t+2Mq
         ZK+gcxmvH7OmzMHq7W7LgMOkHYcBvl20/MI1/orkY/yzZgdqoQTKWJGkk8EweODCmIIV
         SGaoSYMzbJ4Uib85lmJjzt1tzEOpN1olPbjcdtBKOVXdIUnEGnZl7Wa39xmMC1OYUzQz
         CnJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/hbQJdh";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v197-v6sor1058761oie.61.2018.06.20.08.41.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Jun 2018 08:41:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/hbQJdh";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=iTxIst6HifHtGWVTKLjnF78MbaQJ4mPhS2teeIDpHyQ=;
        b=J/hbQJdhxW12FZZF9sS9QckoK7aBmfIGQqgipdSYAIpFDMs+SiNaXJKXpTzZuONDK1
         4/P0gCutTU3hb5/WEZRKTxQliG54fKToU9bCVfW7r6Anf4GeDNuOBoMXqHGoTs8+eZRo
         H5qtTuA6FRaO5gvQXV7+3k/r6qe+cblEJKqA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=iTxIst6HifHtGWVTKLjnF78MbaQJ4mPhS2teeIDpHyQ=;
        b=frDrRrEnmCx0soNhlFtE5stctz3m8yVLtTm7HPBP4pPUKUqCOkDf2oT9RBFPTOef4V
         yA2RPFms6B+FFaqU/mHIdn5ftfJXbHxa64AEtYb7Zx5keRhciGJvpRM/hVWnNjDWNGyV
         HKeU51m/NcKnglYXCZptaIcNqdamQD7IM7aH8dEEhzA5dFwnqIf6IkT5gqnfxPVOs8C/
         zUY0N0O1ff+cXlMMAsFo+LGumlcNcAYi7TjJGhl/C+myxlDk774QzQ+rjN9SJVkM2OO3
         vpfBztOc587JOpufI58p3QRbVqdx0JP0SLIvfjNtd3tMHzBCrJqgNkW3fcFhygGWMhmv
         Tl3g==
X-Gm-Message-State: APt69E3E4j8mIUn6XuKVSvAdlcqZPztt9fj0xw8clBVJOs15pHe6qiek
	VL3flbKkgw0HP8v/g0+4iED5jEvJKO/zWFmFiKj5O82A
X-Google-Smtp-Source: ADUXVKKfpCWQbl3YT2ZdiTHLJvFwTjUa2c6sOICxFA0luFKV2Ib1sDRKvOMiOBPQ0sWIAeTrXu17a4IxyGd8rUgNyGE=
X-Received: by 2002:aca:f10b:: with SMTP id p11-v6mr12686911oih.80.1529509313471;
 Wed, 20 Jun 2018 08:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 08:41:33
 -0700 (PDT)
In-Reply-To: <8ba4603d-8b79-ccef-907b-98254ccd7e71@redhat.com>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
 <20180620132032.28865-3-peter.maydell@linaro.org> <8ba4603d-8b79-ccef-907b-98254ccd7e71@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 16:41:33 +0100
Message-ID: <CAFEAcA-Lx0-MQYAQJ53fTP90LC1uzdnsMC1eO2VMR_2B3mUZJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] hw/misc/tz-mpc.c: Implement registers
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gQhIq6JElLYJ

On 20 June 2018 at 16:26, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/20/2018 03:20 PM, Peter Maydell wrote:
>> Implement the missing registers for the TZ MPC.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>> @@ -127,7 +182,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>>      if (!attrs.secure && offset < A_PIDR4) {
>>          /* NS accesses can only see the ID registers */
> When reading
> "Identification registers can be read by any type of access." I
> understand all others can only be read by secure accesses. So I would
> have expected the same check on read side.

The check is there for reads too, it's in patch 1.

> Eric
>>          qemu_log_mask(LOG_GUEST_ERROR,
>> -                      "TZ MPC register read: NS access to offset 0x%x\n",
>> +                      "TZ MPC register write: NS access to offset 0x%x\n",
>>                        offset);

...this change should have been squashed into patch 2 (I cut-n-pasted
the check from the read function to the write function, forgot
to update the string, noticed that later but put the string fix into
the wrong patch).

Sorry about the confusion.

thanks
-- PMM
