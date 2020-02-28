Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp752097lfg;
        Fri, 28 Feb 2020 06:50:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZ4Sr6TmnfOaaTNZbD8Ejas+US2GF2pvoMY4Vo4muDp9QaNwwBGs8k80MvrAV/VkcMNXUN
X-Received: by 2002:a37:7c47:: with SMTP id x68mr4958172qkc.8.1582901427061;
        Fri, 28 Feb 2020 06:50:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582901427; cv=none;
        d=google.com; s=arc-20160816;
        b=rgt+YYY4Kno5NnmFQaIqba5H47nwe28hDsGiLOiO7H40CPaYaZe5WyK5Sb5i2OJMFs
         uPAUFVtRcLGnwGuXcQ7GxxJkgBRFWSA8xYrhtYlNx5ynt+IKt5Q987/0XiW4RC9/64+0
         r5imHu0lQvHEXi+xePlNVRcxBwvoMCcLRmVpxtqZ00hbylluzyRZfekZgTzuxYeR0+sr
         ve2LSA1attXz4JDGmLWt1yz5+Xl82MpAThFg0z2mT1EoIsj4XGkQB1Zj1SYuCYNNJJS8
         Xz6wDZ/N+I+QkqRw4N8LJ3d0dZfOk215mnnACz1MI2qVSEpJZSU/v6UJ2LCZAn4PkA1a
         GjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vm/HGI5r4FLAY6zJYHC901AG7U+WHBTXmP3k/OmCNrc=;
        b=zgEtsI7dW+FX1KQ2x82diLGHA1FgBgy/cG+GsgHvy259H34aKsHh8Ffc7L1HoUiiV5
         +3MUSHiCTzKdaiubt28Y4HhpIvgGwSZJgcPBDszAWATTiZtc9V1aKDjfxG3/8kQUUxTZ
         NpzY/IceNbCEbD5VqrmHJa7BytN67e7WlkGreSvlLngB6Q7gRj8b3X6cCaJ9/4g2HnkU
         crQbmTkxCOd7DJt/krdHzXA7YJNwlBmmKVlw2u+Q7K89frC+yDt63QGjrgjD7ZZcOV6l
         GtMJ4jYmEgdMOCJSM3o8iaTPPTVwLIo2Oi07n6LZtj+ht+lonCPUDnxuwSg2R/Qs8Skf
         hleQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KJe7nw0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si586760qvm.87.2020.02.28.06.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 06:50:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KJe7nw0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7gyA-0001vd-HA
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 09:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7gxv-0001uw-Un
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 09:50:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7gxu-0001ZA-JP
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 09:50:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34947
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7gxu-0001X2-EY
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 09:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582901407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vm/HGI5r4FLAY6zJYHC901AG7U+WHBTXmP3k/OmCNrc=;
 b=KJe7nw0KH81r1cIQWVilf4yAQ/4aQghDu57HXQ4CCrZ5sbF9mJTDDVFEZHUFU/+gdUTvxu
 A5qDUM0O1HTAM3LqkKwDNKWVNu99NtQ/ZpATgHkUxyfR4MNYflNWpjgkCm3dm30IiVB54O
 hzVB1cegdhN4Ssid3Am1yIal76yzWlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-7iDE79IOM2KiX5NLfemoEQ-1; Fri, 28 Feb 2020 09:50:01 -0500
X-MC-Unique: 7iDE79IOM2KiX5NLfemoEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E33B9A0CC3;
 Fri, 28 Feb 2020 14:49:59 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9203860BE0;
 Fri, 28 Feb 2020 14:49:52 +0000 (UTC)
Subject: Re: [PATCH v4 00/10] vTPM for aarch64
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226205942.11424-1-eric.auger@redhat.com>
 <4fb16117-f9d3-61af-9198-931590a46e3d@linux.ibm.com>
 <ee98e8ab-06df-e422-1ca5-f3f6a48145f2@redhat.com>
 <2413ead7-3707-acc6-7900-bb3896082051@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8ae6ca7b-34b5-b752-2bfd-4b7c2c9663f5@redhat.com>
Date: Fri, 28 Feb 2020 15:49:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2413ead7-3707-acc6-7900-bb3896082051@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DgrA9c15J8Ow

Hi Stefan,
On 2/28/20 3:37 PM, Stefan Berger wrote:
> On 2/27/20 3:07 AM, Auger Eric wrote:
>> Hi Stefan,
>> On 2/26/20 11:44 PM, Stefan Berger wrote:
>>> On 2/26/20 3:59 PM, Eric Auger wrote:
>>>> This series adds the capability to instantiate an MMIO TPM TIS
>>>> in ARM virt. It is candidate to qemu 5.0.
>>> I queued it now here:
>>> https://github.com/stefanberger/qemu-tpm/commits/tpm-next
>>>
>>> I will send the PR within a few days. Thanks!
>> Thank you. I will just ping Peter to make sure he has no comments on
>>
>> [PATCH v4 06/10] hw/arm/virt: vTPM support
>=20
>=20
> The little dent is now an arm boot failure:
>=20
>=20
> https://travis-ci.org/stefanberger/qemu-tpm/jobs/655573347?utm_medium=3Dn=
otification&utm_source=3Demail
is this really related to the sysbus TPM-TIS addition? I have the
impression cubieboard acceptance tests (ARM 32b) are failing. I touched
ARM virt machine.

Thanks

Eric
>=20
>=20
>=20
> Have a look at the raw log.
>=20
>=20
> =C2=A0=C2=A0 Stefan
>=20
>=20
>=20

