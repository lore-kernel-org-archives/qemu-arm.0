Received: by 10.223.150.237 with SMTP id u100csp1754414wrb;
        Wed, 8 Nov 2017 13:30:03 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q6J9ooQ+5T09PrcNwcK9mk94CpIh8U7NbXpn6TSX0Bb7FFqTKuI74cCzt4L+e8FNCjLu9b
X-Received: by 10.13.197.6 with SMTP id h6mr1308475ywd.363.1510176603584;
        Wed, 08 Nov 2017 13:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510176603; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4+mr1pX+Re+PirM+fPKdCX74RV1Ox1nc8eHVGWvwrVqf5cHAb1nAid7AftzaWrVcu
         mKPUihy8nasq8FaIpAnmmSh55dSyZpMG+fMUb02eYAN2Q9h4eSJuh7d1O9juJNA9EkNO
         A9lhDn9F6vQQkUWY8ss25tYDeu1ev8iydVOB+mfFfBkdrkBO9F14xDVsZc28QML6iLF3
         GBU+MxJG3RhF0E/5PUvWd9FOysywHB9fsoMM5wRWiGdmET1MK2DPyNKVrTpm76i9dKJ6
         NyIJ/qzDdhahG3ygQ3Mna2V+x8gvLKQvykJ1G6lULEtuCJi37XO1cSZCyuKKyH1oNfCR
         4tBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=1dd9wOw8zpkemXGMBlnA6mg14MQ7mUD4T8xN7YlM56U=;
        b=PrCQBCJAB836WJ8XG6JjhgDS81GHt07deWDov0UOdKkcjx+o9gLivIIeayzYN711Fm
         9YaaXpFshqgNesWW/yE5eRU9VpcgkNyPOKhmGmbsRVViiWTa9noTX9uXXQpK/cwnBw6m
         gBQ5S/eOF9FuIQJwjkUdudYlZWD9Z3BAANVQslwPMeAbsupfvF2HIrMS7pRGWMjnkuP/
         Ccu+wP1d2LCIOdIzG1KDF4nv7MvRLBDAljAnXCrkdp5vuw/EzlfCBkRPyn6pSXkaWxxj
         FbQqPBS1fsOFERNDsTE6U0dUKBbpaNva6aIdb/nIKMu6dhWyXCmNcvV6DXX+Q70atfod
         7LDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2gmvcTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f38si1225409ybi.777.2017.11.08.13.30.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 13:30:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T2gmvcTo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCXv9-0000tR-0h
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 16:30:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eCXuw-0000t5-F8
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 16:29:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eCXut-0003jA-DC
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 16:29:50 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:45395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eCXut-0003i7-6Q
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 16:29:47 -0500
Received: by mail-wr0-x242.google.com with SMTP id y9so3733437wrb.2
	for <qemu-arm@nongnu.org>; Wed, 08 Nov 2017 13:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1dd9wOw8zpkemXGMBlnA6mg14MQ7mUD4T8xN7YlM56U=;
	b=T2gmvcToQodi7NAtNeHl5lq8tzAtUah1WJ6LU9azcyqVLxdRWvV2Fftp4XymXabFmz
	q82mC+IBWzShFYgr63QaDuKPLJBjeyohK2HSqTneWbOxvbWV+fVcZFakkOPzJEpsZn/v
	jLlDe5ccqyzseQ9q3Ohd/3nD3s3aiINSFucUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1dd9wOw8zpkemXGMBlnA6mg14MQ7mUD4T8xN7YlM56U=;
	b=TeF4+yh/8HJLhKGyuXU3RGJIfnofbP4Hf8F4kTvPRw7NFIIycLUi9A/H5xF8V/6Dr7
	HVbKOKsNnIqEmM3X/yJok8QgWNBi/tgLip58a8wsw28Q6Qyn88kEOELbJOcRJS3dho/T
	sjL8KcH+VeWqbIg97RPpgafICZmMbI8gbm6TmyLOncMbUrJAHIMztHwwzeR9QMA+AOZj
	WolClmDRad5S4CikI7Je2cvpXe/fzaPNnc4nLbPDAwAKVDXqjIfnP6uT4AkZLd3aTR+/
	nTvXf+3wO8VVErbbMn+YaAzWnAyG6max2N7DDV6wmuVWsxbZJhDMmu+SYUR6K4xlAe/L
	SRag==
X-Gm-Message-State: AJaThX6xqZFNDMHkQBBjEa5xZ3kgG2lsiSFW9l2KJ73Kw2rHXOYjx7bB
	0VKlnUTK+FLUCgHUSBCw1BxQOw==
X-Received: by 10.223.161.210 with SMTP id v18mr1652039wrv.76.1510176585796;
	Wed, 08 Nov 2017 13:29:45 -0800 (PST)
Received: from cloudburst.twiddle.net (93-45-2-58.ip99.fastwebnet.it.
	[93.45.2.58])
	by smtp.gmail.com with ESMTPSA id h2sm4092054wrf.47.2017.11.08.13.29.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 13:29:44 -0800 (PST)
To: "Emilio G. Cota" <cota@braap.org>, Eduardo Habkost <ehabkost@redhat.com>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106201332.GA2152@flamenco>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73e9c472-82da-b293-27cd-ca9e0ff93179@linaro.org>
Date: Wed, 8 Nov 2017 22:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171106201332.GA2152@flamenco>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4uT8HO05imvw

On 11/06/2017 09:13 PM, Emilio G. Cota wrote:
> Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global
> 
> 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
> introduces a per-CPUClass bool that we check so that the target CPU
> is initialized for TCG only once. This works well except when
> we end up creating more than one CPUClass, in which case we end
> up incorrectly initializing TCG more than once, i.e. once for
> each CPUClass.
> 
> This can be replicated with:
>   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
>       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
> In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
> whereas the "regular" CPUs are prefixed by "cortex-a53-". This
> results in two CPUClass instances being created.
> 
> Fix it by introducing a static variable, so that only the first
> target CPU being initialized will initialize the target-dependent
> part of TCG, regardless of CPUClass instances.

Hah!

So, I had been thinking of the xylinx ARM + Microblaze case, where we really do
need two different initializations.  I never imagined that two different ARM
parts had different CPUClasses.

So I guess it's my initial patch that unified this that's more buggy than not.


r~
