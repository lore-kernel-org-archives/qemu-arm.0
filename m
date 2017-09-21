Received: by 10.223.172.38 with SMTP id v35csp2077265wrc;
        Thu, 21 Sep 2017 09:35:09 -0700 (PDT)
X-Received: by 10.55.176.4 with SMTP id z4mr3985020qke.159.1506011708978;
        Thu, 21 Sep 2017 09:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506011708; cv=none;
        d=google.com; s=arc-20160816;
        b=WfK6W/c3Ohr+MkhG9HiobSI40UYo4lG+rz3Yaoo1n+MbV4KmqeFhrvqyk7GK5f3G5y
         Luf8xz/UYDIfJKnazFcWsi329DlVdW/CiFIqZV4wZ7C7YQg7fBHDsuOWxSyrQHzhn5TN
         SgAJ9kbuZ3uTKnZCysPJou1sjBUGME7nCY4MLmfYmgJQJQidFA9XEkjK6Xl72gtbf9xr
         dR0spAWVwTg/+cyDzGEUJBi3Dfyx6OYV5L5vfnlOBKkvY7VXNFFZf3h7fppyir+0xb6U
         o5eB5fJfwwb+UNVY9EXiQkiMCuVkORRrf8z2gDeYMW/tXVAcONC0BoGGZKyMDScxEIIN
         pRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Tq2b8ZaC7/Qll0iFvs6L3oPCkaCT7d6A4kwTmrtJAwQ=;
        b=0d2oSOnzwt0LealLRGexpP0b9yQWilxUUZKE4i8EzI6Tf1lhRc0oT3qtppj/WWrGr4
         zlEF1YlgMhDE03H2sSz8qer8lnF2zYSa95aWTtC7wGFGB6q1Y2KZwMIuiHert5ENiGpG
         foFpMp0l40o+X/KSw86gLY/WiagyAu/ZLsm7CRSEb1Mqbh3fi1UiTSRV4rrF4qwKmWLG
         QtTqzj9RnGptS26I4++nJwFWJ3sJHPDW8zEUKEg8RkutLrjrEKZYqyy//hmKQczTqMu1
         5EDzYcLiqm8WFfRFCRXCgzxCDUXwZdZmFblE0nhrCQsl5guHqbx9wrV4Zw/jzjMaq7gx
         ex5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LqCr/6g5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u22si494696qtc.218.2017.09.21.09.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Sep 2017 09:35:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LqCr/6g5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dv4RO-0001ZZ-MV
	for alex.bennee@linaro.org; Thu, 21 Sep 2017 12:35:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dv4Q6-0000xS-2I
	for qemu-devel@nongnu.org; Thu, 21 Sep 2017 12:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dv4Q5-0003Qe-An
	for qemu-devel@nongnu.org; Thu, 21 Sep 2017 12:33:46 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:48884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dv4Q5-0003Q8-43
	for qemu-devel@nongnu.org; Thu, 21 Sep 2017 12:33:45 -0400
Received: by mail-wm0-x232.google.com with SMTP id m127so3453047wmm.3
	for <qemu-devel@nongnu.org>; Thu, 21 Sep 2017 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Tq2b8ZaC7/Qll0iFvs6L3oPCkaCT7d6A4kwTmrtJAwQ=;
	b=LqCr/6g5JJnwYEx+WWxwXBUybTFJ+iYRGEfZbC6+DUVLRaBn3iXmbC1M2ebjfBMXhN
	RDv0i/YRQOJoRZGEupU6V2vdvHxNiZUFEkMQnCQQUtGoeswSepwbaI9JY8ubJ/TmBoES
	9A1XLY4hypZ+bUwCLYpVRzsCZGGItQPjMOpGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Tq2b8ZaC7/Qll0iFvs6L3oPCkaCT7d6A4kwTmrtJAwQ=;
	b=VUQlrUnYVU/FalsnGINiX0D5vni451S12qopkAOUIRmj2HH/910rEBgQr08I9Pkjyy
	DmOdGenebOyM3xAeBj1vs54JsQbFXZ1M29XNwjEdP35Ul4O7sTx/pSSKlOvDH4noAwTi
	BB7bEhWATctcO8gJzAhjR55AsI9g5lDG/Jl69p+ZJHyeuU749RgXLfj4qLr7x+tnA7sb
	7h0lTM12ZjBtcm2PQGv7gBsmkCp0v4voz9/C9JMkASXZ0lCtVmjv7AsucJX6erOmK79t
	Aynbl+Ai9542/5UM27TOlViLvELdVC4HDMrAuzQ7bKxKnWzcGgIXPMapCIbJ28sx9zhq
	P5Bg==
X-Gm-Message-State: AHPjjUgw2gXD/CV2Z4NXNVd7Bm6nFWsf7qoTSMYUKJJgJkTW8Eo8xGMp
	i7t+jrD84Nfm4uTzQ9LSpB5PvQMG03jQZvXF/OiVnA==
X-Google-Smtp-Source: AOwi7QBJW1ztQn9v0yjTEqfIowJ4M2ypF88MERoyktUJsbeMm1AAcgR74Mw4MEyrEL8HdIhim8MZjLvTKUqCVCSa6Ic=
X-Received: by 10.28.23.3 with SMTP id 3mr1495552wmx.62.1506011623989; Thu, 21
	Sep 2017 09:33:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 21 Sep 2017 09:33:23 -0700 (PDT)
In-Reply-To: <20170920201737.25723-1-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Sep 2017 17:33:23 +0100
Message-ID: <CAFEAcA_0CHhQwA-zjsEseA8D==iz401G6CrwGoN33Nwp7GV+ew@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-devel] [PATCH v11 0/5] Add support for Smartfusion2 SoC
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
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 79k6/u0ttNcj

On 20 September 2017 at 21:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Hi Peter,
>
> Now than Igor's patch landed, I respin Sundeep's series updating it to wo=
rk
> after the "arm: drop intermediate cpu_model -> cpu type parsing and use c=
pu
> type directly" patch.
>
> v11:
> - msf2-soc.c: add a check for null m3clk
> - msf2-soc.c, msf2-som.c: drop cpu_model to directly use cpu type
>
> --

Applied to target-arm.next.

Thanks to Sundeep for being so patient with our code review process,
and to Philippe and Alistair for doing the review and shepherding
the series through it.

thank
-- PMM
