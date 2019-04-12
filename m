Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp522795wrx;
        Fri, 12 Apr 2019 05:50:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2SyUIVlpDPYrXeq6owuHD0WtUfLyO681oojmP5TfD1/MJH+keNlVD36f45mq792Bp7KUn
X-Received: by 2002:a1c:7211:: with SMTP id n17mr10491620wmc.32.1555073436509;
        Fri, 12 Apr 2019 05:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555073436; cv=none;
        d=google.com; s=arc-20160816;
        b=WW+hGUVzEVJj1b5rMKLukKWctNF6phiIu1J1toxUFXAGJe3D6vjEyiZCxcNDLSHxzF
         wjZn/znnf9yiXHafOLOArVD8AAY0c2lXcWjunM1VLgBPP/BHDOvd/dVoQekNTE5mhpKo
         Iyvc1fSX9QwblRQL3ZFkx3pSiZLJBckeGP1RMftsXJMg3Cmk3MjaT8vCQJoX8GD3J/CR
         B55MQDpXfGtWaSJSrI/yK2CgBLNN0HhmtaiC4/NRUhqG0lrX0CFV1bqAOR17bU+cpBDQ
         AaOvEu6davYLZXufT32RDqfYZ3hiDIdWutM7+Gu6qQbeuLWkVdaY87Bq5Py/kvoqK5hs
         r1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=qlU9MV4ECmWSWuSM5ly3qp0BVI7AClNvVPVoO0gpbcM=;
        b=kMqCdBCcXyTWUCZ/cQF4jDRiiKjxy4LZvhCl7koKs4/Zz8iBEsMpJkpHJv91mV/nLG
         n14jngqLvL/H5OHyXd2WcC0zDQlyrfFIq4I7W5OU2H+E79+CH9jYuhLR/GMonRp0XvEA
         aQrSfCVni/eQydmcHRyHgwcT9WlVGGTvQOEnZgAmjKUBODpuvECxoUyCW2Bf/CYrXdDS
         9haaPFcEf2RwFnZLvPV0ijlu+gpJaRZNUUZvZKDevA5vipCNDVWrv/81+fbtPVIPo6lV
         uPFyJqAgfhpk2vjEEbS+qET700hyV5z2RMupaS8O3+7Cwm3MsUCKoAQiG2mj59qDxT/w
         X0GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13si5009040wmk.66.2019.04.12.05.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 05:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEvdb-0001OM-JV
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 08:50:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEvOq-0003V8-6l
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 08:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hEvOp-0001Gx-6k
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 08:35:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hEvOo-0001Gj-Tv; Fri, 12 Apr 2019 08:35:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38945308CEB2;
	Fri, 12 Apr 2019 12:35:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E01C2CFAA;
	Fri, 12 Apr 2019 12:35:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 133161138648; Fri, 12 Apr 2019 14:35:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
References: <20190411135602.21725-1-armbru@redhat.com>
	<20190411135602.21725-3-armbru@redhat.com>
	<95f2e6d2-5bd0-a9dc-ab4b-dc172e7f1ad1@redhat.com>
Date: Fri, 12 Apr 2019 14:35:12 +0200
In-Reply-To: <95f2e6d2-5bd0-a9dc-ab4b-dc172e7f1ad1@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu,
	11 Apr 2019 16:35:13 +0200")
Message-ID: <87mukvo0zj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 12 Apr 2019 12:35:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/virt: Support
 firmware configuration with -blockdev
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, mreitz@redhat.com, qemu-arm@nongnu.org,
	lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y6vouVH9nWfy

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/11/19 3:56 PM, Markus Armbruster wrote:
>> The ARM virt machines put firmware in flash memory.  To configure it,
>> you use -drive if=3Dpflash,unit=3D0,... and optionally -drive
>> if=3Dpflash,unit=3D1,...
>>=20
>> Why two -drive?  This permits setting up one part of the flash memory
>> read-only, and the other part read/write.  It also makes upgrading
>> firmware on the host easier.  Below the hood, we get two separate
>> flash devices, because we were too lazy to improve our flash device
>> models to support sector protection.
>>=20
>> The problem at hand is to do the same with -blockdev somehow, as one
>> more step towards deprecating -drive.
>>=20
>> We recently solved this problem for x86 PC machines, in commit
>> ebc29e1beab.  See the commit message for design rationale.
>>=20
>> This commit solves it for ARM virt basically the same way: new machine
>> properties pflash0, pflash1 forward to the onboard flash devices'
>> properties.  Requires creating the onboard devices in the
>> .instance_init() method virt_instance_init().  The existing code to
>> pick up drives defined with -drive if=3Dpflash is replaced by code to
>> desugar into the machine properties.
>>=20
>> There are a few behavioral differences, though:
>>=20
>> * The flash devices are always present (x86: only present if
>>   configured)
>>=20
>> * Flash base addresses and sizes are fixed (x86: sizes depend on
>>   images, mapped back to back below a fixed address)
>>=20
>> * -bios configures contents of first pflash (x86: -bios configures ROM
>>    contents)
>>=20
>> * -bios is rejected when first pflash is also configured with -machine
>>    pflash0=3D... (x86: bios is silently ignored then)
>
> Can we start deprecating the -bios command line option?
>
> Maybe on a per-architecture basis first.

I have no idea.

Perhaps we want to keep it as syntactic sugar for convenience.  Right
now it's something else: an ugly special case.

Of course, the name -bios is a bit PC-centric.  And even there it makes
less sense than it used to.

[...]
