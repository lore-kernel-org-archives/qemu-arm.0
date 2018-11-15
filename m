Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7316688wrw;
        Thu, 15 Nov 2018 09:59:35 -0800 (PST)
X-Google-Smtp-Source: AJdET5c/pt3eqcPbtebEgHfXop6eroo/TTPL0CchqKns+oJ5Hc9AiobW4uJ+U4DgFHYFz34SbUo7
X-Received: by 2002:ac8:fd4:: with SMTP id f20mr7212339qtk.63.1542304775267;
        Thu, 15 Nov 2018 09:59:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542304775; cv=none;
        d=google.com; s=arc-20160816;
        b=sPH2qsd+TBxy5haFYk3BiJmb6Rq8STpRpxrbsAQCDfrhyt4Ycc7kDnwyopXJ90awfN
         2b/Q//ghG1XidNg3uRnmoGNSzliJOsrqrtZt1F+ax5QetT8i+AnM60fGgSrzCrP1XFQH
         E3XpsyG1jYUrNI6G65PrCGAzDR0066hUnSb9uLRQFcA6DYdK2FDr+1RBiy+RBMnfky5K
         emw2iBtIt9L1sJc1kCivThMvVVzZ2iPCwtItEF1gSl5aKFlEwGst+yfdyw1uwu0faAjm
         YhhVutIXDD3EPbAOk/yeqrwkHDUvf5qLErbD+yVqFmFEUgFrvjj5ZxQAsU08HxeneTio
         GFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=aaZd1C+eUnOVPiywyMRy4ESYdW0nity4i+Lbzx4vta4=;
        b=X022gnWFH7vEIGTCGDnPovUhzsOK4IOxI+ZVukgBxdSoIXNWygy3oDDUOwWSQybfSd
         4ZcEiLViIF2CmgigxwaMpL4PufvBNEisjKGOswe/ilKuskk1Sqa5l6gDfhkc2/nXe5fD
         CG5k99TvkaKO9ihhkFu5rSzFrP4mWppfsS0vz3ePWGKzx6h5A4+tANpl+Lu3g+NNypEQ
         Ofzb/NdAAnvfOw4WWYQUXqwwyCZjqkF7b4dsp2O5CVNvGKj9v/87PJ3YUBvg0vC3lb/o
         Sv7wY2oB2RGxWlIlLtN/aORxjjaG9daZfYHv92Mo3b8PAen6cJIHo4DbL1hNd6k7YgDL
         +M3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XuvdN9Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si1936609qtc.86.2018.11.15.09.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 09:59:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XuvdN9Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNLvS-0005JY-Ri
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 12:59:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLvI-0005IR-So
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNLvG-0006sN-TN
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:59:24 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39955)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNLvF-0006cV-3p
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 12:59:21 -0500
Received: by mail-ot1-x341.google.com with SMTP id s5so18824826oth.7
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aaZd1C+eUnOVPiywyMRy4ESYdW0nity4i+Lbzx4vta4=;
	b=XuvdN9UaMimbj0XlALjN3ZNgG5un2+Eyz0lCjsYLf4msYf81jBp5wFbaU7NefZPgc9
	wFVNhV9bJfAO5I7SpIRA/pRaD36Pc7FVWwjlb89s8K4CiVfkmexcLnRAtQIoytxcT5t8
	qX8KC1VGRKFBXg4fV7bb0cxxbljXWXQUMGpUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aaZd1C+eUnOVPiywyMRy4ESYdW0nity4i+Lbzx4vta4=;
	b=PQCruB9yn9j2fQyd6qJFtN8taN8qpgzNUqEorQGKLU1k+PKwoNVsBkDQeVfJ0+zjzw
	7chHs1CoYOVetzixJCRYaPQOpv0Lvq14caDsH6Y26n5gjmnUISNtlvlirGn3A7iM7kB0
	wfBKAVhsH9ObXVEO48zXMerYYyw9HK+5vImEC+TZ0mf+seKN5zERHBFf3yfAQwHiAuY9
	CxpqJ/jPoatN05RzdvVW8xVZyJz/gyx0I/Qu5Dl2aAeKm7OVtxnrgi4NGTE8wzNpA07c
	rjkp3eWo/QWdbl/AoKYun6nZuSI+ppT4g2cm2WCsPhl0iyIESphF5SW36HtcfvO1VweJ
	XOag==
X-Gm-Message-State: AGRZ1gIOrLQIXjom1kJ97lH7uUCUzXQJjgCLphyDJzq77SeGOerjYuSd
	0lrdv4er7lYliVUopYtfugKSsMLJUgfV5yu9uot0Kw==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr4077925otu.352.1542304760445;
	Thu, 15 Nov 2018 09:59:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 09:59:00
	-0800 (PST)
In-Reply-To: <CAFEAcA_8cgFgCvs6jZ0rb-QPf60YkdPJgpu0SzCh3SfKYD560w@mail.gmail.com>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-2-richard.henderson@linaro.org>
	<CAFEAcA_8cgFgCvs6jZ0rb-QPf60YkdPJgpu0SzCh3SfKYD560w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 17:59:00 +0000
Message-ID: <CAFEAcA8JwMpb=Ptrqz3svecn8gar2o9=VH-NY0hgUF8EsmbDiQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH for-4.0 1/4] target/arm: Move id_aa64mmfr* to
 ARMISARegisters
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
X-TUID: O7+p9ThdlkaE

On 15 November 2018 at 16:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 2 November 2018 at 13:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> At the same time, define the fields for these registers,
>> and use those defines in arm_pamax().
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...though since you'll need a v2 anyway, maybe add the v8.5
fields in ID_AA64MMFR0 ?

FIELD(ID_AA64MMFR0, TGran16_2, 32, 4)
FIELD(ID_AA64MMFR0, TGran64_2, 36, 4)
FIELD(ID_AA64MMFR0, TGran4_2, 40, 4)
FIELD(ID_AA64MMFR0, ExS, 44, 4)

thanks
-- PMM
