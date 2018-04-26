Received: by 10.28.4.212 with SMTP id 203csp1939077wme;
        Thu, 26 Apr 2018 03:25:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp+ieR8pVqAwI+FUcLxoj1QgNTmjq7k6DqPbzG13HHmIg3N/wdJ1zMJwWuyria3ga2+5CHx
X-Received: by 2002:ac8:4692:: with SMTP id g18-v6mr13106553qto.41.1524738313490;
        Thu, 26 Apr 2018 03:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524738313; cv=none;
        d=google.com; s=arc-20160816;
        b=NO6+6ncS5TybGGlS9iIjmT0t5Lat4uJjfsoj0s5V7Q1WHL5FNBgOYJFtNw0O2OsmH2
         Plf4wAoad8NaoymT3LqzjbKs9qrN5RHL7XUWXI559yr+GF7kMheVKPsomA3VDf8hWtnA
         RrPgEej1heXGNKEtyCyE25l4Ks5jLGrdWs4NbLbNgw1ZyUoipcTOsOS8cJLzl2IrdNjN
         QzKE/d1jTItpJNTGqjXsK09GCrojBN1V0xgayC4khfCN6HGrcDnlsmqgPU/K6MkX4LfE
         YrsPkd1l7m3CR/hVWG2KVHdRNKNuR4HPlqu+Kk+PfvhyzWF2faQCwKUc20oyqtqB8q2M
         F8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=zirTn+iGbnNZUrVAGNKVY4k0x7usDgmmqhcSvwXe4xQ=;
        b=vhVkyGv4OZGdETD6f2sUSSu6G8xNAT4UqzOJcedEz5wv/+57eQUOvEWL32j1X6O/op
         KNjQeQpPuaNRF4E8ceu0D7+zv+4rzvJyekSbGQej9QUfPuxL/fCxciTzgT6Vlin3KWM5
         080RUxGiMw3bC4x1er2vgkdcgD0XtUA8T4aAfBVuJuQc3zingXsOy4xP0iCbwtwDFZ1w
         HchWj/BAyeKl5FRCKBxvvCvhbQG6Ca7ClxNi8wE6LxzwirdfA5QY35O9+XiH2SBfDcXW
         BTBqR4m5X+FzdTwCBg5IQO07ben7YRwbtVPCmcRRW2K73lMPwEILWp/e+Y5O/ODDHOh+
         DiOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124si2688839qkd.353.2018.04.26.03.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 03:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBe5R-0002BL-2O
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 06:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBe5J-0002B4-Vk
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 06:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBe5F-0008FD-3Q
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 06:25:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38768 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBe5E-0008Ew-Us; Thu, 26 Apr 2018 06:25:01 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2760642BDF0E;
	Thu, 26 Apr 2018 10:24:56 +0000 (UTC)
Received: from [10.36.116.75] (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 519BE2166BAD;
	Thu, 26 Apr 2018 10:24:50 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
Date: Thu, 26 Apr 2018 12:24:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87in8qf2w3.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 26 Apr 2018 10:24:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 26 Apr 2018 10:24:56 +0000 (UTC) for IP:'10.11.54.6'
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRT5P6jA6Xin

On 17.04.2018 14:12, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> Many device introspection crashes only happen if you are using a
>> certain machine, e.g.:
>>
>> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>>  "package": "build-all"}, "capabilities": []}}
>> { 'execute': 'qmp_capabilities' }
>> {"return": {}}
>> { 'execute': 'device-list-properties',
>>   'arguments': {'typename': 'macio-newworld'}}
>> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
>> Device 'serial0' is in use
>> Aborted (core dumped)
>>
>> To be able to catch these problems, let's extend the device-introspect
>> test to check the devices on all machine types. Since this is a rather
>> slow operation, the test is only run in "SPEED=slow" mode.
> 
> If the device works with one machine type, it has a decent chance to
> work with others, too.  Thus, testing each device with every machine
> type is overkill.  I appreciate having overkill as an option :)
> 
> What I'd like to see for a quick "make check" is testing each device
> once.  That should flush out most bugs.  

That's already done with the "none" machine.

Anyway, do you think my patch here is useful and has a chance of getting
included? I.e. shall I re-spin this as a non-RFC patch? Or shall we
rather wait for Eduardo's python-based tests to get included into the
repository?

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  In case someone wants to help with creating some bug fix patches
>>  during the QEMU hard freeze phase: This test can now be used to
>>  trigger lots of introspection bugs that we were not aware of yet.
>>  I think most of the bugs are due to wrong handling of instance_init
>>  vs. realize functions.
> 
> Yes, that's a common class of bugs.  There's little guidance on what
> kind of work belongs where, and plenty of bad examples.

I think we urgently need a file in doc/devel/ that describes the various
states / functions of a device, where we should properly describe the
differences between instance_init and realize. ... I'll try to come up
with something when I've got some spare time (unless somebody else
volunteers to do that first).

 Thomas

