Received: by 10.28.71.155 with SMTP id m27csp2753136wmi;
        Mon, 9 Apr 2018 09:30:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48mInZf4tcSyYo7HfFKg9KauVjsXW+r70U38uWCxVw8U2oneM+70Q8tIVPrN6uIAdUg3Y1z
X-Received: by 10.55.159.140 with SMTP id i134mr49116359qke.220.1523291412260;
        Mon, 09 Apr 2018 09:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523291412; cv=none;
        d=google.com; s=arc-20160816;
        b=dL02xJe8bJu3HBtsVUR2UnOGF44+nOrxoh1lM8r3VBfbo+ErKAvWKOPg823N9fTS7+
         PUEvoUvvOmbQF2eeoeD98xRIQLEXYyA+fM6p8eBH2Ous49m9tAxt8vmF3DB82KqnuHH8
         nSvFH/9aNjMQ1pOfMrWEfFBsB6HLYbGsPMS+u0kCMjHX+Gmn1PQm5okK6dCyurRdkLxz
         fTitFVa2x8p4rHcGb0/A3BXV8aQGJh6FBm+LYf/U2+4xc9tnzpDdx9J5PH5aQU0bhmGM
         OKd5UIEkj8MYjqCA3H0IQ4kp0HCKdAhv4MqPv0VAmn6T6wOJMqfC/XGRKV8Fu9Kon5WL
         HNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=vJ/TmTSTN6cSoTbzucXY9tU/qGtSOgUExXjVCusVPHw=;
        b=DRH5CCh1ajzA1T7LlX0Uvfnvr5afUp0kSWBKR1nMjCmt8kSwGucdGH5MGrHbhJwaZN
         mGF9g65uwDZO4oDElj3IuQ7iq2fc2mKXRfXetqM+v03ZMAwKuc2YeGg7v4FFzQOOfyE1
         ALulaCVt7wbjr+jZQ5FO1l01L5yhsnmj7qosr39lHSoK9Dw6mdnyGmW+5tr76hLh3UY5
         DfiArkPjQU2UHglHHV2j1Es7c6FtCHMcWfy9LPdsPLvYHHjzYcb5n5a8ciI3w/cRYE6r
         gNE/HmU58H3yO8xxNVmPuwa8TgxnCUPyriLWhMbfhBNI8Wmg6xxTtkLg5NnhPWastodx
         BzpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u52si797512qtb.154.2018.04.09.09.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 09:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5ZgJ-00072o-PQ
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 12:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Zg6-000716-Sp
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 12:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1f5Zg5-0001iI-RV
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 12:29:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46380 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1f5Zg5-0001i6-La; Mon, 09 Apr 2018 12:29:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B62376FB9;
	Mon,  9 Apr 2018 16:29:53 +0000 (UTC)
Received: from [10.10.120.209] (ovpn-120-209.rdu2.redhat.com [10.10.120.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6509F7C51;
	Mon,  9 Apr 2018 16:29:45 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
	<20180409155634.GO18283@redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
Date: Mon, 9 Apr 2018 11:29:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180409155634.GO18283@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 09 Apr 2018 16:29:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 09 Apr 2018 16:29:53 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: blRvEGHPIr7V



On 04/09/2018 10:56 AM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Apr 09, 2018 at 10:49:21AM -0500, Wei Huang wrote:
>> Running mach-virt machine types (i.e. "-M virt") on different systems =
can
>> result in various misleading warnings if -cpu and/or gic-version not s=
pecified.
>> For KVM, this can be solved mostly by using "host" type. But the "host=
" type
>> doesn't work for TCG. Compared with "host", the "max" type not only su=
pports
>> auto detection under KVM mode, but also works with TCG. So this patch =
set
>> "max" as the default types for both -cpu and gic-version.
>=20
> Hmm, generally we aim for the config provided by a machine type to be s=
table
> across QEMU versions.

I understand this principle. But in reality, under KVM mode, the default
config most time doesn't work. If end users specify cpu type manually,
it still doesn't work because the host CPU is vendor-specific design
(e.g. "cortex-a57" doesn't work on QCOM's machine). So we end up with
using "-cpu host" all the time. My argument for this patch is that "-cpu
max" isn't worse than "-cpu host".

>=20
> By specifying "max", the machine type will potentially change if new QE=
MU
> turns on new features in the "max" CPU model, as well as also varying
> depending on what the host OS supports.
>=20
> This is a general conceptual problem with the "host" CPU model for all
> target arches and is unfixable by design. This is fine if you accept
> the caveats with using "-cpu host" and opt-in to using it knowing the
> tradeoffs. I'm just not convinced it is reasonable to make "-cpu host"
> be the default value for a machine type out of the box.
>=20
>=20
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/arm/virt.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 94dcb125d3..1a9d68b8d5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1555,7 +1555,7 @@ static void virt_machine_class_init(ObjectClass =
*oc, void *data)
>>      mc->minimum_page_bits =3D 12;
>>      mc->possible_cpu_arch_ids =3D virt_possible_cpu_arch_ids;
>>      mc->cpu_index_to_instance_props =3D virt_cpu_index_to_props;
>> -    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a15");
>> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("max");
>>      mc->get_default_cpu_node_id =3D virt_get_default_cpu_node_id;
>>  }
>> =20
>> @@ -1609,13 +1609,13 @@ static void virt_2_12_instance_init(Object *ob=
j)
>>                                      "Set on/off to enable/disable usi=
ng "
>>                                      "physical address space above 32 =
bits",
>>                                      NULL);
>> -    /* Default GIC type is v2 */
>> -    vms->gic_version =3D 2;
>> +    /* Default GIC type is max */
>> +    vms->gic_version =3D -1;
>>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>>                          virt_set_gic_version, NULL);
>>      object_property_set_description(obj, "gic-version",
>> -                                    "Set GIC version. "
>> -                                    "Valid values are 2, 3 and host",=
 NULL);
>> +                                    "Set GIC version. Valid values ar=
e 2, 3, "
>> +                                    "host, and max", NULL);
>> =20
>>      if (vmc->no_its) {
>>          vms->its =3D false;
>> --=20
>> 2.14.3
>>
>>
>=20
> Regards,
> Daniel
>=20
