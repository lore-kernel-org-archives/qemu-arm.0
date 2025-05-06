Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3212646njj;
        Tue, 6 May 2025 08:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVW4rQfmeVEuQBHPWyW0SWuwldV0NSWdGrAck3LRs/cq1C1Ef6FQo5vCH0ex+LVxhJmnk2SU9cKC9LikQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEyzF8BCLgmyio7wQuxf9XkBXZAxnjtZRlogxbTsNxokZWJlnUETH9o5NvrajO6Jmry5pTf
X-Received: by 2002:a05:6214:19c8:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f528ce8d17mr199519276d6.28.1746546569858;
        Tue, 06 May 2025 08:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746546569; cv=none;
        d=google.com; s=arc-20240605;
        b=js+oj6moNP2i2mU/5wl68oqKB7eShgcVlcasuqPt0hw5tq5oYO98ofYzVt3UTsWzD2
         cVvlQ8nhdnrDfgi4B50cIjjCAYKNKs6qfiCvaclnagfMDZFLHOcbot17xpufyX6zVqZj
         3YYYl694GGZvvUYBTfZecho1tVHuXVxmM2palyG5T0NmZ7aZstifETOrZtR1nihRm9KV
         W74HjUB/jrLinByrAZnNiHGakpvgKAa2oQDQcWAgsurdDnahA3xb6TeWCPhea3NZdNzW
         e7sYXKq/+xVrroeYjEJd61SiDkAFptcePWUUnMLcph2shLW1xQbBbitWSzw/meiy/Est
         AVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=bkngm4xPW0h1Rul1XmIN8IYWuu6SW3zE+68bt6TipHg=;
        fh=JRYzamVhE+vtiYu/uoHF4SOBWdTLCuNpCOsWDzfGHvY=;
        b=JrGORixb/qeIadyFnpTeAsv77vcj2vfUW88HhiQrdnea7tD4A7lYC8F5TW0fsAOdeJ
         /ymLoI2nqgJqD5ILeSbFACExY4z0BsxBKIR7cGxMaa65DSoBloXY+zJOtxmgsJhjyf4u
         4uKV+iN/SMphdWhV1pvR8YbYNd7SpE/ZJevoNFWW8e3loOx134xf7f2xXeSWYZqf1AV7
         a/3BffOOOpRoTD+4pLTjMwwSX8JasB3SVb6h6vZFlHkmLSRzVGfrJlLrcTo2TAxh4E7X
         pCwF1h7cigoUHhrpTjOX0SpSLu49oMHm72NnYhfG9sdreBzyQTdqvS0iL/Jmbusx0YkR
         e9dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W/YARlgp";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4908e1si122503336d6.314.2025.05.06.08.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W/YARlgp";
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746546568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkngm4xPW0h1Rul1XmIN8IYWuu6SW3zE+68bt6TipHg=;
	b=W/YARlgpbdKxt+AIu1M3H29+YWcdoaocchAZG/1t9xn5mxlez8Up9Y0urkz/4T/r6xijUz
	94G8FSqjQlJ0vr8MuZjTaCDlhYKe0iu2fVTNzygdKFs1pg8L5bL2DKVemerZ76ZvoBdV7D
	LptWDv9Fso79fc2sIzw9qQfSGg44Ows=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-P08WGnt8NBySPnl1ReH7GQ-1; Tue, 06 May 2025 11:49:27 -0400
X-MC-Unique: P08WGnt8NBySPnl1ReH7GQ-1
X-Mimecast-MFC-AGG-ID: P08WGnt8NBySPnl1ReH7GQ_1746546566
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39ee57e254aso3181099f8f.1
        for <alex.bennee@linaro.org>; Tue, 06 May 2025 08:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546566; x=1747151366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkngm4xPW0h1Rul1XmIN8IYWuu6SW3zE+68bt6TipHg=;
        b=dJBbv5ECGIsUP7t7gWxFq7PX4c3cbO09/j/vHK91ZkmFV2bTk84qZ+KH3IV1HuxHJf
         zKPCv6CqSIr+7Z0Qov9+qGLjF2J3imJWTtFBdwStEQTq9Q5iK8cX7mDmmrC5nAwWImOo
         7ucN02fH8w6UkTNn5OxCR3DugPtGMyivyMlgUkQs4VzOVICQUSt77kIIqEjGx49N/Mrs
         QolM1Q9cEhJafiZr3s7wH7UaYhlo5ocIJPvi/63HTu5IO8OACD5hMUaXM1/OqutQAUMd
         4b9cKs8eWHpoY7DGiZcBA4BU4/KQqEg2ch7y1hnUwP1CuJhVZGASM7fr8UVtXxkIrwPg
         ZR9A==
