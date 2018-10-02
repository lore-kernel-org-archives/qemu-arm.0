Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4905001wrt;
        Tue, 2 Oct 2018 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63hd2oIvlvSduyknRdztKMymFgLas3p9eWBnrjy8lJvDbAtQZ6GZvKtJylunmUgSWCbKIC+
X-Received: by 2002:a0c:b66d:: with SMTP id q45-v6mr12033336qvf.43.1538477871613;
        Tue, 02 Oct 2018 03:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538477871; cv=none;
        d=google.com; s=arc-20160816;
        b=wgbFN5i7uEWOAQzshowcHkf567oN8QkIPIo/VWOVtoYNmK5pFBTIsKUaeR9XzxQypM
         9f6r1np/4JuJpoAx5roFkIds2miK/5a3jTX66PX8fYp/0D8CHQvbaz63sVDAS/FNVFAi
         t1KAtpTPo4ePMxVH5MW895a5RV7I4MxDth9W2kv/h4TTUCeyzWqOMGnmvLx5xjMaT4TY
         hV00mX7wbevmX6Y1S0ubDcmBmXyimHigiDn+hgvCgrXUX546tbHSjkOSeM0BD3Q+n2TE
         iD8LZx90T9xvgUsuufm9vGyILjjSbUrDC6InmYG5an2VTHsz7xT1eemaWmCLfgcGwWjo
         typQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=4Yc5SRpQPS9148p0/Mkk21cnutk9DYTIvaaKNjOsFjo=;
        b=WwIZo/BH+veGdJX4RsV34H/drjqnbyLqIzD7XOycaPxNaH9xqCmzKrdNMGGLw98CMJ
         gJwCZgI/lJVHbAQYGv+13Q0w2i8J+lAY+dgsCiQL1LhZNx5g/sXYD5RHq3zHZ9r2aXgv
         Usv4Z21NUAf2bLbb8OwgpkRlbmgF/eRUQOzyUrYSh5FFYKl2dWK80WQJZhKrw1khDGtQ
         mym1lFlBRSgE5Exao9mPSytBvgaUU9Y6dmzK0zB3Zir6b9S/O7GdZ+6z4Hziaxp2nb2o
         pWzNCQ3lhsLgXrlymTynj1895MJkBgr6oTfugIvtXVOsQtk65qRCPBafmAUUkFb3do5H
         l+yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tl9vqSpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17-v6si626802qtq.281.2018.10.02.03.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 03:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tl9vqSpZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7IND-0007Ha-4e
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 06:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7IMu-0006yZ-RY
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g7IMu-0006I3-4f
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:57:32 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g7IMt-0006Hp-TO
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 06:57:32 -0400
Received: by mail-ot1-x341.google.com with SMTP id c18-v6so1434550otm.3
	for <qemu-arm@nongnu.org>; Tue, 02 Oct 2018 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4Yc5SRpQPS9148p0/Mkk21cnutk9DYTIvaaKNjOsFjo=;
	b=Tl9vqSpZsRPPUQxwrzfPGfQRraqad+CLXiIpDZ8Ph1yx2dmAe4Al69tYkB61w+8eaE
	r/jOXqLhwEIFZiYJmr2Abc/Rjhfewib8UqLBxJ4U5xP1Myv3S40JfzEe9nt1P+eOPNHY
	ilgXbrRACye/MPg8wUSlAomZOkyqDiiGpZu4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4Yc5SRpQPS9148p0/Mkk21cnutk9DYTIvaaKNjOsFjo=;
	b=FDAjf5Fpw5llo4nuNNLS9C1pl0kGepSqTpqrwV4vCaGmwLcscNJD2EvtbwgbIdtw27
	ORUdULgxVtTtC3l9Hr75Dwkql8z0EA+ijkXNke4ZqK2MgLjYQsJABjtmfaYlBorYyRQB
	SK6QG8K6b8kBBwnjISoy4r13I1kxr9BqOl5/M38IlyPUPRM00Wu0YZyhf72lYUdlB8Rv
	ZwP31wlRf+GFdMrfpJn6K2dKQXLwwrDweCTy00+NrV1IZzBcznyRW0kGOWeGU/Q1hXov
	911z68ttvz93lbUcPnAQ122CW2IMFJ5FD37eHfuyk0akQbRsVyJx0YBeJVD+JusZOgDJ
	lmyg==
X-Gm-Message-State: ABuFfoi0Bd6tdA0g0UuiOKjx/GsulKgL0cBO2x2DTZ7gpeRFQ9PbMjbj
	BjPLOJquhztquVXE7k2zV6AQ/FDN6vUlgVXmlWGbFw==
X-Received: by 2002:a9d:740b:: with SMTP id
	n11-v6mr8374378otk.363.1538477851364; 
	Tue, 02 Oct 2018 03:57:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 03:57:10 -0700 (PDT)
In-Reply-To: <539cfb28-e4bc-f7d4-6ed9-881bc0cab8bc@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
	<CAFEAcA_Nm7qX1w16spsW-VgsMOebW=tNo9VT0paws7+9YH+zZQ@mail.gmail.com>
	<539cfb28-e4bc-f7d4-6ed9-881bc0cab8bc@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 11:57:10 +0100
Message-ID: <CAFEAcA-X7QdyjU9_aM9RAm-GZZWezyx-toEdT5vf-1P=XkdX-Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 00/11] aspeed: misc fixes and enhancements
 (SMC)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AhkHIqUM7pCK

On 25 September 2018 at 15:10, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 9/25/18 2:20 PM, Peter Maydell wrote:
>> On 21 September 2018 at 17:19, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>> Hello,
>>>
>>> This series adds a couple of cleanups and two main features to the
>>> SMC controller of the Aspeed machines :
>>>
>>>  - a 'execute-in-place' property to boot directly from a memory region
>>>    alias of the FMC flash module using MMIO execution. This is not
>>>    activated by default because boot time needs to be improved on
>>>    recent firmwares. It also breaks migration compatibility.
>>>
>>>  - support for DMA to access the flash modules. Our primary need is
>>>    the checksum calculation which is used to evaluate the best clock
>>>    settings for reads.
>>
>> I've picked out the easy parts of this series and added
>> them to target-arm.next:
>>
>>>   aspeed/timer: fix compile breakage with clang 3.4.2
>>>   hw/arm/aspeed: change the FMC flash model of the AST2500 evb
>>>   hw/arm/aspeed: Add an Aspeed machine class
>>>   aspeed/smc: fix some alignment issues
>>
>> and left the rest for the moment (I've still got this series
>> on my to-review list).
>
> I will wait for your comments on the DMA part before resending.

I've now commented on that patch. I think I'm done with review on
this version, unless there's something specific you want more
input on ?

thanks
-- PMM
