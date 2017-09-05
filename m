Received: by 10.223.172.38 with SMTP id v35csp1358885wrc;
        Tue, 5 Sep 2017 05:30:18 -0700 (PDT)
X-Received: by 10.237.34.25 with SMTP id n25mr5192803qtc.144.1504614618536;
        Tue, 05 Sep 2017 05:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504614618; cv=none;
        d=google.com; s=arc-20160816;
        b=nyui4rizc8wGA2C9zXTv0LIr4S1def3syrEjurZqzu9OSG0ajgQMO9IpKWxZ82mo7J
         F3/LWCOl6w3oBoO0C1aSPxqhRjdIbNYT7klcqyAsy9LrYgUvy+vojzHdNT+CtsdUFSv0
         6qlcu7W+ZJUlR3Gm/svc5dyMHLlJEYE1H9o8OcgbOiF7jPDAHxwbHUl3+qO1w6PVIpd3
         yF9EqdaMHBnMMOYcPTwoxyZt1ktAFjPBtMrO0az77Vy5WeZ6IUgl+pCJDPZmrcQvCNzI
         CZAILCxaD46kzEO0RemEbb15curRW/11Vpe3TOA9xo+gS2yx/MRd/YQd9k7ow629a6QZ
         HyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ITLMphbgY3E8XnywKx6CqfZGjwpq2MmCV5p9mHXrZoo=;
        b=EYngRYduo0CAbPVV86IQP/zXjuoSL99X6g1qMXgkGHQ8HIVFAEFGxJfMgrwZVJuOcn
         O4dcBFWGdspoeByZUIa8ySg/a0WjOE/ERVtGuHCAonimIJx7xvuXLXX0Ox2ifDnj4XoT
         8A/zHeEvnF0tNjZHUjfywZk+Q/tsQyg8oQgvZZSf25YJtdzQXffmfIPcDuLZU/clL+1d
         VHw5I6S9GWTw5WqnitZVwWHnnyCY3tJfQLm5HhJw2X14QXfLMcAut1vc9PgQupCvop+h
         sdSTWexH6QqmaP30xJZtnBeMdvINgYVR4zdbLDqUBpVJD0yUCBpOYB8BHtJckRGmcyUE
         Wb5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ueNlCKKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o23si99000qtc.347.2017.09.05.05.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 05:30:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ueNlCKKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpCzg-0007Fz-8k
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 08:30:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpCz7-0006eP-Ud
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpCz2-0005qW-Ih
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:29:41 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:38518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpCys-0005k3-Kn; Tue, 05 Sep 2017 08:29:26 -0400
Received: by mail-qk0-x242.google.com with SMTP id c69so2000589qke.5;
	Tue, 05 Sep 2017 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ITLMphbgY3E8XnywKx6CqfZGjwpq2MmCV5p9mHXrZoo=;
	b=ueNlCKKf6Q5VLHJLF+jbO8dLzm3kgWDq3q/gp/jXe/BUEtMcxCzXCMjs2XrOM/tL02
	5gR1gNISwtqvqpZBFsuVpJjQBT+YIuYKYtQWa+mGZl+FiSKCLUsPBPZBO3//x26B4xNu
	lClYL0r/dvOATOTHT68yGkSrPHfnv+xMKsNI9fkjrwm5adksgSTSHKIDtijNr/pCdukA
	isR+Jv3nqd1tWSMWo05zIlM6+zaRdcAWCI73ro7r/JJXuSjiWcAFaapUEkGdcttV+U6K
	D71kNvC9jYAKM3HkdaoIeOih223cCxN1w3CaHmzeTD0L1jmHTBFnYjSn04BfB8BLHlN3
	P0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ITLMphbgY3E8XnywKx6CqfZGjwpq2MmCV5p9mHXrZoo=;
	b=h+5Hhwmt8AkKon3VGC6xCyK3sPoqu7G8aI/Vuap3I4tUp0rPT5WSvK6oVaui03f347
	tCOi+0kTD3G0JxFww5JY06/uRTLOouH7xI6/NZYBfpzVyYJ12imOBAVLJny9Wd1t7Yco
	bJP/VDwNQXKMtQXBiK450rw3MUqUkgb2QHcix38eHvUdgLrPwec/PSozVxl0lZ/rCgZn
	z7sSKDa0JW6PC9ZLNw8nqRALl1ezokgfa4XSRDtwQdSzIgjGfBkk7npqB48u1cv0mYiS
	J9X/+9jXq0+0k3vsK8tVhWkDnyoONPGGMe8Okd+g+M8QMXGkEQ+fVWYqVqGLfDFYtXeE
	1fPg==
X-Gm-Message-State: AHPjjUjS3BUUjv8K4Hipn47qacgDCY1ljBOBkJhpggyzkgQT+SB4hmde
	vvzrBXuJ/pStWg==
X-Google-Smtp-Source: ADKCNb69olcKsAxszNXNy9wFbMJZHNwMYX3Q0oFZCtBImefoBY7v/AlXeX3s350Hix4SPvVkBiS5Sg==
X-Received: by 10.55.39.193 with SMTP id n184mr4537108qkn.273.1504614565967;
	Tue, 05 Sep 2017 05:29:25 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id q5sm306359qkh.43.2017.09.05.05.29.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 05:29:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <ppandit@redhat.com>
References: <20170905112152.8851-1-ppandit@redhat.com>
	<CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38d7ca82-43ca-a98a-e727-8fb5968c7d1b@amsat.org>
Date: Tue, 5 Sep 2017 09:29:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH] intc: arm_gicv3: limit GICR ipriority index
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
	Guoxiang Niu <niuguoxiang@huawei.com>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uko3Ft/Vyk8N

On 09/05/2017 08:58 AM, Peter Maydell wrote:
> On 5 September 2017 at 12:21, P J P <ppandit@redhat.com> wrote:
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> When reading or writing to GICR ipriority array, index 'irq'
>> could go beyond its bounds; Restrict it within array limits.
>>
>> Reported-by: Guoxiang Niu <niuguoxiang@huawei.com>
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> ---
>>   hw/intc/arm_gicv3_redist.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
>> index 77e5cfa327..7683c4cc7f 100644
>> --- a/hw/intc/arm_gicv3_redist.c
>> +++ b/hw/intc/arm_gicv3_redist.c
>> @@ -187,7 +187,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>>       case GICR_ICACTIVER0:
>>           *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
>>           return MEMTX_OK;
>> -    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:

0x1f are only the cpu (private) irqs, then the range is valid up-to:
(extract64(cs->gicr_typer, 0, 5) + 1) * 32 - 1 supported irqs

>> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
>>       {
>>           int i, irq = offset - GICR_IPRIORITYR;
>>           uint32_t value = 0;
>> @@ -310,7 +310,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
>>       case GICR_ICACTIVER0:
>>           gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
>>           return MEMTX_OK;
>> -    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
>> +    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1c:
>>       {
>>           int i, irq = offset - GICR_IPRIORITYR;
> 
> Why do you think the buffer can be overrun? These functions
> are the word (4 byte) access functions, and they cannot
> be called with a non-4-aligned offset (see the asserts in
> gicv3_redist_read() and gicv3_redist_write()).
> 
> thanks
> -- PMM
> 
