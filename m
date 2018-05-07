Received: by 10.28.4.212 with SMTP id 203csp3326287wme;
        Mon, 7 May 2018 12:14:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq9uTzFOhO0B/S2EK+ERlEE8gJd0mDJeHGHf1991Lj9AWKE1HifpqP+1eVqcGMEOrZg6lod
X-Received: by 2002:a0c:c989:: with SMTP id b9-v6mr18865969qvk.2.1525720461351;
        Mon, 07 May 2018 12:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525720461; cv=none;
        d=google.com; s=arc-20160816;
        b=qELqFJKw7Bwirwee2/8PkFKUjGb0BR8gTwlhmLc40KxF6bl/akcHfjVTQRwHMC4NA9
         QB4kVdFJvg/QQ4eNqMH6A47J0Gh9ggU8Yj/kSQYPm93YLpZkmH1Qsekhi8tNnfiHqCNy
         gofYxI/BTKfJGedIKOHRYSXmByTNgvYpUalOjNzy8vduvk3oHyT5qmkBHG0NVZIBfNQ1
         5NfwESjyQ5/PLlaOijqRVQ9okasTr/Cg6SNjBwC0GfkI/gG5xRz4ZsYGdbO0a43eC5xK
         HO9OCrkKYguRK8p3/XKnApT+uWL0+FzOiw8nsuAIUrKIChGZrhnhZPV+zFk53KDl1+z9
         sSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=WtiYKolRh0cChTgIQjBQi/OP0UDPMOnCu21RP1DQ5lg=;
        b=z7De6T/2k3JL8I5YSw3grbxpFW2HbyrdF2zcL25W+ZEMPMJ5/loDBKj7b7HovpFvN2
         KLYADPP8LkVjF6kFOuZXwa7840SGi3EDYc8o1s64xzNNY6+mDOl8xgea3HYEIp/DkqnW
         EVvnsdB5p66M+FiT4BdnUH4pa3CEpLYe94FAmTxXTOc4eKzEU9QkFUbDEQlat9sQAzTx
         j9dwr/79mzZ4JrIlqd9XlnJkRXeAdiIYkQtdXMl81rfoKeKrxnu6YiWD1CYi1E9eii0j
         hDUDdICHAZgx93gPLxRl7Y2G/EL6i24SvW5h80mK3JzFe+X36HMh3s0NN0iuc63cYHiB
         xy2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 40-v6si3749448qvn.74.2018.05.07.12.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 12:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFlaW-00028Z-SA
	for alex.bennee@linaro.org; Mon, 07 May 2018 15:14:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fFlaN-00028F-H6
	for qemu-arm@nongnu.org; Mon, 07 May 2018 15:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fFlaI-0006FE-AQ
	for qemu-arm@nongnu.org; Mon, 07 May 2018 15:14:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48436 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fFlaI-0006En-5v; Mon, 07 May 2018 15:14:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA896EB71C;
	Mon,  7 May 2018 19:14:02 +0000 (UTC)
Received: from [10.36.116.88] (ovpn-116-88.ams2.redhat.com [10.36.116.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50E252024CA1;
	Mon,  7 May 2018 19:13:58 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
	<20180507182126.GC25013@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4bba0be5-a52c-48ad-3df4-4e9be3624dc0@redhat.com>
Date: Mon, 7 May 2018 21:13:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180507182126.GC25013@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 07 May 2018 19:14:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 07 May 2018 19:14:02 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: XCIdx0TkVB2n

On 07.05.2018 20:21, Eduardo Habkost wrote:
> On Mon, May 07, 2018 at 06:50:35PM +0200, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>
>>> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
>>>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>>>
>>>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>>>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
>>>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>> [...]
>>>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>>>>>>>      qtest_end();
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +static void add_machine_test_case(const char *mname)
>>>>>>>> +{
>>>>>>>> +    char *path, *args;
>>>>>>>> +
>>>>>>>> +    /* Ignore blacklisted machines */
>>>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-defaults-%s", mname);
>>>>>>>> +    args = g_strdup_printf("-machine %s", mname);
>>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>>>
>>>>>>> This runs test_device_intro_concrete() with "-machine M" for all machine
>>>>>>> types M, in SPEED=slow mode.
>>>>>>>
>>>>>>>> +    g_free(path);
>>>>>>>> +
>>>>>>>> +    path = g_strdup_printf("device/introspect/concrete-nodefaults-%s", mname);
>>>>>>>> +    args = g_strdup_printf("-nodefaults -machine %s", mname);
>>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>>>
>>>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" for
>>>>>>> all machine types M, in SPEED=slow mode.
>>>>>>>
>>>>>>> Has "without -nodefaults" exposed additional bugs?
>>>>>>
>>>>>> After testing this with all machines, I had to discover that
>>>>>> "-nodefaults" does not work so easily: A lot of the embedded machines
>>>>>> (especially the ARM machines) simply refuse to work with "-nodefaults"
>>>>>> and exit immediately instead. E.g.:
>>>>>>
>>>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=qtest
>>>>>> qemu-system-arm: missing SecureDigital device
>>>>
>>>> These are all bugs.  --nodefaults is supposed to suppress *optional*
>>>> devices, not mandatory ones.
>>>
>>> I'm not sure I understand the requirements.  What exactly is the
>>> definition of "mandatory"?
>>>
>>> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
>>> is useless because it has no any device to boot from.  How is
>>> that different from a n810 machine not booting because there's no
>>> SD device?
>>
>> I propose:
>>
>> * Stuff that's required for QEMU to run is not suppressed by -nodefaults
>>
>> * Stuff that a real machine has soldered on is also not suppressed
>>
>> * Stuff that can be pulled out of a real machine may be suppressed, even
>>   when that means the guest won't run
> 
> Makes sense to me.  It looks like the only obstacle for
> tests/device-introspect and device-crash-test is the first rule.
> "Guest won't boot" isn't a problem, but "QEMU won't run" is.
> 
> The first rule is easily testable, too: running
> "$QEMU -machine $MACHINE -nodefaults" and not having a working
> QMP monitor should be reported as a bug by automated tests.

You mean with "-accel qtest" or without? With "-accel qtest" we should
pretty soon be fine, after Peter's current PULL request has been merged
(which contains a patch from me for fixing these SD card problems with
ARM machines).
Without "-accel qtest", things are not that easy, unfortunately. Lots of
boards require "-kernel" or "-bios" and refuse to work without. So you
can hardly test "-nodefaults" automatically in the normal tcg mode. (But
maybe all boards should allow to start QEMU in case you've at least also
specified "-S" ? ... in that case we've got plenty of work for
BiteSizeTasks ;-) )

 Thomas
