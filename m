Received: by 10.28.4.212 with SMTP id 203csp476962wme;
        Fri, 27 Apr 2018 01:05:43 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqqov3KPbLQyFmo+1myMc5ITJKgTI1r6OB/V4a2Hc80WJ0hWipv9HlWLIz6/nO7A3uEkuh4
X-Received: by 2002:a0c:9487:: with SMTP id j7-v6mr1051493qvj.104.1524816343288;
        Fri, 27 Apr 2018 01:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524816343; cv=none;
        d=google.com; s=arc-20160816;
        b=lV0jzoJAYxw7QBHzZ8P5JnUwpZQnZZvD47YogdpHZ6JTvj8DjLoB8CvlKoIMwQyrJ/
         eLhC+C+QhMwk7g/Sbgomc/LbzikKXwBcmIrpZZGrSTY5FghBFzFxciBiJNN2oBduwbQc
         f1hrzusnLEQZM+gzlwxSA37YEXYALu7xndVTY0+UIak5BtAlvZWkVl340XxujpMs88qM
         Va9BhDed6AErzNyz5NOSOrbyOPs9gcka7Ay2QEOLOtqWc3qJr7VxoLYNYHoo2cBjp9Vc
         WzlJ1Lw0G3kIIfx4S7LtcwnXWOG0aSASnlGdUhFcg8UmGgCaQ0WwAeMV8mzcHaeVP/Qc
         eEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=UbWPUkMiIckMn5asVRQsYOxHR2c3aqJc6KprygDWhkQ=;
        b=xiUDSKmyX5Ld5WcYDQXDsok+42sqLpPt7G2fe3uyaFCxYLWkgIFQukP9camPg36WIj
         jGXaPGzsqq01xQMSejNSlEgR04+0Mtr8mlDSPcM/PiOvMVZArV3F1+UT0cmaFGNSHLcY
         IslFzIDDOiCsqOTB8/i3TP7T+8ej/DfqwcjaIPw1+h/qN2i+mHnl/Ke7o6OfPL4oaWrN
         Ytu4mwweKHf6Kr+obZ4nVd9BejtqeeE0/rc4B2FnVopc5il2YLOxu4sNdWiLTuCZCx+1
         N6XapzgOxmSWsdB0PG9AfNt5YJR3Tk3JUvxswvVgk88LEvfAG1B/zEFFQCHflvb9Qlfk
         HaYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17si810447qkj.210.2018.04.27.01.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 01:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fByNy-0003gK-Qw
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 04:05:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fByNp-0003eC-QY
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 04:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fByNk-0008DN-SJ
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 04:05:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44186 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fByNk-0008D0-Fm; Fri, 27 Apr 2018 04:05:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C76F0818533A;
	Fri, 27 Apr 2018 08:05:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD403202699C;
	Fri, 27 Apr 2018 08:05:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9E48D1138645; Fri, 27 Apr 2018 10:05:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<9ffb47aa-1fe9-0e0a-3013-bf48ff71d695@redhat.com>
Date: Fri, 27 Apr 2018 10:05:19 +0200
In-Reply-To: <9ffb47aa-1fe9-0e0a-3013-bf48ff71d695@redhat.com> (Thomas Huth's
	message of "Fri, 27 Apr 2018 09:31:25 +0200")
Message-ID: <87y3h9qdkw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 08:05:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 27 Apr 2018 08:05:23 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3Y6gMBxp9e0

Thomas Huth <thuth@redhat.com> writes:

> On 27.04.2018 08:31, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>> [...]
>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>>>>>      qtest_end();
>>>>>>  }
>>>>>>  
>>>>>> +static void add_machine_test_case(const char *mname)
>>>>>> +{
>>>>>> +    char *path, *args;
>>>>>> +
>>>>>> +    /* Ignore blacklisted machines */
>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
>>>>>> +    args = g_strdup_printf("-machine %s", mname);
>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>
>>>>> This runs test_device_intro_concrete() with "-machine M" for all machine
>>>>> types M, in SPEED=slow mode.
>>>>>
>>>>>> +    g_free(path);
>>>>>> +
>>>>>> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
>>>>>> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>
>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" for
>>>>> all machine types M, in SPEED=slow mode.
>>>>>
>>>>> Has "without -nodefaults" exposed additional bugs?
>>>>
>>>> After testing this with all machines, I had to discover that
>>>> "-nodefaults" does not work so easily: A lot of the embedded machines
>>>> (especially the ARM machines) simply refuse to work with "-nodefaults"
>>>> and exit immediately instead. E.g.:
>>>>
>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
>>>> qemu-system-arm: missing SecureDigital device
>> 
>> These are all bugs.  --nodefaults is supposed to suppress *optional*
>> devices, not mandatory ones.
>
> Even if we fix all the issues, there is still another cosmetic problem:
> Since there are no entries in nd_table[], all the boards with embedded
> NICs start to spill out "warning: nic XYZ has no peer". Should we simply
> suppress that warning in qtest mode?

Makes sense to me.
