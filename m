Received: by 10.28.4.212 with SMTP id 203csp295637wme;
        Thu, 26 Apr 2018 20:45:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZopRmbf/kxJDdGIBChzv8arjiXBXnUIf2A9KAOQQSCrFIVIXQsgIDID1cQzKUN/20bUxlrK
X-Received: by 2002:a0c:ab45:: with SMTP id i5-v6mr576065qvb.188.1524800723998;
        Thu, 26 Apr 2018 20:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524800723; cv=none;
        d=google.com; s=arc-20160816;
        b=kJpWjc7uaquyu+js/vy8hukn5MQTyQ6ZsQDvX+3CJFUmMTCh+0JKo3lb9GOF2JUll+
         GiXVZWe3GMsZvlhCPLzmXzjJ1bE4QRh9/1/Cw3Co0SpDQmQOwA8SGjPs5bgQfZ1GgQw8
         0eTFUkhCdYgyupHub3OBmBb7mBQfYJiIZLrUU7LZ6UBBaZLtUsL7EtVcP2QVjiVJu7Cl
         6jadIO7TbsayHRMi85l5Mbbhk+G+q+LOiFejnqfaxPfEo9dj0zje8Sb6OdVi7KzvWzYw
         a1qq5OMAJgszJo1yXD8EwBjpQpcgu9nc3dZ7j3w+zR1SwcZ1L2rlX9enxab/G4U3CR7t
         5cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=NvMH/2m3w6aHfxQhrPUzOUTUwI8DQLw2Eayz0bcSge4=;
        b=O6exd6FLgRjOtxEeniXI2g7oQ7lQUFHwlirxIlGNAXuC0edHLNGz69GASspU7ZicUs
         Mq3GwRUFWf/4YwB6Ki+z8IAgW944eX/EFHkMiAGDTfDm0YqTGs+TBEWItGLCy3mPmuIj
         ve4M7AAQmaVwb87zrnVXLZ/YWQw2kLDKGu+5U1hw0a6Cy+EFtX5KBjnHX+ymW5aIYfPW
         YUBzqOuxKKHuLfOwI5NAtQl1JiM0/xOY4gQzKULa2BtCb6BGHbcDZKUcaDYl8gsDu/iB
         09UJXeyIzi9cD3+G2mCBeySunB8sl//mXnrdSLi215p5SAPeWADx+VOTRtL4ko8beT28
         FTyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si430124qtg.153.2018.04.26.20.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 20:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBuK3-0005BN-HI
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 23:45:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBuJu-0005BD-Rv
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 23:45:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBuJr-0004xN-Ck
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 23:45:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50570 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBuJr-0004wL-5k; Thu, 26 Apr 2018 23:45:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41A8DF10DF;
	Fri, 27 Apr 2018 03:45:07 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2EC7215CDC8;
	Fri, 27 Apr 2018 03:45:02 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
	<877eou2nek.fsf@dusky.pond.sub.org>
	<20180427003414.GV29865@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9fb0acdb-b1a5-c3e1-dd3d-db42af71f62f@redhat.com>
Date: Fri, 27 Apr 2018 05:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427003414.GV29865@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 27 Apr 2018 03:45:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 27 Apr 2018 03:45:07 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH] tests/device-introspect:
 Test devices with all machines, not only with "none"
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6va2HEwRn0df

On 27.04.2018 02:34, Eduardo Habkost wrote:
> On Thu, Apr 26, 2018 at 01:54:43PM +0200, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 17.04.2018 14:12, Markus Armbruster wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>
>>>>> Many device introspection crashes only happen if you are using a
>>>>> certain machine, e.g.:
>>>>>
>>>>> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
>>>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>>>>>  "package": "build-all"}, "capabilities": []}}
>>>>> { 'execute': 'qmp_capabilities' }
>>>>> {"return": {}}
>>>>> { 'execute': 'device-list-properties',
>>>>>   'arguments': {'typename': 'macio-newworld'}}
>>>>> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
>>>>> Device 'serial0' is in use
>>>>> Aborted (core dumped)
>>>>>
>>>>> To be able to catch these problems, let's extend the device-introspect
>>>>> test to check the devices on all machine types. Since this is a rather
>>>>> slow operation, the test is only run in "SPEED=slow" mode.
>>>>
>>>> If the device works with one machine type, it has a decent chance to
>>>> work with others, too.  Thus, testing each device with every machine
>>>> type is overkill.  I appreciate having overkill as an option :)
>>>>
>>>> What I'd like to see for a quick "make check" is testing each device
>>>> once.  That should flush out most bugs.  
>>>
>>> That's already done with the "none" machine.
>>
>> I was too terse.  We test each device with -machine none for every
>> target.  Fine if that's quick enough.  If not, we might want to reduce
>> redundancy there.
>>
>> Actually, a worse offender in the "waste everybody's time via redunancy"
>> department could be qom-test.
>>
>>> Anyway, do you think my patch here is useful and has a chance of getting
>>> included? I.e. shall I re-spin this as a non-RFC patch? Or shall we
>>> rather wait for Eduardo's python-based tests to get included into the
>>> repository?
>>
>> I don't mind having make check SPEED=slow run more extensive tests.
>> Assuming we actually run them at least once in a while, which seems
>> doubtful.
> 
> The infrastructure for Python-based tests might take a while to
> be included, as I'm busy with other stuff right now.  I wouldn't
> mind including this patch, as long as you don't mind seeing it
> deleted after we reimplement it in Python.

Fine for me.

 Thomas


