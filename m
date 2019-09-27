Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3241291wrp;
        Fri, 27 Sep 2019 02:21:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3CerWY8BBr4Qj9SytrUu2FUXmb+6StaEORyOcNyHB6FkYXHMCGMeXbStUj5Ez/DiZ41XC
X-Received: by 2002:a37:a683:: with SMTP id p125mr3456214qke.173.1569576103595;
        Fri, 27 Sep 2019 02:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569576103; cv=none;
        d=google.com; s=arc-20160816;
        b=byHIzp4QGcH/0BULoxzWOXNcH/oOvCfwaWADDX9L/PgvZDE+rRAGWYHJrdqZpqjAQt
         RWBBQ0G1eDuHH2+kYroz8I0pSK17oI3oy6MYgiYNiUZGr4A+bLAFo+tJwojqpHhp+hRW
         YH5v8LJyuM1woVvtJ/S3D6wx0He3qfgdXRzpvgORLQbksXzjwMaylOeMb79vZ870eUVl
         MOOFU723zZvMy1boK5FkmW9OIdeq6c02869RGdfnySrPqiF3RJeh/e13AI+xyJpdgk90
         KxSuFlTj3ZUsMpAwacjTkt8KEL9F0SxkwVgVn+pJ4LV0n6hGJ/PzgMT2kyPaDFx66YX4
         CeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=7wZxLIs8Ts4HJSL9qGkv1O0CMPFLEaAmLOKNPImx/80=;
        b=tdDdxqGE0g123ohBJ3Gevch/P6y9mvpAlr6ov4hcuRRfhabQeixuKD3hL/dMML7cPs
         +Qmx64e8PpSQ3pq6NXwjykxmAL+2MnsLm2Kip9QWpLjWDjl/d38zqIpxZ9enWu6fTW5B
         fvsFF1IJITor7RnirqrQfz3GCj1rhgwKfQDtZawARaQJa6qUnKsSLu0PSJbgIJ1H4q7j
         jUtyxe3V4zo2elFaH2oTVoWiYdAH9N6jrwmcO2Kq8tabXeqc/+gISJPQzpllrALdaaU9
         kTysV2BtYPhTQmcwen3CmCItLpYBNlLpdYb2ecytDP67HMMjbKOUi1VT/oI5re7Zu1rF
         OrMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MnijILNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q26si4146661qtf.3.2019.09.27.02.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 02:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MnijILNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDmRa-0002LN-BF
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 05:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDmLP-0004zo-MK
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 05:15:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDmLO-0002oh-Cx
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 05:15:19 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDmLO-0002mm-5P
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 05:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569575717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=7wZxLIs8Ts4HJSL9qGkv1O0CMPFLEaAmLOKNPImx/80=;
 b=MnijILNgbfLoakUIbfsy84M7YPCY6Z1xmnFOzwx2oY7Cw2TqsztZFWt0k8CqaPGrMQT3sZ
 WlfrqmckKXz2/5Q9UEMVsC/MJpAQGKBqjViesj8WnEr6zqJ5IDYDXZO8OzKyWfQPUTfYX8
 2RQGO+klV+iGc31jjKctMhFVLnsgzHU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-hpc2Xe8RO1yx7ZKaQponXg-1; Fri, 27 Sep 2019 05:15:15 -0400
Received: by mail-wm1-f72.google.com with SMTP id s25so1972488wmh.1
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 02:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZM17ymn2lck6Yard47o1e27kHTzBjtHrS85U5JQL02A=;
 b=I6I0sB4dN78gNgjVKkWfWIMTR4EAmRPfDMip+QISfsMB8c7wRmqDhVv7ltQI5qEtAM
 DehMLvGnusHboGKxG1bkT5UrjCLbGDw5ZR2IgBTacFmwhRI5sKsmI3SSEG1WGD44hQuB
 LhH7bra0mXUXqMqAfuGDQIFqwGZ8bsej5tzQ6G6N6R1Tm51vDSmkLn60Bsrl5g3P/XMC
 QM629JHz9xuz1GDuq1trX9zNhwNRVECgEP452h1V2Th03PaI3yPVIEkz7PWy8ccmXShj
 3o0DJ7vDFogYSI/T1rTkf88/6c2soXKbc48s6d/dQ2mtdOEHs1ZuaSNkWTT9nps8OK8E
 m11w==
X-Gm-Message-State: APjAAAXYJjZZq+FwP9v3W/OxHCGgRu2xR1eLR5V0C+fnJycLSOTbGpDE
 8AWwIcL+6xYcEYxTW36k0gtFKGT7n9st02flMBAQmoBkEP9UQ3ym0mpQGheRptNpDfs6BvsGMkb
 EyO2JjaXvqiC8
X-Received: by 2002:a05:6000:162e:: with SMTP id
 v14mr2245360wrb.112.1569575714366; 
 Fri, 27 Sep 2019 02:15:14 -0700 (PDT)
X-Received: by 2002:a05:6000:162e:: with SMTP id
 v14mr2245344wrb.112.1569575714159; 
 Fri, 27 Sep 2019 02:15:14 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id q3sm1938155wrm.86.2019.09.27.02.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2019 02:15:13 -0700 (PDT)
Subject: Re: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 qemu-devel@nongnu.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
 <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <65b49cb0-c9fb-d966-8dec-1e39d09ab8c7@redhat.com>
Date: Fri, 27 Sep 2019 11:15:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ca5c74db-cf5d-0c3f-eb6f-27d1092420ae@linux.microsoft.com>
Content-Language: en-US
X-MC-Unique: hpc2Xe8RO1yx7ZKaQponXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: 3Y0d3fzrzZPd

Cc'ing Ard too

On 9/27/19 12:35 AM, Lakshmi Ramasubramanian wrote:
> On 9/26/19 8:17 AM, Lakshmi Ramasubramanian wrote:
>=20
> The following commit for ARM Trusted Firmware for QEMU virt ARMv8-A
> is almost 3 years old
>=20
> https://salsa.debian.org/debian/atf-allwinner/commit/b6b671c4ac4bd5595306=
863225bb3bece1e6135c
>=20
>=20
> Current limitations:
> * Only cold boot is supported
> * No build instructions for QEMU_EFI.fd and rootfs-arm64.cpio.gz
> * No instructions for how to load a BL32 (Secure Payload)
>=20
> So looks like only cold boot is supported (no kexec support)
> Is this correct?
>=20
>> When I execute kexec ("kexec -l <kernel>", followed by "kexec -e") I
>> hit the following assert (in arm-trusted-firmware/plat/qemu/qemu_pm.c)
>>
>> /***********************************************************************=
********
>>
>> =C2=A0=C2=A0* Platform handler called when a power domain is about to be=
 turned
>> =C2=A0=C2=A0* off. The target_state encodes the power state that each le=
vel should
>> =C2=A0=C2=A0* transition to.
>> ************************************************************************=
******/
>>
>> void qemu_pwr_domain_off(const psci_power_state_t *target_state)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assert(0);
>> }
>>
>> Is kexec supported in ARM64 QEMU (qemu-system-aarch64) -
>> using arm-trusted-firmware, optee, and u-boot?
>>
>> Thanks,
>> =C2=A0=C2=A0-lakshmi
>=20
>=20

