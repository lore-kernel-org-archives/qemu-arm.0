Received: by 10.223.188.70 with SMTP id a6csp5106246wrh;
        Tue, 22 Aug 2017 08:46:49 -0700 (PDT)
X-Received: by 10.55.158.205 with SMTP id h196mr1729222qke.70.1503416809199;
        Tue, 22 Aug 2017 08:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416809; cv=none;
        d=google.com; s=arc-20160816;
        b=IVuuGvDc1phESx0P6EliyJZUOWqn2/4YVYQKVam231DvzhOwd2ZaroV/JckrOvLUOa
         KFX+rMm+MBL6x2ou3oHtRBcABzDAMPu2+iJEjAfhgBIwPvVDtF4Jf0aqo2KwcY0UNnkS
         UmgZ1Xgi3kWKw6u9YSgyDY4MzoiMlX3muyDKBWj2jR0TkXu6sVAsRe9xht+3zTkakax0
         s0dz+X2zQ4QDMi2n24Os1Bg74bN7dAqjNk+c3++kSM+bQQmvnH4f4KopJdH03doOg84u
         z2YOddoUxEl9scbTva7XhKKUZbG0uM2rVXX0TfSf+gQKVqpIjgEtL6B9GbPapzjXQM8r
         U0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=wGQ8SmiKrXEgtaDNtu403hq15hyYCyQRaMHHaTEAZBI=;
        b=Se6qR0FZ3z/DEr/RLt25p8YG/D0jC1a7ft4NmvAAeeimz4bHBxYJSra7IN/FACXQUm
         CSFI2Nvf11BJqS/4fZiENAuLTQZ7TuewnsgmtRPjLlfaC39MdS33R+xhbwXxOH8oIdld
         usRURH/0ggX7upX/sx+KMfBai+XKEYMF366ZrkxflVyJtbcMRTLJGQxV6yt0m6NwqNdC
         y//LSZMiyp8EeYc8h5E+l0eEywujdhqrD0QRKavGIZhWy6xfd15yJUQR23SMQHXHNj5b
         FRhVuHJCcbRY88NoqMrNUD1DRvKE5EBBXAHrPsAmy02WD3ig3GRoXDf44sRQRKmHrkeJ
         VhTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si14137650qka.132.2017.08.22.08.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBOA-0006o5-Pl
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkB4T-0004j5-J2
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkB4S-0000zC-J7
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkB4K-0000tl-0t; Tue, 22 Aug 2017 11:26:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE2697EA8D;
	Tue, 22 Aug 2017 15:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CE2697EA8D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.21] (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAF61715B;
	Tue, 22 Aug 2017 15:26:12 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
Date: Tue, 22 Aug 2017 17:26:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 22 Aug 2017 15:26:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/misc/auxbus.c: Mark the
 aux-to-i2c-bridge device as non-hotpluggable
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EpvG1DzQq/Cn

On 22.08.2017 17:12, Peter Maydell wrote:
> On 22 August 2017 at 16:06, Thomas Huth <thuth@redhat.com> wrote:
>> QEMU currently aborts if the user tries to do something like this:
>>
>> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
>> QEMU 2.9.93 monitor - type 'help' for more information
>> (qemu) device_add aux-to-i2c-bridge,id=3Dx
>> (qemu) device_del x
>> **
>> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_=
ctrl)
>> Aborted (core dumped)
>>
>> Looks like the device is not hot-pluggable, so let's mark it
>> accordingly.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/misc/auxbus.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
>> index 8a90ddd..2c62515 100644
>> --- a/hw/misc/auxbus.c
>> +++ b/hw/misc/auxbus.c
>> @@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXT=
OI2CState *bridge)
>>      return bridge->i2c_bus;
>>  }
>>
>> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
>> +
>> +    dc->hotpluggable =3D false;
>> +}
>=20
> Why is our default "hotpluggable" rather than "not hotpluggable" ?
> We must have way more non-hotpluggable devices than hotpluggable
> ones, and it takes active effort to make a hotpluggable device
> model, so it seems like it would be much less bug-prone to
> require hotpluggable devices to set dc->hotpluggable true
> rather than all the non-hotpluggable ones to set it false...

I think most devices are already non-hotpluggable automatically because
they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
problematic ones are the devices with .parent =3D TYPE_DEVICE. And for
these, I think it is quite hard to say whether they should be
hot-pluggable by default or not?
Anyway, according to my tests (I'm currently working on a test that
automatically does device_add + device_del for all devices, as you might
have guessed already), there are not that many devices that cause
problems here, so I guess marking some few with hotpluggable =3D false
should be OK?

 Thomas
