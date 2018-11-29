Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2075167wrt;
        Thu, 29 Nov 2018 00:42:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U9wq7B7v0ofFKHbROHYtxQYYReNMd714w/dgl78uS6pJ72Sr4sDzQGyI3oArUHiuFg+QVY
X-Received: by 2002:a25:8681:: with SMTP id z1-v6mr473542ybk.214.1543480959097;
        Thu, 29 Nov 2018 00:42:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543480959; cv=none;
        d=google.com; s=arc-20160816;
        b=CtpvMweO/ya+X/C+Fm6SYgcIaK2LRe9vYeI4g3MjVWCGZd0jNWNO/bMZCRg1LPaTGR
         +cyM2DPTxmti1dh4U9tCp278/MLCB80JGpvRPJ3R2dpdr/gyTNaNNNru2DOD87jb9/PW
         /W+PW7czZktSMG+o6ovNTl+++oHZCA6+Z/vjnyh/zWwWnz/n+ov6BioHz2gg/bW+3LUe
         ZopyUuHSU3qgpOzm/Eb21WaO88DyoyUNTJSw0v+2LFO5eG7Stzkx0liXxrd4JqXOtIxF
         wgCKkjmo3Kp/S3CiwhBv+SjMFW0VKf0j2Fp3tTH+fDy9US79QRNQdqHhym7zdI6nqmNd
         lV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Rw3rXwyvVdjYQHYbyP1LYs+kXVURn69jeAenFbGp0OY=;
        b=SJ6Hf6aO6whYJ3zNJIOIJ5XAPV/rWoZDTQKN+9AnseCw0bPxqFbAlabk5wUOsBUEnc
         IZmcpiEFq7+SHr7FiQ8yGOf4d3Va9jNZlgAN8mp4pk1OwLPxyd413cnpgog+NmCmFCim
         FlreW9C31JyOUV0ggrs9FvQZY13dFIyku5iw+0WC4GtbysngGopURCN09pb1uRZ97bJX
         B7xMoO65FdoT8xiOnMyj9iW7g0xRRU1u/N+w0VXhghDzajHp2D4qyRXA0srIsz8gfK82
         e+1CsqNn8c2y7AFfNC+uF5s201wj/80DtRA6VTyg+xmQ2KpxYnHlMrOmib3uWNqNrlfv
         pkaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si802865ywd.103.2018.11.29.00.42.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 00:42:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSHuA-00010O-IW
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 03:42:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gSHtz-0000yz-4Z
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 03:42:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gSHtv-00050j-Of
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 03:42:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gSHtv-0004zd-GZ; Thu, 29 Nov 2018 03:42:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB16225EC4;
	Thu, 29 Nov 2018 08:42:22 +0000 (UTC)
Received: from [10.36.117.22] (ovpn-117-22.ams2.redhat.com [10.36.117.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77EA51019628;
	Thu, 29 Nov 2018 08:42:19 +0000 (UTC)
To: Shannon Zhao <shannon.zhaosl@gmail.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20181126154616.18173-1-eric.auger@redhat.com>
	<b3c22264-2a95-b851-025c-b8ff0f38f269@redhat.com>
	<65b68704-2c0b-e9b9-2cde-fea5c32161b3@gmail.com>
	<a6e27638-1695-9608-366a-83bbbe873e55@redhat.com>
	<2c6469e1-4da1-7f9d-4525-892287c4c5c1@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8061b3b9-8857-221f-0d43-cbac25baf3e4@redhat.com>
Date: Thu, 29 Nov 2018 09:42:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <2c6469e1-4da1-7f9d-4525-892287c4c5c1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 29 Nov 2018 08:42:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build:
 Fix SMMUv3 ACPI integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TpBJx/RcHlSH

Hi Shannon,

On 11/29/18 3:24 AM, Shannon Zhao wrote:
>=20
>=20
> On 2018/11/29 1:26, Auger Eric wrote:
>>>>> =C2=A0=C2=A0 struct AcpiIortSmmu3 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ACPI_IORT_NODE_HEADER_DEF
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t base_address;
>>>>> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t pri_gsiv;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t gerr_gsiv;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t sync_gsiv;
>>>>> +=C2=A0=C2=A0=C2=A0 uint32_t pxm;
>>> So if we use this field ,we need to set the flags with
>>> ACPI_IORT_SMMU_V3_PXM_VALID
>>>>> +=C2=A0=C2=A0=C2=A0 uint32_t id_mapping_index;
>>> And if we use this field, it needs to set the revision to at least 1.
>> But is it harmful to add those fields in the struct as this patch does=
?
>>
>> - in our case ACPI_IORT_SMMU_V3_PXM_VALID flag is not set so the field
>> value is ignored according to the spec and arm_smmu_v3_set_proximity()
>> will not do anything.
>>
>> - SMMU control interrupts are all GSIV based so spec says that deviceI=
D
>> index is ignored.
>>
>> So eventually the fact the struct size is changing over the revisions
>> does not look a problem because the node length is part of the struct
>> and the offset to the ID array also is part of the structure.
>>
>> So I could have left the structure as before (because we don't use the
>> functionalities associated to those fields). But on the other hand it'=
s
>> good to upgrade the struct according to Rev D now.
>>
>> So I think the patch is correct, isn't?
> Yes, I think it's not harmful but it would be better to add some
> comments to explain why we don't increase the revision number ATM.
OK thank you for your input. I will repost for 3.2 and will upgrade the
table structs and their associated revision fields.

Thanks

Eric
>=20
> Thanks,
> Shannon
>=20
