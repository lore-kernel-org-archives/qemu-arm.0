Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8723093lff;
        Thu, 16 Jan 2020 10:18:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/FsCDxIhCULPyiJtlfESItQteVslWSxJ4BLzn4JZ9Iv0oR4+t2Tjuz9mni9bR/saL7OP/
X-Received: by 2002:ac8:6910:: with SMTP id e16mr3640572qtr.273.1579198714078;
        Thu, 16 Jan 2020 10:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579198714; cv=none;
        d=google.com; s=arc-20160816;
        b=PbJ1UJ7g7ZnjDCzOgv+7HJJEQtyJqxJB197iRfHhxUR+IdTXg/wNhPx3NzUCp6s1g4
         rzo6YlnmJ4HzCp7qLpDYPYg0okrCr8GeraCrY8Xuzjse0//IkE6HYVIpddVxkxElYavO
         c7QOp9tbUR0decwKJi7NEEmCu1bN0OU5iGNkzH0m4nJ1Ho8jrkZ2IIo2m85swq9uWNEC
         xPNmwDeECfLfIW4+66fTgJQpi8m+RT3CYcln9CDsuzIpch3p3k6wMpEefimCLgWwI/AP
         o+gX26OfYn19Gypt/8QQoxUxP192acWpw1uLQXRrRCl5YcxgunynS0v6QIhQkNB2oihH
         rNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8TS92KNPOQ3Casj1UAe3qTkGLAjBTil5WalvRii5b0c=;
        b=BQ/shxtaQUCgBIglTnx5i7pdgOIONBgi9kYIkTEXDIvx4keXuqE2U2GVRbR1pbALJR
         7VnO/hxN6jEWhvNCRUOzpRBd/9/zOqtvBjp9+OH4lH+lNESQVd0//sL7suDR3AdYOq3+
         lfLmzXj8HwwBvIxbmqLLqEJ56yRw5J3v7vlzWFXumIhs1maKfb+RrGJux4CXngPXmn1a
         bKgOdUhLx8oiJUGxLHlsrr1REXhL8AnezPVuFGAqLbBOIRGxqx4HTQYgGSSkzoXiw2T0
         WCZFiHcST0TAAURUzbFipH630JzdHMUL5P7i88iiFC2gMyKFU9Q1aL2/pOhfN+d7oUh8
         Kv1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QP3w3QZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si12917931qvr.92.2020.01.16.10.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 10:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QP3w3QZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9iz-0005St-B7
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 13:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is9ib-0005K1-Mf
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:18:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is9iY-0006N7-9N
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:18:09 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is9iY-0006Ma-6J
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 13:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579198685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TS92KNPOQ3Casj1UAe3qTkGLAjBTil5WalvRii5b0c=;
 b=QP3w3QZW1kme7rtom+khph7HW1cUMoQUwhLzaqtJthrKSSL5Md7AkyIcvt1LnnLe2ZAHn4
 bn/0XgWHVx7KvpQR725R1LGe9KM23eZ+Hwh4b1JsnPALJVqVT4bKc16hRcM22SnTciz9k8
 logimicCZYLO/17N9TSEvlG+B7w6fDU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-nic3rBhxOmyt0lrbnPtDdw-1; Thu, 16 Jan 2020 13:17:56 -0500
Received: by mail-wm1-f71.google.com with SMTP id l11so2561166wmi.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 10:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aLZiOjhgeh5lCktLBRbCgm3aR8OMd0lwmQ4APTSbkO0=;
 b=a2QE1xZJeBgLA9eI3OVBnj6TGgAdig17BypcYl4D1wFye0ZTXDZUfskpbXZl6uIsKW
 q3lTjyy9TT5Uzc5TsXnnBnksy7fS7EsVAZPI2ubWgnsgSPW1WQCgqe74qGCrQxOZnY4S
 +ofjpznq4HER9Fk+zHpOd/4hGfmrqIU3u2OyhxATJEaYe11Q6V3iNjTN0j2F/d3e8Onc
 PZt9Px224/zK7chiPx6yNp11+pIvClkRN/xCySGwCMM1xO2Va/S8ClsNZSmwuJaIhqrI
 ABcwgN7xphM/0YIE8vwD00sVbUd1R2mjUMaWRy3GH6fUTrafoa5uinYGT8Xe1n0WogmT
 /G3A==
