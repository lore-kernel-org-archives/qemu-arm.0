Received: by 10.25.77.65 with SMTP id a62csp539032lfb;
        Fri, 10 Feb 2017 07:34:38 -0800 (PST)
X-Received: by 10.223.179.15 with SMTP id j15mr7751652wrd.159.1486740878726;
        Fri, 10 Feb 2017 07:34:38 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id 18si1632636wmq.73.2017.02.10.07.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 07:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x230.google.com with SMTP id c85so263448730wmi.1
        for <alex.bennee@linaro.org>; Fri, 10 Feb 2017 07:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0mEZ15XhK74Q78NAQz8UYYGojDe4QQukTRk4d3GJVaw=;
        b=Y4eL1nFqKHlPYsWLqdJ0DYXNW6dTsiM2GBupjNw49jYLRpv4EsdOPDWgE62qVOPz8K
         RP7LIrJqijxZgy97ZJsQIbzh/H4bhrAobsjUGZ8wDdNxQSLWZWLVaJGFhjKyonOnk/xd
         et5xid7xi5K23JDqt7Fh2OQ6Vhi8iDrTWx6eU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0mEZ15XhK74Q78NAQz8UYYGojDe4QQukTRk4d3GJVaw=;
        b=Xgvg/lQ9FvqEKwSMAf4IBKeeVo1eMuKlOtyksp78LD+E/8lXPz3m770EX1TjWTgZpi
         MUkRCHRHhA0cbP/e1UH+nLeqYomSE8ZqJZqRRTPUH7lILuwysxFGZAnMDC0LC2eDkmQh
         zjAhc6g6B1BQM+eAuFHCVKCC1m7ls4bDgUHOQMfUP3rF8Oi/XhRAurRB4X9qJzJFh1+z
         zaoSrUlnpvA3JKprjn8ckS52uqMtyPEl8m9nJnuRE+f1mDLrgo4i0VZs0kufYTxmke67
         xyuPpT5VaGsEAJH9OOjA6DbPg01QSEaR5QtVYPMPE4LnfTKhy0OTvI3S9GsxIOWmmKHf
         a0bQ==
X-Gm-Message-State: AMke39mHjHEv9SklhQrlIJ2u8MmIrbQ2rjBR1c8HHTBqjwjnGo/dH2LqCeQmpo6/LYaw9h57ndyVpGGfRGMg/jFoURs=
X-Received: by 10.28.91.16 with SMTP id p16mr7810234wmb.111.1486740878382;
 Fri, 10 Feb 2017 07:34:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 07:34:17 -0800 (PST)
In-Reply-To: <87tw82vzt6.fsf@linaro.org>
References: <20170209170904.5713-1-alex.bennee@linaro.org> <20170209170904.5713-24-alex.bennee@linaro.org>
 <CAFEAcA8_UNip6QooREop-T5RBpdo1me0piEAscJRC+G7tGcNrA@mail.gmail.com> <87tw82vzt6.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 15:34:17 +0000
Message-ID: <CAFEAcA-cwEAEq_upkAF49S7cbN43a7PPgs733DXD-Kykz--CUQ@mail.gmail.com>
Subject: Re: [PATCH v11 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR
 reset bits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
	"open list:i.MX31" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: X5UQYWYxZwUL

On 10 February 2017 at 15:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> I guess a malloc-and-free is OK since the guest isn't going to be
>> bouncing CPUs through reset very often, though it's a bit ugly to
>> see in device code.
>
> Previous patches had expanded the run_on_cpu code to have things like
> CPUState and a single field to avoid malloc where we can. However I need
> the IMX6SRCState and I don't know if I can get that in the work
> function. Will there only ever be one on the system?

In practice there will be only one but I don't think we should
rely on that. malloc/free is probably better than overly
convoluted code at this point.

thanks
-- PMM
