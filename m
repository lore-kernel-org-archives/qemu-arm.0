Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1910972ejb;
        Tue, 3 Oct 2023 04:51:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgGTYGxqpGmQDik2LdfieTzMbFwvubUr84l9IgE3L0QRzK+MKmLpHKjdlESNJDVq/Bc3+y
X-Received: by 2002:a5d:4cc3:0:b0:318:7bd:349e with SMTP id c3-20020a5d4cc3000000b0031807bd349emr11898496wrt.29.1696333874690;
        Tue, 03 Oct 2023 04:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696333874; cv=none;
        d=google.com; s=arc-20160816;
        b=JKnIpt3iiptYRCjWhaHXpJeWroiTp/e1Z9Jo5G5bFmw6h8P1nvMlAbolUiUr8pK+R6
         4UfJmQWu1jW//MpHWfIXxdmMmzQVCocxbfdQiisGBNUP3tTsv4UYjfXaa/wMJESm+SEO
         //epLOB3YFwJ2LtXjYxxfY6H9XHEz/yTDNzj/DNUQxzGMoDIefQagV+oEYQl2agWNROg
         e9pdfJEMs3yf0d+5dywdSU+ivTSkD0FPvDUTp4QapISMZM8gUuYzasaMglkEM+OSrgoz
         cGmOdIMvnL5wmNm8QVNgaMxDiC1mXFouRZpmVeL18cl5thwSniCPJb25BZuhrsSu55ye
         eUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=hoWYDPsAg/4BEFxTyoWb36QwP+c+avyE4C0eQ+ta7+Y=;
        fh=cJldi6pGemqSxOtsGTKyEggQwVc4gAdg2lGk8CIZ6M0=;
        b=QD+zba6tjwk4A1niH3+IdHbiGx5s/0M6J3wUV/vMXATDI2y99WILOEDl4b+6P1e9X5
         9P+6oYjoUoizvP3HluNLwOYzOSHuY6G8tK2aTXEp9nuYTXnQ16boHpn/Gb2bPk/Ulpjb
         is5uEkspOxFe03xuJqrExppjgFcc8hKgiaxZZDRyR9fR49z7SRunpMzmeUEkH2lPCDlO
         VUP+0EkkV85w1IGYoaKjK5BqK/YL8kqHKQLdJxnNSd0xJTJI+txAUH7zxOw82n+utowi
         bOV6gkuJBoUfFMhEYxGqTQmNBzR0fNF0edIVzm60JcuOYZPQnEOPKrZb1U58Qo0unxub
         oPmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o3-20020adfe803000000b003196cc883a2si677827wrm.486.2023.10.03.04.51.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GL904xFz6HJZS;
	Tue,  3 Oct 2023 19:48:32 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 3 Oct
 2023 12:51:12 +0100
Date: Tue, 3 Oct 2023 12:51:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
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
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Message-ID: <20231003125111.00002013@Huawei.com>
In-Reply-To: <761a05a972ae4aa088b8e984bd89889f@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-2-salil.mehta@huawei.com>
	<20231002165322.00003a2e@Huawei.com>
	<761a05a972ae4aa088b8e984bd89889f@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: bVT+jMGCtB+i

