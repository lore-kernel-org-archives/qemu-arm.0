Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp157295njb;
        Tue, 20 Aug 2024 23:25:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVc4tWZVXKgYezwVSYf/kRrEJEimqJReLzkQiRfhi2bq1pBg1XX5ex5ZxMthI4T8C8CKp/L3iHEhS9K0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFl2GttoFIDkef9EEKHZdfQlFLFgo0T9kmFrJLd5+Q8/YzgcOA6sh1xROxfk/Dqzu5ucmHO
X-Received: by 2002:a05:622a:6109:b0:453:5cb9:51a9 with SMTP id d75a77b69052e-454f21f50d9mr7936691cf.14.1724221522797;
        Tue, 20 Aug 2024 23:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724221522; cv=none;
        d=google.com; s=arc-20160816;
        b=MZQ+CqURDmjuxP/NFonLjmaGLssFYKkzzADpFzC9TyPG2CW3u1Brea6TTc/SmKV51Y
         hFJr/6phLZfhwK6MEcK0RGdJV7N9Ha4T5oYegBJNILI0CVC7BrbePNPY0RnVnJE3tEqj
         b66b+kzXuIv0lhzNlLcwoXivBkqW8YBo4+LON1P12Pc6vOsI+bEnxTEVCKA8kHPm6/zO
         2anlCgaou4HflgnTLaiNgXBwUSMvWabqtZRUNvcY4NkpP8itPwS8g3RikTThEV9Veg+V
         xJW/fEMZNV/BUdkIL6qwiG/e1K550XhW6t67WR9Yceph2DiPgMzEqHHCqDIUqU9QTGo5
         qiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=m4HzmemfS5ND5zxpCxn+qCXgOgH5RzDwi8twg24z9Cc=;
        fh=XCFreetofTHON/G6kuYGz3YHTjKnaAmNMiRsHIrI8V8=;
        b=qR9A3BAx3VcnDOtM6GFzC/YVsqq03uo26AHlg6D200iF7iQY0NFOmceB9ZmU1MTv3e
         jWHMMfTQ3OySqRL5vN4vg8TtKOWYu+hO3sALVW3L55WTOWXvhbiLKh4uZwMb44Jro/qG
         C5FEtf13DysJvpcqQR7tlGhsEocy5hDzef41CSPefPZWWh8TRXK2TojgAVtvOVJ/E/Jo
         nORz2cjtPQ8UqMcUpoikyJsiS8dHTWPVufzg6Psir8MBmGOL4s0AEHmxVXNg8OAk3JVq
         dDkViXNL0HvwTRCSEau7ZPoeE9SCL7/OedAaVrME8FLzzYPIVm/cn0Buz9GS6USu8Kh8
         UZdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0+tIXzK;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a08fc59si28780201cf.516.2024.08.20.23.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 23:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y0+tIXzK;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724221522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4HzmemfS5ND5zxpCxn+qCXgOgH5RzDwi8twg24z9Cc=;
	b=Y0+tIXzK/+g/5WQNz8flNPNiE7ruorILY8FEmLzwvo29L5Ivn0/LIwf+Dth1+2TyWDHojW
	IKP/NtpKdmByJuavkMCujTu84iTO3etj2qq9sLsoEMTcd5f9Jc/HttHCmz6YPq8Gpjgb/M
	JPtiyufwWq4wj9MxDsq23Sfmbh2VNLk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-m1X2k0VXMRKECAc9kFgVFA-1; Wed, 21 Aug 2024 02:25:21 -0400
X-MC-Unique: m1X2k0VXMRKECAc9kFgVFA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6b71aa9349dso63287357b3.1
        for <alex.bennee@linaro.org>; Tue, 20 Aug 2024 23:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724221520; x=1724826320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4HzmemfS5ND5zxpCxn+qCXgOgH5RzDwi8twg24z9Cc=;
        b=mIM2Ew8I7W3umnoLgGvvreIO2aUv95+GgylRtOKEQnLdfjQ941PfGMU4caFFxVAYGG
         fBs+adDY9u0Iofd3+gnOkGH2fmUwdlti0k60EA4bYgiY4ps5ZpHGU709rI6W4qqF/t0j
         VO3W/tW+8oFpC2aZLbVj0NoaWDjxIeLSSTKSb/d7bO3Ou0Y7CrebZtWQI1cGqexfq9BN
         K6DA9l1qGK/oEyeHtchnKYdEhvL+08jIniHj8hDHR4pn+axZk/OiO0BxbPRD0hqsBeOp
         kKwbAvo9lS4hCRg3u88dwGiDpCYGH9xyoeNrWXGZ0PGhMw2OwDv8dUe10U4G5C2RO3AE
         3zJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbi1q8rTUYyEj6JHZgQWwSFrhz+TpGMTxyqXMn1yVBIjWAOYY2hlS7KchqHrowRjdEh0022isxQRxt9A==@linaro.org
