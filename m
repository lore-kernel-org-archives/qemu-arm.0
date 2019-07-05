Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3628995wru;
        Fri, 5 Jul 2019 15:53:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIMIUjjkXHUMPG17cWhSU0JaJe4+X7K68417uhTUGL29kt7/DX1YJw0JnEQ8oAiB1DSMiu
X-Received: by 2002:a50:b60a:: with SMTP id b10mr7055915ede.113.1562367232467;
        Fri, 05 Jul 2019 15:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562367232; cv=none;
        d=google.com; s=arc-20160816;
        b=q611MIDFNUYEUqY5J0z3/ak/Cpvi2REIR6FB0WNOZaecxJo64nm2j1VnwZIEC5nsaK
         Sklkpw8tO+6SKHdJVMa1Doetm09FJBcscBb4mii6T5XySmBaKOht0RGgtmO6E8l+VWqV
         efBqnMaoa37zE2QJM4g3iiURizdUw0gIwU4BkUFf+43jOgTaKmVWGz1EaH2NKttKdric
         lhjSsSY2NIRHcFa21uXCHENNdRUk6fEzASgwI6V11O/k+sBmJFz2UHGRTMtP3OzCBevs
         97P8AOxSLbwB3J7kR6ApnL4muyUih59P/F4PuugVhmgmhBymh3Aq5FYRmZy/GnAu4SK/
         Mafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=XW3tmrwiN3lQGHCFyidFYxKHrgyhO62gI0oGWxjTRsM=;
        b=dY/rXwJpLP5T56r3pU+7R1c4SYTAwSuR618kQKpdRBExfk0Gncdt2ON3oH9xqLTf+F
         Y1xWzmLf8e3cS3V0iCTgF8KfRgMDLEqmsnDOJLgZU8EPuEalJCzirprsBAzy6Ev6q6X3
         ZIG/5lsaQqZJ0tAZ39Kf3LH5GnULP4G+xjZPp2gYbSEPQFRVTJqe3txPta+2c9tQA0Qk
         w8ivWVBEs6hhPz16rwQtH49BrWl1DTC4CaW3LJZOzimXXNtptHciKBSe2nLDuobUyY9t
         3SQYmCHD2w7snO+AVHiHeYy4ryszZ+4GntTfXW4BoY19wVkVyVCFzxhUJt+0wVNuGdvg
         yE/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q2FbWTCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si2376273edd.411.2019.07.05.15.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 15:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q2FbWTCr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjX5T-0004YL-Ip
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 18:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjWdF-0007G1-Ts
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 18:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hjWdE-0001Yg-Fd
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 18:24:41 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45805)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hjWdB-0001Tl-Bz; Fri, 05 Jul 2019 18:24:37 -0400
Received: by mail-lj1-x244.google.com with SMTP id m23so10506987lje.12;
 Fri, 05 Jul 2019 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=XW3tmrwiN3lQGHCFyidFYxKHrgyhO62gI0oGWxjTRsM=;
 b=q2FbWTCrsorrIH+D8uBPpBxoBPMFzqUoJ0FySqRd8iXxZjcX16zXzvCtwdPHPHUs6W
 SOGQw8l1xSNO9nysD/a67O+sc42OE9hGNBziIhbwmZZ0zluAEyO/yd00Yxinpz09ir9C
 cypYl2jL97L9UKGbOsqPT6l6Yxj1TTE350CPygL2LpItZmtDDxGMcw/f8578Yqtg33K4
 +w9vumWoaPnOOXpj77II7h1fEIGXu0q1BEDOvhCtCrAwTuewvzRb3BguYEMrVmdQgv61
 Fd6q6DkPw9dk65X1EsSEcpg1PkcRydLuxugoNeyLcZeWw92S/m/vs6jwK60Yw1aRI19b
 9rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XW3tmrwiN3lQGHCFyidFYxKHrgyhO62gI0oGWxjTRsM=;
 b=BE+ve23l+Ynoc4p8itKJsPkxBSr9NoEjP8/TiAM00jYe7mehU8DBxo5yeaJF3W/5k2
 hW3/UM8onbCVZTv7NPcGfy4Cs4ZnNdaw+vQ+2stvd+jOIqyLUsbFZ2FYSsikvfZcZldL
 JnEeuBJFkKeKY7tx6BvvWqk/qtoEtO1DDelvhOdp8mirg68VegSRDSFRaKcHb8xnE3Eo
 vTWh66i4dm5UVj9J2i8dLx08uyp0XnlnIMije1EODULIzuWJiFU5vkKeRncbc2XlQXr8
 ye2MqJw/AUDVW3norcYn0PAgWR/UKKACXHO8ZUe5Eg51CbGvY2y+boIreviYNO2mj5Jj
 0Rgw==
X-Gm-Message-State: APjAAAXDFRiOOGOTw1BIB2PCeDMlf3cAtw4YprKUrnu0PIoIqTNvXBUB
 Z9detRPoYBh0Qod0dN4B5PA=
X-Received: by 2002:a2e:9d18:: with SMTP id t24mr3485658lji.2.1562365473110;
 Fri, 05 Jul 2019 15:24:33 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 b192sm1575650lfg.75.2019.07.05.15.24.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Jul 2019 15:24:32 -0700 (PDT)
Date: Sat, 6 Jul 2019 00:24:30 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190705222429.ox6z6wckkupjpug2@fralle-msi>
References: <20190705202500.18853-1-philmd@redhat.com>
 <20190705202500.18853-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190705202500.18853-4-philmd@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [RFC PATCH-for-4.1 v4 3/3] hw/ssi/xilinx_spips:
 Avoid out-of-bound access to lqspi_buf[]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k/DCrzW23uTj

Hi Philippe,

On [2019 Jul 05] Fri 22:25:00, Philippe Mathieu-Daudé wrote:
> Both lqspi_read() and lqspi_load_cache() expect a 32-bit
> aligned address.
> 
> Set MemoryRegionOps.impl values to force 32-bit accesses,
> this way we are sure we do not access the lqspi_buf[] array
> out of bound.

The patch and correction follows chapter 24 aswell (UG1085) so I suggest
dropping 'RFC' in the subject.

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Late friday patch...
> 
>  hw/ssi/xilinx_spips.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 3c4e8365ee..8f705132a3 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -1243,6 +1243,10 @@ static const MemoryRegionOps lqspi_ops = {
>          .min_access_size = 1,
>          .max_access_size = 4
>      }

A comma is missing on the line above (else the patch doesn't compile).

Best regards,
Francisco

> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    }
>  };
>  
>  static void xilinx_spips_realize(DeviceState *dev, Error **errp)
> -- 
> 2.20.1
> 