X-Forwarded-Encrypted: i=1; AJvYcCWth+LMB+hJPWhCmTIwTZ19qJBk2lbjF7v0Wb5M9nmhKFyFAaKx6BHHB1kzVx7D0zDwQNl18HL1SE9bBQ==@linaro.org
X-Gm-Message-State: AOJu0YymU5R+hvVq8MFLqDUREYDrkcRYEBt0o6a3myWpR0/O2CLa40d2
	8XHyTzO8QSTAnPSyj9y76CorNNbhv4bLT1j1QsK8xBOCC1/YUkHxEPzG6gmMs5ZcLdOOoqNfQf1
	vm3AwCp7fkO4U9pQC6AzUGsTyYVMc5zd3MN1+T3mwzw4f+EwBntCLXQ==
X-Gm-Gg: ASbGnctT58KsvfRtiMC+Up5zFVd4Qcxqtvr5hfTbODtnRTLAlnkJ8tkhocS/ydn/KHs
	luMn/wHqZ8awiJVy8pQ2+uXY0O+mRFc9aSDKz3Wld7CbOzJbf+MGIJg4ghUMQx7Y4uUK3yATfEz
	a+6MVwi42Db64kNWYN7qbpglaMzrMCzxnElSs7mKjfqD3BG+faVNRs33zufnKF4hVV4qGlliioY
	fsomTEI3tT7jF0H1SP+Si2nsUWufGJ7Yf7T48Fyvb36xgLO4iT2JYcoJotSy5hYPyoCGTRijSqb
	Gk9YRDVqfV1zeQ0yhN6L6wOoc6ArJcSA
X-Received: by 2002:a05:6000:178f:b0:39c:d05:3779 with SMTP id ffacd0b85a97d-3a0ac3eb17cmr2824057f8f.49.1746546566297;
        Tue, 06 May 2025 08:49:26 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:39c:d05:3779 with SMTP id ffacd0b85a97d-3a0ac3eb17cmr2824028f8f.49.1746546565814;
        Tue, 06 May 2025 08:49:25 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm14264980f8f.90.2025.05.06.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:25 -0700 (PDT)
Date: Tue, 6 May 2025 17:49:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>, Udo
 Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones
 <ajones@ventanamicro.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Fabiano Rosas <farosas@suse.de>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>
Subject: Re: [PATCH-for-10.0? v2 13/14] hw/arm/virt-acpi: Do not advertise
 disabled GIC ITS
Message-ID: <20250506174923.4fce914c@imammedo.users.ipa.redhat.com>
In-Reply-To: <6b64af93-f542-4a0e-8e55-5bb235f42c83@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
	<20250403151829.44858-14-philmd@linaro.org>
	<20250404124110.59c59dc3@imammedo.users.ipa.redhat.com>
	<6b64af93-f542-4a0e-8e55-5bb235f42c83@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WFt9mquK6xAMDhhxnMjeXHwIuEbTzr8WQ6AmrR56oXg_1746546566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zgHRppYdjo8B

On Fri, 4 Apr 2025 14:49:45 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 4/4/25 12:41, Igor Mammedov wrote:
> > On Thu,  3 Apr 2025 17:18:28 +0200
> > Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> >  =20
> >> GIC ITS can be disabled at runtime using '-M its=3Doff',
> >> which sets VirtMachineState::its =3D false. Check this
> >> field to avoid advertising the ITS in the MADT table.
> >>
> >> Reported-by: Udo Steinberg <udo@hypervisor.org>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >> ---
> >>   hw/arm/virt-acpi-build.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index e7e27951cb9..38a9e6fe0c5 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
> >>   {
> >>       VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
> >>  =20
> >> -    return !vmc->no_its;
> >> +    return !vmc->no_its && vms->its; =20
> >=20
> > It's confusing have both no_its and its,
> > it would be better to lean this mess up (i.e dedup or rename if somethi=
ng is poorly named) =20
>=20
> What about:
>=20
> class: s/no_its/!its_createable/ or !its_usable
> state: s/its/its_created/ or its_used or its_in_use

looking at the code what we are essentially doing with variables in class,
is selecting its device type. And then playing scattered if/then game to de=
cide
which 'its' to create or not create.
can we make something like this instead:

 machine_foo_class_init_vX():
  vmc->its_type =3D NULL;

 machine_foo_class_init_vX+1():
  vmc->its_type =3D accel_get_its_type()
=20
and then elsewhere:

if(vmc->its_type && vms->its_enabled)
    create_its(vmc->its_type)

