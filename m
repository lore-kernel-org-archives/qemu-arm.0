Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1805974wrd;
        Tue, 21 Aug 2018 04:39:51 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyFXGzoe/jkfxonBkrmMi0qj6LqY7DnHFvhyBI4DkiL0UfwcQVt+anfTHBzQZHxjG6Aw+QT
X-Received: by 2002:ac8:fbb:: with SMTP id b56-v6mr50033737qtk.191.1534851591584;
        Tue, 21 Aug 2018 04:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534851591; cv=none;
        d=google.com; s=arc-20160816;
        b=jkOjtCHfh7SxEA0DvpS7pqbGE8zQuE8ckznqFg9hYDhY8qD4MXHLSDTpSGKwDYT/dF
         NSrpTInnU+qTFaEKaYacGTFHQrQLxC5Cpd0tj39MCU7vmoTAgXBF9B0lmfGY+QUd8s1J
         8RbrdO/DoE1WmvXXTJhA5jIauaJwTnnKwi06wteB7xD4m6xPj/CnugmZueFArgrAg6BJ
         /fA/vIjH6sweKpToUnwVVB6cksJLJvRW5QxmLSv0nsq1SzigsuCLqWp6lcB61UFsZsa9
         RTu5O0T762zaXIqJ7SO6y5LnLe+dp+R4vUcCjCNLZqFzoYTTGOAEDT7hgUmg3Pz4V3RI
         XVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=I3HGHQ4azk6TXlLEvGOeGunxZTU8PgWjo/C7p9rHa74=;
        b=lJsC7YanmLfQ5wD7NDq4CTivSQUBUTMdjB9D0J3bYmD4eT8866k/rjueTzRwJdcJHb
         A0745unmCHITDfqWuNFrrVXjkQgSnTY2Hy3sH2Q/1aqbM4lubR/mpcZJMZ8Z4nhaLwan
         b+fOI+Z6baK5LOYEczEo6c4zJs4QAiKPOKB79Z5Hr4qa1QUHISPAh68trorOtRAZZdMe
         LuaRujYWHIvSBvgBfwKFiVILA6LJdV7fTSPwc3AEz0BGrhHgjLQR+7sq48M+gYuuTdZs
         JQAQccknjhh6+/sTJ/6L+qE31mXtw0xUJm0XSGkCJG/+iCTJYD7J8huC0huiwpIOnvGi
         ODbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JE1tzkzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6-v6si5363554qti.180.2018.08.21.04.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 04:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JE1tzkzW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs50p-0001Rp-4B
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 07:39:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs50e-0001Q8-Un
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs50e-0003Rg-Az
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:39:40 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fs50e-0003RI-3g
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:39:40 -0400
Received: by mail-oi0-x241.google.com with SMTP id 8-v6so31470689oip.0
	for <qemu-arm@nongnu.org>; Tue, 21 Aug 2018 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I3HGHQ4azk6TXlLEvGOeGunxZTU8PgWjo/C7p9rHa74=;
	b=JE1tzkzWDR186Sa1uKu+QxGmP9fit1Chfg6Ry2IAYmaOZsq5AFwMsqovGAFYEFQeck
	dvFGPoP9aqi4aPI/Assytnq9AQff6o9oDN8RFWi96tadRs/WDiG1DTZFfX2s+Y9veFxF
	lrTcb8OhXnRvkZthPAzIaTGhB169BMxiA/PG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I3HGHQ4azk6TXlLEvGOeGunxZTU8PgWjo/C7p9rHa74=;
	b=sFDRBRKrFRhBUfc+DuizkaVvodwWFefeZTF++nnXQraLzVToiqjsgE7Ot2W3SARfEy
	afAb9LTBN2XThWDN/kCuLA9qWQVTJvA1WDBl6DMvkUIl3ByLLN4bEUn2NggbPU+zPAvf
	SVLyZkjcPY13dIQnXmcCiS4ZYfceS6Tqhfm+OXgmSFDXngKbPgYOGrg8ir5ur1ktdiGr
	6cVA8N9mBP+wVLmgItT0k6mdhxAegDKV17e75ycDVJKa8lVPTPS4DvbcBI7E+quD1L1o
	NhRVNJB2upec3Np+vkcuobSf6VWiVNi+wQySmwgIqZmfPOd4vh3Wc9hqwk5/Qf/DowEk
	WTfg==
X-Gm-Message-State: AOUpUlHU3zJ2MVT1TfrWaswZ0JCDWgftvTq3Tl/ymL145R+pt4xCMh35
	0nzg8oD0ak2s0U8/HgGK3xQN0VFsVoMaTdQeonsazWgafAX7NQ==
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr16524188oie.28.1534851579538; 
	Tue, 21 Aug 2018 04:39:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 21 Aug 2018 04:39:19
	-0700 (PDT)
In-Reply-To: <5adf2f78-0e4f-7c02-a5df-a2770ab4920d@isystem.si>
References: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
	<CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com>
	<5adf2f78-0e4f-7c02-a5df-a2770ab4920d@isystem.si>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Aug 2018 12:39:19 +0100
Message-ID: <CAFEAcA__5+nCEbb9-B+fWKhB3c=HP_5N7tnw7i1uvD7rWPY0uw@mail.gmail.com>
To: Marko Klopcic <marko.klopcic@isystem.si>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] arm: fix reset operation on netduino2 board.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZTW5L+6op276

On 21 August 2018 at 12:37, Marko Klopcic <marko.klopcic@isystem.si> wrote:
> Thanks for the review. I agree that this fix is more a workaround, but it is
> local to
> the only currently existing board with STM32 (AFAIK), so I couldn't break
> other targets.
> I'll try to implement one of your proposals.

It's a pretty nasty issue to try to fix. You might want to
send a proposed design for a fix to the mailing list before
you write too much code...

thanks
-- PMM
