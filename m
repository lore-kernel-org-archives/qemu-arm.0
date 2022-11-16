Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp414534ejx;
        Wed, 16 Nov 2022 05:15:11 -0800 (PST)
X-Received: by 2002:a62:1c0b:0:b0:56e:5bcd:d025 with SMTP id c11-20020a621c0b000000b0056e5bcdd025mr22981026pfc.65.1668604510748;
        Wed, 16 Nov 2022 05:15:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668604510; cv=none;
        d=google.com; s=arc-20160816;
        b=WTvWa/bnWJmKkVl2LxFu76W1qmww97bUBECYNk9UIvTtmWOr1e8+L+thH7pSx+kYUy
         4cwpExaQKnLWLA+F4Y5d4mzGXJh/VhtJNO31bA+uQHH1X4Rl2MHDvZv6fcEyNcv9vv95
         v4507pi/XOyJ/YCO8YlLDljLa3nvjH536+xSS0xW0jdZQYvtxDMaqW4cV1fQ02P8ZlnW
         SLpfqaXOFutT1DfkzhcBRn8kdTVsuzR8/aLo4EyGwACA8Y9KaAMkiNsLYoQwIYE/SA6B
         R7XwCVO7Gqu2wsCXIi9JTIo3r7W24TucBajIYxrDIBFbwqRVI4lFrvCouk71PvrRxDXJ
         Yd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FlwqcxVGEX1FCQ+JbGFYqIHtt5TjFucWhfYOApa1LaM=;
        b=cw+c1OOYsPOCZBgY7cIaEcc521XUBcK46+Bwxf+VbCxC7zONpTKHixmzrlpwWW0X84
         p3OBpq3jD8DsYI+Nhv7HxSLlc9T9Gf3IurD+BG0mwh0ETF7ZG8SbURjuTQR3+OjgDdEe
         Au5dwCTihmUliA1Hg5nTy610X505xJrhqhF7IkpXfIuzStSL7OLx5+ZqkLvex266DLq0
         BeGzygjPA4YwtnkZvesyn/LLAEVAw4uKTVlD/n8FMKwo+4NIJMnKtti2ez2vGceBVzYg
         uV3Ob4kX81Thr6dggSLhwqL27grsmrGDUOxcdJD40nNfRJ6zzxyAOpzPfSFqNMBroO5I
         +JrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/BiymSS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dt5-20020a17090afa4500b00212d1899392sor812522pjb.13.2022.11.16.05.15.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Nov 2022 05:15:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/BiymSS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlwqcxVGEX1FCQ+JbGFYqIHtt5TjFucWhfYOApa1LaM=;
        b=H/BiymSScL0Wnd2WAYROsNcmgG71Gndmvi5mX513N4eCay30BZS0cy/oDAp7Np/6AI
         BnAPLGx7EA5tyc1n+h5+T6gp7LfmC7HqN8Ds40VFDrD77JDSDQgaqSO6XOrdpvtdYd+j
         pqEtuzYrTb4aEj2uXhGU3jTlxH54vIijGVxPMwGb8vxKaO3cc/f58pz0eGEBkKjyo98p
         64ZXRVPgLDw3q9j1BIoNK5SIVmmxbkZ2n0P6QhHh2Wn7i4srYQZG1SMvHXsEXtdWmYNr
         lpBB2xjN+rDLSLZVltgXDdEKLmZZiQ1lWt66/qIEo/KTXrepXSBu9RSCS/4uOBlwudgc
         IDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlwqcxVGEX1FCQ+JbGFYqIHtt5TjFucWhfYOApa1LaM=;
        b=CJgMuJmJCCkEGq2nCrSS7TI3uUX5sodyaDhftuO9ZEPEsy9utmcD3nzFDtpC48H5Ko
         5pruZyylsutH6az6Yn2Xd4/UVXULYz6oD4YiXEUojso449hSjgX28oPf/A265oNk7BQ9
         Y2PmG2AzFWi7YTUl4QZU50bnn+bCFVwlQWMAqSgPT20BvCZ2QR4pg9f/cbxBHDOHk44X
         XxC2RD97s+rcI3UwEsUq3RZcQn+K5/RRsSt16OxYwm/M/gykMDEojbFq/vSTFWAp0aBm
         9qWQDYpII71v9KMqJX0E+4+flW9CivFTlpnU2tkKush2bjwG4DvB7A2GzXr9vZziIraR
         NMFg==
X-Gm-Message-State: ANoB5plbQcyCnuIDXbAqegZpJkJnuSi7UR9LooPOO7W6h2Wm9xs1Ji7j
	Di2N3nEE3l8nTc69qtq5/d8XaRuewTG2SpdHB+Z0jB/Ozs2qSg==
X-Google-Smtp-Source: AA0mqf7lbvqARA9CKWPNGL2RH4UiW2uwF1FAAYVyLgpfbVbbXbPpW/FRcED5gvX0iD9bUwWJOzT7Ntb9kjSRbmDdnr4=
X-Received: by 2002:a17:90a:cb8b:b0:205:edfd:13f7 with SMTP id
 a11-20020a17090acb8b00b00205edfd13f7mr3747790pju.19.1668604510144; Wed, 16
 Nov 2022 05:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com> <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com>
In-Reply-To: <m2edu3ig2s.fsf@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Nov 2022 13:14:58 +0000
Message-ID: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: axyBousXNRqh

On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> >>
> >> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> >> >> > I think this lowmem does not mean below 4GB. and it is to make sure
> >> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
> >> >>
> >> >> The wording of this comment pre-dates 64-bit CPU support: it
> >> >> is talking about the requirement in the 32-bit booting doc
> >> >> https://www.kernel.org/doc/Documentation/arm/Booting
> >> >> that says
> >> >> "If an initramfs is in use then, as with the dtb, it must be placed in
> >> >> a region of memory where the kernel decompressor will not overwrite it
> >> >> while also with the region which will be covered by the kernel's
> >> >> low-memory mapping."
> >> >>
> >> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> >> >> if you don't put the kernel, initrd, etc below 4GB.
> >> >
> >> > A kernel person corrects me on the meaning of "lowmem" here -- the
> >> > kernel means by it "within the first 768MB of RAM". There is also
> >> > an implicit requirement that everything be within the bottom 32-bits
> >> > of the physical address space.
> >> >
> >>
> >> Thanks for your comment.
> >>
> >> In this view, initrd shouldn't be placed higher than 4GB ? But it
> >> seems the Linux kernel can boot when there is no memory below 4GB.
> >
> > A *32 bit* kernel cannot -- it is completely unable to access
> > anything above the 4GB mark when the MMU is off, as it is on
> > initial boot. This QEMU code handles both 32 bit and 64 bit
> > kernel boot. These days of course there is 64-bit only hardware,
> > and that might choose to put its RAM above the 4GB mark,
> > because it isn't ever going to boot a 32-bit kernel anyway.
> >
>
> Yes, I think we should accept this patch, because it will not affect
> 32-bit devices, and provides support for 64-bit devices to put initrd
> above 4GB.

Yes, I agree. However since it doesn't cause a problem for any
of the machine models in upstream QEMU, I think we should leave
it until after the in-progress 7.2 release, so that we have
plenty of time to investigate just in case it does cause an
unexpected issue on 32-bit boards.

This patch is on my list to review and deal with when 7.2
goes out and development reopens for 8.0 (should be in about
four weeks).

thanks
-- PMM
