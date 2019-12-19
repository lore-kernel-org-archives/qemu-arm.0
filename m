Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2197813lff;
        Thu, 19 Dec 2019 05:09:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNqSWi1ZJ0OKue8AH4S2A8JmkDQXSC/Hu5pL0cAqy7Wp8S9a+oaEZSrk8fnS+5aDdYiosv
X-Received: by 2002:a17:906:b208:: with SMTP id p8mr9260425ejz.191.1576760992033;
        Thu, 19 Dec 2019 05:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576760992; cv=none;
        d=google.com; s=arc-20160816;
        b=IUVo5U5QgFGHjkL3Y9tG2puetZ2Rkgd9lpCZoqV6TTdoBTYEqwwEfNOiEN2cFqLykh
         uzvdoDiaKg6Wo71kGgWYfK/Pd9MyeF09YPZClvsk9cAzH/mCKh+IKrsUCOSPMij00Bxl
         B+Yy1YrRBUIvZ7coyGoLm47xq2vfucOLOFoExDiEyWcRGnIEjFtIB5l5F70wtmkxqbe5
         sBfbVoWijgfNkpVbT78rHQwwFGuH1be+C8yket5DlHONzYztXKmjJEKDT0RD7R/1XxBj
         A5WFHyBWwnq1Lyqk8pbMSpd2bicMgs+4azoLk02iWT84muWh7tunxiqKQHUXKDjkzbcb
         /0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SuzS+0RI392neHe9EkEjexF+DgTfoqg6pQIc+0/RiGk=;
        b=VevyzEwHkzlV80f4adY5L+t3VVbTIOww7gtKE1yuJyL+KnN67gm0ojzOVgEUQM2/PV
         AMh7GUKlKtqP1ocZ3u5CDTsozqJ5YR6ZxMNdQ8wnObNbH6ySMkBfWtLm4wP9Ztz1w7BO
         ZNlSwXPAC49SvD8ZFHh4IGvU5NFoaz4W088idvQLwizNTXNVXffOQ+GAFIvU6WpUGHfe
         QVic5JZdXKiU8jOpWXy6cwGJqRQhxWFCwuHVRn5IrLGv26iVeUSFe4klZggfvRtkuoqe
         F/LJtFNPqKufHs06kGFcjlftAQtmOqN/dLB6pIP2HI1CH2OL1X2bZZfVNJs3/xOXu7I5
         6Jag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayNnGlzK;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g25si4214397edu.205.2019.12.19.05.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Dec 2019 05:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayNnGlzK;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576760990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuzS+0RI392neHe9EkEjexF+DgTfoqg6pQIc+0/RiGk=;
	b=ayNnGlzKDOUIETyILBDctjy3DoR++Faf/bS0OT/NltT188T9JdToce/0syXVnfb2P6kLLj
	ZCI+WEnLk3w3qa3yLiGlqSagihQnN4SxxoV4yu5c/qmtgB6rqiMH7+ZXKwU16x6hCB2u7+
	HTdNyt71ySuiGeThr4nvM2gWRd/MeQQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-kQo3xeqNMi-K_qai9p0c2A-1; Thu, 19 Dec 2019 08:09:49 -0500
Received: by mail-ed1-f70.google.com with SMTP id n18so3434881edo.17
        for <alex.bennee@linaro.org>; Thu, 19 Dec 2019 05:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ni05vfEtEsgSJx+IszN8ATEGfrX2nnauYNLHkipway8=;
        b=Vi10c/m2dVCPxalmdIUedfsmvREnIwR+xu2IKdBN2CapXFu4vIMYC+LdR0esVf70ms
         5JTqHV8cldsIwBcJFdwW0ZHs3iS3E0X/volEvYgqSGKHwUTwrvxl3EjbGP72dTs2O/p3
         bJXTP7F2tGmvtL0MKPB079ukTVKdVAowCxvNqZmHEC5MMRYo0Y9VHM8o5DPxWtam3Wh+
         v4NjddgDayrshGwn7bN5u7zg3nMPnmMD6pMqUXXwFFdmbok56A8Mr3hknwz8VU4CvV9u
         HUPaABK9/eYaP9ID7uCEmmlJqOlYelNxwFL863WISqxzdmpMbCr4TmNXrAg+ACatIbYZ
         e/pQ==
