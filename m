Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5935687wre;
        Thu, 31 May 2018 06:37:29 -0700 (PDT)
X-Received: by 2002:aca:6a53:: with SMTP id f80-v6mr3702983oic.357.1527773849347;
        Thu, 31 May 2018 06:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527773849; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw9Phdz1NAg6G8/auhipNB0AZnPyisUDogywjvuNNJj1xMJpKzk7ZVjX6eWaxSnMq8
         V8zmKoRRVCy4tvlH5tdxKoitpL2WhBE6YTdm+w2aU+x4sCZgg7wZNwZ8vMzuDyStVbCJ
         WH5pLzNgJIXNr9RxbuAgMzil258hBq/Zl5elO9samvRvSQ79OwhpEEkoVVCszPZnlfar
         jmM5mfuY4D1dyNz6oBr2CKmFpG3MqHRPAsLPQu0p/FzQRIv/eeezVtoUnkhB0Y/brKLw
         wgbzz0Yqi8UGc3RE/zPwpx/0BUdAhm65Sdi9M+j4DljGiLRiw6I5IVirvva/MCSpRLrf
         4hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=U++CQAKkSYYlLomyFnXLcOxDLZcUnBzP11NYHHl3q/M=;
        b=N0ngS/18eymBG95IJYyI5/fUMmkkGL74IY3ziWvNNcGap8aS5tCGN8UVuDxOyugTEX
         X1rlhjcZkmjzsnEVyqPdiVoyk/NT6ASK6VVn25UwJlMDVqk5aRZaZGYPiwphS6BbWJ6H
         tZ/7AfYyl5p2Y6ip9SQtGrw7xm1o7Sn5E1d2UYdhjLCcHv8I+hVKjRmTZGtuIQIsPaht
         HI1Dpvvv912VTpLIlfU4FbCEszPE6B2yhxGSGNcjYG0pbUgf7XhHgwv07vAodSdzTNur
         d47X0Qogf7v4ds0GpbPlD3fDMF91TPEJQL1WKUBXnXl8xeMFP9RakSRsslXj43CI4vIP
         X2iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPt3bogB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d40-v6sor387158otf.60.2018.05.31.06.37.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 May 2018 06:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPt3bogB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=U++CQAKkSYYlLomyFnXLcOxDLZcUnBzP11NYHHl3q/M=;
        b=NPt3bogBr14jQKu6nWQmGA1xPNEnRq57A2f0gHX2MefeRFFo3qsIW/u4MSaS5Cy2v5
         VzwvpTgNIJe/JO9ibwit7+IKbb/1n1VBghbwqdftB4xy2pnol3F77K0b1uYzQnc8AXbb
         kZZIO1ONes2Vq0ILq1euF4i2jox+f4hMsHAHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=U++CQAKkSYYlLomyFnXLcOxDLZcUnBzP11NYHHl3q/M=;
        b=VOQ/Koj/ht49xTwsLnu2DHw1ZuSt6KBV6yPvwOES+r8DOlbsU+xXy7MpCKk9l9Uh7K
         7uyTXjtuQzJ9IsiOjY1YfYHaPNYDZa0Mo2jxc7oIKVJ1dpMBMH5tYDPi0DeYJr5qUtJW
         /cgurZtJFHUmX/a8hgInhMTUWA06pmMw82ZCS7bHJ5gyGHm/RAbL66WUuZn4+KqCSwm2
         kDPVX+pOJ7NiPXFzBTojXz/n4DabEZ6D9QNwpqR1FCl6minLxZJpPnEkYpC5ougrWrdx
         JC8jMolZs1FwfDxBrC2jKmB+Z58KW9e/giohBsyLeSyaBoMFIgp5LpKN+2Azad7F+j3P
         w2aQ==
X-Gm-Message-State: APt69E116LNh6qO3ARCCU4N5xDRb87s4zFWGjjUgNUfCnrsNcJJRYt81
	wpxSrVc1QjKHUKDOmvxw1llVY0zpvXF8KooLcUsec2wR
X-Google-Smtp-Source: ADUXVKIrnqvhBgiCeMqp4d32LniByhUzidvmGyk30PUC7Dr7DmRZq6gJ0tmHqyz957tnhATypBeR8mLYFAh11yvSUMs=
X-Received: by 2002:a9d:34db:: with SMTP id t27-v6mr1313192otd.316.1527773849017;
 Thu, 31 May 2018 06:37:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 06:37:08
 -0700 (PDT)
In-Reply-To: <CAFEAcA8XkCAK1GKHXKEBgxrVW75E9i3cDFw0iF68V7y7x8h-0A@mail.gmail.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <87a9fff7-0a53-6b52-eb2c-e721556cf87b@redhat.com> <CAFEAcA8XkCAK1GKHXKEBgxrVW75E9i3cDFw0iF68V7y7x8h-0A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 14:37:08 +0100
Message-ID: <CAFEAcA8vFEX0oMJcU112MMGyMue6k7BCmBD-L30b920RXqnLHA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 00/27] iommu: support txattrs, support TCG
 execution, implement TZ MPC
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5VVx0FBeTIrd

On 31 May 2018 at 10:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 May 2018 at 17:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> Go ahead and apply it through the ARM tree.  Thanks!
>
> It needs a v2 (there are some patches that need fixing),
> and some of the tail end of the patchset hasn't been reviewed,
> and I'm not sure if we have consensus on the IOMMU API changes
> completely yet. But if you're happy we're going in the right
> direction I can apply 1-13 via target-arm.next (that's the
> "plumb TxAttrs through various functions" patches). That will
> reduce the size of the patchset and make conflicts less likely.

I'm putting patches 1-13 (initial plumbing) and 22 (adding
VMSTATE_BOOL_SUB_ARRAY) into target-arm.next.

The rest will need a respin to fix minor nits and some
conflicts with things that are now in master.

thanks
-- PMM
