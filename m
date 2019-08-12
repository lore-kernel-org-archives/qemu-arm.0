Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp697206wrs;
        Mon, 12 Aug 2019 08:32:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcPSdAKr3y94ix/lfPlK+ou/A7FLYivso00ryv8hGspGCIhhm6q+rYvi0TuoXnfXNjKbjm
X-Received: by 2002:ac8:1e9b:: with SMTP id c27mr24326356qtm.171.1565623966203;
        Mon, 12 Aug 2019 08:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565623966; cv=none;
        d=google.com; s=arc-20160816;
        b=CtRbxc6fDNo5HSjZhm5MJ4tcSNC7v7HNZJrGXw+IF4Vq/ol5oWEPs0Sw7LdJu4AXIQ
         bSMQskqx5T98HyLJcWsN5E3tRuW+jTabjfa85VvKBrFg4IEHhzQGPSW3nZwZ5NM39YxX
         UfHXm0/XWoLuloAE0uM7uhpHQR5kenbnj4IxptugrzXLJkKk7Z4ID6N52/nFiS+DK++x
         LmhrZNCqCpgXhzvrouAptk2jVQsK+mTevyl5DjXnvsv4ZB4sc4icI2iVd+jD6eIGLIkY
         dgpBwU+Nbg3vqwBdXuVS8sBpYGOFwpmTyl903MJiQGu78dJas76NeQSykvO7Cw/AdHAh
         inhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=pB8ZsW6f7nCkLoXdQ22/WbQ1CvJRblcAcF0FQRwUpKA=;
        b=BIgZBEBO10Iim1wscYocbpnhBSJkfJVKd+LkxjYiIEdY2+OEXIKhDPCTNbycjpgZZU
         AtEkyCRzpCyw9gIYpirH5Iu6BzB7f98Hos+w2E0IX79ivX0sfShRJOoTa+sSdp85usRE
         L9eXN4s5fpF/WsFeXWbCy4Z6g/s7Hs3247573N4yd7xdu2y00McLKt2UcqFf974MGo4g
         FlEvDFuIM8vOsokrEy/y+7BJO0HlzqDbAB7uzY0RhmE9qaXkY4IsVx4mIQUVENjheNax
         bKWByAQU1GWnH25upOPA6uWLCamMfWzButRT9kLmNuyHbRUfFT+RpxoMGGJaFj41+p0s
         ZIBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H2JkaVmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p31si10237718qtc.286.2019.08.12.08.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 08:32:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H2JkaVmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxCJR-0001v6-Nq
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 11:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44185)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hxCJJ-0001sT-1M
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hxCJH-0005Cf-SQ
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:32:36 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38661)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hxCJH-0005CS-HW
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 11:32:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id r20so10475078ota.5
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2019 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pB8ZsW6f7nCkLoXdQ22/WbQ1CvJRblcAcF0FQRwUpKA=;
 b=H2JkaVmhBm6HCITEtgg0sZ/wcxbOOTK2IqMcAChCIh5Nc8JAPfif8tq44EcUrVpRM1
 u6XE9kSgcTfruHysTvq9LZ+nltnw55/dAr8qWFag2rqxN2RXyPzYm6rgxK0P5ukrFmxa
 nwhLOvcDwOUBKVE4ispRxXxsZj6jXNVHtRBpy8AmfEujCmm+/boAdNz40KfpdvgE/F48
 MZ8M7OQ3+4Zz+bNtZHi4L7p0t4BKbvedvv3C27TzTxq0QMblifv+rkZEWnylG8msVBDx
 R8CnKy7cZtzRk71DtRXwQW9CjP/o6PGquWJRjjXFzz08RKCBgXUyyYTssqDu6uhscxBJ
 Kh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pB8ZsW6f7nCkLoXdQ22/WbQ1CvJRblcAcF0FQRwUpKA=;
 b=P9Kw1kOHM1V9egF58ruJh239N96A++BZ+iZz5ywWi+GkqnbU/aB6qAtf1yWMVHO0MW
 XaQDorThcKkqnE296lN81zen7XHY7EIBV/p50B+lcNRaLtYx8hD8CxHwRi9xtm2j0zT5
 4yqxIwICqMlIuNkMoJaXBt5cMIAOgdIb8Ov1kfX0rs7YML5ARO/7WFPNrCXESn5AwrCK
 lBLcrLR24cZLJho6mUfoiaPTS6sIbbGF+RFxDwkHAdYN/x2XqXKp7JfkBGpg2tFZwfUS
 SU+8G4qVt/f835UnE0qKGQblpl2TxQww9FzKBiePzE+yH9e5Qo1AcR01B46divwpA3FB
 Kr1Q==
