Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2167433lfm;
        Sat, 25 Apr 2020 12:00:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIEYL55/t0cKEssh1azliNB4SvKTYy2a1fdK8A7aSYIGXCa+zUfwABGcQW3A4M1uGBa5Hs
X-Received: by 2002:a37:9f47:: with SMTP id i68mr14995935qke.356.1587841229864;
        Sat, 25 Apr 2020 12:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587841229; cv=none;
        d=google.com; s=arc-20160816;
        b=P7sahoJYnX6/dT1gTQNdGaKC1MU51TTTzo4bySAdCC6BgHKeAJ4kGKvHWbK/GE53Q2
         8KSzJSODQotPo02foYgHS4nTIjAITjIpFgv3B7ZmZGO/qA/cJ4GkIE2wR5vAH7ixQkg4
         UzVgZaF0eBM9TMazkiTaBDNioxWppHdYCuxIL7r84uJC63YGaEyoUERz/8FJsEVvwmzr
         QPGLTZK9CZuiCbKSNZ/KB4P3GLWNSBBZb4uMLv9h1oWOLd95eSpuRXiM4m9Hi/WNAZwM
         QQBJ8/lkttqKd67qFjruZbPazdeTNDmuCpQdbi0u9sT+HiSuSqFUpCVfp94igu4BtGQq
         YUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=2yzfaR388T/3E3RNFSli0kuLnKDuKMC0a1kBW6RqCI8=;
        b=FCeFuD6YJEWjLlb4ErsByMnO8JBTWbOdZpD2Hc5wafl9ryQxj6x8sYxdry3vYs1IZs
         c5GBo/Y/vKtEBLFiVu3IngGPRrc0ZwiptbziD2aMMFg24zz75wsHGWTASxmdzSW8JPo6
         zduExlADzI1OPM6092zxEvYzXnyGcBmOXYcXig7EtP9UBMdi99fxJP/76uTOLS4n0Hgu
         Flh2fGNIOkdP8ohVNFnh+trhvXrmYmVmOwwHa4RLDzml0g597nqsUKeCmv14qrQEGPoW
         mqJCdRTwfAFbJsLXFxh6mhYaOEK+bsoZsfAmGWJsRDvPqZM0bK7ZXbzclENEE3PTu93i
         Yw9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b7V1/fI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h83si5851209qke.367.2020.04.25.12.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Apr 2020 12:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b7V1/fI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jSQ2P-0000pF-8h
	for alex.bennee@linaro.org; Sat, 25 Apr 2020 15:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSQ2H-0000nd-1B
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 15:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jSQ2G-0004xD-LT
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 15:00:20 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jSQ2G-0004qU-3I
 for qemu-arm@nongnu.org; Sat, 25 Apr 2020 15:00:20 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r4so6345384pgg.4
 for <qemu-arm@nongnu.org>; Sat, 25 Apr 2020 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2yzfaR388T/3E3RNFSli0kuLnKDuKMC0a1kBW6RqCI8=;
 b=b7V1/fI/lJ/JGuRQq14/Y4EBSfINR3FARzXZrfKfsExg+Cs4V4vrDMAMKH03NSFeNz
 fTIrRKxTWzVzbfeIQ0XgACE/cWUX+Wp2W3+MwWNbB9fATX0QfwcJmikR14lWZNoXAB5+
 wbZkctR1IE5uwFYZyiWKvff7x6aOITXWdZ1L37N3fSRH8mp+aUi3JbHkRn4BoW8bEiyf
 5xGSFdnqSTHx9haoOjLZKZOab5AVYjCKYsWVly032cTdDMDWwhyg65468e+KssuV1RS7
 H0evfo8QjZABofVS2wnuNCxFNwoXzyzZW/TBM0Fg/B/x0r/SM8xdcBdmDcIvHsipynuq
 z9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2yzfaR388T/3E3RNFSli0kuLnKDuKMC0a1kBW6RqCI8=;
 b=ZQerM2UlPpAP6ZTJCJq/I/gZic2N/1KFBjCeX/utOukX09jT9GduAFwnLcTQlEelql
 Ah0gjZCzlmdXVrYPPY+rBYaDwk0YIj7g9bWGIztWqHVd5j0MM1aF6ovePHdEmn370DUC
 eaEavJKVgOhetYZhCNTCsUE16JLc36dEaSsGiHzt6VMqVMN9/tUIRZLPZvIEYi/WR39D
 z9M5ymywCWBIAfPCH+3yOICZQb8Db6LOXvaD8gL+2+tysmjqDwhGxSxmE8K1g2xPzoIG
 KT4XKm6pBmyclhOLAF6SlyVM1WngntQVnu5sDW6/Kcf16GdaEVYftToucG4rE8Koghwc
 xKsQ==
X-Gm-Message-State: AGi0PuYCrS6YaJPG1cyL9lW+cirbA11fds+aZBzFE+e7M2oszTbliWcT
 ZHfuONUanIs7HeQzyzDeaGoIRg==
X-Received: by 2002:a62:1ccb:: with SMTP id
 c194mr15518912pfc.325.1587841216341; 
 Sat, 25 Apr 2020 12:00:16 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id n34sm2905589pgl.43.2020.04.25.12.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 12:00:15 -0700 (PDT)
Subject: Re: ARM SVE issues with non "standard" vector lengths
From: Richard Henderson <richard.henderson@linaro.org>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <CABoDooMSCvi4sxWS-a3cQksD3V5tnHCUbGPsxW69Ou4d1rpQZQ@mail.gmail.com>
 <082800aa-0cab-f331-c9af-2e59f5d5897c@linaro.org>
Message-ID: <f8de973c-96a1-139f-2ba2-6c07a88f790e@linaro.org>
Date: Sat, 25 Apr 2020 12:00:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <082800aa-0cab-f331-c9af-2e59f5d5897c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::52b
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZTmoo8x14IcR

On 4/25/20 11:49 AM, Richard Henderson wrote:
> On 4/23/20 6:59 AM, Laurent Desnogues wrote:
>> 2. sve_zip_p
>>
>> This generates extraneous data in the higher part of the result.
>>
>> I hit this when I got a wrong result on an instruction that ends up
>> using sve_cntp which counts all bits set in each 64-bit chunk. There
>> might be some other instructions beyond ZIP that generate extra data
>> that would break sve_cntp.  So perhaps it'd be easier to fix sve_cmtp
>> (and hope that it's the only function that uses bits beyond vector
>> length...).
> 
> I don't see how sve_zip_p can set high bits.  If vl is not a multiple of 512,
> it writes in units of uint16_t.  This cannot produce values outside range.

Bah.  I was looking at zip2 first.  zip1 uses the uint64_t path.
I see the problem now.


r~
