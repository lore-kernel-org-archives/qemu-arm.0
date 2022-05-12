Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp271593lfj;
        Thu, 12 May 2022 02:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiaavO4NMjVPvqN7kHmUsY16YWw96/4KueQ9sL3XEIoWccNgXSiHJDjtZfXP8J1KnnPZW1
X-Received: by 2002:ac8:7f8d:0:b0:2f3:ec97:f95 with SMTP id z13-20020ac87f8d000000b002f3ec970f95mr8647871qtj.273.1652346660740;
        Thu, 12 May 2022 02:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652346660; cv=none;
        d=google.com; s=arc-20160816;
        b=05TFUnUJz3EjUZYe4myKtkrKOJwyBpZPcqsJ6QFstrXAGKXMTaaxr704GslWgaSvUi
         GgYAMLeT8GFDreTCMP6/UknSAaIgBGBRORmBg6P3FMbdvm5yVZBRkB3Qd55BFuW0pI7o
         kFW7UVYQAPxI/zoSUqNXIUjQ3siobaj0dfo01vC1nYC52hjXOo34ev/RoMZNYliBkMXy
         ETUy4BujEmHK5X/wGXnTAnAM9jaEqWfiCFlOY7RWNZEPsA7rCwopABIRjoiTIJr7k+Ok
         ntTY2hebT7+kT4vPc3mXkZb64rg4B+jD4GmWT8SyFmZ59iMPd1561vZ0uKvb4p/B+d3o
         +YsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1y+zOgCBVgE0GNuF2BJW/BgBXHUIyk4HXxzJeWeooo4=;
        b=eiedg7c/riVvSeMGpo7TrUiqKtuZNbh56FcDfGY77c6h/xKX+LforXpTerT+vk6SkQ
         qglVUDp2YmIHHbG58+LNnpmeVpS6/PF1e8GBhrR+qePqov6VJpqzfE1x6Ec2ZsgPV/1z
         zMbVXzIfB+Am1QdFEnpOptYEnrg68PuI5tHbO4BR5BO7m3QuPOhuJeNZZOnzrR5lLn3i
         k4OPOlNkvHpvAddZkXkJI70djIT/q3gOf6lYDjCnfpina66yj7j0Kc2+C1iu/wAjYCq1
         ZQcZcHnfQeuoUkxHeH3VapBhAQ8NjN99XsWMlezdzC9j4nE5kndCIv9gXW147SsRocrN
         5E4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jp2Xb/+A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a0cdb87000000b0045647e97c0csi2813369qvk.415.2022.05.12.02.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 02:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jp2Xb/+A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1np4qZ-00042t-Ud
	for alex.bennee@linaro.org; Thu, 12 May 2022 05:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4Hn-0003Ha-EK
 for qemu-arm@nongnu.org; Thu, 12 May 2022 04:35:03 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1np4Hl-0006Xq-Dv
 for qemu-arm@nongnu.org; Thu, 12 May 2022 04:35:02 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w187so8468758ybe.2
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1y+zOgCBVgE0GNuF2BJW/BgBXHUIyk4HXxzJeWeooo4=;
 b=Jp2Xb/+A8jo0tSf6tF+3ITxsqMd5ABFpWMDnRrWrwLivtCKNHcYdDVQT4C+o4ONu+M
 APxJpcLQ6YK6Hwd0BcYTapOy492GV1rR2nb4NihHImrPnCaeOyzgHQRQzDgxJKaDNAzf
 igani344R9MTe6MYHZnp0Ov9CDEH21SqCSvXECMZtGbL7LI37TNXaui2AUJOMTVJzoki
 EDaDyaRvJNjz18h65IAIGjdsv3PYrAdcb8UrLVc/mTa2hVvNQ/rUhULWZboOZh3b+Eqf
 BFcm/Lwxz928kDltLpHE7PN+p09XL9p9un+ocyXSkjFtfTfEypUqAyzOHBAdhX/xz0Jd
 teQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1y+zOgCBVgE0GNuF2BJW/BgBXHUIyk4HXxzJeWeooo4=;
 b=T1TwDvm3WZ65eMWqRfuIUY0HrA0PHsNoqh2+SDt5XzDV+7oI/TBB4bGMsB4kjGMgWq
 iH88CjFjLoFN4NeBo9ub9llUGyUlE8eSy5yjlcI821ktmuUQj0tnyBtQdvuhfdxa3KCH
 ZVmiYwCFWfBXo5WCT6WgItl9tk9bBmlMHIVVQZFwkrQaKT2Gq9CXc3tLHArA6gtzUfKx
 78WtFznazNNHVrOVrVS1hqxkjcQWDAko2z1+G8SlldvVe0FqkJe42GXk02G29DIdHMg0
 aRSFHk+GwCWy77fUIsSyj2fMLqO3YNdNkKhDzaL0Wy40rqYsyBwIjVzrQGqo7cpYmf1G
 BOeQ==
X-Gm-Message-State: AOAM532An7Het3npkXQl2pb6SQVXrn35xrS3iH2VQbUL/GVfI2qILock
 bNebgXAoWkEDSC3thImx88fduMGx4xTFLzA1IH3OkQ==
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr26872802ybv.288.1652344499800; Thu, 12
 May 2022 01:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
In-Reply-To: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 09:34:48 +0100
Message-ID: <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: James Gutbub <jgutbub@asu.edu>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xfnE3qfm79N2

On Wed, 11 May 2022 at 20:50, James Gutbub <jgutbub@asu.edu> wrote:
> I am digging into qemu-system-arm to try and execute some simulation
> environment unit tests with no underlying board/device interaction,
> at most I need semihosting to print out some results.

> The intended target for my hello world using arm-none-eabi-gcc
> is Cortex-R5F (e.g. -mcpu=3Dcortex-r5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3Dhar=
d).

> I am not finding a way to successfully execute my hello world example
> using =E2=80=98qemu-system-arm -cpu cortex-r5f -M none -nographic -semiho=
sting=E2=80=99
> and the payload variants below:

You need to specify a real machine type. QEMU is not designed
to provide a "just the CPU" emulation environment. There are
two modes:

 (1) system emulation, with qemu-system-arm, which gives you
a model of some actual board. Your guest code usually needs
to be written to work on that board (at a minimum, linked to
an address where the board has RAM)
 (2) usermode emulation, with qemu-arm, which runs code at
emulated EL0 (userspace) with access to Linux syscalls and
also the semihosting ABI

You're also at a disadvantage in wanting Cortex-R5F : we have
no system emulation board models where that is the main CPU.
(We have it for some Xilinx board models which have Cortex-A72
cores for the main processors and also some auxiilary R5 cores.)

Depending on what your code is doing, you may be able to use
option 2. In particular your code would have to:
 * not touch any devices or other SoC or board hardware
 * be happy running only at EL0
 * only use memory which is in the ELF file's code/data/bss
   (unless you want to allocate more with Linux syscalls)

It's perhaps not impossible to get something executing with
the 'none' type, but this is definitely not a supported
use case, so you're on your own if you want to experiment.
As a starting hint, the 'none' board defaults to "no RAM",
so unless you tell QEMU to allocate some then there's nowhere
for your code to execute from.

Whichever way you want to go on this, for any kind of "I'm
not sure why my code is failing to start" question I recommend
the use of the -d debug options to tell you where the CPU
is trying to execute instructions from and what they are.
-d in_asm,exec,cpu,int,unimp,guest_errors,nochain is usually
a good set of options; but watch out that 'in_asm' shows
when insns are translated, not when they are executed.
-D file to dump to file rather than the terminal.

thanks
-- PMM
