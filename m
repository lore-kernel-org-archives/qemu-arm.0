Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1513606lfc;
        Mon, 9 Mar 2020 12:43:08 -0700 (PDT)
X-Received: by 2002:a9d:6c58:: with SMTP id g24mr4163935otq.106.1583782988257;
        Mon, 09 Mar 2020 12:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583782988; cv=none;
        d=google.com; s=arc-20160816;
        b=U0TZW7GAWRP5vr0U5ytDfS5KEqSgGxgK8Ea0t+QmBiyBpIgcrmvqQwCRJjXaWHbh3G
         zEtcEBPMmOVWEHH7/66keJdVFr/93rtDOsrglWNphp53obfpJJ0wuBApW1kl4vHIiCLb
         1f6pAi4S/sPas9XOuUnH6v1guMRjAOInMyvIJZHA03QyIlS4chVTXB7k3chpw95PO2tV
         TCgxg2MV8qS+TJ5wbzapFiDG+zSKNpEcb1To5fM81buSjx6edi9CymQONRxWL5z+ASjA
         Z3fRaNJrjvcsDHNrudAgsxOXFSHiCJauhUvnCBi3ElrZHaQsa3j8CzubkKGQveUEKfY+
         exMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Q0CdpBdOvt1w8ablW8lhzSlbAov/4auH4UW9T9m4ak=;
        b=lpBxXdMROUD6mvpax2sV7v//F4g9KnGqU5bg2B7jQbrqoiqgSEM/98bi9tW1IJY/pW
         YIRP/ipteQ8Ih41lBvKUaQtooicSDTm4qLZYrr1Dem3fAPkpbITKFR+G3yLAQIJdbnr3
         IW0XyWHdHH4vTun7FktkdWPf145ED32phUO7OBfLR4X6KEgP84tcVaEqeLjrdF+u6XzJ
         VLeTloLVqjgW9fGdAwTF9XfBQVWU1VCryZHxysi9Vi9ra+qWsgBwX/vA8YlRdLj6qTag
         IeupXP/0NkpVFvE7lplWct8cwnl67Kbde1Y6yE11U5wI4ap5XCxQgbsbz45zbdaJi325
         y0HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/N/zE7S";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t7sor575106otp.180.2020.03.09.12.43.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Mar 2020 12:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t/N/zE7S";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Q0CdpBdOvt1w8ablW8lhzSlbAov/4auH4UW9T9m4ak=;
        b=t/N/zE7SlQPXnGOdhKyQB+/LdXTQwRL3DAyug0JEi8pdjlA/MRIYf5MW/87T7YviBC
         X+jRlSICqIe//5p9WAcxpF3BhBY7p9A/E5gaco9niKqniURmfDsEdaTy8kqxeHR+DApv
         PNc6mLjlVLOmGtmyFk/Vgy3JtVd2yrcH7QfZCG3r/u4S2lr+i9SR8HAkVAOGIVs30n2B
         /z5UAWClRjBoGkMRzSbKOY9LAQZwkkl+6Zlx2KwZ/GtE9C28dJX9UCNtakzwa9p0Gs9U
         CQxKO3G2jqsFIAfXVp5JY42pEw6ofhUTtP1oIM/rtcecmTihMVehhRCNr6hEGgOW3xLV
         iRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Q0CdpBdOvt1w8ablW8lhzSlbAov/4auH4UW9T9m4ak=;
        b=cjyDjjumiD4CKGnS1WPLi6yd4Ge/6uKqfZpOJ+Sc5tE5GazjcvcoW7QhMqtKs5rVzX
         pRNs5TIX4PDuLmZ5rOJQaztN4nAoCZVcmoZyRQUvWekLAWUu3bzirljOKK6RgQLpb4w6
         HC6eZy5v1yycsHo7RZB1MI/Bh40gBPyBiyqonkIcqFhdeozGpdRoKFQmgLsln9Lv84qI
         JSZS+jjKQkA2IbOz/MjP/VZdvqWz5yX2quU4VzrcKHw7nMuReYX1eqqa5CqBwH5V5+Ik
         qUtqZASSOC8utruBYgTkY4lhyKofSL34wyDWvn2KFOuqjQgS0nwQX/P2v08CLCDNOZ02
         F0kg==
X-Gm-Message-State: ANhLgQ0wqVd+jMuErnmAU2iH5wjW4JZ7asEGTxXThNlWHAXKnq2FMldR
	F+iJc3m6nVzr3gt0j/C3EEHeO0K/tB6DYcoK5BG+53sO
X-Google-Smtp-Source: ADFU+vsTeO4teS062nLpVbWucmUfbN7jHRjL2aPiTcqxXGawRxCdYFVT5yxzsLNh4WSaxTroMaZZJY6/sjLXSi4oKpQ=
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr14268504otq.91.1583782987624;
 Mon, 09 Mar 2020 12:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com> <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
In-Reply-To: <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 19:42:56 +0000
Message-ID: <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +B/qL1IRQ5gu

On Mon, 9 Mar 2020 at 19:38, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
> On Mon, Mar 9, 2020 at 12:22 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Yes, this is now the right place to put arm board-specific
>> documentation (the rearranging and conversion from texinfo
>> is now in master). I should move microvm.rst's contents there
>> I guess.
>
>
> OK, I'll move orangepi.rst to docs/system/orangepi.rst and add a short section
> about the Orange Pi PC machine to docs/system/target-arm.rst as well.

You should include/reference the orangepi.rst from target-arm.rst, I think --
that's where the per-board docs would belong in the structure we have.
If you just drop a .rst file into the docs directory somewhere it won't
actually go into the documentation and instead Sphinx will error
out about it not being in the table of contents anywhere.

(I'll have a look at microvm.rst to see how best to make the structure
work -- at the moment it kind of assumes there board documentation
is always quite short so they're all in one file.)

thanks
-- PMM
