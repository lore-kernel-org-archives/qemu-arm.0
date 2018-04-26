Received: by 10.28.4.212 with SMTP id 203csp2348636wme;
        Thu, 26 Apr 2018 08:21:01 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+3R82fax2SDtTj8n26dLMyxW+12C3wHSa4NcCkwCP0olrjxnwrMbg9IuQbwDuwpYvk9o+T
X-Received: by 2002:aed:3622:: with SMTP id e31-v6mr35583549qtb.82.1524756061321;
        Thu, 26 Apr 2018 08:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524756061; cv=none;
        d=google.com; s=arc-20160816;
        b=Y8FRJ3bAkgyAys1y5eA0du3wDlCL9uUNAwu/8IEqrPiMK/RKaTX5V1WU6fza/Fk2v3
         pDPQRkZl2j9+pgLcjeMcSZobEIZXhVscrkGWL/jJgAqYCPpv0UP2mQ2DKflhxdHlYMXI
         3p8tjVYdNRhaqnEleVqXV233FCvsCEwGKM3vRZyO7OCEtRpT/mKIq8vsH85H4RX6q3FQ
         hqy1fZg8YiGfwCUYanM17QLa4tchRbY7pz0YsuImKBFgmeBjW4oFmbUeGNca7Q9F25W3
         6Yc4pAoZlX99eXMhYlzoVJMj/EjGv0sn/x6HQ5nIM/ARdft/LM8beag8cc4ZpHa54vdV
         Rk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=cKDvPRgkA1JXvScyMj2EQnzOPyr1K/esNBIahNhCEd4=;
        b=k9OiAHBuXzfMACfPgaIxC8Q6zPSCL/zm1Yf0o/4H602ybbzPwxu+DW+w9U5KC5ngjR
         3imJEB9ru+hhhpHv/oEPtNbWhb48eTvl8M82DHsNVf3k7XeWe8E6/13WCISFHlxHZ6nr
         FF5sI0PLWqDrVepFyGUs1y8rh1seJKkhJdlsM/2o+IqRXzHyv8oCqlDP8SLESEblVVws
         RrvXHxUZlFkfRnB0a2azjEUY2jbmv15a2hHbeb39H+pwyiNXoS/IBzw+1WTrXwR7AqJF
         /qgqmRgLtpmybOA/qfgAH+EmeVJ3JSUjSJ3nPouvpM5lNJV5o9taCQw+Eq2ybw+hJAj1
         fa7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 93si10107950qks.350.2018.04.26.08.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Apr 2018 08:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBihg-00080x-PL
	for alex.bennee@linaro.org; Thu, 26 Apr 2018 11:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBihQ-0007zS-6e
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 11:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBihJ-00055i-SZ
	for qemu-arm@nongnu.org; Thu, 26 Apr 2018 11:20:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32822 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBihJ-00055b-Mk; Thu, 26 Apr 2018 11:20:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B66D81A88BD;
	Thu, 26 Apr 2018 15:20:32 +0000 (UTC)
Received: from [10.36.116.75] (ovpn-116-75.ams2.redhat.com [10.36.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2694610EE6CE;
	Thu, 26 Apr 2018 15:20:26 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
Date: Thu, 26 Apr 2018 17:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87bme62nu0.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 26 Apr 2018 15:20:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 26 Apr 2018 15:20:32 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0Ol8+dqsHnS

On 26.04.2018 13:45, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
[...]
>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>      qtest_end();
>>  }
>> =20
>> +static void add_machine_test_case(const char *mname)
>> +{
>> +    char *path, *args;
>> +
>> +    /* Ignore blacklisted machines */
>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)) {
>> +        return;
>> +    }
>> +
>> +    path =3D g_strdup_printf("device/introspect/concrete-defaults-%s"=
, mname);
>> +    args =3D g_strdup_printf("-machine %s", mname);
>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>=20
> This runs test_device_intro_concrete() with "-machine M" for all machin=
e
> types M, in SPEED=3Dslow mode.
>=20
>> +    g_free(path);
>> +
>> +    path =3D g_strdup_printf("device/introspect/concrete-nodefaults-%=
s", mname);
>> +    args =3D g_strdup_printf("-nodefaults -machine %s", mname);
>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>=20
> This runs test_device_intro_concrete() with "-nodefaults -machine M" fo=
r
> all machine types M, in SPEED=3Dslow mode.
>=20
> Has "without -nodefaults" exposed additional bugs?

After testing this with all machines, I had to discover that
"-nodefaults" does not work so easily: A lot of the embedded machines
(especially the ARM machines) simply refuse to work with "-nodefaults"
and exit immediately instead. E.g.:

$ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=3Dqtes=
t
qemu-system-arm: missing SecureDigital device

So we'd either need a rather big black list for the machines that do not
work, or simply drop the "-nodefaults" tests from this patch.

> Please mention "with and without -nodefaults" in the commit message.
>=20
> I'd try "with -nodefaults" before "without", because "with" is the
> simpler test case.

For most boards, it seems rather to be the more "difficult" setting
since most boards are only tested without "-nodefaults" obviously.

>> +    g_free(path);
>> +}
>> +
>>  int main(int argc, char **argv)
>>  {
>>      g_test_init(&argc, &argv, NULL);
>> @@ -268,8 +291,12 @@ int main(int argc, char **argv)
>>      qtest_add_func("device/introspect/list-fields", test_qom_list_fie=
lds);
>>      qtest_add_func("device/introspect/none", test_device_intro_none);
>>      qtest_add_func("device/introspect/abstract", test_device_intro_ab=
stract);
>> -    qtest_add_func("device/introspect/concrete", test_device_intro_co=
ncrete);
>>      qtest_add_func("device/introspect/abstract-interfaces", test_abst=
ract_interfaces);
>> +    qtest_add_data_func("device/introspect/concrete", g_strdup(common=
_args),
>> +                        test_device_intro_concrete);
>=20
> This runs test_device_intro_concrete() with "-nodefaults -machine
> none".  Duplicate in SPEED=3Dslow mode?

Yes, it's a duplicate, we should skip that in SPEED=3Dslow mode.

 Thomas
