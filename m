Received: by 10.25.208.211 with SMTP id h202csp91630lfg;
        Wed, 23 Mar 2016 08:03:43 -0700 (PDT)
X-Received: by 10.55.79.17 with SMTP id d17mr4123825qkb.56.1458745423088;
        Wed, 23 Mar 2016 08:03:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k68si2262839qkh.25.2016.03.23.08.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 08:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aikJy-0005d0-M2
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 11:03:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aikJv-0005cg-Tl
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 11:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aikJq-0003HI-UQ
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 11:03:39 -0400
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b]:35009)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aikJq-0003H0-Kx; Wed, 23 Mar 2016 11:03:34 -0400
Received: by mail-lb0-x22b.google.com with SMTP id bc4so12366324lbc.2;
	Wed, 23 Mar 2016 08:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=oawuLmVY6iMEv7KDXtgMFhH77sxY0N8LvaXmISlUa9s=;
	b=Ub3Dhwjb9NMDtbP24B6tkodDbQ6Ju9HrzUK0OkqH17GBHqDASvWKEDmOsZZxWycGGC
	lhrZsmNQX3yPCzSiMQ7LYPJHqQgjugsgd0uq0mYDHYG8v4HawA1bDZNPHlsWoupuvwix
	vnz/6B8TkwZboVl4TmGRt6qdjDqDueo3mpiq/wtYO2za/eGhLbOnKuRp0z6ijU8Gdi2R
	kEYoEHU6SrsWQ2+i2ci5VVVSEGGaTsEXS1lSODsTd/6YmmXrFpTDlNK8lY06fugev4ZC
	yYVhCVHYxRK5V7fEeYcoUkshwT9L+tL/ISJW5ZG5vVwcZyHtMa25KwiulrGc3MntEOde
	SYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=oawuLmVY6iMEv7KDXtgMFhH77sxY0N8LvaXmISlUa9s=;
	b=XGN80zw3Z1LfBdCeDgKDVseRxUkM7OS1tsiFrgnqN9UgGCFWq9GNEKprv6EdME6nfn
	HxZuCbQic1Xp8rA+STD3X8CfFnV8qdfA4qvWuk48fjT+edJ8M6uQjC4wE0lY1qOxtdDW
	YrcrAWpJg5k1tNxhyftgvgU73ZQiiRhfcUSCalvKS1zE50xAHvTfBfwTq8vxX2E2lVge
	DpZFWdJNffVb70f1fl1Wtsjyc8rErBG4uOi7yMPs7OrCYdTxEmNjeFabS4dNS01+wXSt
	FMVBqS6f4ahhcnuzata1tzYfSCT7voxeVJXda2uzhf4NW5DcpDYcnjmnZpeeLqHTcQ6s
	4jBA==
X-Gm-Message-State: AD7BkJLKlQRMWLLrNYMi5qtWAH+sSyg26s1+Wlmtb24eAgWw4BqRBzYsPtCQZiksR+yAvA==
X-Received: by 10.112.146.201 with SMTP id te9mr1452342lbb.9.1458745413656;
	Wed, 23 Mar 2016 08:03:33 -0700 (PDT)
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net.
	[46.188.121.115])
	by smtp.gmail.com with ESMTPSA id n66sm478820lfb.33.2016.03.23.08.03.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 08:03:32 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458711153-15988-4-git-send-email-peterx@redhat.com>
	<56F28BEC.2070008@gmail.com> <20160323145652.GW28183@pxdev.xzpeter.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56F2B044.4030202@gmail.com>
Date: Wed, 23 Mar 2016 18:03:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160323145652.GW28183@pxdev.xzpeter.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22b
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/4] kvm: add
 kvm_support_device() helper function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7lzfzZnrBg5D

On 23/03/16 17:56, Peter Xu wrote:
> On Wed, Mar 23, 2016 at 03:28:28PM +0300, Sergey Fedorov wrote:
>> On 23/03/16 08:32, Peter Xu wrote:
>>> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
>>> index 6695fa7..8738fa1 100644
>>> --- a/include/sysemu/kvm.h
>>> +++ b/include/sysemu/kvm.h
>>> @@ -306,6 +306,15 @@ void kvm_device_access(int fd, int group, uint64_t attr,
>>>   */
>>>  int kvm_create_device(KVMState *s, uint64_t type, bool test);
>>>  
>>> +/**
>>> + * kvm_support_device - probe whether KVM support specific device
>>> + *
>>> + * @vmfd: The fd handler for VM
>>> + * @type: type of device
>>> + *
>>> + * @return: true if supported, otherwise false.
>>> + */
>>> +bool kvm_support_device(int vmfd, uint64_t type);
>> Why don't name the function like 'kvm_device_supported' to better express its predicative nature?
> Because I am trying to follow existing naming style, like:
> "kvm_create_device" (please see above).

Yes, but kvm_create_device() returns a file descriptor whereas this
function is predicative. Personally, I like the convention described in
chapter 16 of Linux kernel coding style [1]:

	If the name of a function is an action or an imperative command,
	the function should return an error-code integer.  If the name
	is a predicate, the function should return a "succeeded" boolean.


[1] https://www.kernel.org/doc/Documentation/CodingStyle

Kind regards,
Sergey
