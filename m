Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2393091wrt;
        Fri, 23 Nov 2018 10:33:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5cc3MB76ZwQAMfpUjtCAGTC5SKSv/6sdd9uH5Wp9Wrq/00r+z3cu4WIM87Pw9rksKIXkt1Z
X-Received: by 2002:a81:b382:: with SMTP id r124mr17740378ywh.102.1542998004835;
        Fri, 23 Nov 2018 10:33:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542998004; cv=none;
        d=google.com; s=arc-20160816;
        b=NC748VxCkhYkY/TLaeTIToWNBGWW7Ga7TxzTCOk5KiKyb7uI4jg2F5g4PAFo4xpR/Y
         4NQ0IpjNZZFI4r9TDxU2Jvi36A6EzkTaecvXEoBME3kx2V4EZ8N7uAhPm0HWYl2a2yQ8
         tZQF0aJzzFGT35gUs5eiYT+94D7G9sIjmpW7aQlqpnt7kINFmQkmN4JKS3TNZHKi7snj
         tWX+fCCuvuRK63d4TqBVqPQUSAWH1eYSjRe9DUTa+IS7OVvWkwsvqwwMSd1Uk+ovAH3U
         c1Z4bu/HoWjo0rXKVW4lIY7mr6yZI0HpWwSMvqZEufLOVXbx7XUgKU8EU6/AT7028hCt
         r+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=iO75zDqhkjltLE1LIR3cvE1IOkKvXiKPWqxbs8jHOLg=;
        b=tbZLgjD0S32TjOYkr1E5tazVGgRj+rV9E5kp2yqp+X6Rbpte0Of0fRCZhIUP0cGfVv
         nkNKONQOidwkgwSCo93jaYu5XEC5hDkvV41Gu9dZdptfGdLtk7RSqsYztJYcB1qSDcWP
         xubh6L5NiTMq/9byCtnHSeqf7Q1dbU3wAEpsMO5Ad0xbD8zjArH2XOUYCN1tYoEe5Q5F
         ABmE7C39GKFRc9EwSirl4tZFdxh3JEzG4O2xlsLK3HOsRf3DpWChyLzTisRGd3XpNbRN
         PjU47S25csbsp/dLoneBCVCa1ckBG55xHPVCeL2NWMF27F1CrbIj0UtrSj35lWQocqW+
         RqcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si4885673ywf.315.2018.11.23.10.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 10:33:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQGGa-0006A0-7X
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 13:33:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQGDH-0003sR-J9
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:30:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gQG5p-00056b-6B
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:22:21 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35450)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gQG5o-00055r-Vh
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 13:22:17 -0500
Received: by mail-wm1-f66.google.com with SMTP id c126so12742440wmh.0
	for <qemu-arm@nongnu.org>; Fri, 23 Nov 2018 10:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iO75zDqhkjltLE1LIR3cvE1IOkKvXiKPWqxbs8jHOLg=;
	b=Juwg8dGT2r9CrEkE9A3LfMcGcT3HhnB5VQkXy6CHJJlYdB2CkSTC+j6YRUIDqr/Zve
	y2Blhk6oYQTSR/mW03UuynbjBDKwWK8HKuXOD8ua4Rd7VjcSlIvXlAxc8zFoc5IrqoUi
	WnSRPHrlEsURaUQFJM3Eq+0m+W/qKxB4Y3wqKXb/KczLqeI5VVibQR41CXGnKOJRVVRh
	lS8f60U0wqiUyUcYxQ0R7vu7KT6Ce+IWcr7pYOk6VZhq732V+6F4pK6Fn4bm62FjCMAa
	p+cByCq7yTMyeIn0gBkO84iXun+UI1tRhbHChJhqWwaiuA87y33dflqBxFRRrezMsXOL
	e0RA==
X-Gm-Message-State: AA+aEWZKgZxTaBdbkOyhr6KHTjqqOEW3APRcSbh0EkRYr4KahVjudfxZ
	zZIxldizoHBj08RzcilXmLTyjQ==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr6968367wmc.76.1542997335610; 
	Fri, 23 Nov 2018 10:22:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	x79sm17981479wmd.42.2018.11.23.10.22.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Nov 2018 10:22:15 -0800 (PST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
References: <20181123135450.24829-1-edgar.iglesias@gmail.com>
	<20181123135450.24829-2-edgar.iglesias@gmail.com>
	<75bcddbc-da2d-aeb3-71d3-52b635520d2a@redhat.com>
	<20181123165945.GM1148@toto> <20181123170225.GJ7447@toto>
	<20181123170624.GN1148@toto>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bd302393-5220-74be-d20b-7aa741aaa347@redhat.com>
Date: Fri, 23 Nov 2018 19:22:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123170624.GN1148@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH v1 1/1] net: cadence_gem: Remove incorrect
 assert()
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, qemu-devel@nongnu.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org, muhammad_bilal@mentor.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFlpDLAfUw1Q

On 23/11/18 18:06, Edgar E. Iglesias wrote:
> On Fri, Nov 23, 2018 at 06:02:25PM +0100, Edgar E. Iglesias wrote:
>> On Fri, Nov 23, 2018 at 05:59:45PM +0100, Edgar E. Iglesias wrote:
>>> On Fri, Nov 23, 2018 at 05:46:17PM +0100, Philippe Mathieu-Daudé wrote:
>>>> Hi Edgar,
>>>
>>> Hi Philippe,
>>>
>>>>
>>>> On 23/11/18 14:54, Edgar E. Iglesias wrote:
>>>>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>>>>
>>>>> Don't assert on RX descriptor settings when the receiver is
>>>>> disabled. This fixes an issue with incoming packets on an
>>>>> unused GEM.
>>>>>
>>>>> Reported-by: mbilal <muhammad_bilal@mentor.com>
>>>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>>>> ---
>>>>>  hw/net/cadence_gem.c | 1 -
>>>>>  1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>>>>> index d95cc27f58..7f63411430 100644
>>>>> --- a/hw/net/cadence_gem.c
>>>>> +++ b/hw/net/cadence_gem.c
>>>>> @@ -979,7 +979,6 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>>>>  
>>>>>          /* Do nothing if receive is not enabled. */
>>>>>          if (!gem_can_receive(nc)) {
>>>>> -            assert(!first_desc);
>>>>
>>>> Maybe worth:
>>>>
>>>>                trace_gem_receive_packet_drop(size);
>>>
>>> Or perhaps a generic tracepoint on packet drops for any device.
>>> Anyway this is probably something for after the release.
>>>
>>> Not sure if it's too late to even get the removal of the assert into this release? Peter?
>>>
>>>>
>>>>>              return -1;
>>>>
>>>> Shouldn't this be 'return 0'?
>>>>
>>>> The "net/net.h" doc is scarce...
>>>
>>> If we return 0 my understanding is that we later need to actively
>>> call qemu_flush_or_purge_queued_packets() to renable the rx
>>> path which the GEM model doesn't do. So that would mean
>>> refactoring the model a bit.
>>
>> Actually, the GEM model does do that, my bad, so yes return 0 seems to be the right thing to do here.
> 
> I take that back, the GEM model only handles some of the !can_receive cases
> with qemu_flush_queued_packets(). Not all, so return -1 is correct I think.

OK, thanks for checking this.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.
