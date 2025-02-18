Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp700448njb;
        Tue, 18 Feb 2025 05:55:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRRLnrDmuAeM31UechM69/NfppkOKLf6kvj4RJirC0EbzyGLJPMUTZxMRFMRlaHdZXehhseGJVqsuUug==@linaro.org
X-Received: by 2002:a05:6902:985:b0:e54:d63a:911c with SMTP id 3f1490d57ef6-e5dc980e1bfmr13421376276.10.1739886907551;
        Tue, 18 Feb 2025 05:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739886907; cv=none;
        d=google.com; s=arc-20240605;
        b=YYg755FRH5EZc/zVgNVOUfeCX14MclCxMnmtOkLZK8WDumhO6AMJ2iAg15eklnHwiw
         dbSnHlHy4FqoIzQNEaySyFQfRtbOEizfajyCFq6bBmX8UXum2Ofd113tu6DeqCldtfgZ
         q0kdgMdlWVvzDHR2Gnsu/fwYph0x9zs/T4qkb6FRxDt4R6Fn8SDDLP13nc8r0yJ4GVFj
         2iHE6LznjpPkmGlzy7LbrSR8oKWNoZ8KNROhn22w79blyMhzf0XI3/AOEqQyJejtiaUM
         feIQf5l+CPCc+xVMRtgMfY/ad0QhqiO2rnLBd08Nwhhb83OntOR/n4D0WXnZpP2b1lor
         eVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=39fn1BS3vuf40TnRJ0SE8lCne6FUxR6xiuWLRie0Qos=;
        fh=0OOWjdpK8BvBSr92bDO7XW9znNYrLlxW+X1HF9/8oHU=;
        b=X7nuOxM12ZH9YU3+P7FJwbWGy36eYoS5u1JwBWgzrL2BduLfhiq/2TPiX6w1nLCzEn
         E9P0xpNsNSVvCVcski+gFAl1geCgX+Gjh8guft2VWAPrPT1bkDgWoPsC113Lr4BXs7UL
         pb833MLx8iAWgHqrsBVdJTvPo5WRZMwuDcOUFg9lTa1vnzIlieEqSWhKUKXhQ/8EFIlE
         4wIFmIV2Z+C4kw3BqKtA24riFU0HiuF1U7psV7jKtFjqwU2l63PxiQfHgCsdfU2faqcd
         fcgErVkgeENGYxqdmv+xkypRboZTHaJgEowUy8Oyz2WfLdbT61IgaWfW6aWdMxzw71EE
         iriw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQzOD5zU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae0b075bsor6268697276.3.2025.02.18.05.55.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Feb 2025 05:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQzOD5zU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739886907; x=1740491707; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39fn1BS3vuf40TnRJ0SE8lCne6FUxR6xiuWLRie0Qos=;
        b=pQzOD5zUARX9lxfHY6NkhbCZZGD9Hku2YpCI+IMqrKY/U47gvQdbiN7S9Q9qmjz2l4
         ZdBzP8JiQP7EVNUHlbCatXwrPMIKWYM6WtBuFfPwzYYHRal6ieukxv/zHl/3UNuyRjLa
         i2IABDFDwOqj0ABWpWxdfEEoXjzHjN0DMy/x/BAyi8bp9EbDBxTB5hQ+edKnKhj7j8gs
         jEhuB4uzjKS8/s7zO5dW+WeB1+OG2o/UOI40MS4e1mJagW+X7UN/xlunP7aoPp1te/gr
         RvZz3MD/XDS9TQ2Vgopb7xM4opxx56fNlT7LNQeLPJ3S0FYEymIDbE3EFuDrELC2oY4L
         qEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739886907; x=1740491707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39fn1BS3vuf40TnRJ0SE8lCne6FUxR6xiuWLRie0Qos=;
        b=a+UdQk+yh+BNsM7CFvPyByFeWpbbBB2zRleEP7ufJudomiPYEKmx6XKFd+A941BoyV
         ViqNpFAhJyXITHEbwiom0CPbDdBXoEQ0er4+7zeIqaMXe/C5Y971+9W92wWJrrTlBlFg
         IInpMiNI5Wlemk/2XQrcoPtSCopJ2giSu9qcalxft6QrRqe04a3jBqnCIWc1nqBUhnpq
         34TEwItAB1bQCOxm19OlOj37dK9iv11p5cI8RKlE1f+p9pyqh8ehPV3VEOubDMA9VqUI
         Q/EVUoLE7wdXBtpggJt2eQez8v+oUICNNdpBgC35hgWmRYllZD/KLXVHwN2fTBP8wkz1
         3dkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyzVEj89+bufPfPUT/Z3qHFKIcwFU65gXBBUd+OPIi7CPywd0khXrRaHxDbw3T3EvRVxvbXFWS/uXoDA==@linaro.org
