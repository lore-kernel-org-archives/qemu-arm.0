Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4332984ejb;
        Tue, 13 Dec 2022 07:41:58 -0800 (PST)
X-Received: by 2002:a05:6512:b0e:b0:4a4:68b9:66cf with SMTP id w14-20020a0565120b0e00b004a468b966cfmr7334237lfu.26.1670946118049;
        Tue, 13 Dec 2022 07:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670946118; cv=none;
        d=google.com; s=arc-20160816;
        b=MmjS8v80kOlY5c7L0qKj8NCFRxIbocCqb3ZO0h/MuNmWjYS/X8ZgJ+IAltj+kEZ6Vp
         KlfXCSKaIuz1bmULUz/QlW+6AyZ/Lxzu3mnq0caY/LTpIXukxXYmHWhpyF0yXc755IZL
         3rBkdFV9Hmx/bIDKJQcMMahXdg0STRioZCPmH7bs7Sf4bfJH1ID/KU3pvBo6yF2cE2Ob
         9eaWH+xWK4SnPM+z7XD4LN8H8ENkCpXiMC4V9AAn8Sub0+8O7w3A8+owf7ii9RkiS75g
         3fiF9bml0uO7ECKnimuDG/8/CcdZYcRnsXCfdUE5NkxEeluD7gDoA37pyMR/rAKKYmGu
         CwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zztQlmAHWpKKr1LjTiKfDtrHqx9E2dILpgSGg93n8e8=;
        b=f09xSlagyH0/BUPhwRrzvAr1P6leDenJre2OCYUzQUqk62XnW9Vf9bVUX4FTz2kCsW
         akD/XTtuisx1UCLniXVIvKEQP+sHJrtZtEysW4UuHCe3OzMu7txKa2uiOpvJyQU4P+6G
         zbNaJDcf08p19fMhQbTh2add2ZhOgjPdglBNW0QpLwa6Xwz6ahDmgvG4N00BgXVlrzn4
         4uPayPEwD6nVZ2slKJtmB5eHd/MXnl9tfKsXxY1Hr15dT29w+TM0vfnwaQ3WO1XsBUCE
         ROgucjmGVKGW7o4q5riKrBHFpLdiz0R6IXdhRVFpSBOiDi7VLJpOxIAuSsrBWSOp3QS3
         zGBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLpTkc4K;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a12-20020ac2504c000000b004b583b0b6easor850301lfm.42.2022.12.13.07.41.57
        (Google Transport Security);
        Tue, 13 Dec 2022 07:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SLpTkc4K;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zztQlmAHWpKKr1LjTiKfDtrHqx9E2dILpgSGg93n8e8=;
        b=SLpTkc4K7UYPvJpfGlroQ+y76arQkS/iCaXWoVD3SihfJAapNkLWlI5p+XwF6U0Viv
         9v5Ty13PoEBMWqF7X3LLYMyeTgmETxx6cJsmbbjESfr1repTwXfSEMZbXD+JCCb7tyRW
         tiFnh77l3fp0WFPFXcyihs96lp8R0Vxg5dBDMZhHs/AJuC/rUahvfyAKRAomaUdki1kI
         D0HZ2sOtN6BekpMttKLWKIi3CpEEpCnVSxyR7lNa9Zl24/xzsm2dEMEAQ2qRGo6DXflq
         rNHX7VkFeMlmAJANm9Imt+AY1XbIMVqLiLUcLF+B/qVdEnQqAWfdie13lGw8FFCiQMY6
         opOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zztQlmAHWpKKr1LjTiKfDtrHqx9E2dILpgSGg93n8e8=;
        b=evHWUktWctMFhR8tuFGQxHXahtup9EI3BUao60QcDW91llrZc8FTdUXW8Y6DV2WF/B
         /F2MH5nZDxE4cuXqhpRuXmCwZRyy8waNLt82xe+hJgfTgS79ylrlpGvbPhigRIxFkcHP
         yxSLHR1ixMh9cO5+Fiw5z6hGus4BLBThpYFXXpX0kJAczSo6zFJWMhkberTzI4Jiqyc6
         wj2AKlCMxXvmmkw05DTxzxsNarcwdygUz5t7gjn78Vf+pAfzKbhO8eUIk+tvMwZOtzUd
         ZNP9dMxTShh5uMw++iZHZgT+HnJnaqYHj+E6gzIJV2dhdFr2NlR326oZKJIThaJTM6Tm
         KPfw==
