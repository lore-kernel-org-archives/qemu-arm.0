Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5623511wrw;
        Wed, 14 Nov 2018 04:01:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5e+Zq1pyu7cS/5ql6XGrtmeusKA6DCaSmHTEKmn1hyvXho8DOza8yTEJ8rLwsK2XlQGew4v
X-Received: by 2002:a0c:ae67:: with SMTP id z36mr1424466qvc.230.1542196865707;
        Wed, 14 Nov 2018 04:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542196865; cv=none;
        d=google.com; s=arc-20160816;
        b=KsSmGX6AV2U1cQVZrUuJStuF786swqXi1HgBPAClngknTQgEUFiWVHglydO47duKtJ
         SDG0DASdLsNcIeZekkGJMNvDOMoTQpoXMEqipN25QoIoS8epYxVzXlqwwMqN94vrWMzB
         Jmp4C8JtoRwU/Z2Og9APNcyopBuu4a6o9y2cRWRBq/VqHH9q4JtNn7Y68DCHJSUWQ0TV
         U121g4Y6vUk2ReJ4y1C+hLgZcLZX9E8LRsbLbVyftcyENy+uZclr56I3hcYxH/szISkx
         tRDk6i9/a7LXPcM1RzRjulEImPe7MFl1uzyatnPldGxCpyWESmcZjodPQ+u3E9tz253l
         DgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=CaFQ8kJ1ytGntmPAyVmZVx+XPQmmm/rfbMbMAmVYT/w=;
        b=HVEw3OtfT+P9jXOFWoZuKPjjsdII096SRs4pdtaMJm3oxD2p0oJBhF4UyjXIu4J+X4
         b0Rn3o+kLqGxjMrV7SvvRTRaqgHXIc6RQTp2moftKubp0yux22fTGs+7RZlZrTOEGQLB
         /8Cu2pFJ8TOEdjAPRsEtYpEO1qFJLVj/kKDxQohQL0qZkRAAYY7k5SksUfQtUA0jDwc/
         swomW2s0KM+nSKDUWFwdsIzJD++k+w71L1/l6vcsEmQOgIovafIHux4HaUSzRIqPZp43
         fbzH5/uyltGLHdS9LtKJs8FzbsM4qsz2X/VRWskFteE41MyWBUuiI2BJ06phGeI/9EMi
         buDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si6758884qtc.127.2018.11.14.04.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 04:01:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMtqz-00007l-8a
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 07:01:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMtqp-00007W-22
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 07:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMtqj-0002mU-DF
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 07:00:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43918)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gMtqj-0002kk-57; Wed, 14 Nov 2018 07:00:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06D9A6060A;
	Wed, 14 Nov 2018 12:00:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-163.ams2.redhat.com [10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8EB860851;
	Wed, 14 Nov 2018 12:00:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <1542184999-11145-1-git-send-email-thuth@redhat.com>
	<3ba66e6c-2eeb-2352-252b-75487ad91916@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <93d68204-145c-28ce-e6d0-4a67d3c55b00@redhat.com>
Date: Wed, 14 Nov 2018 13:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3ba66e6c-2eeb-2352-252b-75487ad91916@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 14 Nov 2018 12:00:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Add entries for
 missing ARM boards
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
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XlW6EcHdovfZ

On 2018-11-14 12:57, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 14/11/18 9:43, Thomas Huth wrote:
>> Add entries for the boards "mcimx6ul-evk", "mcimx7d-sabre", "raspi2",
>> "raspi3", "sabrelite", "vexpress-a15", "vexpress-a9" and "virt".
>> While we're at it, also adjust the "i.MX31" section a little bit,
>> so that the wildcards there do not match anymore for unrelated files
>> (e.g. the new hw/misc/imx6ul_ccm.c file).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> =C2=A0 MAINTAINERS | 70
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>> =C2=A0 1 file changed, 65 insertions(+), 5 deletions(-)
[...]
>> @@ -604,6 +651,12 @@ L: qemu-arm@nongnu.org
>> =C2=A0 S: Maintained
>> =C2=A0 F: hw/*/stellaris*
>> =C2=A0 +Versatile Express
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>=20
> Shouldn't this be 'Supported?'
> "Someone is actually paid to look after this."

Not sure whether Peter is paid for looking after the Versatile Express
board??

>> +F: hw/arm/vexpress.c
>> +
>> =C2=A0 Versatile PB
>> =C2=A0 M: Peter Maydell <peter.maydell@linaro.org>
>> =C2=A0 L: qemu-arm@nongnu.org
>> @@ -611,6 +664,13 @@ S: Maintained
>> =C2=A0 F: hw/*/versatile*
>> =C2=A0 F: hw/misc/arm_sysctl.c
>> =C2=A0 +Virt
>> +M: Peter Maydell <peter.maydell@linaro.org>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>=20
> This one is certainly 'Supported'.

Maybe ... Peter could you adjust this when picking up the patch?

 Thanks,
  Thomas
