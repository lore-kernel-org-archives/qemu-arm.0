Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp824141wrp;
        Wed, 11 Sep 2019 05:54:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2QuJ0mop/4FGkKRDX5Lt3Ig4J3IC3jc4+Vjna1NZaib9su0RpWMj3BBpSX2jylDNj+pUZ
X-Received: by 2002:a17:906:6a92:: with SMTP id p18mr9453635ejr.253.1568206485633;
        Wed, 11 Sep 2019 05:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568206485; cv=none;
        d=google.com; s=arc-20160816;
        b=Zm4v66PQexr9f2wm+Dbmxpnar7bxyWyKjh7oDw5MxeUV9kQpz+d+7bqv7m1GGSF6m3
         V5yw9HCQ5l3gXxWUb/gMxX5G1ciDXt6ZbX9zb+rh0Tj3PXE3U1bSQBy/NRgXt+fmxVCb
         NCdErunivRb5N/Sn3BbZUa77ktsHNZfmmu7pm+fEVmLazT1pQiKpF4SlrghPLPca6gLg
         bOifw8fia+BegiSXorW1vux3D8tvWdD7BXr5H7KQSxAhnqvkH0CAourd0NJpzoFxH7b4
         mIfuN7H5bvS5lTp7/qw644OG7u7Czb7cFuticZoZN3P/gJo7P/6Z8MUc7kf8+a1ceJ9X
         q3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLHpMUClYJTmuSpnccdF1X5C+tQESlni33dS/sKHFIg=;
        b=NQbYXh+0UG9S76ktmabUdpAq7QW+tnAVsRwOjhTuX3nFUQwB4oRlBnwPHeIftKKcft
         t2QO1HXQkxeU8ZAFpDhGGUKlocdE96HY7+D0wny8t5GLupcO/7VGghrGSYi3CZe+OLAX
         SceulnMmK4jf+bx0KDnegSikpO+Ue3x2Y619q6eQQBAW8LxsOQwT/8FFOsC174b5QmGa
         firk+hqpevo07B6k6X76AwV0bqx7Hm18ttcAMshSo+wQXOBXo6G392Kb8KGVvT3/PeVY
         FxcF6DVL+WyvxdUw3L7aXrD+7rTV6MZSHI7CXlkJ/rnN6D6jbNw3sf2gE6ejqJjEOb/F
         +woQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QeWcAnaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si3079888edp.191.2019.09.11.05.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 05:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QeWcAnaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i828y-0006Xk-NK
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 08:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i828q-0006XT-L5
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i828p-00034r-Df
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:54:36 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33510)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i828p-00034U-7G
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 08:54:35 -0400
Received: by mail-oi1-x244.google.com with SMTP id e12so13731958oie.0
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLHpMUClYJTmuSpnccdF1X5C+tQESlni33dS/sKHFIg=;
 b=QeWcAnaVh9RJKQML6U+lWncjQw11IUL957yuS7M4TQXyypGjREjH5JS9SlAqZRiLIt
 m6CUpbuFX39h6xwdSynSDrnqkCT1Qbzxz0ERTRVogULtjmOf2/ub9EO4EOPO625m+XjI
 AWrnk8YQXmnWnE3AM2tniWhJny841+PBMXJSqbINl0CA1qzUGX9h0NaT29Bws7zMNvvP
 z/3NoJPge9cgdOrildl/vVvaPYFkkGQ1+DhLP10SvyvKJ8M1Z8CujCdgK8eAR2uz44vW
 eZxm3czeYyI9T1aN1gU0zovfITwLDnwDZs356RgA/5vgwm7dk1xvAAJ1xdvnISucqsv3
 fX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLHpMUClYJTmuSpnccdF1X5C+tQESlni33dS/sKHFIg=;
 b=D7NoOs6DnbnjGuA+uIH67do0odlHsmj1BK9ZEuofkJ2Gsp+UJWH8nvuXonkmdJrV4G
 oXSiUo43yMmPuQ1EA+jDc/AM25xd0xDHwvFogluTx9vGZnW59lG8a95Xkc3TnUllgl7C
 ZoRoIOUgOjRAGg4RvrDm+4radvMN//ys190jhI5hKYz0uJ+J5k2sAi5AZiM1oDXXggCm
 HyWmdgmzyclg86CwQH6UIu9JLDQ1jL7fcOTkms0YOK34FgYtmWRySV0NAnCHuhb2zDdE
 VYsktOVk/58nsfQC3tdxsvPzYetBb7Oew32HtDNdnmAsbOAi09liLJERlQlqQJ5I9fPh
 i3ag==
X-Gm-Message-State: APjAAAX28eAAK5xpylH7C2IrGefK5on5EnF3mQCyTDTyUBQoKeBmkyLE
 RA1pX5bWbFYyFsRFLILp2PbLrIMj3QBWGjvlC6abDw==
X-Received: by 2002:aca:281a:: with SMTP id 26mr3910777oix.163.1568206474199; 
 Wed, 11 Sep 2019 05:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-10-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20190904085629.13872-10-shameerali.kolothum.thodi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2019 13:54:23 +0100
Message-ID: <CAFEAcA-0RKq_+wjuJKPUPp0E3=788WSMyBHGUctx2wYaDaWuFQ@mail.gmail.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v10 09/11] docs/specs: Add ACPI GED
 documentation
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vj0VXSTrKWXi

On Wed, 4 Sep 2019 at 09:58, Shameer Kolothum
<shameerali.kolothum.thodi@huawei.com> wrote:
>
> Documents basic concepts of ACPI Generic Event device(GED)
> and interface between QEMU and the ACPI BIOS.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  docs/specs/acpi_hw_reduced_hotplug.txt | 60 ++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 docs/specs/acpi_hw_reduced_hotplug.txt

New documentation in docs/specs should be in .rst format
and listed in docs/specs/index.rst, please. That way
it gets built into the sphinx manual sets we're transitioning
to. The rst markup should hopefully not be too difficult to add.


Some minor typo/grammar fixes below:

> +GED allows HW reduced platforms to handle interrupts in ACPI ASL
> +statements. It follows a very similar approach like the _EVT method

"similar approach to the"

> +from GPIO events. All interrupts are listed in  _CRS and the handler
> +is written in _EVT method. However, Qemu implementation uses a single

"the QEMU implementation"

>+ interrupt for the GED device, relying on IO memory region to communicate

"on an IO memory region"

> +the type of device affected by the interrupt. This way, we can support
> +up to 32 events with a unique interrupt.

> +    [0x0-0x3] Event selector bit field(32 bit) set by Qemu.

Missing space before '('.
"QEMU" should be all-capitals.

thanks
-- PMM
