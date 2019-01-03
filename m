Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp683651wrt;
        Thu, 3 Jan 2019 06:19:06 -0800 (PST)
X-Received: by 2002:a1c:448a:: with SMTP id r132mr36661653wma.47.1546525146053;
        Thu, 03 Jan 2019 06:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546525146; cv=none;
        d=google.com; s=arc-20160816;
        b=l2+O9sbvzeiEM7eJKuphuZczNzdM1HX4A8NbHur7MRfn6nuPBthU4Y201RRur87SeD
         6+LzLXiIPJwnbli2uZNFrTz+NrbEDqKOtzSUMS2oHxfimAWcgDa0jBXhkQVzezdDmWVe
         7pVLFDsM4gwo3rCPkkcvsTfRORrmkJ79+Gp+6vUmz52WbGGzcl+UCGpj0tc5XogArOY9
         JicFQDYUXz4hPM1A75cuYhu6R7mg4bdb+CwoeKv6sQhfBJnq3Ec+xmZd6cjNRoBL86im
         LuxoWUzlqDp5bD+ffKaVHaXJbOIAPeXJ56IFamGoqSB9ONLnL98IO7elqvfOyy1REYk8
         9eDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rq2wYMO2IqAryL9jmDrtg33YzkObOc92gQ49F4zcf0M=;
        b=zM6BPg5JonpEr8gKQaU/kqErMSCeuueeW2F2Flfd+sooWb8qAJPhCF0c22X/mD/wG7
         2gdYiGo0pKXyBMQxiLpF7Nn6h7l3u6EbLdblZbaZJ8gSanwhxG3EtdGEDUbcVEHM+K9t
         MPSTQZcQzYxsPC0kce4iAzn3VvIifpQFVPe9l5qUNmJXtsaPoR+8ToB2AzsRJ7WsEHhA
         pIv2ktTsVVCDdi9cl4en8fFY42T9hQv2tgv+jkWdprextpqgs4hrAC3mKv8Xg2zrj+Uw
         mP+R28GznzjP1jiOSGWR7w8sBBaOvkIZ8d91Fa9Pvx0KN6kxUWCkw762/yimDmie95f3
         /Ixg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Od6XtGx7;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s185sor22041251wmf.25.2019.01.03.06.19.05
        (Google Transport Security);
        Thu, 03 Jan 2019 06:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Od6XtGx7;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rq2wYMO2IqAryL9jmDrtg33YzkObOc92gQ49F4zcf0M=;
        b=Od6XtGx7q1Io9aFe/ZLl57tMYE/jUkZoyPZV/qYF8VXnz9rZu+iTFSuPa1PPpuudK1
         fUJu+AvPr2ggK9sniISrPV8Sl1VCkve0YysSbQD1EYIKVrT8bVPL5951V+nwp78G9B61
         tMxibb2G9boHye70uKys1dRFihmA4dtYW52TsxjJTxJB281ioT5hsc1Z+BDNFIqWL6um
         oj3o0teTqUrEFCOyeaXdSIdvOIewPIQn/m/iPKu2JM8DiDXGkbMcwj8l7D+F+c1bng3U
         6AnHukKl/CNcN+Y/dSVR/cNZl9XiqeyJKCQApTpEPDPlvw5wBKhVb/kFc8SHlOTKXysn
         nnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rq2wYMO2IqAryL9jmDrtg33YzkObOc92gQ49F4zcf0M=;
        b=DXoZ5RROn7V4xmyk6x796B745izhNe+mXhOxbA56BH0WgJyTpBEksNCgWD1ndKznfR
         ddAuT+yP6wXIxWrUvRwKLw2+Lgr9L5ZDfTig2DYolmizsQu9RWf0v6z6ekVWugMU8YlR
         Fis6+hy7QwK3Nf+2sjlYOvqeR1jzp3OcL/XAAFSuc0o5yY1+y26yAt7alk27D1aPenDG
         c669mE6ERz6kiLdNZJMtEihocYFNA58vwVKZbjTXRUpoy1l33fULhM4C6S1OK302+erh
         GOxy/2X7veUJSECf/ZDRKCMZMtkjvJmMt9tykNxNENeQ3zFqdi/FTZR4NltcnbByPj6w
         QIrg==
X-Gm-Message-State: AA+aEWZOkQkucS16yRDgjusmRihndIU3VePjdEIJ0WbwQry/TlcBh7K3
	QFOCZG00+F0QgXCXxESC8mqVCAvKKw6NLm6lol6C44mt
X-Google-Smtp-Source: AFSGD/VungtDM4axWIDWDLh9Oe9U+VBhZpc1YNEGTGuueRT8MuBJTdWS4PpNX+Y/s21W9szAcLR1nLNx4xyYAhSi/GE=
X-Received: by 2002:a1c:1f83:: with SMTP id f125mr36933228wmf.56.1546525145233;
 Thu, 03 Jan 2019 06:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20181214145152.27250-1-stefanha@redhat.com> <CAFEAcA9OwKJQ0iWtuxMJrNPL5r_qtuZz57H=Dtcr6X45XqQ3TQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9OwKJQ0iWtuxMJrNPL5r_qtuZz57H=Dtcr6X45XqQ3TQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Jan 2019 14:18:53 +0000
Message-ID: <CAJSP0QWEVr=0XaYbd10-_4_9Vm_9tfKTw3Paj2QR_Wb1ev416g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] microbit: make -kernel optional
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Jim Mussared <jim@groklearning.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Steffen Gortz <qemu.ml@steffen-goertz.de>, 
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3h39EBrPCPAp

On Thu, Jan 3, 2019 at 1:07 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 14 Dec 2018 at 14:51, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > ARMv7M machine types support -kernel for ELF and raw image files.
> > Microbit programs are typically in Intel HEX (.hex) format.  The generic
> > loader supports .hex files but it doesn't work as expected:
> >
> >   $ qemu-system-arm -M microbit -device loader,file=microbit.hex
> >   Guest image must be specified (using -kernel)
> >
> > This error comes from armv7m_load_kernel() but we don't have -kernel in
> > this case.
> >
> > This patch makes -kernel optional since most of the time we'll want to
> > use -device loader instead.
> >
> > Note that we need to register the reset handler that
> > armv7m_load_kernel() used to register for us.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>
> Hi, Stefan. (Happy new year :-))
>
> Looking at this, I think I'd prefer it if we handled
> this in the armv7m_load_kernel() code, since having to register
> your own reset handler to reset the CPU is a weird thing for
> board level code to have to do. That then means the M-profile
> kernel load code is in line with the A-profile load code, which
> if it has no kernel to load will still register the reset handler,
> and let the machine run however it ends up running.
>
> I think this basically amounts to "remove the 'insist that
> kernel_filename is not NULL' check from armv7m_load_kernel()",
> aka "revert commit 01fd41ab3fb69971". That commit's commit
> message is correct that the behaviour if the user didn't
> specify anything to run is a bit unhelpful, but it predates
> the generic loader so it's no longer necessarily true that
> a kernel must be specified, either for this or for any other
> M-profile machine. (There's also the case of "board has a
> flash device that was populated via a -pflash or -drive
> option".)

Happy New Year!

That makes sense.  I will send a patch.

Stefan
