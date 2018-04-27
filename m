Received: by 10.28.4.212 with SMTP id 203csp300291wme;
        Thu, 26 Apr 2018 20:53:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqdURRrVADtF7HJ5zTpi3X64ei6cQQz9Q1UWfKatBMahh7LUoV0GBMDPkF8uU1Eelr5xaLU
X-Received: by 2002:ac8:4245:: with SMTP id r5-v6mr586070qtm.262.1524801204096;
        Thu, 26 Apr 2018 20:53:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524801204; cv=none;
        d=google.com; s=arc-20160816;
        b=Yem8QbY5gkLF/zQtKb7X0mibNwbbDZV6qQxfmUzGngn1JSZok+AyVBhv5jRpF5IL22
         uza0PHqFfWD5DCyk2jni1WUDlq839ZvTiZr2EYcZTKKIGjG1ansbpbtGLEJN8XfhFLZ5
         2MZGCbu25sOcD7BApkQUjFiI1XixAhycQsWkpd/URsYGaP2vVuM2LNtM8Yragdf5i8nt
         v8S2xqaYIMTVP8WZKBOBVnwqBrrdtbjWM98LcqAqqf5oZ4ToAHGiceRqR+jIhXMSgaff
         lgCfdph+WZPWJ9KZLyF51eEk+1+6aVucwA1jeQeZ+Z5kDE3zTQ8TuIOyD9mZ6O54syxX
         o0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=4HB66p/lzhQenJ8L6mK96TNYKyxxGPN2EwC4tq1xl3Q=;
        b=ovU5simyjORCuI13IByVCGXzJc7fWSL6Wd6nNdsWRMBFt2MqTv+JYxhaWS+NnUdcDE
         ObYSf8XL4xcWLs0T0EQ7iI+UlP3jIqBRMNUrpy7qJ3HwF/X5s9tf5ySCYWB6VGgmNGvc
         ejQmRt5h7ZFlhmnf7PFUIn9fIwsbNb9Wp6E9tuEmI8uxQffJpJMpVisMBX7D9/qyo1kj
         rosOuKXAFr58nlBmGuCEUrdENSnKAJUxBf5EVHNCKgyKRJDGpZdRCjyRzWTyi9F5fmDx
         O1QP98F902Lql4kgWUiS8xDLXTazgKJ39STURFK2v2gxnM66ad239ZONu9uuhbUZSRq6
         T9sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a188si392576qkf.384.2018.04.26.20.53.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 20:53:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBuRn-0007M9-LJ
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 23:53:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBuRc-0007Kt-Ne
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 23:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBuRZ-0003UV-LG
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 23:53:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50830 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBuRZ-0003U7-Fn; Thu, 26 Apr 2018 23:53:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04014EBFFE;
	Fri, 27 Apr 2018 03:53:05 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1AE5215CDCB;
	Fri, 27 Apr 2018 03:52:59 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0f69501c-f7cb-864a-3aa5-710fbe769f82@redhat.com>
Date: Fri, 27 Apr 2018 05:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427003215.GU29865@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 27 Apr 2018 03:53:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 27 Apr 2018 03:53:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r7tnKc/pKfgU

On 27.04.2018 02:32, Eduardo Habkost wrote:
> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>> On 26.04.2018 13:45, Markus Armbruster wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>> [...]
>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>>>      qtest_end();
>>>>  }
>>>> =20
>>>> +static void add_machine_test_case(const char *mname)
>>>> +{
>>>> +    char *path, *args;
>>>> +
>>>> +    /* Ignore blacklisted machines */
>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname))=
 {
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    path =3D g_strdup_printf("device/introspect/concrete-defaults-%=
s", mname);
>>>> +    args =3D g_strdup_printf("-machine %s", mname);
>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>
>>> This runs test_device_intro_concrete() with "-machine M" for all mach=
ine
>>> types M, in SPEED=3Dslow mode.
>>>
>>>> +    g_free(path);
>>>> +
>>>> +    path =3D g_strdup_printf("device/introspect/concrete-nodefaults=
-%s", mname);
>>>> +    args =3D g_strdup_printf("-nodefaults -machine %s", mname);
>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>
>>> This runs test_device_intro_concrete() with "-nodefaults -machine M" =
for
>>> all machine types M, in SPEED=3Dslow mode.
>>>
>>> Has "without -nodefaults" exposed additional bugs?
>>
>> After testing this with all machines, I had to discover that
>> "-nodefaults" does not work so easily: A lot of the embedded machines
>> (especially the ARM machines) simply refuse to work with "-nodefaults"
>> and exit immediately instead. E.g.:
>>
>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=3Dq=
test
>> qemu-system-arm: missing SecureDigital device
>>
>> So we'd either need a rather big black list for the machines that do n=
ot
>> work, or simply drop the "-nodefaults" tests from this patch.
>=20
> Or we could try to test all machines anyway, but not consider it
> an error if QEMU just does exit(1).  Can the qtest C API give us
> that information?

At a first glance, I haven't seen an easy way to do this. I guess we
could do some polling with waitid() or do something with SIGCHLD, but...

> (Or we could simply let -nodefaults aside by now, and do this
> after we implement this test case in Python.)

... I'd rather prefer that for now, assuming that the test will later
get replaced by the python test anyway.

 Thomas
