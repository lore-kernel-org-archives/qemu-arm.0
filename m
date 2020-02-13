Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp850772lfp;
        Thu, 13 Feb 2020 09:09:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxh8zPF9iIv0K4f7qFfXtHczegHe/fVurDdfrvxleCHhc2DfuM6QvrEapaM2RVcz2d1nFNB
X-Received: by 2002:a37:396:: with SMTP id 144mr5535984qkd.260.1581613794752;
        Thu, 13 Feb 2020 09:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581613794; cv=none;
        d=google.com; s=arc-20160816;
        b=G4+VJaD1WsFJXLD9WpMPlfBzH9pdPH0MDW/SpZALLql1Qw19lGc+OkR+WeT0GX3DGm
         noZZ2GUunHRO18kC/ykQ8X3dZth9PZ50qPvFZafqVvNMJrjoQISCztLBY9rOT4thJ2sh
         vWAVPt0NKcTTkVlee64bLPN/9sofkNzx3MRFN2hp96JgscbVY41RsdZdIGfvrPMqx152
         NPDrYduf35C797Xy5k3FYNUya83Pj8zc3bNbs31/ckAoEB3mXcKMkf/XqkzazZBWq9fi
         Ab8s3XtS2LLpORQ13oRxQBEsk+8ganp5f4i+Hmjk6Yxt4MXzzHU1tJ7cinqq9lvZ9t8T
         6zgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:references:to:from:subject
         :dkim-signature;
        bh=U+T+5pGfapfOW/JE6R+W4Hjw+MWSOR6MG3HUewC3RdQ=;
        b=CRiHE0TwfY+XvZVa9kHejglhgov4x3Pn1kvux3Na52ahEwnSFo7+mqOvOtWVLeMlzY
         8VVMK02iLRV9LFBBlEDmGYt2igZjt1lYPM0CzSCJkuG30EgXtKLfxxNAtfONsdgwgaVF
         CVD0J/RAbCAmrhwuUzdj8M61Erxnejak85eX6gjE2p9yO06za12Kvdu1XStl/vDQ3PfO
         Jp67v0bQlW2uuC3JPK8bSGczBT/aRm56xdgWOSpd+bjhgUjMnGQilsw5bRfgVgSmTS4I
         au0G8vISQ2gVQRiIDRtrCZoWkz9SYat9eDDpx+uqECMggsBUCZxP8aZQfvZ3taa4kkLV
         BUjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BJVvgPtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si1501677qki.273.2020.02.13.09.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 09:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BJVvgPtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2Hzu-0002hJ-5i
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 12:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j2Hzi-0002di-J4
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 12:09:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j2Hzh-0002Ui-1z
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 12:09:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48185
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j2Hzg-0002SY-Us
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 12:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581613779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=U+T+5pGfapfOW/JE6R+W4Hjw+MWSOR6MG3HUewC3RdQ=;
 b=BJVvgPtGsI0PP1P6pfwb0jHQKVzkYTnZMwF9I1tjHwwRmL2ZKGyJe22HM6Mq/vFhkFrV25
 lVgAupjHxrmxyzeyPf7XJ79JYKJHsvl65WPrqFVB6cCqEedltjO2kVtIYp+opeKUcvk2fu
 z7qdeORqmyImSDsnyQrJyFSf6Cp+qF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-8hpYHMG6PMKiUXv1jMzkzA-1; Thu, 13 Feb 2020 12:09:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB9B21095138;
 Thu, 13 Feb 2020 17:09:22 +0000 (UTC)
