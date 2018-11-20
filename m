Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp305250wrt;
        Tue, 20 Nov 2018 00:49:38 -0800 (PST)
X-Received: by 2002:a19:7013:: with SMTP id h19mr688098lfc.147.1542703778066;
        Tue, 20 Nov 2018 00:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542703778; cv=none;
        d=google.com; s=arc-20160816;
        b=mg7+IEwmJ0aAN9LabRRYOEzbymghmNpE0OmbloYZvFNrz6VO9h+BLQZSybPcnHvlB4
         pbOvAKxnOcmrX3YSDZbmdwXR61VOMHclv1Az7C/h/aI6RsP7Z48i9swbcdfQsXuV4ai/
         xTbe2+RJ+Va6E6l9NZRw2TAVmmRUdlOBeaqpOfiO2Qj6wA14b0wiGZL/30XXZN9Usvdc
         8YLNIqsf7XpC8oMkyiB9n0hefAKLSzjmBZKhpcUNUGTTB2yhjEtL831oji4Z5mszexBm
         wyos6xLcQPbCFH5YOBwMoNJUTL/UuWSxm+AqiW5SzF56UAllFcgUGyc+Q+RlsNsMzG7a
         Om7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yji8K8U1lHvtFeMkdwjfgOEqwrzHuKIgV7l54chwmr8=;
        b=qPVO2IGkj5f1BUg2WSKt6mLggN9HLhy748OCder2GXi8bfsmx3U3X4QnxED/p67sjt
         VNdNmEJS4psFpN6oL16wXn6iPPgWUbogDAlvV6nNw3TXVT2314zFx/07HtqgkzqmfaV7
         39AyJWMuKrPgHJWod0VqWhKa/ktnHZI/wCUwfA9eRlOJcNQgHgRrU9STvjKWp82MAo3A
         3rwBXB9sLJMozzR87WT0BL6aYn5/n4MY0Jj7nYdj2As7XpYwwXfbaArSBGH2qPNqWTR4
         BjjJNO7FmUKAVPjtG3hjjsoC/LAYjDyt/EZrXMDHRl+1TcEUoU8v18nraNHFs0n6gNlt
         kq5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=an9mzVVT;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f8-v6sor21225979ljg.0.2018.11.20.00.49.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Nov 2018 00:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=an9mzVVT;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yji8K8U1lHvtFeMkdwjfgOEqwrzHuKIgV7l54chwmr8=;
        b=an9mzVVTJcnRj5GEDaN9L9WCanb4iU3P+7VVr4bTdMONootDPi9eUUqNNMaKe5LdeF
         /o6KR22HslKv+c1rN3xcjtdEHdHx/BUPreheLDqRkAmNZwZjQUihN409VsJQ79OagyEy
         dpBUuYNp0mG8cdJygAu9I6kd3oxcTZ8LGXWy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yji8K8U1lHvtFeMkdwjfgOEqwrzHuKIgV7l54chwmr8=;
        b=ZbRgFpbh4i9C28F92MGL1+A2TVXzn+1/0ecExKEwJHc5FkEIeCiEw3Xck7zKUw7e/t
         4Hm9ivNF4eYzfA55KkofcTGbTco7R4F7lXFsG33LpF7uRz1uNObKd18OtinKJ3By9H0I
         1HQQDSE7HJZ4lbWQaz6Q5HslpkjYJjYsu2Om3l5LUReflriTpFu2EJPZ+iZ535jIFc0t
         6PONmC+mJ6bJ1geQC02ugCovSdgrR0Vvh7jckL1TZDDggpTX+TVCFbaPbQuVaIjVhD3M
         GUt3VliQSb9G1gm0UXdgvKqZU7Dh5HjJ0T1DhkT5otvoXMymBH2Wq7FFT+uTHWw1AOLr
         U97A==
X-Gm-Message-State: AA+aEWYIO1EHwcr74Gh6h0YB19G7CSx++3LO66sXWEI/EXV4TlRtDsf0
	Z1yjiE/tkb+y7jdJ0mLoJjqzk1Eyf+mttL99Td2bUOyv
X-Google-Smtp-Source: AJdET5d46Xm9/ML1p1FqFMPMepDiE3jECf3fFg0Ze6x1VnJbc/FrsgHvP5OK8UdYUO9/O454KhF1aqJDss5URWWJSpg=
X-Received: by 2002:a2e:145a:: with SMTP id 26-v6mr670765lju.116.1542703777703;
 Tue, 20 Nov 2018 00:49:37 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net> <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net> <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
 <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org>
In-Reply-To: <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Tue, 20 Nov 2018 16:49:26 +0800
Message-ID: <CAHmQWvDua+3fXT7wA2j7wDRbOi5VJWfMa_+YYt6Xjv9XZF1Skg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: kraxel@redhat.com
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: T0qweosJx0u+

On Tue, 20 Nov 2018 at 16:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > But I assume you specifically want things that do a lot of DMA, so I
> > > couldn't get away with asking for keeping it to the SBSA UART(s)? :)
> >
> > Ideally, it would be something that supports platform MSIs as well,
> > but that is unlikely to be a priority for anyone (and i would be very
> > surprised if any of QEMU's sysbus host controllers implement that at
> > the moment)
> >
> > I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.
>
> Generic sysbus ehci should not be difficuilt, 10 lines patch or so.
>
> Gives you only usb2 though.  usb1 devices are handled either via ohci
> companion controller (should be doable), or via integrated usb2 hub
> (more common on recent hardware, but qemu usb-hub is usb1 only).
>
> Generic sysbus xhci would be more work.  But you'll get usb 1+2+3
> support.  And wiring up platform MSIs should be possible too.
>
In kernel, these drivers are enabled by default:
CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OHCI_HCD_PLATFORM=y

If we do generic EHCI or XHCI in qemu, can the driver in kernel work
with it? (I guess yes?)
My thought is if the available kernel driver will work without any
change, then we can create it in qemu.

> cheers,
>   Gerd
>