X-Gm-Message-State: APjAAAWRSR5qSWx1nwMHgAiGFl+qNjN7FCVhA1qBVj6Wqy9qFUBcIgF0
 PjACQbLoDk3sdBBix8MgWKmj/3p2x/QmGcEC3SrYayFU+iOykbRW1lFXrU9SlYjNS8kg9xQESJA
 1hrZ4XouULNdG
X-Received: by 2002:adf:ca07:: with SMTP id o7mr4720102wrh.49.1579198675654;
 Thu, 16 Jan 2020 10:17:55 -0800 (PST)
X-Received: by 2002:adf:ca07:: with SMTP id o7mr4720080wrh.49.1579198675428;
 Thu, 16 Jan 2020 10:17:55 -0800 (PST)
Received: from [10.101.1.81] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id s8sm29411686wrt.57.2020.01.16.10.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2020 10:17:54 -0800 (PST)
Subject: Re: [PATCH v2 10/86] arm:aspeed: use memdev for RAM
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-11-git-send-email-imammedo@redhat.com>
 <8473fe69-36da-35f7-930b-f800bb899732@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2184f034-821e-53c9-b9f5-b834d5a59b34@redhat.com>
Date: Thu, 16 Jan 2020 19:17:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8473fe69-36da-35f7-930b-f800bb899732@kaod.org>
Content-Language: en-US
X-MC-Unique: nic3rBhxOmyt0lrbnPtDdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 joel@jms.id.au, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cNAzumlVJJaJ

On 1/16/20 10:24 AM, C=C3=A9dric Le Goater wrote:
> On 1/15/20 4:06 PM, Igor Mammedov wrote:
>> memory_region_allocate_system_memory() API is going away, so
>> replace it with memdev allocated MemoryRegion. The later is
>> initialized by generic code, so board only needs to opt in
>> to memdev scheme by providing
>>    MachineClass::default_ram_id
>> and using MachineState::ram instead of manually initializing
>> RAM memory region.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>=20
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>=20
> We need to check 'max_ram' is still needed. I remember that old firmwares
> were testing the RAM size by doing write/read checks at the top of the RA=
M.
> This was breaking QEMU sometime ago.

Do you remember any version we can use to test this? Also add to our=20
acceptance tests.

> C.
>=20
>> ---
>> CC: clg@kaod.org
>> CC: peter.maydell@linaro.org
>> CC: andrew@aj.id.au
>> CC: joel@jms.id.au
>> CC: qemu-arm@nongnu.org
>> ---
>>   hw/arm/aspeed.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 525c547..330254b 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -35,7 +35,6 @@ static struct arm_boot_info aspeed_board_binfo =3D {
>>   struct AspeedBoardState {
>>       AspeedSoCState soc;
>>       MemoryRegion ram_container;
>> -    MemoryRegion ram;
>>       MemoryRegion max_ram;
>>   };
>>  =20
>> @@ -184,6 +183,7 @@ static void aspeed_machine_init(MachineState *machin=
e)
>>  =20
>>       memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-containe=
r",
>>                          UINT32_MAX);
>> +    memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
>>  =20
>>       object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
>>                               (sizeof(bmc->soc)), amc->soc_name, &error_=
abort,
>> @@ -215,8 +215,6 @@ static void aspeed_machine_init(MachineState *machin=
e)
>>       object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                                &error_fatal);
>>  =20
>> -    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_si=
ze);
>> -    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
>>       memory_region_add_subregion(get_system_memory(),
>>                                   sc->memmap[ASPEED_SDRAM],
>>                                   &bmc->ram_container);
>> @@ -393,6 +391,7 @@ static void aspeed_machine_class_init(ObjectClass *o=
c, void *data)
>>       mc->no_floppy =3D 1;
>>       mc->no_cdrom =3D 1;
>>       mc->no_parallel =3D 1;
>> +    mc->default_ram_id =3D "ram";
>>   }
>>  =20
>>   static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *=
data)
>>
>=20
>=20