X-Gm-Message-State: APjAAAV5mq5mlgbNx/jETfD5C014cTkHKQv1Bebwo5Gw8FX3zDAIygHs
 IZHWMJHt76CfOsEZoCfmVcnxjUa0YrcB4edwOLcpBQ==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr27265965otj.97.1565623954335; 
 Mon, 12 Aug 2019 08:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
 <CAFEAcA8jh7zxb02Yv-R4h-x99bsGjAg9zQMNgiSc=SQcthnyXw@mail.gmail.com>
 <CAGbAg_C002NyTSesdAj5iqWo07pP03EBbVx7OBkqZgqvRZ8J7Q@mail.gmail.com>
In-Reply-To: <CAGbAg_C002NyTSesdAj5iqWo07pP03EBbVx7OBkqZgqvRZ8J7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2019 16:32:22 +0100
Message-ID: <CAFEAcA_=HTj_1r+t-JK_aHC=owoEFOZjBAp7W=-DGnSxSvrHXw@mail.gmail.com>
To: Esteban Bosse <estebanbosse@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] Beagle Board support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Psie3HOoN2gj

(I've added qemu-devel to the cc list; some people don't
read the qemu-arm list.)

On Sat, 10 Aug 2019 at 16:24, Esteban Bosse <estebanbosse@gmail.com> wrote:
> El s=C3=A1b., 10 ago. 2019 23:01, Peter Maydell <peter.maydell@linaro.org=
> escribi=C3=B3:
>> On Sat, 10 Aug 2019 at 04:39, Esteban Bosse <estebanbosse@gmail.com> wro=
te:
>> > I am new in this world, but I want to port the old beagle support for =
qemu-linaro to mainstream.
>>
>> That would certainly be nice. The major issue is that the
>> patchset in that tree is (a) often in an older style
>> of API that would need to be updated to use the current
>> recommended-practice APIs to go upstream, and (b) in
>> some places still has multiple changes tangled together
>> that would need to be disentangled to form a clean
>> reviewable patchset.
>
> (a) Sounds "not impossible" then for a beginer, hahaha.
> I am looking other boards like Musca to use it as example
>
> (b) I don't know yet how to make the patches I have to learn everything.
>
>>
>> I'm happy to provide advice and code review if you're
>> interested in doing this work and helping to maintain
>> it in the upstream tree.
>
>
> Yes! I am interested, I have a repo where I am doing my firsts trys to un=
derstand how qemu and the beagle are.
>
> How do you recommend to start?

Here's something I wrote up in 2015 the last time somebody
talked about maybe trying to get the beagle/omap3 changes into
master:

The initial steps here would be:
1) rebase the patchset on to qemu master and fix up
  the breakage due to API changes in qemu
[this will be moderately painful if you haven't been
following the API changes as they happened; if you're
interested in taking on the omap3 patches then I could
maybe do this step for you]
2) add support for direct boot of a guest kernel via
  "-kernel" (currently only "boot via an SD card image"
  is supported, which is awkward because the u-boot
  image insists on checking every device on the board
  and won't boot if any are missing)
3) build a cut-down minimally configured kernel that
  only needs the smallest possible set of devices
  [in particular, no SPI, I2C, MMC or graphics]
4) reorder the patchstack so that it starts with
  those relating to the required minimal device set
  and the SoC model and the board model, and the
  complicated ones to do with I2C etc are afterwards;
  check the kernel boots on this initial set
5) update the patches to correspond to current QEMU
  practice for QOM device modelling (the code in that
  tree is somewhat old and does many things in out
  of date ways)
6) submit the minimal-device patches and get them
  through code review and into QEMU
7) then start trying to clean up the remaining
  patches one device at a time

You'll need (or will learn :-)) familiarity with
handling stacks of patches in git, rebasing them,
reordering them, splitting them, and so on. Personally
I use 'stgit' as a frontend to doing that, but you can
do it all with raw git too.

Back in 2014 or whenever it was I abandoned the idea of
doing this upstreaming work I reckoned it was probably
a couple of months worth of (full-time) work to get
everything upstream.

thanks
-- PMM
