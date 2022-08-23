Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1530672ejc;
        Tue, 23 Aug 2022 07:22:07 -0700 (PDT)
X-Received: by 2002:a05:6902:1103:b0:695:6fe2:5957 with SMTP id o3-20020a056902110300b006956fe25957mr16652841ybu.293.1661264527323;
        Tue, 23 Aug 2022 07:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661264527; cv=none;
        d=google.com; s=arc-20160816;
        b=vgy3iiDMsXy6XfnKH9n42X89d6EoemBwfSqPxW6z5k7UNguRg5S4GtC7vtE6oBSo5d
         YFk34YcJ3x19ec//LPBExlqK8XQ3r8HE/ZIN/mik5ilG9pYHkd6Q3Lnydcex+PQ+kMJ8
         okO77kRinXHKFweXUAsa8ZlF+apqVmlkKKYRZ+nI0iaDRZtupEE9xk+cD6fEctCAmFtE
         UBbLBw+9YuVK6vCOVZMkOxQPumXIL6g9YHqqAr17PcCAVkn6i17g9A980OYi0DfTJaGB
         iV8pqGXqzl0CDq3oXCjUedKBIQ0WQnXkV2VD76DW4FQ3fi7T7aTeKNjY1Hm8C0eHgBdP
         H1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6sCcO+czUNvV2xfGnZUi8UpVs6Iz+lx4c4qyPpFqObQ=;
        b=0KumhCbXNUq2rgXf2pMI4i7mymSSVjkZBAY4i0YUmzaOzpgBkmyaGvif9KvoOg1fmQ
         J1RkrPoZNRoy9qNw+P6GiH6QtmE0ldHJCCkLoIBoP5Zx8+x6sPEeRvMuX+mAklYmABiM
         olmjyGTpWhCHXIZZrq4iPf/5gfYHJcKtFk0bD0evM3poIsRTmIGpuofzva34YrQJq034
         qag7bHihQys4Ot2v+hQBWvWbdRL5PkQ8Oi4KeTCQbadEUWoOIkSTj/U7ATFptiyhA1F7
         cnvlZloJHhksnIytIvZmT0203y5SM/CBnLWb/ulpps3IXp9yPs3rKj8r3S2B8I8MXKn5
         nqDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7UTDgxN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9-20020a25b309000000b0067182aae26dsor6725935ybj.107.2022.08.23.07.22.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Aug 2022 07:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7UTDgxN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=6sCcO+czUNvV2xfGnZUi8UpVs6Iz+lx4c4qyPpFqObQ=;
        b=t7UTDgxN8O/OEkRS61iSK4CzSp2Nmp9KWcF1BX/vAT96Vn+vaBI5RLv6jdm0qFzj1o
         uDRApy9UCfrPoGPvHJmp632LQshdVuDPFr1mgKJIRbqLarGajnuEeEnTczI23H6gSdXu
         a286AdhxDlRZHj3IYU7U7svYjRfmtE7zRFsDlUZOQ5EGfM8ePb13XKxdcI1SudRuBcLb
         Xd7+O4mQiNdoIY8ZLq9LleEopR1UFUY8XKfFRnDKpzElqH2jnx1yGNQmQSRxgpN2pFaY
         SlAOua9sZX4fqJLtkDb6bIYwWsVYNjCUFGF56/NtfcZ9Cs76Kv8M5hOPhfq04VY9G4ny
         kFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=6sCcO+czUNvV2xfGnZUi8UpVs6Iz+lx4c4qyPpFqObQ=;
        b=TMX3YUsWPdIGZCtzXGrNx9JnIfyLv0E+A77La2uHq24epIfCoRiNsEvY4nsj2sYjqI
         K/PGXwVlggp4fbqU/eyIKB994CuE3cuJuPixVfXeZagSaseWNt1zk1YuoXR/mmUvefK6
         RYxJ16ZW5UoAyeA7pZeoPPVfS0V049s1aNmDVC7PGyma6egsJox3AjSlzmtUO+0uy/Ad
         nRs7CR4XlVQilEfYENDScs+ZQNrcaVyfmmdH7Rhua7Y1zL4wA7lIbxzKUB+EcS6nU9mo
         iiNctkHgkQRY3luiNotnyFsSbyKZpxQaxLl+OFs8fVSRIihu3KezYPgxRlivNyL8YVQX
         Xw/w==
