Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1917904njb;
        Thu, 20 Feb 2025 02:43:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRlD3lmpuECygJe9dDQzHsCUxRfuQ4uZCJdRgT/og3UlMMr/qy021fSkKuSU2RlEvsmQwDFlpyWAHNmg==@linaro.org
X-Received: by 2002:a05:6902:27ca:b0:e5e:16de:208d with SMTP id 3f1490d57ef6-e5e16de251dmr2948962276.35.1740048206216;
        Thu, 20 Feb 2025 02:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740048206; cv=none;
        d=google.com; s=arc-20240605;
        b=jRH/wlPnX13sePRI2a395z97UPuwDBd0wJBp35purRDsax3DKOVTvONZ10d6kAeQ3u
         OPMQ9ey4NpM860SxO7rddYkZsdUmttGNNQ3RwZ3Zd5oozv9o+9bcPb8LWsxlGOjTFq4U
         WIgueRtXsQbmj95jg2WcgBEPtbz+h1KUzgzfs9yO086P/giZ6Swjytq1eyMyjBX3fEkN
         KEFnE6UFKxwbTlfBgsasGP0pBLJMJveZHXBFuQUZSeOByJfAkuAc2M8HSkvVBzwGavnk
         60YymgNIdSm91juolTcfpJ4S2UzNCcn2YmGvgcFQ9BhTKOQYZFgBYYyhQ9rXHSUrtScU
         lF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tXp4D5KK+xM0FM2Jib69e8pArbKgq/P0HpQcCg34iW4=;
        fh=1WlP2RXc85ppKBxqUMXhLTmLggsDU2vzQALc0IZJJ1E=;
        b=Z+7ZNu3wKawMv0DGNZaXHNKgTgPD4T6yQIPSPmgzrfEqiXGOM84jtVpXzxbC5GYRbb
         duCbMKzYvYq3pU7pdIlLIkEdE/873qszhyGj9wEUcKuBMJPUHZ70yF5eNfIFsM+7bpUr
         CLUKYvXFn3LLRyQpsuaA1rWBSNNpZwaqV8i11YxRUb0IuLFT3KVRlevj2V7JFnPHtwre
         Z8q0441z0T5YAUb68Vk3q5VmvdB17uHArUcNhZyN4w5ha5lMhPT9ztE5HZg+lFhrmx7j
         GajhAaAN9+L9VYFNqN51q19frif6SdksE+ZO64SNUGc7JYt1Xk9DNdXrzzYRmEiVqLu0
         2LOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxUgifQx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae06106csor8025706276.12.2025.02.20.02.43.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 02:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxUgifQx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740048206; x=1740653006; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXp4D5KK+xM0FM2Jib69e8pArbKgq/P0HpQcCg34iW4=;
        b=BxUgifQxTlSmzxovnoiD63Gi/x3ucJuOUlF6RIV+1CZihaEj4XzIXBpai7XLnls3A/
         JodgrV5US42Nhli5f5G6eZ3Hq67jC1CRN+8u0X/G5800+6T9b9QNzalcpIdLWweONQt2
         HXWnefxjH9jUlcW6VLPWMtLpD8Eas3xGqRzJkvU/I+cbVRLcjLkKIus9KQAPG4X7ugtD
         32G5pXSHEXtIvwwZc4z4N4Fyv3THuh4UvGXtN47r/i/a3kOpBE3MGixO/4M6OwIZqW7C
         YN/mERjkbBEYKxpyiVM5ItKSDINCS9yJiUz1QUEwePGTzezr4bRUR1zf3FSlDJ3+Ssbc
         t+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740048206; x=1740653006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXp4D5KK+xM0FM2Jib69e8pArbKgq/P0HpQcCg34iW4=;
        b=jiI+1FZ4vjXFT7k2OEg3ia6iI3euaIwlmKDyekhGGNvoV9/W6tP1qrq7YCOAqfCwAD
         jTNhbsc023i356JRvVf8e5zbfoDcvlW0gB6/dx49GS0TThlfGgV3dHXfBxE4HyPQf7lD
         QvzWOR7nyVNml1qfG7J2BXNtDvwk1cZ4n525knwdT2s83Ak7I90ntWQT8z6UcsSE+1rH
         B2wgrTcvvfoNfeftXH1yMx/Xp3LTBvOSEkQtPngrHVTpRAkY4O9V2/iqZVP54KQ6lxK9
         nCDsWw+/Gf9Mb7EIe/uHPHLMhK8l0P/aDQaak0oF2xsdAKdFHEvn0F4XyUULFJQd8wiU
         gNhw==
