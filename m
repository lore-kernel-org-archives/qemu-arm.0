Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp39428wrs;
        Tue, 27 Aug 2019 17:07:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjrQ9idNSztfFU2ALyl+wfbf9j4VrUFVJ4xDzYQsAY3q3WmIaSw8fZjdgirFpji4VqIls5
X-Received: by 2002:ad4:47c3:: with SMTP id p3mr1078544qvw.120.1566950861630;
        Tue, 27 Aug 2019 17:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566950861; cv=none;
        d=google.com; s=arc-20160816;
        b=DpY9zeCyDRmb+XxLzi/hZ52nAiNEAotXC2CyLpFyircrQUM9ceaTP2uuiJA3ZKJdx+
         rPo8BaZ+5biCQcZr+OuEqCl0wZU0PJnjGJbiOEAykPZL9bdvUgeMLsF1W4w2q4f15Jha
         1puGbsVaz4l+bx5lOrCF+DEpuQGZQhVk4wVrWUPKIGhQsMaZuZdCNzoxr+nphL0yLLmx
         5ock/2B6qNjI/Rcm/SW9DIdSf+EcQ1pcSq49DrDyqI7LbGBZEVhRkOV2ZgzWQidIbECz
         5chB2vZHP7EWWKxWOgjlDwzLNFTuXH6y64wUuJnIyx/6fafMNrt/W4E7j7+oNntqBMmQ
         X3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=n8q8YNKPvXrkleM20QsMvRxgJbJG7dT0flX7RMl6O6U=;
        b=oMdmCHzZxRowiD+LTJ0Xhx6NuCGC/00HAdyjPrWFQnjJe0BlRHgq4RIZnBttgOqzgo
         ZffkaBe/q+QOAPBvVTzvSeDoEpz8dUwCEp9zFs58b/IU7qCTvyh5bmqhysXB3AeTySkV
         v3T53oKpx1VVm9ozOb3RKr+NbFWxNOigR7kUo7eSBdmJ7hKgjvr/F9IhtQ0U0KJsX/pK
         PV6RONQosttfCXymThoLFE3I2ndCdtdfmsbPwyEDFi2l0Eykh6Xdw2B6Ny5ef1W4bCVi
         mHYqDvniqJzYipVWlFzMbHBdL2qq03FGz4Fkd/zSNt3KXH9FWdS2mzlgrWX+zXhTcezy
         wJ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXDjcjWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14si504055qke.35.2019.08.27.17.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 17:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXDjcjWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2lUz-0005LC-2H
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 20:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2lUf-0005KG-7N
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 20:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2lUe-0005sO-0B
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 20:07:20 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2lUd-0005r9-P4
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 20:07:19 -0400
Received: by mail-pf1-x442.google.com with SMTP id w16so438039pfn.7
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n8q8YNKPvXrkleM20QsMvRxgJbJG7dT0flX7RMl6O6U=;
 b=TXDjcjWcQzT67pb+dJ85bq2u/1CP2jnNTZHp8mkDlOzvBsbz9NIx8PvDvfHS6OjuII
 xCV45R8UvVbkcZJoRln5JR+PSbceGaGrfcUGStU0oetrcTHJLkU4XfFb0st5GGDGBd24
 TjSwcAUdLJTyyJ9M2dFuV0LPOddtT4Q3iTQd4Dy5FCPZBT3o9pnGEBIa4Jq3G4hHGITB
 GdyhBdiifpGg1DL+6hlm2Imo2pGyGpxtRz6xdMM2hBrzfMr4tuopuI0AtwZzTaV0mWJo
 /cTuotmJTtZLL65GjsJ8bTtINfSMpIlNb+2stlU8V/7JKdcKFD2XmQ+ozJOzC5yg5BSm
 Sx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n8q8YNKPvXrkleM20QsMvRxgJbJG7dT0flX7RMl6O6U=;
 b=l9qoG1jwR+9+D6A7p1T0BzSznWy9chbuB6WJvA73oIt0M3QyGZ8/H2nCxi7LerRfJx
 uPqR9s4gaTztYS+towp9IYRtqMcQHNivLLqFitxGpo/NQjGskTZFlQSy21k/OqZvfYDv
 uOzw5Kdoz6sS9ngJXxxrttVg+lZ9rNlXYg8qvbTtySpqeUs1b08nvKrXYv3gLJm6/YcC
 dU59Vy97lyhQTWf4sjdyEn4vOoFamEo++hxeK1ZLGVKMnjFxY98XmSn0jaTgYLrk2A89
 0EIbI7GvWp2tboPo1Z9YvWfgQp7f1gL7SpWk/4YmgPlHgfnypuXxLqqXiiUk2N/d2Z4f
 7KHw==
X-Gm-Message-State: APjAAAXVyg2Kp/tuoVegsT5VDePQOSFP3dMafPrY4VALjrrEG47PEKi3
 tSa11lPXtKAaeRgNdxC2NxV7MV8TkEk=
X-Received: by 2002:a63:7e17:: with SMTP id z23mr1025474pgc.14.1566950836668; 
 Tue, 27 Aug 2019 17:07:16 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a16sm477679pfk.5.2019.08.27.17.07.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 17:07:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-67-richard.henderson@linaro.org>
 <CAFEAcA9AbEzR97-2gvpPAbGrGHx_AxGgVhh4-BDufTQUX0gM1w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7f4eac6e-486a-3d99-b533-5fd4ac41864d@linaro.org>
Date: Tue, 27 Aug 2019 17:07:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9AbEzR97-2gvpPAbGrGHx_AxGgVhh4-BDufTQUX0gM1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH v2 66/68] target/arm: Convert T16,
 long branches
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jm/1KVzYgaHF

On 8/27/19 2:34 AM, Peter Maydell wrote:
>> +    tcg_gen_andi_i32(tmp, tmp, -4);
> 
> Minor nit, but can we use 0xfffffffc like the old code did,
> to avoid the reader having to do 2s-complement arithmetic
> in their head to figure out that we're clearing the low 2 bits?

I always preferred "x & -c" for exactly the same reason:
to avoid the reader having to do 2s compliment arithmetic
in their head to figure out that we're aligning to c.

But, sure, if you like.

> This would be a good place to put a comment equivalent to that
> in the old decoder:
> 
> # thumb_insn_is_16bit() ensures we won't be decoding these as
> # T16 instructions for a Thumb2 CPU, so these patterns must be
> # a Thumb1 split BL/BLX.
> 
>> +BLX_suffix      11101 imm:11                    &i
>> +BL_BLX_prefix   11110 imm:s11                   &i
>> +BL_suffix       11111 imm:11                    &i

I had placed that with trans_BL_BLX_prefix, but I suppose this
is a better place.


r~
