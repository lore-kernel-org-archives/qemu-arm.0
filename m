Received: by 10.223.188.70 with SMTP id a6csp6173432wrh;
        Tue, 29 Aug 2017 09:10:21 -0700 (PDT)
X-Received: by 10.55.195.68 with SMTP id a65mr3311397qkj.57.1504023021542;
        Tue, 29 Aug 2017 09:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504023021; cv=none;
        d=google.com; s=arc-20160816;
        b=KGBGR/vVrovqp3af68/rzVr93pgm37h6HpK7/EAL3gEChcMi7Xb8TxNSSuZi93C3dM
         yjpqZfcXZ27exgvvccEnPSMeQXO5oOXb87V1vQrTEp3AOtKVPPdB4luHM+F0vFqJWN+9
         xHkbUNMHbVkwBBBbJtQT+8tvDmdU5pirZUhQwW2syxyXLzcYvQSmlL6KDlFhTeRe1U1l
         KTSARy5cfOd6Lt8PUMJki+ggwAEyNQk1bjsv/hWT8swC5gNeXkSqf1UFeJaGvyApNRB8
         4d9KTFiVsTCNPJBosBwRX6FVshi5mpwdOC0EYzw6j/kQU2SXBp+HOsHYrhD/r3SikEx/
         8mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=wt+/ztlafTzzpElGd3ld+0VrtV1ou/3/zbXaRkFOZgw=;
        b=byOJR95YCmyPaXjRI8edVDp6CoQr0CVs8EAtB7Jb/hcsaCZfhCbcMJoxgAjDIvgRNd
         hJTRUm71aSYWTvHfMCJ8qLvJGagrKJIJrDjfj41TqVWLfx5JLQNYNfILX3VfbO8hZOCv
         t95Fl1jude048oCBahWrPoFcyslWc0cJkhfgJSdkY53HODsqAdDaZl97lDMoanRhkAJ/
         XmV+3tOPKtKy5TMr+w6K9zd5D2qCRAwReACUd6hciggHAmQreCEyj4J4NQwtfZMRuHXI
         lJ+ET1AOrqEu9ja8WryrRM2+WW7PxMDypP2SEgUJYMe7MHhqwFpbbZLt9wf5rMXT8265
         608Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C8VBFdo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d24si3077977qtd.117.2017.08.29.09.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 09:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C8VBFdo7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmj5n-0003cY-5X
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 12:10:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj54-0002zB-5w
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmj51-0004ey-0A
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:09:34 -0400
Received: from mail-pg0-x229.google.com ([2607:f8b0:400e:c05::229]:33395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmj50-0004eH-QW
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 12:09:30 -0400
Received: by mail-pg0-x229.google.com with SMTP id t3so12146575pgt.0
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wt+/ztlafTzzpElGd3ld+0VrtV1ou/3/zbXaRkFOZgw=;
	b=C8VBFdo7MQtqW2OpNJSsiMmGCoZcCIBcxax0zhP/9E9PrwQxPnXsguq939aK936/0s
	ihW0zs9DOhZadIk0dYT9IEj2m5N4WFsFzW37s+ueYd65z1B7YVhazLluunbVFW1Qzrc2
	SV7AQUUvpZ4qCpugCo3mBKGyOtVyOrjiumpno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wt+/ztlafTzzpElGd3ld+0VrtV1ou/3/zbXaRkFOZgw=;
	b=TjKOVBEa4DIY6xJE7pxA/BMGb6eI4yKDApow21D1jm3q0NzP8+5I+gDffm9SIY1crN
	dJ/5kjosOK5EPQt+3nBM8W8kzk/GnR/FbwxGtaiKtmqhCtItUR++PXYAaRA4lSNJUTvR
	+FNq/8/mEARQKbv6MTyRDmGMA7m5Bh0389f5w6+wUEWLHnnBHvN1JAshG9Vf1c7KO0eg
	9dRrmadSDV4BMXhKbpOe8K+jUSFFUCpMkqg/EL1cxYkdThrmb1L7FmCuuhEeo8hauUAj
	Zja7K97JxFBq4VcpGo473gOgyIMN6Fyonh/YP/DxPeK4UfGUwkTJlxsqZwLriX2iXBER
	O+FA==
X-Gm-Message-State: AHYfb5jXshmwMI6A3041U1CHHdZJv5mEJ9oD2iJEZXqLGlv4ZPIUVrWG
	pgeYS2REEt53SCvQgVLiHQ==
X-Received: by 10.99.112.20 with SMTP id l20mr812178pgc.86.1504022970048;
	Tue, 29 Aug 2017 09:09:30 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	v75sm6506096pfi.134.2017.08.29.09.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 09:09:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-15-git-send-email-peter.maydell@linaro.org>
	<f7e28796-d080-f7bb-b283-6f78f404a36e@linaro.org>
	<CAFEAcA9eV2Fq3iAd=rc52UkzCfp7BamJut0AqAbrwBf4-0qOQA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <efef0f71-7ae0-ff62-3b3c-8dabf3007d75@linaro.org>
Date: Tue, 29 Aug 2017 09:09:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9eV2Fq3iAd=rc52UkzCfp7BamJut0AqAbrwBf4-0qOQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 14/20] target/arm: Make MPU_RNR
 register banked for v8M
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tugt1gVR3/Qq

On 08/29/2017 09:06 AM, Peter Maydell wrote:
> On 29 August 2017 at 17:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>>> +        env->pmsav7.rnr[M_REG_NS] = 0;
>>> +        env->pmsav7.rnr[M_REG_S] = 0;
>>>          memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
>>>          memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));
>>
>> Why some memset and some by-element?
> 
> Roughly, memset where I would otherwise have to write a
> for loop (ie where there's more than 2 elements).

There's only 2 elements of mair0 and mair1...


r~
