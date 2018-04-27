Received: by 10.28.4.212 with SMTP id 203csp450645wme;
        Fri, 27 Apr 2018 00:31:46 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo0yco+PPvqbnp+A2/8na7/OZn9jsNFIHGTrTlJ+aEpcWY/DpEK+vxvRRym9K5DTCEG2VDq
X-Received: by 10.55.109.4 with SMTP id i4mr999036qkc.86.1524814306492;
        Fri, 27 Apr 2018 00:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524814306; cv=none;
        d=google.com; s=arc-20160816;
        b=D0eWzgNCdHsIvYvSgtjPT28nvCnV3HqaeJny4z8w81OFNVTSYkD6SgmDRUbsTD9DeM
         e3Kr9ueCn2DDnpM/xCSfSuVeqcHeHI+rZz3y82MX3SKEA06sX7w9OG5OAYmUEsJFgUK7
         URJIrY6OYrgSnGz1dax0NK8thE51PHMvf2DySZx6wHyhyS1P3+yANHQiL0ugtAG93dmL
         uL3eqQdk1Nf1Hb4S28e4fTxj8sbfF+YOzdp/TrbwFyNpzofBxWpLTQQW28oI8L8Y2SZk
         g8nARrxyGaJR3txAbY2AX/rkqaJXCHw6sVo7E6mclo2pfcYG4IKNIVtC77kICtYbL9d3
         O3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Ui9eK9S1115tOMeT3h/7GnZYC+IupcdNzJiKUd7AWmU=;
        b=o81Hwvkj1ZWKh+UX5GXqCFg7DI4nLm7IhD86ePQPgsxT/WxpN4E8v9bJSHgr+IDSKS
         mu0ql1wHborjnVLJNaJm27QdbXi71d0K3HSnSqLFI2ywGjcTOgQs2WBwV12rDbp/AJio
         nbb2j90EcQhLdA3izh+oRkIIp74HmxL7G4OyijOyP9SGAACFGsXEImOPOaY5t3tRm3Ao
         S7h4HSq5rewBBL6cf1KfosKqSLpBq2WYWdGXVgx6HU1NrVM+ijA9viIBnuCWmobGv+7t
         WbpEibAec3jcFHmtdaIshkVZRR2XLXA1zU+TZBDciDJ7OSq1gId2o38M0kZbPGHhPaGF
         hDlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e43-v6si689040qte.257.2018.04.27.00.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 00:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBxr7-0007Ya-T2
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 03:31:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBxqv-0007X9-HT
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 03:31:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fBxqq-0003K2-K7
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 03:31:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60638 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fBxqq-0003Ju-En; Fri, 27 Apr 2018 03:31:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0094B4072CC4;
	Fri, 27 Apr 2018 07:31:28 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99494AB3F2;
	Fri, 27 Apr 2018 07:31:26 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9ffb47aa-1fe9-0e0a-3013-bf48ff71d695@redhat.com>
Date: Fri, 27 Apr 2018 09:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87o9i5uplt.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 27 Apr 2018 07:31:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 27 Apr 2018 07:31:28 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vvg4eTa0mNXc

On 27.04.2018 08:31, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>=20
>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>>> On 26.04.2018 13:45, Markus Armbruster wrote:
>>>> Thomas Huth <thuth@redhat.com> writes:
>>> [...]
>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>>>>      qtest_end();
>>>>>  }
>>>>> =20
>>>>> +static void add_machine_test_case(const char *mname)
>>>>> +{
>>>>> +    char *path, *args;
>>>>> +
>>>>> +    /* Ignore blacklisted machines */
>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mname)=
) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    path =3D g_strdup_printf("device/introspect/concrete-defaults-=
%s", mname);
>>>>> +    args =3D g_strdup_printf("-machine %s", mname);
>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>
>>>> This runs test_device_intro_concrete() with "-machine M" for all mac=
hine
>>>> types M, in SPEED=3Dslow mode.
>>>>
>>>>> +    g_free(path);
>>>>> +
>>>>> +    path =3D g_strdup_printf("device/introspect/concrete-nodefault=
s-%s", mname);
>>>>> +    args =3D g_strdup_printf("-nodefaults -machine %s", mname);
>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>
>>>> This runs test_device_intro_concrete() with "-nodefaults -machine M"=
 for
>>>> all machine types M, in SPEED=3Dslow mode.
>>>>
>>>> Has "without -nodefaults" exposed additional bugs?
>>>
>>> After testing this with all machines, I had to discover that
>>> "-nodefaults" does not work so easily: A lot of the embedded machines
>>> (especially the ARM machines) simply refuse to work with "-nodefaults=
"
>>> and exit immediately instead. E.g.:
>>>
>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=3D=
qtest
>>> qemu-system-arm: missing SecureDigital device
>=20
> These are all bugs.  --nodefaults is supposed to suppress *optional*
> devices, not mandatory ones.

Even if we fix all the issues, there is still another cosmetic problem:
Since there are no entries in nd_table[], all the boards with embedded
NICs start to spill out "warning: nic XYZ has no peer". Should we simply
suppress that warning in qtest mode?

 Thomas
