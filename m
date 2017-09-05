Received: by 10.223.172.38 with SMTP id v35csp1968275wrc;
        Tue, 5 Sep 2017 15:55:38 -0700 (PDT)
X-Received: by 10.200.43.86 with SMTP id 22mr941075qtv.269.1504652138558;
        Tue, 05 Sep 2017 15:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652138; cv=none;
        d=google.com; s=arc-20160816;
        b=vZXPA0TUeWsUmWsJPL3pD9Q7skuleqc4OaWyaBFsSu3S8+0yxM3qU3K+Ki8XHmnRtt
         EyqZBGbSZ2KQp6lOPuj0ovxhpDrG7Q3hwBEO2XUcYBSrYeHt20V/Mfeozg9U/O6luwJB
         2M4zlSGidvBpthkf5kFpqL1Uu0guhIJELJh0eVKj9XvEhyjCh2xLfujh14VXC8h7u18O
         nfXexHmODsLPO827Zi2RfUCni0l4vAn5tnyPmTBt2QqW4mpH5hvRWY75X4v1sI2X5vMs
         rDMlskAtYvByDtrOq6RgXsBcD7DKL7AXj1npXbFnr8htTKGMdyt1d1H+Y6Zz1xxstvXr
         byrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=22JuMvkDEDGSj1rdZOiPuNQZ3tWNOR/bqFt1iw/7tRg=;
        b=LR5k7ZoRN+YVQ/Up6ZF+6qUecLBlOFfvorA5qwCgookEGMn2QWWPVnjjb0EEXSTGai
         /mIQv9CqZoZ++SLxx4HvGstu+/lI5vrjqJf0/U8JhJ2OQfqrE0SY07QS6BNIuT4xfaUN
         XbnkG/yKrVvLDi0JV7EFsAMTbyilpyE5z2K85Pf9NHzpd8gXVI9YWH9MWAcD6EH7657L
         E/2I4niDYa09Lc2uHgESHInBTCL0LqGv4dhk4Z0rIscGnH9qC4H9DQpAgdKf2rfjBCR1
         JwdfqON0X+yjGuxN8Nlg68l9dEEXbwHdeKB4eJrFrvMKAS82WiUn9CjQK0dVZG/uEQE2
         KBRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRcK12X7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t127si1601566qkd.27.2017.09.05.15.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hRcK12X7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMkq-0002qw-Bz
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:55:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMjQ-0002Du-OR
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 18:54:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMjM-0005hl-Ab
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 18:54:08 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37496)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMjM-0005hX-6a; Tue, 05 Sep 2017 18:54:04 -0400
Received: by mail-qk0-x242.google.com with SMTP id n64so2961393qki.4;
	Tue, 05 Sep 2017 15:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=22JuMvkDEDGSj1rdZOiPuNQZ3tWNOR/bqFt1iw/7tRg=;
	b=hRcK12X7QN69SUplXugIbiilK1Pz3WqzqQ7V9E1d3517Pf2HfienFbr2Qh91ca2CqX
	0mKMMvyJrmtgdjmK5z6LsHnreTb3hFiTfqHOiIuQKs1qceJRwy75Lx78nmzY65ZebnJ7
	mgjDbLsMe/V9QudVjVMnH8/u1OLEIKPd255JLG6YT9RwpFsv1LWwQDPUHEPjWV5cdf51
	cegKaIA+vxK07CkSWzoei972/SRy8/mGEh3gSENqiTYI/8BfBynX1i3xClnhO8Ul0l6Y
	cKMsYt+X0fEwyhmdr2dU5Z7El9i1GvjO6qkd32otlGNnTgtU5GUJlBLsELi8kq6h3273
	iNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=22JuMvkDEDGSj1rdZOiPuNQZ3tWNOR/bqFt1iw/7tRg=;
	b=MVJTBn0e55IVhQe5IARKpWgSTvb2gR1uhT+Wkx1cD2o8U96DTeiHmMSoXAII2BD63X
	+evnoRXdKs0IrJYU4jbXHf913QYoMxTnM7GwzjBji0DI1+s7/mi/fQAXB0Ro9env+6ZB
	G8SrYZt+IRbV+kqTz+uAZCiqIZyzJS4+8HaK5gnfYojvZlcObK6bzZ79TtGEf8wN9AUo
	gB7DrGTuh15Eu0glXFdr/5p0e6ZTiz1NHhz8AWGJLfMZ/MbxyANb1JNiaw4E1vH3B1UW
	GTT3eGxPLR8yYADDsJGTVvp4brhsSl0yv1V+Hx5++o8Xkeu2ftMbmyy/x8aOGMo4J9lx
	+RHg==
X-Gm-Message-State: AHPjjUggsXSmsyjwhRoN9hjYHSYGijcwc+XKCGfggMKXPqHq0Va1XmAh
	luhjeqKCIqzaSA==
X-Google-Smtp-Source: ADKCNb7jdPLOWyc9bbAhrxOFMv3MTvagFDJaqYAtBWsSxH2eYDlx8stGn7w7UFN/ITtwVi27nSjH9A==
X-Received: by 10.55.108.193 with SMTP id h184mr975364qkc.48.1504652043666;
	Tue, 05 Sep 2017 15:54:03 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id w59sm1128732qte.0.2017.09.05.15.54.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:54:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-8-git-send-email-peter.maydell@linaro.org>
	<918b7d17-8a0a-1ff5-d31a-5ee09479ee2f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a007e3eb-3de0-5604-2ab1-afca97c56346@amsat.org>
Date: Tue, 5 Sep 2017 19:53:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <918b7d17-8a0a-1ff5-d31a-5ee09479ee2f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 07/20] target/arm: Make PRIMASK
 register banked for v8M
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3tsV6AFz8wxv

> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> Make the PRIMASK register banked if v8M security extensions are enabled.
>>
>> Note that we do not yet implement the functionality of the new
>> AIRCR.PRIS bit (which allows the effect of the NS copy of PRIMASK to
>> be restricted).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/cpu.h      | 2 +-
>>   hw/intc/armv7m_nvic.c | 2 +-
>>   target/arm/helper.c   | 4 ++--
>>   target/arm/machine.c  | 9 +++++++--
>>   4 files changed, 11 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
