Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp175021wrt;
        Fri, 5 Oct 2018 02:31:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61K2C0TDU3z/wkugLi2ydbyoDU6rpX4HwL8QtFZ/R6/dwklYJsKtlxxk/N5szQF2uXHAydQ
X-Received: by 2002:a37:1b4b:: with SMTP id b72-v6mr8316529qkb.48.1538731884910;
        Fri, 05 Oct 2018 02:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538731884; cv=none;
        d=google.com; s=arc-20160816;
        b=ywjWd7MlLn6BnS5Pf0/TFfNW9dwUR+w1Mlg8Ru9AK7RgbjZ6rwr6Rov2Khm1DFEhR8
         3/LDC/lXXP6J4gc0B9mxYjFijjEcZvWHmBapl+0Zm7ox1WNbvI97wr1Vmu+HSOWWOP2d
         qxG0J+CFNd6BaeFjMlCQd7C1xMeYDJc2hD7VZXKoIYCGuEtkynssSKi2N3gQtm3F4LVt
         eLTK8KA2ZSQL9pNEKaK94/FXiLb67zxL43nk7k4fhPk/B9mjE5qHmEIoEH6zVZEbC2cK
         SA1tB7Y4Js2Ll0CGauyqnPXDk+s4W9lNirM1PEmhW5LpfJp0ZSDMkMeHWgXI1QM5yeis
         rifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=J9KD1O8fes54uk1jHebHOdr61pZH+ntyXeq3RVdwTW8=;
        b=XT6nHYmoH5ujERs7595wSrMN518TgVU3fsV+RaOPeX17Un1NHn4ErUzlxPuau5YxOM
         WvnRO9mLy3RhQS+WkqmRdrHfjl15rGiurMKwoe93zSWk3HN6of8QQOoKyPjHphgg4hXH
         2niDd4s8yiuVe2OVxjcOaEyV+n5DuesAHbnKOqxckPvw1Hz1zI1Z+JvbeeBBKSCYVqMV
         tBAqgl8x3Tze/oQBaML1BaVxqRhJdS6msli9hLTK8pVk0eb1/DdUxNWlxW2u6sSjq0u0
         SFihDr9zm2AWhU0dOS7G1hom0R9k/4/mBVV3PPPr8lCUCrJ3zA3IQDVdS04+9quhFEL1
         E5Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Chsj1lgQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16-v6si2607159qvh.46.2018.10.05.02.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 02:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Chsj1lgQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8MSC-0001t5-BW
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 05:31:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1g8MRT-0001nL-E9
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 05:30:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1g8MNt-0001gR-Dr
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 05:27:03 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerome.forissier@linaro.org>)
	id 1g8MNr-0001be-Jl
	for qemu-devel@nongnu.org; Fri, 05 Oct 2018 05:26:56 -0400
Received: by mail-wm1-x341.google.com with SMTP id b19-v6so1195113wme.3
	for <qemu-devel@nongnu.org>; Fri, 05 Oct 2018 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J9KD1O8fes54uk1jHebHOdr61pZH+ntyXeq3RVdwTW8=;
	b=Chsj1lgQxkcA7hRg0eeA4PPjJWvWt8mrYen0RzE5wOfyvAyd094eDzMYqJ0yPZ78Kz
	enTWxcp0nhBzeYdLOluR/kK1daDpxHbgW/gEerqba8NmbbxzgTg2oIpwOk0woKyLKGpM
	Lujy8xLeAlbscdevivQYiYbfR5dTxI6CpfrKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J9KD1O8fes54uk1jHebHOdr61pZH+ntyXeq3RVdwTW8=;
	b=P/hazYeDNGXWrwojUK8eB1RP273y5hn2e1DMNcKgp3SNxpfssqyzO6qnLN/oqMQKw8
	tgPNY5E1kjte1187c6WlZwY3HQ5ORpdQcpZlGAQ/SpZ6z2QFTajkN+Mn/S6ZN3LhsQkN
	daAi3viwCt/yovBPqdP0gxze3Go5ZCQPKKw9aRSo21RvSeHfMrVj9tNpnbbGOmNJCFJC
	rPdW8dirgxn1XvzKKB+0XLWFLj6+LJUQWIWx8M1bxsRTfMGSP4fcVUKGxRWiSYsAUU+M
	tF0sS+4kuwN5aSNsApPukEngJgFO5zQZJyASANBu7OD1Z9pp2zBGDqBwqQ5Rb6HTPEiP
	vRrA==
X-Gm-Message-State: ABuFfohMksHEHEEGpRZHxsErEHT/VqeFuGWVszVkbsEzfthhiWJoqSoX
	fFJ1OyxY53poIS6AGHRSVSNeLA==
X-Received: by 2002:a1c:b157:: with SMTP id
	a84-v6mr6846827wmf.18.1538731613639; 
	Fri, 05 Oct 2018 02:26:53 -0700 (PDT)
Received: from [10.8.8.42] ([84.39.112.123])
	by smtp.googlemail.com with ESMTPSA id
	w72-v6sm12881093wrc.52.2018.10.05.02.26.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 02:26:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181005080729.6480-1-jerome.forissier@linaro.org>
	<CAFEAcA9h7_vaKk7GuGVWv2_hFeR=xC4ZgJzLuD+iSqCdwa1PSw@mail.gmail.com>
From: Jerome Forissier <jerome.forissier@linaro.org>
Message-ID: <d52c8388-5482-633b-bd9d-5eaf0eeb3eec@linaro.org>
Date: Fri, 5 Oct 2018 11:26:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9h7_vaKk7GuGVWv2_hFeR=xC4ZgJzLuD+iSqCdwa1PSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: add DT property
 /secure-chosen/sdtout-path being secure UART
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
Cc: tee-dev@lists.linaro.org, Etienne Carriere <etienne.carriere@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Rob Herring <robh+dt@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5wMXGQhBnOe

+CC: Rob Herring

On 10/05/2018 11:16 AM, Peter Maydell wrote:
> On 5 October 2018 at 09:07, Jerome Forissier
> <jerome.forissier@linaro.org> wrote:
>> Bindings for /secure-chosen and /secure-chosen/stdout-path have been
>> proposed 1.5 years ago [1] and implemented in OP-TEE at the same time [2].
>>
>> This patch creates the property when the machine is secure.
>>
>> [1] https://patchwork.kernel.org/patch/9602401/
>> [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
>>
>> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> 
> The patch seems OK, but it looks like the DT bindings are
> not upstream yet? [*]

No, they're not.

 I wouldn't want QEMU to start creating
> bindings until the spec is definitely final.

I understand, but I think we may have a chicken-and-egg problem, because
Rob said he'd like to see more usage of DT in secure world before
merging the bindings ;-)

That being said, I can certainly re-submit the binding to the LKML. Rob,
what do you say?

> 
> [*] they're not in
> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt
> anyway; is that the wrong place to look?
> 
> thanks
> -- PMM
> 

Thanks,
-- 
Jerome
