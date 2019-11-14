Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5308179wrr;
        Thu, 14 Nov 2019 02:55:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvu/e1VSJv2ZLQgwS5p657exMmJm9w53oPNA4a9Bm4tUIC0F72+Tf5ZbTguYLTG74YihbT
X-Received: by 2002:a37:c247:: with SMTP id j7mr5242522qkm.67.1573728944514;
        Thu, 14 Nov 2019 02:55:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573728944; cv=none;
        d=google.com; s=arc-20160816;
        b=lMDSv071ZufFTQ6UiewDNxZmrSMjO7QDuoA0vsPQzC17qoJSkksVTHfdE5xWUKJtii
         7bWtuPRzaXmJBMEtQENvif/zYK8IolHLB3aXEel2vWpKHKvKIbjVe+Ug0k90hK19Gunk
         SHcv6oebM9aSr+gDpeaodWu30zaBpA88Hef98oARRlhZcDjq0EpQwf+YiTHo78kN7QH0
         uB3wreFXSo1SEt/e9Fnr3Jol1LIrhleEslDZt8ii6Of4WbJ1fjbcb1JeGq2W1A4G0w7k
         GpkmqChJMZLM8t5he4Cr4u9ULP/p4nobaakTJ37XJ7WEjlGqlDyRV60jBo/YzIntOmc0
         lf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZ0ylmkXsIplerPFJxQgGpQ9VIXN/Qodc2B+0SARefY=;
        b=bRDsTPg585pIwFMZ6MuhlkPWmmeDZHinn3FJOYEolXqCtpzB7V76NANKOrqxj+r8F3
         pBNBUgDRUTVT7U7OcxisLMRzGWHg2AxG8ge6LbEZYx6FSZaVxCUcFbqwL58setbD8GQw
         Ov8bCnIx6AUHwAZmw6+AFvPmxwLrD3S0kSJfSKNSFPdAkqPfaUyg3/OMCpG9tdgvTum2
         sYiIwGW7UopvbS4UlYWQjFOtwME16R5UyNvWSqF++r16VSurlP2spv8KgClE/5w87mjf
         ZISkLe96IrPSamypzaclE3VAkKBqHuaxS5uD+AjR6ieodew+DbV/pZieAgpxSQNAbEr4
         ObNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=def9eR41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si3020110qka.60.2019.11.14.02.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 02:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=def9eR41;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVCmu-0000xJ-1W
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 05:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVCm1-0000H0-6O
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:54:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVClz-0003zL-UY
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:54:48 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44578)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVClz-0003z1-OB
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:54:47 -0500
Received: by mail-ot1-x343.google.com with SMTP id c19so4444736otr.11
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 02:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zZ0ylmkXsIplerPFJxQgGpQ9VIXN/Qodc2B+0SARefY=;
 b=def9eR41/d60Y071XMBVRGM7H5vlFCJuk66b6KDe46G8qIEi1d9bsvsqe638BWUJ9K
 orRt32CF2+1zvz6qsL9dS91/c4R1E/AHdE7fXM5MtvRA6PeujN9JO81gAn7HA68t5NvK
 QVhXavnzIVZ18FRK1U+T2z3OLmn9Qdo8FpIkdaeF8uamG7zQWc1mXvpKd8s+bgfocrIR
 iirBU7y56mK7bPjOM0cBpuHW0JkTQ8m1LCkI+mbJPF6uEQ1eelGRbO3RdV3mGA36SznH
 bKZB2hJGhWiA3ePDdBTMHwZpglvcFtlvx8kI+rDahtPbiSUTSlqr2KjtOKotNRzkPnVV
 t4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zZ0ylmkXsIplerPFJxQgGpQ9VIXN/Qodc2B+0SARefY=;
 b=eA0cc2oYLMJdCPR7M907mySjXed0AfDowL9FnY+9zPZAkU4vUwAYp8k0zhAQpwqEmv
 7M9+Fdv5yHPTrbOWtCAqOAUEyJKgHvHhStL6lMS367ZB0pdTM8CCG7zQzRz8ODquRo3v
 CDeImbiEEpl5f/h4iDy7iX8SIoi8FQ84Yy3fAyASa/LpjnNfJ26WY9oyRcn6U1kRKzUx
 4I2Ugny7YWf8hHaElQfflh6xPVxDcm+n4D3mcbu2JeS3BWqXPBgxhXWYDxQ8Bojr80LX
 U+bqVMMlNFV/YyyH8frTHL3QW+x2C6gKEpQZbQbtVs1/CtSMhaamfBys6oJWSN5iaCag
 VQew==
X-Gm-Message-State: APjAAAUaO2nvvuyf7QfUocvTWk/CD5olWFUMwU4KiPtv/retzF+7q7yc
 8h2659wG+NJzp245ffANRtIRcC9FUekuDyusGGjNig==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr7316454otg.232.1573728886718; 
 Thu, 14 Nov 2019 02:54:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
 <CAFEAcA-hSPZG5sVcnBbHRHwDgc_Qh3wjCsvZ99o6uyTZU-a68A@mail.gmail.com>
 <CA+aXn+ELraCL77cDQrL6nhCOvtc5f1d0-8hjFw3NbG4ATdAe3Q@mail.gmail.com>
In-Reply-To: <CA+aXn+ELraCL77cDQrL6nhCOvtc5f1d0-8hjFw3NbG4ATdAe3Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 10:54:35 +0000
Message-ID: <CAFEAcA9n92CSSnD-0x95nz4QZVBKP+dNbYeHw7OS_O=SVe7h4w@mail.gmail.com>
Subject: Re: Qemu support for mcimx6ul-evk machine
To: Pratik Parvati <pratikp@vayavyalabs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: cYu4LJhGR6fn

On Thu, 14 Nov 2019 at 10:43, Pratik Parvati <pratikp@vayavyalabs.com> wrote:
>
> Hi Peter,
>
> Thanks for the reply.
>
> I have run the qemu command with dtb file
>
> $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage -monitor stdio -dtb output/images/imx6ul-14x14-evk.dtb
>
> I am seeing a serial0 console popping up but there is no log on the console. I see something like this
>
>
>
> There is no rootfs now So, I should at least see logs with a kernel panic at the end. I wonder why I am not seeing any linux boot logs on the console. Did I miss anything in the command?


It doesn't look obviously wrong. Possibly either:
 * it's the wrong dtb for this board (though the filename
   looks right)
 * the kernel is not configured correctly
 * the kernel is trying to access some device that QEMU
   doesn't model and crashing

Generally bootup problems all manifest in about the same way:
the kernel dies before managing to print anything to serial.
You need to debug them the same way you'd debug board bringup
on real hardware -- the QEMU gdbstub can sometimes be helpful.

thanks
-- PMM
