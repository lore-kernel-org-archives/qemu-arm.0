Received: by 10.25.77.65 with SMTP id a62csp1848499lfb;
        Tue, 24 Jan 2017 08:53:44 -0800 (PST)
X-Received: by 10.176.23.89 with SMTP id k25mr15485969uaf.49.1485276824769;
        Tue, 24 Jan 2017 08:53:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com. [2607:f8b0:400c:c08::22a])
        by mx.google.com with ESMTPS id l19si5367994uaa.179.2017.01.24.08.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 08:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22a as permitted sender) client-ip=2607:f8b0:400c:c08::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x22a.google.com with SMTP id i68so138195737uad.0
        for <alex.bennee@linaro.org>; Tue, 24 Jan 2017 08:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xdxA9qZGyFaQrjIRv9T/J931oVhirC1SzlZs8J0nBOE=;
        b=WVu/Jnm9JvEiYdbsxIgMGGuPFEUB6OgZWRxfa+yKgwF+UquQ4xE2X9cz6d9n9Skj5o
         kW9esHy3NaE00hR1OIuj83QNiPDKNavqcCHofVfRo2SQsdx/AOcErBPoeRK2h1r4qYDY
         1bJvhwnw5OmbeqOrl8s8rs31Hd00236quZ6no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xdxA9qZGyFaQrjIRv9T/J931oVhirC1SzlZs8J0nBOE=;
        b=omxjPPGeYp/sCY9yItAeZpiG9b4ydZSE/JrKuBtZf/PLFT4J599XN/hfVfKlzBw5gE
         6ND70iN/DZCT4hYeKcbrl8v5ijdewVvFvso2YZWUwkR3grz3s40V/jzTvvew4JggdMjU
         OaRXIEkgEOvqrUq3BNq6m77jBN/TrhJxoi/grEo+1Q2+KIVsujVJ5ZEFBftJ6MAxMaPf
         683bLY6rYquRckfyXrhQdLdQJJShJ6pwjzugaEhO3nNXVQM53iEUbheX8yiYH2SbgXTi
         fiXkHw5MYBAa6OyD/s+FUzPIFaVuWw56MagghPx7ZXatWUmxx8KsMrtAAL5h9dYPqwPT
         jrtg==
X-Gm-Message-State: AIkVDXLh7JlbbCHzRNpgYiwHR6i7cgyoAFB4EaXheCiedGd2hZzleEdBUgJM1XiBXxBoUlUT0pQS+eykYpeNpq/U35w=
X-Received: by 10.159.56.146 with SMTP id t18mr18835143uaf.137.1485276824408;
 Tue, 24 Jan 2017 08:53:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 08:53:23 -0800 (PST)
In-Reply-To: <87vat4a081.fsf@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
 <1484937883-1068-3-git-send-email-peter.maydell@linaro.org> <87vat4a081.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:53:23 +0000
Message-ID: <CAFEAcA_dtWKoNh0Ms5gsQNLmRc3Yu8pPgabWBnapOpC9Oh-+1g@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 2/6] armv7m: Replace armv7m.hack with
 unassigned_access handler
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9clFGIq7HaRJ

On 24 January 2017 at 16:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> -    /* Hack to map an additional page of ram at the top of the address
>> -       space.  This stops qemu complaining about executing code outside=
 RAM
>> -       when returning from an exception.  */
>> -    memory_region_init_ram(hack, NULL, "armv7m.hack", 0x1000, &error_fa=
tal);
>> -    vmstate_register_ram_global(hack);
>> -    memory_region_add_subregion(system_memory, 0xfffff000, hack);
>> -
>
> What stops a model inadvertently registering a block of memory on-top?
> Should we check the memory region really is unassigned?

It would just be a board code bug, and a pretty implausible one
I think (at least no less plausible than any other typoing of
a device or memory address, 99% of which are uncheckable).

thanks
-- PMM
