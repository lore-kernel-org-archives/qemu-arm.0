Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp923257wrt;
        Tue, 20 Nov 2018 10:55:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XfA2hLYCsmsqWYYpjzSwQZ6Bacu3KaCceySw+y6srdOdLHsXQw5rxre2BW9270yGFzbDql
X-Received: by 2002:a81:e408:: with SMTP id r8mr1746176ywl.367.1542740110476;
        Tue, 20 Nov 2018 10:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542740110; cv=none;
        d=google.com; s=arc-20160816;
        b=nuBZF/OoEtgRJ415pH4iW1hd4eocosnNZs7LNa4fE/7us3cUMgcniT+7xggDKOzvZp
         yw2F9uo5H3S5XuNX2fAxgP/CbUDd4f8a2NNC5rnZ1JonpTn8bTWEV0ymIvxCZEFSnuSv
         /RFDjYX6CSg9GtucpLUFSAHxW/2MrcQB2LVnEBbSrXZvccKunw/HCFtesBCFa5C4Xn1d
         iKzUocOdAMiHukF/d0YHSlb0mAoFq4rq/Dgbr86V0n6GcsBWgW3TsZ+vFhH1KRzvpCEo
         OgBm6b5+8Is6o3HS/aOBw75KIbmtzdCoG8FHm8O7JX2pVSU7DC60Chreo7ASOsBFK/1p
         RfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=uVcZV3rypEk2KRj4arWaJ77aHkJirqHq5s2F9c1SLY4=;
        b=Lv7RgRu2aYqcKNtXxwzsNJpb8unogT4cq5LDMU3SYArajwjNogEkOFhCRv9iWurI42
         Jzj6C8N32TyzTnqE2sg0nmfWvlmzxXqui8XYyUgzhjy1ILxSODJ+IOIC1H6UBmANJ2O5
         tuNy/zYBDJVSKVthNqiilX+DfJ3hoF8AgL20P3F05+8HX88PWFiy9p+jeO9le7TijcvU
         5LFfILb71dWFxmyyo7plW1442J1g7mtqlBg9Owwht+J1iYIfCT/nYhntk4irL/TNBDLq
         iKn8fB6pngY8Dvp6Yep9eyUfdHmB6+S8sE2fbGlq6a6FN51Vr6h6viYtGizSdWVOuLMc
         SC2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x66-v6si27011512ybg.132.2018.11.20.10.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 10:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPBB0-0008GU-0b
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 13:55:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gPBAY-000880-RJ
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 13:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gPBAT-0001db-OQ
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 13:54:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gPBAT-0001b5-Da; Tue, 20 Nov 2018 13:54:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3A22309174F;
	Tue, 20 Nov 2018 18:54:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-171.rdu2.redhat.com
	[10.10.120.171])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C40CE3DA9;
	Tue, 20 Nov 2018 18:54:24 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-3-marcandre.lureau@redhat.com>
	<20181120173324.64a36d8e@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d84bafe2-184b-bc62-9cde-0d1421cb484d@redhat.com>
Date: Tue, 20 Nov 2018 19:54:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181120173324.64a36d8e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 20 Nov 2018 18:54:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 02/14] qom: make
 interface types abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f8dSvea8Xdoj

On 11/20/18 17:33, Igor Mammedov wrote:
> On Wed,  7 Nov 2018 16:36:40 +0400
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
>=20
>> Interfaces don't have instance, let's make the interface type really
>> abstract to avoid confusion.
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  include/hw/acpi/acpi_dev_interface.h | 6 +-----
>>  include/hw/arm/linux-boot-if.h       | 5 +----
>>  include/hw/fw-path-provider.h        | 4 +---
>>  include/hw/hotplug.h                 | 6 +-----
>>  include/hw/intc/intc.h               | 4 +---
>>  include/hw/ipmi/ipmi.h               | 4 +---
>>  include/hw/isa/isa.h                 | 4 ----
>>  include/hw/mem/memory-device.h       | 4 +---
>>  include/hw/nmi.h                     | 4 +---
>>  include/hw/stream.h                  | 4 +---
>>  include/hw/timer/m48t59.h            | 4 +---
>>  include/qom/object_interfaces.h      | 6 +-----
>>  include/sysemu/tpm.h                 | 4 +---
>>  target/arm/idau.h                    | 4 +---
>>  tests/check-qom-interface.c          | 4 +---
>>  15 files changed, 14 insertions(+), 53 deletions(-)
>>
>> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/ac=
pi_dev_interface.h
>> index dabf4c4fc9..43ff119179 100644
>> --- a/include/hw/acpi/acpi_dev_interface.h
>> +++ b/include/hw/acpi/acpi_dev_interface.h
>> @@ -25,11 +25,7 @@ typedef enum {
>>       INTERFACE_CHECK(AcpiDeviceIf, (obj), \
>>                       TYPE_ACPI_DEVICE_IF)
>> =20
>> -
>> -typedef struct AcpiDeviceIf {
>> -    /* <private> */
>> -    Object Parent;
>> -} AcpiDeviceIf;
>> +typedef struct AcpiDeviceIf AcpiDeviceIf;
>> =20
>>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
>> =20
>> diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boo=
t-if.h
>> index aba4479a14..7bbdfd1cc6 100644
>> --- a/include/hw/arm/linux-boot-if.h
>> +++ b/include/hw/arm/linux-boot-if.h
>> @@ -16,10 +16,7 @@
>>  #define ARM_LINUX_BOOT_IF(obj) \
>>      INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
>> =20
>> -typedef struct ARMLinuxBootIf {
>> -    /*< private >*/
>> -    Object parent_obj;
>> -} ARMLinuxBootIf;
>> +typedef struct ARMLinuxBootIf ARMLinuxBootIf;
> I like how it makes interface truly opaque and removes the need for
> structure declaration but:
>=20
>  1: I'm not sure if it's acceptable thing to do from language point of =
view

Yeah, it's fine. If you have just

struct ARMLinuxBootIf;

(and, optionally, a typedef to it,) then this type is called an
"incomplete type" (for translation units that don't see the actual type
definition). You can't apply the "sizeof" operator to it, you can't put
it in other structs and arrays etc. I'm too lazy to look up the exact
details in the C standard now. :) But, importantly,
"pointer-to-ARMLinuxBootIf" is a complete type, and you can do all the
usual things with that. (Define variables of that pointer type, embed
them in other structures, use it as an array element type, pass them to
functions, and so on.)

Thanks
Laszlo

>  2: For a reader not aware of a trick, it's sort of confusing to have f=
orward declaration but without structure itself. So if #1 is acceptable w=
e probably should document interface trick in object.h
>=20
> [...]
>=20

