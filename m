Received: by 10.25.208.211 with SMTP id h202csp3405828lfg;
        Fri, 26 Feb 2016 07:08:26 -0800 (PST)
X-Received: by 10.31.180.213 with SMTP id d204mr1322571vkf.80.1456499306563;
        Fri, 26 Feb 2016 07:08:26 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com. [2607:f8b0:400c:c05::22c])
        by mx.google.com with ESMTPS id 14si8800817vkj.201.2016.02.26.07.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 07:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22c as permitted sender) client-ip=2607:f8b0:400c:c05::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22c.google.com with SMTP id e6so79489521vkh.2
        for <alex.bennee@linaro.org>; Fri, 26 Feb 2016 07:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IehBv+VIXnorsvyfTIzAxbflyggsOJuurzpSTnVDquA=;
        b=NBVVryjCd9Sif9LGeJkdPjlBNndEtnBsqoqRbnJEntT4AyvC4JH+tqwxX9l5EteNba
         x+vEVg+NtwpA63B9FWzhPVPnErEG7QzYFCgzi+BUbiTlNPuOaDd7r+30ZyhOWq6gQfmA
         sIsd1+h8+8nSh0MEGeP87VIhlSSzu7rRltsTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IehBv+VIXnorsvyfTIzAxbflyggsOJuurzpSTnVDquA=;
        b=aCmoojZrG4xADLAqIcvcCa6pzrU/getzAsUVOA3vvNAOdYlHZpg0MXWwV46ugIIlmH
         pg69ek+JpqYeT3gzyv5OYhghKb87HtdqJobyidnwmpAiJH8lZ/+xzLBGh0JQTBBla/sb
         l2jA2rEi98Fmh1BfmPkXaskPyeSoenEGBQNpXEe0scwxs/VqDQGuAz5XGE4mcMrkZa8R
         Km9QWQN7f2ohGpst7ttWBUdbVSBZt4SZ4xz3gw4Fi/COxfF4T2IdTGtBjP65udKavdNP
         04leoEG7u9PFkWpVbCtYpfyNjVOMo+DCV7Znd468XyY2d4SAk4OeSkPLHTsfnIHZOHa0
         bIhw==
X-Gm-Message-State: AD7BkJItqY58ZSDmeU4jbhqd4hqMjYPE+R32Lhq9XGKyCLbme6TKoULu77qjbdzFb3qGOjsgq9/tWwOM+1SpifQVfy0=
X-Received: by 10.31.141.2 with SMTP id p2mr1532997vkd.37.1456499306253; Fri,
 26 Feb 2016 07:08:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 26 Feb 2016 07:08:06 -0800 (PST)
In-Reply-To: <87oab37chu.fsf@linaro.org>
References: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org> <87oab37chu.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 15:08:06 +0000
Message-ID: <CAFEAcA_dHpaNUTR+cCBAEb3BvG6POPyr_Z-eD03Sx4gNwD9VZg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Make reserved ranges in ID_AA64*
 spaces RAZ, not UNDEF
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>, 
	Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zKePt6e3yf5f

On 26 February 2016 at 14:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I see ARM where sneaky getting a non-public register usage into the
> kernel patch ;-)

It's normal for new kernel and gcc support patches to appear before
the new ARM ARM version makes its way out of the door.

thanks
-- PMM
