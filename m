Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3620419njc;
        Wed, 6 Nov 2024 08:07:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVs5anSiirE+r5R2s5r85n5i7g86CH5u9YlciXcjbK5pmSD/lqOzpCH/dw3i5h0ouf7ghCfa4uPkIs/Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IHXeXti8y9uBwB1LOWWhZmAfsNVdvBPFTjDGMnBg7r+bEBQecIeDr702+rAI4XnSoFxjFAP
X-Received: by 2002:a05:622a:20f:b0:462:a961:6316 with SMTP id d75a77b69052e-462f1013172mr49531671cf.26.1730909260463;
        Wed, 06 Nov 2024 08:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730909260; cv=none;
        d=google.com; s=arc-20240605;
        b=MKUHPMHga2bMs3NF6J+5uuWRWDsCDA2M+iIg6rf63BxsLxJh0fTpmFgtlWYkfflvFe
         C3WsFxhfrJSEB3+gWZtZDDU132N7/JqO/vxVWhp8AH1DY61+ueAJ1cJpVLe70+1wGj8w
         9GOR3eJwMm12dGCisdnwcViMSvH0SCaAaj+VQ+cvifPWJZj4mLUaC9UyQ5ur76P8vds2
         9ulVa/g/uiDZ1tYXGBfhqJbljdh6hdZjzLRmWqGW1AaGy1SXGByQL6nocyt3D1d2ZQ7z
         MUzlPnzfSSeJ32rEZN7/1veBA4HvyVVtOyJEr6RZisSkFxr+AQEA8nnUclU84eV1bJTH
         teDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=OO+1Xz9kPoxa2BLbOM9BMqtCrXow0wDqno+akvmyg1o=;
        fh=dYaH8Ews8VphbsQ333M7FfdNbnaZky4S5BG2mol2bFU=;
        b=jyhV+vA4NW7XSpyAgiNe86Z1Z51p2DfeVYBQjk8LByiT2ttR6BVVhQmQoGrLJ+uZqs
         zbXn4cFoSxLbo9zyW3H8zMKf5gyj3E60z+AbMjrZ8XLYAtzrEf1c4aJPO2PjzXxTES2+
         /pNU8+nKAwPvy4lGyX+ZmIVpF+gFNaOKHiZ34SgyNDklQzDSxtbIjSTLJFbSZL1DfcOn
         8cAGHpE+s2YZccF8kqeanwAMLmZnZPtLysoeHf6p6Twpm/Y4H5HiqxpDJeKTjzDN94vf
         7RItXDu5g1h/tsbjviQ6EreMIBiHSjR2+0kSWw2ymRA0zM9gloN8lM8/biRzHDYgXSy1
         WQKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7tnH7Fs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b257esi159935511cf.24.2024.11.06.08.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7tnH7Fs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730909259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OO+1Xz9kPoxa2BLbOM9BMqtCrXow0wDqno+akvmyg1o=;
	b=O7tnH7Fs//2agHaoXQ0Pp4W7eGg7P8uMu+54M2DTgzqXnrVTCxh0yQErVp815Vnmst7u2m
	aNH+cBi57rxsOsrWvMh8oaknY0n8KuPespSo4wgtBYxz/kqZjsDKOAKAb11lFmjXOk2wnm
	0qvGiNjQF7aTkxb9QgCI+/lcNE6fwEY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-M68_qiLBP06hNRMQPttt9Q-1; Wed, 06 Nov 2024 11:07:38 -0500
X-MC-Unique: M68_qiLBP06hNRMQPttt9Q-1
X-Mimecast-MFC-AGG-ID: M68_qiLBP06hNRMQPttt9Q
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d67f4bf98so3100432f8f.1
        for <alex.bennee@linaro.org>; Wed, 06 Nov 2024 08:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909257; x=1731514057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OO+1Xz9kPoxa2BLbOM9BMqtCrXow0wDqno+akvmyg1o=;
        b=Vjn+IIqOmCw/qwz13Sh2niGETDPf+tq4FYlT083LuNjgALAIlD9dARhnurHQZgF7Ji
         7m9RgXCvpUeYY2cQehYOsmk8N6hu0G27aBik4Msa3Nz8WEVTWzLUFvNj9WUAhH2YNlvi
         jRSStwJrgIonCL6UaHGlfKwP72tLrTqRiLwKzZ5BPDS+DEx2y3SghXJYxD5KVlSIYNCC
         nQhjO2/itwgnyLsMLHqMT38foiobKbsCKFMS79cY70rsTqCwzwFQsDVYgz9s2ygpE0z1
         sGzISkOZi4LGFG9qS0d1Y9Mkv7SEnGdMdfe7nhz+PzRPtR4NJaXfnoENEGzaNEhIEIBr
         Y3nA==
