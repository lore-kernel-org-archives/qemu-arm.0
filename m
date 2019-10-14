Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4584147wrm;
        Mon, 14 Oct 2019 08:36:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydbRVIrpVDaoRAUicZz/Gc/977OpUlPAlDgvuDieHLD0dnB8KWuQ9ONGxYlPrYFuDy/DjF
X-Received: by 2002:a05:620a:74b:: with SMTP id i11mr29781339qki.397.1571067386090;
        Mon, 14 Oct 2019 08:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571067386; cv=none;
        d=google.com; s=arc-20160816;
        b=ukW88AWcr1mG5Nw5Msa2w4O6Et2mGP3eltF21xv7H5W7aFDvB4rMHqlEY3/FFgh+Bg
         kMHR6J9l931J+mdLl20Oi2G8dQObt/DpolJgONtMnmEGaHdgAT+x0h9gzI7mwWyEz2P6
         8iyom2yEAZuOu31adA1wfLiydkwJ2pbp0QFEseWlKIP8TMznVATMYt+zBRU64NslMNJ0
         MsXOkAch8cbv5O4/a+fILx/unL125y4vjxr9HArXsFQWBn2wD81tKSQx04arMaT12ifF
         Gwcun4seQmX5tX3bVfItiSpHSwDWkFPJZJ74PX2QmCXy9wNJyDs7cqZIouRx+Nlg9gJc
         8fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aon3RehBDE2fWEQvWFNGKmlKtZuPKRHzLBFzBefocu4=;
        b=u7SUVWLu521MXGqZzgizhQ4JMKiisy+FI0vRDfN/DrbmuLiqQT5e1muOmzfQyKFs+t
         xD62TEYZ9a5vYYox/mI/HM2iVYf073HOdPwena8u0G05GJ5hu0V/1Lcv3eS+p8tAkB9D
         KPe/N2bKLhLRPDuM0ZmtuzKsyq/8ygBOfOvVkfomxir2sgMCknFrrQz7QP9IOzCUj/+w
         zBJM/HYX52AXn3V25jaHUa49M2c3kG1JLKGFPmMpql2yrHf1igH8EeayI2et37OE2zuj
         IISKpkL416yywH4R64KNZ7p4h/igbWilJcmc74tISprP9L/1CAPjTVLsD6GjJu58v+sj
         QQVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QPr80sNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27si17594459qvw.97.2019.10.14.08.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 08:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QPr80sNj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2OX-0003Dj-HO
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 11:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2OP-0003Bg-2a
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:36:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2ON-0001vj-RJ
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:36:16 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2ON-0001vM-LP
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:36:15 -0400
Received: by mail-oi1-x243.google.com with SMTP id w144so14092582oia.6
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 08:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aon3RehBDE2fWEQvWFNGKmlKtZuPKRHzLBFzBefocu4=;
 b=QPr80sNjdoNP3bzzbitYefaMoSWseR/mI/x9enTwKMYw6m0ioxtpjZPLIKCllr+yOW
 UhR/pJxHhZ1aVtnFKxdpXIM1q92kbXXSDplG/fB6gTO5H2Z2QmPawIcYDXsJHoevcHzQ
 tzwxUKkK8lmXoyh7KlorAKULmYnLGhWSys84aQq5qyZ1GWWdfs5lfCPIAHogFqOrpLh1
 2Di5dj8hYduToLriyf1xNEDB00soKPcB1cbX4Kb2+8p+xpks1S/G4+Wi2bFG8R7MoFxQ
 wUOTarqzqZEmdh9ryS3kE+9/Hz/E7WtLAi6WudUG37VMqeumcUhO5sx+WmqJEqhRbE5+
 y7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aon3RehBDE2fWEQvWFNGKmlKtZuPKRHzLBFzBefocu4=;
 b=jWgAoiflXy6KqsrjJWl37wVpw5L99kXSl+5MsSO+SdHXGiLd+lVnbvXDqVhXR84baT
 7i1iw08Ik7xiOndIm0aHF1ZQ0Bbi2d92mCGfiMFyubCFUErsL/nvlM6x99DoR8xWssSV
 lr9QVDJUCNdU9my1yjfiDnL/1iy34kO5nC9I/F45HMkJhyuvK2O1DbJtVnUewneFvCKv
 8ZR6hcuNhRbwY2e/QdZJNT4Qf//xnCqNawF3GKnJT98peErsiOwDBvjDfrJVtIGI35xz
 j7DIIWu/myoB2RhJLu1plxWGaBE2uwY2V2f16PJWf2BcmVEeyVnAlr3Jhi/huD5zPTaL
 153A==
X-Gm-Message-State: APjAAAXflWlA0CwUrCmXFlEh5AQE8tCZO0eVJVfnR1pjiOYN3NA+8TvL
 ljlLrBoaaKYWymPsuu1aUfPJeZ8aMdoQ152Xcgq1yw==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr23694683oia.48.1571067374864; 
 Mon, 14 Oct 2019 08:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-7-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 16:36:03 +0100
Message-ID: <CAFEAcA-cbTqYaRr8epJVgUV+tkGgCuf__aM3GxRzbKuqgWfPYQ@mail.gmail.com>
Subject: Re: [PATCH 06/19] hw/char/bcm2835_aux: Add trace events
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aFvwuqmAHQ7R

On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The BCM2835 AUX UART is compatible with the 16650 model, when
> the registers belong the the 16650 block, use its trace events,
> else use bcm2835_aux_read/write.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

> +    if (is_16650(offset)) {
> +        trace_serial_ioport_read((offset & 0x1f) >> 2, res);
> +    } else {
> +        trace_bcm2835_aux_read(offset, res);
> +    }

I'm not really a fan of this. I would expect that if I turn
on the trace point for reads from the device that I see all
the reads, not just a subset of them. The device may be
minimally software-compatible with a 16650, but it isn't actually
a 16650, and there doesn't seem to be much point in sharing
the serial_ioport_read() tracepoint.

thanks
-- PMM
