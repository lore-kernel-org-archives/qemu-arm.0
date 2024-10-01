Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp236385njl;
        Tue, 1 Oct 2024 07:52:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/szaRVy8VcXwp+tF7e3B15PvfIc4IcE7poK9aoH/TEMbbx7x8DrH4xVZw7TYlEzCnx0PkMUtbxGsJmg==@linaro.org
X-Google-Smtp-Source: AGHT+IEIGpgpvtNHNw+nqo0ZwAuuz8gCZwWV2o7vd+aJf5YiOGpQO8vLOEKJLUSVJ3V9FLa99oE3
X-Received: by 2002:a05:6359:45a1:b0:1be:de52:97c3 with SMTP id e5c5f4694b2df-1c0cecbe7a6mr7139255d.5.1727794361874;
        Tue, 01 Oct 2024 07:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727794361; cv=none;
        d=google.com; s=arc-20240605;
        b=XlyaNQ7/KbtgYrh3jw6FR876SxNz4Dd4Qp1F8UkQIzJ7alj5qzggNv4/DbjX4qQbI2
         PM6JGsnW6CpEJAPWiXhHv9ROZhAWDnhXHKHDdj3ADeffRkV2Zhi0shR9VtWpuvOHotBO
         IjRco0e0Lw1IBTvDLfCcndtLd+e1PaYKHzmgtv8hzWiAuO3pszKWcSVMJsuB/XNXMx8e
         5zVjfyOrxqY+8wFYfK2DehA//A/NHTmHH/dh4FRZFEn1ksjlp2iuK1RzBSIBPk1BA4Ay
         qQssHM2PD+imAZ0/m+uWFANjNwpOj11K20QnIfEqD0W5af2QnrYL4245y99ivU/sn4eo
         fNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=T1NDpBhJvX7cA4nuu6OkQSIHt4wMJgEGOAOYgzp3VUY=;
        fh=I1WPfORysjPKha0oopD+bWO5BnRMMp4D4TYNOm8GkzI=;
        b=Io4qpBoyTaunrHaafaYshFmaP/Ny7HoWGR9OMAAfW7w/arxtZ+EJAHAdoMS37TvvYK
         7dN/+X7hiTqsKtSTLnG/0SphANBs8QpZthmomFIQxdq4bh70k/LZX/EKZ/q0Aj0InOMc
         GjJuFfG8VHMEPi6Zh0hxc5KPgT51nDb6imRXDv3702M/jcLgFIoQs1avBU2eJNYi2afp
         iCE9LqUGSNV7y64eVAnGS95ild3BNRxUDt7JZziBUEJSr0cRMH4bUzXufK5NqG3eZ6w5
         elW3Cp0IC28ufW/bJncvwzb5pTtzDkaSdF1PcdM5/UXrQAddCHSnDf1/iXazm4wKCEGB
         xm3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5RCZlp6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b68777csi110768816d6.338.2024.10.01.07.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5RCZlp6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sveDi-0003G2-DN; Tue, 01 Oct 2024 10:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sveDX-0002rp-MK
 for qemu-devel@nongnu.org; Tue, 01 Oct 2024 10:51:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sveDT-0005YR-Su
 for qemu-devel@nongnu.org; Tue, 01 Oct 2024 10:51:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so52264095e9.0
 for <qemu-devel@nongnu.org>; Tue, 01 Oct 2024 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727794266; x=1728399066; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1NDpBhJvX7cA4nuu6OkQSIHt4wMJgEGOAOYgzp3VUY=;
 b=D5RCZlp6UMflUvwBJvD7Zz6KGdgIs/6xC26eVGwcSB6LlUhO0uyNK5EJKmZeZCs964
 DXRY0m2TFyLYhMPUDkYzwp0rVuKdBiIBcl+u2rplphAe6PAQygnDlLrxMUNzhqTjg+0P
 SI1RtsyCNUCINMDcbP5S3RKUXMB5lCJ+MB4dun8thxNZr0oLQw+lbC+m2l/IZjXI5E+H
 IoaJEWeniMBarJT4aDQqRnAgV6+K19YM5SzctUicXsPzuvZGA2ejlgvxG9j+tBMB486t
 blRvr7k60QatcAVQPiJmugTs5BSO4jBgPe0PHlP8nCbPiREwSzsSnoeb+osgKIQtEJpK
 cF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727794266; x=1728399066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1NDpBhJvX7cA4nuu6OkQSIHt4wMJgEGOAOYgzp3VUY=;
 b=WxQv8FzngyTN/ngMvm2fJD+7h7xMRmHoU9yYhO0Go7naILmNimnDJ+ik740SN0yEeE
 o8imqmky2ZyPfvmZraUbK7t/y6ZBNlMUKuVhyO1jtukdVaffPM5n57a7rU2HF0ANlhsG
 51oeA1aig0EIkvjiJEQfjGs5S0Sg5+NiSzfs3VLjEtz873hrC8ikbbt8V87vjucQ7kga
 cZJnS4dx/VZuiq5WJAQSiCVbp4s7kbCDCEoLGtEv8XzUtqOatdiA61phz+JpZKR/hV8U
 SKH5FaS0EsbKD2GxI9OuEHszAzOnh72h0T8PcN6L+drkxv9KfHgapJAAG3MlCTd1dxzh
 QppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIsADwb496Gr01ljEA0grAqY33VX6rOf0rPbvmALaSqePS9d7AkUcJIZcYftg4k1BEyqfUk4GBo6iw@nongnu.org
