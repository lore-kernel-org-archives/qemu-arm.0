Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp850177ejf;
        Fri, 19 Aug 2022 02:09:47 -0700 (PDT)
X-Received: by 2002:a25:804e:0:b0:693:fb52:2665 with SMTP id a14-20020a25804e000000b00693fb522665mr5203153ybn.25.1660900187594;
        Fri, 19 Aug 2022 02:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660900187; cv=none;
        d=google.com; s=arc-20160816;
        b=uhZGk39teGTh90uNrUf39nUVzW1OC1vXfSLoRu7z7bpSdHJKoHDKzudqTnkxQar3eh
         HFfu62PWIE9iwMAWPzhvySfqlJZwcfmCAEfn0HlDWd+cEj4pf9nLdcDsgPVWEzsl6g/o
         P9wv9MjS4k4/8nc3H/GufWDnpeoL+bYImTrTkppkUnuuSRrbNJjjiYPTjmKU+1UN31JM
         T6YqupeWyURawNS5d1ow+JS15J3uvc5EOFzrRl7O30UR5wXaJMQ3aYZJbfOHlz9/BSsd
         OxQnkkzH06C7D7Fsp+3zjczqAnITonE/nKpbTsAnpx63MKbNa5qsjR4CDPBqjKd4IdgZ
         j1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BxjXz4id0AZ3P9P1aIFwFBd/Yi6UjFUKEmIrLdL8IE8=;
        b=yrEUIu1PM9XZh2gpxVmIREkJBGzNRUj1pUiSMJ/pLTLbdM4HLH5KoTn3E1q+boR710
         7TiOXXWFqydOX/1w13ZL3dUOFND2uoywwbCqC+tk2dNv0Pxp1aAxCJihAt7iXZZtNlAv
         bzRYC2feqfum8DXgPut0EOr5D7TBqwY4wBCP7u8CNgleTBbFtCUdYGiqOZleIxDh/d7x
         9sJweaQPSJTxetwc/P9hd4DBmO+kW3RXm+vb4QclZUV5mwjCgwe9BisGVskBu+efDIPZ
         lX2knJPhiJxdESwLrRAKHNn1xaWnSHS3XkcLM6vUloDOkJ7ig5RTliid04cIMEYuXAnB
         9Z3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5z2brcO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d127-20020a25e685000000b00676cfbdbd41sor1949505ybh.135.2022.08.19.02.09.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Aug 2022 02:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w5z2brcO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=BxjXz4id0AZ3P9P1aIFwFBd/Yi6UjFUKEmIrLdL8IE8=;
        b=w5z2brcO4xV8HKBKCq5oOye86SsQCQ7966aVI919VFTyTGPukuJzteZhOiplUHuriZ
         Fff5k/MKJO8CQgA6nBQAL9rIDjZ6DohhyZqZkpLze1J67QFZcu+0ifTSWFmx6utN3CXk
         MsvjyNP75ZjK0rgY4mh2LCuUUdHqwyk/Nu3jd+deDKF9ya8WtKAssEPcgRHcHDU3IewT
         2BD3NEwNhY8ewIrlyoThxbdzhUTGP3NaR+DA1MQd4FY03dUAtaRZBbdLwf+hVQsLmLcX
         Q9v89o01uxNTi4DgRHHU0nvpzVGeGYv0gaB5xapmNeIn5qwQ6G4YeRiqjaQYvymlmrX1
         5jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BxjXz4id0AZ3P9P1aIFwFBd/Yi6UjFUKEmIrLdL8IE8=;
        b=3otm9TsqGRXYYa3UEY111Sw5SuaKwfPpH9RhTIhXN6jstFl2KY1nfLBDUV/N8EewmU
         0jnWtFNsedi1QAuxIlHc0bEVus2sQNs+Nm9d1IIaRxMfYmxaqYM9IDzwa24nEx4xcKEk
         E9nA6K7aLYtsulezJdyY+fmynsNLQtE9EQbszcCA5Rz3p6vFWVfJMeaxcNF4oGMEriVr
         tRe30/1CP3MA3sFOl65oGbhRaZa595nPkTNAIMJtOQkFp6dUG0Wsa1ced/Ak3QjeB2/i
         14K6DvD94fbUi8W9M1s2zShN3HBCMO43f1Bpba7JVr4wp3S0MlN+auOgTblSUaAQjiOs
         PmgA==
X-Gm-Message-State: ACgBeo127DLjQficz/0+WKn2yNuBhj0i2DxDAd3V1H2Xp8KOwTwNLmSP
	nPBUBe2cpi7BLKCQ2jd3LqYulxtoG+/oeoMY90L6F0X9
X-Google-Smtp-Source: AA6agR404c+8xHZnXLVdm3Am7D6f83J6b7OvPCUZLEzXnydA+j/i9g4Vwf61mhYasLNQUbC7bQs5UEuye03qxYt0sog=
X-Received: by 2002:a25:55c2:0:b0:684:4159:38f4 with SMTP id
 j185-20020a2555c2000000b00684415938f4mr6542711ybb.288.1660900187158; Fri, 19
 Aug 2022 02:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org> <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
 <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com> <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
In-Reply-To: <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 10:09:05 +0100
Message-ID: <CAFEAcA_Rpu78zvaHJgC9P__ARSMDRza8ZbLUto4wD=vw2AuQTw@mail.gmail.com>
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
X-TUID: G+4lO5KA2pDE

On Fri, 19 Aug 2022 at 01:55, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Aug 18, 2022 at 11:58 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > Do you have an opinion on whether there are likely to be many
> > users who are using riscv semihosting without explicitly enabling it
> > on the command line ?
>
> I don't think there are many users. We have always stated that
> semihosting had to be enabled via the command line

 Cool -- I'll do a v2 of this with the change RTH wants, and
we won't go through the deprecate-and-warn process for fixing
the "didn't pay attention to command line option" bug.

-- PMM
