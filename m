Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4294489lfi;
        Fri, 6 Mar 2020 06:53:25 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuQvWgYB2GItP58me1TqMw0xeT0bA5pU8P/KnU1itNkkran+ChmJ/7vlREys9a8ID7pQGI7
X-Received: by 2002:a37:a44a:: with SMTP id n71mr1605089qke.210.1583506405076;
        Fri, 06 Mar 2020 06:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583506405; cv=none;
        d=google.com; s=arc-20160816;
        b=nStSFMyUSlxuzUpszRuhgSa1ahzvxw4GeHDzKQ5Ja/xkK/hzxbU0lhP/m+vuAM/1jF
         w9qayHn0wcpd43jVi4pipabFdEBfVJ57GL3FJGMwIdHAHI6hdsprgJTilDw1CwXr2FvZ
         Fwxtyq3ukXikQhJr906IScy8zHdZEir6qUnU9UvxAuY4YRz0fEpDsengTs24T3n+6p22
         XvFMUTsU/qsqLix7B8makjlgr62Bz+mhxz4KptPcX8VFJuzkOFb6DRZ38C3WE3Z7UuXh
         +8DbKOuQ9fQBxIwnco7hszw0Ecq629Wig3QYQjafasG1TwD4tAFSlJL5GHMerbSmjAP+
         UCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xyp8XbQZKpj7C1Zf7DEmXCEVfx6YgZdEp1/vhPXwRzY=;
        b=azGoMox6XLl1OZIJGSbqIQvgqOX8PKm87IziMmuAJA4rfXzsYLOzQ3BpraSA8IYPQl
         UWbIzQmV73rVfp9hZq1LKCkGsQV307aarx5lGa5XX0Ex6698Oi9CpQSZEGSQ5OUDFewf
         3+wkHazuJRwOJQUXYUmbDmegxFqWHRX1fi3VbYaEjxv1YcHIPsHhQ0O6GEfHvxy4FoRP
         PojzL0nXySK5zIESsYx/fBGHC2tPoZB/uzOyn+y7ZI07bXIWufqN45k3qWsNR5sj3n80
         V2IthDx2ySu/BgGyax4sMhqZ3x7K+VjrUHc7k66SipCfyf/gndxl1OTJ8O9MMlNK4ufw
         3VBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn+jBsiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si1363712qkh.10.2020.03.06.06.53.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 06:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn+jBsiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jAELs-0003Mo-Ih
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 09:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jAELm-0003Me-1c
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 09:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jAELk-0001Fv-Kt
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 09:53:17 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:45559)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jAELk-0001EI-9X
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 09:53:16 -0500
Received: by mail-oi1-x234.google.com with SMTP id v19so2742394oic.12
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2020 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xyp8XbQZKpj7C1Zf7DEmXCEVfx6YgZdEp1/vhPXwRzY=;
 b=mn+jBsiTTpuTfmTEg2LqUdDmM8iWoUXoGJBbq8QA+yWR9QvEicTItF4OWaFc0awHWK
 xEu8XPfwhjptzavT7ZXmB0S1yevNkIS6EWhqIMVBjwTalAUy+NLLpVyX/aHPo/pdU2iw
 pySl5OETO5BNib9KANUHbnomFXyx4uant/TSvBmsda3oaf0up+doVME6cjAzQWSYu9OX
 XOdIX4tA397cUsRl/ukKOrmRXsvaS+1qANsmHrsQ4lgxcjOZHqPAzV+MEvEObsF29NdW
 949mZn/vyAaDou+Q2PG7XAzkw4yoyEzKCIh3o04soaaCCzaOmiTIdQJhVMKfenvqjPrL
 eo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xyp8XbQZKpj7C1Zf7DEmXCEVfx6YgZdEp1/vhPXwRzY=;
 b=nj0gBp4BKiQYyauLemRpRpSwSfn3EO0xt/9qIOwKtHDYPaJqK1Da45sj2xsUpMUjXb
 xTIufVDfi7nXH9sksM+Uk6K2De8ICI3WW1QvDfTBp4ypRmcMgy1zMi8I9zrJOhM78i9x
 GBXUi0TcEx7Kkzj1JCRfgJStQR62q0pLyS3721lxtnuRN6ejp3BZONBgEYlXnQUamo7J
 jw2Fg+jqpx5gbthb0uahvdLhvSilEa703xj7+TKrZcoJLlc5tAX2g9gy8479l9prSHXQ
 BL4eTlwoRxPJr1rN2mgdpb+2AdSUhb1sswVcA2V/O7KV7FMn/6dbP9mZb/+oiNboSncJ
 VHYQ==
X-Gm-Message-State: ANhLgQ0YKCbaKwhROc6ER+sKKr8WPdlJXJVHuBJqOcraEKxBSkhX/96z
 MyA1dQOUAxapAf5q2wZYc5sunX1cvqrnTSEACZYq0Q==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2803162oic.48.1583506395065; 
 Fri, 06 Mar 2020 06:53:15 -0800 (PST)
MIME-Version: 1.0
References: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
In-Reply-To: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2020 14:53:03 +0000
Message-ID: <CAFEAcA8cvbevCQRY2NxqsBAuR+dhjNyfg2Z14CgYCAtQEqT4=w@mail.gmail.com>
Subject: Re: Custom ARM Board: Setting BE32 endianness
To: Tanay Gupta <tanaygupta0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9CzK8d9WtIw

On Fri, 6 Mar 2020 at 14:28, Tanay Gupta <tanaygupta0x00@gmail.com> wrote:
> I'm trying to write my own board, and I'm not quite sure how to set the endianness to BE32.
>
> I am loading binaries to memory using load_image_targphys_as.
>
> I have tried:
> - passing -cpu arm1136,cfgend=yes
> - using the setend be instruction
> - using mrc/mcr to change CP15

BE32 is basically something that's pretty much unused
by any of the boards that QEMU supports upstream. The
code is in theory present and should work, but it could
well have bitrotted. You'll probably have to dive into the
QEMU sourcecode itself to see what's going on.

The theoretical "right way" is for your board model to set
the 'cfgend' QOM property when it creates the CPU.
(None of our in-tree boards do that but you can see a similar
thing where some boards set has_el2 or has_el3 properties
on the CPU.) In theory the command line -cpu arm1136,cfgend=yes
should be equivalent but this relies on the board code you
have written honouring the user-specified CPU option rather
than ignoring it. If in doubt, put a breakpoint on
arm_cpu_realizefn() and check that cpu->cfgend is true and
that the code in the middle of the function then sets the
SCTLR_B flag.

> In all the above cases, I check whether the endianness has changed in these ways:
>
> - xp /10i 0x40000000 in qemu monitor; which prints the LE interpretation of the code no matter what I do

I would not necessarily trust this as an indication of what
QEMU itself is doing; the monitor debug/print path is
separate from the actual JIT/execution, so you can have
endianness bugs in one and not the other.

Bear in mind that BE32 is word-invariant big-endian,
not byte-invariant big-endian, when you try to interpret
what's going on :-)

It's possible that the bug is just in how we load the
image into memory. As a test you could try byte-swapping
every word in the image file and then running it.

QEMU's variety of '-d' options will help in figuring
out what the JIT is doing, though the output somewhat
assumes you know a bit about QEMU internals.

thanks
-- PMM
