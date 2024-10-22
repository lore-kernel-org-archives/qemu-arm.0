Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp72742njb;
        Tue, 22 Oct 2024 16:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoU4nQRyDGVdYnrOAQyF0VFlUwFh3k4htY6qzRsmsTLXfs4HosFh1RtagDwcjU7dWpnqSaV1RRqFFVZA==@linaro.org
X-Google-Smtp-Source: AGHT+IEuimT7zAwg6J0UIUkVRlLuOk5q07PcgXbp4+YF5t8c2Yiygi4H1UM3m1xkhGdrvhcGg4rF
X-Received: by 2002:a05:600c:1c95:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-43184133fc4mr5620095e9.2.1729641476625;
        Tue, 22 Oct 2024 16:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729641476; cv=none;
        d=google.com; s=arc-20240605;
        b=d8T9xea9P721tI/ZQMUeBiqIsv5hB1uSQwq0qVjYR+iwNQJU6loZTw+FfRC8d0p66l
         /63csoeHysDeaIe57w2qHe9Z1F/xu80sz/DdLXwQRx1zaMApgTCbCyShF9SxvqOYUFnh
         BnFHecDkl9cGPuz1aui69GvWWgaWAFMHDpI1DeObquqmzrUDcASsUCcvWfxY7uj++mRU
         eXCMnR/iHPMbsNYJ4aydCsg9UE/BowqQTakrwrDY7bOVi01PJI9qNeGpaJPHx8MQrjoE
         ydL+cypfG936ZX8/aIOFsPQWVSt0pW/yDCz2UuVIpdFI7RsNZnLUmh2O0xNoebSIAFOv
         c7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Mjx0sRpzwnARzaYW1qwtigRQEFlREg/2KbbSund29jg=;
        fh=b/SX6GG71f9+bLfLBvQcX6oLBcOeE4ofRqFQKBOtBxw=;
        b=ChC45OOGbqp10Rzj8SF/eovmA4coCgQTTrJ3Vbqmo/DoKdD8qhXe786sjL9TXKHa6D
         dOLCwkbYgtEyGNkqWt/4XmlXixaJ2RxPFCVKMMH9GBOdZKI9l5ZiRXO2HrEJAbyO9kLj
         gHMh6Hp71SgyKDnpnwml2zgXv+S98JOhfdZ+Vv1/OMWGgxxwDemTmHmAybJcQpJeSTFm
         e2BolHSKXidx/OiWh1MTjSnkB43DBawHZ9P3+6g+LT48V6KkywghSpGIM0u8WJneOHy2
         cE4QCTrTkF8MbpnDgPfXqC2/Ij8SWW043cI2TNueOsDorjrpyjvIWVvS3H2YHuMyFpP2
         1ZEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43186c3a8a5si245775e9.107.2024.10.22.16.57.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 16:57:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XY8Gz1BSDz6K9By;
	Wed, 23 Oct 2024 07:56:59 +0800 (CST)
