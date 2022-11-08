Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4016358ejx;
        Tue, 8 Nov 2022 07:50:40 -0800 (PST)
X-Received: by 2002:a63:a13:0:b0:440:a593:b79f with SMTP id 19-20020a630a13000000b00440a593b79fmr47651287pgk.557.1667922640040;
        Tue, 08 Nov 2022 07:50:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667922640; cv=none;
        d=google.com; s=arc-20160816;
        b=Wqf29UVG0av37z9R4JxGRKcoZ7aubkUv4LkLnThM6ITi2waA+aVYTlbCXpIvqkIlwi
         UqNva0A/Jykq3qxq+uUmqqdyYY1Kznjj8JBWDOIouIViMSuCIkCVsBM0U1sjy0IyatqC
         NbEIN2SRKlWdMTrwj1IUAeHmE9pJRt4V9+5M4P4ISUTgKZk38fV/bRyq3ZUc1teHSzxa
         dk9i5CNXUXxuafnVr1qqWgQDmSVduWwAgF8QfP06TlY+78ZSVWz5z9t6ZttWi8Bn/wLn
         Or9ajpMhGANAzDWLB3l9AwV/Wl3eugNoQZVpzQiPT8FgyxeffYwYD5DMQVStBi+jcAZZ
         BYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=4knHnpnx6aWKN7j5NNV+/dRxetRLSyda3Kt5238DxBg=;
        b=DTn97lW5SwfABZXvXS+viUdFrXsXFpx2jXG9bJOUHEklcwrpZ1r9IQjlnR87NSVa66
         t673WH+wuQjIcSUpkd1OoE4ZPjx+qj2zGjBsw+rRGaHL/s+6Up7gaGta25Yydzh9bqbZ
         6SZF+7XPq8RI0LJkBSR518qS+erExCex/mR2boI8/eT5XskI4wEuSgEW025di34yGVHS
         +yVEVb0r4sUK4VC4l85uucM5ynUnJnuUZiuQsi5GH95LWMpWpI2BZn7Hc2AwUU3pVxO2
         9JBKTLlGczWB1bzaOx5nZfS6R6J1yU5cTXcOhYx3Z7sBaQCF93IBv9JxFJxKCuSU/Kc+
         JGOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IdPPV84l;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <schspa@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s5-20020a656445000000b00434a9f4209dsor5558983pgv.61.2022.11.08.07.50.39
        (Google Transport Security);
        Tue, 08 Nov 2022 07:50:40 -0800 (PST)
Received-SPF: pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=IdPPV84l;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4knHnpnx6aWKN7j5NNV+/dRxetRLSyda3Kt5238DxBg=;
        b=IdPPV84la5Q01TDY8BSP+/CvytXsi3W3//D7x+hJBBIhIu70GhS0T1AK55Qz1jdNWs
         UOOS7wMrUBgGOdevHe9/dblK21uCUCZQBmrJBQSY8MXijzjJlfWGwQQ6rQLuZboxi8SF
         MgXmeyegp7w9ekb6v+gBp5igPnpROr5jYa+vyufcUzfUIjoGxXcPasqXg7dEzNq2iHkf
         ws5k1BELgl7rDT1KgdxcvvVqF8FHllvfgjEo26eehEpZlyJVwzyqLtvst9sVZjRjBjMs
         2ajkQK4io01HIAR4ZVZgDGSxbbWIQGIANL874liGrEBIob8HTPDHx+24XrEe7I9tvsGm
         g/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4knHnpnx6aWKN7j5NNV+/dRxetRLSyda3Kt5238DxBg=;
        b=r7RParLnnxmxRgUuJuNSkdMBTDvvAkNt0/9wnu5v2s4c38swRFTc4GkcXDkKWQ1DXU
         Hs50EHtTQbTzxD6KCOS4BQfk4kq+sIHbqP0qL4f3B+CWBczQ+yjkDKS/KkNu+S+yYXLw
         UIYGswrsg9upgS5E5tIfO8UzH0Ezhz1uy4GMF4LE4Je7Sm0cXurKmJb7fnaviPDWsczS
         pI8iOQBg6SLQHmfrH78Eq21IN+RmiVIz6OrNi+ArcQ1Wxwe0gJyWzX6mH5i3gws0jZzf
         EQFUbU34bxcIrEOc/ziA+mE38aKxpLHXY6/Z4Xw+SRwbbA0/VCubMUxOLwYHHdi77EjG
         waQQ==
