Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp54950wrg;
        Fri, 10 May 2019 10:02:54 -0700 (PDT)
X-Received: by 2002:aca:6086:: with SMTP id u128mr5398828oib.79.1557507774704;
        Fri, 10 May 2019 10:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557507774; cv=none;
        d=google.com; s=arc-20160816;
        b=pvr8rFg3kj6pH0p7FgMC9G3rPpRnfEvDHboD7NkrPwd2sgNFaugu0KFlfZzebwoVpY
         a30e548CZPDS4U9apxL4TkuMKuaSJmhlTr9zrPwuk3HBwRTpS4IuKrmFvlGxNAAEl5OY
         bqSLoSYjZdOUV+uV6yA7n7pUwDcdKEQZgWXnLPruMw1P+DSw5Zhe3vCJk9pQ4NzfBXB9
         5lAgwHztaPZnfUIva+I/1pgznK7ZjVjdNZcG5bfR6mrHVZRnomiXx38VolH8j50QsMnG
         lmhmDFgr18lZJHDAWTHLSlELcOBbKcLhFmX80DmyykwAaAFx7OGm2k+M8bXrI1ZFLrIr
         E57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lwb8/s+ZRAgW4o7G5yBzAhEgsy57ve9R3odI5NEksVM=;
        b=O5ErwvVZJLlt025kT04VtHne99fInQiddD3b0n7QyVhC3MqhkEkUcXalL2lu4c/vey
         3yThzpji18R9RfyVYp1Ze0UVqoRK7iZ4qo72Mk2j27OZ98AZvjzIehA8XFNDQlXtOd4h
         007Scg2rplzgWjL8wp9dIxtYungza1gY5HWg1z/EX7t1HBNNd8hxzH4kzsoI2ESGfVaO
         gVos0iZRcZDYzdwQzCYfn/Qi2rsuVbqHKSLuWUhMLEF4KEIwZB629gaqXTluUVFgRK5o
         l2/mNEtnC8Pl8PsOmnXpbMFxSNBh5xQaWYOAXEiCKOA568ZyjtaPK57Khy3kw8fo7Sub
         H3CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FRVq/0d2";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s130sor655156oie.27.2019.05.10.10.02.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 May 2019 10:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FRVq/0d2";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lwb8/s+ZRAgW4o7G5yBzAhEgsy57ve9R3odI5NEksVM=;
        b=FRVq/0d2OWudKcgGt/fwF5FuPlFdT89dGrPZUnody3iSnNZBv+o5ZFOESVtciZgfgN
         CGuLGz1ZorNSTAyugGlJ3uu02tO2UuXe+0oWp2qMBWba0KuqIkh9UYJ7CspS2BUTUlXb
         ttVBt1cxAySrZ6r8B6mI+PYcIyObW0A6GVOvi09CvY2sX897XTfDPrbxHkVuQirgKmFK
         0LvInelV2GTpSvgJL0ylMbAAecq93OsAR3Dl8H3SzkpnfXMv41lW0s8tnMyMKsXj7zHo
         FxvlNpbSNbMOqiu/Uo236d9XoHE/cdXe+iyqbT4D1aHRhoYTqwDHuGYJZ+4sbDwhWnG8
         HoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lwb8/s+ZRAgW4o7G5yBzAhEgsy57ve9R3odI5NEksVM=;
        b=JacpKBBu9f3Fc8OCdFZzijk8jF6+7CDq+mbPKy0F6Tg3B/JzcBN9WKNP+y/RaFrZUa
         3rstCgCssRjQWk91Y368u8MXDAvhr1HVpWQunDaP6cv56zd6O3EYYAA7yPJimOTK+QGq
         I9ZT0k2ZJZOHNDAGL2st8isxDlEx7vc245AqGabo3PxB4Bz1B2jK1XuoB/RZOEKfzNOv
         rbFJc5yRlVNGy82k90G0BLAQS0Wf+QNygHP33oqmsCK5tG/HLFXvceXMIrlHKQ9OSCnY
         QpuYlbABbUdGBJWpomLtrsMvoxRMxbk2+30s9BPl6dlEqnpwECMz5rMopXKHA8KA8OII
         SOHQ==
X-Gm-Message-State: APjAAAXc2r2BfVl57o9tmJEXXj8QfCJ3UbL7ZpZ6sxxJP/0kUsA23xjo
	oiqoAybGVDD8KIPlKjXPO8qsTdTG5/Pb329aNL2sIMrPSMRu3Q==
X-Google-Smtp-Source: APXvYqzWWfDdz5gck8Ho+Ubc7sSSwhCxkNHeGJmSea02sR58JCWLUVlX2SL/OWIV4TdrcCUcLy3oq2FNg8chbbj1qY8=
X-Received: by 2002:aca:110f:: with SMTP id 15mr5833455oir.163.1557507774085;
 Fri, 10 May 2019 10:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-6-alex.bennee@linaro.org> <CAFEAcA8Dsdp2rnORnzqemWspfFxfhVwkAz=2EXdupo8iDj_=Hw@mail.gmail.com>
 <87tve2b5z2.fsf@zen.linaroharston>
In-Reply-To: <87tve2b5z2.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 18:02:42 +0100
Message-ID: <CAFEAcA9q9n24wZF9nRM=norAK+tPv9LL4LM4-8gwH8F+0D0umw@mail.gmail.com>
Subject: Re: [PATCH v1 05/23] semihosting: enable chardev backed output
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xPQQomWgpEwv

On Fri, 10 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 9 May 2019 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> For running system tests we want to be able to re-direct output to a
> >> file like we do with serial output. This does the wiring to allow us
> >> to treat semihosting like just another character output device.
> >>
> >> diff --git a/qemu-options.hx b/qemu-options.hx
> >> index 51802cbb266..6aa3a08c2fb 100644
> >> --- a/qemu-options.hx
> >> +++ b/qemu-options.hx
> >> @@ -3975,12 +3975,12 @@ STEXI
> >>  Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
> >>  ETEXI
> >>  DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
> >> -    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto]=
[,arg=3Dstr[,...]]\n" \
> >> +    "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto]=
[,chardev=3Did][,arg=3Dstr[,...]]\n" \
> >>      "                semihosting configuration\n",
> >>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
> >>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
> >
> > As you can see in the docs here, semihosting is supported on
> > five guest architectures, so we should implement this new
> > feature for all of them, not just arm.
>
> As I've introduced this for testing I see no reason not to add support
> for other architectures. However I was hoping this is something that
> could be done organically as other system tests get enabled.

IME transitions done "organically" really means "slowly, and
nobody ever gets round to actually completing them".
Semihosting is a user-facing feature, so if we want to add
the user feature of allowing output to go to a chardev we
should add it properly, I think.

thanks
-- PMM
