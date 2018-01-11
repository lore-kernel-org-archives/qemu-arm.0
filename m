Received: by 10.28.173.206 with SMTP id w197csp917809wme;
        Thu, 11 Jan 2018 11:30:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBousvLCBzmhkY/ZXwH7Iieww4bXazhfNPOthk9KclMCmR4IhjgkOKtnCZH4n3b3Ad31zLQJJ
X-Received: by 10.37.10.65 with SMTP id 62mr21454913ybk.300.1515699002035;
        Thu, 11 Jan 2018 11:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515699002; cv=none;
        d=google.com; s=arc-20160816;
        b=okusyIxrIBLZxfC8+w3TWtj0/ho2MF4sUc3UifTvmHdsvJXGYQzqHKDuH0DTO5AA7A
         p/qbB8wXpBxkr3PzKYag9x9cT8AtwQwaEMs2D8lhilV+fuJp7LdTm47wgjNFYD44C/yZ
         9+T8WLZp9PjuApAoEsy2fNFwOTTLcvhqoy9KRsLHUofVP1K8VRjJQfoJcDPmZY/F6AN9
         CxKQxS6+oWGQVjrea+UjOIXMVFabsrlmLWdKaGHdG7sVNBErsQ+5xHnbv3QH58u8jo4Q
         fYp9lbIDBxaaAK/PN9mMy/KlQufDZ3sncgIMeRrNpDMySJQYneMo4U4cz89R/4MJY/JW
         kwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=K6//pXSlFXjEzT/Y6xx6uswLaSCBsxCDFNMSPom8TX8=;
        b=jqd3kR5xMHQmKXe8cjekEDbz+MqySw6DZ6S53lxKUtlxAbw3LX6oO1vY2fG2MPAY5z
         oncesTPkYsmgUsf5tDgEl1EL0XGqOvkR9qxLGArY5chyVaCLB2+h3DcGBxD4bKRRTePz
         X8wOr0SZdZgHz4c2K5EFAU4vuMNbfAEFCy2MnBxV4Aqru3WLwW4d0JuAjy7Jnka2aoSQ
         TCE9XbNuybU/Ty5ekyx6PFjX8B2n/d/hyXyTJyQcafeFrc8+gXT0S2noAcAbkEgEqdV8
         yJRJ5id6MGaDfSuezyJn1/+1WLtFytPW+ohqMSFOdWl345+rhC4WwiCwhXzjcQyobfwq
         gIaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DVIw5SVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si927633ywa.645.2018.01.11.11.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DVIw5SVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiY5-00020R-Hx
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:30:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiXy-0001zu-2I
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiXv-0004SF-8h
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:29:54 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiXv-0004RC-2T
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:29:51 -0500
Received: by mail-pg0-x241.google.com with SMTP id i196so2865959pgd.0
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=K6//pXSlFXjEzT/Y6xx6uswLaSCBsxCDFNMSPom8TX8=;
	b=DVIw5SVYltZEq3kgbusHwgYOV9Y67gvkUV6izVaOYagSsZHYAXPikyKkI1YRrv+IaK
	dBMu6Gty70uwL7U1RDafD9ov+Dcf4wSGnKMPskEarKVjfuPP2uw0l0fXi3d/7LMoLPA5
	IAQsyJQrmS9/PRBdKtgnvOJmKJ9rD+RJkr/74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=K6//pXSlFXjEzT/Y6xx6uswLaSCBsxCDFNMSPom8TX8=;
	b=d3cFicGEteYH4NHS3PilewvaylXSkJ7Ek2rIwibn0TVq/UCIGL8HszEaNiifr3SbgW
	hQVHBL07XctL5/va9lMMOVzL2xq3N2/WJ9iDIPZaGmtwbLo0+0qXZKkSTYmSuETfQPj3
	8InTgwVXmeXbFyqTATNBIwCDSQmnnYXpu8+9woBr/0NPlDs11/tjHTeRL0VtJnukkQHo
	4Kw2YASuq5LttW/xwFLkyta9V0ldFKmYdEoAPTi929w+QNGMIdEYvpcnQI44+Y4z4KYB
	ERuByG7lrxVdz4qKUgJHAHvU6urQn14v4k1dpHoqV0/39vurzLdArfFA/pN+hP4jJ4v/
	IUjQ==
X-Gm-Message-State: AKGB3mKhcaQjAMdIZDNkbrNilJ/7zQxbrZhOdOeC0wxp+TfHetLATZqu
	Ge/4ZiXTaOsBfdev7vWtE1vPm6Izi1I=
X-Received: by 10.99.110.131 with SMTP id j125mr18551523pgc.39.1515698989829; 
	Thu, 11 Jan 2018 11:29:49 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	t80sm16300335pgb.88.2018.01.11.11.29.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:29:48 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
	<CAFEAcA8+fQ7QiygiM0C5kgesNSpiFnJDCjnAyjAtm=zt2cRnAw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2373642e-8d28-d94c-dfb5-55f0bf33e32b@linaro.org>
Date: Thu, 11 Jan 2018 11:29:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+fQ7QiygiM0C5kgesNSpiFnJDCjnAyjAtm=zt2cRnAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zsVyjCB9StjJ

On 01/11/2018 10:39 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Helpers that return a pointer into env->vfp.regs so that we isolate
>> the logic of how to index the regs array for different cpu modes.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/cpu.h           | 20 +++++++++++++++++++-
>>  linux-user/signal.c        | 22 ++++++++++++----------
>>  target/arm/arch_dump.c     |  8 +++++---
>>  target/arm/helper-a64.c    | 13 +++++++------
>>  target/arm/helper.c        | 32 ++++++++++++++++++++------------
>>  target/arm/kvm32.c         |  4 ++--
>>  target/arm/kvm64.c         | 31 ++++++++++---------------------
>>  target/arm/machine.c       |  2 +-
>>  target/arm/translate-a64.c | 25 ++++++++-----------------
>>  target/arm/translate.c     | 16 +++++++++-------
>>  10 files changed, 93 insertions(+), 80 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 7a705a09a1..e1a8e2880d 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -493,7 +493,7 @@ typedef struct CPUARMState {
>>           * the two execution states, and means we do not need to explicitly
>>           * map these registers when changing states.
>>           */
>> -        float64 regs[64] QEMU_ALIGNED(16);
>> +        uint64_t regs[64] QEMU_ALIGNED(16);
> 
> Why are we changing the type of this field ?

Because that's how it's actually used.  We were using casts before.


r~

