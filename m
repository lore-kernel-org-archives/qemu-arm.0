Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3360501wrv;
        Sun, 14 Jul 2019 14:57:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMT5ZcXn5/QRiojLNnjBPJakZdLyNRg41oS8nhijuNl+3aK/sPSiaQ8zxSOoJE1UtIEGwD
X-Received: by 2002:a50:b0e3:: with SMTP id j90mr20070899edd.26.1563141442309;
        Sun, 14 Jul 2019 14:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563141442; cv=none;
        d=google.com; s=arc-20160816;
        b=GGfqTrgo22an3Xo7fa+4o9X/288hUBIjy+QkYxbIXTJssxu/XJeOAkUpFHXgGAHeqD
         yRj1tAMBCievXb1t8SV+yftIxn/GsaqUcGgCaYUNTR5it0hNNm8eEmwR1FoUUJKANJTX
         espGBO7x7P6giS4OxLkN9voBzmaZbZCXNVQqD66k+5uRMH1Dh3CMHhdkhusfsm6GVp+e
         XSegqBqNSxJc1h2Db1PG87APt5ePnGrkOr5BK4e+m3xds35EGhBgsIVJ2m5EFKQbJQed
         s1UmqIMssUyjXJ3TB0b2MruVqGTpI18n2+cVaffuOM7zlHlb34REcsSqWBnWA/BvfgIk
         Fyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=bEKTt/XYoRgjTPiN7Hc4VsVSknUFPFM8poc/rCk3dVM=;
        b=UJVdnmyPBHPKKkDR4lOrEjIX/5WgYhMkog/soobRom6gE16wkQ656egh4UyQSLk33L
         VgDFcUYb82D4dJma2re8SWdF+EDuwCTbq6NT8SOfsR+T9PLZGSoGhxQgMXenk/yzzA3f
         rrAQGW6eqHQf7VKqnNzacpbEFz2j7HalSaA7AiWWTGjBq944c3R6z3R55x9MumKQ8Gjk
         q9+J1U2Em963tYqQjquJWo2mCo0QZSOGPQEvlkJXlTDuK0eJj0deBBDs23E9tUrjBRgG
         ISG2boOoaaj8cXjQHPViazD2EvMSK/BbH6xBDazbCqO4M+aHCTrDpN6A8b85wuWckrDf
         AQ4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7kSoUHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si9450059edc.90.2019.07.14.14.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 14:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=I7kSoUHb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmmUj-0004VO-Es
	for alex.bennee@linaro.org; Sun, 14 Jul 2019 17:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44597)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groeck7@gmail.com>) id 1hmmUf-0004V1-Rt
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 17:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1hmmUe-0002CK-MK
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 17:57:17 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38670)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1hmmUe-0002Bl-Gh; Sun, 14 Jul 2019 17:57:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id y15so6509375pfn.5;
 Sun, 14 Jul 2019 14:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bEKTt/XYoRgjTPiN7Hc4VsVSknUFPFM8poc/rCk3dVM=;
 b=I7kSoUHbV9BHDOwdl0EkCwsUNu9DSyObQnqQ8kU6/Bf1/Bt9LA5OLyQKE62/R5hh4G
 TXOgleK/1E6zI9YVaujFVFCekPQm9owXkhBau9/dZ1k0oKVPX8GifI+AbsnKLyWJurMh
 4+yA3JTkAD7XRoZdAOPwzDZ4lGiAdE4efR/wKKpsbSCbhmex4oU8tX9qbpFd8MJDMP63
 jrvdWE3LFw9ekunJUUwCJnw3stnsJPKR1LfwpwdFnNNDf9K+T4dpL3lDBmIXXaMvmadd
 GFpHLuC05dvfMygttuhPpTiu9Dy0nfBaYi8nS89g4Q0JEG5P/Vwtb0gYTrYK5R0FadWZ
 +F3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bEKTt/XYoRgjTPiN7Hc4VsVSknUFPFM8poc/rCk3dVM=;
 b=fT3FUx4akzkOKUh/onYEJRrJh6dJlInRlqyJx//r7JaGlj6ZTevRkT0wzjGk0c2srS
 cOoAeGPvm/n1hh1nUE4fuUx2DvP216C2DwTiuckdbjmsoVDXGuyJPGPFz0BbvguixVrb
 hKnph188tYgvT2TukIVs6behKsyytdPPIEpkGvAFzzQ5z4imfobvYZjHi8sdFkfyLziu
 +tX7/tPCw0rZGY/U3Mnrhvb24WPNf6SG3Thck4CJO4kTry8oWSLOhXgI7ONKSCNMnlhM
 3DLAsujyXO0Cl4ZvJD7LqjpAds9XxMdu7G+xdfxzDE7c/U2HiHqVFcGGYSP5sDmgoRjv
 HIQQ==
X-Gm-Message-State: APjAAAWrIJGLMmkcCBl7+0vdW8PNsU14dCMOJDAWHiBnZhtkZS59wk9p
 PYaJqLaR/6gBI+ncoPxqnSA=
X-Received: by 2002:a17:90a:3ac2:: with SMTP id
 b60mr25903072pjc.74.1563141435344; 
 Sun, 14 Jul 2019 14:57:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i3sm16396908pfo.138.2019.07.14.14.57.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 14:57:14 -0700 (PDT)
To: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
 <20190714152010.GA28247@roeck-us.net>
 <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <bfc94fff-e84f-c07f-322d-d9430048512c@roeck-us.net>
Date: Sun, 14 Jul 2019 14:57:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEK-wKk+1RQRmFOy8Rp+6fsOaZvzJvXSPNnyTKFY-7c-_VYSXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference
 Machine
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, ard.biesheuvel@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 leif.lindholm@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B9nde6Cqxxxn

On 7/14/19 8:40 AM, Radoslaw Biernacki wrote:
> This machine is not ment for direct kernel boot. Is main purpose is development of FW, kernel and other HW/SW parts for SBSA. We are currently working on UEFI and ATF for this machine.
> 
> It might be somehow possible to run kernel with DT but we do not support it at this moment. If all you want is to boot kernel directly, it is far more convenient to use existing virt machine.
> 

Too bad. As you may know, I am testing the Linux kernel by running it with as many qemu
machines as possible. I already run several boot tests with the 'virt' machine, and
I was trying to extend test coverage with the sbsa machine.

Guenter

> niedz., 14 lip 2019, 17:20 użytkownik Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> napisał:
> 
>     Hi,
> 
>     On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
>      > For the Aarch64, there is one machine 'virt', it is primarily meant to
>      > run on KVM and execute virtualization workloads, but we need an
>      > environment as faithful as possible to physical hardware,  to support
>      > firmware and OS development for pysical Aarch64 machines.
>      >
> 
>     I tried to boot linux on this machine with -kernel command line argument,
>     but have not been successful. Can someone point me to a working command
>     line, one that lets me load the kernel directly ?
> 
>     Thanks,
>     Guenter
> 

