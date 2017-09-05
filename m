Received: by 10.223.172.38 with SMTP id v35csp1661385wrc;
        Tue, 5 Sep 2017 10:10:06 -0700 (PDT)
X-Received: by 10.237.40.99 with SMTP id r90mr6675587qtd.222.1504631406173;
        Tue, 05 Sep 2017 10:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504631406; cv=none;
        d=google.com; s=arc-20160816;
        b=LC+NLx7WU1Q/+IkGh6jDnMwa7jcWprrgm7ZPE+pFf4/gSgjyGUCUAEPekKkSdQsEZT
         kr468MEDJH5Y0cb6UeCNDUqy5tsbwc+agoU9m46cYTk3o1ALLuPiYCMZt9a7xnfHOe99
         qVf6YjDBH3VKPLBWe8CIuWlgckqjPwyav5dxgrn05brOTLzwaj8IAYANd6dbbRb6ETUS
         A3LqwEzZcENd5cSpJLMI1ejtfsNStrG5PfGdT/lKDuF1Fo6l3PWLXiVm5k5XY7we2aHs
         RBOc8tavdaEu90zusrPPBUnQsLtCX13rTVkTvDd6vYU9FgpU8rCewX8Y7tECnwdm+wBB
         u1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=NbYRKXGSRdPcVaOVJDn9tbrS1ibuxTv2zG6CUm5wdWk=;
        b=WUV7ocDk4shyiZNM8GDMTRq1QCDoeGH4bwsZKvWCSjgKzfMedXFCtCr0LUNnrQ9EtA
         MXiW4BU84jrrLVgY6wH3DfAc6x6/WceAuO+UcoK40Wx+th1cGDJ3YDi7xvGRXNyHX2Vg
         yZAjiZnh2lpXtQTmBxKzN0IenwyGQp3fpoq9UZstyIldz98SG+B7hs8giyU/0d/FY/MM
         4N+q5IUtQzeRdqOPyXreylc7kJRWdo0v1LrRKrts0IBeH3v5uKMVWyjUIKndFKzHd6yG
         B118n3crCc9i1yOkP1eQeycicXYsu6MV95x1xSaf96TpPkki3gxw+IQuKddje9tGgbsI
         0i5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LAXThfvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si889734qkf.94.2017.09.05.10.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 10:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LAXThfvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpHMR-0002cc-S3
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 13:10:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpHMD-0002YL-0x
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 13:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpHM8-00014N-6V
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 13:09:48 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:34922)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpHM7-00013M-Uy
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 13:09:44 -0400
Received: by mail-wm0-x22d.google.com with SMTP id f199so1750918wme.0
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NbYRKXGSRdPcVaOVJDn9tbrS1ibuxTv2zG6CUm5wdWk=;
	b=LAXThfvHXWV9xktopn+VELTjrpZDMD3QAXrnyqpP8FLmp0czyOf3XvDIX30rXte9J7
	B3lSuHyHnRkCYEkSc66j8V5nAM5PK85lnHK0YTbVKfbNIvrJbHCO+xwbzSptE4LV8mGV
	83ulL3mTEFSD5aIJLAY4adbgjF+iqC/9KArcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NbYRKXGSRdPcVaOVJDn9tbrS1ibuxTv2zG6CUm5wdWk=;
	b=JyjQCUb58OAeTmqv0s+i6AYCq7FA6x4kP5rlQi6fnpAuYnSoh7jEJc6P88YYZkXTgr
	p+2mWCED4BCnnNKn4SzH1tPSdnYlNrLyLXRyyy/F8Ouye94UX4FSejeZENcSuD0eIazr
	TBaCRFmnlRD03scdYthjoxAbpTRJyDTuMeWnGLpGz1+K50BULyvpkKStB8ssBEw3EN2y
	1zZKwbQQ3wZ8RqtDqpM6CDtF88F4TT4vMjmJCogRytq6q+6sw2i7OIFx8TDuPBAXwDZk
	LEaxWMkLA8qZO3kG+vMeLrbmAXxJO8tINilnVghOh5XzMXpJ73pnHGDUgxGwNvVz9kff
	0U2Q==
X-Gm-Message-State: AHPjjUhLaEQhcPlsvkoWdvqBJYtJM3DQc2ATn/9czHaFwwMmpkftyLLg
	5kZQdnLZG0JxBsWzL+3v+gbKewKqzRNv
X-Google-Smtp-Source: ADKCNb7Wy4VTl/fSntZWannVBPg77rBtMUKn/woUyX6SeGs85hJjzvTFhu2ueKTl5CGZMfb2cde2xqnZ6oEWCwawX4U=
X-Received: by 10.28.58.199 with SMTP id h190mr2473882wma.82.1504631382931;
	Tue, 05 Sep 2017 10:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 10:09:22 -0700 (PDT)
In-Reply-To: <d80ba882-c00a-f10b-b8bc-8f6383e8cb74@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
	<b59d3474-15e4-7f01-d4d7-8ca0fcfef6b5@linaro.org>
	<CAFEAcA_F-oRO0vT4d62G1vat9o0o9exPKfEXw_BykXnXZJEYgQ@mail.gmail.com>
	<d80ba882-c00a-f10b-b8bc-8f6383e8cb74@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 18:09:22 +0100
Message-ID: <CAFEAcA-dc7fmyTqsSswOgDj0kQ6BT5FLb4nz10MDibP6KYJAqw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS
 region
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHujlW2vbn04

On 5 September 2017 at 17:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 09/05/2017 09:26 AM, Peter Maydell wrote:
>> We don't map the hole. The container is 0x21000 in size, the normal
>> nvic_sysregs region is 0x1000 at offset 0x0 (which will be 0xe000e000
>> in the system address space), and the NS alias region
>> is 0x1000 at offset 0x20000 (0xe002e000 in the system address space).
>> There's nothing mapped in the hole in the container, so accesses
>> there will busfault, as they will for other PPB accesses before or
>> after the SCSes.
>
> Ok, it's not wrong, but I still don't understand the need for the container.

It lets us assemble all the parts of this bit of the address space --
SCS, systick (which sits on top of some of the SCS), NS SCS --
in the right place, rather than requiring any caller that wants
to instantiate an NVIC to do it (and to check whether the cpu
has the security extension to figure out whether the NS alias
exists, and so on).

Now that we've QOMified hw/arm/armv7m.c it's less important that
the NVIC in particular does that, and it's partly historical legacy
that most of this is done in the NVIC realize function rather than
in armv7m_instance_init() (we used to implement systick directly
in the NVIC source file rather than as its own device). It doesn't
seem worth shuffling the code around now, though (the container
already existed prior to this patch, we're just making it a bit
bigger and adding another thing to it.)

thanks
-- PMM
