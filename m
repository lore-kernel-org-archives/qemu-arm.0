Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp211575wrg;
        Fri, 7 Jun 2019 06:45:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQyLMatJqMN1IaDj9D1Z5xuMv7qQtHzZYp/Z45O/dCFdhks1o34LQhX/Ofn1+q7K93G/9h
X-Received: by 2002:a37:b342:: with SMTP id c63mr44717552qkf.292.1559915147415;
        Fri, 07 Jun 2019 06:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559915147; cv=none;
        d=google.com; s=arc-20160816;
        b=xp1+E47GO04y362M5ZzWpKt7YFFztltQW8mYrQEiEXSVS2G8sLk1E00oAAwoWdWapO
         2lNTcTxI2U3QLRSqB47bS9DqKTXs6zYEk0lBNZnDhbDCY12xshCNRjQr070UdCFKUi3D
         Jn0gRoIN8/IHF1Cuz31rlm9MGFRc0JXKw4QEjk6gBXVydv/E2w5n3cHaxH9hFS+nqMV0
         0rcwuDVcVU5MZxOqWf0JBte6CGzBirZXZa/tEfObWzmSuRrCjir/gxXwb0N+V70GSh5D
         GhTS+Cvm/SEYx00FcN6t9rRvpAIwokg9rDXtQarCDXtMjsKyFJcdXjx4r/kQDJav2MvR
         XgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=7fUxwkI7/lFmhCPdMN5//RfvbGbZNeItnZOVIDhGNXg=;
        b=Z+0s/Hc4o5VXJuYOubdnlyeWWTzYkynjQxkvB68lifrH8Fiw4mE/+g6IhqFe/EVC3G
         13fcOxEvcetLSXNCNtmbbES83AYYWqRYAHDd5Z7jwTr0GftADNU/zhYv0Eo/HepqZCxA
         FgPrHesAh7HiUc1nzlFcVRJo4pCZ6fDNP6+/q6kc3iUiiLBAWzzPFI1rKKCt/T/brEZD
         Wzg/jXd1ISoD+W70g6DO/9EpEb1ewbYfpCWne86r+YiSAwUfUw4V/B2EtCNynbnnjl3Y
         LHyjAYfhzrPAYZ2na0DgGQAlrNUA2gPaq6p3X36/vnKRN9Zjkq5rTU50DMM4zprK+Wi9
         i9aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mlJQst+N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id q19si1250766qtn.43.2019.06.07.06.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 06:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mlJQst+N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZFBi-0002X5-Pi
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 09:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41157)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZF8a-0008J0-Nh
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZF8Z-0000Ps-MV
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:42:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZF8Z-0000Ky-Hj
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 09:42:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id l15so1849878otn.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7fUxwkI7/lFmhCPdMN5//RfvbGbZNeItnZOVIDhGNXg=;
 b=mlJQst+NbwGxkjxW7ZiSbDx7dpLL1r4NHvaNVZwE93zCskV3YFHDC0HJAeWg3Lmr3b
 gTVIPhzwX4PyGGckB9eF6bIR+qvaliEkNkoKXxnJmzQ/oAL7o2yiEvic768tAdvW8TuR
 c2srPChliQJtGj2eX5hyhhpDh8KHoMf65bPrwbR/ISTKOHuyqBROlQiId2owo8HNNANv
 xb0QrycUh1+/LZ/Cp8eGgQrGzomI3S30NGlbyeUi92dmCMsNppgtV7Ak5BlHuZ/c42xI
 9KeXP/r7T0ukw0XPg3ZdUd30ea9fw3aKWHtnQ3b+n0SeJeXotiTQnjyuagDgGDYPKV0J
 +C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7fUxwkI7/lFmhCPdMN5//RfvbGbZNeItnZOVIDhGNXg=;
 b=shpQGT2TNJ6IqmQZUTO2conH+Yp0kiHBMPqVTf9zqds11dQopYScyVR6NGHXqa8glS
 7ol1v3hROl3tGYQZtI/OLmcFqvZfgugLyDaAZaWlNoQapmJ82KepovJh203+JnSvjbq4
 6gOpL9RZsvGM4zFoTi24KlH14NqDi3b7WudDE2pWkmDULXIyQv1uPdFOD+PHQjVYnLaI
 xJThc/z5ONxiELRkZ3Gg0HSATyVD7GjBCB7rMDLfMVElT2nuXOEToFUU/ei17AFZttvA
 P4Pd6bc3hol8AuR83UHpE5tcKnexcRF77mtwFnhcfuc9QrT8qJrgLfmHkwTRA1Ld1Qja
 Qo9Q==
X-Gm-Message-State: APjAAAUHqJXotTcSuUtvkVsXszGDDo5BgtSs4qHyUqWOvX1LYTsvEGs7
 6koLyLQ4DkvPcy6aY5pTO5VQ3UVdU1cCkg==
X-Received: by 2002:a9d:12a9:: with SMTP id g38mr19630823otg.125.1559914950025; 
 Fri, 07 Jun 2019 06:42:30 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id s63sm716753oia.34.2019.06.07.06.42.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 06:42:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20190510110357.18825-1-peter.maydell@linaro.org>
 <CAFEAcA_FnpYF_AegaYUqfPhr_k9ZXUS=JCamtD3+nSvonHC1vg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0173bcfb-436e-65ce-fff7-58cbb82bf9c1@linaro.org>
Date: Fri, 7 Jun 2019 08:42:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_FnpYF_AegaYUqfPhr_k9ZXUS=JCamtD3+nSvonHC1vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2] target/arm: Implement NSACR gating of
 floating point
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 711/Y+qLV+ya

On 6/7/19 8:06 AM, Peter Maydell wrote:
> The NSACR register allows secure code to configure the FPU
> to be inaccessible to non-secure code. If the NSACR.CP10
> bit is set then:
>  * NS accesses to the FPU trap as UNDEF (ie to NS EL1 or EL2)
>  * CPACR.{CP10,CP11} behave as if RAZ/WI
>  * HCPTR.{TCP11,TCP10} behave as if RAO/WI
> 
> Note that we do not implement the NSACR.NSASEDIS bit which
> gates only access to Advanced SIMD, in the same way that
> we don't implement the equivalent CPACR.ASEDIS and HCPTR.TASE.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * fixed bug in cptr_el2_read() that meant we were forcing
>    HCPTR.{TCP11,TCP10} to 0 when they should be 1
> ---
>  target/arm/helper.c | 75 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 73 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
