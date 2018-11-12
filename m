Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3285929wrw;
        Mon, 12 Nov 2018 08:00:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5ceT1Pla1HQSm26G6ngUPsqm6xh3cFA32cNVFvSJS8fVutD3WSxLcTEpxuptRQ7OD3eSsAD
X-Received: by 2002:ac8:674b:: with SMTP id n11mr1441281qtp.104.1542038454840;
        Mon, 12 Nov 2018 08:00:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542038454; cv=none;
        d=google.com; s=arc-20160816;
        b=dAwTf/mVbwrHJObw6xDlQNM+aoKvJPEBsg4+b8J0jKwBFgw25LiIM3RrjTe9bHceEc
         q3LvFKLC/OGNk2453ZZrxXv35piSEz1L01EAQKJRTMPUMXLyrTcuA6DYZaRrx6P5M0JO
         PXJoXxAwHid1VcL25vNKNj/rtBhnDo2knljH0kT5p/qRDkj+5c9YelUTlLQmlcq71Z/1
         LPBhXL8hV/hXmHdljsJnub4iFXjOa9+2SYZJDm75rN5vrD7WLfi6e10sphqwsMlph6LR
         9FDgDhUkCBo7NJ8qTTVHyIV8GPErMrELpM7sohN4Fk5hIeCoOgdJR54SoH5PJp/Smsy6
         +KNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=k6rmikVT6pgJzqugHOAD222l/5ImtdjE4erI8yXptuY=;
        b=kFMvd+EQjHEo2KQD/7WFOFImgXIcobvxy63zYxGYXz2Ipz968Tj5R0eBke9+KlhQNI
         Abag4U28eaWs4zHQZWZiWSf/i5pLjdHaxtesmnve9d59BsQvHzHDD8tUdtaOzj4wu+iv
         You4QHBNTTZSc/vFL2mY1DKAfqbdemslybUQJZWttTZK0nmKUHbTWpXO44JP6ap8E4qY
         hNKoLToo6YKCp3ghIUyZZLx5D6n1o5QOLQn+kF7wyK66wfaQ48SPhRMytYdZ7598CgeL
         28axusD3D+c30a0USKvoAkrsiDSvvtVdN66okS3HjAGcGRJabouIOxSdafBtRe1zchaF
         +asQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TPEam5UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x31si274223qvc.205.2018.11.12.08.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 08:00:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TPEam5UY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMEdy-000090-8d
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 11:00:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMEdn-00007w-BO
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 11:00:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMEdj-0002W2-5E
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 11:00:43 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:55463)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMEdh-0002T8-0p
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 11:00:37 -0500
Received: by mail-it1-x144.google.com with SMTP id o19so4130145itg.5
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 08:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=k6rmikVT6pgJzqugHOAD222l/5ImtdjE4erI8yXptuY=;
	b=TPEam5UYvZ/2ZwTCvHu5Tiu20zLVb9OiBP0PlLcBjQsbkUvj9AaXnJiuxqMmZzUjJZ
	gsuI8dzM0AAjZqvxiCTAlUYoenbolGJHLLGlRkB//Eo8xB59EgWflYAWe1mf3d7y1F3X
	khI/2ljEz+xuplySvEPRa8EivQqX+Fodj4nWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=k6rmikVT6pgJzqugHOAD222l/5ImtdjE4erI8yXptuY=;
	b=HWG/h0LFzjLqdsD/cqdG5/wc4rZ2Pg1bV5iZgCZQInwlgCcXJCyVWVGXxwF1Zg6T/U
	oluIn372ThgKw5dedsWw1Md/Z8jny8e3JeBcZ0Fq8782bB+EJvcugK2vCO0rt0iK8i6t
	eC6wJXJ7A4hRE/o0I3Vzv/eAFfEkyAFCnqM9ZoJK11u3ltTJV3K2m/tv3HAG0+fhGSrc
	Efzrff9ygLhNsMWceg50L2ud09ThhHsvEaxpMKWwy0iQ0AxTtW7yuflCz0l4G5cTPJ19
	lmzIgw34bH/V1TE3D8rxzvWBnrmH580tmbblJNKx2N5QZdGlyBT8oZinBKdxO+GRbiN2
	aX1g==
X-Gm-Message-State: AGRZ1gL3UHDQ1SzjCWd7k52PuAkacfjhVZ91dBZGBu2jdnRs1qGhrzII
	QsWKCB1azg6bZir6YKXHQZb4oStKIReIgg==
X-Received: by 2002:a24:554e:: with SMTP id e75-v6mr173565itb.99.1542038430536;
	Mon, 12 Nov 2018 08:00:30 -0800 (PST)
Received: from cloudburst.twiddle.net ([172.56.12.36])
	by smtp.gmail.com with ESMTPSA id x79sm155991ita.34.2018.11.12.08.00.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Nov 2018 08:00:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-3-richard.henderson@linaro.org>
	<CAFEAcA_WJMAsHWx+OTO+j0eTsHodpXkyxLv6cAdXxgjsCmTYhw@mail.gmail.com>
	<6ace0700-23b9-d004-a5d9-6ab1bdb90835@linaro.org>
	<CAFEAcA-3yT-Tw_Q6fiioyxTF8oEJ0r+ZTKdYCg4inYgtdwcxRA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <8f544b44-6400-8f85-3600-78347feb1575@linaro.org>
Date: Mon, 12 Nov 2018 17:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-3yT-Tw_Q6fiioyxTF8oEJ0r+ZTKdYCg4inYgtdwcxRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: Fill in ARMISARegisters
 for kvm64
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
X-TUID: fhilFlrj/jvx

On 11/12/18 3:34 PM, Peter Maydell wrote:
>> The other id_aa64* register fields are all extensions to v8.0, so they should
>> be zero.  I am of course assuming that AdvSIMD is present, otherwise qemu
>> itself probably have failed before now.
> 
> You don't set the id_isar* to say "AdvSIMD present" (or "VFP present"), though.

Those two are almost unique in that they are signed fields.  So 0 indicates
present and -1 indicates not present (and 1 indicates fp16 support).


r~
