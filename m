Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp496148wrs;
        Fri, 23 Aug 2019 05:16:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhMppGxxDo5LMoUDWvyj5m25XCsaht4NV9Mbha7hNbCS+7r+K1t8YA0/YznuKT8JhOzbg8
X-Received: by 2002:a17:906:131a:: with SMTP id w26mr3889764ejb.131.1566562618480;
        Fri, 23 Aug 2019 05:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566562618; cv=none;
        d=google.com; s=arc-20160816;
        b=LozuCOjXnJnj2ldpovteb0JH1uYAUTimlXOhkPzz7jN5yOoEkkoQYtC2ITu8tZXH1e
         4Kjtnl9Ve+6dgGSCvJl31+P1G0EXcOlh7t09hVxQ9m1qHJdSb/55tk+bOmqcHUY4kOcC
         ICFIySuD8O3xKSrPRSkMvi6p/rDxethfWqKZGsjkCbaRzMptDIGAkbKrfAv/lbWTlKYj
         9iq6CFI7Hlye4T0glH/LzJZft9c7Jjshw/rZ5s7B4H3TRVVBKjDoQhYKO5exxOopGTt7
         xEvy++U7mnegWOf41HJCbKdVyWOJIYabd0cRAGPFg9yMwGsd2kJLvR4go8l0jiJtjIJW
         FhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f/Vekl7Joky49QK00944xfqovEQ1LgsQ9EZ1x5MtykI=;
        b=CZ7fpalecuDErgcAvgFxE6pxU6TVo0tEzQ+/KlI0slrz057vMCAIF8BzDyhtObwG48
         YS2ESAuvGB7LeUynNx/y+8hzVH+btNqANYYkfmqiQlBclP0p4LGRfq7AymSxZYN7Rz0J
         tcdtawkdBO1HFOZBlOzWurYDI93fSG1UXaM2rmzLCWgfVHkYfwSWLEs3KNq7UaDQxHi/
         fBWqowHmPyQ4IHCtFjACe8yPqNoTnm3sm1+yeSFyuehZG+x0lcx0VhyBCLs/ZcmBZkw/
         GAedvhS6pwoQo3mMsEFU0bLVYgAquKFEjd6jK4FyhSUhW6U7ljVPwn54GIfsB2j1YKt/
         /KVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTfw8hiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh27si1278273ejb.394.2019.08.23.05.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TTfw8hiS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18Uz-0005DO-AV
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18UN-0005D7-AM
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18UM-0000u6-98
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:16:19 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43082)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18UM-0000tu-4V
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 08:16:18 -0400
Received: by mail-ot1-x342.google.com with SMTP id e12so8531728otp.10
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f/Vekl7Joky49QK00944xfqovEQ1LgsQ9EZ1x5MtykI=;
 b=TTfw8hiSKFJBAd1AoZfwrql6+bvB0drBIQNBtFpVn4VMrvNaC7fWqR+H/A+f6EEySi
 kUQcYMHFyQamJShWnO/hK3zlHlm2Zsnk9SJY7L5euyHLKI52HD9GacnDq4IVWcn7hB65
 huFhYJGcejALQG/oX0dgJt9D5Vxne+vnFeiZ9jaCIP6+4x2/Bm5LNVFU/MjwZgjH9IM/
 ViwPEvR0N7Q9myKfKP97V6GuPA3vqP8UmUX6Nbc/jCqW8ITb1yZi8H+HJWve4S5Pdiof
 NClx4WOtDlMfSEFk7PMl4mmINo78VN0J7FgQkL/bUNMzAJD+IwMAuWB3yMcJakzEPGrg
 C1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f/Vekl7Joky49QK00944xfqovEQ1LgsQ9EZ1x5MtykI=;
 b=V6FCrOu5IstLBhAMVyQx42b4+aXPx9IFxm/RYRf3/CYX4+Tvig9/+9+m6Hyb5kmmfM
 Qrtgp7+I7SeX0ARQEIUf7u865CroLDvhlKc2Bi5KopoQ2APJ+YJN/iZz/AqMO1C/l7WV
 kzKYcel0AKM08WqyE9Mm+9d6Gw+Zlv8RIngFYmvMHLXY90KS7p9exx+c3/ie9XKJ55d2
 5zo038MEMSWPp+ALR6uKSzdcSLVYI4a+RJfj5p1KsuVg3NruuArIbOZbNWCzyurmyAMX
 Hd0hZyvW6Az0NNW8nxdzGATZAVmL1LcGJW9h0PgCQ2Sx4csc7Hq651XiCnyfNzJe9s/s
 J1LA==
X-Gm-Message-State: APjAAAWWHkbH5NRvZQATwAYT8kzOaXyotuo0Wyr6pHwZoohfwttxlltY
 jsWRu+cjxbvHLpENX+e6odR3yQEy4k+gLDHhtCs+ZA==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr4039728otp.232.1566562577292; 
 Fri, 23 Aug 2019 05:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-3-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:16:06 +0100
Message-ID: <CAFEAcA-Tn9D6Eobe6L2JChKy+4yOqAQBUzzV0mvjr4wZUGhp5g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 02/68] target/arm: Add stubs for aa32
 decodetree
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
X-TUID: MF4TNQ7NeTfo

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the infrastructure that will become the new decoder.
> No instructions adjusted so far.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
