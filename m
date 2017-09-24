Received: by 10.223.172.38 with SMTP id v35csp1895366wrc;
        Sun, 24 Sep 2017 16:40:36 -0700 (PDT)
X-Received: by 10.55.110.132 with SMTP id j126mr8276067qkc.104.1506296436542;
        Sun, 24 Sep 2017 16:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506296436; cv=none;
        d=google.com; s=arc-20160816;
        b=nHFlihkMw9Imy5738eIE3D3+dt4CkJKvoLozJXBRGApVkn8hGFLRSYCJqoZYMwTxt9
         qL2QLET1jXDHqN4wpULWClMUj2JoE4QtD6tsbsNvct7qAuBlnjFX9X8Xn9BrqPcR9A2t
         bYw4RZJcaWVlOOyQ37TNNFMkMNYQhSfSB0e/8jCBFb7LnbE/hBk3JxuS5iSU/oRhjeYA
         ccvSZShcubMPDx/1O8FkM2FUwu/FWguKUg+gA+wuEGCijn+VbTRbAPoNqS94TGyYlg9X
         uwH5QfvxKBSa5Ztqjh1CiEYxriRukm31DFHFfPrKUhorTSnKi8Gai04P1XykWeaWY+np
         pkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=O1EE780WKec1fBMN0EC+zf/FTg5HbOW/S02Y6iYDqwY=;
        b=PeDFKH6ydGMgl7GHlfuocbA1fpdmXdOncAyBFdIrvE5ZUzd/jIWq5dAkOMOAxPNfmS
         VV64Mx1wm0hWJv8ZuEskZn2rjLzTHZA6nnyBJII6h6WhsoM/X2es5pNvOAZSp99kkJnM
         bYQq+SMgtPXbcAlCNBq6VMVjL1OyePVirrnqk02thJ2O0ESy6UlXMw5ZbhMDN02AuKDF
         KjcD7sSN0097mTGzwW+brJPvXlWjbu+gatT9hs21t3j26Q8GRhtEUO4uRaZTHynoojN6
         3pNdw+m73/RdFF+yj+44XX8os+Cta1ai6Ycghg3QxG24v45orZ1utVD4/e1Moz7cpoH1
         oZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=IjyMVv0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q85si713804qkh.186.2017.09.24.16.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Sep 2017 16:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=IjyMVv0B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dwGVm-0004Dq-BO
	for alex.bennee@linaro.org; Sun, 24 Sep 2017 19:40:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dwGUm-0003o1-Pr
	for qemu-devel@nongnu.org; Sun, 24 Sep 2017 19:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dwGUl-0003bd-El
	for qemu-devel@nongnu.org; Sun, 24 Sep 2017 19:39:32 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:43015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dwGUl-0003b0-92; Sun, 24 Sep 2017 19:39:31 -0400
Received: by mail-ua0-x232.google.com with SMTP id f44so3363104uaa.0;
	Sun, 24 Sep 2017 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h8F5qvbOXF6zfTSe4DYeglFkvw1xyONGNHPlpNy0SSU=;
	b=IjyMVv0BhZG3t8AK3EdkwqajYQX62PbL11r6mR/HWufHhOzWOsq1SUSJGl0Bvq72L9
	ZRgnpNrOE5hOljDfIC8DlsiyFl683bCsQYYOacPb476fkvks2FVnnJeyLUmPB347R1dT
	Ia1teI8JGOrAOhKpvhPxNG5bd8vpwqtQwEpbgpDS88EuNg55wKK3JxdoHIYQw0lEI3CH
	9HS+mvizfhjzN6x9MoVKSmO1l7Kg3sF3zKGKmKGTdcYDVxTACXHU+VL2WQjmkzmjhXtc
	CqM91nGI30zQkDGxOu0e5gVOPWolwq+p5tRBa1Fur3FSKDtljRd2jj13RLcgw1sqrWu/
	Zmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h8F5qvbOXF6zfTSe4DYeglFkvw1xyONGNHPlpNy0SSU=;
	b=L5KUgzAPghsCV5p0//rSO/R60d33dNSpwQEEEDY/W3uHa00joDab3+nlbRIpP8swCA
	S0f+r5dJLlSqpMc4xhC4IhZa4LnjOl5DN0DMV5dHFkv/x50w/tolUziBz/RrerxaaNL8
	4k+HDYD037LWFn7ZUQLokrxhoWbrwyyM2N+4Vctwx5Wx8q0um6yliPhPahNe3oiPjN8t
	h2ODhhIJTUKNbh+B4m8WGBiooY88kCcukYmftI/BSREZnz41friWoWRz0/fkp9Uv+uH2
	Fofp5lNLKE+9XRfBXk/S05T4FauLJuWOdD6D7upHPvmJVfy1VDLTWbamt8jkHKjY2UlF
	wn4g==
X-Gm-Message-State: AHPjjUia9JgxTCMsberiAZ6X5VFGrswXQmkJGmwO7VnSIi0Vj04kdfyS
	94OKi2Vvwm5vkZUgifYUyactn2d8j4pPdx5wRnI=
X-Google-Smtp-Source: AOwi7QAtojteFddrPI55OR3Qgbp7WXTgCVadKDzpHTJEsGss2U/+0K7WMX7xFpDukCiXCTEXjmO1dqUnsznb1/1w0Nc=
X-Received: by 10.176.26.159 with SMTP id j31mr5675471uai.25.1506296369131;
	Sun, 24 Sep 2017 16:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Sun, 24 Sep 2017 16:39:28 -0700 (PDT)
In-Reply-To: <CAFEAcA_0CHhQwA-zjsEseA8D==iz401G6CrwGoN33Nwp7GV+ew@mail.gmail.com>
References: <20170920201737.25723-1-f4bug@amsat.org>
	<CAFEAcA_0CHhQwA-zjsEseA8D==iz401G6CrwGoN33Nwp7GV+ew@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 25 Sep 2017 05:09:28 +0530
Message-ID: <CALHRZupWabascx0jJ0wJyotcaK0_KHthEvu80kpzcPFSOK_iiA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::232
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 30iAAUAKdY/y

Thanks Peter, Philippe and Alistair :)
Sundeep

On Thu, Sep 21, 2017 at 10:03 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 20 September 2017 at 21:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
> > Hi Peter,
> >
> > Now than Igor's patch landed, I respin Sundeep's series updating it to
> work
> > after the "arm: drop intermediate cpu_model -> cpu type parsing and use
> cpu
> > type directly" patch.
> >
> > v11:
> > - msf2-soc.c: add a check for null m3clk
> > - msf2-soc.c, msf2-som.c: drop cpu_model to directly use cpu type
> >
> > --
>
> Applied to target-arm.next.
>
> Thanks to Sundeep for being so patient with our code review process,
> and to Philippe and Alistair for doing the review and shepherding
> the series through it.
>
> thank
> -- PMM
>
