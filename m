Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3612684wru;
        Tue, 2 Jul 2019 02:54:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYFQC9ViPN6RFUD6f8EzgUjI5103my1RCuhEErqIyoAb5TXsQ6WjTB1ixaH+LoE+DRqsry
X-Received: by 2002:a17:906:9256:: with SMTP id c22mr27510715ejx.172.1562061251494;
        Tue, 02 Jul 2019 02:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562061251; cv=none;
        d=google.com; s=arc-20160816;
        b=gLt6RD+vB63rHpv0turMLEgOm8vQ+qF4LZpaR5VqvMUt5eD6QjCPVaUJ/gr3S1jJaM
         A/eCftbK6hVcpLKEL4bZODcWPMudECgPx0gu0ICoIIJZ2bFQeK0nuh0lO60pB5jdl74K
         1rOAuv00BnUsMDyvppL4ErUkJDwPj9xRDpArzNKD+OyoKAjsLg5zLDM6fffGlhrM1KuJ
         7r7hLJjWBQ2R+khpyI14b7d9XAk5WdZkjcEqZtvA2k5Oc2wSxk8Y/1Pd4tx94tEYTvU5
         n/n9vUkHIBZhYemwNn/agn27zrvmI7YgO27BaQQ907OxBjBZWFWqBlG+BHzzJ1VZ+IJx
         NKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ROfel/1A7IUCChpL3uEvHFI+bcO0bxwoBYn+Z4EB3gc=;
        b=mTh2bv7YqNi+PisZV0cny4+1OsLeJQo5Su+wx5SYmqVypAGjYuyzvz9DQ1wXx4YoS9
         DO7F5N45HsTo1xhdiHQITCsjSMJpTCmEdpa7oyWaWJEMjh6eRQcljAq/wgD8JSwVa/vb
         AJ8fQLc1E1JpNnmRZF6ktPzSCM/qr3lOmGsqGPGrCTIe9KTqBKJV6rvg/pMgk6iSc/WI
         bCWQT1mjenZlRIdAFzb1dycQ+HsFJ1pNhILOaGiJT+vkOUKYXOBV4+47g/fazoPzvH9M
         GJvds0gNBrTNQudchWrpXTVy+WHxCB1RUISIbwcHpuLFUbmLrzovCSFTcauRcmv1xPk2
         mlRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si11058522ede.349.2019.07.02.02.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 02:54:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiFUI-0005h6-Jp
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 05:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hiFTN-0005dJ-G7
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:53:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hiFTK-0001Ju-Mp
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:53:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hiFTK-0001IP-G6; Tue, 02 Jul 2019 05:53:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7898E3086204;
 Tue,  2 Jul 2019 09:53:00 +0000 (UTC)
Received: from [10.36.116.95] (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC77B1001B14;
 Tue,  2 Jul 2019 09:52:52 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
 imammedo@redhat.com, David Hildenbrand <david@redhat.com>
References: <20190701190819.25388-1-eric.auger@redhat.com>
 <78aa3a5a-9d29-c29d-64e4-ca16a69f4de4@redhat.com>
 <6d1b73bc-9ffa-7879-feb6-31cd03f3b5d0@redhat.com>
 <a369ef11-bf4a-67e3-8068-241ab02f371f@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <41e8588d-3b6d-c281-0324-fb0af746fa25@redhat.com>
Date: Tue, 2 Jul 2019 11:52:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a369ef11-bf4a-67e3-8068-241ab02f371f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 02 Jul 2019 09:53:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tests: Update DSDT ACPI table
 for arm/virt board with PCDIMM related changes
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hcGPFwNIzBkV

Hi Philippe,
On 7/2/19 11:43 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 7/2/19 11:01 AM, Auger Eric wrote:
>> Hi Philippe,
>> On 7/2/19 10:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Hi Eric,
>>>
>>> On 7/1/19 9:08 PM, Eric Auger wrote:
>>>> PCDIMM hotplug addition updated the DSDT. Update the reference table=
.
>>>
>>> Can you point the commit sha1 please?
>>
>> this follows Peter's make check failure report sent yesterday and
>> follow-up discussion on IRC. The series is not yet upstream so I canno=
t
>> point to any SHA1 yet.
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg627971.html
>=20
> I hadn't review this series, so this patch was making no sense at all t=
o
> me, now it does.
>=20
> I think it has to be squashed with:
> "hw/arm/virt: Enable device memory cold/hot plug with ACPI boot"
> in the series you mentioned.
Yep sorry for that. I was trying to fix the issue quickly for unblocking
the series for 4.1.

Actually it looks really weird as the test is passing on some hosts
(Igor is currently experiencing it). At the beginning I was not able to
reproduce Peter's issue and eventually after many various tweaks in the
environment I was able to. I used the script to regenerate the DSDT and
this definitively fixes the issue for me. Now we are not sure this isn't
an issue in the test itself.

Thanks

Eric
>=20
> Regards,
>=20
> Phil.
>=20
>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> ---
>>>>  tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
>>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>>>> index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345=
fdf7ffa442afec3c5c28 100644
>>>> GIT binary patch
>>>> delta 172
>>>> zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=3DeSSi^^mWRZt~=3Da(Tfjuig$N)iRX=
y-
>>>> z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
>>>> zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
>>>> Ni>WOjJjjWw0RY`tDw+TQ
>>>>
>>>> delta 134
>>>> zcmdlxfpN_QMlP3Nmk=3DEf1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
>>>> zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=3Dc$sh-0Ff)LR
>>>> Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q
>>>>
