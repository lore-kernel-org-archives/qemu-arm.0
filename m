Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp879732wrt;
        Fri, 25 Jan 2019 16:09:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7FupzGaAuZUHvIPW07FdWyDTH0N63MUV+b/7zOgy8pffN5Oh2R6Bl3iQFGDphjxQVSb7oG
X-Received: by 2002:adf:8068:: with SMTP id 95mr13584914wrk.181.1548461360600;
        Fri, 25 Jan 2019 16:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548461360; cv=none;
        d=google.com; s=arc-20160816;
        b=XdhmV4VIBGq1NEpNuz0Ue1Lf3SxVBmPn8KTixd4tgKVgyXltlR3Szqw2tnKHyqhjci
         2XuA0ysoSf7Q+UBPpf+LlPscLH/UvRquD0qgzReSeeC7kf1uTMHHr4i5cFwg/ttNDMcA
         sVpg5ZfAUJKFv3LAsQSmGg9gBz5+CNEDaG8tUoxS5IP9hZPpkZW3ydg72IrxiF0igJbu
         xT4P9tVZK0l/UY9vsmoqxCjD9xoxN9KaY/pyHJMs41aj2SDcaMeFHAKHmglCSYQVroR3
         MrvJGBm7nEU+l5WgcfXjWMvQMN68mV3SHCjbWj19+hYjTBSGb+N5/Or9P2Yc8GunW85o
         947Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=iMBC5brx5yWfa3w3nScze7nkViuRZ2HsdVcL3r7y/ow=;
        b=MEOpkdMIRitxz45XXH8NOxJPyNij04N47lc4HCbkTSaCA5Frt7V1PVGv6KQdU8pjV/
         LVG6ritb7hfZEmB0zbim3WNqfwvzGO92qyzBwNjIhkJTwdUM9/Qeogrmh4mG2hC8P5Dz
         WlspA8FVgcU5euu3Wl7UohYlZlSZSizdkJUAyLCBFn1E6Oj92UQGLJJ/dfyqfc+ro+7x
         4bZdPCcVML6uCPVaOtLGAqT7oaZ2Bil7AxtW4z45trA67fdRBRe4js651PoOai8sJOdp
         yTzvsmYEO1ywy4Woo6KFctBuX/D3aVpNiboVO2qMDloRjKDuep+bfYIoPoPKkc6rnhTd
         rO+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XV3Xgm/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l201si3732628wmb.201.2019.01.25.16.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XV3Xgm/+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBXD-0007ds-MD
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:09:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBX4-0007dh-Rn
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBX1-00070d-I8
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:09:09 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBX1-0006yF-96
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:09:07 -0500
Received: by mail-pg1-x543.google.com with SMTP id s198so4852295pgs.2
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iMBC5brx5yWfa3w3nScze7nkViuRZ2HsdVcL3r7y/ow=;
	b=XV3Xgm/+N48mmjK/WFdhkDHyR8EoPBp2McCrZwOTV9n4z8Eris9b+m2wwdwH4G7fJT
	q7BN6BLd4F33vN8+j2P6Hsi24Q+gFHWrryZ1k4tcMEw+Q14ae2heGtsgqsrV342APTI4
	z4XQ/oFWDfu67aMzdkIGEhm5JhwrFnHYeDPJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iMBC5brx5yWfa3w3nScze7nkViuRZ2HsdVcL3r7y/ow=;
	b=ea7JN/xQN1KVr+ogmRtTnXvml8Z9rgpp7Jm8dlUzju4rdcycd+AU2lT4+IJIT7eVhr
	zohxMUBDgmOdnif7ROAPbykqSeE110Il+/X5rAMPOkhnlMXRKVtFvTKCuLNWjvGXXio0
	caFqZI0hy9S/vYac9Mn275OEJTKVLaDwg++BCdHXpXtnzj3pnSitpz0UbLHxFx5v5JmW
	XtuUuacNIZQqpV45Y09hMiuROzfCzZjq2s06KaTUnIHnzGdforC79K4+w9VSIygle8b0
	XuuYn8erorMsfhZFMka9dw/fUKPClmf8sIxqsROnygz+x3c1+V73b4P5yNzX2IPQRUlG
	lyGg==
X-Gm-Message-State: AJcUukcZPWw2VIh6UGaVQsgwVslF3HYZdSvqJfXIGXLE7XCqh1Puiz+N
	0gSsqXVcYm/MBBh2E8fDx6Fi+A==
X-Received: by 2002:a62:670f:: with SMTP id b15mr12915416pfc.212.1548461344061;
	Fri, 25 Jan 2019 16:09:04 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	t24sm32041341pfh.21.2019.01.25.16.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:09:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5ead5f94-49bb-ac82-6d21-ae13e7bc9fb9@linaro.org>
Date: Fri, 25 Jan 2019 16:09:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/23] hw/arm/armsse: Make SRAM
 bank size configurable
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bfcyaA1M7CRY

On 1/21/19 10:51 AM, Peter Maydell wrote:
> For the IoTKit the SRAM bank size is always 32K (15 bits); for the
> SSE-200 this is a configurable parameter, which defaults to 32K but
> can be changed when it is built into a particular SoC. For instance
> the Musca-B1 board sets it to 128K (17 bits).
> 
> Make the bank size a QOM property. We follow the SSE-200 hardware in
> naming the parameter SRAM_ADDR_WIDTH, which specifies the number of
> address bits of a single SRAM bank.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  1 +
>  hw/arm/armsse.c         | 18 ++++++++++++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


