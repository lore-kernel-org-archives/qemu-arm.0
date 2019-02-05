Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4760718wrt;
        Tue, 5 Feb 2019 05:22:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaLLKcWdbmMqt2HKVgQj7O53PRceT2Qb4kEE9Rk4EhWx+hxIgiROU44McGpVYiCrs3g1D4A
X-Received: by 2002:a25:bc8d:: with SMTP id e13mr3988620ybk.0.1549372942454;
        Tue, 05 Feb 2019 05:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549372942; cv=none;
        d=google.com; s=arc-20160816;
        b=C1ALx4mpDxk40iITWvC3e+ItL2Y7HOomWZ24rOUBNeAOnl6Ak7OIg2/3FFO4cABkIV
         3V5Wj+B9BlqTE10lcWSVCwtkLAlvAQQ7sbOCbLsGcAp73xy6Sp/vTikYXhB9u8mHUPuN
         G0FAQd/GTNKTCPnY7k3N7z0kNUpqsYkGYqwV/sLmbm8uYhC4eak8gXSkf30CKad2C2KH
         i6CJOIOi4IcreKGYtgIjzBfbIFCiIF6Tt1YoC/A6LVKagwJYTTJR83Loip8HCNEVn66r
         MiCOQQG1IMxkrzWEtX1U9tjs6Vpb3GiZtjAqDjZZRK8W/I0pfYfchW+uM3zlT3AyrETm
         Tljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=HlOxhKr8UYZ5lKWl1Gwpdh8UVsuNMSAg6iuEeKsZLd8=;
        b=GQ0rX7KBfzz3hH6styKudrByuw62lzX+6AP0Z92zkhdXGPGa1oc/0yttWNtoRPcWC8
         9sthNSq1/wxys+WVT3ROVdSVPjThpK+mRRfH36owiYvuj0KG1n4jI8KseaNSHydelDKW
         EZm+7WNIy20nBUaUoplwn0xyw8MsvutuMdTccGA1XBIDOqMGyYJkZS5PlR/NsppL5lZA
         8F9m1BucD8E/eM/G8GaA/Ab0rxV9nL3IkSj7YKMVKvfrNF4CH8xXj8KCDYhZlWGZAQPO
         Zk1zG6LwwRpTp4RfoApwm4qya7iHTFyXDk9Hp698/mgdWsBGBE2pt/hOT0JE//f7+leN
         xB+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c184si1908344ywe.156.2019.02.05.05.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr0g9-0001K5-QK
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gr0fu-0001JB-2h
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gr0ft-0004P3-C1
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:22:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gr0ft-0004Ny-4Q; Tue, 05 Feb 2019 08:22:05 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A71FA81DE3;
	Tue,  5 Feb 2019 13:22:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-166.ams2.redhat.com [10.36.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04BC51724D;
	Tue,  5 Feb 2019 13:21:59 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9PKSW92GJO1KcBEQcbGY7TB4pqaW8qSe9j6JJZ7Z2MKA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <b23135c0-50d7-f203-5cfe-63cd0fa27377@redhat.com>
Date: Tue, 5 Feb 2019 14:21:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9PKSW92GJO1KcBEQcbGY7TB4pqaW8qSe9j6JJZ7Z2MKA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Feb 2019 13:22:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/cpu/cluster: Mark the cpu-cluster device
 with user_creatable = false
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kf9q9xdJQMxS

On 2019-02-05 14:09, Peter Maydell wrote:
> On Tue, 5 Feb 2019 at 12:58, Thomas Huth <thuth@redhat.com> wrote:
>>
>> The device can not be instantiated by the user and QEMU currently
>> aborts when you try to use it:
>>
>> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
>> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>>  Assertion `cbdata.cpu_count > 0' failed.
>> Aborted (core dumped)
>>
>> Since this is an internal device only, mark it with user_creatable =3D=
 false.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/cpu/cluster.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
>> index 25f9070..6f5f037 100644
>> --- a/hw/cpu/cluster.c
>> +++ b/hw/cpu/cluster.c
>> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klas=
s, void *data)
>>
>>      dc->props =3D cpu_cluster_properties;
>>      dc->realize =3D cpu_cluster_realize;
>> +
>> +    /* This is not directly for users, CPU children must be attached =
by code */
>> +    dc->user_creatable =3D false;
>>  }
>>
>>  static const TypeInfo cpu_cluster_type_info =3D {
>> --
>=20
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Would it be possible to add a 'make check' test that every device
> we claim to be user-creatable can be created without crashing ?

That's what Eduardo's scripts/device-crash-test is good for. It's just
too slow to run during "make check" currently, since it checks each
device with each machine type... But IIRC Eduardo once had ideas to
improve this...?

 Thomas
