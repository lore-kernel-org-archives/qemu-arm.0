Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp28942wrv;
        Fri, 26 Jul 2019 07:55:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoxo7DttPa8RoDPKBz6ttj7Mjo8s0Eb66HQxyfN4jJzn5oSOY4wixw2Ru8DjPV5dHEK6M0
X-Received: by 2002:a50:b13b:: with SMTP id k56mr85349235edd.192.1564152946827;
        Fri, 26 Jul 2019 07:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564152946; cv=none;
        d=google.com; s=arc-20160816;
        b=fURamX9pvbp2Lby7G7eMWY5S2zP9LpMpY3Yd4JsGBx0PIvyJXA/ym1jAbaBorXnPj6
         Irtb7ykbgXAilDsrdLXM10BLhJLVGF3ueCY1bOuT2VV2sJTUDAzdXXez5cKLMenxG4dy
         AnUXbZXr/nxdfqsnihoE7Qsnm+d5IZd9BFJ37xW8zIEs/9zRHE61o9RAY2hCcdvhR+Ol
         l+uzBwl4qVEIkjsI88ZzhD+TKO0vgEGVU/05lTlBNjDqpGDaVOU0bi7DA+WByZywqfUo
         p8x+wnzxGsNGcJUQq2pcEDTM4zwgDGSliufAuxY61C+IW74WqJ52KkDnu9VqojGTRVTD
         TEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Odfgxg7vIXjw/Iv/5NARPcAT/tZ6lO+gPqDya16oOQ4=;
        b=SFoTvhxqfzZfyREurUekq+cpqzLf8tICkPzLz8YG+a8uq5e3y99kJ3FEECrX8LfaME
         sEGnOW0nF+9HWRlBKUutn55ySMWLmt6LOPiTuG83E+sTEAbpMK+SeJYgWubgds7Il0xC
         vcrENNrklTPZFeCsmWD4IXfbnZzekSWW7dhleo3382t5hzJyfh0iCg/vn9HMkKrtWB2i
         V3yrx6OSXD71H6QfRyOOkdTZXZWUoNl6Nocjt2UzTAF6UiH4soqJtNO6vFXEtZRPio6V
         4vuWL8rTs+hL/s/FGd+O2I23B8ftF82VAAIiaIeF+pf3qst/rmMAMqG+QoIC+9VpF9Jd
         YkjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u0Yrwrij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w28si13160715edc.10.2019.07.26.07.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u0Yrwrij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1dJ-00082z-Nj
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1dF-00082U-Ta
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1dE-0005lQ-Tv
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:55:41 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34707)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1dE-0005jV-FP
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:55:40 -0400
Received: by mail-pg1-x544.google.com with SMTP id n9so18685863pgc.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Odfgxg7vIXjw/Iv/5NARPcAT/tZ6lO+gPqDya16oOQ4=;
 b=u0YrwrijpB6FA7Cga6XnQQeIHcroFf8ygXeNB02hz9a1VnnMQubvQGMPjObIS7biyN
 69KtH1dqHycTjA4dTcAD8FEy0b5dhVrSLpD29wZ7qB0XyaITpokk2vBEjKV7ePuGPWbw
 wAf9nsZmgH5yhmfZU5K04mkYGJip/ubasv1FPBu6t4ClVTXfE03oNEP6tO/8KPMKunuC
 RZJhT7lwi2b6ogDl+oenX3kKnJakbObLGejqnF5GSaNpFm8G5CVUK2TDX9RR4UVG7sa/
 rv5XaHgyQEcAT/QA5aNkOkmX1eKruqwHyj0Q9LHlEaX5/TcpsGyrjsgmXGtN3ZGwSErk
 cWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Odfgxg7vIXjw/Iv/5NARPcAT/tZ6lO+gPqDya16oOQ4=;
 b=A/MD3I4HZGavByn1mnPRuMYKUZ64AO+a6uYgA3yBOuGpY3cNCHrxWoVps/Dks8kx7g
 W6vo/P9FQh3h0qceMejcdgm9jFwM5cHwSnokuDv1Fy2S5LG9SsnybfaoKeJFBKh6vwvV
 KklmxB4FGyurtGyYZSZ6qBOLncOJU6ZoQEpvpJPW+8lMekakGSxMuV+/vBsCSFijOPxj
 ckeXL/mc3PhunB76DOznDFF702BF5SLBcI39rr1xztIbOMn07A6Yxk9sgpOGr8CHxY2c
 ODDpzeueWinZDsrxZKsET/G/TVyMn9AEjVPnTYrfwdjUdCoMjEhdLM3WDCmRE7pE7V0U
 PK5g==
X-Gm-Message-State: APjAAAUE3neWPF8iN2gbau0CODUYsbXO1FGjlWjUQiFSBaeaunvOP9wi
 XAM9xqesYS8pinwcsr3gAomjkg==
X-Received: by 2002:a17:90a:9f08:: with SMTP id
 n8mr99311338pjp.102.1564152939279; 
 Fri, 26 Jul 2019 07:55:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id b68sm68532990pfb.149.2019.07.26.07.55.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:55:38 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123735589.34363@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1d9a2b2b-625c-f7d6-cf3c-97b5b40d366a@linaro.org>
Date: Fri, 26 Jul 2019 07:55:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123735589.34363@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 14/15] target/sparc: Add TLB
 entry with attributes
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H0SlTE0OoKhL

On 7/25/19 11:48 PM, tony.nguyen@bt.com wrote:
> Append MemTxAttrs to interfaces so we can pass along up coming Invert
> Endian TTE bit on SPARC64.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/sparc/mmu_helper.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

