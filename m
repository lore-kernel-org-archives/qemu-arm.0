Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2629776njb;
        Mon, 21 Oct 2024 13:47:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWexMsA0J398TmTUdak1DMC38pLJ/+iFqmGcCjMK3CVaL2+U7rstWtHXBIpQd1Q+UUv3kmHRh4gvPngDQ==@linaro.org
X-Received: by 2002:a17:906:4fcb:b0:a99:7c14:9197 with SMTP id a640c23a62f3a-a9a69ca14a1mr1034260266b.64.1729543635154;
        Mon, 21 Oct 2024 13:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729543635; cv=none;
        d=google.com; s=arc-20240605;
        b=ez8I4/eCF8ylbukISnXaBqIT+SmrshR4HIPJQ7TMorstIS9W3mE2Gu6wciEC9A8wLL
         gj3QPy8D54mXG7eYVKuAZ3bnpVMPhIiJNMD5OeiS1vViNLGQO9CaFQtkdmT02poDUVQQ
         MkrCwFGhoz72/Uv2DDMl6hIFyByoV3o78glOG3su7xdx5SBtAo5ap6D8vnPk1Hsp7CkM
         ET2YkfRMl05bPCdEqr9o36SHYyINk1hmdqBjf4mnc30/gEpOB3VuKp1K2ieFmz0RxPM0
         SKlxo1W1RU1BeKEKpQVkSMbVxAQkQo970HiIdEgHVPpD4+HMEUEsVPxJSP88MgHj6ZQ+
         py+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N+6LrkdgPv0SCEWFTJM7+H5x0MLlTOlerbCbkD0hUGE=;
        fh=GtrknmlxNeMCTokrcgkAU31ZT1c/UL3IMqTCN7DLQIA=;
        b=kb2ekQXwPEVJ5qhj4CV9GtwXXK4WOY+VYHQOfYUo0dffE+CPu5S1ASA1gz6HhTWZz2
         DvjRV+K9ynb0xGGLIDGj8O5dmjWYIfs75T6pNPDVXzc0vNC0lJJPeHtbDlA5KZE4pMYa
         jr4r24AOpMC4XJWL3IebOq1wxA1BQSAJwYfqEXHfVpilqJmNanEYd5uXL8Lnd0p/SvvH
         xrH677VIFO3M0KcLK8He31NKj15+QmNWV8FLzIKGTC1kTHUMmUPoQcPC0Du2mlAJh2E+
         j4ytva02YL9ICzxHZjSOoTDI1ZMLO9zHM/EuN85y1V7l4x7o/lPMBh93LOIzo/Mw2qL0
         f1Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=LlsgEF72;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
Return-Path: <salil.mehta@opnsrc.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9aae96dd43sor2191066b.9.2024.10.21.13.47.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2024 13:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@opnsrc.net header.s=google header.b=LlsgEF72;
       spf=pass (google.com: domain of salil.mehta@opnsrc.net designates 209.85.220.41 as permitted sender) smtp.mailfrom=salil.mehta@opnsrc.net;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1729543634; x=1730148434; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N+6LrkdgPv0SCEWFTJM7+H5x0MLlTOlerbCbkD0hUGE=;
        b=LlsgEF72H+noEV4Rv8ACysiLPYnnJW1/qM7LLGkLfgxLJlQLtY0VV0yvq5LfY4eK0h
         Fe2c7SdCtM2HhgL09lxkbY6zaSMgA6UKUFaMChScq211YYXjxugJnSeZL0dhy26cigJf
         +2lO0wQHVci6KXzkGYiUzhMLegUUHgxJiaPhF4tC6BaE9YKBG7EoTeXNkU+7AG6cIy3P
         MqkNizlkjV8mWHQF8vEcYBwCLxY1mJ3hJT6HF9Z2r6jIh7bo+/oun4+Im4kvgJ3zKhq9
         3JCZTTv4/1RJ7uwVr1+EZuloJfUKUtl3Emrs5D11s6qZXnnloMvC3BQZufI5uTfys0LW
         O8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543634; x=1730148434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+6LrkdgPv0SCEWFTJM7+H5x0MLlTOlerbCbkD0hUGE=;
        b=tbZ18wEQff8MK3XjXTw58B9xF334TUZEFgeGZ+gzvhYcmH99k8EjqK+30f3uzNe4t1
         hEaOG3sxjNbabh72nKrHEtFNtEaoqPiQaodOzpcskDud5QyDV/ropU4DZ0SrkJ47O21t
         PToKXTbw+ZhjhyNmmobEuPWFgTnPCEbtcoiOLl7wjIUKhyzr1SHm9LRDBqkrTXQqo5IC
         xKK+xCPnVHPBsxWR5cdAYeL//DY9U8yPo46kxws0EqbuXH/auoD/RfrwtocWIOE7YiDZ
         6h1VKpjd4QaFBb8WU0CUy3C+y5VqZBEqjQdyzSeAXoE4wJZWopoP1d9rFmyA1/aEbLA1
         3VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn7D9MJ0qNBDbK8pqzFSgJGbtRJDVTMFCor4VNTVMcBkNyt26riv0FUaJSANPrOM5oZnK8d1K6NF0Wlw==@linaro.org
