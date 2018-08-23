Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1439881wrd;
        Thu, 23 Aug 2018 10:50:58 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbQd5nEjEOWGlTXiIngwtVORFrOOfGfNFNuUkoWnHeFTHKf8esb3uqj9jt281G5eMmnjWrk
X-Received: by 2002:ae9:ef13:: with SMTP id d19-v6mr20073804qkg.152.1535046658276;
        Thu, 23 Aug 2018 10:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046658; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ7q0WiOaMP9JdjWkV5+o6VWTpRx2GyAYLR5XDdoHEYZoZDXF+8x2bfmI/knABrJtC
         ZDPJgG3y7YYfF5V5NpoyIuqiKCMUvTFFTOpj6jwSRxGnfOmNloww+sgUDCUhd3TPLlbr
         /yceAtU6R1go3Nfi1wjAHkK/geUfwwOqUkw7ZXi6s/es2CrcCLCI4PCE1XVjnuu/V3rq
         P/sr4ytloKUon96md2WyyGYsIm7qOs5+MxdY6WftWtEubnMzWY3zRNGfrkK2T4Volr1I
         WNl/ieC72I63PMZ+qQUr+i3mE/H6IjP+TOaImxrvrPNqhTUMmbVtedk+WoNXc0yFWFkC
         W2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=R0Kw63MnjltN+WYbx1zdM7K2CM4J+VyqBYUhqFkH8FU=;
        b=xbjrdoa0pBhspdNDLK/Ov9ESqzWMFW4zsIGuFIevyEADH5Uqre01ZkZ75PzwYqvSQk
         60Lacn/wyAy26DNG0JImAgrHLhjwuEbZONbwMjLznPD/QmFfAPX5qNZdBCoozSHGPBCD
         ZreXgCjmo1oBqI6cI09zOXLK4PgE2ITA3LrlhnDI5f2ylQzB45SsoCBLFgkoTGZxnxj2
         x5Y3O61B2XMECUH8V2KW1xZfkXWpwr2NPWLGklETdLNVClTtOOwovSphnrxd2oSVX3Tt
         AQzFlp8Wmwkte+WAEdAoR0cpF/vNUfBk2mA2RqalP4W/wqcgVlHb60AJ/KPHCZj2jIoK
         IBvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YPxXm/Hk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y88-v6si4816890qtd.90.2018.08.23.10.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YPxXm/Hk";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstl3-0001Ua-P0
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:50:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstKE-00042a-Cb
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:23:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstKB-0005Vi-1b
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:23:14 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41866)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstKA-0005Uv-QM
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:23:10 -0400
Received: by mail-pg1-x541.google.com with SMTP id s15-v6so2940440pgv.8
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=R0Kw63MnjltN+WYbx1zdM7K2CM4J+VyqBYUhqFkH8FU=;
	b=YPxXm/HkAyzIlJh91o2AAu4qhFAfBK377FppRUNz0FrDxXxPi6/f+l9d5ICDkWJYln
	a9N/BpyAUiakgWfV/xiU3XHhDTZOPoB/F1dtVqnhCV+PhJAw9KMAS4SMscPKOBS/Itu+
	raKpadznc+KUw0yENFsUm2l0jVIQsuQkl3ZVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=R0Kw63MnjltN+WYbx1zdM7K2CM4J+VyqBYUhqFkH8FU=;
	b=cEoW76UfPRBKrF7m4YVMEg0P6AczHEva7p11CSnRLmpUIyByG8SjHN7RkVHfgkOrEF
	45vrIFQyzdxW7dfImTmmc9zEBmYIG2e3rgwRGxw62irgDgSfrOUAs93YmrImp+jLeF4I
	0FZeb+ANWYIBKgAU7S0GztkdjIoEqByi8BYHn2H3lp2MTt4AuE0zxnL4QVWOz9ouZ/zA
	YJaXuHCAWABZMfPBt/dW2o+G/TBVMaCK/Pq3EwxX4MhGz6E/P6OizkguCd06sAG7f11w
	Le6vDXfNsgCP/z1G6Qq9KS15zVY8WxGeXpVWy/HMm3zs55w9jmrczDx6OxPcqCu4Grpe
	w+fQ==
X-Gm-Message-State: AOUpUlFi1YtfjAZlxL7DaC9NuYbSDSGNs2hpoc1fNyAmQJyegeTPaovk
	LfYlH3TohmrWViytJDK01fAhvA==
X-Received: by 2002:a65:62d8:: with SMTP id
	m24-v6mr56818166pgv.307.1535044989957; 
	Thu, 23 Aug 2018 10:23:09 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	k5-v6sm14170871pfj.30.2018.08.23.10.23.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:23:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3d7fefa3-009b-ccb5-8091-a983ce9ff3f4@linaro.org>
Date: Thu, 23 Aug 2018 10:23:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 13/22] hw/arm/iotkit: Wire up the lines for
 MSCs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wllGtype3+kK

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The IoTKit doesn't have any MSCs itself but it does need
> some wiring to connect the external signals from MSCs
> in the outer board model up to the registers and the
> NVIC IRQ line.
> 
> We also need to expose a MemoryRegion corresponding to
> the AHB bus, so that MSCs in the outer board model can
> use that as their downstream port. (In the FPGA this is
> the "AHB Slave Expansion" ports shown in the block
> diagram in the AN505 documentation.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/iotkit.h |  8 ++++++++
>  hw/arm/iotkit.c         | 15 +++++++++++++++
>  2 files changed, 23 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

