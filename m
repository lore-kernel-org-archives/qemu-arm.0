Received: by 10.28.4.212 with SMTP id 203csp3205225wme;
        Mon, 7 May 2018 10:02:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZocuQTeXhJnoVkxtYI53yLBdtpe1khou9ox0ZZ14UK/HAar56SRcN8ot0tp1ywbv2DVuO5E
X-Received: by 2002:a0c:b128:: with SMTP id q37-v6mr18605737qvc.19.1525712557783;
        Mon, 07 May 2018 10:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525712557; cv=none;
        d=google.com; s=arc-20160816;
        b=SXuEAqFaDaYKa7whBQN4UA9kSJJRGDwHiujfvYsew817LNmeb5M8LAvtsfIeOG6VOj
         6Daiz/GeAbxShMSvbiY0kLwvEkgkEC/lecD6CdFwTFU4tb79jOZJsGJi2bUHMKRgzWkb
         L5VCDWH7TcjI5UgY3Ge5ktJVvWPd82Wg9gEo7RoUXy+R0T/h01Rv3lnkwlYIfHP4Z4nB
         8nNhyYnL8qNhTX65rWVm0f94IhEVYj3Nn8UbehIyb4gHxiQAEObKjcP+BfQi9EyBMLuB
         S8wDXeQL8mQG6Y8sD1mQp0Bt1tjNxjD10Ys0cQdoeHIij0Wv1/aS/b+sYGR+os5hES6o
         XthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=40ESzXRnNDOutVPeN3gS3bgekwU5bhtk8OFvh7KnsXM=;
        b=yz6ro4hf8pupkFUULTbg7ETs0TI0O7xx/Tjnh/m/VqfiYIR9wfSAi8KqyGBLh41iu7
         26tq4zF4XPgvnitI/8ImyzPD7+Z1M1YmoRTtV2oVfUHYHA26cZm0CGDCwjWK55eNp9d1
         9dxYCRoKatbNKMdFhk3uGhdyNSXNs7yoTTditq7hsEMw4UBCPRCO5GFBqAa4f8iB8VBR
         GvSYB1KX+YzQ2lbFG+/u4G6PU72or1hr6W7h6u6Ukyw1yT621mGZ/RC1x/ehZvjKp/yy
         hhI3Vphdx+Rtk803ufMTRVjkCklkCbqoWlIetjQuf++zAp4Nfn2TFcmNgU228mvcwHCo
         p6qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7-v6si5036833qvc.143.2018.05.07.10.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 10:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFjX3-0005d1-Ae
	for alex.bennee@linaro.org; Mon, 07 May 2018 13:02:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fFjWn-0005bB-HN
	for qemu-arm@nongnu.org; Mon, 07 May 2018 13:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fFjWk-0006LS-Fo
	for qemu-arm@nongnu.org; Mon, 07 May 2018 13:02:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43104 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fFjWk-0006LM-BI; Mon, 07 May 2018 13:02:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8831814DF4C;
	Mon,  7 May 2018 17:02:17 +0000 (UTC)
Received: from [10.36.116.61] (ovpn-116-61.ams2.redhat.com [10.36.116.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66257215CDA7;
	Mon,  7 May 2018 17:02:16 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
	<87bme62nu0.fsf@dusky.pond.sub.org>
	<068649bc-1546-6fc5-3e41-63512196cbf8@redhat.com>
	<20180427003215.GU29865@localhost.localdomain>
	<87o9i5uplt.fsf@dusky.pond.sub.org>
	<20180507135330.GS25013@localhost.localdomain>
	<87h8njtnok.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4d960efd-e31b-efdd-35d8-ec9e27cb3f9e@redhat.com>
Date: Mon, 7 May 2018 19:02:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87h8njtnok.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 07 May 2018 17:02:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 07 May 2018 17:02:17 +0000 (UTC) for IP:'10.11.54.6'
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zeVjAgC9Rgo9

On 07.05.2018 18:50, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
>=20
>> On Fri, Apr 27, 2018 at 08:31:58AM +0200, Markus Armbruster wrote:
>>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>>
>>>> On Thu, Apr 26, 2018 at 05:20:25PM +0200, Thomas Huth wrote:
>>>>> On 26.04.2018 13:45, Markus Armbruster wrote:
>>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>> [...]
>>>>>>> @@ -260,6 +263,26 @@ static void test_abstract_interfaces(void)
>>>>>>>      qtest_end();
>>>>>>>  }
>>>>>>> =20
>>>>>>> +static void add_machine_test_case(const char *mname)
>>>>>>> +{
>>>>>>> +    char *path, *args;
>>>>>>> +
>>>>>>> +    /* Ignore blacklisted machines */
>>>>>>> +    if (g_str_equal("xenfv", mname) || g_str_equal("xenpv", mnam=
e)) {
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    path =3D g_strdup_printf("device/introspect/concrete-default=
s-%s", mname);
>>>>>>> +    args =3D g_strdup_printf("-machine %s", mname);
>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>>
>>>>>> This runs test_device_intro_concrete() with "-machine M" for all m=
achine
>>>>>> types M, in SPEED=3Dslow mode.
>>>>>>
>>>>>>> +    g_free(path);
>>>>>>> +
>>>>>>> +    path =3D g_strdup_printf("device/introspect/concrete-nodefau=
lts-%s", mname);
>>>>>>> +    args =3D g_strdup_printf("-nodefaults -machine %s", mname);
>>>>>>> +    qtest_add_data_func(path, args, test_device_intro_concrete);
>>>>>>
>>>>>> This runs test_device_intro_concrete() with "-nodefaults -machine =
M" for
>>>>>> all machine types M, in SPEED=3Dslow mode.
>>>>>>
>>>>>> Has "without -nodefaults" exposed additional bugs?
>>>>>
>>>>> After testing this with all machines, I had to discover that
>>>>> "-nodefaults" does not work so easily: A lot of the embedded machin=
es
>>>>> (especially the ARM machines) simply refuse to work with "-nodefaul=
ts"
>>>>> and exit immediately instead. E.g.:
>>>>>
>>>>> $ arm-softmmu/qemu-system-arm -nodefaults -nographic -M n810,accel=3D=
qtest
>>>>> qemu-system-arm: missing SecureDigital device
>>>
>>> These are all bugs.  --nodefaults is supposed to suppress *optional*
>>> devices, not mandatory ones.
>>
>> I'm not sure I understand the requirements.  What exactly is the
>> definition of "mandatory"?
>>
>> A machine created by "qemu-system-x86_64 -machine pc -nodefaults"
>> is useless because it has no any device to boot from.  How is
>> that different from a n810 machine not booting because there's no
>> SD device?
>=20
> I propose:
>=20
> * Stuff that's required for QEMU to run is not suppressed by -nodefault=
s
>=20
> * Stuff that a real machine has soldered on is also not suppressed
>=20
> * Stuff that can be pulled out of a real machine may be suppressed, eve=
n
>   when that means the guest won't run
>=20
> Does that make some sense?

Makes sense. On a real machine, you could likely also remove the SD card
and load a kernel by other means, e.g. with a JTAG debug connector. So
it makes sense that you could also start the machine in QEMU without SD
card and load a kernel e.g. with the gdb stub instead.

 Thomas