X-Gm-Message-State: ACrzQf2k9MfntDf/gB+lJUv86qUEphovn5+R7xLnnjAnUeBqoCdQYd00
	p2UyxvVuksIyBxj/ZAiVBIQMgldNGYTAzWio
X-Google-Smtp-Source: AMsMyM4CEi9GAYqC3dxCf9iO3rcZnJ/khMoZ/i4F/eiYuCbjILN7yyjghPIAgFKnhntQqvpHZWrfLA==
X-Received: by 2002:a65:56c4:0:b0:458:85e:9e65 with SMTP id w4-20020a6556c4000000b00458085e9e65mr49338890pgs.358.1667922639518;
        Tue, 08 Nov 2022 07:50:39 -0800 (PST)
Return-Path: <schspa@gmail.com>
Received: from steamdeck ([125.122.211.175])
        by smtp.gmail.com with ESMTPSA id k15-20020aa79d0f000000b0056d73ef41fdsm6548620pfp.75.2022.11.08.07.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 07:50:38 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
User-agent: mu4e 1.8.9; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Tue, 08 Nov 2022 23:36:44 +0800
In-reply-to: <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
Message-ID: <875yfpbg38.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2ZN7IdEMrDxl


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>>
>> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> > > There is a whole comment in boot.c talking about keeping initrd with=
in
>> > > lowmem:
>> > >
>> > >     /*
>> > >      * We want to put the initrd far enough into RAM that when the
>> > >      * kernel is uncompressed it will not clobber the initrd. However
>> > >      * on boards without much RAM we must ensure that we still leave
>> > >      * enough room for a decent sized initrd, and on boards with lar=
ge
>> > >      * amounts of RAM we must avoid the initrd being so far up in RAM
>> > >      * that it is outside lowmem and inaccessible to the kernel.
>> > >      * So for boards with less  than 256MB of RAM we put the initrd
>> > >      * halfway into RAM, and for boards with 256MB of RAM or more we=
 put
>> > >      * the initrd at 128MB.
>> > >      * We also refuse to put the initrd somewhere that will definite=
ly
>> > >      * overlay the kernel we just loaded, though for kernel formats =
which
>> > >      * don't tell us their exact size (eg self-decompressing 32-bit =
kernels)
>> > >      * we might still make a bad choice here.
>> > >      */
>> > >
>> >
>> > I think this lowmem does not mean below 4GB. and it is to make sure
>> > the initrd_start > memblock_start_of_DRAM for Linux address range chec=
k.
>>
>> The wording of this comment pre-dates 64-bit CPU support: it
>> is talking about the requirement in the 32-bit booting doc
>> https://www.kernel.org/doc/Documentation/arm/Booting
>> that says
>> "If an initramfs is in use then, as with the dtb, it must be placed in
>> a region of memory where the kernel decompressor will not overwrite it
>> while also with the region which will be covered by the kernel's
>> low-memory mapping."
>>
>> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> if you don't put the kernel, initrd, etc below 4GB.
>
> A kernel person corrects me on the meaning of "lowmem" here -- the
> kernel means by it "within the first 768MB of RAM". There is also
> an implicit requirement that everything be within the bottom 32-bits
> of the physical address space.
>

Thanks for your comment.

In this view, initrd shouldn't be placed higher than 4GB ? But it
seems the Linux kernel can boot when there is no memory below 4GB.

I know that lowmem is needed for SWIOTLB etc. It will be used to make
the 32bit IP work without IOMMU. But it seems it's not required to
boot.

> -- PMM

--=20
BRs
Schspa Shi