X-Gm-Message-State: AOJu0YwbJ7O5+xHyii3KxG0dJU3936BCW4zvHbJkPKPiU0hdkpPD3DxD
	lXWCQ2baZKsZE3K9YhxxUjAsYq1Vag18xiGyS623pHgB2dGMRoYcmhZigraDgAd/7PakRWL3l8S
	ID1/JS1jUDIkKDXdLTfDy0rm8rnzzRGztz5b3fA==
X-Google-Smtp-Source: AGHT+IGBnt1Ft8t2uBs0XRqJOmoi3jCyDqY2PNSHP9Q/TPOGhkb83fnd19zIZ+eDDmduCKgexTnmohBsb3A2aXN6hYk=
X-Received: by 2002:a17:907:3ea1:b0:a99:529d:81ae with SMTP id
 a640c23a62f3a-a9a69ca14b7mr1377217666b.55.1729543634438; Mon, 21 Oct 2024
 13:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241015100012.254223-1-salil.mehta@huawei.com> <b403fa29-2ccb-40fa-89d3-ce6d4152b766@redhat.com>
In-Reply-To: <b403fa29-2ccb-40fa-89d3-ce6d4152b766@redhat.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Mon, 21 Oct 2024 21:47:01 +0100
Message-ID: <CAJ7pxea0y8zPXmDj2cdPjow1KweE+_+YdAK+tau1GdD8hYUOmQ@mail.gmail.com>
Subject: Re: [PATCH RFC V5 00/30] Support of Virtual CPU Hotplug for ARMv8 Arch
To: Gavin Shan <gshan@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	mst@redhat.com, maz@kernel.org, jean-philippe@linaro.org, 
	jonathan.cameron@huawei.com, lpieralisi@kernel.org, peter.maydell@linaro.org, 
	richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
	david@redhat.com, philmd@linaro.org, peterx@redhat.com, eric.auger@redhat.com, 
	will@kernel.org, ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
	rafael@kernel.org, borntraeger@linux.ibm.com, alex.bennee@linaro.org, 
	npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk, 
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com, 
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, 
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn, 
	lixianglai@loongson.cn, shahuang@redhat.com, zhao1.liu@intel.com, 
	linuxarm@huawei.com, gustavo.romero@linaro.org
Content-Type: multipart/alternative; boundary="000000000000f465c1062502c1c3"
X-TUID: H5yTsDPsky4w

--000000000000f465c1062502c1c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gavin,

Sorry for the late reply. I had to travel outside the UK urgently because
of some
personal challenging situation. I'm still on the transit back to the UK
hence replying
from my other email ID..

On Thu, Oct 17, 2024 at 8:07=E2=80=AFAM Gavin Shan <gshan@redhat.com> wrote=
:

> Hi Salil,
>
> The issues reported against on RFCv3 are still existing. I'm listing them
> as below two.
>


Yes, the one existing I had mentioned as part of the TODO list at the end
of the RFC V5. Including below two mentioned.



> (1) Guest fails to start due to SVE initialization
>


I do not have the hardware to test this. I will not mind if you can share a
patch and also test this part.


>
> /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  =
\
> -accel kvm -machine virt,gic-version=3Dhost,nvdimm=3Don                  =
    \
> -cpu host -smp maxcpus=3D4,cpus=3D1,sockets=3D2,clusters=3D2,cores=3D1,th=
reads=3D1   \
> -m 4096M,slots=3D16,maxmem=3D128G                                        =
    \
> -object memory-backend-ram,id=3Dmem0,size=3D2048M                        =
    \
> -object memory-backend-ram,id=3Dmem1,size=3D2048M                        =
    \
>    :
> kvm_arch_init_vcpu: Error -22 from kvm_arm_sve_set_vls()
> qemu-system-aarch64: Failed to initialize host vcpu 1
>
> Workaround: The SVE feature bits in ID_AA64PFR0 need to be masked off in
> kvm_arm_get_host_cpu_features() after the feature register's value is rea=
d
> from the host.
>

This would happen if the kvm_arch_init_vcpu will be called again during
hotplug and its SVE related config is different from the one initially
configured at the KVM init time. I had included a patch to check such
configuration but did not test it for any of the ARm extensions
i.e. SVE, SME etc.

https://lore.kernel.org/qemu-devel/20241015100012.254223-23-salil.mehta@hua=
wei.com/


>
> (2) Fail to hot add vCPU whose PMU is turned off
>
> /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  =
\
> -accel kvm -machine virt,gic-version=3Dhost,nvdimm=3Don                  =
    \
