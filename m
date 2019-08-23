Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp851178wrs;
        Fri, 23 Aug 2019 10:30:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMbunEkPYCnDFOvON3VJjrPOp1hGxM1zO5QwMOpVQ/1gGhQv8sOm8JsP64J5d+OeaU8Umr
X-Received: by 2002:ad4:430b:: with SMTP id c11mr4797191qvs.186.1566581442521;
        Fri, 23 Aug 2019 10:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566581442; cv=none;
        d=google.com; s=arc-20160816;
        b=nTiwpMqQAUg6lJ3726XWDDAV/xEqMA/G8H+CPVHFbc5LshZDA5O6b9FMcGwvllkyM+
         /LlBfTDljFbB9ttoP2YeqCHcORA2eBtEWlVFNd0gWrFVPemJzBEbSCQtaNDnL1HLE65A
         eJG/aWYk8OMb07PZCWe4WnzieZjgJ7gQzpHP9d0XWjSaKu/a+Pm2YrWSihAC23n8K2EK
         Xre1sc64LsQg66uL+Pifa0i7Hw3x/zQOQgptAeQa5SZn71E5MKo0dJfGfzYhPR8oKwIG
         dmA9tzrhaEOTaF4z3yWtMDRoal2oUCgjM0xoozkhIYw7FPzblf2Mb/nHwb5xzi0KjCgV
         hdjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=lSRc/EYedoSGfDyvA5pSG0DkenOoEztPhaYLjMmZDjg=;
        b=Uj2NeJAMkfOg7zjCYeloO/cHT6zeuQV32NPc5vUesCjkqOTmBIGKXv5eAVb8YNQh30
         1Wsku6MmIxHY9S6gHre+/aJVwPKWGEc/KESk4rIB+L0UuSjZSyECv+Dubgf2kYWyxf2W
         IEL18pRttqI9xZl/cDYAS5FA5Lj4s4p1QJuwNKSkJ97mzpUe0f88QClm5KAWWKUmOkBS
         eiunR5JT4AI6Db1lacYGKTqDLdLFxBKLk1oFzFZLlfuOzbITb0kJc7+0TqkWen3+uN2G
         WzJp1jwn+AY2CC9OCHpB1TiIsQJlHMevBAZFcjypctPSf08jv4FLDqV3zCKDfCpSotyT
         vEog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cF/eo0TM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si2449153qtc.296.2019.08.23.10.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 10:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="cF/eo0TM";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1DOb-0005qK-DF
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 13:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DNt-0005S5-II
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1DNs-00056a-H4
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1DNs-00056F-BO
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 13:29:56 -0400
Received: by mail-pf1-x442.google.com with SMTP id q139so6851729pfc.13
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lSRc/EYedoSGfDyvA5pSG0DkenOoEztPhaYLjMmZDjg=;
 b=cF/eo0TMTCpLiYbUD+lgWP+o9BMD/A51fAhT6CY67bHsSKB99l9Xn/YtlZ/Gl0Kky6
 LUGW9pAAOXkxmppc3cWD8q8024NgJRTlm+JKoHSdvqot2DmC6lHTS1pZQuE1y43afux7
 8TT3dI46TZJOCxLQLD12Q/JywrNdoyBSte5NixFHfsuzFhLtZl7NnwCimGCtiOaTtieX
 l27x55j+bg/I4VZW1yW66XS41dy41MpXlW4z2nhAL3yI9ZZcdvoyB/R9ODdH8RSMFqw4
 y4eViap4eRP8m/uWmxtlnYd1DuV2tOZe8Z/kNDhquzU2QQZAZgpfUJLnFY5n1pZIXs2x
 H0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lSRc/EYedoSGfDyvA5pSG0DkenOoEztPhaYLjMmZDjg=;
 b=R3PdQlXGXY/fPl12JRWdZ6L3lX4eBdlRtWO9zL5W4ARjTKkAY+YAhsNDd5E5JJ8aWI
 pndDzXGKvza7wSMUrD2IhotfQkJm/T4z/O2tXqXhWhr4mSWUNYbtSlqqErGWPmQx1T7S
 zgIa+u5mV606/EqYzvGfLBFcnFdZU8IR5bxo7tLo+n9J9rw/to2VPjvtmDbpjVMcran3
 wbPFO9eEfFJ7mcxArAZHHhxQkR5JbiIXJpeDcviWZiDlRVaTFHV5z3ia7m4VGnCzlo9b
 kNz8LbNMDWKGehkvUn5dLY5W046ByEPRJHdsQh8xdQbFCGXyyakBpkfIu+/fGK0OolsE
 Sp4w==
X-Gm-Message-State: APjAAAXrJM2Vr9Iz9/EdFnuW0t6g7J+FFVxXA2623GBjIIxkfkhSeFDB
 PF/w6r6Ym8XbkmkD6KuWA4UdJA==
X-Received: by 2002:a17:90a:d592:: with SMTP id
 v18mr6359471pju.135.1566581395250; 
 Fri, 23 Aug 2019 10:29:55 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p1sm3154585pff.44.2019.08.23.10.29.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 10:29:54 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190823143249.8096-1-philmd@redhat.com>
 <20190823143249.8096-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cca044d-47d0-8048-02d4-f34d05755b76@linaro.org>
Date: Fri, 23 Aug 2019 10:29:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143249.8096-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/6] hw/dma/xilinx_axi: Use
 object_initialize_child for correct ref. counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uuMUyMABIvqy

On 8/23/19 7:32 AM, Philippe Mathieu-Daudé wrote:
> As explained in commit aff39be0ed97:
> 
>   Both functions, object_initialize() and object_property_add_child()
>   increase the reference counter of the new object, so one of the
>   references has to be dropped afterwards to get the reference
>   counting right. Otherwise the child object will not be properly
>   cleaned up when the parent gets destroyed.
>   Thus let's use now object_initialize_child() instead to get the
>   reference counting here right.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: fix typo ENET -> DMA in TYPE macro name
> ---
>  hw/dma/xilinx_axidma.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