X-Gm-Message-State: AOJu0Yzul5f0xrvWjymr1Y+Pk+oe/V376C6jlV65lyE3BP+Z0IhSwsfZ
	FFRMvHnpPbZ+Aozq97PFyymJsd2KSJypuNdkBahIfUFcdxJoU/uYV88xYEBl9Rn3I7MccnIKCbD
	yCHpf2kdVxYNicfj/56YwMBpevYmYJQuoXMSYzLwJAW1DylWJ4Fmocw==
X-Received: by 2002:a05:690c:fd0:b0:6be:28ab:d874 with SMTP id 00721157ae682-6c0f937b514mr12818427b3.2.1724221520624;
        Tue, 20 Aug 2024 23:25:20 -0700 (PDT)
X-Received: by 2002:a05:690c:fd0:b0:6be:28ab:d874 with SMTP id 00721157ae682-6c0f937b514mr12817977b3.2.1724221520109;
        Tue, 20 Aug 2024 23:25:20 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb0598sm810569a91.36.2024.08.20.23.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 23:25:19 -0700 (PDT)
Message-ID: <d2371011-e7a3-42fe-b1a3-a185fbf4a612@redhat.com>
Date: Wed, 21 Aug 2024 16:25:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 17/29] arm/virt: Release objects for *disabled*
 possible vCPUs after init
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-18-salil.mehta@huawei.com>
 <51dc0813-7dc9-4927-a24b-bd718be54e46@redhat.com>
 <6b435c1f2b934867b8d82850d6d866c6@huawei.com>
 <9b7582f0-8149-4bf0-a1aa-4d4fe0d35e70@redhat.com>
 <1252c2d35b3e40ed84d5d5ae454878a7@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <1252c2d35b3e40ed84d5d5ae454878a7@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dubP33lZ0+cs

Hi Salil,

On 8/21/24 2:40 AM, Salil Mehta wrote:
> 
> I don’t understand this clearly. Are  you suggesting to reuse only single
> vCPU object to initialize all KVM vCPUs not yet plugged? If yes, then
> I'm not sure what do we gain here by adding this complexity? It does
> not consume time or resources because we are not realizing any of these
> vCPU object in any case.
> 

First of all, it seems we have different names and terms for those cold-booted vCPUs
and hotpluggable vCPUs. For example, vCPU-0 and vCPU-1 are cold-booted vCPUs while
vCPU-2 and vCPU-3 are hotpluggable vCPUs when we have '-smp maxcpus=4,cpus=2'. Lets
stick to convention and terms for easier discussion.

The idea is avoid instantiating hotpluggable vCPUs in virtmach_init() and released in the
same function for those hotpluggable vCPUs. As I can understand, those hotpluggable vCPU
instances are serving for two purposes: (1) Relax the constraint that all vCPU's (kvm)
file descriptor have to be created and populated; (2) Help to instantiate and realize
GICv3 object.

For (1), I don't think we have to instantiate those hotpluggable vCPUs at all. In the above
example where we have command line '-smp maxcpus=4,cpus=2', it's unnecessary to instantiate
vCPU-3 and vCPU-4 to create and populate their KVM file descriptors. A vCPU's KVM file
descriptor is create and populated by the following ioctls and function calls. When the first
vCPU (vCPU-0) is realized, the property corresponding to "&init" is fixed for all vCPUs. It
means all vCPUs have same properties except the "vcpu_index".

   ioctl(vm-fd,   KVM_CREATE_VCPU,   vcpu_index);
   ioctl(vcpu-fd, KVM_ARM_VCPU_INIT, &init);
   kvm_park_vcpu(cs);

A vCPU's properties are determined by two sources and both are global. It means all vCPUs
should have same properties: (a) Feature registers returned from the host. The function
kvm_arm_get_host_cpu_features() is called for once, meaning this source is same to all vCPUs;
(b) The parameters provided by user through '-cpu host,sve=off' are translated to global
properties and applied to all vCPUs when they're instantiated.

       (a)                                            (b)

   aarch64_host_initfn                          qemu_init
   kvm_arm_set_cpu_features_from_host           parse_cpu_option
     kvm_arm_get_host_cpu_features              cpu_common_parse_features
                                                qdev_prop_register_global
                                                  :
                                                device_post_init
                                                qdev_prop_set_globals

For (2), I'm still looking into the GICv3 code for better understanding. Until now, I don't
see we need the instantiated hotpluggable vCPUs either. For example, the redistributor regions
can be exposed based on 'maxcpus' instead of 'cpus'. The IRQ connection and teardown can be
dynamically done by connecting the board with GICv3 through callbacks in ARMGICv3CommonClass.
The connection between GICv3CPUState and CPUARMState also can be done dynamically.

Thanks,
Gavin