X-Gm-Message-State: AOJu0Yzatc5O1vvOJLY1a9pX/9+MIR0DOOtobWf/krhZAk9+W8U11B28
	EOeWmOkd0OWPadJMSZSTyUv3ybUMmCNOJ7MqH1koo1jCmoxFINMaXya84C2UGaT12GAGJtUd931
	YQKodcfQ3LSOwxwysiWYbxYoWH5hzEUfsJlAkEtVB
X-Gm-Gg: ASbGnctrcWoDsIrh6B3zd4VSxR8KlZWSyKzxtuyHblpcfTNXacDz3zVm9A3HWFUxdZk
	XcZLIGIgm04rUNRNPX1pnJxlB8cRVacD4uo1JTngjeqO9SGaRKQa+TFI4cFyB9fqEWxVl+kr++Q
	==
X-Google-Smtp-Source: AGHT+IGVCuthWFQAA8eqh0bykJgVjjswKOY+Z0sUC4HSC9ekQacmG8hCajtYaV/IzJ3UQLdLUTaTpYlud97iDLd85Nw=
X-Received: by 2002:a05:6902:c06:b0:e5b:3d71:bff1 with SMTP id
 3f1490d57ef6-e5da9eb14f1mr17190459276.0.1739886907134; Tue, 18 Feb 2025
 05:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
In-Reply-To: <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2025 13:54:55 +0000
X-Gm-Features: AWEUYZnAZ3KPEu27SvYRa3093KcYYrD48TSXN3xhNyE1aBE_lWOl7Fze5E7ctQE
Message-ID: <CAFEAcA-ioFgThGJ70cyhe7rA0kbnDULsr-BuAqE+3b3TE0BGwg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: T/Qgwi0kXb/0

On Mon, 17 Feb 2025 at 14:55, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
> >
> > Hi,
> >
> > This series add support for (async) FIFO on the transmit path
> > of the PL011 UART.
> >
>
> Applied to target-arm.next, thanks (with a couple of minor
> tweaks to two of the patches).

Unfortunately I seem to get failures in 'make check-functional'
with the last patch of this series applied. This is with a
clang sanitizer build on ubuntu 24.04:
'../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-ubsan'
'--target-list=3Darm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-u=
ser'

and the tests that fail are:
42/44 qemu:func-thorough+func-aarch64-thorough+thorough /
func-aarch64-aarch64_xlnx_versal     TIMEOUT          90.01s   killed
by signal 15 SIGTERM
43/44 qemu:func-thorough+func-aarch64-thorough+thorough /
func-aarch64-aarch64_raspi4          TIMEOUT         480.01s   killed
by signal 15 SIGTERM
44/44 qemu:func-thorough+func-aarch64-thorough+thorough /
func-aarch64-aarch64_virt            TIMEOUT         720.01s   killed
by signal 15 SIGTERM

Looking at the test logs it looks like the test framework
starts QEMU but there is never any output from the guest
console.

I've dropped the patchset from target-arm.next for the moment.

thanks
-- PMM
