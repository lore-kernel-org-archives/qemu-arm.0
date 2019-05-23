Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1688008wrg;
        Thu, 23 May 2019 05:56:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLaLgB+kv3GhVy9rGypeQzaD0N/fkVbJwXBtQe9WwSZeij11YtxyX+y79GovZjsXYf+XOi
X-Received: by 2002:a17:906:459:: with SMTP id e25mr56988172eja.123.1558616190017;
        Thu, 23 May 2019 05:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558616190; cv=none;
        d=google.com; s=arc-20160816;
        b=pS/XYNE7YvHq3f/VNr5FsZVWQcyJxFHLcK6zfkz5D/GG45XQtzMbvMJpgSSwsDCje7
         +wZGF5PKO4DD+e4Dh6RPctWpTsIvBzdHsWJ00eLs/lVnsihZ0Fv0p9ecuLiHUc00H/Bx
         TsvWkrwROi6E8GRBphDlQeqwaF+/5qCCqozXf8folaE/xwibdiJ0EinEEOCnB/1wfnCr
         rxIK1vWraqUWrW26NF7/tZ8IxJUZWa6L5sX7B/UWLUKeaPebiB8D991yHFofDGojALRM
         PigoWnLItME0PLUeB1mK7sT37UrpJXe1jJ2o/BHdz4q39teFZor2ElRXdLNsgZb2Y4xD
         Tj/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=rz/ZGOyuPlC+7X+pyDeztrw2+gNVeboRhW1U8wDne6Y=;
        b=WGZierc4d8ToRzIAKK8LY4cuVvIa1qL0uagFW0XvK1J5Sr+WrZh18dkeL6WWMTLsDl
         vhgoSvTK4tike4CAQmKgkaBIxS4w9ECaMaP3p9qTmdjdj2xf4k8WsMQ5VS7qxmKJhURE
         YshlJ2HdCCDhbu88X05xeBmTLx64SiKRXw8XUINH/UOJ7SRbFnn/3Gib+wo4hyEL7ov3
         Q1M4AK/MgROAH8PSr+ei+MwYpCW1nZKgtUwIXr5pk90HG5JxQfZlbrFL7yp5rQzNT+a3
         WZMaKrnAATXou40HoLzzE9XcQf5FDPOMNLX8el5CH5agQ5UqilmOjUbttCy8YiI85DVx
         oC2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E+tyrXGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si5496826edn.60.2019.05.23.05.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 05:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E+tyrXGJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnGn-0003if-2M
	for alex.bennee@linaro.org; Thu, 23 May 2019 08:56:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnGV-0003hW-8E
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnCt-0007gY-3w
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:52:27 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTnCs-0007fC-UP
	for qemu-arm@nongnu.org; Thu, 23 May 2019 08:52:27 -0400
Received: by mail-oi1-x241.google.com with SMTP id v2so4248813oie.6
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rz/ZGOyuPlC+7X+pyDeztrw2+gNVeboRhW1U8wDne6Y=;
	b=E+tyrXGJXWg1H5qlzp8r4QHzkqud7f4INnDFcKbrH3PegrSuE+0p6gamtP1d5xRSZD
	NPYqQfNN9u2iJUUi3bBdIazP9WHuL4Rpe+IQbev0/pvy4p5CF37+e9fX6txqikdLKVo6
	2zuqklXt8NwYfecmjGOZKxhJ8IRIajXX94sAy+sULti7yNpM8F71szzVjuMA+5cyYi5Q
	n2a5DoWM1b4JMj4xf1LmcZseVin9laCzNRN6bgdWIcLF23TjBG2VBf3RPB35OSsKPdeq
	dd+DK7R/a4Pdy6jDSNCoLbl4Gvzy+1hnpyfRLnaywmDmNMJ+zAZL4GHDcZlCNGQyrsnk
	ZQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rz/ZGOyuPlC+7X+pyDeztrw2+gNVeboRhW1U8wDne6Y=;
	b=lJrsAybR1aoWqKbzqOxNj4ZoYD4RMYyEsPoTsaOOBdG78gPj8IPh/+G+OYJ2EfqzS4
	m6MJM3QzqRtGs77+1iZa39ZSGFx0RTWEv8y5q7Eu+3fgphnghOyyxvp6t8K4lfAqgzV7
	g34PvbNd1OC3nsGqv3pQ9zwlugbD5CWXKsDE8WeqvrZlaBflJX+d7sxOP0wezQ4vV08p
	CEDDuFErhwgfkki/c2h1QCvEQgucuNZoRf0D+zzXkIFCbfdSnghlwGgFJ28bmOmTIXG4
	oq5VjZvByJkaMkGCnNkgmlNQp+TVmi59vmh2R2uqARTABJWVBQ7U1o1y7TN2k+QmJ1Np
	PYJQ==
X-Gm-Message-State: APjAAAV/78BNnoakOtM49sUEWdqEF7vlitw+zelBM1TLXQgmYgLuyCNf
	ZGxx0+IAmPLOBox2Rol4mNFqdw/Fl7hjq3bG4ivYtQ==
X-Received: by 2002:aca:845:: with SMTP id 66mr2601464oii.163.1558615946302;
	Thu, 23 May 2019 05:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190506142042.28096-1-clg@kaod.org>
	<b12201c8-7d5f-2108-6666-75543c38f243@kaod.org>
	<f1ca56fd-c83d-8ad6-29c9-a8fc6af4531c@redhat.com>
	<270e510b-687a-6b43-8cd6-c1eb1aea41e6@kaod.org>
	<6161d982-0d21-99d6-680a-37ae300fd7cd@kaod.org>
	<98d1e57f-c033-fdb4-51bd-4a6fc2223d58@redhat.com>
In-Reply-To: <98d1e57f-c033-fdb4-51bd-4a6fc2223d58@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 13:52:15 +0100
Message-ID: <CAFEAcA-eVECkPpxnvDtX3v6BFMSVCF4SU87r51PdG=E=hCYLfA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2 0/3] aspeed: cleanups and extensions
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ef64brJQzYmG

On Mon, 20 May 2019 at 17:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/20/19 3:32 PM, C=C3=A9dric Le Goater wrote:
> >> Peter,
> >>
> >> do you want me to resend with only the two first patches and include
> >> Joel's in the same series ? I would leave out the part Philippe is
> >> covering in his object_initialize_child() patchset.
> >
> > Nope, we can not do that, conflicts arise. I suppose the easier is wait
> > for Philippe's patchset to be merged and then rebase.
>
> Eduardo said he'll send a pull request during the week.

I am now completely lost about the status of these patches,
so I'm just dropping this series from my to-review queue.
Please send a fresh patchset once any dependencies have
got into master.

thanks
-- PMM
