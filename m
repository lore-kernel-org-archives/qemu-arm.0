Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1698429lfi;
        Thu, 2 Apr 2020 01:50:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypLr+F4SSkrSaaS6ND7E8oiRJUzhhJylEMQ+zCXak/JUL5wmHPkL4lML5SfPD1jCxg9VnfzQ
X-Received: by 2002:a4a:d44d:: with SMTP id p13mr1867409oos.5.1585817459763;
        Thu, 02 Apr 2020 01:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585817459; cv=none;
        d=google.com; s=arc-20160816;
        b=zL8gSnbQHnIvDIzdcL7DPcwCAEU/55ITg2QTQFXZ1YcrZ3Dx++ETSx2YS7Q9rEd0tg
         cdPr1dT8o91OTkYcJ2wGRUNWydMYDmKwetFCeQVblkQCNRUVyTNT2VEQsnxSiSfPHcWt
         qR3Djopc5hoYUoocHzEM1uxWys2xLO9ojx1YOR8guv0SdbPyQniW9Tq9/W/Tri98JrBv
         UMxT+V51kJiheJnE55+wr3Og1VWuviHA3U1c1dpOrL3uANcQLd3B9MUFqLb+ZdlmpMUw
         f80SUv9Xk6jNvZ3/hTuvQ9hiboeXHGw2tNAFMzoBGemDJpT/6Tpv/zIWIMQ88YtkoEFn
         JpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=o2ROWoA/Q4kopE0GRuJxFR1Mdzx26gimKSY4bj8fFeY=;
        b=tAWjWEQuYhOodFXMAH8CbiQJOkUFGPclevPJ6L41iNpWKWWgxhKfuClqrgB+d0GOq0
         30Dxx3d5Q9tT/2dpt+ImN94sQMTFeM0pXkG1yZlXzO3ERAeroIjqQ9MZ7Fumuc/14VEl
         XmbxJlyjBfmicK59FpdZqev/OhET4BweurTL3EHwtalsQjBHqnGSEUtEr7OvGHQCCdkW
         EddCZIulEh3uLWGkJmxL+f2QreuQi0UMLq1iAX3J3vRRyoGLY6cN/lNW2ID8NSKtjfgq
         b08JD7+xZ04Ia+ytNU8dLEKlJhIWUPpvlvv0gdnbKxL0ASgXMftukxqo1cjK8A998vKx
         BGHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JCX+YArr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n24si2101402otr.217.2020.04.02.01.50.59;
        Thu, 02 Apr 2020 01:50:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JCX+YArr;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbgDBIu6 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Apr 2020 04:50:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52507 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728612AbgDBIu6 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 2 Apr 2020 04:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585817456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o2ROWoA/Q4kopE0GRuJxFR1Mdzx26gimKSY4bj8fFeY=;
        b=JCX+YArr43XTVC3iGJfm+yjnCJOb9By03p+Vx2Fz6kXWO1A+Mu9NBGJMPF8T532021CK9X
        UtSilwn+iOXhwYp1QLTqCnnF5LF3XzIShKQzd5Yj4dXQy89ZNN8WEPqJQ7tICxO0UL8Szf
        p3K6n6jyJk5kIHPjMh8yhqXXfcVeHvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-unMlZHFhMauk_GWmxdC6XA-1; Thu, 02 Apr 2020 04:50:53 -0400
X-MC-Unique: unMlZHFhMauk_GWmxdC6XA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69005800D6C;
        Thu,  2 Apr 2020 08:50:50 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9451C933;
        Thu,  2 Apr 2020 08:50:47 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v7 10/13] arm/arm64: ITS: INT functional
 tests
To:     Zenghui Yu <yuzenghui@huawei.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, drjones@redhat.com,
        andre.przywara@arm.com, peter.maydell@linaro.org,
        alexandru.elisei@arm.com, thuth@redhat.com
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-11-eric.auger@redhat.com>
 <f7f1d7c4-2321-9123-2394-528af737bfa7@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <fa4e14f6-20ee-982f-0eda-74b101cddf7a@redhat.com>
Date:   Thu, 2 Apr 2020 10:50:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f7f1d7c4-2321-9123-2394-528af737bfa7@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 43H6EEakOGho

Hi Zenghui,

On 3/30/20 12:43 PM, Zenghui Yu wrote:
> Hi Eric,
>=20
> On 2020/3/20 17:24, Eric Auger wrote:
>> Triggers LPIs through the INT command.
>>
>> the test checks the LPI hits the right CPU and triggers
>> the right LPI intid, ie. the translation is correct.
>>
>> Updates to the config table also are tested, along with inv
>> and invall commands.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> [...]
>=20
> So I've tested this series and found that the "INT" test will sometimes
> fail.
>=20
> "not ok 12 - gicv3: its-migration: dev2/eventid=3D20 triggers LPI 8195 =
en
> PE #3 after migration
> not ok 13 - gicv3: its-migration: dev7/eventid=3D255 triggers LPI 8196 =
on
> PE #2 after migration"
>=20
> From logs:
> "INFO: gicv3: its-migration: Migration complete
> INT dev_id=3D2 event_id=3D20
> INFO: gicv3: its-migration: No LPI received whereas (cpuid=3D3,
> intid=3D8195) was expected
> FAIL: gicv3: its-migration: dev2/eventid=3D20 triggers LPI 8195 en PE #=
3
> after migration
> INT dev_id=3D7 event_id=3D255
> INFO: gicv3: its-migration: No LPI received whereas (cpuid=3D2,
> intid=3D8196) was expected
> FAIL: gicv3: its-migration: dev7/eventid=3D255 triggers LPI 8196 on PE =
#2
> after migration"
>=20
>> +static void check_lpi_stats(const char *msg)
>> +{
>> +=C2=A0=C2=A0=C2=A0 bool pass =3D false;
>> +
>> +=C2=A0=C2=A0=C2=A0 mdelay(100);
>=20
> After changing this to 'mdelay(1000)', the above error doesn't show up
> anymore. But it sounds strange that 100ms is not enough to deliver a
> single LPI. I haven't dig it further but will get back here later.

Did you find some time to investigate this issue. Changing 100 to 1000
has a huge impact on the overall test duration and I don't think it is
sensible. Could you see what is your minimal value that pass the tests?

Thanks

Eric
>=20
>> +=C2=A0=C2=A0=C2=A0 smp_rmb(); /* pairs with wmb in lpi_handler */
>> +=C2=A0=C2=A0=C2=A0 if (lpi_stats.observed.cpu_id !=3D lpi_stats.expec=
ted.cpu_id ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpi_stats.observed.lpi_id =
!=3D lpi_stats.expected.lpi_id) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lpi_stats.observed.cpu=
_id =3D=3D -1 &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lp=
i_stats.observed.lpi_id =3D=3D -1) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
port_info("No LPI received whereas (cpuid=3D%d, intid=3D%d) "
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "was expected", lpi_stats.e=
xpected.cpu_id,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpi_stats.expected.lpi_id);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
port_info("Unexpected LPI (cpuid=3D%d, intid=3D%d)",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpi_stats.observed.cpu_id,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpi_stats.observed.lpi_id);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass =3D true;
>> +=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 report(pass, "%s", msg);
>> +}
>=20
> This patch itself looks good to me,
> Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
>=20
>=20
> Thanks
>=20
