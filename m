Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp894094lfp;
        Thu, 23 Jan 2020 09:01:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxq26R++pgLxzHrIyV6jhgCjYwxuC8UGRFRVP0MM0i/MAC0jOONKFZMoOdsOnGtLNf+ILh/
X-Received: by 2002:a37:4702:: with SMTP id u2mr17037276qka.106.1579798903718;
        Thu, 23 Jan 2020 09:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579798903; cv=none;
        d=google.com; s=arc-20160816;
        b=WVooYl1+61YIGLHuveNqg0jfGQnjTpBMceC8MSf2f9QwqDFw75zlPM97uIYn1MAVT7
         cHvccDdPNoMm3ZbbIU2Fco19VBxaoycwJPsoRnEsN7fv0GEJc8RzAK6sSighuAQx5Fmm
         7QO2s4WhgYZFT4wa78PLzC0rN8+u3gRU06ru7h80ryU3LtcS26pkD2YlPA1rmg7jzUk5
         1PsID/XXJE0E5z+5dxzk649qJBC4M+sbft2QFBb6PCsGztfk2X5VZvP512Gpro0vNWK2
         zoBy7UeV8IPXaQHBif3vOqkqK2ARpxj/pGpH2NLPYZYPlcMpJGdofQ7TuK1wYjqWBnuQ
         cC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4YdT+X4UZ9T1P6M+i6pylJQ2Rj9JmdJAcxMgiXyp4xU=;
        b=RkKtcQwwbW1XcCOIhEYesLfQlgvHTdN9vTmtihGeAfhgwBmQNeOl4e5ykLYu5p8Zc+
         SySHml3EF/t/blWrrhtu1xP9qnyfLd5oQjXaQ+vXgZFAYaAw2j1vtAPnjIwQhDLYXyR0
         ybNIBDkniWQZVmfiVtFaQpe1fzm0pXfEI2g7wRbPXheLJB9LgoUB6tbOM8+T93MJarXu
         1In1Fmh5Sh3iUUEKmFUEI00C8z+b+Nr+Hs8WKdnPRHz/AkG7N9Hgd7u39x+KTJv7vcHF
         WcFa1oTKcjhc8HhHk98VOErJnxc5STyvkf45IU1n0r7hwvvcw2k1m4/v4fFrnkcgX71V
         d7HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcZ0CQug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1650020qtp.110.2020.01.23.09.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 09:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcZ0CQug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iufrS-0002eS-Gl
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 12:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iueI1-0002Xw-Te
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 10:21:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iueI0-0004vo-PW
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 10:21:01 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43171)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iueI0-0004vC-6b
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 10:21:00 -0500
Received: by mail-oi1-x244.google.com with SMTP id p125so3189158oif.10
 for <qemu-arm@nongnu.org>; Thu, 23 Jan 2020 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YdT+X4UZ9T1P6M+i6pylJQ2Rj9JmdJAcxMgiXyp4xU=;
 b=hcZ0CQug0H7HdJiAOe36eeO7mVDQSQQ5aUHT0KSFFZ9s22v1G6e/hVWtBsuDqmxMGJ
 0FPDZTG5IbsOCqZKwvMisZnKgcDUU3olMx126ZxEyk6mixI/7kMF/Emhu6Tz7uUd48Yq
 TF8pi2sVSivP59sK2wepgBKfry7rvT1iiCUFQ83m99+lPT/+dp8O35NAuWCvpy9zPGik
 JvOjHvpfS3pUTPV7k4C89xs6TouhZdB4dDc6Y76fzgXwtgFUF2UGDEEqRBVSaptZNS5l
 JEy2qC5KnIi1NEjqyTAbkdMDI6+1kLUR08J0KxpoHLSMfVnsKu5OaFVjYYIFKruJyZOZ
 7LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YdT+X4UZ9T1P6M+i6pylJQ2Rj9JmdJAcxMgiXyp4xU=;
 b=TJ0GJZjJmojrrGVWmE5+M+ZJCw0iGutNquEUoEEsbminQAOUH8Ulj8QgghVgxpDWYw
 fIzkIItyy2gfC5YHER4DmjYdEDzp6EVWopTS6Y/0B8Y2IFJ25rR73jWjjQTkZbh9wb8J
 NbeNmf/WtcD//0iBggtHda4qvLKXKFlrnB8oL9d0f53HsMB/9mCxBCVaAj1RfyoVvC5o
 7K1HQb30JpMjU0QuWGug/25Q93BVPU3PQtumfiWwG868tXuEVfHVP0RbpCxDNW6hq5Wi
 KuCd9+2a56aLoRcC7xEusG5Q+k1YS0vFpxY6/GU8ErPJ5/8pTNfCnSIGkxBH89x5l8Yi
 RPQQ==
X-Gm-Message-State: APjAAAVHAvDb23RAxtJTFAAI9/ynTvv2MArUJW6Albt1VvtM8R264U72
 Svw3KH7Os1sEwScPdqbwvpdOQzrSMANtW4ar/KoRLA==
X-Received: by 2002:aca:3182:: with SMTP id
 x124mr10935204oix.170.1579792859484; 
 Thu, 23 Jan 2020 07:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20200123052540.6132-1-linux@roeck-us.net>
In-Reply-To: <20200123052540.6132-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 15:20:48 +0000
Message-ID: <CAFEAcA_CVt87SwQ7OdB=phedEez1K_mJyrMLkY9dCZuzNFfEsg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Fix Exynos4210 DMA support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6YZEueArt5jp

On Thu, 23 Jan 2020 at 05:25, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
> introduced DMA support for Exynos4210. Unfortunately, it never really
> worked. DMA interrupt line and polarity was wrong, and the serial port
> needs extra code to support DMA. This patch series fixes the problem.
>
> The series also converts pl330 and exynos4210_uart code to support tracing.
> While not strictly necessary, this was very useful for debugging,
> and it seemed too valuable to drop it from the final series. Similar,
> improved support for receive FIFO handling is not strictly necessary
> to fix DMA handling, but I initially thought that it was and added the
> code. Like tracing support it seemed too valuable to drop it.
>
> The series was tested with qemu's smdkc210 and nuri emulations and with
> exynos4210-smdkv310.dtb. Without the series, the emulation does not react
> to serial line input, and serial line output stalls when using DMA. With
> this series in place, serial line input is handled correctly, serial
> output does not stall, and DMA interrupts are observed and handled.

Applied to target-arm.next, thanks.

-- PMM