X-Forwarded-Encrypted: i=1; AJvYcCV8KAFVWzJqukT2x08ljyCxJ8Wi9R6qr+WdUIOw7bQOERnASh0O5yshqT18lzJA79BzGP20FuRG3WCR1g==@linaro.org
X-Gm-Message-State: AOJu0YwnTd/QGzMwy8jd6ujBOTgaKCvqKsD2EO7HNtmnW2edOWPqRU3w
	0FMbqJgq3h4Ew/pFhAF0ZCY1KYe0Y+Ob8hNfSpO9Tj/frr/ksk2QkyuxYFF9C1bNSsBKzQ4TEcK
	/x8AVousHioEEKuRLIL3Z4Cpnf7QUWro4nn+uunx8ueTjlkkLiYU=
X-Gm-Gg: ASbGncsBdVhurbHpT5OcIZX8Z8/+9hzTg7pPgxs9vRPC6/eHj3VDH9sw0NOx0BI+KD0
	IrnNc02ow7I/BfYAjyYYD2hR6mVIm3Zs3pn2HkL2TqoLjZkoVeaCjr2taVVy5X99bhPkcoL0gFQ
	==
X-Google-Smtp-Source: AGHT+IE5twpffXHvaW3HecGS3kxFVLhuXJOdh8TBoGV1WoKAnEHvvMvNkoY1ZvMp64OWQwNUK2XQOn5OWths5CeOPbE=
X-Received: by 2002:a05:6902:1a41:b0:e58:ef9:25d4 with SMTP id
 3f1490d57ef6-e5e0a16d49dmr5178416276.30.1740048205794; Thu, 20 Feb 2025
 02:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
 <CAFEAcA-ioFgThGJ70cyhe7rA0kbnDULsr-BuAqE+3b3TE0BGwg@mail.gmail.com>
In-Reply-To: <CAFEAcA-ioFgThGJ70cyhe7rA0kbnDULsr-BuAqE+3b3TE0BGwg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 10:43:14 +0000
X-Gm-Features: AWEUYZkyYxwAPEkdRK-UuVVAoY4asXoD5Hn-LBM2aphUxvqJiHWYh4U8l3Mkyag
Message-ID: <CAFEAcA-fZakXqgDV72fE5sFJv7ah=bvoXYpGqXZZzGutxt7r+A@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PtSHr+aedVQv

On Tue, 18 Feb 2025 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 17 Feb 2025 at 14:55, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org> wrote:
> > >
> > > Hi,
> > >
> > > This series add support for (async) FIFO on the transmit path
> > > of the PL011 UART.
> > >
> >
> > Applied to target-arm.next, thanks (with a couple of minor
> > tweaks to two of the patches).
>
> Unfortunately I seem to get failures in 'make check-functional'
> with the last patch of this series applied.

I had a look at this this morning because I wondered if it
was a mistake in the style fixups I'd applied to the patches
on my end, and I found the bug fairly quickly. The problem is
that pl011_xmit() doesn't update the TXFE and TXFF FIFO empty/full
status flag bits when it removes characters from the FIFO.
So the guest kernel spins forever because TXFF is never unset.

The following patch fixes this for me (and also makes us not
set INT_TX for the case where we couldn't send any bytes to
the chardev, which I noticed reading the code rather than
because it had any visible bad effects):

--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -256,6 +256,7 @@ static gboolean pl011_xmit(void *do_not_use,
GIOCondition cond, void *opaque)
     int bytes_consumed;
     uint8_t buf[PL011_FIFO_DEPTH];
     uint32_t count;
+    bool emptied_fifo;

     count =3D fifo8_num_used(&s->xmit_fifo);
     trace_pl011_fifo_tx_xmit_used(count);
@@ -280,15 +281,24 @@ static gboolean pl011_xmit(void *do_not_use,
GIOCondition cond, void *opaque)
         /* Error in back-end: drain the fifo. */
         pl011_drain_tx(s);
         return G_SOURCE_REMOVE;
+    } else if (bytes_consumed =3D=3D 0) {
+        /* Couldn't send anything, try again later */
+        return G_SOURCE_CONTINUE;
     }

     /* Pop the data we could transmit. */
     fifo8_drop(&s->xmit_fifo, bytes_consumed);
     s->int_level |=3D INT_TX;
+    s->flags &=3D ~PL011_FLAG_TXFF;
+
+    emptied_fifo =3D fifo8_is_empty(&s->xmit_fifo);
+    if (emptied_fifo) {
+        s->flags |=3D PL011_FLAG_TXFE;
+    }

     pl011_update(s);

-    if (!fifo8_is_empty(&s->xmit_fifo)) {
+    if (!emptied_fifo) {
         /* Reschedule another transmission if we couldn't transmit all. */
         return G_SOURCE_CONTINUE;
     }

If you're OK with that as a fix then I'll squash it in
and keep the series in target-arm.next.

thanks
-- PMM
