Received: by 10.28.71.27 with SMTP id u27csp908629wma;
        Sat, 3 Feb 2018 13:32:12 -0800 (PST)
X-Google-Smtp-Source: AH8x226a6cEcPhSicIOwbm8dqgO6D0XTThajPnEwFvo+XdRRTOM2u+DTjxmaEv8FCuuQtsM2N6H7
X-Received: by 10.37.193.196 with SMTP id r187mr13601755ybf.128.1517693532792;
        Sat, 03 Feb 2018 13:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517693532; cv=none;
        d=google.com; s=arc-20160816;
        b=VXzE2YqPXY2hjwWsZdvl7AZbV+MFFSjfeLT1QYiHUU2/tcyov2pHAKwd/Y8+7s0lFU
         68u9hLnNoQ37pmW9K2J7qCADnmitaVUzZuuIsLTKU1KpGoVmqCAy0AwT0xnoWkqNFpyC
         eOZKPdQpgVKwmnRSO2XD9mJTSy6RmuhCi4hz4baFv/tBHDPIkJRO1ycbl1YgUjlHGOLY
         hqn1UUiCcMViAMeHBqbRQtyjEnwA+XmoTbP7ED7x/4lNCKQGx5YuKc3Banx0KrqQ3cl9
         J46bW9uBNFF+nZY1HgE+CB8mWJJnBPv66UEaI6gSZf+eGG0xzIZkqyjm8M73n5lv6tw0
         VHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BOuJsWcsOJVp/PwPGI0EJOfZ7Hj/ZMu7oSbSamffUko=;
        b=gTjx00ED7hWkGhokZA8SF+2PbNN5DMQnFwNi/TLdzcya5v8PGtz5RU/nIlQe2O16pN
         YULrlq8qgRzuBMEafCyXdydakRu2tMUYxWtMyrYKVKAvZupcueK/I1bdfap24v0Mamm0
         lk/PBLAqIUioLZ1vQk921/++bUlG36Ya6pgkXp0DIpjr4yOGUZSE2Tdv+nRSf37jGrDb
         T2up0gXOXbLzdl2LkafhR/KnKG+TErvyb0JAJZuXNg8y9TNvZ2xZifp2grsvIrd8Pc+C
         wNJdKWxT51s4BFhSIQAFuEeo3amYsZYgbXDXCAbTxZQJCFSBxZMvVvkKB/bvkzcTI2UJ
         HnZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T5h9rErx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si860655ywc.659.2018.02.03.13.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 13:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T5h9rErx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ei5Pw-0000gW-7F
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 16:32:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5Pk-0000ef-6g
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ei5Ph-0000ny-1o
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:32:00 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ei5Pg-0000nr-SK
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 16:31:56 -0500
Received: by mail-pf0-x241.google.com with SMTP id g17so4991210pfh.1
	for <qemu-arm@nongnu.org>; Sat, 03 Feb 2018 13:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BOuJsWcsOJVp/PwPGI0EJOfZ7Hj/ZMu7oSbSamffUko=;
	b=T5h9rErxXzjlX0E6XQ3o2uWsULGYshlSsAdgRuD7GlXOVJrkTZUE7vLcD3EIe5yK/+
	v8BrmDZLqCzvlE30Hn3mhxO9gRU8YDt7gqR0d00ZQwHY266TC8ZoAr0KUF08uFPLTZzp
	DJxnhc5+I+yQNKLaNuffVg6VBRkhT5knpRfnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BOuJsWcsOJVp/PwPGI0EJOfZ7Hj/ZMu7oSbSamffUko=;
	b=GmLploXAcfonBxeJFx2XdZifMFSWHxLuL5KI48TvlXgXG7B58w7e7m30ZIVGDV0Zax
	+CYpkG3Aar8loYYUPBZYRcu+4ZY6KPd1mndm0WAwBLfT4Jtp6dNwmz/QczymDTzp+AV6
	BsuLYxKcMYiZXpn4eJLYarUajzOiqM4rIVOUFrHi/HzPEYz4N4hZh56OTGYWy/tLQ/Ud
	t4AVJiIgG34awCEUr96818EA3falLfVtVxXmJNWpEPO2vQykKuma+vXJNNF2WSQpyqZQ
	JkN34XeytPWHXvOB/33su/lAfVVIw/RmEEJcnDgT8FJ4wmiSTTkKz55WxF5pPUvq6gws
	Or9A==
X-Gm-Message-State: AKwxytdfSIYj5EAFUjsW1ZZjGctTt3wt4d4xehRPrS0Z8Jshgun5GYpl
	f3Dqtw8rQVuAgElk4JrqpK0F4Q==
X-Received: by 10.99.159.2 with SMTP id g2mr29738405pge.156.1517693515775;
	Sat, 03 Feb 2018 13:31:55 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	s89sm10195170pfk.35.2018.02.03.13.31.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Feb 2018 13:31:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
	<1517324542-6607-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdb08124-4a4c-270e-ab68-13134d3c624a@linaro.org>
Date: Sat, 3 Feb 2018 13:31:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1517324542-6607-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/7] target/arm: Handle
 exceptions during exception stack pop
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
X-TUID: OGFuYz6gRISi

On 01/30/2018 07:02 AM, Peter Maydell wrote:
> Handle possible MPU faults, SAU faults or bus errors when
> popping register state off the stack during exception return.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 115 ++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 94 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
