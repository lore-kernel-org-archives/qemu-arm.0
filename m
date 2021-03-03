Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5267105lfg;
        Wed, 3 Mar 2021 03:20:10 -0800 (PST)
X-Received: by 2002:a37:5f87:: with SMTP id t129mr24849263qkb.184.1614770410174;
        Wed, 03 Mar 2021 03:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614770410; cv=none;
        d=google.com; s=arc-20160816;
        b=yjStyWxRQKt47cKJdyMYwaew86FSG1lMgII+cFjUFnip0Up99ouDrQ7BE7PQqrWomS
         CjYKKnWLmwzVITAWH0LU4QYX0DEXXTS7TOPVkYcW0cp0sOuDzgGyPMCfyDcga9HA7nDB
         LdDl1Yx/gklvgu9vKk54GRO/gAqnGY/9tiaxHF45ugtE78WsaNHJYZg0OYAQev3zA0td
         3DLadtAoFEaYtD/bU4y8ESkkDxXf1Ctt9RZWIVETv6CoSdsPwMqCWNV7NGYLy7YUhPBW
         U6Aznl6eHzAav3vhSFIrtqRjvlZExakAPf+ePU25kmusdzQj3YD0ogVQDykcMp5oVxbu
         j8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52Rw0xqIRl5JXozH0TEb5BpWfUxdB+TCzfKwJ6p5xks=;
        b=MgBv/i83XXXkzpE2yP6Xh6L+vd9v9sXTrrVGDIq3VcYt5iXFjgn5ARyUeCc6qDbaEK
         7V/C/0TERTchFSTuplvyTdL5o+fnR8A1DcPMKSMMZbrErwH/AriZbMbJBeQq4GvDjbZG
         EwP5pJaHq6SjR0sD+ysRr4i5KuEsUWGad1Ep9ssPBYhcB3Na+AD8dvrHJF+y0hCLJiK3
         d4NyitRnNbKyczdga0lfNyjr9hcEkamuobfuvqPhmGkQjSLLC4ZiQ8/6px7iBr3xxbWJ
         wEJ2njI3Gu8uC/6a8G5/2gjGvowGMJcnwx2BRXdETJArWjSuP6sqjPRUosqCDHDntEgZ
         hQFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=j8qDjxvJ;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
Return-Path: <joel.stan@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u12sor3198988qku.47.2021.03.03.03.20.09
        (Google Transport Security);
        Wed, 03 Mar 2021 03:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=j8qDjxvJ;
       spf=pass (google.com: domain of joel.stan@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=joel.stan@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=52Rw0xqIRl5JXozH0TEb5BpWfUxdB+TCzfKwJ6p5xks=;
        b=j8qDjxvJJ9sexWg3sIDjBPbXxk1lnQaydOjEc2nMHCEr5pff2F+MdonmD+HlS4dQO4
         3Kd2tlsbbO9X1gC/GxeWSLu03VIqmNitjLOtjuxDb09uIwxEvcMFe+0rUunY9dYUJGu2
         zzElaC3yLIVYVaWVNcqxSNJIXfJIVddx0rSfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=52Rw0xqIRl5JXozH0TEb5BpWfUxdB+TCzfKwJ6p5xks=;
        b=XmO4htQVncX+hIzC8qKIYPkxT+9emTduObnME9fkCEdclWHapGOnt2pivr9UuWo/67
         CfBh5wiUg2rZF8SKbaUqJlpoQ2cqIObUow1uFTWKyeRF+zLRpRXbk04vOhDjei61pGaT
         ND5Okd1ei0dJWcoMqccENd+kT3x1q/5dI1/7Xri2xNlKGVnT9K3SUCtgvT1Q8+xhSJpU
         xxOlHsk2jU6X5cZYDasbvcksQyWcUn2lvbVjre2vBJnQYd6SJxokYNkZsxU1Hce2OvLa
         lQgJVYDhewhUrSOH10JP2wLU0ih3Sc7VB2yXldIK1XLRk9kJ+siKqHIGIWEqzRM+T0yB
         B7qg==
X-Gm-Message-State: AOAM533hAf63On/0CqqhTD8njZP89y1axVCpjp22Sf9plx9XeAecaXRY
	czZ6FSFM4mo+4rb9TMuZiSfuBh03JmMUsdrIdCZwYm0i
X-Google-Smtp-Source: ABdhPJwKxpNd9mG0iIz3ECt6CPxX/5c2gUStCj38ZymIjqs9WqWKdC3QJX5/cMJz2l6Px6puQ6E1qtf8I6Nl0x4EGnM=
X-Received: by 2002:a05:620a:c11:: with SMTP id l17mr5857212qki.487.1614770409522;
 Wed, 03 Mar 2021 03:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20210303012217.637737-1-joel@jms.id.au> <20210303012217.637737-2-joel@jms.id.au>
 <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
In-Reply-To: <5c772df2-8291-ddd3-d289-1f564ec7c744@redhat.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Mar 2021 11:19:57 +0000
Message-ID: <CACPK8XddbgGgPtkK41MM5ZYeaar27RhnD4vQwh8DcXnFpgoUoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Willian Rampazzo <wrampazz@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 9Ext6WpQ/KIx

On Wed, 3 Mar 2021 at 10:19, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 3/3/21 2:22 AM, Joel Stanley wrote:
> > Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> > from ASPEED, by booting Palmetto and Romulus BMC machines.
> >
> > The images are fetched from OpenBMC's release directory on github.
>
> You need to justify here why this is safe to run that
> on anyone workstation, or use AVOCADO_ALLOW_UNTRUSTED_CODE.

I don't completely understand. What circumstances would it be unsafe
to run a qemu guest, aside from a bug in qemu itself?

Cheers,

Joel
