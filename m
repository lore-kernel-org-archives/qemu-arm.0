Received: by 10.25.77.65 with SMTP id a62csp560192lfb;
        Fri, 3 Feb 2017 03:17:49 -0800 (PST)
X-Received: by 10.28.69.28 with SMTP id s28mr897787wma.40.1486120669053;
        Fri, 03 Feb 2017 03:17:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id w2si1850541wmb.90.2017.02.03.03.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x232.google.com with SMTP id c85so23577206wmi.1
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2fAUVxi3ZEW1YTUWrsMJHyem84/9hL5k/YuqM/5suaw=;
        b=D5T/6JJl2T97U1mvszMNYW4jp5a48e3P4jc83WuH6UXnAbf6+y71wUt+Uo/u124aXK
         WC6uM+5gf9n16dsTNAy56UK+1o7a9VrC7RAkEe73PuvgxZEGG7vkPvIIqpbxW1SDiC/1
         FOusHjCiMtNDuRJTsM2nI49VOh0LREipptt5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2fAUVxi3ZEW1YTUWrsMJHyem84/9hL5k/YuqM/5suaw=;
        b=qabIiROJmtvsirdHpD6ILwVnGhEo39J8uLamf0d5TITFQZ2MJVhmVWS6XwvKh5SRr/
         druH1MOxaoXwRrH2Wc3eBhnmUSHPaZeJFI2nfu+k3YA3kBlzcQ7tfkEtWo84cIAEKskO
         ER4D7scmwcfkGwucz39XqdGY6MYQsZ/A9++yiOjYfAVtxH4PFKqX5Caw1JPyuBz6hBlG
         uOK6hNplXkrxcSs29v7oFw9BkiwxaWwPuURC2NvqnyTwDUBQKALtlDmxvII1EFUooaGT
         pweONq/H5lc5zQsO19ou/ui5KcpiyeZ9c6yCM8r7j8D3GdTxp1WgMMpfEbgsI3AEEkwl
         Z6ag==
X-Gm-Message-State: AMke39nlOP8V6FPu0wxnWkpG04GDgKIVOa1Im0WHsXnFn++8JCCMp2bwaYsxexN3DArsIu25XBUIauGTvPHA8qweZS4=
X-Received: by 10.28.55.199 with SMTP id e190mr888418wma.92.1486120668681;
 Fri, 03 Feb 2017 03:17:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:17:28 -0800 (PST)
In-Reply-To: <20170201150553.9381-22-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-22-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:17:28 +0000
Message-ID: <CAFEAcA_TviTHP-WkppW342wSHRMHX8P9wqGd1UA6bdLG6n8_oQ@mail.gmail.com>
Subject: Re: [PATCH v9 21/25] target-arm: don't generate WFE/YIELD calls for MTTCG
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: F0KJxbwTC6Uo

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> The WFE and YIELD instructions are really only hints and in TCG's case
> they were useful to move the scheduling on from one vCPU to the next. In
> the parallel context (MTTCG) this just causes an unnecessary cpu_exit
> and contention of the BQL.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>  target/arm/op_helper.c     |  7 +++++++
>  target/arm/translate-a64.c |  8 ++++++--
>  target/arm/translate.c     | 20 ++++++++++++++++----
>  3 files changed, 29 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I'm not much of a fan of yet another global variable :-(

thanks
-- PMM
