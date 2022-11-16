Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp441558ejx;
        Wed, 16 Nov 2022 05:52:47 -0800 (PST)
X-Received: by 2002:a17:902:8649:b0:187:3921:2b2d with SMTP id y9-20020a170902864900b0018739212b2dmr9388026plt.13.1668606767103;
        Wed, 16 Nov 2022 05:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668606767; cv=none;
        d=google.com; s=arc-20160816;
        b=Dz9/2mzmyn0mvzdRufwqqNX4w8mqZXmEq54BO0CuuUx0fctVPIQj4bNcw2vyLyQZOs
         FgSIUzEkbEZfWhufyOtIRg1HRH54wS6rBxksGMZArhtqh342wHjjS0KF4Vy/aFT9fgkH
         E1x6+M4nyk2CJT9ZwguwU2dmTS+or0MmZGsVp+um/Bma3Od7MFkuMfQ7Bi1voRoblA4I
         wlqOsWUJNu6sXNlreg/FeewUBSv2h0vRtRgoiaFupZi0Va/BF0mJUuwYGNw7GWJuEU2p
         ZAH8IGzNrwH2xeUymeOoZIWuUNAiJRW2uD1gVpCTBl/lhxZcMtTDMQuOqLKarFKOka8/
         f4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:dkim-signature;
        bh=PKnuLmi4gRrfh0Yp/jxdYijZtWeyUMJTFGu0qgNv+lQ=;
        b=J5Ghvdfixg/a5HapUrxmlonxIgBifVr22dkBnR2eJKdO2ZQigqXuSa3GWJcVJGcDdY
         qw60TD709UrchGMG+ZX1PXUjNDr1Sa9n233TcEOvNOB5kT8ahtijjUJ0N8WHPO7YXE6J
         JwG+wk/0e2eI8hs6vLPKutFEEvWOzgf7b2I7GYJPudyBG5uQx2fspyEFpP0QuH376Rn/
         +AxvWMv7mKWuRkLnlUx4ZqHp9CFmbtl1vVhc2UNx66WRFCXmUZPlU4A5HrTUnsffVt7k
         R5Uz+8KwogAcyCfMenGo9kkjRoJuPL2YpYUesCoPKLUEZn7nKyIUtbkm98E48l5Q4gPs
         Juaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=mRVuaheT;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <schspa@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u8-20020a170902b28800b00188d6e1b832sor2002951plr.167.2022.11.16.05.52.46
        (Google Transport Security);
        Wed, 16 Nov 2022 05:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=mRVuaheT;
       spf=pass (google.com: domain of schspa@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=schspa@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PKnuLmi4gRrfh0Yp/jxdYijZtWeyUMJTFGu0qgNv+lQ=;
        b=mRVuaheTntle3DwM6AFb4eGQEokeW2cD9RWSWT+cLMMtOKOIdVHZr/QLxv++yU+8B8
         vWEQlOPy6PmhADs6OtMOSok9ipDBOvw3If6fATvUeXkoLQ2oylka8lNILR4KssfuR6JS
         FfkxycOA4Dw+/oc/ZQwGbmgJlhdGw1EF/tCj9e29ZtSdNTBJc4Icwl8GzlG5QG989MMn
         pWuIaThSjiowHG/KHmIXKeM1jw5BmoNz0zC+9nMqstWsMNsgr42MuWGv3LkzMpbiNwDf
         V/spbS5nh8bYc0H90QUZHX4eRlPiG3DXxoAkSOkFN0zkChn0o3lWHNHCDctAyqbsRG1A
         42+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKnuLmi4gRrfh0Yp/jxdYijZtWeyUMJTFGu0qgNv+lQ=;
        b=RiewH+EPrROLdvULdClGoU70Ywxd45bsp0RvPMW+mjd8EsBADwEzoTKOopQIwKhynA
         yIYXIu1Yn3Gw4p4hYpEPm02a5rOLWqSmqgRktJjvsH4mWaioQDtIzgUJT24d2YIlcSnr
         oHvoHYFKrpgA8q/83N2h7aSrpVqnrzH/QEh+WJsK3UVr35+TvIeL/fW7EZa1qn+W/y+9
         KxDObjawH9/fkL4IiYId6l3sQhvJiIkD01FX7lc5Dwdiz/oVulf0yw046pvuJLyvg2MH
         pSKXh0ZEu06QjcWLDsuRdqHFEClrX4HkPkiyb5r7jEM4oAUyrnKqMZypyYbfsEkWCVSk
         TbSA==
X-Gm-Message-State: ANoB5pkt7UntqT5XlYoae1JNbsZH+TQVtxFyb7m6nEh2d4wiXMx2gkxZ
	DHyaS7gbPK5AbX7G+gLnBxzXgFBdrtnhggVc
X-Google-Smtp-Source: AA0mqf4pi48cVKfjDCcu/0CY82DVLr57opE6WEotr8oTYaXAji0/nkeIDMoUkV0bUD2qDB7suYGSmQ==
X-Received: by 2002:a17:902:d642:b0:188:d552:fb02 with SMTP id y2-20020a170902d64200b00188d552fb02mr7569766plh.76.1668606766587;
        Wed, 16 Nov 2022 05:52:46 -0800 (PST)
Return-Path: <schspa@gmail.com>
Received: from MBP ([183.159.178.109])
        by smtp.gmail.com with ESMTPSA id x67-20020a623146000000b0056bee236e9csm11230377pfx.142.2022.11.16.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:52:45 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com>
 <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Wed, 16 Nov 2022 21:52:17 +0800
In-reply-to: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
Message-ID: <m27czvhuqd.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: weKah8kk5Cyv


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>> >>
>> >>
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >>
>> >> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> >>
>> >> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> >> >> > I think this lowmem does not mean below 4GB. and it is to make sure
>> >> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
>> >> >>
>> >> >> The wording of this comment pre-dates 64-bit CPU support: it
>> >> >> is talking about the requirement in the 32-bit booting doc
>> >> >> https://www.kernel.org/doc/Documentation/arm/Booting
>> >> >> that says
>> >> >> "If an initramfs is in use then, as with the dtb, it must be placed in
>> >> >> a region of memory where the kernel decompressor will not overwrite it
>> >> >> while also with the region which will be covered by the kernel's
>> >> >> low-memory mapping."
>> >> >>
>> >> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> >> >> if you don't put the kernel, initrd, etc below 4GB.
>> >> >
>> >> > A kernel person corrects me on the meaning of "lowmem" here -- the
>> >> > kernel means by it "within the first 768MB of RAM". There is also
>> >> > an implicit requirement that everything be within the bottom 32-bits
>> >> > of the physical address space.
>> >> >
>> >>
>> >> Thanks for your comment.
>> >>
>> >> In this view, initrd shouldn't be placed higher than 4GB ? But it
>> >> seems the Linux kernel can boot when there is no memory below 4GB.
>> >
>> > A *32 bit* kernel cannot -- it is completely unable to access
>> > anything above the 4GB mark when the MMU is off, as it is on
>> > initial boot. This QEMU code handles both 32 bit and 64 bit
>> > kernel boot. These days of course there is 64-bit only hardware,
>> > and that might choose to put its RAM above the 4GB mark,
>> > because it isn't ever going to boot a 32-bit kernel anyway.
>> >
>>
>> Yes, I think we should accept this patch, because it will not affect
>> 32-bit devices, and provides support for 64-bit devices to put initrd
>> above 4GB.
>
> Yes, I agree. However since it doesn't cause a problem for any
> of the machine models in upstream QEMU, I think we should leave
> it until after the in-progress 7.2 release, so that we have
> plenty of time to investigate just in case it does cause an
> unexpected issue on 32-bit boards.
>
> This patch is on my list to review and deal with when 7.2
> goes out and development reopens for 8.0 (should be in about
> four weeks).
>
> thanks
> -- PMM

OK, thank you very much.

-- 
BRs
Schspa Shi
