Received: by 10.28.173.206 with SMTP id w197csp2187399wme;
        Fri, 12 Jan 2018 10:49:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBoud5A6zpJmtXxnu5hQoBjd2nmqJCwMoxI3ydiHcMBtyjpHYIMU/7am/x37gP14LbDZGxXiU
X-Received: by 10.37.188.198 with SMTP id l6mr25270173ybm.356.1515782981887;
        Fri, 12 Jan 2018 10:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515782981; cv=none;
        d=google.com; s=arc-20160816;
        b=fy1eiWFYImh1ssyCzgPep8IaSDMkJPd21PGmzce6pe+BLRa3Uq5HvJA+RcVaK4s0WA
         gNzEKhgWkLhJ14jOQOZ49GCns3zf6h74mq2t3s6wFUE3FP67pH9oDrTy4K8umSxILfjW
         yU5sSDxkTPlUyOLMlJ8rPQCt811thAdc9jzzlVvQ77DosQLMuesJQqjywHlAuhkyt/vb
         smoUtDDjDmgTAZ+9Y18qQ8EN0/mXqp4+nwivSqHYkokKz7TkuBZVs6CKZUQ9Smc19PFO
         A+UjnCpa+V/FqIKCXzLoQyY9vBM+Wf/rEx5TPu/l/XhmxblP516B2+yo/ZagaEMD49XZ
         1whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Rn52ogmpfrfqECZmx6dX6IsBOFlV5B6jtu7+kBV5p+I=;
        b=aLeAJtOirCZaPQZNbesoHHohvOEbn7N9icmviufPdT4PvlAMboXlt3/8MO6pa2L8+v
         rZRbjOO7bE0LoGPsa+gWXClmgvLkwMrk9r60DzNrv6vf257ciLWpv28746HzUsz8kTWM
         Cb/tNlNzm9FMvlr82qUN3MudPLylBrl8pjioSBKuQAXKoitxO0wAC/wsN+32DEWeAwF9
         0CM9uFHtDB+WetV9WeZBrWB3uarJZz1Up/ZH9r0g8a0TWfumTmSocg8pcMYjFy06kmbj
         uYarwxKr9fZ0A4BnWKsnBe1Pi/DW2vQmsgqRVePCEJpDGMOxrUb2X33KugyKN3VkVjVa
         yotw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wiq58DyZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j78si3010674ybg.31.2018.01.12.10.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:49:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wiq58DyZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59110 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4Ob-0000Ve-9I
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:49:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4MK-0007VJ-Hu
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:47:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4MF-0000r4-NB
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:47:20 -0500
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:37643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ea4MF-0000q9-HP
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:47:15 -0500
Received: by mail-pf0-x231.google.com with SMTP id p1so5022852pfh.4
	for <qemu-devel@nongnu.org>; Fri, 12 Jan 2018 10:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Rn52ogmpfrfqECZmx6dX6IsBOFlV5B6jtu7+kBV5p+I=;
	b=Wiq58DyZIpb9JbFyswxqcdSb9DinYYNmsnG7z8VOPtC2RtRPw3lDAq5bk0oONpuuj9
	q+3sFN4uol3EarTWpbd9/G9MjyhV61M7QITiOdkNax1CQUqScf4wbYQ9WnrvRnkAGsSy
	E69Fmyf/1jPZIdLNrrMIppIsmi2iEh+1Ltddw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rn52ogmpfrfqECZmx6dX6IsBOFlV5B6jtu7+kBV5p+I=;
	b=LyF4ovdymXjB5+0jXEtHRpx86N4UaT3QsOv+393GLqP4Q20+tWVX8gB8Q2PnOJt6WV
	EaDDzRN9eoxmNjmfjeKf5yUibe4oVni8GbbxugLy7MElHmUCpHz2fhBnmGNcF0p0YTkM
	2GQNqGoCaS7GGuIhrmPSlVQwHMHJM0rWfIshDPtQFFcQvy7kxcxQFl3QmvIiS8mGhU1W
	dcaSs2HKVaZPp4vY8VE8LveB+q/5XuvWXX9bycougSWpzU5SPyxmlNMd+JTBx1TpJy2U
	QZSQOB2l/fzA6B0YOUr8U9LIgB2ScwaDn7QYsUm11UanawUUVHBasuIutgwYPASi00Lh
	4VjQ==
X-Gm-Message-State: AKGB3mKZDrXOWPEqyCQBbM0hSFP1MUCuO9KhII4jLYIQzFcKOos5JDOG
	BdkHM2G7UzIasgw6MK9CtqxmMw==
X-Received: by 10.84.160.236 with SMTP id v41mr27054040plg.40.1515782834516;
	Fri, 12 Jan 2018 10:47:14 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
	by smtp.gmail.com with ESMTPSA id
	m24sm9477811pfj.184.2018.01.12.10.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 10:47:13 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
	<CAFEAcA-e0unT9rx9L0mqCbOwCREDg+-FifKL-mwusNZSRv_Vpg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7965ec06-120d-e872-3fd1-fd824bb4c862@linaro.org>
Date: Fri, 12 Jan 2018 10:47:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-e0unT9rx9L0mqCbOwCREDg+-FifKL-mwusNZSRv_Vpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: Re: [Qemu-devel] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FdBqQwa9GDIy

On 01/12/2018 10:44 AM, Peter Maydell wrote:
>>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>>          nregs += 16;
>>          if (reg < nregs) {
>> -            env->vfp.regs[(reg - 32) * 2] = ldfq_le_p(buf);
>> -            env->vfp.regs[(reg - 32) * 2 + 1] = ldfq_le_p(buf + 8);
>> +            uint64_t *q = aa32_vfp_dreg(env, (reg - 32) * 2);
>> +            q[0] = ldfq_le_p(buf);
>> +            q[1] = ldfq_le_p(buf + 8);
>>              return 16;
>>          }
>>      }
> 
> After reading patch 7 I came back to this one. I wonder if these two
> (which I think are the only ones) justify an aa32_vfp_qreg() ?

That does sound like a nice cleanup.  I'll include that next round.


r~