Received: from frapeml100005.china.huawei.com (unknown [7.182.85.132])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F946140B35;
	Wed, 23 Oct 2024 07:57:55 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml100005.china.huawei.com (7.182.85.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 01:57:55 +0200
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Wed, 23 Oct 2024 01:57:55 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
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
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"shahuang@redhat.com" <shahuang@redhat.com>, "zhao1.liu@intel.com"
	<zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>,
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>
Subject: RE: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
Thread-Topic: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
Thread-Index: AQHbHm6XRQnHA1hqSkuTlA12W4mCybKMdIeAgAcJKtA=
Date: Tue, 22 Oct 2024 23:57:55 +0000
Message-ID: <a8f41af5e450446e8dd68ebf9b9305a6@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-4-salil.mehta@huawei.com>
 <20241018162437.782c12c1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241018162437.782c12c1@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.148.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: xrn6+xYvalx+

Hi Igor,

>  From: Igor Mammedov <imammedo@redhat.com>
>  Sent: Friday, October 18, 2024 3:25 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
>  Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; mst@redhat.com;
>  maz@kernel.org; jean-philippe@linaro.org; Jonathan Cameron
>  <jonathan.cameron@huawei.com>; lpieralisi@kernel.org;
>  peter.maydell@linaro.org; richard.henderson@linaro.org;
>  andrew.jones@linux.dev; david@redhat.com; philmd@linaro.org;
>  eric.auger@redhat.com; will@kernel.org; ardb@kernel.org;
>  oliver.upton@linux.dev; pbonzini@redhat.com; gshan@redhat.com;
>  rafael@kernel.org; borntraeger@linux.ibm.com; alex.bennee@linaro.org;
>  npiggin@gmail.com; harshpb@linux.ibm.com; linux@armlinux.org.uk;
>  darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
>  vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
>  miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
>  <zhukeqian1@huawei.com>; wangxiongfeng (C)
>  <wangxiongfeng2@huawei.com>; wangyanan (Y)
>  <wangyanan55@huawei.com>; jiakernel2@gmail.com;
>  maobibo@loongson.cn; lixianglai@loongson.cn; shahuang@redhat.com;
>  zhao1.liu@intel.com; Linuxarm <linuxarm@huawei.com>;
>  gustavo.romero@linaro.org
>  Subject: Re: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
>  states in ACPI _STA.{PRES,ENA} Bits
> =20
>  On Mon, 14 Oct 2024 20:22:04 +0100
>  Salil Mehta <salil.mehta@huawei.com> wrote:
> =20
>  > Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the
>  > `_STA.PRES`
>  > (presence) and `_STA.ENA` (enabled) bits when the guest kernel
>  > evaluates the ACPI `_STA` method during initialization, as well as
>  > when vCPUs are hot-plugged or hot-unplugged. The presence of
>  unplugged
>  > vCPUs may need to be deliberately
>  > *simulated* at the ACPI level to maintain a *persistent* view of vCPUs
>  > for the guest kernel.
> =20
>  given questionable future of is_present/is_enabled fields, it probably
>  premature to review this part.


Sure, let us discuss the pain points.=20


>  The only thing, I have to say here is repeating spec/doc update patch
>  describing how it should work should come 1st, so that we could compare
>  this impl. with it.


From the user perspective, there should not be any change in how he
plug/unplugs the ARM vCPUs. This is a requirement, as we have to
assists folks who wants to migrate from x86 world to ARM world
seamlessly (without affecting performance parameters) and this
feature is one small part of that bigger effort.


>  > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>  > ---
>  >  hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
>  >  1 file changed, 22 insertions(+), 4 deletions(-)
>  >
>  > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index
>  > 700aa855e9..23ea2b9c70 100644
>  > --- a/hw/acpi/cpu.c
>  > +++ b/hw/acpi/cpu.c
>  > @@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque,
>  hwaddr addr, unsigned size)
>  >      cdev =3D &cpu_st->devs[cpu_st->selector];
>  >      switch (addr) {
>  >      case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
>  > -        val |=3D cdev->cpu ? 1 : 0;
>  > +        val |=3D cdev->is_enabled ? 1 : 0;
>  >          val |=3D cdev->is_inserting ? 2 : 0;
>  >          val |=3D cdev->is_removing  ? 4 : 0;
>  >          val |=3D cdev->fw_remove  ? 16 : 0;
>  > +        val |=3D cdev->is_present ? 32 : 0;
>  >          trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>  >          break;
>  >      case ACPI_CPU_CMD_DATA_OFFSET_RW:
>  > @@ -376,6 +377,7 @@ const VMStateDescription vmstate_cpu_hotplug =3D
>  {
>  > #define CPU_REMOVE_EVENT  "CRMV"
>  >  #define CPU_EJECT_EVENT   "CEJ0"
>  >  #define CPU_FW_EJECT_EVENT "CEJF"
>  > +#define CPU_PRESENT       "CPRS"
>  >
>  >  void build_cpus_aml(Aml *table, MachineState *machine,
>  CPUHotplugFeatures opts,
>  >                      build_madt_cpu_fn build_madt_cpu, hwaddr
>  > base_addr, @@ -436,7 +438,9 @@ void build_cpus_aml(Aml *table,
>  MachineState *machine, CPUHotplugFeatures opts,
>  >          aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>  >          /* tell firmware to do device eject, write only */
>  >          aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
>  > -        aml_append(field, aml_reserved_field(3));
>  > +        /* 1 if present, read only */
>  > +        aml_append(field, aml_named_field(CPU_PRESENT, 1));
>  > +        aml_append(field, aml_reserved_field(2));
>  >          aml_append(field, aml_named_field(CPU_COMMAND, 8));
>  >          aml_append(cpu_ctrl_dev, field);
>  >
>  > @@ -466,6 +470,7 @@ void build_cpus_aml(Aml *table, MachineState
>  *machine, CPUHotplugFeatures opts,
>  >          Aml *ctrl_lock =3D aml_name("%s.%s", cphp_res_path, CPU_LOCK)=
;
>  >          Aml *cpu_selector =3D aml_name("%s.%s", cphp_res_path,
>  CPU_SELECTOR);
>  >          Aml *is_enabled =3D aml_name("%s.%s", cphp_res_path,
>  > CPU_ENABLED);
>  > +        Aml *is_present =3D aml_name("%s.%s", cphp_res_path,
>  > + CPU_PRESENT);
>  >          Aml *cpu_cmd =3D aml_name("%s.%s", cphp_res_path,
>  CPU_COMMAND);
>  >          Aml *cpu_data =3D aml_name("%s.%s", cphp_res_path, CPU_DATA);
>  >          Aml *ins_evt =3D aml_name("%s.%s", cphp_res_path,
>  > CPU_INSERT_EVENT); @@ -494,13 +499,26 @@ void build_cpus_aml(Aml
>  *table, MachineState *machine, CPUHotplugFeatures opts,
>  >          {
>  >              Aml *idx =3D aml_arg(0);
>  >              Aml *sta =3D aml_local(0);
>  > +            Aml *ifctx2;
>  > +            Aml *else_ctx;
>  >
>  >              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>  >              aml_append(method, aml_store(idx, cpu_selector));
>  >              aml_append(method, aml_store(zero, sta));
>  > -            ifctx =3D aml_if(aml_equal(is_enabled, one));
>  > +            ifctx =3D aml_if(aml_equal(is_present, one));
>  >              {
>  > -                aml_append(ifctx, aml_store(aml_int(0xF), sta));
>  > +                ifctx2 =3D aml_if(aml_equal(is_enabled, one));
>  > +                {
>  > +                    /* cpu is present and enabled */
>  > +                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
>  > +                }
>  > +                aml_append(ifctx, ifctx2);
>  > +                else_ctx =3D aml_else();
>  > +                {
>  > +                    /* cpu is present but disabled */
>  > +                    aml_append(else_ctx, aml_store(aml_int(0xD), sta)=
);
>  > +                }
>  > +                aml_append(ifctx, else_ctx);
>  >              }
>  >              aml_append(method, ifctx);
>  >              aml_append(method, aml_release(ctrl_lock));
> =20