X-Forwarded-Encrypted: i=1; AJvYcCUu9ks9i/DPi7lyt+CtKirlTKG3zwg7/DVdtnBfQ3vYyHKJRDJ5LnGkSMQAIgNeufEku/iHDxnJtxLvEw==@linaro.org
X-Gm-Message-State: AOJu0YwKDqxkQP0Bh7dZqROKTU5ovmrNYbpJuJjbqYWEpLineDUDzPZ3
	mkNkqk391eqg0zxTpqcvd0xL91em+t7mko9DorTZCQ5iuMldwSP3KDA4ly8Pop1cngXlxtsROr8
	u8RxGc6Y/BD8DvfHjqS59ZdS5+vjBaxQop1Zvrcuy74vFlsNOOVAUJQ==
X-Received: by 2002:a5d:4cd0:0:b0:376:37e:2729 with SMTP id ffacd0b85a97d-3806115ae83mr26848932f8f.31.1730909257408;
        Wed, 06 Nov 2024 08:07:37 -0800 (PST)
X-Received: by 2002:a5d:4cd0:0:b0:376:37e:2729 with SMTP id ffacd0b85a97d-3806115ae83mr26848893f8f.31.1730909256927;
        Wed, 06 Nov 2024 08:07:36 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113de0esm19679552f8f.85.2024.11.06.08.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:07:36 -0800 (PST)