Received: from [10.36.117.120] (ovpn-117-120.ams2.redhat.com [10.36.117.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BAF51001B0B;
 Thu, 13 Feb 2020 17:09:10 +0000 (UTC)
Subject: Re: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
From: David Hildenbrand <david@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
 <20200204162320.67e5d353@redhat.com>
 <74eaaa45-0d20-9a21-fbf8-6d29deb248eb@redhat.com>
 <4ce41554-8b8e-dbb5-5fe9-43af09950f23@redhat.com>
 <8e0b2c762e914c64bebfab5fc7441661@huawei.com>
 <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
 <52fff289cca14874ad493fc25806fe3d@huawei.com>
 <f041380c-afcb-f8d8-89db-8f48c7b46767@redhat.com>
 <e97fa28c653044b8bab66aeca2374682@huawei.com>
 <0ff4d2c1-ebd3-1d2f-07e8-a4f13be07ceb@redhat.com>
 <6bf255ecb88446f1b08ee4ab21a85f02@huawei.com>
 <69848dd3-fac4-ec6b-78a8-a052124f4fc3@redhat.com>
 <49b54eea65cd49ae832cd6ec21eae64a@huawei.com>
 <b4ccf1d9-4514-6b63-5ef9-1d337f539267@redhat.com>
 <fad66252aa8f4b46816f21b5315b6358@huawei.com>
 <8f10dd72-9a19-b910-489c-eacc6a772046@redhat.com>
 <04adb50079bc45888f514721edb3cfa3@huawei.com>
 <69ab2339-f4c3-dbd6-1be7-5d6eef28d027@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <b78f892f-c917-a3a8-4c6b-8d03af02782d@redhat.com>
Date: Thu, 13 Feb 2020 18:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <69ab2339-f4c3-dbd6-1be7-5d6eef28d027@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8hpYHMG6PMKiUXv1jMzkzA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 Juan Jose Quintela Carreira <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qrqIp+HvjezT

On 13.02.20 17:59, David Hildenbrand wrote:
> On 13.02.20 17:38, Shameerali Kolothum Thodi wrote:
>>
>>
>>> -----Original Message-----
>>> From: David Hildenbrand [mailto:david@redhat.com]
>>> Sent: 12 February 2020 18:21
>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>>> Igor Mammedov <imammedo@redhat.com>
>>> Cc: peter.maydell@linaro.org; xiaoguangrong.eric@gmail.com;
>>> mst@redhat.com; shannon.zhaosl@gmail.com; qemu-devel@nongnu.org;
>>> xuwei (O) <xuwei5@huawei.com>; Linuxarm <linuxarm@huawei.com>;
>>> eric.auger@redhat.com; qemu-arm@nongnu.org; lersek@redhat.com;
>>> dgilbert@redhat.com; Juan Jose Quintela Carreira <quintela@redhat.com>
>>> Subject: Re: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
>>
>> [...]
>>
>>>> Hmm..it breaks x86 + seabios boot. The issue is seabios expects RSDP i=
n FSEG
>>>> memory. With the above proposed change, RSDP will be aligned to PAGE_S=
IZE
>>> and
>>>> seabios mem allocation for RSDP fails at,
>>>>
>>>>
>>> https://github.com/coreboot/seabios/blob/master/src/fw/romfile_loader.c=
#L8
>>> 5
>>>>
>>>> To get pass the above, I changed "alloc_fseg" flag to false in build_r=
sdp(), but
>>>> seabios seems to make the assumption that RSDP has to be placed in FSE=
G
>>> memory
>>>> here,
>>>> https://github.com/coreboot/seabios/blob/master/src/fw/biostables.c#L1=
26
>>>>
>>>> So doesn=E2=80=99t look like there is an easy fix for this without cha=
nging the seabios
>>> code.
>>>>
>>>> Between, OVMF works fine with the aligned size on x86.
>>>>
>>>> One thing we can do is treat the RSDP case separately or only use the =
aligned
>>>> page size for "etc/acpi/tables" as below,
>>
>> [...]
>>
>>>>
>>>> Thoughts?
>>>
>>> I don't think introducing memory_region_get_used_length() is a
>>> good idea. I also dislike, that the ram block size can differ
>>> to the memory region size. I wasn't aware of that condition, sorry!
>>
>> Right. They can differ in size and is the case here.
>>
>>> Making the memory region always store an aligned size might break other=
 use
>>> cases.
>>>
>>> Summarizing the issue:
>>> 1. Memory regions contain ram blocks with a different size, if the size=
 is
>>>    not properly aligned. While memory regions can have an unaligned siz=
e,
>>>    ram blocks can't. This is true when creating resizable memory region=
 with
>>>    an unaligned size.
>>> 2. When resizing a ram block/memory region, the size of the memory regi=
on
>>>    is set to the aligned size. The callback is called with the aligned =
size.
>>>    The unaligned piece is lost.
>>> 3. When migrating, we migrate the aligned size.
>>>
>>>
>>> What about something like this: (untested)
>>
>> Thanks for that. I had a go with the below patch and it indeed fixes the=
 issue
>> of callback not being called on resize. But the migration fails with the=
 below
>> error,
>>
>> For x86
>> ---------
>> qemu-system-x86_64: Unknown combination of migration flags: 0x14
>> qemu-system-x86_64: error while loading state for instance 0x0 of device=
 'ram'
>> qemu-system-x86_64: load of migration failed: Invalid argument=20
>>
>> For arm64
>> --------------
>> qemu-system-aarch64: Received an unexpected compressed page
>> qemu-system-aarch64: error while loading state for instance 0x0 of devic=
e 'ram'
>> qemu-system-aarch64: load of migration failed: Invalid argument
>> =20
>> I haven=E2=80=99t debugged this further but looks like there is a corrup=
tion happening.
>> Please let me know if you have any clue.
>=20
> The issue is
>=20
> qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE)
>=20
> The total ram size we store must be page aligned, otherwise it will be
> detected as flags. Hm ... maybe we can round it up ...
>=20

I'm afraid we can't otherwise we will run into issues in
ram_load_precopy(). Hm ...

--=20
Thanks,

David / dhildenb

