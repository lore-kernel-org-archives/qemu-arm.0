Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1948021lfm;
        Thu, 16 Apr 2020 08:30:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypIMw7MWafrbS98O/7VySGl9CLMxcXFUdwzg1wIg5hKGyT6orFcFJcwF0Abobx/kSBW8IiH/
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr26854895qtu.336.1587051011018;
        Thu, 16 Apr 2020 08:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587051011; cv=none;
        d=google.com; s=arc-20160816;
        b=ozYQaspwtn01+6NFeDAhFgiWShfUJdLyxhVxiXPrtFjR1hGuslxo0uo4CVqabcmrhX
         GWsaPnyLNkloEapslNi/cRSnNiotsnb4n+FO0t9rHsw3oJmuyCzE1pVqvwQkMHEGrPrj
         UkNwrCXtWhBhTs4V+AAn//dRw34NFTET9FSIBKmrj5lGtAhpG0/XeHoJk4DBOoFbiaud
         pSaDy1R7SGohTzkWTMf2cCbDMhtOLPOugLjrQ/RmmnY5I2FyWipcRRmwjr00Qbn4QOgr
         li7cFpzHi2JWcWL7tdXQeEppUDdawpdfv1omjksSXnQhTcmSieU2xwpzf8d1Fo012Q+k
         faPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oGJOVBGJvfaMOoRlOR4xTYYglnsU4W7X8ab/ejSvg2k=;
        b=BlocNVrfw49Hz4Cda/L0bgxK88UungvXtTMHsSBd6n9TY9Eug//n8mvbdZsRxwh5Vy
         q7bGWBO/LEijnvQmsS2DpGm+6KJtjqWXIPsI0JKCN2I1M4R+uu1Wv8KmxBYxiWcEpgwe
         AKehCOzBLlHuWTFDhYs6KnmujXsPpctsDR/4rvG0AI/4aj1sy64706Wlp4BLSMDAt5Ot
         EwoFH0HEreor5qqAJz3+uwzoq5nT3LlRfg2Vna7JvoWAuXgZUU+t5YXbXK2K5GoBKKo0
         LQKk1UNuuPbxultfdBiAQuZtg+m6UkeURtozq0cmaVilM0ad+TGCDUv5t0SsBrv5NNZD
         aa2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mMMiTUR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p36si11288997qtc.183.2020.04.16.08.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 08:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mMMiTUR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP6Sw-0007ys-DN
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6Sn-0007wo-Dg
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:30:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP6Sl-00070z-9l
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:30:01 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP6Sl-00070R-5e
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 11:29:59 -0400
Received: by mail-oi1-x243.google.com with SMTP id d7so11836522oif.9
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oGJOVBGJvfaMOoRlOR4xTYYglnsU4W7X8ab/ejSvg2k=;
 b=mMMiTUR2tFxMc5b0yZb/Z6s96kn3F4LTMhaz6kLWtUA7z4Goa96R56cD6VX5GN0cCM
 IPrFFKaJZvde/dirPmj44u1wgxmaQFMgNYw8E02nMU9704Knq7A0UNfnvf7CbruTQ1Tf
 STQI2KUeZ1fCQfa0jdrkizSzEuRYaNmOzazp/+B2953uuXTkgv64IAcEdpNsjDTVaSNf
 xAERRGCD9X5+MdwGw7iMgw0TjkUBLV8snOsoa1Nc4AS9XNO/RQpQTsonY/2ooY+KHQaU
 1ttageNleMrAfyCxXE4QwDOIXI+GEeUoMf++mkrdifmuA4yPpc+2xM667oQxIxLtlNBl
 7vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGJOVBGJvfaMOoRlOR4xTYYglnsU4W7X8ab/ejSvg2k=;
 b=SwtdMhVvIIvDBqaE9iOxLx4cpcf4CSEbCTBN2TWOCYcQ+/maFE7NctOeC4J3ZNui5L
 KaScM7Fs6Lk4odg+3RaNmjZmS/cmIfiH/P6uD1rHPKA1SALgLdoGV2QJZSFPBT8nFoCt
 V5bcg4t6j2iL3cRmaY9Qes9DHqUW4PDOGOzpn63N2GicW5riOQQZEej93KCXNMx7IeRN
 Rje0oJaBVbHlJ6ydaBwQfBb7533K40OgJahmJtIdSuZVdTr/Jv3Ybxd1rej/E2wJvl8O
 VsJpVQgFdO7s6LAsaPD5RIXwDt5J2wB8P1Kz+Pmn2LdtdKdC9fcAtLovajYJkxwaT2or
 EGXg==
X-Gm-Message-State: AGi0PuYwzhQlm+eLShYJcak8B+kOevY8BOweBdHnh5yhcRHXAaiIElyu
 C+c1lLtLsjhcmRR90B/sUJOI7cZ5sT2zqQBeTF4KZg==
X-Received: by 2002:aca:170e:: with SMTP id j14mr3260651oii.163.1587050997832; 
 Thu, 16 Apr 2020 08:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200322211919.11335-1-linux@roeck-us.net>
 <20200322211919.11335-9-linux@roeck-us.net>
In-Reply-To: <20200322211919.11335-9-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 16:29:46 +0100
Message-ID: <CAFEAcA9drmvK5aiCtugLFABKf9t+XMkt6AhS75VhzABzXVMhGQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/arm/fsl-imx7: Connect watchdog interrupts
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vj7z9rmhNpuo

On Sun, 22 Mar 2020 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> i.MX7 supports watchdog pretimeout interupts. With this commit,
> the watchdog in mcimx7d-sabre is fully operational, including
> pretimeout support.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index 47826da2b7..da977f9ffb 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -228,6 +228,11 @@ enum FslIMX7IRQs {
>      FSL_IMX7_USB2_IRQ     = 42,
>      FSL_IMX7_USB3_IRQ     = 40,
>
> +    FSL_IMX7_WDOG1_IRQ    = 78,
> +    FSL_IMX7_WDOG2_IRQ    = 79,
> +    FSL_IMX7_WDOG3_IRQ    = 10,
> +    FSL_IMX7_WDOG4_IRQ    = 109,

irq 10 for wdog3 seems to match the kernel's dts, but it's
a bit weird that it's way out of the range of the others.
Did you sanity check it against the imx7 data sheet and/or
real h/w behaviour that it's not a typo for
one-hundred-and-something? (108 would be the obvious guess...)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
