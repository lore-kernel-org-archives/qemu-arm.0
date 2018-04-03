Received: by 10.28.71.155 with SMTP id m27csp3399637wmi;
        Tue, 3 Apr 2018 01:23:46 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/xIRMgKo77Q5C5xvbkC5Fvvvcm1hTmysrLbJackUNWnPQLUGrckI1Ufdh7zxG5TsI3sCr7
X-Received: by 10.200.7.11 with SMTP id g11mr19116237qth.341.1522743826131;
        Tue, 03 Apr 2018 01:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522743826; cv=none;
        d=google.com; s=arc-20160816;
        b=ByUdUMN+Q44XV62jEDghJu71Hy5IC8KFZorrBXWg0Hkrx7W7epK2Phir9vexrMgdaM
         yjVLeSF22Rr43MuYGUGDMnk053gspQK7TWplqxezypM0r/rqskaCe7MBQztumnW3TaFF
         i7ZcvYreE+g3120+TmBvUb+ogVnJXKG3dUhePgnXnfuCTPkWE8HWhiIHv1gaGN0+C/KZ
         cnuPLc7+3SkLJvjmpqgkygnS+1jqis0UrqJTA4lJl+MJJ+H/kE8Gjku2OvpPMXrXQp02
         XCA/w73hPogRRRzONH6YiHX6hOJz1KPCzic5TSpbXhY9h1skUarVweTp/i2xPzz3MkOl
         VWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:to
         :arc-authentication-results;
        bh=b6DjQz4dSAQpE7rFIqioqo4zZFaGiRM3TvZt0kem2BA=;
        b=cGsHzLsoAqpBBP9/HlivZjeCiq35xnrSi0TLt+xCRq7+IdY0Cv2UPBuRfY/nH3M12v
         3EQgRNtp33mkPVNiw0AzNCuNhROVrmZhDXJi2Z2A4bLpfuqVAo9Ut4EXA5dFXGvhS5+B
         rB47bHRh82RphIaH2lNG7fyuwyaOWEGW/Y+470LLnM70QChQkNOmSdhYMVMGl3sUvLQS
         AX6NrM7dis/yBxvCHhOO4iZA/GBLcN9Vqz9At8YuLEJhNRdjBVxEIu2RHEIwhIKoOJ0J
         PTgbwpUnPawWJgFu/2emVMLHQNRctv7DugQpEC4cYjmQEip5BoBMaYCsOuKaP5C2HJF9
         gkzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h200si2606163qke.96.2018.04.03.01.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Apr 2018 01:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3HEH-0006D2-Lk
	for alex.bennee@linaro.org; Tue, 03 Apr 2018 04:23:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1f3HE8-0006CC-3x
	for qemu-arm@nongnu.org; Tue, 03 Apr 2018 04:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>) id 1f3HE4-000491-0J
	for qemu-arm@nongnu.org; Tue, 03 Apr 2018 04:23:36 -0400
Received: from foss.arm.com ([217.140.101.70]:36782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marc.zyngier@arm.com>)
	id 1f3HE3-00048O-Pr; Tue, 03 Apr 2018 04:23:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 524481529;
	Tue,  3 Apr 2018 01:23:29 -0700 (PDT)
Received: from [10.1.206.75] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	88E213F487; Tue,  3 Apr 2018 01:23:28 -0700 (PDT)
To: Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20180402205654.14572-1-andrew.smirnov@gmail.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <02108999-891a-39a9-528c-04c6c5054e3c@arm.com>
Date: Tue, 3 Apr 2018 09:23:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180402205654.14572-1-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Allow manually specified /psci node
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J2r89QAjPlV/

Hi Andrey,

On 02/04/18 21:56, Andrey Smirnov wrote:
> Change the code to avoid exiting QEMU if user provided DTB contains
> manually specified /psci node and skip any /psci related fixups
> instead.
> 
> Fixes: 4cbca7d9b4 ("hw/arm: Move virt's PSCI DT fixup code to
> arm/boot.c")
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
> 
> Mark:
> 
> Sorry about the inconvenience, here's the fix (hopefully) to the
> prolem you reported in [1]. Let me know if skipping all PSCI related
> DTB fixup if /psic node is present is not the behaviour you had in
> mind for your suggested fix.

Yes, this looks pretty similar to the hack I implemented locally.

Feel free to add:

Reported-by: Marc Zyngier <marc.zyngier@arm.com>
Tested-by: Marc Zyngier <marc.zyngier@arm.com>

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