On Tue, 3 Oct 2023 12:05:11 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Hi Jonathan,
> 
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> > Sent: Monday, October 2, 2023 4:53 PM
> > To: Salil Mehta <salil.mehta@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> > philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> > richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev;
> > david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> > oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> > will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> > alex.bennee@linaro.org; linux@armlinux.org.uk;
> > darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> > vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> > miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> > <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> > wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> > maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.com>
> > Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
> > {creation,parking} code
> > 
> > On Sat, 30 Sep 2023 01:19:24 +0100
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >   
> > > KVM vCPU creation is done once during the initialization of the VM when Qemu
> > > threads are spawned. This is common to all the architectures.
> > >
> > > Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
> > > the KVM vCPU objects in the Host KVM are not destroyed and their representative
> > > KVM vCPU objects/context in Qemu are parked.
> > >
> > > Refactor common logic so that some APIs could be reused by vCPU Hotplug code.
> > >
> > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>  
> > 
> > Hi Salil,
> > 
> > A few trivial things inline, plus a question about why
> > cpu->cpu_index can now be used but kvm_arch_vcpu_id(cpu);
> > was previously needed.  
> 
> Good point. I used the API because it was returning
> 'unsigned long' and it was being used across the archs.
> I thought maybe the size of the index could vary across
> archs. For example, for PowerPC above API returns vcpu_id
> which presumably could have different data type than
> an 'integer'.
> 
> But after Alex's comment, I was made to believe that this
> assumption might not be correct and CPU index is an
> 'integer' across archs and perhaps semantics of above
> API is not correct.
> 
> But perhaps original code was functionally correct?

I wasn't concerned with the type, but rather that the
value comes from other places than cpu->cpu_index
on some architectures.
> 
> 
> > >  accel/kvm/kvm-all.c  | 63 +++++++++++++++++++++++++++++++++-----------
> > >  include/sysemu/kvm.h | 14 ++++++++++
> > >  2 files changed, 61 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > index ff1578bb32..b8c36ba50a 100644
> > > --- a/accel/kvm/kvm-all.c
> > > +++ b/accel/kvm/kvm-all.c
> > > @@ -80,7 +80,7 @@
> > >  #endif
> > >
> > >  struct KVMParkedVcpu {
> > > -    unsigned long vcpu_id;
> > > +    int vcpu_id;
> > >      int kvm_fd;
> > >      QLIST_ENTRY(KVMParkedVcpu) node;
> > >  };
> > > @@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
> > >  #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
> > >
> > >  static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
> > > +static int kvm_get_vcpu(KVMState *s, int vcpu_id);
> > >
> > >  static inline void kvm_resample_fd_remove(int gsi)
> > >  {
> > > @@ -320,11 +321,49 @@ err:
> > >      return ret;
> > >  }
> > >
> > > +void kvm_park_vcpu(CPUState *cpu)
> > > +{
> > > +    int vcpu_id = cpu->cpu_index;
> > > +    struct KVMParkedVcpu *vcpu;
> > > +
> > > +    vcpu = g_malloc0(sizeof(*vcpu));
> > > +    vcpu->vcpu_id = vcpu_id;  
> > 
> > As vcpu_id is only used here why have the local variable?
> > Maybe that changes in later patches, in which case ignore this.
> > 
> >     vcpu->vcpu_id = cpu->cpu_index;  
> 
> 
> Yes, thanks.
> 
> 
> > 
> > Why is kvm_arch_vcpu_id() not necessary here any more but was
> > before?  
> 
> 
> Because I have now changed the type of vcpu_id from 'unsigned long'
> to an 'integer'.
> 
> >   
> > > +    vcpu->kvm_fd = cpu->kvm_fd;
> > > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > > +}
> > > +
> > > +int kvm_create_vcpu(CPUState *cpu)
> > > +{
> > > +    int vcpu_id = cpu->cpu_index;  
> > 
> > See below. I'm not sure why it's safe not to use kvm_arch_vcpu_id()
> > Seems a few architectures have less than trivial implementations of
> > that function currently.  
> 
> I doubt this as well. Other architectures like PowerPC are returning
> different type?
> 
It wasn't the type that bothered, me but rather that the source of
the data isn't always cpu->cpu_index so I have no idea if the values
are consistent.

> 
> 
> > >      if (ret < 0) {
> > > -        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed  
> > (%lu)",  
> > > +        error_setg_errno(errp, -ret,
> > > +                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",  
> > 
> > The rewrap of the lines above seems like an unrelated change.  
> 
> Function has changed from kvm_get_vcpu to kvm_create_vcpu
> 
ah. Eyes jumped over that :)

