Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp138583njc;
        Thu, 19 Jun 2025 02:24:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfWC7hva4gPKflm+GLZ0xTw4IW/BX/w411Nwl9o+NVN2VNKvEHBJlXys0PWZ9ZcqZsUh7sc5LxzAQSNw==@linaro.org
X-Google-Smtp-Source: AGHT+IEla3cm7kA58lvZMGQIE4BxF7rka+noPyqQeL36KuLyqfzPT5LXMVH/EQeQ2UEB48/yvuf6
X-Received: by 2002:a05:620a:4513:b0:7d3:9260:6dc7 with SMTP id af79cd13be357-7d3c6c0533dmr3116649485a.6.1750325064139;
        Thu, 19 Jun 2025 02:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750325064; cv=none;
        d=google.com; s=arc-20240605;
        b=NNr/WOBXcUiqb9mWUdcsV/Cv66n7DJoe0UfjDa8IaLHJ6f2hupinEiGjMsbiG3a6sU
         pgLUcpAis9IRgFX8kH0LUYto+I8UAryqaFzp1ufun1/kQIb5K+hg/sw/BMIcq04fg+Dm
         31LqOVhKOwPs/LbFRskpYZUgWrZS64fFAaapPMYl7myz7wz3fp6v3+3U4TBnzM6N9gli
         4sqTluPVkhH/3DHPKfDm1A8V4Dxq6C1+FpC52Kp0pll0WdTLk7Mb8Wg40cgG/mTmQsH5
         jkkzuILzb4fMI2lWM45KanMF/Kh1YjYLVmK5p0SQmcVkwnyNsirdwr9dLRBtpgtv0NaW
         f1xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :autocrypt:subject:from:cc:to:content-language:user-agent
         :mime-version:date:message-id;
        bh=LqULX7pbNC+TPXatbrAvKLQwC+SLFSty1/e3SnVy/B4=;
        fh=3Mhji3FDNLK3FPgcOQvdxx5wW66zl86+w+yC+WatQ4g=;
        b=Oemky9aW4OIX8fgxLQwuaUWDB20xbv4GfgfPzJPs2Rl6FtzXmSMyzt0N4+ZuntecK3
         gFjmFrpWyH4GdgWoNun5jZbe0MaBCsSmveQ0P2GDw9YZgSPDIieBqxRGrY5/1kaLIVq1
         F7jiBCPlPB6reVe4AJ6/f5tTwQA8UaGhlxaYQL/ssS4t2azXWS7heJQevj/AfVgveTEe
         5+sEaY80XI0P0/o9FuW40S4tQuAECdV1D1uGCah4u1gWIQicNt45ucgbEvxZ7yeexNXe
         l5PEEi5TGqfOmQEFACGa0FYMLRD4aROzGatXMz2LJl+LWN+hUqMn6R0AsTwebPi+9X7p
         zxGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea9eaesi1630148785a.272.2025.06.19.02.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 02:24:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSBVF-00047R-0d; Thu, 19 Jun 2025 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=0/7f=ZC=kaod.org=clg@ozlabs.org>)
 id 1uSBVD-00046u-47; Thu, 19 Jun 2025 05:24:11 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=0/7f=ZC=kaod.org=clg@ozlabs.org>)
 id 1uSBVA-00019b-DJ; Thu, 19 Jun 2025 05:24:10 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bNFXx2Y8hz4xCy;
 Thu, 19 Jun 2025 19:24:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNFXq4sFNz4wj2;
 Thu, 19 Jun 2025 19:23:55 +1000 (AEST)
Message-ID: <e2df1ff1-3ce4-4233-b32e-2bc680725c71@kaod.org>
Date: Thu, 19 Jun 2025 11:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: "'qemu-arm@nongnu.org'" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: 'Andrew Jeffery' <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, 'Jamin Lin' <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Patrick Williams <patrick@stwcx.xyz>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: aspeed: Split the machine definition into individual source files
Autocrypt: addr=clg@kaod.org; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=0/7f=ZC=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.067, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nxAEuxOWwA93

Hi,

This is a follow up of a private discussion with Patrick.

Aspeed modeling started nearly 10y ago with the palmetto-bmc machine.
We now have 5 SoCs and 25 machines which are mostly defined in
in a single aspeed.c file. Multi SoC machines, fby35 and ast2700fc,
are defined in fby35.c and aspeed_ast27x0-fc.c respectively.

Since we started separating the SoCs :

   hw/arm/aspeed_ast10x0.c
   hw/arm/aspeed_ast2400.c
   hw/arm/aspeed_ast2600.c
   hw/arm/aspeed_ast27x0.c
   hw/arm/aspeed_ast27x0-ssp.c
   hw/arm/aspeed_ast27x0-tsp.c

We could do the same for the machines keeping an 'aspeed_ast<rev>'
prefix (and maybe avoid the 'bmc' suffix). I think this would ease
introduction of new machines. We would be able to get rid of
aspeed_eeprom.[ch] and move machine custom data in the machine source
file. Which seems cleaner.

Timing is about right for code reshuffling, still 3w before soft
freeze, no important changes inflight, but if we start doing this
conversion, we should do it for all. See the list below for the brave.

Comments ?

Thanks,

C.



* AST2400
   
   palmetto-bmc
   quanta-q71l-bmc
   supermicrox11-bmc
   
* AST2500
   
   ast2500-evb
   romulus-bmc
   sonorapass-bmc
   witherspoon-bmc
   yosemitev2-bmc
   supermicro-x11spi-bmc
   fp5280g2-bmc
   g220a-bmc
   tiogapass-bmc
   
* AST2600
   
   ast2600-evb
   qcom-dc-scm-v1-bmc
   qcom-firework-bmc
   rainier-bmc
   fuji-bmc
   bletchley-bmc
   fby35-bmc           (fby35.c should rename to aspeed_ast2600-fby35.c)
   
* AST2700
   
   ast2700a0-evb
   ast2700a1-evb
   ast2700fc           (aspeed_ast27x0-fc.c)
   
* AST1030
   
   ast1030-evb