> -cpu host -smp maxcpus=3D4,cpus=3D1,sockets=3D2,clusters=3D2,cores=3D1,th=
reads=3D1   \
> -m 4096M,slots=3D16,maxmem=3D128G                                        =
    \
> -object memory-backend-ram,id=3Dmem0,size=3D2048M                        =
    \
> -object memory-backend-ram,id=3Dmem1,size=3D2048M                        =
    \
>    :
> (qemu) device_add
> host-arm-cpu,id=3Dcpu1,socket-id=3D0,cluster-id=3D1,core-id=3D0,thread-id=
=3D0,pmu=3Doff
> kvm_arch_init_vcpu: Error -22 from kvm_arm_vcpu_init()
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (1): Invali=
d
> argument
>
> Workaround: Keep PMU on while the vCPU is hot added.
>

we should disallow any vCPU configuration different than already configured
at the KVM during VM initialization time.

Thanks


>
>
> Thanks,
> Gavin
>
>
>

--000000000000f465c1062502c1c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Gavin,<br></div><div =
dir=3D"ltr"><br></div><div>Sorry for the late reply. I had to travel outsid=
e the UK urgently because of some=C2=A0</div><div>personal=C2=A0challenging=
 situation. I&#39;m still on the transit back to the UK hence replying</div=
><div>from my other email ID..</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 17, 2024 at 8:07=E2=80=AFAM Gavin=
 Shan &lt;<a href=3D"mailto:gshan@redhat.com">gshan@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Salil,<br>
<br>
The issues reported against on RFCv3 are still existing. I&#39;m listing th=
em<br>
as below two.<br></blockquote><div><br></div><div><br></div><div>Yes, the o=
ne existing I had mentioned as part of the TODO list at the end</div><div>o=
f the RFC V5. Including below two mentioned.</div><div>=C2=A0</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
(1) Guest fails to start due to SVE initialization<br></blockquote><div><br=
></div><div><br></div><div>I do not have the hardware to test this. I will =
not mind if you can share a</div><div>patch and also test this part.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-accel kvm -machine virt,gic-version=3Dhost,nvdimm=3Don=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-cpu host -smp maxcpus=3D4,cpus=3D1,sockets=3D2,clusters=3D2,cores=3D1,thre=
ads=3D1=C2=A0 =C2=A0\<br>
-m 4096M,slots=3D16,maxmem=3D128G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-object memory-backend-ram,id=3Dmem0,size=3D2048M=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
-object memory-backend-ram,id=3Dmem1,size=3D2048M=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
=C2=A0 =C2=A0:<br>
kvm_arch_init_vcpu: Error -22 from kvm_arm_sve_set_vls()<br>
qemu-system-aarch64: Failed to initialize host vcpu 1<br>
<br>
Workaround: The SVE feature bits in ID_AA64PFR0 need to be masked off in<br=
>
kvm_arm_get_host_cpu_features() after the feature register&#39;s value is r=
ead<br>
from the host.<br></blockquote><div><br></div><div>This would happen if the=
 kvm_arch_init_vcpu will be called again during</div><div>hotplug and its S=
VE related config is different from the one initially</div><div>configured =
at the KVM init time. I had included a patch to check such</div><div>config=
uration but did not test it for any of the ARm extensions</div><div>i.e. SV=
E, SME etc.</div><div><br></div><div><a href=3D"https://lore.kernel.org/qem=
u-devel/20241015100012.254223-23-salil.mehta@huawei.com/">https://lore.kern=
el.org/qemu-devel/20241015100012.254223-23-salil.mehta@huawei.com/</a><br><=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
(2) Fail to hot add vCPU whose PMU is turned off<br>
<br>
/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-accel kvm -machine virt,gic-version=3Dhost,nvdimm=3Don=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-cpu host -smp maxcpus=3D4,cpus=3D1,sockets=3D2,clusters=3D2,cores=3D1,thre=
ads=3D1=C2=A0 =C2=A0\<br>
-m 4096M,slots=3D16,maxmem=3D128G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-object memory-backend-ram,id=3Dmem0,size=3D2048M=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
-object memory-backend-ram,id=3Dmem1,size=3D2048M=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
=C2=A0 =C2=A0:<br>
(qemu) device_add host-arm-cpu,id=3Dcpu1,socket-id=3D0,cluster-id=3D1,core-=
id=3D0,thread-id=3D0,pmu=3Doff<br>
kvm_arch_init_vcpu: Error -22 from kvm_arm_vcpu_init()<br>
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (1): Invalid =
argument<br>
<br>
Workaround: Keep PMU on while the vCPU is hot added.<br></blockquote><div><=
br></div><div>we should disallow any vCPU configuration different than alre=
ady configured</div><div>at the KVM during VM initialization time.</div><di=
v><br></div><div>Thanks</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
<br>
Thanks,<br>
Gavin<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000f465c1062502c1c3--
