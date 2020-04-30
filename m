Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2045295lfm;
        Thu, 30 Apr 2020 08:56:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypL0fY93cDj8AtikuKrSGHok/EeAVN+5LbEv02uEvW5RMLJZcffZt6NOucBnEoY5v250+FfA
X-Received: by 2002:aed:2ce6:: with SMTP id g93mr4616118qtd.264.1588262181613;
        Thu, 30 Apr 2020 08:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588262181; cv=none;
        d=google.com; s=arc-20160816;
        b=PWu5prVylF14cluM2vtvGoblE/ppBSSKzALsmfHI44BYw7O0T7C9x+ituOhC/s2/4N
         lvv5AqqZeR2sq+bZKrnCSfFclXKBqjXIV8oeTKtPFY7sTjbQvFxIBHjIGYQKVwcWQWd9
         ejFq8QV2NbTI9qVTaW4Wy5l1o/cyX1grL2ECnP5S/+8kd+pTJVhfT2y6bSg0GNzVdGEh
         e7r3Ucl0guoXPy/vs7zbXE3KB//7X+yT1jvS3ZVYAm4DwXB24VbiXbkLu+tgwI4IGrVd
         5sG13W33qfCOSzNrE5L6+r1aUOcMg/tI4QNXbXCAyEEXYM8Gqfcn6Qc47eHOumuP5Chd
         9yfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
        b=vfabtN5t+yg78s3BorTk5YuPOPevfSEeYFNGHGIuF0Duyz0EpemymCYpqyGYqjPYnH
         zTySi7762vCwg5FxC017YuL/vjovJ29LYtPG2I+igG1PN6xgFPJaVVRh10lzm0n/l2/e
         ftS7cwz5TtXGsuZluONlq7Bi5T1OhtweBOc94VcT1AFmio1/re+cRoNG/DZJXphr9CW+
         FWQglSNFZ3COOua4iG9dT518J5X5nhokBHFN5H2+K0FOGYbGp/fPSOuBsMfHv4QXRfxn
         yhTZbCnK2cVvLPcz9edO01LUZbEwZAbt52c9D2C76Q4WUDMhYz/NQnjahyvMY6grp3iK
         eKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgU1xVL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k19si26474qtu.372.2020.04.30.08.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 08:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgU1xVL5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUBXw-0000Kh-Sy
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 11:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBWc-0007eL-Hp
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBUH-00032Z-Lr
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:54:58 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBUH-000326-2g
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:52:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id m18so5290773otq.9
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=NgU1xVL5dlm6s/vd508ky3LILETIShXJR9DvsuTXIu5wNU14jxv6LBeelmlVsqo37m
 c2QNxwyA/zH6z8Lqphum/NUhatGuN6BJoSdiYBcpFn97mCkPfLmGuieq440TQ9mn+nuW
 zRjsWCLdCgIAOV6GM+b3n/oMIcnIqba0AzXs70I/IscDhUJhogpLitXw65PaAqlo26S6
 TXy5KJ68AgZp8X++SD580wRKofYxCsok3P1UEVhFufdvSQgPbkE9NP2zfJlv8fHqsZeF
 WRx049Yai0N6D/FaxPdHv+fPwa18tg9AEuTToU4VUoOV9Xd4/CWChKimAhPzc9QHgzHg
 8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqJGNyVDz211UW5Fz6r9VsMwrvbPs0yJjE+VVXfRzaY=;
 b=qBoVxLK+cBhzz7z03XbPeB3TxtJAnbwamR6s2+upIFMipyMC2zlFrqfItM9J+SYUnq
 HoVpqAbc+wbNy9TluJCU9+ta+U49KfH/oaPNCW1hYdlJn+sEeEZRyQLDCCLSVupbMydP
 aTt5qdK4ZNvauPPAAIAmXEMKq/fU+3UJc5dcc6Tm+a+VsVsBT1HAvUTXTA840quJONJd
 CLnrD/ZUH0hw1J6JDLmRJDFvlXvOHRBGykkZdCDnXGX+/rr8VWHLWZp/h1HGut7eJOwU
 l6D4u0XDuMwJU/csGexYJgQ1Y+iYJSvLkD+NPa9W7fPYuxYT7exp4reHybi3ZxGbsqvV
 VJXw==
X-Gm-Message-State: AGi0PuYaEQrm3xsK/n8bBURArx7L6hggq7yv83e0oZhBvS1mkOoqhzoz
 yHldnRryKENsJALbK4MDE0PUZLKxotdLZ8KcFH+blQ==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr2937146otc.221.1588261951836; 
 Thu, 30 Apr 2020 08:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200428154650.21991-1-f4bug@amsat.org>
In-Reply-To: <20200428154650.21991-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:52:21 +0100
Message-ID: <CAFEAcA-1FmK0x3+X2Gzd_e20oz4OaRWV=CSVHA7EOLjc3EvJGw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2-tz: Use TYPE_IOTKIT instead of hardcoded
 string
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m17SIKz0+EhT

On Tue, 28 Apr 2020 at 16:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> By using the TYPE_* definitions for devices, we can:
>  - quickly find where devices are used with 'git-grep'
>  - easily rename a device (one-line change).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
