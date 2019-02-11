Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2266614wrq;
        Mon, 11 Feb 2019 01:43:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbplD7+OZmPSImC2laiafAmkJKojcoNNOZ56omCpadwhy0pqQOTf5VX+y56jtiR5zBvQYgl
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr9249228wrp.6.1549878234492;
        Mon, 11 Feb 2019 01:43:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549878234; cv=none;
        d=google.com; s=arc-20160816;
        b=Of6iBUb+TZxbMGlaeplXOE0xktlM6CEg5KfXl+tGPVY0E1+Jaq46BgSAVEluURIsIt
         6v2oPnj/XxChOShGv7fRQrRGPkPRpckx/EuJ80WaM8bCo16pY9yaQl16eg8Z2A5ZInRL
         0eTC3MxLZkHztH05d8UcvEFyF+OwhRD1njQ9QBTm35kEut/rpBHSNGVuNwFUeV3Yn38N
         2u4nUIubxN1X2teYFri7Lyn3oZacEbr4CQMYgpz6EC6Wjskj+c7fyJnmvzpO82sUCXrE
         RRygc48BTM2+fdNYiX6NkyBLYu0xpRJzpApB2Z6hsczBDPu0yZzIkotRBFzzkvHevrAQ
         FwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQ5+39SH4z41RfvueRAHm6maadae3nwfWaJrmds1ZKA=;
        b=cFDe30TLZoNUGykhwB8ku7dsLwf6yssbr7rzP2kupQUNp0vFkPfABAXRavM6drkefu
         8QcgQwY++AvH+6QY3Tyd39U+ZF3ldzJRm9Cn6YVEarOC//+m4qoUpxJhxWvFOWyK0XN7
         qSIbnA687LLXc86PCR+JnMUG+opWQCZDIbqxANOZh9erCUbAck7tGpVvO+8yv9bDdjk2
         gfxZlIbopkZoNcu1lbV+rd/Ek9rx/7WOyVs45aTQ+haAyLpicHIZqrGbIZ5n1lLrZTz2
         8DTMjevxPpa2lmUveFFwz7PbFdWq44TWRJtBiYLrRyi7Otpak8Xo3M8N/ID5KImXZlzk
         Ve4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QUKpRS3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si6904220wro.157.2019.02.11.01.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 01:43:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QUKpRS3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt881-0004sT-JU
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 04:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gt87s-0004sE-Bf
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 04:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gt87r-0001UV-Ng
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 04:43:44 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gt87r-0001OQ-GJ
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 04:43:43 -0500
Received: by mail-ot1-x342.google.com with SMTP id 98so3738510oty.1
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 01:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xQ5+39SH4z41RfvueRAHm6maadae3nwfWaJrmds1ZKA=;
	b=QUKpRS3OdSImIr7OaG8racsP9Q2FGXVnNY8o6Vhhh0QsbzxdUUBQCg4sjJDUpNqff1
	Yt7y/frZlu4GBYr2p9dtK6zPs7CvFvF3HDlpbzZy4usZejfTkykooJtIKcNRDZtJxLYE
	/gWbnL13K8hrLeiFG1jgoL0kK8y/8Klab0zOKJ51/GOH5oloPMxdaOT8wYrOiftANYUt
	GkTk7/Xhdl6t1yhRKwaJL0i0op6OahiDTf9DrRtoHPuBawNbw6ZlRZ3ZFJ+NtwSu826d
	fkdVV3zTHwql8cdxudCBwTM7aIQ0dkv/wvcYwTrrs5MVWkc2RgTuz4YKmxlxnJ3ozS8F
	wIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xQ5+39SH4z41RfvueRAHm6maadae3nwfWaJrmds1ZKA=;
	b=J6WgTvzsZl+nlc39wcS7eaDcDlv6gjzoZN1q7Y3/G3vEkUP2+ZU6tLzpUP9iT5KGw4
	Z4UuG0xrKb+In1ZHAJml2cl2qKOKxT3AxtfwZoS2gyYoQtx3htHX37xVjlAE4oy8hhbI
	vDeYrJ9qNQ0UhKOMjBrN/1jwnmCR2jzb82vscjVtVvXZYtuAmcpw9wI7gbiw/GyQuYxU
	+jJWHzVfcd7oK+BNAJvGqrqJboDR1qInR9eGstTSOBzzDAj+hkTCLLAIb3moMY4uOq4Z
	R1eGw120zKHm9VccukPD9v1fWcA3nMqvZ/U6FT8XKv7NWHdFP3q+NWlts0zzxQBgQm7A
	PFtA==
X-Gm-Message-State: AHQUAubohm/FhTGuAfZz2yNhwxBjoUKM75Aw8H642CfC3md0y2j3qeo1
	5e3u7gd8xA6iQbjVViTjNkQuRUJfTDCRdXW9tQE+CA==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr26994251otc.238.1549878218375;
	Mon, 11 Feb 2019 01:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-4-richard.henderson@linaro.org>
	<CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
	<c37e6649-b2f9-88cf-913d-d0394a635045@linaro.org>
	<CAFEAcA-TwEh74GuvafhqFUXP_xesqC9b1oixubj=ztNa8t4a2g@mail.gmail.com>
	<56abf739-b75a-025f-1c38-dd1cd254617f@linaro.org>
In-Reply-To: <56abf739-b75a-025f-1c38-dd1cd254617f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Feb 2019 09:43:27 +0000
Message-ID: <CAFEAcA8b7O_GXibvE9k83Ko40u-w351tSUt5B0EiZ1nWnpgWVw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 03/17] target/arm: Add MTE system registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J0U5AQW1CU9D

On Sun, 10 Feb 2019 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/10/19 1:40 PM, Peter Maydell wrote:
> >> Actually, we already break the TB here by default.
> >
> > Do we? I didn't see any code (apart from the handling
> > in the DAIFSet/Clear codepaths, which aren't used for TCO).
>
> At the start of the function:
>
>     /* End the TB by default, chaining is ok.  */
>     s->base.is_jmp = DISAS_TOO_MANY;

...that's only in the v2 patchset which you hadn't posted yet :-)

-- PMM
