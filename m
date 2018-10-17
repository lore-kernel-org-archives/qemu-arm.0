Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6663580wrt;
        Tue, 16 Oct 2018 17:10:16 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61N5luSS3fSuVKzHAcfdJfxnc6uX8HR6bisLwkO043I2WwBFmfWviz5hDP1c6czkSqwUf78
X-Received: by 2002:a37:3588:: with SMTP id c130-v6mr22304042qka.199.1539735016624;
        Tue, 16 Oct 2018 17:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539735016; cv=none;
        d=google.com; s=arc-20160816;
        b=D2hucN4RVKVMjfYixfsUg9ZqqTdPTnECB3WlwXZ0+BLvpN7zXWgAfGD/9UEXxVDKz4
         +zZ0yTy64Z4DQt+9gAe7nTcyZRIQp/yFy45gFpGMIR4Oztu/IrzGg2CN0NCnl2e3B/Kf
         IHa+RKFoQ91k/8Vr6pPOYjeXmsIsjSQQn2C8J+Ppgw4HMG+ENI5MBNlVEaqbFwW9IoFE
         rn2KKnZXtnbSBO5VClZX1R+LnJkDl5XhNlVAzq9NejoszeIsDZ6FglGd4JYT3bnzCHBn
         L9bJG8DzkKA8Wxqcb2GeKor0BvH1cOfU5stQBsyjgktsEF2SkEnnxeiQjBldrMXUEssH
         hYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=cKP/tzfR/LS98rIqLaiislOxyYUmndsEchzOJvFEyvU=;
        b=Ts2Y9zOWRRtknnammMdYdfvU41JE5pb8IdIp9smYVlvd2Fm+ccfBEqsskUvoBWWDpP
         zloqjbSKhGan57zf+95Js2qWcXcwZvTb87tFyWRHbIkPoIn7PehX22oFe7sG1euXQU4A
         ESOWmE1BGTMT9SAc6RIQrZCH7jUy4bK5v43CIW4pBU9VYkO3+Dp/m2XfobeUp8FGRocu
         SXqDfyTeLk1iuk7/G2VKxfqkFlkyTFKALpmEO7sN7vNjGM051BjxjS0vw7tqfVC9B7S2
         zLN7Wf1ttmuA8R5OD6HoEMKaGFOVZ0z9VhDA06/g8DgG4tmiNxVJZSLrZIa/v1vNE7X0
         tkhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XCqQoOC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198-v6si4388999qkb.168.2018.10.16.17.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 17:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XCqQoOC/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCZPk-0002RJ-5M
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 20:10:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZPW-0002Qj-R0
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCZPT-0004gs-ML
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:10:02 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:32795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCZPT-0004gK-1G
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 20:09:59 -0400
Received: by mail-pf1-x443.google.com with SMTP id 78-v6so9872604pfq.0
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 17:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cKP/tzfR/LS98rIqLaiislOxyYUmndsEchzOJvFEyvU=;
	b=XCqQoOC/2U2y2IvylJ54O6QHtnXIvifqRvcxN0AM6COSObQSyxaTH5wmZxgfCGDmqn
	Z/rWx3xB6S8QCQCK2IW9I1MERvOTEKaFmXWQt3J9WJv7/m5+egbt2wcWdKkZMmEER810
	5It5z/1xb179Y2rVfC7j1CI33GL9p8J7vM4Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cKP/tzfR/LS98rIqLaiislOxyYUmndsEchzOJvFEyvU=;
	b=UgfjHdmecsviYR8h2LmAz+okaANnnN4I9HZbnHm8BNgojar7MCk9opy+gjzO9F9jY2
	IBz5w907jrKpC/TZroblOq2wuGy7Nb//163UpoUStpxTAi9AzyzAFhXAKgvW5gnnfciC
	bdKmx+1Y71F2cQVW4NzPkFFNgCKr57GiUry64agPAbjDO5WYRJauTRJOYC/W9qlg99ik
	IIrxtqsTdXqgBvTThmvk96iTn897WFrEh6KJuVlK61bGwFxi3uwNA4uisn1i867MmjYD
	Xi1ZxQx3VkL5u8gx8yYxXOaM1qtlJz/4DyVOUxWt2g16mEUvurae/ue3G3fxfu98Wo7H
	QUOw==
X-Gm-Message-State: ABuFfogcE2bj/jEZX2cVDKwf1v+66rMsh81un2/plOiJ8FERd39t3THK
	9hrQsGo086BB65mgFqe9QAlBbA==
X-Received: by 2002:a63:3842:: with SMTP id
	h2-v6mr22163935pgn.300.1539734997958; 
	Tue, 16 Oct 2018 17:09:57 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	s85-v6sm23672884pfi.15.2018.10.16.17.09.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 17:09:57 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
Date: Tue, 16 Oct 2018 17:09:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-13-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Co2MPXIWTjMp

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> This both advertises that we support four counters and enables them
> because the pmu_num_counters() reads this value from PMCR.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

It looks like this should have been folded into patch 10,
or patch 10 split to include the code changes that go with
these comment changes.


r~
