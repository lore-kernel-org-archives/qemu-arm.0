Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp671873ejf;
        Thu, 18 Aug 2022 17:55:42 -0700 (PDT)
X-Received: by 2002:a65:6d13:0:b0:41d:b593:e5ab with SMTP id bf19-20020a656d13000000b0041db593e5abmr4255001pgb.467.1660870542216;
        Thu, 18 Aug 2022 17:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660870542; cv=none;
        d=google.com; s=arc-20160816;
        b=jGVqPmubHeh5MRQWE4HyAQtZc0sIRbguW5l1GeZX+rVIdbT72/oJSsBqGcWu0m2YmT
         rwEWiHV3A9nefUMseoKossGlkXCrSA64cIAQnVkIRm26Iwl6NQny04SMETNdBwzmNg8J
         LFFEeMJsJZ8nU4wDdOVKfeSXne4XwW2LH+qiSCA0txQRJqDZ6NuSUVqmSjYXTTi3vxED
         0Gp1NW6wucVyybIQ3HXP9Q3Ey0lYRNeGvMsgxZsxOCbFztmEeeELX+EsmBUYjxPOWrGD
         TPIbUJmwr1U7f+18QMVndCDH4D/ZLxqEHf/r7WkDmOWbGc+0a/4ObFX4PdR6jGH5C+w7
         zcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ViX3w7UOMsABbI67Wt+CgaM/srhs7+VZppuRgGVKGAQ=;
        b=MCUWY7SH9ViK+KGhsv2cKfG9y3Ui6sBFW7VmhHkkgoih3FXUpMBna64zRdpasXI1VW
         1AgkJHeUkAmKqg75f1cVeRx8LIutunhUFIKEuEJ6dfxdPSgtIkTN/wPOy8fS2gAJlOuX
         q4XpWUnk7gyQ1PSQLJ9yw1d4YBVAaxwY+77DxULEuezbxncfA3f/iHrjKt6/ACf71OPm
         kDI9pj4YZGi99dUlSKV8wEpc+C8C0L6WRqDyoAmeaVhfwGOsIWBq+mhutsewgRd4AKYU
         JZ6IHivspHS6IxoIJ1aDH9TcNpvogYS6G9icJzaX4HcGjfz/zj3DmUPiWXXtjjbXbcNk
         fBuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rjz8Qp7D;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1-20020a170902d30100b0016d6c2e7f9esor1342721plc.79.2022.08.18.17.55.41
        (Google Transport Security);
        Thu, 18 Aug 2022 17:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rjz8Qp7D;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ViX3w7UOMsABbI67Wt+CgaM/srhs7+VZppuRgGVKGAQ=;
        b=Rjz8Qp7DYrrgrChIfsPnmP4FzQTgbMHsumx8+W7DUWkYU8hmlUBtzAkNawxwIthg83
         qI7vLk3HMUdes7XmBSdh7NPnOZgNgcq95LoM6Divf4S8rWKGdTuky6k8XayX8eYDmjVv
         84rmlIMb2UaEUsA3s1pl0Paa1bPsUF8HythHmcGRlT5O2868zugHNJs2bpVTje+jl24w
         xmX9NlTdzb+7HlflhlU+9cwE+yU0Wl2XTVkaWVz4/bcVfcs9XuiddP/VPA+gYGu7Qo40
         0H8CyNDHx2zNNEU2q082Lu55kRCqgZhCMC0h6ELYdXsh/X8Ja1xqm6SLK8nu/T+/GsN5
         dMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ViX3w7UOMsABbI67Wt+CgaM/srhs7+VZppuRgGVKGAQ=;
        b=ZWIpzAhcqjRd3sJuIC4mnXNreOVe0n0mXvJj1ksv6JnUkGquySojX23V4l2dLn+8bo
         q6dN0TVbkjjkBAdF4cRZXtLtm/2hPM64wSQOCDUOZ4ZRElrovvxIIbwdEay5EIdijYv1
         zpJuJUiFHwV9ITUA1F2PK7lFdmaWdbXW5l853xN7Bihep5vmterGGuNbWWWNOTWbCfpy
         yGfloxvi5G6MKUN/jnns+qu1LMEHF0x84ld98YR7Xad4b4pixR3vnzY3DbnDzG6q6yEv
         lU63CgYiZf6h0ITBRw6dl6CC9rO9x/pttBBVMi+wHgNK6iP+AmjxE9w0PT2DhbBS4L0a
         flIg==
X-Gm-Message-State: ACgBeo29aympdZE3jyBG/q8jqPpe1+Tw74Caqf8v3V4l8PDzc5+4hJGp
	gVE7G5+p4T5+mYC8gDzjs0vohd1S0eHXEVJUd8I40dAhPOs=
X-Google-Smtp-Source: AA6agR4YoZpq77rtbvKyOhoUPd89zLND+qeJ1BrNdgUYYkTWyn35UHrB2WIVAzk0Aot0rtYH02+apRaTcTt5XWsEP2I=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr5129254plh.121.1660870540881; Thu, 18
 Aug 2022 17:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org> <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
 <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Aug 2022 10:55:14 +1000
Message-ID: <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gECfH6CO0Y7Y

On Thu, Aug 18, 2022 at 11:58 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Aug 2022 at 05:20, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > The riscv target incorrectly enabled semihosting always, whether the
> > > user asked for it or not.  Call semihosting_enabled() passing the
> > > correct value to the is_userspace argument, which fixes this and also
> > > handles the userspace=on argument.
> > >
> > > Note that this is a behaviour change: we used to default to
> > > semihosting being enabled, and now the user must pass
> > > "-semihosting-config enable=on" if they want it.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I agree with Richard that a check in translate would be better, but
> > this is also an improvement on the broken implementation we have now
>
> Do you have an opinion on whether there are likely to be many
> users who are using riscv semihosting without explicitly enabling it
> on the command line ?

I don't think there are many users. We have always stated that
semihosting had to be enabled via the command line

Alistair

>
> -- PMM