X-Gm-Message-State: AOJu0Yw8BaHc+NEUN5w+A7cXGWJp1jYa261/6jg1+BQVdrMNWQAuEEoF
 +eXNIOrcJDTKOAQhhpkxQMVQq2dEowoc24uheogaEt3bRzPBaoVdfY1SYf/HbB6UIBY3YVy7uLj
 yifDKaQ6hXD8UH7wlERB/55VG5rsm8W7s7Zybs9Z6e6Uh14Gs
X-Received: by 2002:a05:6402:1ec3:b0:5c7:229a:b49d with SMTP id
 4fb4d7f45d1cf-5c88262bf4cmr12144866a12.30.1727774677751; Tue, 01 Oct 2024
 02:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240919215525.22398-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_RkwPgTksJCEP4=V0WY0wp0OiYP28PzXDJKRvpi_KWvw@mail.gmail.com>
 <CABtshVSsXPoMQy1EZaq2veo-80UMrUX+cqkvh5wq6cujW60s7A@mail.gmail.com>
In-Reply-To: <CABtshVSsXPoMQy1EZaq2veo-80UMrUX+cqkvh5wq6cujW60s7A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Oct 2024 10:24:26 +0100
Message-ID: <CAFEAcA89cd3zNE3sC_+tSKo51S9V=COoGnqC-Ce37W6c4et_mg@mail.gmail.com>
Subject: Re: [PATCH] {hw/ssi,docs/system/arm}: Allwinner A10 SPI emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R/RFxmHq46Go

On Mon, 30 Sept 2024 at 22:28, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> Hi Peter,
>
> Thank you very much for the review and detailed comments.
>
> I will try to address all comments in the v2 of the patches, but I have s=
ome questions I added below.
>
> On Mon, Sep 30, 2024 at 4:45=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
>> > +static uint64_t allwinner_a10_spi_read(void *opaque, hwaddr offset,
>> > +                                       unsigned size)
>> > +{
>> > +    uint32_t value =3D 0;
>> > +    AWA10SPIState *s =3D opaque;
>> > +    uint32_t index =3D offset >> 2;
>>
>> The MemoryRegionOps defines that size =3D=3D 1 is permitted,
>> but this calculation of index without any validation
>> of offset means that if the guest writes a byte to
>> offset 1 we will treat that identically to writing a byte
>> to offset 0. This probably isn't what the hardware does.
>
> I checked once more the User manual, and it does not mention
> unaligned access (example for RXDATA)
>
> In 8-bits SPI bus width, this register can be accessed in byte,
> half-word or word unit by AHB. In byte accessing method,
> if there are words in RXFIFO, the top word is returned and
> the RXFIFO depth is decreased by 1. In half-word accessing
> method, the two SPI bursts are returned and the RXFIFO
> depth is decrease by 2. In word accessing method, the four
> SPI bursts are returned and the RXFIFO depth is decreased
> by 4.
>
> I chose not to cover the half-word and word access methods,
> since neither Linux kernel nor U-Boot use it
> (both use only byte access).
>
> I guess that I could add `.valid.unaligned =3D false` when
> initializing `MemoryRegionOps`?

This wouldn't help, because a 2-byte load at offset 2
is not "unaligned" from the memory system's point of view.
(Also, unaligned =3D false is the default.)

Looking again at your code I see I misread it a bit:
I thought it was doing a switch() on index, but it is on
offset.

Using a switch on offset makes it easy to handle the case
of "bogus write to an offset that isn't the start of a
register":

   switch (offset) {
   case SOME_REG_OFFSET:
       /*
        * handle it; if size 1/2/4 behave differently,
        * then look at 'size' to do the right thing.
        */
       break;
   /* etc */
   default:
       qemu_log_mask(LOG_GUEST_ERROR,
                     "%s: bad offset 0x%x\n", __func__,
                     (uint32_t)offset);
       break;
   }

Then both the "offset that's not a defined register"
and "offset that's not aligned to the start of a register"
go into the default case, we log it as a guest error,
and do nothing.

thanks
-- PMM
