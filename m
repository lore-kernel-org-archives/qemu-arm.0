Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp889959wrt;
        Fri, 25 Jan 2019 16:25:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN51Lq1CjZFvVSGQQVl+hw89CYkLPRCI0SzwNvxQk9VPUXzQLndYw7xGO99r4zTz8e+ZN1Yq
X-Received: by 2002:adf:bc02:: with SMTP id s2mr12954254wrg.255.1548462303252;
        Fri, 25 Jan 2019 16:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548462303; cv=none;
        d=google.com; s=arc-20160816;
        b=GhdIDHwQTH4B/TiJPH2jT5ZJ0bpAXBcvxzv1UF7Qr9tWlWpBAsLe7IAplSRuPXQ/4V
         84iO5CAHHPwRwoFT55WvnArnOMs0WQ/D+uT63jMHx/goMAqoiDB5OkT9h0Tnb1kIwGd8
         k5l8zy4iKLbWR/Ja4seOr14DbKPpJksz0hm0KC4sxJa+VlnSqx4BRqhPE8nvurSt4Iq4
         TqlIeJ+r+WC1zCsiOcVI2n682a9VjkKz69KauwYqyzfLYgHZ8Bj4//vygTpougsew9M/
         DE7rQKAaiZeSQOV0l5QKmq5CoQgfJIDlB6nSyQXOm/CPZLwHpBMOghXliOTfreOr/wo4
         k+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=eKEzPHcjlfUkSL2sim6nWcHaVv7uQXhqE+DlXfqVoI4=;
        b=hI4L8A8oTlwSXXW3s+y0KpAxOIhGIXusI2uNvnj+z2l7uMbSoHeG+nzpizLY2AP1EV
         W9TXT5JqfTAo1zxyQdYap42pCCm53p9hyl3OiVzWrT/L1tu0GVvv26iha/0oCOSfBJIK
         tM9ki6uxtP3/WHB0OP81fhPjFfaU7O/vuT2TJ5c4kH2GLJuvXVAFxUYjBRrw4sSuWljQ
         az2VTRBnN52ID3Zk9vyFCdPYszat+k0i3LVvqEEJr4ff5pqDHfQk3LDT0TPjVaZx2FCe
         CXazMgQ07bvCFo3tkKi4Vko/cq2uPBaxmm9MbhaSfpejP5xQUY5AjdWyVy9188HcNyL3
         0ltg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM7SSH2X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j81si46925127wmd.175.2019.01.25.16.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 16:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BM7SSH2X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBmQ-00025T-BD
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 19:25:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBmG-00024z-Ia
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:24:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBmF-0001zx-Oy
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:24:52 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37539)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBmF-0001yr-Fw
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 19:24:51 -0500
Received: by mail-pg1-x541.google.com with SMTP id c25so4859703pgb.4
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 16:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eKEzPHcjlfUkSL2sim6nWcHaVv7uQXhqE+DlXfqVoI4=;
	b=BM7SSH2XGrnb9EXZSAQQ+BwH93ObR99tIML29iByhH/J/MYoAJzD+2zXo9Vjj6LzmR
	F079iIcXHOOl96mANjPFHB+JzV5W5L6C/TT2u5XE0gZYU/mpH42uURY5y5Vxml7N6gDp
	VIed1j51rtgSB1Q8qnr6KKxP92OIRpDjZX4SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eKEzPHcjlfUkSL2sim6nWcHaVv7uQXhqE+DlXfqVoI4=;
	b=Nr14WNHB8vDAKvl2t7t53ZwEcsXOGorfCaHnm5DCXvxpeaIF+oAW1to4KfGVtq0oKo
	7t37fFql3oECTwM3/iEIwbtKED+KpE4M1526wdnO4/9Uxd37hmpCqeWrhQwipE/gtQbn
	uf3FaSyydznKP7ZcTpknf/nDsObqqTgMCsM3MucwL1uivfAaAOsJCIaMkDYogvasxT6D
	iMTrkRHiz25S26ReE33Aa6Jtk7tkFA/OgnIQ9rJcpP7B9nCZZOAIzaCFv5YytXVoPUCl
	pRdR3OKvRCRRyJjyLiruQ4m5dF2GLKs7d/sgunl3IOql7C86n+7h5kHqFllJ1aKJGwdU
	viAQ==
X-Gm-Message-State: AJcUukcY3jNI2DHsH+r/7qwF57PBVK3mfs5okmzL1/YHKkYn+ISbSUgW
	0mOj0ke4Jruneza1qjtMVDZQhA==
X-Received: by 2002:a62:ca9c:: with SMTP id y28mr12947504pfk.236.1548462290322;
	Fri, 25 Jan 2019 16:24:50 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	w88sm59842909pfk.11.2019.01.25.16.24.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 16:24:49 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <330788d1-5947-407d-fa78-897e0f00f149@linaro.org>
Date: Fri, 25 Jan 2019 16:24:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/23] hw/arm/armsse: Give each
 CPU its own view of memory
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
X-TUID: d51BiRXXusxK

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Give each CPU its own container memory region. This is necessary
> for two reasons:
>  * some devices are instantiated one per CPU and the CPU sees only
>    its own device
>  * since a memory region can only be put into one container, we must
>    give each armv7m object a different MemoryRegion as its 'memory'
>    property, or a dual-CPU configuration will assert on realize when
>    the second armv7m object tries to put the MR into a container when
>    it is already in the first armv7m object's container
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 10 ++++++++++
>  hw/arm/armsse.c         | 22 ++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
