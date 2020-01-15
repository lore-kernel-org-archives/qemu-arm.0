Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6278666lff;
        Tue, 14 Jan 2020 17:15:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpi1rIL50vbDPWojatngeqj0Utgu5C42tkPFE36OeHrdmmOG43OLr2fSosaEj4x1ZHujGM
X-Received: by 2002:a0d:d48b:: with SMTP id w133mr20581417ywd.61.1579050919306;
        Tue, 14 Jan 2020 17:15:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579050919; cv=none;
        d=google.com; s=arc-20160816;
        b=tYsVJP8tDZ+Z0GO5HY2qJa44794JsQGMo+yOIuJpX/HRFN16OhTz+LGLP74/vQ3XyJ
         xO/oMgzaBlTbK4D2y4DOxep+quHV5P2lIHewISy8Px2HCjM9OvIXY+pHAS3M4+1M+wVj
         yllb9eqJn8gTGzqm3Lac2awFmka/7rxsx2Qrz+8nHo9ZpGO3NW8ASc3XEXegb911T6o6
         8vjOzsbRdrGGiRcvIAF7GZtqzjHS78iNFdbTQPPE9jkIwCNZElbYPR0k9+gp8txyO0ki
         yjybO8IpnHbgkpBriIdXG+cZTDKo71/zRGdyO7Ywa9CV2Lsss/+mRNkxfWwGPmDWrs3C
         P37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=CKZmMHMeukb81O4pvo2KvokLrxDXWUWPoq2uyoZe7rI=;
        b=ggKncAZvxYKt/yyN3muLI+993sK+ONn6GbWxFuUEfUiWg6LL0TakoGNZtn/vXHfQ1p
         4QYMMC5zHv4EPd3o8EfxPYehe7M7NJsX9V2aJYmcZ9VYrELD5lZL0l6rA8qWwwmW6kEX
         HUe0+8ykbtmNYxj0m1VMYZ9xUPQyqQYob+FaYSOZ8UFQ22tTurJoKGxEObr6307G6mbx
         F/F/lWna1wHNdhxWPIhSsiBBeiA65/IIR2p2FUqJwss0uKxABKJjheTYZ3gZ6adQQrjJ
         2ijbC/ZoiFQrujQkyzkgzZZP+F2WUni0ibm7g9AWdDYUCiOK/4V7X+JRPuTwAcE3koeU
         z8Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id z133si10163428ywb.394.2020.01.14.17.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 17:15:19 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00F1F0ku009176
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jan 2020 19:15:09 -0600
Message-ID: <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, qemu-devel@nongnu.org,
        Paolo Bonzini
	 <pbonzini@redhat.com>, keithp@keithp.com,
        qemu-arm@nongnu.org
Date: Wed, 15 Jan 2020 12:14:59 +1100
In-Reply-To: <87sgkimkma.fsf@linaro.org>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
	 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
	 <87sgkimkma.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NbRN9QFP9m7T

On Tue, 2020-01-14 at 09:51 +0000, Alex Bennée wrote:
> > Well, one of the LCA talks wasn't that interesting so I started
> > doing
> > it and am almost done :-)
> > 
> > I'll look at doing something for arm, riscv and ppc and send
> > patches
> > once I get it working.
> 
> Cool. Are you considering linux-user as well or are these only things
> that make sense for system emulation?

There seem to be some linux-user stuff in there, I'm mostly considering
whatever ARM does today but we can certainly extend later.

The idea is to make sure ARM, RiscV and POWER use the same protocol and
code base to make picolibc (and others) life easier. Bug compatible :-)

Cheers,
Ben.

