Received: by 10.25.77.65 with SMTP id a62csp1950183lfb;
        Wed, 15 Feb 2017 06:27:59 -0800 (PST)
X-Received: by 10.223.161.130 with SMTP id u2mr34455306wru.127.1487168879451;
        Wed, 15 Feb 2017 06:27:59 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22e.google.com (mail-wr0-x22e.google.com. [2a00:1450:400c:c0c::22e])
        by mx.google.com with ESMTPS id s42si5287293wrc.28.2017.02.15.06.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:27:59 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22e as permitted sender) client-ip=2a00:1450:400c:c0c::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22e.google.com with SMTP id i10so192315108wrb.0
        for <alex.bennee@linaro.org>; Wed, 15 Feb 2017 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Tni7Mzzi74Xv08bm3uzSDLscrXdljL9f53gOYfSQot0=;
        b=emOmkCiUZQ7JD6GNL1nRRRBEucySARsdjjBIxE2B6pu2KODIWQTHKjkWKPu3Z4D9qo
         I4AykHKjgCTZj97rWKUMXcWirqLLl68/EjW1+9a6keLN8ExgyDteM1P8tWgTH8AgS9RG
         z/yq5Z35HIGXVLPT4PCtut2OokdYA0B6Z8tp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Tni7Mzzi74Xv08bm3uzSDLscrXdljL9f53gOYfSQot0=;
        b=eqj6hTqEEYRkzW+3NDqgMZ1Ade/b8ExnXeKcr02Y8EK6W/0I4lvslQZGKDymvVrCwD
         FKrvjZnekqzcpvx9Q4IAT3PiqDfQIbNNzsksYd1R2j8nMILLxc9gBsBCMMajuYQTLp+/
         G+gg4+hBYLz69PiAEwbAyYbrEwxUMlo8mE+c7ADkDl5NLMt3gQlbiweaP9t1ANi2PF7W
         bp4zhlg7f2OrS5UcJxhPAMpNk0dsZKLF2FrJsP0G0O1lHtgtunqqjDV3bOZml19w3nVG
         SW3RfZuTwjs4I+0TgNXUZ7X9xWv/yBz/TJylgneZHCxWXKc3QCKODX3wNgs7aD4R2+eh
         WTFQ==
X-Gm-Message-State: AMke39kq7B3DBkTK3DRkARVvJp3yKH1obbBUxDQDaJau+ISLTuBZmW/qpHs/J4WSFKsPmGOSVNRGnerO1UscQIQ4OmY=
X-Received: by 10.223.152.175 with SMTP id w44mr33896733wrb.151.1487168878935;
 Wed, 15 Feb 2017 06:27:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Wed, 15 Feb 2017 06:27:38 -0800 (PST)
In-Reply-To: <87inobv8wg.fsf@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org> <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
 <87inobv8wg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Feb 2017 14:27:38 +0000
Message-ID: <CAFEAcA-6QnqGby3gOTgfo=H3SBWYYztmA7b0iEri9D-Q-LUAzQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Q+aTzyUDbkUn

On 15 February 2017 at 14:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I guess it would be easier to remove the asserts if we had run test
> cases that explicitly exercised all this code. What are you currently
> running to test this code?

The cover letter has a pointer to the tests I've been using
(plus the usual "run a random stellaris image").

I think the benefit of the asserts is in warding off future
bugs; so I think they're worth keeping where we know something
should never happen but the code is complicated enough that
perhaps a future patch might put things in a state where the
impossible does happen.

Also, number of assert()s is to some extent a coding style
issue, and in this patchset I'm really taking Michael's code
and doing a review/cleanup pass on it, so I've tried not to
do too much rework of the "well I wouldn't have put quite this
many asserts in" flavour.

thanks
-- PMM