Date: Wed, 6 Nov 2024 17:07:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "anisinha@redhat.com"
 <anisinha@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "peterx@redhat.com" <peterx@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "gshan@redhat.com"
 <gshan@redhat.com>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>, "salil.mehta@opnsrc.net"
 <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng
 (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
 <linuxarm@huawei.com>, "gustavo.romero@linaro.org"
 <gustavo.romero@linaro.org>
Subject: Re: [PATCH 2/3] Fix: Reverse CPUs presence check logic for x86
 backward compatability
Message-ID: <20241106170734.0c7a5adb@imammedo.users.ipa.redhat.com>
In-Reply-To: <28a19ad7554e4b70819e1435669eeba3@huawei.com>
References: <20241106130331.205020-1-salil.mehta@huawei.com>
	<20241106130331.205020-3-salil.mehta@huawei.com>
	<20241106145635.77332d7c@imammedo.users.ipa.redhat.com>
	<28a19ad7554e4b70819e1435669eeba3@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZO1RxP5GNnO96iOxJ0YouMfEaVtaOpjfxf67yyuuPFg_1730909257
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /9k6C7s+47/T

On Wed, 6 Nov 2024 14:45:42 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> Hi Igor,
> 
> >  From: qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org <qemu-
> >  arm-bounces+salil.mehta=huawei.com@nongnu.org> On Behalf Of Igor
> >  Mammedov
> >  Sent: Wednesday, November 6, 2024 1:57 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  On Wed, 6 Nov 2024 13:03:30 +0000
> >  Salil Mehta <salil.mehta@huawei.com> wrote:
> >    
> >  > Checking `is_present` first can break x86 migration from new Qemu
> >  > version to old Qemu. This is because CPRS Bit is not defined in the
> >  > older Qemu register block and will always be 0 resulting in check
> >  > always failing. Reversing the logic to first check `is_enabled` can
> >  > alleviate below problem:
> >  >
> >  > -                If ((\_SB.PCI0.PRES.CPEN == One))
> >  > -                {
> >  > -                    Local0 = 0x0F
> >  > +                If ((\_SB.PCI0.PRES.CPRS == One))
> >  > +                {
> >  > +                    If ((\_SB.PCI0.PRES.CPEN == One))
> >  > +                    {
> >  > +                        Local0 = 0x0F
> >  > +                    }
> >  > +                    Else
> >  > +                    {
> >  > +                        Local0 = 0x0D
> >  > +                    }
> >  >                  }
> >  >
> >  > Suggested-by: Igor Mammedov <imammedo@redhat.com>  
> >  'Reported-by' maybe, but certainly not suggested.  
> 
> 
> No issues. I can change.
> 
> 
> >  
> >  After more thinking and given presence is system wide that doesn't change
> >  at runtime, I don't see any reason for introducing presence bit as ABI (and
> >  undocumented on top of that).  
> 
> 
> This is a wrong assumption. Presence bit can change in future. We have taken
> into account this aspect by design in the kernel code as well. Both virtual

Above does imply that support for really hotpluggable CPUs might be implemented
in the future.
Can you point to relevant kernel code/patches?

> and physical CPU hot plug can co-exists or entirely as sole features.  This is
> a requirement.


I don't see any _must_ requirements here whatsoever. If/when ARM reaches point
where standby and hotplug cpus are mixed within VM instance, we might have to
expose presence bit to guest dynamically but it is totally not needed within
observable future and premature.

Your cpu class presence check also works target-wise just with more boiler code
+ not needed presence bit ABI for guest side,
The same as my suggestion only from other side.

But regardless of that as long as machine has doesn't mix always present CPUs
with hotpluggable ones within the same instance, changing AML side
as I've just suggested works.

If ARM ever gets real cpu hotplug as your comment above hints, my suggestion
also works fine. With only difference that board code would turn off
always_present_cpus if hotpluggable CPUs are used instead of standby.

> 
> >  
> >  Instead changing AML code to account for it would be better, something like
> >  this:
> >  
> >  diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h index
> >  32654dc274..4a3e591120 100644
> >  --- a/include/hw/acpi/cpu.h
> >  +++ b/include/hw/acpi/cpu.h
> >  @@ -55,6 +55,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
> >  *owner,  typedef struct CPUHotplugFeatures {
> >       bool acpi_1_compatible;
> >       bool has_legacy_cphp;
> >  +    bool always_present_cpus;  
> 
> 
> This has to be fetched from architecture code. Please see other changes in the V3
> patch-set.

I've seen, that and it doesn't have to be fetched dynamically.
In my opinion the series was not ready to be merged
(Michael probably picked it by mistake).

We don't really need this in 9.2 as it is only ARM cpu 'hotplug'
related, and the later is not ready for 9.2.
I'd prefer the series being reverted and we continue improving series,
instead of rushing it and fixing broken thing up.


> 
> 
> >       bool fw_unplugs_cpu;
> >       const char *smi_path;
> >   } CPUHotplugFeatures;
> >  diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index 5cb60ca8bc..2bcce2b31c
> >  100644
> >  --- a/hw/acpi/cpu.c
> >  +++ b/hw/acpi/cpu.c
> >  @@ -452,15 +452,16 @@ void build_cpus_aml(Aml *table, MachineState
> >  *machine, CPUHotplugFeatures opts,
> >  
> >           method = aml_method(CPU_STS_METHOD, 1, AML_SERIALIZED);
> >           {
> >  +            uint8_t default_sta = opts.always_present_cpus?0xd:0;
> >               Aml *idx = aml_arg(0);
> >  -            Aml *sta = aml_local(0);
> >  +            Aml *sta = aml_local(default_sta);
> >  
> >               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
> >               aml_append(method, aml_store(idx, cpu_selector));
> >               aml_append(method, aml_store(zero, sta));
> >               ifctx = aml_if(aml_equal(is_enabled, one));
> >               {
> >  -                aml_append(ifctx, aml_store(aml_int(0xF), sta));
> >  +                aml_append(ifctx, aml_or(aml_int(0xF), sta, sta));
> >               }
> >               aml_append(method, ifctx);
> >               aml_append(method, aml_release(ctrl_lock))
> >  
> >  then for ARM set
> >   CPUHotplugFeatures::always_present_cpus = true to get present flag
> >  always enabled  
> 
> 
> We MUST fetch this from architecture code as this can dynamically change in
> future and hence, we need to keep that flexibility

CPUHotplugFeatures::always_present_cpus can be set dynamically per VM instance
or per Machine type.

> >  
> >  After that revert _all_ other presence bit related changes that were just
> >  merged.
> >  (I did ask to get rid of that in previous reviews but it came back again for no
> >  good reason).  
> 
> 
> The CPUs AML in the V2 patch-set would have broken the x86 functionality.

Frankly speaking, I don't see much progress. All that happens on respins
is flipping between what I asked to remove before to some earlier concept.
And all of that for the purpose to workaround/accommodate fake cpu hotplug hacks.

> Thanks
> Salil.
> 
