Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1064415wrt;
        Fri, 21 Dec 2018 08:43:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN41uZqt2+hb0dElZg6KRHnjAVJ0gJ5TZ9yI81m1Rsyt7Npp/OfiuqBTL/nENwo1unYyp+jv
X-Received: by 2002:a0c:b024:: with SMTP id k33mr3095930qvc.204.1545410636208;
        Fri, 21 Dec 2018 08:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545410636; cv=none;
        d=google.com; s=arc-20160816;
        b=S4HwbU5wZXPUNCrXLfrVOmT06jPJDeITfHMTRaaP/viK+RX7ayOT80HiSadVrAD9Wp
         fAZUgmki4E06XvoZngzG6UTrJlTzIiLUKW8Do/FSevMbKgouKzgjYP7HpmZxjCsCj8yn
         5kBd7SC4ar2kS3sCVOT/Lob3udeeh4O0ybznbk8QXFokAK+/xXgO9frApeXoY8XixA84
         epw3GEKmkL6q1EZn55DnyvcxNWSXvul97Gzjslvu/yNhVOmXR8dmN0d+aboqFhBGNT1L
         k6vyMzygiwJrd4M1m85E84GZB6QyE9G5fmEyghsfTkSb5wuEnpfM8433jUv8azfmATa+
         LU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TDsvJ2VLc1RcSQKZPV4j7R0wNejAnA1wz7slxXrT/hM=;
        b=psr3HZBLx70OfKzL4WBgLibTvh4rUnVKKBf72rKyO6D0Rr1Y+caLEacxzPo9QcFE1d
         libPtOPfXRHFNrxhIwvwKjpgq/j9ed2TFQ9lZvFn1xTawTZIlnjJZasPoGtTkp3IGcBP
         wg6tY5+0s0q0B5fme7iDyUUFmlpgPX4KimSsx7yaySR+00IIGNLjcOslf0CKXHpJqST4
         qHDv707x3us1qkpnAqyml3cg2sv/RmUZZevTc+OATZWtOxlJjcLp57160K399lKHyYY3
         UJg1yjWX64YuppMDvz6EHHDQM6UYEpeJ6kImfwIXULc3YkINBoTIH9IboybZf53nBUKH
         k4BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eV71nvbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p88si4035394qtd.156.2018.12.21.08.43.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Dec 2018 08:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eV71nvbZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gaNtz-0005pE-Ng
	for alex.bennee@linaro.org; Fri, 21 Dec 2018 11:43:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gaNtn-0005oC-5C
	for qemu-arm@nongnu.org; Fri, 21 Dec 2018 11:43:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gaNtj-0001st-Nu
	for qemu-arm@nongnu.org; Fri, 21 Dec 2018 11:43:41 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gaNtj-0001qS-IY
	for qemu-arm@nongnu.org; Fri, 21 Dec 2018 11:43:39 -0500
Received: by mail-oi1-x242.google.com with SMTP id c206so5280501oib.0
	for <qemu-arm@nongnu.org>; Fri, 21 Dec 2018 08:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TDsvJ2VLc1RcSQKZPV4j7R0wNejAnA1wz7slxXrT/hM=;
	b=eV71nvbZ04DzelAsZq5qv7WqjuQjwMsvxc5L8OvujwjtYWXHh6Ek81DjpYCV8Aznha
	CgOGmG2Uek1bK2KIQ5gPZ8jVdrazNPwBnOStRwEUTE82VWRMDnXinfHlphzrOQM3CRmT
	cVM4jeuK6qP4ludlmisJKfAdrs2xDkg18FlYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TDsvJ2VLc1RcSQKZPV4j7R0wNejAnA1wz7slxXrT/hM=;
	b=rQ/LpMal9rEs2GCH1H9ACCJyiVYkynd+PMXvkVuIc3sXnxXlp5srgyXMgXsXJ6kKpJ
	OLHHNo2t9L69yWBX8crtI4rWarv5pGmCWS9K6roTDXJ+YytcAJWe8F7MHRZDUPBxxdIN
	+fESf0dkT3JNq8xU1R05lRJuz7IzlHf58/Vlq2FAK6Rl5CGbzRAGAZwQgqUymETFFUfq
	UmrPFDTG6xVQOlSd1xCY6q6UsPuwFI35yFQUk9DC5925sWfMECdH2EBPuiNUZceVUaHn
	SXABjD6phLsfxTISpSmzoj/RC36dhzkvo7g19zsTU9psrUMv3+uAEdXRS3CLpFgYclPU
	pPcA==
X-Gm-Message-State: AA+aEWYQGQQWwunQf8eRDXY8tb48O0IbqcNLQB233zkihdH6lhlSpwJJ
	lRtXruLLor1EkhuB5AlpCdOkuDb90IHkH8S3S8eyLQ==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr1931049oic.332.1545410616646; 
	Fri, 21 Dec 2018 08:43:36 -0800 (PST)
MIME-Version: 1.0
References: <975b9131-9937-cfea-3b5d-ef36d0c2b761@gmail.com>
	<963b728a-2ed3-bcc9-0ed3-df2d47f70621@gmail.com>
In-Reply-To: <963b728a-2ed3-bcc9-0ed3-df2d47f70621@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Dec 2018 16:43:24 +0000
Message-ID: <CAFEAcA8TFy1O=rZfm1FazMaAjyt8+4E=39FqngvmdRdGT8gZSw@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] Support u-boot noload images
 for arm as used by, NetBSD/evbarm GENERIC kernel.
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
X-TUID: qKoNU+2NkjzE

On Fri, 21 Dec 2018 at 16:13, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>
> ping

Thanks for the ping. This is on my to-review list but I'm
not going to be doing any code review until after I get
back to work in January now...

thanks
-- PMM
