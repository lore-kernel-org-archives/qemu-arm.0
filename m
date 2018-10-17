Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1278828wrt;
        Wed, 17 Oct 2018 14:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63fLl2xN0M/w9f8G/jGsi9Vf/OErsY5OowE6w5905TWd6HDIrwfuCitvm9CH/lgsMvYhNHF
X-Received: by 2002:aed:3539:: with SMTP id a54-v6mr26459401qte.153.1539810772013;
        Wed, 17 Oct 2018 14:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539810772; cv=none;
        d=google.com; s=arc-20160816;
        b=lJVTttrYM2KoB28MNakoJ23JILRICT4lOp1+32Q630PVl6AKsGlDM9dS3RBgASRDb6
         EZGVxpIlLH/AYtVw4j+YkEHnKCEXSTfLBu75D/Bwhf1gc4YaYfP3pXYpal1wmQkG+cTB
         sCCOlrWKtgox/dPwVgPmkzkoMhDezipoqxCETgRPII3FcdTVOFFxGWk26/S/OVGDrsbj
         iTPrEvF0+xjKGTRr/EBi526Q0eOyWSEwW2tQqftBly0q6b8jqH2UCnCKs0Jm1LqpmPPD
         4Ag8b/WsJNPKGyEN9fnCiy3s63l0ktQxYuoubWOf1BRMyQ//cVAgN0Y+yqhO3y66gcfx
         RUiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=TWOu4k86NxD9RRFwgio6CKW8z0Qpf+KT1BOpwmOdevQ=;
        b=KYq9oed1xbaX29tdCXXPyf2GfanXzoSSzdJSYzcbNJu0cQ8FYY0ZNkhQdRID0VXHV1
         TMaNuRL1n0MQGDIEwkPLB9XVlqjqU6BJwjNcLqkz2xRgI+IO1ZxncGWCG8PLXEMlLt4G
         KoV1ArXig1jQlrnhspSV4hk36pKA3b5u8kssBuLwx0o1RqyxWCwHCTMYauM8EAGo70LJ
         GOWfMNMH7lfDrseLX6gXxdw3btSAPEm6CifsxwfSS+ccoo2VbkrIKIFsoaCUuyUcy2yE
         Yehllvo4NL6vlrnEr9Wl+CStPNwMh05gsjjrvzAeZZqCwRf4y8AIEYfh6d+S8CPl6CEl
         4Jdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="GQ9kid/f";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k37-v6si4432299qta.193.2018.10.17.14.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 14:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="GQ9kid/f";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCt7b-0006hU-FW
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 17:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCt7M-0006gi-Pg
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCt7H-0002k1-OT
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:12:35 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCt7F-0002gW-OR
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 17:12:30 -0400
Received: by mail-pl1-x644.google.com with SMTP id y15-v6so13269304plr.12
	for <qemu-devel@nongnu.org>; Wed, 17 Oct 2018 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=TWOu4k86NxD9RRFwgio6CKW8z0Qpf+KT1BOpwmOdevQ=;
	b=GQ9kid/ff29yH9fyldybW2LnPJ7HKKkJuhiRPU6XERcgWPgTyHXh6qKWjq8XzbN8SA
	bFvsEm8eD9Q8+E+vTEJnMA4/371eXDPU2oOdeSRsKAfy0YycsOkFSYsdqbem0CWbiO/c
	cXGHoWO1RtKLwewSd243Hv3NplMSWZwNRQ7bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TWOu4k86NxD9RRFwgio6CKW8z0Qpf+KT1BOpwmOdevQ=;
	b=n4nB6VdsBFfdTGuMunowEwfJMZvDTgqM3FIWnBSzkMI4YsliWohYXmPQswvaYOu7mq
	cR0i5cRfYYwUOPwPAbx1h69rKpfXa4QX8TzSKpt3Ayvj8NcF2by6bMNJDudxXX2eLuVk
	Lcgr+y4n1VTZKteKEC9FnbG+S02f/eVpsApJLXW587SWbV2Ow/GqHlJwnw+o4gddRkgY
	ues5Yp+5tZz1p93DdkX2WqJQNmebE9INlXk0OTnJJG5xKuGCdjiDzNdzLaWuNmPjcTp/
	y5hfpQJBWAoBM1daFZbr32El60UpQd8FZ/ReBEwLkHFBI5nqRZLiUQ34oYVfM/TMY6E/
	0atw==
X-Gm-Message-State: ABuFfoi9yoTG3d7IkjDVODU8pTaG32NoG21We+ox7no3rU7eiKyKSpy4
	RzFJ4BQpxhurYDw393L8992n3g==
X-Received: by 2002:a17:902:5e3:: with SMTP id
	f90-v6mr28075792plf.286.1539810745068; 
	Wed, 17 Oct 2018 14:12:25 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	z70-v6sm23632453pgd.64.2018.10.17.14.12.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 14:12:24 -0700 (PDT)
To: Aaron Lindsay <Aaron@os.amperecomputing.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-12-aclindsa@gmail.com>
	<be878ed3-509f-8ed8-8c28-71e3d0214837@linaro.org>
	<20181017194748.GB25905@quinoa.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <32172d01-329a-764e-449c-efb83e353353@linaro.org>
Date: Wed, 17 Oct 2018 14:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181017194748.GB25905@quinoa.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v6 11/14] target/arm: PMU: Add instruction
 and cycle events
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LuGtUI5fA+8G

On 10/17/18 12:47 PM, Aaron Lindsay wrote:
> On Oct 16 17:04, Richard Henderson wrote:
>> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
>>> + * Return the underlying cycle count for the PMU cycle counters. If we're in
>>> + * usermode, simply return 0.
>>> + */
>>> +static uint64_t cycles_get_count(CPUARMState *env)
>>> +{
>>> +#ifndef CONFIG_USER_ONLY
>>> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
>>> +                   ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>>> +#else
>>> +    return 0;
>>> +#endif
>>> +}
>>
>> Usually we pass through the host cycle counter.
>> See cpu_get_host_ticks().
> 
> Why do you prefer cpu_get_host_ticks()? And are you suggesting this for
> just user-mode, or both system and user?

Just user-mode.  Providing a clock with unknown scaling is more useful than a
constant 0.


r~
