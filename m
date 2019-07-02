Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3567309wru;
        Tue, 2 Jul 2019 02:02:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNijf5T6l2aN1Cty6BRqR3XhcvO8h95fkdd7lzWvsIearbw3KtsVcojZrfR9L3gdbn3nzd
X-Received: by 2002:a05:6402:8cc:: with SMTP id d12mr34438129edz.60.1562058175254;
        Tue, 02 Jul 2019 02:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562058175; cv=none;
        d=google.com; s=arc-20160816;
        b=p34RwpluB57ZdGa83VoCynQ674eGVMnTaEjwg6SaAV5E2Ogiove9r/m1ic30+2fIzS
         Kqk0PLcNr79E9b5YdTIO8GeoIiWLFl39R/DvRjDk1hEImpyFihmiuxwLShq1vqFZV5qS
         ZjfQ2qGMXIPxe2UpgPkLiFKAjgdDLThaPtoroA/2W7TcgpTdL+W8OEwc/qRcOcg/Wmf7
         c8EYyg68EfJmATeWNvKg4jXNKUHDRa+azK6TWoq/BrbIS/wJaUc0TYFKVwwoWPMNWuYX
         jIKpd+vE4mQSIF4w3/DFO1+ITxSgFqWd3DGtn8J+XHysTUP5AyMOyIEc2TgXPoEA27NN
         UECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AW5x12nz3D5DJhvkVbVXVHrD6sH8+BoKYkSHVzK5Kzs=;
        b=lSRBzCvZBsXgkSa5Ft8HfM6Ug0C/+B6QNygG+5rydGa3d7UEeR2L81tdKZ6orwBAGm
         RMJnc9wimDQUPaS2pSw1PR7O8pqepejsMkjPKntXYtlocVDyCy5dr211X+JIn5sWUDal
         0J/cpz481S7rKJv2rHSvtWHdNq7fErNM9BQJETnZlB6qQrEi+YrrmFdJnc58ZPiBBCuC
         g3vl0G6vxaZIb3jD6D67bhEqJePZZ9+Z6UpagAxChjIyxR+c7lTe0zpjcelXwt4KPtS8
         fTgSR9SDjO7Pq42JUj+y+hD6539P4DDgWWB+E8JqYa3JzLQkGW80M5ZGEYnOyuWuGzbu
         oc3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si11353918eda.21.2019.07.02.02.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 02:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiEgg-00020g-BX
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 05:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hiEfi-0001y4-Dr
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hiEfh-0004Z0-6y
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:01:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46398)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hiEfh-0004YU-1D; Tue, 02 Jul 2019 05:01:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 08BEF30C0DDC;
 Tue,  2 Jul 2019 09:01:37 +0000 (UTC)
Received: from [10.36.116.95] (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0131001DCC;
 Tue,  2 Jul 2019 09:01:26 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
 imammedo@redhat.com, David Hildenbrand <david@redhat.com>
References: <20190701190819.25388-1-eric.auger@redhat.com>
 <78aa3a5a-9d29-c29d-64e4-ca16a69f4de4@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6d1b73bc-9ffa-7879-feb6-31cd03f3b5d0@redhat.com>
Date: Tue, 2 Jul 2019 11:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <78aa3a5a-9d29-c29d-64e4-ca16a69f4de4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 02 Jul 2019 09:01:42 +0000 (UTC)
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
X-TUID: C2PM4WLPbL01

Hi Philippe,
On 7/2/19 10:56 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Eric,
>=20
> On 7/1/19 9:08 PM, Eric Auger wrote:
>> PCDIMM hotplug addition updated the DSDT. Update the reference table.
>=20
> Can you point the commit sha1 please?

this follows Peter's make check failure report sent yesterday and
follow-up discussion on IRC. The series is not yet upstream so I cannot
point to any SHA1 yet.

https://www.mail-archive.com/qemu-devel@nongnu.org/msg627971.html

Thanks

Eric

>=20
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>
>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>> index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fd=
f7ffa442afec3c5c28 100644
>> GIT binary patch
>> delta 172
>> zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=3DeSSi^^mWRZt~=3Da(Tfjuig$N)iRXy-
>> z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
>> zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
>> Ni>WOjJjjWw0RY`tDw+TQ
>>
>> delta 134
>> zcmdlxfpN_QMlP3Nmk=3DEf1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
>> zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=3Dc$sh-0Ff)LR
>> Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q
>>
