Received: by 10.28.4.212 with SMTP id 203csp2052292wme;
        Thu, 26 Apr 2018 04:55:00 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49l9BfQuX7UbzHf6JkE9C62fqRZifQVLMnUngZ0rJjlwzzWsNeSRO8UKDzgT/8ddesxj7yN
X-Received: by 10.233.223.69 with SMTP id t66mr32773314qkf.25.1524743700472;
        Thu, 26 Apr 2018 04:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524743700; cv=none;
        d=google.com; s=arc-20160816;
        b=tymCJl79KBFRA6GP3q2cS8eC0JBVbmRTbvjll/zud5yhLEDXmyjvqRftKG+MXyY6pf
         Rz3pdwLUO/4nI9MyUeO5YSedlLoiVqnLr10JfWiXK0ivWl/7OgvNFArIo2TPHXcvjK5w
         BqAA+lyPO+ZtKStU+dXAicfkBt4GF/Nq+E8kYm1njnmuWLoCs1qKyVfxHYbjRB/91ArE
         KGCv0LgpVDrj8MSfn8DWjqhFHAq8PSR75zBdde7l5M8WULTB0s283btwNn4ovsT30EjS
         ENvJQ6E9jVO7kZRTbtc6Qe3JueOhbvhVBHDkM48zwC+czucFQMmvth+AhKSBvJSAwEc5
         YJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=YgmHXMsolvZX3e+P6bNxiGjMI6rBo9/PGFkAP14hu8I=;
        b=LidHV2HTQLloLxEokCt8YeDg88KbzOQgCzXf9XNZB5wNkoAy8lqBLaNpchABb/pHk/
         DSrGz5CmZYwGxDFzhoEqoyXl9/VwhasGpnayjydO1MdCV3lI/Go+sescfwiEUh05xEuo
         ggdYut8r/G74ADJCK4GTwNDyVLgdk1Bqm9x40YtBDLrPn7YM6YDt7vvjbPc/c1lWvjrO
         70R/ja+Ttz+vvafgWl42/fxtfl1vw1aPEgQbYD8qviDOJsuPL3UHESIewr0ihnNl5ijI
         +KvHPja99MUG+gZoLusP6HoY3FZahdu2Wb10qNWtcVv/qseUYmmLBMV5okKqlUpcF8Jn
         gtIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j43-v6si3154292qtf.281.2018.04.26.04.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 04:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBfUJ-0007nl-V1
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 07:54:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBfU8-0007nc-Sj
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 07:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fBfU5-0001G6-S7
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 07:54:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58568 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fBfU5-0001G0-Mq; Thu, 26 Apr 2018 07:54:45 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31DFF406C742;
	Thu, 26 Apr 2018 11:54:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1B410EE95C;
	Thu, 26 Apr 2018 11:54:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DE16D1138645; Thu, 26 Apr 2018 13:54:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87in8qf2w3.fsf@dusky.pond.sub.org>
	<62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com>
Date: Thu, 26 Apr 2018 13:54:43 +0200
In-Reply-To: <62dba5cf-b497-1a98-0af5-971e169a3458@redhat.com> (Thomas Huth's
	message of "Thu, 26 Apr 2018 12:24:48 +0200")
Message-ID: <877eou2nek.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 11:54:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Apr 2018 11:54:45 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
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
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqHAHFJAAqZX

Thomas Huth <thuth@redhat.com> writes:

> On 17.04.2018 14:12, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>> 
>>> Many device introspection crashes only happen if you are using a
>>> certain machine, e.g.:
>>>
>>> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
>>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>>>  "package": "build-all"}, "capabilities": []}}
>>> { 'execute': 'qmp_capabilities' }
>>> {"return": {}}
>>> { 'execute': 'device-list-properties',
>>>   'arguments': {'typename': 'macio-newworld'}}
>>> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
>>> Device 'serial0' is in use
>>> Aborted (core dumped)
>>>
>>> To be able to catch these problems, let's extend the device-introspect
>>> test to check the devices on all machine types. Since this is a rather
>>> slow operation, the test is only run in "SPEED=slow" mode.
>> 
>> If the device works with one machine type, it has a decent chance to
>> work with others, too.  Thus, testing each device with every machine
>> type is overkill.  I appreciate having overkill as an option :)
>> 
>> What I'd like to see for a quick "make check" is testing each device
>> once.  That should flush out most bugs.  
>
> That's already done with the "none" machine.

I was too terse.  We test each device with -machine none for every
target.  Fine if that's quick enough.  If not, we might want to reduce
redundancy there.

Actually, a worse offender in the "waste everybody's time via redunancy"
department could be qom-test.

> Anyway, do you think my patch here is useful and has a chance of getting
> included? I.e. shall I re-spin this as a non-RFC patch? Or shall we
> rather wait for Eduardo's python-based tests to get included into the
> repository?

I don't mind having make check SPEED=slow run more extensive tests.
Assuming we actually run them at least once in a while, which seems
doubtful.

>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>  In case someone wants to help with creating some bug fix patches
>>>  during the QEMU hard freeze phase: This test can now be used to
>>>  trigger lots of introspection bugs that we were not aware of yet.
>>>  I think most of the bugs are due to wrong handling of instance_init
>>>  vs. realize functions.
>> 
>> Yes, that's a common class of bugs.  There's little guidance on what
>> kind of work belongs where, and plenty of bad examples.
>
> I think we urgently need a file in doc/devel/ that describes the various
> states / functions of a device, where we should properly describe the
> differences between instance_init and realize. ... I'll try to come up
> with something when I've got some spare time (unless somebody else
> volunteers to do that first).

Please do.

Widen the scope from just TYPE_DEVICE to all of QOM?
