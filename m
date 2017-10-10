Received: by 10.223.197.9 with SMTP id q9csp3700988wrf;
        Tue, 10 Oct 2017 08:50:11 -0700 (PDT)
X-Received: by 10.200.49.228 with SMTP id i33mr13775440qte.95.1507650611504;
        Tue, 10 Oct 2017 08:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507650611; cv=none;
        d=google.com; s=arc-20160816;
        b=txqyR3LoK66z3UEU+h0y3PTcM5UJyggXEPT7K7q01QObS1i79Jx0Hb1HVgF7ga2NDL
         Gkxi63xCpvlHdGCC2YWFqJnn4I4sEcuoY9RMLCiualFeCxny/2DK7MFfwp03tcg21KHK
         948eHKkilGGDxsPLeac2j1V89ARjDggA+9zlA31yoe3EJyHlKvi6BMuaR6qDJrUCNCau
         wzKDWFCe6v59clqdnx/76nfgDhZEAVmps0/PnkU4Yo01K9VrIJvvikZfu9h59826elop
         MnwIK/YTSRoIOd1Ii48hrdcKU+Pcdb7gJueBHrqWSh/W+qiqQVBoUrS3WgTY0QTUlfFn
         79RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=KHFQ2sC0Y9B5BkCNj0rRGgqHKEfGRfMldb1Y+7gq4hs=;
        b=r3/MA51LATMQ25JC3e3LHl1TI3lAy5d16ULhTvSuXWTBxrcdT9FEDDGQ5JDUkMoXOV
         4Otbgphi/X9GR0lutvlzzqSAKOfVB3s/JfG4skFljQcw1VmsNIhhPVqWbFjoJdXy/vYQ
         ddekmtFRoz5lEXvlnVbR+tEaVPD+Pn1HZ95kCyv4E01jGhQh0UkSromO5v26p7NhTVA6
         NlMU+DZaY1xTl0QgelGTzuQRw+ikZzbCNh4uGHek32CEW4xxF9YnI4Nf2FMYf8LFFMIN
         CyVpctm6AgMiyQdSlHGE5clRKXRxLmgtPDD2/S+bwf+N5Lk835hh0joPNyGt2wRmOHP6
         Dtbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcEH3aQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x3si866465qke.467.2017.10.10.08.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 08:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JcEH3aQ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1wnJ-0007it-8T
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 11:50:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1wj3-0004SO-1U
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1wix-0003yJ-4w
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:45:45 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:47664)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1wiw-0003xn-UI
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 11:45:39 -0400
Received: by mail-wm0-x236.google.com with SMTP id t69so6464737wmt.2
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KHFQ2sC0Y9B5BkCNj0rRGgqHKEfGRfMldb1Y+7gq4hs=;
	b=JcEH3aQ1m8iBJrN7AXU4jdiYIg1K5JVUuEldDNk9pM2+SoCTLbZHEzRJXtDkmPzxDD
	4HSIRB9ludytI75LhwgFAFHUnP76MlvcqapeOEBCDuu4NoCO0nZxzxDd6TWletwduhK5
	jBKfMZXrMZNT7MLNQpmPPJyrrh59GTcynt/KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KHFQ2sC0Y9B5BkCNj0rRGgqHKEfGRfMldb1Y+7gq4hs=;
	b=M7LyE6O3mqZoEHv18Oe0cMSSNGVn6ilaeQqQ39oc1wILcHH/lWvmXlcO3RziUu0jt+
	+dumnXk72wriUASV5SoFTW12V0rlsmObY8oo2x01oQrLuIB9JP3cQSxd9/lv9QLCSSIC
	/HCNOnz09JHdDO/KSgmWYIvljwKNd0ZgYLs/IdPJG2XYiZfeH1I5YzKELJDXtVnSDTLC
	Yoc2TGNTWDoGG+d7W3WTopmrMzkyaYM6W6xsJMutpFtA8lduPMFf5xZk++ixLff9OItn
	bT7ik1uUdt9diEbDumdqt6tZq8lxjZM8yXBlD7JA5QdBOrwxQPpU4SPEj30szdX9oj3J
	ZM3g==
X-Gm-Message-State: AMCzsaXMvw6bqHvfM6isiHWE++q3FJLsTiIBm1L5mN47RzRRJPTqFOcR
	XKMr4PBRZi3qa5X8V6CKXGcog6tR77BzlnhuN0U0xw==
X-Google-Smtp-Source: AOwi7QBfYqBVdWYyamjeVovnuDiOA1QjNsULb+NshVO8fy8eOmaktDipKjOv9R6jb0UA4IJe9/er94b5Q5pzuU0hXQ0=
X-Received: by 10.28.113.196 with SMTP id d65mr10347984wmi.151.1507650337778; 
	Tue, 10 Oct 2017 08:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 10 Oct 2017 08:45:17 -0700 (PDT)
In-Reply-To: <cf00417c-86a6-cf7c-eea7-b1b46d9b2cc1@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
	<CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
	<900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
	<CAFEAcA-tZG-mVMk-kfxZz3oKOSBr9QDpwJWc_CSvqc7An8NNbg@mail.gmail.com>
	<cf00417c-86a6-cf7c-eea7-b1b46d9b2cc1@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Oct 2017 16:45:17 +0100
Message-ID: <CAFEAcA9mMCAPdgTPtEtEBMa1go0XNDCgZHmUR4bRYpTJibK9_A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZLQU9vWfeF28

On 10 October 2017 at 16:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/10/2017 03:24 PM, Peter Maydell wrote:
>> On 10 October 2017 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> On 10/10/2017 11:54 AM, Peter Maydell wrote:
>>>> The goal is to model hardware correctly. Hardware gives
>>>> aborts if you touch a physical address with no device there,
>>>> and so QEMU's model should do the same. If you have guest
>>>> code that touches a physical address and blows up because
>>>> of an abort (but doesn't when run on h/w) then either:
>>>>  * it is trying to probe a device that exists in real h/w:
>>>>    you need to provide a stub implementation in QEMU
>>>>  * the SoC's bus fabric really doesn't pass aborts back
>>>>    to the CPU; I think this is unlikely, but you can model
>>>>    it at the SoC level with a suitable default memory region
>>>
>>> well, that is case it seems.
>>
>> If it is, then we should model the SoC that way, ie find
>> out from the hardware docs what part of the bus fabric
>> ignores decode errors and use memory regions with the
>> right default behaviour to cover the relevant address
>> ranges.
>
> The addresses generating memory fault errors are all in
> the region where the BMC SPI Flash Memory is mapped :
> [ 20000000-2FFFFFFF ]

If there's an actual flash device there then this sounds
like my first case above, where we just need to stub out
that range of addresses until we get round to really
implementing the flash device.

thanks
-- PMM
