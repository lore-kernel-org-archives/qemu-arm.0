Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4112724wrt;
        Mon, 15 Oct 2018 02:09:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV627N75LUtCCiHfaErANx65rsJA3gZ9Ircy+ptv8RDdFvdmzt8cczXaGviIXbmprUzOQciqy
X-Received: by 2002:a37:cf43:: with SMTP id e64-v6mr14857433qkj.24.1539594544152;
        Mon, 15 Oct 2018 02:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539594544; cv=none;
        d=google.com; s=arc-20160816;
        b=QjWTQBiTjhvpGUAZgy677HCf8HSOc0NFAtzVDOQ+AuVwGpU0HH1P7P8D+n+63cp8LQ
         P+v/GBSU6ksrzZMHkilh19t2PmSCZ1LwD+uNmm9BH67GvXDzDrJim6RL2a8rOEsXxP2B
         Lg+XnE1vJ7JfMDGPgSrgtJc/q+ub3yQQOS7Ne7t5RUpxUiv0ivjckYknJCqQ532uqpQh
         muln5VHvXI1IuXzFTRDofzxF0FCaUgb/9Nl72tkYgxs3Lszyv2P6NEYpzHOKRX1A59xH
         wd6wt2LHDSJF9jKhMGM/8ySZjIonG9T+l2TNG+AurkwFzGTc6C4yfO7+DOTGDiXsbcsN
         GDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:dkim-signature;
        bh=UL+lu7WHKphNfP3RVuFEOjgYJelSa8gVfYKiFXuIZDY=;
        b=UjszicYMOHkocwsS4de5oDiislvxBrC8x7cLZ6mGc8tr3eyHzbf5rv7lCmqub60LWy
         ih3q3XyUuqo7GsoJfqcpqnN1Ld9Q1UC2fFc/2KSYXHsgcZpiRCFbG6tkP126C5jjufDy
         YjItWYi2SmljTNLqN87nVphHQq/zWVkGuwezyEUNwntAIJRh2SE0aq2fEsNAyGBJFGBw
         lwfzn+ic6TzaOnp7mSD++BORX4c+7Z/RNsm6nO2iZvbZcGbqzJ6km6Iac/jsADj2jNbM
         l+q2O61OwLSyhnh2s9GGgNNWjrTZCN9wHXt99NxULSS1FAHz6rqmoRpaz3s5eKaKQ4Uv
         F9cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PmD9urG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u56si1895058qvc.146.2018.10.15.02.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 02:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PmD9urG+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gBys3-0004WB-Mg
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 05:09:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1gByrk-0004Q3-Iv
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 05:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerome.forissier@linaro.org>) id 1gByrd-0002CZ-9o
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 05:08:42 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43575)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerome.forissier@linaro.org>)
	id 1gByrZ-000293-5i
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 05:08:33 -0400
Received: by mail-wr1-x444.google.com with SMTP id n1-v6so20356970wrt.10
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UL+lu7WHKphNfP3RVuFEOjgYJelSa8gVfYKiFXuIZDY=;
	b=PmD9urG+dVWTYDI84T3EEQ1Fgpgihjpapw0quswcm1BYUpVS/l1EArdgoCd5xmWrc7
	ZnPs4+FtQlAWXAjAu0tvCcGpZj1G1SUbSYLhksRhuV7cyxCjPyOGS33uu5HmJ86ZRBSE
	SYOJLHTI45a7einwHj3UP42KK5ctZ0OT3KUoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UL+lu7WHKphNfP3RVuFEOjgYJelSa8gVfYKiFXuIZDY=;
	b=WVTYicye1LgZfVSNgV6cd6xVVWom0+YqWzOV7d4+c39W3ZLiswKQH/j8iHyDCHWnYq
	XdC0psl/RdlDnhlxwaV0NKuDKF7YwH423KVdON++j1TLjPz3dwy2s3pjRJO1ZUKrGOPh
	kr8qkDcvEubLHkTzZPmL/F5mZYExovLAhprf+gVTGFdIH8bJQ6vDAEic2ORAkymm/Z10
	mmH77B3ny3/VeuQgWHAmQnD74C4wuL09S60Pb2SPmQyML8Ff7x41IzpoIbAgUCjdcN9J
	tiwyuC7h4smcoOn7AtiWb41galhsGz8NUzsIBa0W5Mn+16ZnYsvnq5D4IDWLCQbOynk3
	oN4A==
X-Gm-Message-State: ABuFfoi6TurkUphxtjjwaet5MO4nB6gc5GrspTxHQ3RIO+0QaTQSue0+
	Ea+uNVF4LVQW6veMRHSt7FPhRA==
X-Received: by 2002:a05:6000:124e:: with SMTP id
	j14mr12856587wrx.315.1539594511576; 
	Mon, 15 Oct 2018 02:08:31 -0700 (PDT)
Received: from [192.168.1.10]
	(static-qvn-qvu-167076.business.bouyguestelecom.com. [89.81.167.76])
	by smtp.googlemail.com with ESMTPSA id
	p8sm6530247wrx.9.2018.10.15.02.08.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 02:08:30 -0700 (PDT)
From: Jerome Forissier <jerome.forissier@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181005080729.6480-1-jerome.forissier@linaro.org>
	<CAFEAcA9h7_vaKk7GuGVWv2_hFeR=xC4ZgJzLuD+iSqCdwa1PSw@mail.gmail.com>
	<d52c8388-5482-633b-bd9d-5eaf0eeb3eec@linaro.org>
Message-ID: <70f911cb-7d49-e8cb-e3cd-081033e010c2@linaro.org>
Date: Mon, 15 Oct 2018 11:08:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d52c8388-5482-633b-bd9d-5eaf0eeb3eec@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: add DT property
 /secure-chosen/sdtout-path being secure UART
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
Cc: tee-dev@lists.linaro.org, Etienne Carriere <etienne.carriere@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Rob Herring <robh+dt@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LYR2Ea0fUb5c

Hi Peter,

On 10/05/2018 11:26 AM, Jerome Forissier wrote:
> +CC: Rob Herring
> 
> On 10/05/2018 11:16 AM, Peter Maydell wrote:
>> On 5 October 2018 at 09:07, Jerome Forissier
>> <jerome.forissier@linaro.org> wrote:
>>> Bindings for /secure-chosen and /secure-chosen/stdout-path have been
>>> proposed 1.5 years ago [1] and implemented in OP-TEE at the same time [2].
>>>
>>> This patch creates the property when the machine is secure.
>>>
>>> [1] https://patchwork.kernel.org/patch/9602401/
>>> [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
>>>
>>> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
>>
>> The patch seems OK, but it looks like the DT bindings are
>> not upstream yet? [*]
> 
> No, they're not.

Update: Rob has now accepted the bindings [3] (thanks!).

[3] http://patchwork.ozlabs.org/patch/980467/#2009642

-- 
Jerome

> 
>  I wouldn't want QEMU to start creating
>> bindings until the spec is definitely final.
> 
> I understand, but I think we may have a chicken-and-egg problem, because
> Rob said he'd like to see more usage of DT in secure world before
> merging the bindings ;-)
> 
> That being said, I can certainly re-submit the binding to the LKML. Rob,
> what do you say?
> 
>>
>> [*] they're not in
>> https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt
>> anyway; is that the wrong place to look?
>>
>> thanks
>> -- PMM
>>
> 
> Thanks,
> 
