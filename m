Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp603748wrt;
        Tue, 25 Sep 2018 05:21:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Z7T08epeIOXOxb8Rc24jbmvidpblqW3GCoQFGPoh/hZ2HDZdLnwtlm6Ez4V64V3mP2SI3
X-Received: by 2002:ac8:5257:: with SMTP id y23-v6mr568455qtn.78.1537878084505;
        Tue, 25 Sep 2018 05:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537878084; cv=none;
        d=google.com; s=arc-20160816;
        b=fZ4i7/JmwI/pkAMSAQDbrFvEO4d549qWWUwGo0hgV/EIkh5MlpO8dlY8kKWN2CZ68R
         rIDNGPX1REvjIyloOAkl5kShYojua1ifxuJxtAhEAIDIS6Wr0OpEmBv0r67Q9AOWXHlh
         Eis5zxYHhg2WE7Sd1HdiuFtzBQRPsTUumMjk5NpwMX3JA9wFYYzKOStLBRW3gTYHZ8+m
         M+KlnUTUR5O2dO/h7fojMCMWxwSG9Wl+DwUZC7oPGIDpHgOuGLO+ax9nDDpmZzyOa+sC
         qXpKA2YkMKm0rt05R5Jx6PLr/3ZHAw0n0tf2+MpPl5cR3Wi1c52M7AUTw+KAaUVdrC62
         Qv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=qn0bs1njv5adtXEJ1pCnOVwV0cdAstfkBeQ0o2SZj7M=;
        b=l2bqQ63AfoGhmUWQHcgSBq7LczytPpeL3MYU8vknKM6lvg7YlMLHBnXMVczO3/VPMC
         cUKWQFaRK1Sf4mHq3GrQXM/zhN3NTs2nOeP2kVoZqQ4bJoLPZE8NS9ZNrhsRO6YT5xcG
         kauA6Fcp3a112KbIiTVJJjJn8lQGihdebJNZCWl9+aB8MNfnbrt/f8S0SVbfbmmY2DUg
         Geq6Vpq8WdQSXJzQLIG5WuCu2H8KTfA/tUpHbbRrPtnJFkmdOnfCRfCJhbmy0egxZpc7
         7qF/1qjv7fb7tE3Wl3KI+elpJI1gO4cCGRgmC7DugqHJeAArq8b345LO1MocmRoHfJdb
         rOyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WeIlqP8h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u124-v6si1628280qkb.25.2018.09.25.05.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 05:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WeIlqP8h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4mLE-000855-1V
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 08:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mKn-00084G-VH
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4mKn-0003xH-7o
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:20:57 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4mKm-0003vq-OR
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 08:20:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id u197-v6so685336oif.5
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qn0bs1njv5adtXEJ1pCnOVwV0cdAstfkBeQ0o2SZj7M=;
	b=WeIlqP8hoFWL9Ef3xdramOKn9QHuH3ST6/u+l5e2W41N+vOx6/PhzrlzEbiVir31NU
	ldXWqrHKqZ/m7dNoRj2FrGlkM+KMFY3tJOptwMUn+II16koKr+sn0ThWbgeZ+O42Alcs
	SmS47UFgfsISiDb1AxKWIwldsKEADG3R46/i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qn0bs1njv5adtXEJ1pCnOVwV0cdAstfkBeQ0o2SZj7M=;
	b=PSCN1dyc1M5mYrUeRW4BgAT2dXo9QAOdyOvU+gqDT/jOStWpfmypqcQFq/XJuIQcVP
	DrHCxYBVzMbIILIadOnw+cZOLbWQ9zwhKoHoYwddmR+uH9oQVFIzlkYVcAZ/xD6xfba/
	b7qIwnTJM+z5MorLUpHyUIuPA4SscG/cWKfMOSN7VPmDgl/YaBBPcc2FuZ7XHQHF9m5B
	95DX+frhtllrDCO6VV7AtBveyMMco7b69WUMGBbFDlfd1A/Ei2BKvz8zanBgCQ6D94/c
	IZ6mJXxYZ71OMi3CH9crDFOvzUeKgNWi5TiaTD54J3v+JtKYBfkIdC00GU/jy7jbqFA+
	tEhw==
X-Gm-Message-State: ABuFfogQTFRzXeRbmPCDW/LsFmE95loLJpEFWiCyzOZw1qwS8psd7DYx
	ExAyZM9HsliCQw1/zZYRthnfkQ1yq4z8LNVZB3UQMg==
X-Received: by 2002:aca:3bc2:: with SMTP id
	i185-v6mr488206oia.156.1537878055532; 
	Tue, 25 Sep 2018 05:20:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 05:20:35
	-0700 (PDT)
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 13:20:35 +0100
Message-ID: <CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v2 00/11] aspeed: misc fixes and
 enhancements (SMC)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uDy8dU5T1wdQ

On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> This series adds a couple of cleanups and two main features to the
> SMC controller of the Aspeed machines :
>
>  - a 'execute-in-place' property to boot directly from a memory region
>    alias of the FMC flash module using MMIO execution. This is not
>    activated by default because boot time needs to be improved on
>    recent firmwares. It also breaks migration compatibility.
>
>  - support for DMA to access the flash modules. Our primary need is
>    the checksum calculation which is used to evaluate the best clock
>    settings for reads.

I've picked out the easy parts of this series and added
them to target-arm.next:

>   aspeed/timer: fix compile breakage with clang 3.4.2
>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>   hw/arm/aspeed: Add an Aspeed machine class
>   aspeed/smc: fix some alignment issues

and left the rest for the moment (I've still got this series
on my to-review list).

In particular I wanted to get the compile fix into the pullreq
I'm doing today.

thanks
-- PMM
