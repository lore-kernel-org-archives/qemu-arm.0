Received: by 10.223.172.38 with SMTP id v35csp1976659wrc;
        Tue, 5 Sep 2017 16:05:45 -0700 (PDT)
X-Received: by 10.200.24.168 with SMTP id s37mr352260qtj.287.1504652745838;
        Tue, 05 Sep 2017 16:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652745; cv=none;
        d=google.com; s=arc-20160816;
        b=FZhozfXL1ju5cHgoSlfPpXLa67LGZTbfj46gapzxcnzuWYawy6XzgF7v7Anw+2xkUS
         lVC8S6ZQ9+UIaWp9zgpvcwHIgVspGJWOWxYOd5faVX5ktZy+pPIligm/reUdTibZUH6C
         dD1r0VYWn1u4lgwYa4uiiY5lXXY0JeNhfWfdWg0elUB6l6Av6nSu2PQCNB57s1/cXqW4
         q/tf4rXFGcWMZcPEkYo/RmxZqm5s4YEcNZPKXSg3YGqzWNAfQBsJg0jWbvsHZMbS22qX
         SK5k0MuupTNUvmpkrxnFaiOUhvQ76tewA6g5j3AaiYZzwlNOuFYQU0p6QLp+pBk44PrK
         J0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Kg6DhffWXR4Y1+WIGVv82Z0LZFWX7XLhCugzw/S9pIc=;
        b=c9kweuHiKp78tiSG8DeYUnhFuz8qJEKYq5TmQiPz6792OHBaCb25rAYHHRZimLIgnf
         jX9jrTbm4lUUobkEMotfTblFc8SNg9lB8PRjLKVXHa8KVCWVNABRJE2NiWi4SKMjf+6r
         5Zi0B1ppWlLqlxE/u3JRBf/lGW5uKLjPdH4JgyYw7zxaN9ULFbiOgrGESzWJvxpWQ1pk
         4rcAgprQa1UZais2nnUWFdAOcdug7mKOd9m2EMIQKLyJ/j0aH319Amc+UnNk5U+cRgQw
         DSCQ3jtuw73aTykycBLZXsBTFSzDa6CPSMzknKbi1KwCP0WqqUyktiRMkNbarA4mVhp9
         D/ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sQ0Hj06Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r83si1602327qki.436.2017.09.05.16.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 16:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sQ0Hj06Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMud-0006iS-7F
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 19:05:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMuR-0006fK-VB
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMuN-0006c2-Bd
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:05:31 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:38231)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMuD-0006Z0-PF; Tue, 05 Sep 2017 19:05:17 -0400
Received: by mail-qk0-x243.google.com with SMTP id c69so2977092qke.5;
	Tue, 05 Sep 2017 16:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Kg6DhffWXR4Y1+WIGVv82Z0LZFWX7XLhCugzw/S9pIc=;
	b=sQ0Hj06YmhK/ERIgJRofxaUOEmRyfKxmfn0vCAHOTJjYewEe3HmsLhlhmpZ1J8J8bN
	854u2ZoVbcGhlirtYJxMU5ec36fDWuUnJsaxGU37YczMAVBOudoIk1pil0MWIjvTC3uJ
	FXiSkIncEhTZVenUy/jy9A6dff/DGp5DB3ei8nDqFYX4Dd0+XJoTRwtNtnl0peunD4zu
	QcGaTJKvUfMduQGzZGhesSK8/hu3sVMnYNtyarwZY2ovY5zlmuc5tZa1/a3Ea81xhu7q
	8p97lms+bAPUh/Ky2NrjXzm9isywD3Xst7JHnu8mmUAE7u3ZYkP5PrqdzwuG7KuBrIzb
	dTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kg6DhffWXR4Y1+WIGVv82Z0LZFWX7XLhCugzw/S9pIc=;
	b=hILvWfY69xuB/+reCDlFaX56eBOz3QX0olEFH7feLKI5qjWe8lOdFlN3BdR5bt+1Cl
	UaHFQ0CTTLLGl+9PezzneySfjObDPdmeSwqrb/Uct9O+iDVOMu6bzIniPNVarByk0Nvt
	60ZBkl3cv8lP4Nw8BxqcQHhuL3kboYnDm6dMcnxCCoPvRR6mFKqgA7NtT/U/AygHdH/k
	/HwE7chdQ3s3l11H9Op9YRk73JtmqcI8bduK0OW4ER/S4qS4NDMryJlHA5KWNKa0TFcG
	pMd8tksh7+OQV1DTiyP8NIHk6aHvfvIqLcZMxllpoMSVqTbUzI9sezmafN5XakU8SmqO
	kzJg==
X-Gm-Message-State: AHPjjUgEFReA9Sk2uxSO92P8ntpH3ZPdlObl4UxQ1nuwYL3d2J3GeeCs
	t8SVYGMxl3glXw==
X-Google-Smtp-Source: AOwi7QD3VvvB3ooRK+i695QejDXIH2ygC55VNEK5fPp/nFkZtGDtPc1ZSAOEg1w0b0FEz9l6OTp/sg==
X-Received: by 10.55.98.18 with SMTP id w18mr939873qkb.163.1504652717271;
	Tue, 05 Sep 2017 16:05:17 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	v17sm1230032qtv.62.2017.09.05.16.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 16:05:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-18-git-send-email-peter.maydell@linaro.org>
	<dfd92b0b-45c5-cdb3-702c-c746d77d74ab@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc503ce4-d2f6-1d42-341c-f3bccf15fc7a@amsat.org>
Date: Tue, 5 Sep 2017 20:05:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <dfd92b0b-45c5-cdb3-702c-c746d77d74ab@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 17/20] target/arm: Make MMFAR
 banked for v8M
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: En0fDHcUwv9d

On 08/29/2017 01:10 PM, Richard Henderson wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> Make the MMFAR register banked if v8M security extensions are
>> enabled.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/cpu.h      | 2 +-
>>   hw/intc/armv7m_nvic.c | 4 ++--
>>   target/arm/helper.c   | 4 ++--
>>   target/arm/machine.c  | 3 ++-
>>   4 files changed, 7 insertions(+), 6 deletions(-)
> 
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
