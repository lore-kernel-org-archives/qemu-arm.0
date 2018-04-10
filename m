Received: by 10.28.71.155 with SMTP id m27csp3299431wmi;
        Mon, 9 Apr 2018 21:14:05 -0700 (PDT)
X-Received: by 10.46.21.86 with SMTP id 22mr1505802ljv.111.1523333645136;
        Mon, 09 Apr 2018 21:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523333645; cv=none;
        d=google.com; s=arc-20160816;
        b=TXELe9eflcblUwuxX0ZRHp0dYUAt03H0C79IZtsXQPwoMYRC/e2Mkg0zZCIPLkZTTy
         KYrxFyTY8+fBeyjMFiRr2eUEpqAgHQ+6ByBJTSkLOnE0TC55vsUEi7pzb5L9zN+JjbpQ
         Y8zcu67JZcLUIlWK/+dY70O/x3oVG45XpHCoxEjqoZHi8Uoxny36M1kES1v+G6Y610py
         Y25OgFgCsZ1wwsxCBFP5wi0fldWjHe9V68GRkx4jA/93SF6r5CbRGzsflk8DYjZxNuGB
         CkYgYJDjv13V/Q50uMsrjzvxgRvNSJcBa46MsWDn9mY8ONQgNFDM1CprJCp/UMudDW8X
         7M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ka9SI43pIJAac9nJIbKePCed6JrizCAFduYcOfHP6iA=;
        b=e4iL/gdTmtdUKzeSwu7CEzY/WNvqgz9QX+1lnXtzlRFOGFP9ZgFFLWkiuNKvc4Xswu
         CQSi84WHIf8ZfmiS07Uscgqlss1PnJfheiQ4GZptL8Q5eZaiGNKkC7iYrm9yg7yjj0WA
         B2Mj4QZiBMmuRGfUyhh74UlUyk8fo0ZpsJWt8He3BROjomVAnffrV3Mjqq1wzNWM+igk
         k1d0WnmqgbX/36VU7K0ugq7Y6RoB05xWnu/ivpt9kJZQdYJUJjQA5mtZylO+7ks6ctbi
         p9mRBlXWOXWbL5ufU78qdeC7tSvXgIoXB3P9QejgTOy3xGUoSiQzYIxHt6fr28Lhuc62
         Y9dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jd/uHlTv;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <ajaygargnsit@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k1sor478783ljj.38.2018.04.09.21.14.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Apr 2018 21:14:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jd/uHlTv;
       spf=pass (google.com: domain of ajaygargnsit@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ajaygargnsit@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ka9SI43pIJAac9nJIbKePCed6JrizCAFduYcOfHP6iA=;
        b=Jd/uHlTvAdJjDxITmAaPttOLoaLXeBbHpiTXE243s06aCvSGuAuGan0CWI41FZqvIY
         DRWfPx/y+zFXBZXb9F0Gzudn+4ib4JWuKshOYRE0m3rQH/IMdIZHQLPBOT2X2ersqhEI
         dke677O0KG8Dw6lYzjTgep3CWZZpMbydQHKHay39/ndkzirO1BkeSdLdZYM+olnLbS2o
         8XLQ8QNIqRljf2W7h1A3DDVs6N5xq1gsSN+3lyb1fmS7ajl9Bh9PQpOwasqLaH3boZFJ
         x750XeU9oJs3RXwyhX+Zldp0iogLcABzHOnUzK5J8CMtc2rDJq2tZf1Niik+pViqQa+R
         3Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ka9SI43pIJAac9nJIbKePCed6JrizCAFduYcOfHP6iA=;
        b=B1sFxR0lHDL9PdUipqaEbXsxXbK1B0HUIMudZqO1m2DQl8e0bhUZ1sWuhCPM2CnAl6
         80URTto45hrGjwJ1bcTCUmPXrl7deA9NbvvS8HMF7iS/rRIbv25/trZQgpCofeD5hFGa
         zPTs6ek2TRd5fCGMlIFvebAmOPL4dYRt8wC+Xyq7UBROhVJ95luAu5ja6i2zIqpPEXOU
         tjBADW7DT4UMd1wx2bcU++GpSFQyMszKqZzVR+DR03/f7cVJo3dC6kRGkwr/X2Fai2gS
         vEN+r6tAsqjvB+TZjGXzUsuueTj+vYmo/WIv/CHCnRC2BAHsJZn+/Yp+YEIpI8l/lEJq
         tPWg==
X-Gm-Message-State: ALQs6tBASxOmAGFyYXXOyY2CCqfYlSCQx0ZLTysTeNcEhw4OVBiQMgrb
	PCosiNn+xld8cSdE510eZRCV/xasWRB93kDLSwNwIA==
X-Google-Smtp-Source: AIpwx48sB7+70HBVU018kjnf8W3ZYZG0J1RO/Zm+VT7f/ubpweY5lNmA00Mjzdvt6OfHGJpQZydFJyBgcOVQ/BTcDRQ=
X-Received: by 10.46.41.156 with SMTP id p28mr24189306ljp.32.1523333644634;
 Mon, 09 Apr 2018 21:14:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP; Mon, 9 Apr 2018 21:14:04 -0700 (PDT)
In-Reply-To: <87d0z8v78e.fsf@linaro.org>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Tue, 10 Apr 2018 09:44:04 +0530
Message-ID: <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
Subject: Re: [Qemu-devel] Crash when running hello-world unikernel for ARM
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	rumpkernel-users@freelists.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: x9WXcpfuWoTu

Thanks Alex for the reply ..

>
> Can you run under -s -S and gdb step the *guest* and see where it ends
> up. The above error is usually indicative of the guest going off into
> the weeds somewhere because the hardware isn't what it expects.
>

So, after your reply that it might be because of the
hardware-mismatch, I kinda took a detour, and installed a arm32 "virt"
machine on qemu on a x86_64 host, as per the steps at
https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/

All went fine, and then I compiled rumprun on this "virt" guest.
Finally, upon running, I now get this :

##########################################################################################
ajay@debian:~/rumprun-arm32$ qemu-system-arm -machine virt -nographic
-kernel helloer.bin
qemu: fatal: Trying to execute code outside RAM or ROM at 0x00100000

R00=00000000 R01=00000000 R02=00000000 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=00000000 R14=00000000 R15=00100000
PSR=400001d3 -Z-- A svc32
s00=00000000 s01=00000000 d00=0000000000000000
s02=00000000 s03=00000000 d01=0000000000000000
s04=00000000 s05=00000000 d02=0000000000000000
s06=00000000 s07=00000000 d03=0000000000000000
s08=00000000 s09=00000000 d04=0000000000000000
s10=00000000 s11=00000000 d05=0000000000000000
s12=00000000 s13=00000000 d06=0000000000000000
s14=00000000 s15=00000000 d07=0000000000000000
s16=00000000 s17=00000000 d08=0000000000000000
s18=00000000 s19=00000000 d09=0000000000000000
s20=00000000 s21=00000000 d10=0000000000000000
s22=00000000 s23=00000000 d11=0000000000000000
s24=00000000 s25=00000000 d12=0000000000000000
s26=00000000 s27=00000000 d13=0000000000000000
s28=00000000 s29=00000000 d14=0000000000000000
s30=00000000 s31=00000000 d15=0000000000000000
s32=00000000 s33=00000000 d16=0000000000000000
s34=00000000 s35=00000000 d17=0000000000000000
s36=00000000 s37=00000000 d18=0000000000000000
s38=00000000 s39=00000000 d19=0000000000000000
s40=00000000 s41=00000000 d20=0000000000000000
s42=00000000 s43=00000000 d21=0000000000000000
s44=00000000 s45=00000000 d22=0000000000000000
s46=00000000 s47=00000000 d23=0000000000000000
s48=00000000 s49=00000000 d24=0000000000000000
s50=00000000 s51=00000000 d25=0000000000000000
s52=00000000 s53=00000000 d26=0000000000000000
s54=00000000 s55=00000000 d27=0000000000000000
s56=00000000 s57=00000000 d28=0000000000000000
s58=00000000 s59=00000000 d29=0000000000000000
s60=00000000 s61=00000000 d30=0000000000000000
s62=00000000 s63=00000000 d31=0000000000000000
FPSCR: 00000000
Aborted
##########################################################################################


Additionally, I compiled rumprun on a beaglebone-green-wireless (arm32
machine), and did the same test.
(Fortunately), I got the exact same stacktrace as above, so I guess
it's no more  an issue with hardware-mismatch now ..

Not sure if this is an issue with qemu now, or rumprun ...


Thanks and Regards,
Ajay
