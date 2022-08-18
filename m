Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp368434ejf;
        Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
X-Received: by 2002:a25:2e4b:0:b0:68d:96c5:8144 with SMTP id b11-20020a252e4b000000b0068d96c58144mr3008753ybn.517.1660831110139;
        Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660831110; cv=none;
        d=google.com; s=arc-20160816;
        b=mXm+QvNnfVaN2ehkjjpzq1Dr+TBw8AFvao9ZXaGzu8QtN28RAONn59q/p1x2RFpmtD
         JU6AFy6j1tYOIZG3/n2Xk7e/yHovvxSuPUn8hCw5kFar2NsuYybniK80r4qoKgEsGe9L
         VIxIKMda3pd12L3tBRVSMMFaQhv+0GCFVnD4K6wUQ6RT3UU1IgHDd5ZsA66uhiaKSIMq
         7fk7WZ1STIWy4Wiqh81Ui9zJQFIwUdZWc3mIbe/oOKpXcUXzhJ209i1yTuOBo6BTh9wj
         gs0qf+NuABFTS/aK8ks0LyUIMhNR3WEqNQrtekXIWm7GIL8YLh5W4N+j/FvxOmoe73dR
         hOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K+oQRARp+LdRbAs7eqfv3Fp0hIjLfgJsS5qaaREhmiU=;
        b=R0VxOuVGr7VgNKfOE6ObHfsNj/MxhAktsg5tLY9PDb2a8S+he6sDkbrp+0XytFV/QK
         wY3wClXBSTMYv1lwVtu3GQ0liXLR5r6ppBVuD79ZmXK2XaOKmrs0vYFsh+1D4BOVGIeY
         NrCipiLWCMdIKsrPuoXdWMRY/w0uXY6vX1evF0xTaSm/ehcZ6d685SXCpSQCLgEcQ/6P
         WpqKw8YLl4a99ZxuRI8JwWVxhM6jojbuN9jCLdNBYMgF8NytfloYuCGLHDBqAbV4YyDh
         OIzCHnuSdl+Oz10R9mSv3ti8+XcxCMOBhl5ud1LM3mxvUYeFVyiwWsNDYGlU2oOkC5Qn
         xdbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkuSHMba;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g31-20020a25b11f000000b0067151b19908sor789852ybj.157.2022.08.18.06.58.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkuSHMba;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=K+oQRARp+LdRbAs7eqfv3Fp0hIjLfgJsS5qaaREhmiU=;
        b=WkuSHMbarOinWGYjJK/Rbo9p2y1IngEOg+5psSoxstdfMnUxXkOrfTKxcETgAezU+l
         3qsAk6xIP1NcuUcv3OF6DVwHqdY5XFq/VvWOBT9lV5rRIQ148gClnnnCErxZgyT6lZT8
         XhM68CNKskV1tX+QyfmQddiUjf5AYVe9+SKWM+ngKLy0O3q3ehIkzVzwTydBcfWsdTjh
         5wtXZ3e9Z+1Du3v9SDjS90JAIDv3U/lQMOx7nul8huf38cRahiiXUxt1pa//tsPErhZ7
         0dNekBncUWOTZ4vjrvP5GLkijl5HQfUV88NKqTZEV72BMoxb4KF2iYpoESqFjJIMehc/
         CxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=K+oQRARp+LdRbAs7eqfv3Fp0hIjLfgJsS5qaaREhmiU=;
        b=CuitDrptwanQlCCvYvn0JxNwrIYbo5I5T1xt2m1psQmSvfa8cn2VvW+vLKD95Ta0RW
         QyeqEkGYqrMv4VbJ1C+cpwq/xsUbymsTTYHtW620GMWHE3JU+bhFCQueHj0JxlmVe7Vk
         S6RgIeqAuakSrIInIWP6dhEVj/OwVUMMeTGI5+O9ZY5NCw9219f//4ltAqWn8jf0c89X
         eQ+Tkm9VF6Q6pelO/kwc8PG2NEyaVDGGu2I2chTxagWgKRkF34yA7eeNOBAqUiDMXiYQ
         oyvc/Q7LqCMVf48aLd67iLWeHgM9Ome6l7p6Xz9AwHb2uo5ZOu2iNb0j1ASPbHU+cJJx
         rC9g==
X-Gm-Message-State: ACgBeo29HyykdwTZMEXac0nvYniSMYXMVAIrFN5r0ks6E/k+QjNUyv6d
	iKHaL5Sh5QFbHARiREWvVjlQGGVztph1nwPqD5DxnHyU
X-Google-Smtp-Source: AA6agR7BwlwXB/p7jRZYlTmTsiOP0DfSPfc1H+XePIRreW5O0LfQttXkyv2Hi7pn3dC5rofCN2aiQinLbZ34OjvcPqw=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr3073092yba.479.1660831109575; Thu, 18
 Aug 2022 06:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org> <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
In-Reply-To: <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 14:57:48 +0100
Message-ID: <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Alistair Francis <alistair23@gmail.com>
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
X-TUID: bAOOA7D5JbyD

On Thu, 18 Aug 2022 at 05:20, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The riscv target incorrectly enabled semihosting always, whether the
> > user asked for it or not.  Call semihosting_enabled() passing the
> > correct value to the is_userspace argument, which fixes this and also
> > handles the userspace=on argument.
> >
> > Note that this is a behaviour change: we used to default to
> > semihosting being enabled, and now the user must pass
> > "-semihosting-config enable=on" if they want it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> I agree with Richard that a check in translate would be better, but
> this is also an improvement on the broken implementation we have now

Do you have an opinion on whether there are likely to be many
users who are using riscv semihosting without explicitly enabling it
on the command line ?

-- PMM
