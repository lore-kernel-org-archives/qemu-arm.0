Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1239670ejf;
        Mon, 15 Aug 2022 07:58:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Q3RqhD5vHOYKFZNja8iufOTwi11ZKktswfB5ruIfIWQa7ovxedqi7xiHICXCVQkK/IqBt
X-Received: by 2002:ac8:5843:0:b0:31e:f855:5a7a with SMTP id h3-20020ac85843000000b0031ef8555a7amr14267790qth.307.1660575512368;
        Mon, 15 Aug 2022 07:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660575512; cv=none;
        d=google.com; s=arc-20160816;
        b=A/XEtjr5hzAWOcMRGRrG34C3AypnLsmGy2QDNbAV4Xa+lqz0lOFSTYbxlXhxwl92/N
         LJ3Ok+5pxfloZlHbhk1X55apkSfl6whijIzNPnGbaHo6+KNrJ0EzXnPGwOxq4ZhRTtqU
         V/8up0f5It9yIAdgu29hKD6CD7nQ+JzHCUd/RD2Zkmz5IaYwcZOdbO1/uKp8bqR3Q5oR
         L4Prjm3NE20PV6dcLazngExXb3czd446VNNivNMfbKWnNA5PsVFqs41ZVnI5BeDWrGHO
         wCFVHmP4q1S3P5hq1luZN2nEUjOKUnTIJmV0uc9pXofQKFndoGR8fgTlOMQYY/Bs6Dm6
         Vu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U0zmGbvKaYVopjRkWZyBaFRzXasaTCUA6tfUTbTP84s=;
        b=u5wI/PlWIFbmQ/7tDN+467yoEPm1kPYb7Bcyzzo1JtAOBszSgG2kHFpstF2UkyL+MH
         JMxPOCpF1x93/8UXLHx4Pknb3K8PUCrK/ksefe/vI7bfOndA8SQnnN4HGWB7Vncjn6ou
         vi9IH3u+vHXMKh9UoopE5G1vOuXSwLCN6M/HiL7PQubImtYQhJ0NiH1g1QPSOSjCNl7k
         +/X4MOZde71+asgkYscnhGMN9jDzF1Fcjm7TY8TRB2Bvf7Ky08yM4MKEdLvFlR/GsZCd
         2gFS/yKo+lFH0TVS7MHe0SIxASQ0a6DYYS6oE+6c2Z7yMEkr8dcEQ/2ZiV+wHFwFED+p
         P3SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItYgYlQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m24-20020ae9f218000000b006b8e3f090f5si4989558qkg.461.2022.08.15.07.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Aug 2022 07:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ItYgYlQ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNbXz-00048u-TZ
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 10:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbXg-00048U-SO
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 10:58:15 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNbXf-0001U6-3P
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 10:58:12 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-332fc508d88so9118827b3.3
 for <qemu-arm@nongnu.org>; Mon, 15 Aug 2022 07:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=U0zmGbvKaYVopjRkWZyBaFRzXasaTCUA6tfUTbTP84s=;
 b=ItYgYlQ7GaRpxR+R4CXEVWObxdbDlnCLLHriM9l5BLY5NTX1Jr498JgFZU8BXDpbJY
 tnna25W6dhRQY0WwxNYSOeunb5Igt8hIMscM6PaKgdnMek24SW0v1nnPBj/8JeYbqpHM
 nfuwNKxPau6IRodzmELRMJQzZXfxOZSMyGJuk/3AArC/i0A215tzGqDwPfKpfxCm2mx2
 3BpO6sPt/beRMHxxxTVHpDdnW2kx4uwAm4vZlmnCuEqBqbBvDvvFIbWnU691TYgEt5zN
 90O3rvkfu+gCQGKdNDido74Kj9keaDaZnpkeRqktZ+vjMamw8saAveHgFdUsfdfWgyWQ
 Te+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=U0zmGbvKaYVopjRkWZyBaFRzXasaTCUA6tfUTbTP84s=;
 b=Y2Wl8KWFg7Q9eTaYXr1gbWUe37e1mOJlP5U7sgdYSrl8YzRSJiRG1/qr9LdHCQVrLb
 Bwf8GjC7mSeJWGJt8FGFf8LojuMNS1j0LEgh+ILVzhlZ285xSNldiM/JNntZVBb0rC+w
 h5o7JisdcQRCXDXr60o4cUySBAFxVNS/p6PYMaNYmdEl/Z8OQ93C8DAZF5oqZ9/eDtnE
 3NzqcESqFiQfmITfLcCOGbwVd4QzqSSBmNgieFWfKB2p7N25DSf7etAI0b6sleuFbZHv
 RXhm+pGtIU058DxH1ctgzjWKzhaNFFOFTszt7NcdP+hkUqExVqU4qRyS4bTGnFNcK1lO
 83Lg==
X-Gm-Message-State: ACgBeo0NOofmxN1vvcNRYZKDIfk+Ax2wCzybBvIE7qol1jJ3cAYYGXal
 JmWlDQTcWGPM4PkRrF5+j4U1NTzurAoO1w2mYU0vsw==
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr11113109ybd.67.1660575489938; 
 Mon, 15 Aug 2022 07:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
In-Reply-To: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2022 15:57:28 +0100
Message-ID: <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: Shiny Saana <shinysaana@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0K3mr/LNL8VS

On Sat, 13 Aug 2022 at 18:54, Shiny Saana <shinysaana@gmail.com> wrote:
> I'd like to implement support for emulating the teensy 4.1 board (
> https://www.pjrc.com/store/teensy41.html) to QEMU.
>
> I'm honestly quite lost as to where to start at the moment, since
> I can't really find any emulated Cortex-M7 that would be close to
> that board already implemented.

Hi! Yes, implementing a new board and SoC model is quite a bit of
work, and unfortunately the process isn't really documented, so
the best thing is to look for some other existing SoC model and
do something similar. In this case, we implement the Cortex-M7
CPU itself, but we don't implement the IMXRT1062 SoC that it uses,
or any similar SoC in that family. (We do have some of the older
A-profile IMX boards, so it's possible some device models are
reusable -- but equally they might be very different.)

As a pattern, I would look at the stm32vldiscovery machine.
This is a Cortex-M3 system based on the stm32f100 SoC, where
we have implemented a few of the SoC devices and have stub
implementations of most of the rest. That's a fairly recently
added M-profile SoC and it's written in the "modern" style we'd
recommend for new code, so it's a good pattern to copy, and
because it only has a few 'real' devices it's hopefully not an
overwhelmingly large amount of code.

An initial simple implementation would get a level of
functionality capable of basic "can run code and it will
be able to do serial port (UART) input and output".
(If you're hoping for/would need more than that, do say so,
so we can check how much effort what you're aiming for would be.
Some things QEMU doesn't really support very well, like
emulation of GPIO input/output line hardware lines being
connected to LEDs and switches... In any case "just a UART"
is a good first step.)

You'll need detailed documentation of both the board and the
SoC. Handily a lot of that is collected here:
https://www.pjrc.com/teensy/datasheets.html

If you're hoping to submit a new board model upstream you
should give some consideration to git commit structure
as you work on it -- for code review we need big changes like
a new board type to be broken up into smaller self-contained
pieces. It is possible to just write all the code first and
then split it into digestible pieces later, but personally
I find it much easier to try to keep the changes at least
roughly in a series of separate patches as I go along.

Our "submitting a patch" page has some general advice
and information on our patch processes:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html

thanks
-- PMM
