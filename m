Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3604902wru;
        Tue, 2 Jul 2019 02:44:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhmvnGHpCTDu/NhgdaXHujYp9Hld4vDlrV+DsASIlSwX0Hxekwk7KCnotDAoZYz5RIke8y
X-Received: by 2002:a17:906:c4b:: with SMTP id t11mr26338845ejf.33.1562060647134;
        Tue, 02 Jul 2019 02:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562060647; cv=none;
        d=google.com; s=arc-20160816;
        b=R+rBGLew71KE9pTxg5S3ognB9WBADLPJlPVaxm2LUOt0Gv1h1Mm7LrwCCjc/obDkc8
         arFknUyLhVtDqm/hmi43oEF8/BYVmk+0Luvwpw+pN4v4FaukKIN6lszniYTM4eOwKMoP
         G/50eJYpM9kJHOWgYHJbprF0FzgnJjFa5xl455Qo0L8zDR+PqH9Auc4ZX5QvH58dHKy5
         zmSqV14ly6MphAM51dxQ3qxk1+eSObSauOmIU2gfkHrVWdmfiML+HI4BBx4f8yT8aVob
         3p6WJb2RE+yslRYuoOA9s2+tsDnK7zW64wm5c85YgS+u1dXqmwG6MyZu7oq0mmjggOWS
         YuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=JXNqboG/6khsCf+27ofnoCFp0LemwWTZeTG2yyfqZro=;
        b=Opbwao1ROGCfAj8BtoAGW58pOGATXJa2vVikUGEeJyk5yEFUxUVLuwZ5gtYucrTAVj
         3Z1pw8q5g3wbmLYDnMGQ4vJvXDtLTkwPM1N05rBTgpdl4qznW2JexfKCQJO1ztWYHAPf
         gHt4x+prEX46R7n1TSU4wHi9CreBx+KVwk3uZpeAO+ienS5OzqMUjCXnwgUILaKvh6Xb
         UqTXV+Seiwz4+UfyaJn99kUct/jj1Nnpdgg3oq0QpR23Ye1zKh63SHP1TkD9G3JLiDwl
         IRxNZRb7zpkYYb4+alnmy/dEVaY+IrCb21UDflXazn8GrPr/Xj1wVLz10fTg6Mw+cnsk
         zFPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j48si11474502eda.226.2019.07.02.02.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 02:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiFKY-0006jq-8L
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiFKP-0006iP-61
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiFKN-0006WU-Uv
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:43:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36157)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiFKN-0006Vz-Nz
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 05:43:55 -0400
Received: by mail-wm1-f68.google.com with SMTP id u8so232688wmm.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 02:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JXNqboG/6khsCf+27ofnoCFp0LemwWTZeTG2yyfqZro=;
 b=IebpFMrd8cefbEbJmuKmbgEWm47fW6Q2mzu3ukXjqx82JH/h5EcWUL+2WWBCyiAyOe
 Ug1CVPpaAKAMZkZliNLyE3xllAHr2lXGjn/aSsWdQt8cLGSOhd/PkH6HQqa8fDKDrqn3
 VxczrPd7HErMA4uMLwaA1kyjf2iuxxTiuUNRjMAYYoKaIVfhV9WcupAEgeWXmimibvGQ
 OZ7suKTVA1zpV4DaW1utKMFBs53BcYcX1hIlKid20ylc0lgwCM4AVVXxQrwL803qZgh0
 vgXCFGyGZd5CunbA3+IVDNBT66uA2uEDJvdYu3Cxuk+pJJsjRQDheRU26b4y2w49VXvH
 XbnQ==
X-Gm-Message-State: APjAAAWtAzI416Z4rJRCmOQRClN48kr16hQS+EZVOqWrcP0H9fo5OJ4s
 6/KPwqLC4Bi+UqtOayFL0WVWQA==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr2550268wmg.159.1562060634519; 
 Tue, 02 Jul 2019 02:43:54 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id h8sm1837548wmf.12.2019.07.02.02.43.53
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 02:43:53 -0700 (PDT)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
 David Hildenbrand <david@redhat.com>
References: <20190701190819.25388-1-eric.auger@redhat.com>
 <78aa3a5a-9d29-c29d-64e4-ca16a69f4de4@redhat.com>
 <6d1b73bc-9ffa-7879-feb6-31cd03f3b5d0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a369ef11-bf4a-67e3-8068-241ab02f371f@redhat.com>
Date: Tue, 2 Jul 2019 11:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6d1b73bc-9ffa-7879-feb6-31cd03f3b5d0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
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
X-TUID: LJHh9dtI6Nnq

On 7/2/19 11:01 AM, Auger Eric wrote:
> Hi Philippe,
> On 7/2/19 10:56 AM, Philippe Mathieu-Daudé wrote:
>> Hi Eric,
>>
>> On 7/1/19 9:08 PM, Eric Auger wrote:
>>> PCDIMM hotplug addition updated the DSDT. Update the reference table.
>>
>> Can you point the commit sha1 please?
> 
> this follows Peter's make check failure report sent yesterday and
> follow-up discussion on IRC. The series is not yet upstream so I cannot
> point to any SHA1 yet.
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg627971.html

I hadn't review this series, so this patch was making no sense at all to
me, now it does.

I think it has to be squashed with:
"hw/arm/virt: Enable device memory cold/hot plug with ACPI boot"
in the series you mentioned.

Regards,

Phil.

>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
>>> index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fdf7ffa442afec3c5c28 100644
>>> GIT binary patch
>>> delta 172
>>> zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=eSSi^^mWRZt~=a(Tfjuig$N)iRXy-
>>> z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
>>> zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
>>> Ni>WOjJjjWw0RY`tDw+TQ
>>>
>>> delta 134
>>> zcmdlxfpN_QMlP3Nmk=Ef1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
>>> zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=c$sh-0Ff)LR
>>> Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q
>>>
