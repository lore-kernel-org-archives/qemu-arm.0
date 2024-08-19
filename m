Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2043744njf;
        Mon, 19 Aug 2024 05:07:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqaXWdX7Q/OtnL/PfyDVEiAXytwtGmaOdrU6tZdKwNBl0v6ZPvF16TW+bymDtYaFjnEC6+PqY7tsxyA6rYqo3Y9S58pqBD
X-Google-Smtp-Source: AGHT+IFRnIaeF3GINGD+cVDEuTuIZq0Xw9F1Uvb9mIQaPOAkUgsy27iQ8VeQa77q42PubeuNVYQW
X-Received: by 2002:a5d:6da2:0:b0:362:d7ac:ae70 with SMTP id ffacd0b85a97d-37194b956afmr6739281f8f.5.1724069243420;
        Mon, 19 Aug 2024 05:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724069243; cv=none;
        d=google.com; s=arc-20160816;
        b=mbzvguHLnYWXY297nZEVs4GZVWV2hBUnCL/6mvSt0M03Bw5+DdOvZE0Iz+ZwZB8hDl
         nm1a4GKIPr2Lgbd3EloxZ6g4IxZSmBq2vkxN3OzYcDFOmzoKFSXTSOLU9VvzG3hjkJQp
         NKhIxCil2YnYEpjFGulngI7mOL8tnypvLN2gosdXSa6j3nyGL+hLdZykdp6mRumr+lIP
         /e24z3WX1FmU5DfwskOGannE7jxj9+vLn0GSOlPHk7jOIx4MhqXCmB9NaNaGyGinC9Bj
         L00MVvJUTkK8Lfo4MOwWSQicJ3+69AO8qJl3APZs7WX7Xfs1663exCg19nfCzljKNQhC
         apnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=cyTaiR4gh9bMnQroAQ6FwqGbX8D/OdqoMtYC2MX5Xv0=;
        fh=Xq5M9Y2M/Z6LV7hPYgedWi4nWNiVNO0n3TP39ijLCpw=;
        b=B0C3RxysrwA42woHGSVA1M35ZxTwGr4WEcIcLCTXCDJtiPEoyQy7xCRXUug5RhA4s0
         KzuW9a+PEuV0EYe+gUI/b8c53fXQyZp01UdytvTCEeAaJwehuYoTRL0HPm4IiIF/l+wR
         bI/D1DhwAo0gq4BIWuT1g/Q1qFkDuoE9I4wlFI+Plr8f3pY1gVLjnfvdYmO5s3O+/BtG
         ZMlpTzjdUedJCEiuqOCq5oPK2nsRXvQzrvgn62FyZhtmVZdMRWfyivTeF6vREIwmN5Vm
         dBp/ihcbsC3boBxq7yr9NbZ7c4lTYmgujQ0Xxe7rzkC2SeG7E4v0AoNH9EXskie38G8g
         maCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3718989fa91si4152117f8f.415.2024.08.19.05.07.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 05:07:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WnWVC1xgdz6LDDn;
	Mon, 19 Aug 2024 20:04:19 +0800 (CST)
Received: from lhrpeml100003.china.huawei.com (unknown [7.191.160.210])
	by mail.maildlp.com (Postfix) with ESMTPS id 315A0140680;
	Mon, 19 Aug 2024 20:07:22 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:07:21 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 19 Aug 2024 13:07:21 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, Gavin Shan <gshan@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Thread-Topic: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
Thread-Index: AQHaverDPpQr1lKFK0SrrcqBF6W41rIjVaUAgAA9dwCAC04sIA==
Date: Mon, 19 Aug 2024 12:07:21 +0000
Message-ID: <14027b794794485e9ac5e5561bc4f41a@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-2-salil.mehta@huawei.com>
	<11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
 <20240812101556.1a395712@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240812101556.1a395712@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.151.47]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: Zb2DCYkYtFyq

>  From: Igor Mammedov <imammedo@redhat.com>
>  Sent: Monday, August 12, 2024 9:16 AM
>  To: Gavin Shan <gshan@redhat.com>
> =20
>  On Mon, 12 Aug 2024 14:35:56 +1000
>  Gavin Shan <gshan@redhat.com> wrote:
> =20
>  > On 6/14/24 9:36 AM, Salil Mehta wrote:
>  > > This shall be used to store user specified
>  > > topology{socket,cluster,core,thread}
>  > > and shall be converted to a unique 'vcpu-id' which is used as
>  > > slot-index during hot(un)plug of vCPU.
>  > >
>  > > Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>  > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>  > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>  > > ---
>  > >   hw/arm/virt.c         | 10 ++++++++++
>  > >   include/hw/arm/virt.h | 28 ++++++++++++++++++++++++++++
>  > >   target/arm/cpu.c      |  4 ++++
>  > >   target/arm/cpu.h      |  4 ++++
>  > >   4 files changed, 46 insertions(+)
>  > >
>  >
>  > Those 4 properties are introduced to determine the vCPU's slot, which
>  > is the index to MachineState::possible_cpus::cpus[]. From there, the
>  > CPU object or instance is referenced and then the CPU's state can be
>  > further determined. It sounds reasonable to use the CPU's topology to
>  > determine the index. However, I'm wandering if this can be simplified =
to
>  use 'cpu-index' or 'index' for a couple of facts: (1) 'cpu-index'
> =20
>  Please, don't. We've spent a bunch of time to get rid of cpu-index in us=
er
>  visible interface (well, old NUMA CLI is still there along with 'new' to=
pology
>  based one, but that's the last one).


Agreed. We shouldn't expose CPU index to user.

> =20
>  > or 'index' is simplified. Users have to provide 4 parameters in order
>  > to determine its index in the extreme case, for example "device_add
>  > host-arm-cpu, id=3Dcpu7,socket-id=3D1,
>  > cluster-id=3D1,core-id=3D1,thread-id=3D1". With 'cpu-index' or 'index'=
, it
>  > can be simplified to 'index=3D7'. (2) The cold-booted and hotpluggable
>  > CPUs are determined by their index instead of their topology. For
>  > example, CPU0/1/2/3 are cold-booted CPUs while CPU4/5/6/7 are
>  hotpluggable CPUs with command lines '-smp maxcpus=3D8,cpus=3D4'. So 'in=
dex'
>  makes more sense to identify a vCPU's slot.
>  cpu-index have been used for hotplug with x86 machines as a starting poi=
nt
>  to implement hotplug as it was easy to hack and it has already existed i=
n
>  QEMU.
> =20
>  But that didn't scale as was desired and had its own issues.
>  Hence the current interface that majority agreed upon.
>  I don't remember exact arguments anymore (they could be found qemu-
>  devel if needed) Here is a link to the talk that tried to explain why to=
po
>  based was introduced.
> =20
>  http://events17.linuxfoundation.org/sites/events/files/slides/CPU%20Hot-
>  plug%20support%20in%20QEMU.pdf


I think you are referring to slide-19 of above presentation?

Thanks
Salil.