X-Gm-Message-State: ACgBeo0aH4Gh6BJ10VjEZKzqdgtdKkaIdFlFGIvYPMuqmW5axf6qdTJ/
	/1qA0kN9KH5wXLSJu6jFtVACAckg+hROEHcc8B0EjoRI843eTjXU
X-Google-Smtp-Source: AA6agR6nD/ZKX9J7BRIbyTchQ4AndifGoCKelVFFEx/2e/6wOwkus4aDFeDZG9mAYktmmMKyBT+3y5r03nqYFwXwK6U=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr25264033yba.479.1661264526931; Tue, 23
 Aug 2022 07:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com>
 <87r11gbjbv.fsf@linaro.org> <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
 <CAJtCPL3Hef3d6sDA+pYJ6xChHS7y1J+2Cn9qf1NT0hwaBT8iTg@mail.gmail.com>
 <CAFEAcA8TmrMo+MOhOutUuwE=GOEFYUGxgRA2_XGZ2iunMTAe5w@mail.gmail.com> <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
In-Reply-To: <CAJtCPL10GL8JL2qb-sZTpmPaHTy7fOoEDb194ZL1NSvXpqGaUQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Aug 2022 15:21:25 +0100
Message-ID: <CAFEAcA8ozX22==9T33gxS9Ks31fzMgKH9-Eic03gMsg86iTYmA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: TxtlxhOFlmxA

On Tue, 23 Aug 2022 at 15:00, Shiny Saana <shinysaana@gmail.com> wrote:
> From experimentation and dissasembly on the ROM, (located in 0x0020_0000)=
, the very first int (converted to BE) is "0x2020_1000" , which is located =
to "OCRAM2", also referred as "ROM RAM" by the documentation, and the next =
int is "0x0020_2091", which both points inside the ROM itself , and which w=
hen forcibly disassembled in Ghidra does look like a function.
> So I'm pretty confident the initial vector base address is 0x0020_0000.

Right. In fact, rereading the datasheet, I see that I overlooked
that the IOMUXC_GPR_GPR16 reset value is actually specified. Bits
[31:7] of that are the CM7_INIT_VTOR, which is to say that they're
bits [31:7] of the initial vector table address. And they're set
so that is 0x0020_0000.

Your board code should be setting the init-nsvtor property on
the armv7m object to 0x00200000, if it isn't already.

> Regarding the "kernel loading" issue, I believe that I was initially
> mistaken. From other examples online, I believed that it was the way
> to load the Teensy image. But thinking and discussing it with another
> ARM dev, wouldn't the ROM itself actually be considered the kernel?

Yes, this would be in line with the way we use -kernel on other
M-profile board models.

> Knowing that, if the call to  armv7m_load_kernel() is mandatory,
> maybe it would make sense to load the ROM in C code via this
> function, with the compiled ROM addresses from 0x0000_0000 to
> 0x001F_FFFF being padded with 0.

That's one way to do it. I think it would be better to adjust
armv7m_load_kernel() so that it loaded the file to a board-specific
ROM base, which would avoid the need for the weird zero-padding.
Two options:
 * we could make armv7m_load_kernel() take a base address as well as
   a size for the region it loads the "kernel" to
 * we could have armv7m_load_kernel() be clever enough to query
   the CPU to find out what the VTOR value is and load the
   "kernel" there

I'll have a think about which one of those I prefer, and maybe
write a patch...

thanks
-- PMM