X-Gm-Message-State: APjAAAXyLHeekrHuTvo00CMeWv35ctxo0/6XrOcDBqUs+r2VnKf0HMU5
	on2tqHl3QpKohgHNgoypH9/pWi9bGoC4X9Ycq7FJrCPSUMSP5Otxkdde4qThvl8xTjbmGaLZKnP
	ywHnzOhPuCgBtim6I
X-Received: by 2002:a50:8522:: with SMTP id 31mr9076173edr.237.1576760987671;
        Thu, 19 Dec 2019 05:09:47 -0800 (PST)
X-Received: by 2002:a50:8522:: with SMTP id 31mr9076104edr.237.1576760986995;
        Thu, 19 Dec 2019 05:09:46 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.34])
        by smtp.gmail.com with ESMTPSA id e2sm474808eja.37.2019.12.19.05.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 05:09:46 -0800 (PST)
Subject: Re: [RFC PATCH 13/14] hw/char/terminal3270: Explicit ignored
 QEMUChrEvent in IOEventHandler
To: Markus Armbruster <armbru@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Paul Burton <pburton@wavecomp.com>,
 Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Joel Stanley <joel@jms.id.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier
 <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20191217163808.20068-1-philmd@redhat.com>
 <20191217163808.20068-14-philmd@redhat.com>
 <87sglgx0w1.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <214a1da6-d974-4f98-0113-ea0b1ea9f244@redhat.com>
Date: Thu, 19 Dec 2019 14:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87sglgx0w1.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: kQo3xeqNMi-K_qai9p0c2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: raBGjzfKLUtG

Hi Markus,

On 12/19/19 7:52 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> The Chardev events are listed in the QEMUChrEvent enum. To be
>> able to use this enum in the IOEventHandler typedef, we need to
>> explicit when frontends ignore some events, to silent GCC the
>> following warnings:
>>
>>      CC      s390x-softmmu/hw/char/terminal3270.o
>>    hw/char/terminal3270.c: In function =E2=80=98chr_event=E2=80=99:
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_BREAK=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>      156 |     switch (event) {
>>          |     ^~~~~~
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_MUX_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>    hw/char/terminal3270.c:156:5: error: enumeration value =E2=80=98CHR_E=
VENT_MUX_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
>>    cc1: all warnings being treated as errors
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Halil Pasic <pasic@linux.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> ---
>>   hw/char/terminal3270.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/char/terminal3270.c b/hw/char/terminal3270.c
>> index 6859c1bcb2..9e59a2d92b 100644
>> --- a/hw/char/terminal3270.c
>> +++ b/hw/char/terminal3270.c
>> @@ -166,6 +166,9 @@ static void chr_event(void *opaque, int event)
>>           sch->curr_status.scsw.dstat =3D SCSW_DSTAT_DEVICE_END;
>>           css_conditional_io_interrupt(sch);
>>           break;
>> +    default:
>> +        /* Ignore */
>> +        break;
>>       }
>>   }
>=20
> I doubt the /* Ignore */ comment is worth its keep.

OK I don't mind dropping it.

> Splitting PATCH 02-13 feels excessive to me.

I agree, but I have the feeling when a patch touch many subsystems, we=20
don't wait for all the maintainers to Ack it, we are fine with 2 or 3.
In this case, maybe a subsystem neglected a QEMUChrEvent case, so I=20
prefer to have each of them to confirm we can ignore the missing cases.

In v2 I don't replace by a 'default' entry, all the cases are explicit.

Regards,

Phil.
