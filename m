Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1185905lfm;
        Fri, 24 Apr 2020 15:31:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypIV0Bfu/Dh5kEMcPGJuVnKn7sddeEiehZFLQGGY+hAecukXan/Cyrbzehn4Pa4uYKEsFuqV
X-Received: by 2002:a05:620a:14b2:: with SMTP id x18mr10795789qkj.153.1587767474941;
        Fri, 24 Apr 2020 15:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587767474; cv=none;
        d=google.com; s=arc-20160816;
        b=ptGeYJDasCsAntjteE42GP69mmRDS5HUBZrfHfIAXSm23dSjvB4s+GONaOz64604Wc
         qWo4nJjoT3Alkqej+vN7LAmoJnH0FBSzqwDMg4OU/a7AwPRezutXJfVpciw1UaUOcND8
         zvUEKtwOmyLOXuo6KGcypRNdwzpvuvBuUtx7sJEDggKbcr8TUKDOFpj8BfE/tsNe9LCl
         v71I2frcC7Qx9+vPQHmjPzA4s8fPNvXT15mQKohrLN2yq7rdt0kOjoftdZ5HyG9KG98K
         tIajoQejq34hLe+8GHZ0Zd947ebK2F1Zzt/E7b+x6hq742YTE6zduuUHXGvQ/Q5bY5jg
         3sTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tjydUoN4WhqQPtmCstVePVCAY3LtiQFkXjHbGTN70FI=;
        b=P4Zw2kz5arME4eH5nMFn1ON/WMNcYRimAKTeq+MkdOQzZmzY/hM8CRsjEtmGyQXA4P
         y99ei4Ge9Tl3gRG91HAtd4TxgKHOzLKKXW8837dVmMWSSGgTs+PK5PYyE1qWAnynTypg
         zS+hUcXRWhGJhcPnEDZ4DWr2HH6ZhzRaSFqyLGSzx/ZkhNf8Is/VvYNvYZoPMGOmLuTE
         1CPdU0jjjjtSJ2DfagsxyhUD318DIWChfgPEtLnh3DAJo6KMxhnuK5dqsBle7+seRbkR
         umiemhM48QON+TVAq7DKUkblBHlPjhWJqYunuQHu0roE538MEPH7BqT9G1qZ84Y0cH3D
         BBmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPS+mabz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si4833215qvl.100.2020.04.24.15.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 15:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPS+mabz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jS6qo-00088P-9Y
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 18:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS6qW-00088B-17
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 18:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS6qU-0000c1-Kq
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 18:30:55 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS6qU-0000aq-7t
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 18:30:54 -0400
Received: by mail-pl1-x642.google.com with SMTP id n24so4264827plp.13
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2020 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tjydUoN4WhqQPtmCstVePVCAY3LtiQFkXjHbGTN70FI=;
 b=VPS+mabzEV3IJZsyvSnnoY7YtBhV01MvTPPIjDe+UIiJuT212wDg1eIqc3H+BZe+0T
 bdcZiK1o19GZ5jz8m9fEBBUBkfJGJDnKSFUxqd3eMZVYj7m7PDq9ikEnwM0SVKX+R0X1
 SRa0nyMmNE3hir2yK6zQoRhCakLF6I3V11iX5b/ObhE/2arfTqLJGV80qntlUV6DCUhN
 47aeBSIKcLTc6sG/TakUCkriSiIq4LrabG137MP/CBacEMqMBUAokBVEbtMBYCULE7/f
 EZxrOS6W+lc0qxIWKnagYMpcTBY0NLGJKGMWW8fG1eANZfxRF8WMgnEJWXE+a/gGN46g
 1sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tjydUoN4WhqQPtmCstVePVCAY3LtiQFkXjHbGTN70FI=;
 b=ZrY+cbBZR6gDqPaiZAzdxZClcW6r9AapeY9ry9+RH59lRUT3Pr+ssB+lFu/CQMgSWb
 BNrPx3A5WZM8Yn03u++YRny2Lab5J1n2iKpKkEEutb6RiWDbB8obMKop51MpPLzHt0p9
 qCztXaZBEERai8SlDTkLIh4PpP0Teb2L7rqWwV7urtyo0o2SlgYc4PpQs1iPE8uksi6j
 MtuORJy1z9SXN9MBKTLbNk5TVf5adeTq+SYGomrFEkU8eu5OaugBHJvmiwe21EkAA+14
 /d29l2n/pCIaV3GRsW0RkCLcLRXHED9/uxaW00aq++HX9pVfVx0Uy6QPoOD2l2nZmGHM
 0Wtg==
X-Gm-Message-State: AGi0PuaeS63iKybaYukzY0ssOrnsl/WEQn+NKlhAaF/YNh/u35JSg1U5
 7EiCKHIIc4xd2P5Rz6LtHbaYsA==
X-Received: by 2002:a17:90a:315:: with SMTP id 21mr8180056pje.96.1587767452567; 
 Fri, 24 Apr 2020 15:30:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w75sm6675139pfc.156.2020.04.24.15.30.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 15:30:51 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 SPLICE, EXT
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200423180347.9403-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd583722-3d7d-fb2e-4320-5507eea18b54@linaro.org>
Date: Fri, 24 Apr 2020 15:30:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423180347.9403-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1FhMf7MVQfTj

On 4/23/20 11:03 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> 
> I'm not sure I can just use the SVE helper functions for the SVE2
> variants of EXT and SPLICE.

Absolutely.   The new insns are functionally identical to movprfx + the old
insn.  I presume the new insns were added for code density reasons, but I don't
know for sure.

> +SPLICE_zpz      00000101 .. 101 101 100 ... ..... .....     @rd_pg_rn
> +EXT_zzi         00000101 011 ..... 000 ... rn:5 rd:5 \

I have renamed these to SPLICE_sve2 and EXT_sve2, since the same suffix applies
to the original too.

Applied to my SVE2 branch.  Thanks!


r~