X-Gm-Message-State: ANoB5pmc/eVYKSoYi35GdbAryjFFIIJT0akNvD6NjmyeyGYBkO5X6c8Z
	dM8k5AtQ20cFzQkjVB7nSpbb2jlA1mxJUnQU
X-Google-Smtp-Source: AA0mqf6HIImPLLRGoRAfk0c15lnCWfNdAjurb7oKMRn0ipNES00Jtm5L+ZIYv4xptudorJ+5zPlzuQ==
X-Received: by 2002:a05:6512:68f:b0:4b6:f595:cfde with SMTP id t15-20020a056512068f00b004b6f595cfdemr1431570lfe.12.1670946117128;
        Tue, 13 Dec 2022 07:41:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
        by smtp.gmail.com with ESMTPSA id o4-20020ac24e84000000b00492ceda336fsm406317lfr.278.2022.12.13.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 07:41:56 -0800 (PST)
Date: Tue, 13 Dec 2022 16:41:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32()
 by be32_to_cpu()
Message-ID: <Y5idRFBkHSXIdnCM@toto>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-4-philmd@linaro.org>
 <CAFEAcA-iouFJgu_2cG2TapxYVr-_ZK1Uuwa4mqSL5zNKg6Jq+Q@mail.gmail.com>
 <Y5iEL5YexYliX+cG@toto>
 <CAFEAcA8=fePrpR4LOp6qQznz58kNGgy8ZuiZaEE6Dy43hLvH3g@mail.gmail.com>
 <Y5iK7VFi9B1HwHf/@toto>
 <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9-XbeREaoOL=MKxmBmK1V9n9r1cNTjyXZKo3ujdJu8xQ@mail.gmail.com>
X-TUID: DqNxW472U9H3

On Tue, Dec 13, 2022 at 03:22:54PM +0000, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 14:23, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> >
> > On Tue, Dec 13, 2022 at 02:18:42PM +0000, Peter Maydell wrote:
> > > On Tue, 13 Dec 2022 at 14:14, Edgar E. Iglesias
> > > <edgar.iglesias@gmail.com> wrote:
> > > >
> > > > On Tue, Dec 13, 2022 at 01:53:15PM +0000, Peter Maydell wrote:
> > > > > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > > > >
> > > > > > This partly revert commit d48751ed4f ("xilinx-ethlite:
> > > > > > Simplify byteswapping to/from brams") which states the
> > > > > > packet data is stored in big-endian.
> 
> > > > > This is a change of behaviour for this device in the
> > > > > qemu-system-microblazeel petalogix-s3adsp1800 board, because
> > > > > previously on that system the bytes of the rx buffer would
> > > > > appear in the registers in little-endian order and now they
> > > > > will appear in big-endian order.
> > > > >
> > > > > Edgar, do you know what the real hardware does here ?
> > >
> > > > Yeah, I think these tx/rx buffers (the default case with tswap32)
> > > > should be modelled as plain RAM's (they are just RAM's on real HW).
> > > > Because we're modeling as MMIO regs, I think we get into endianness
> > > > trouble when the ethernet output logic treats the content as a blob
> > > > (thus the need for byteswaps). Does that make sense?
> > >
> > > As a concrete question: if I do a 32-bit load from the buffer
> > > register into a CPU register, do I get a different value
> > > on the BE microblaze hardware vs LE microblaze ?
> >
> > Yes, I beleive so.
> >
> > If the CPU stores the value and reads it back, you get the same. But
> > the representation on the RAM's is different between LE/BE.
> > But if the Ethernet logic writes Ethernet packet data into the buffer,
> > LE and BE MicroBlazes will read differient values from the buffers.
> > These buffer "registers" are just RAM's I beleive.
> 
> Thanks. That suggests that the current code for this device
> is correct, and we would be breaking it on the LE platform
> if we applied this patch.
> 
> I don't suppose you have a guest image for the boards which
> uses ethernet ?

Yes, I do, both little and big endian with ethlite working. Do you have a suggestion where to upload?

Best regards,
Edgar
