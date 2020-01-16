Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7741559lff;
        Wed, 15 Jan 2020 18:04:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNadv84JD1lZqe3vUWGXbL5b8lAR55BkJlLhViNSb305pRoOP0FK5W5e2hB6W1ap68rjNL
X-Received: by 2002:a81:758a:: with SMTP id q132mr24083030ywc.162.1579140283483;
        Wed, 15 Jan 2020 18:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579140283; cv=none;
        d=google.com; s=arc-20160816;
        b=ymOBcHtQw7pJcSG/pCP+HFMUeVKVqVe+Gxp2FbRJoOdvsI3/m3gNkQT0kwbQNuDBUG
         7FpwqE84VwkbxFSONB+CTXbGg07dBfAQCIOVK94xNOAtoV9Vaek3VzRJYAE4SHv9RzZO
         x/huLRKBcBoLCqlf9R0AlzW+Y1r4vxRss++VivBmdbSQ812Yiel6qgDZP9Stxx4FPiIh
         fa6wWN/YrlrK1RKO/mYAIolT4IRQcMaI+IqO8admbyyy8az10NFs2syLahgdOEZmlDUO
         7xwGC098WPDcTLuQbPx5TApzPTNTEGOgjkM6aQyBkAksx1mZQqj0i5SQi6W+M2VbwCZH
         03mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=1U4fCEFP7p5K6h9C1DtciLw1Bria1qRqPeuoG+d2xa8=;
        b=iKQIiYSlw8jx01QhyKj1OEm2lLEqkuvw2OPu/Nu/kdyheL4btQSm8MgfmONtLjpTFY
         GLrVDfiUrgi2uxT4/jZf3s5FNWJGbbbFrXWEwVBCkY0BvvLR2M42wXUv7wtCGt9oIQYE
         nRAGNpJKo08V6yMjkGn7ubNGedXFKTt5bg7XpT514/quzI+WXPrBkSV1RneDB59pLzLA
         bTskm/4+zz9g1z/gA4IuU0Cc14p2kUAvoBgq5S4b8dlUysKfLxWBhKPZvUxASUXKUJZZ
         u0QbN3Tp2Bu24sADzR8o4MYvpiCdTfC5hQKn72ivtAVbvrnVdhzz9R23S9HVvTaZzYoM
         1yzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id d187si13667746ywc.9.2020.01.15.18.04.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 18:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00G24M64024805
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 15 Jan 2020 20:04:25 -0600
Message-ID: <1a1cecb5128134e681b9145b9c6bc10a8db00ea9.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Liviu Ionescu <ilg@livius.net>,
        Richard Henderson
	 <richard.henderson@linaro.org>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, keithp@keithp.com,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org,
        Paolo
 Bonzini <pbonzini@redhat.com>
Date: Thu, 16 Jan 2020 13:04:20 +1100
In-Reply-To: <C4EE0480-C366-419B-84F1-3BEB794D1598@livius.net>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
	 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
	 <87sgkimkma.fsf@linaro.org>
	 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
	 <87wo9tkjxz.fsf@linaro.org>
	 <81f25a9e-a52c-ca8d-4d4b-ca36fcee73ed@linaro.org>
	 <C4EE0480-C366-419B-84F1-3BEB794D1598@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: kh4zBsd+Dt0A

On Thu, 2020-01-16 at 00:02 +0200, Liviu Ionescu wrote:
> > ... they did have the opportunity to do better, and did not.
> 
> I don't know why you present Arm semihosting as a disaster. It is not
> perfect, but it is functional, and common unit tests use only a small
> subset of the calls.
> 
> And there is no 'window of opportunity', if the RISC-V guys will ever
> want to reinvent the wheel and come with an official 'RISC-V
> semihosting' specs, they can do it at any time, and this will have no
> impact on existing devices, everything will continue to work as
> before, only the debuggers/emulators will need to be upgraded.
> 
> But the only immediate effect such a move will have is that software
> efforts in test frameworks will be increased, to support another
> protocol, while the advantages will be minimal.

I agree, which is also why I want to use the same interface for
powerpc, it will simply make life easier for everybody. The calls
aren't perfect but they do work sufficiently well to be useful and I
haven't yet been convinced that it can't be extended if necessary.

Cheers,
Ben.

