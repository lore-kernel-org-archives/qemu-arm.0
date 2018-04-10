Received: by 10.28.71.155 with SMTP id m27csp3446761wmi;
        Tue, 10 Apr 2018 00:39:00 -0700 (PDT)
X-Received: by 2002:a9d:3c55:: with SMTP id j21-v6mr23879130ote.51.1523345940493;
        Tue, 10 Apr 2018 00:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523345940; cv=none;
        d=google.com; s=arc-20160816;
        b=ZigXSt8OFHubEOvfEXlURQiU/m/Q3XgeceL2iwKdlXOPesIDMybRJh1FhVbW93mUcU
         /klsmz68XvmUyxUTNBhfwaeZK6ruff2E2NU+43Wk1Uk5zQ5rTwjhil8+aJLXnzByXjEz
         8HOG3QnEESKVxHKO5w+QKgoQqCq0zHlZrtQGxnMVBmzuzpt+XOD1Cbz0epyjSZ3w5BIz
         SJR/Hcl2jNFFkF2qc9QIE9vczPS5QWQ1tGyU4drkp87h3bLk8QX7m1AScgprPEqgG0J5
         fA2m5O57afJhjDCIK8UknbzNkeBktq0kovtfHg4ppX/nchwcrzM9cno5DLHv7lpo/EbK
         vEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=I6rshycfHpf9bNbd5je2kjWJBhekE7to/3tXkPa6r9I=;
        b=UiXZ2G03HrdF9ee7nrze3hqebmF9tbiEabvoNHA4yRglUoVOtsYQatj1CXnh0PXnxv
         yWqw/VdFwI+FRf7ePkNNNs5sP/yXz04Bno/myiCCbUCELBgxZpncJTdla51jUguenqaK
         JFWVdDlP+ptxreimCdvbdk4dxG5sT7S99GA+HOyaEgmhzuFoLgayCFXRMKNsgMBAz9Ns
         qH2wzNn3UHtUZYpxjNWdyl5D+Ymoq06DIM+v4sGbbmnvC/wEoMXA6GyRvQBT4zqDh5bJ
         NhkoEuUtGemckBDy9o/vTl+bE5Sc8ams8mhynXEFigzbuvW6yKbsoTqf6qLH7ZZVPk1i
         pRkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFB9NYe2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r67-v6sor1017394oih.119.2018.04.10.00.39.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Apr 2018 00:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFB9NYe2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=I6rshycfHpf9bNbd5je2kjWJBhekE7to/3tXkPa6r9I=;
        b=YFB9NYe2prqaygkUglyf4YtmWrORoyuJDhpRM+gnzf1u6AbSW3vjMJ0R/JWqZDG4f/
         dw//SxesqW9hwKGJ+wgsGln4YLGs3HzuJerGZ8vdi3Nl73GbngSWrIDrXGjXnWPkzhWi
         8NDElvIJBXNDz9V/0jCp07qTDJ8YQ5xgxPd9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=I6rshycfHpf9bNbd5je2kjWJBhekE7to/3tXkPa6r9I=;
        b=rwQTfh9qzGg13SEG7HB6aPJWT8FMcGVmdNoOSwffxoeDLKG6onuDfNDLXhEPNehLjC
         fWxUhRvBryZE611uwjENCOw6dEVd9Ovr1PJG6UQ+C8l7co2jK1h0Mr5vclWGq+TTNG85
         wQVk7WqXUQzfC32Y4BufqCT26a1/Yojle7j1ZuvswvxPnJynqkgtlRwOKOcW5m6QJ8q2
         BPR6930sUb0pAEn2znlJFe83ipG1oIMIVB9i/5lnpQ1NSa2uxW5r5FWDt3zTjK0MQaXE
         8wmmXrdHdh8O2Em3+bjEhT8j8ulHRjY0KE6L0CBNwVSYMAOtAPk2NzM87/8T14TZaz1j
         XojA==
X-Gm-Message-State: ALQs6tBkrUQsGNnn/8UgzERiHZQbFdGYjEgheA4FWOv7wDyJkeu7/OZb
	JMnEMyALKFIX3LQ+h265XDIMEKFHJO90CbmI+ZKStwWU
X-Google-Smtp-Source: AIpwx4/ZwJLEMtbevuAn8xv1IaYDLePFKZsarkwCwQpbMEfZ3HKwQ+07hv2/SLYEak/YvwSwaY4yKb+2BQW6MaBlgLw=
X-Received: by 2002:aca:1c7:: with SMTP id 190-v6mr1383385oib.80.1523345939845;
 Tue, 10 Apr 2018 00:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Tue, 10 Apr 2018 00:38:39
 -0700 (PDT)
In-Reply-To: <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
References: <CAHP4M8VnuS5KijfVw9eDz41KPwaT4rJ+4VEU==EbBgdwgFKJhA@mail.gmail.com>
 <87efjov999.fsf@linaro.org> <CAHP4M8W-WuBmJUdb6LGR1t3tPayrnaS+b1ZZ1zew71aM==-imA@mail.gmail.com>
 <87d0z8v78e.fsf@linaro.org> <CAHP4M8VSzm4L6oS06J-e93FwjuHM=weJf2MegCaDNH8MPbsqgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Apr 2018 08:38:39 +0100
Message-ID: <CAFEAcA91iNyUnahri9EdL7Th1Q9v44765z0OJexxMrNUD_DXEQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] Crash when running hello-world unikernel
 for ARM
To: Ajay Garg <ajaygargnsit@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	rumpkernel-users@freelists.org, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iQtSNyGACp+h

On 10 April 2018 at 05:14, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> Thanks Alex for the reply ..
>
>>
>> Can you run under -s -S and gdb step the *guest* and see where it ends
>> up. The above error is usually indicative of the guest going off into
>> the weeds somewhere because the hardware isn't what it expects.
>>
>
> So, after your reply that it might be because of the
> hardware-mismatch, I kinda took a detour, and installed a arm32 "virt"
> machine on qemu on a x86_64 host, as per the steps at
> https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/
>
> All went fine, and then I compiled rumprun on this "virt" guest.

The host system hardware doesn't matter (except that if you're
running suitable matching host and guest hardware you might be
able to use hardware acceleration with KVM, but for the moment
I would recommend concentrating on getting it working). What
matters is that the guest software you run must match the
hardware that you are asking QEMU to emulate. (I guess if
rumprun automatically configures itself based on the system
you're compiling it on then you're running a different binary,
but surely it has a setup for manually configuring it when you're
cross-compiling it?)

What hardware (what CPU, board, etc) is this "rumprun" software
expecting to run on?

(The "Trying to execute code outside RAM or ROM at 0x00100000"
symptoms very frequently mean "guest binary was not built
to run on this emulated hardware".)

thanks
-- PMM
