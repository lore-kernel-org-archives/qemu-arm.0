Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp10353njb;
        Thu, 17 Oct 2024 00:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWUSW86zhzAEMIaq7dJY7/BjAOdeITg6xMevlCXgF4IFVbxONda60KCJ/OGvau3uXNdAudHK7DW5UWfA==@linaro.org
X-Google-Smtp-Source: AGHT+IH19+15hi+4OT/LzTZQIyzf0S7MRWGI9wEmkGCoPSbnaMjsgLi4tpRBuZDwuGdTz3dOMkLs
X-Received: by 2002:a05:622a:4819:b0:460:9ff9:6b41 with SMTP id d75a77b69052e-4609ff9710amr15937511cf.28.1729148870294;
        Thu, 17 Oct 2024 00:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729148870; cv=none;
        d=google.com; s=arc-20240605;
        b=flRrBVj1QJUDCgad8dtmaYs6giWu5u8reac0LX7Q1g7nnsG+EbFkik/E3cXxlFc78v
         IA16jtjYh+nyKpt6SrIK8BhKvZUKdeF/pCvYimgit6lqMQ1o5u0yDANfo7u9y4+0S9nZ
         7OCMjY9P8erDkW8UT5mn68+fvkOy+hjQER4od/hMN0nDYlbSfA2vwkJneqW9GGvsUoff
         NHI4nb+pdAS7pTvgbnIsPSrB75xz2R+jflLF60BpItauoE8OG0BdhtjMF3aTrKpxGWIL
         t4F76d5l6wlEKll3yLw93vjU+TQWpYcOyiZPG7GIWV2a9rOjVx8b1gQyLINDZPPixWr5
         DW4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5XxnoZqcAhVyHsTAGCczEPp2KXs2bM44YDL+etGV2HU=;
        fh=TeRomTshsbzYgzFIrwPRIHvTuHvunQto1PTbZhc1nB4=;
        b=igt7d+Z1HSaC54z7iVKS69eLxT8B0BTwmz3mTpXGbfbA/EHVVss7IaW2cGRsB1AU4/
         pTUSXTstj1uPx1P9tftEOfuIKdPCJIwMu2xNTAt7eJu53G0xZEsqqF+KJ0Uq2gm3b4UL
         jnaP67hrkFOuymDcElTowARuCPMqHiy7h12j9JIRCrU7NfG3FAoR3z7axHA41sRsRqxT
         cISnOWeF/IyGz543m84Jt+XqYpp6y8sJ7ZsmvC81zT2FZPnTk66qvh3vJzk5Wk8rwQPn
         H/AkEPC6iuvatkAYLtIE1q/mzGMbvuO6OveXPi3oTSw9jLLf9QUW1DVjueTkzXDaLIOR
         rzSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F1jtMIHH;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4607b12d653si59997031cf.186.2024.10.17.00.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F1jtMIHH;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729148870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XxnoZqcAhVyHsTAGCczEPp2KXs2bM44YDL+etGV2HU=;
	b=F1jtMIHHmF5LrDstJP17iTR4/OUxD8I25YO7UFyDxCvyEdEC4pUGHx2KGdYNWkHRRS6UoI
	9o677hPopBCtx6rPB29AA6ZldkNm6jaOrz9JsA20rubiD3iBTQ1CgDZEC+7F+k0Yxb/iCj
	YnHPhuQzdiKkMtzbqrAV77pVoYw9q60=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-YuobgNIbMG6-MN0xBwL5Dw-1; Thu, 17 Oct 2024 03:07:48 -0400
X-MC-Unique: YuobgNIbMG6-MN0xBwL5Dw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-20b61ec80a2so5981515ad.3
        for <alex.bennee@linaro.org>; Thu, 17 Oct 2024 00:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729148867; x=1729753667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XxnoZqcAhVyHsTAGCczEPp2KXs2bM44YDL+etGV2HU=;
        b=ryeKhizOI/qVXVGKYWVZQboMZ97Y4kDIxMQJSu0BZthRnd1GTDE0uBUMZv/c3Ve0X5
         YJswbibmjCXI53rsDF+GeJeqs6bbaG5fZ3vEdpUnIf1jdgPq6TCsUgRxB8n5uoxTjZMN
         rQVzQgQANXEICizx7m991hmTpeXpbL8APvDC9O2Ur2B3Yo+FEVk6cvTaH5+030tstLKO
         Da0ZNGjEXGxuj/fAyBSgeSDaSp5AIuedk5jWtDU8YSM+6sfJuqZO8dsieOm1xDrx0Qq9
         RqO3NeUEPRTtuAt1Jw63d7gwmrEjknl3Sy67ekz6pryHwEchTvjcJHr/i2AqI0e9yXPh
         fe4g==
X-Forwarded-Encrypted: i=1; AJvYcCUid3/dz/8qwTIGwzQcrd0wpd1JwaarUq3UtGc/+QegzPP5GBarPafA3NUvHCQjkkoxTnzOIC0WLHOriQ==@linaro.org
X-Gm-Message-State: AOJu0Ywe+nRtX2IaYs60KeCrOE0flovU4ZRM/EOUOgENsM+JfTNMTJmw
	urB+cBLH3svySIvh4q+JosXYgInAuxVc7fqv54tcuVigio54BPUjSTBtU+5kKmqDVwCXvJrYNhd
	uKa9DtSzZJCLYxvQlsQSO0aLUqDTRLY9YL+AgAuuicuovNv+ZhvPkug==
X-Received: by 2002:a17:902:cec3:b0:20b:5be:a403 with SMTP id d9443c01a7336-20ca1429594mr286608005ad.11.1729148867650;
        Thu, 17 Oct 2024 00:07:47 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:20b:5be:a403 with SMTP id d9443c01a7336-20ca1429594mr286607695ad.11.1729148867273;
        Thu, 17 Oct 2024 00:07:47 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9db77sm38831055ad.98.2024.10.17.00.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 00:07:46 -0700 (PDT)
Message-ID: <b403fa29-2ccb-40fa-89d3-ce6d4152b766@redhat.com>
Date: Thu, 17 Oct 2024 17:07:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V5 00/30] Support of Virtual CPU Hotplug for ARMv8
 Arch
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, peterx@redhat.com,
 eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, npiggin@gmail.com,
 harshpb@linux.ibm.com, linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com,
 gustavo.romero@linaro.org
References: <20241015100012.254223-1-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: osv1DM7ck8a5

Hi Salil,

The issues reported against on RFCv3 are still existing. I'm listing them
as below.

(1) Guest fails to start due to SVE initialization

/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
-accel kvm -machine virt,gic-version=host,nvdimm=on                      \
-cpu host -smp maxcpus=4,cpus=1,sockets=2,clusters=2,cores=1,threads=1   \
-m 4096M,slots=16,maxmem=128G                                            \
-object memory-backend-ram,id=mem0,size=2048M                            \
-object memory-backend-ram,id=mem1,size=2048M                            \
   :
kvm_arch_init_vcpu: Error -22 from kvm_arm_sve_set_vls()
qemu-system-aarch64: Failed to initialize host vcpu 1

Workaround: The SVE feature bits in ID_AA64PFR0 need to be masked off in
kvm_arm_get_host_cpu_features() after the feature register's value is read
from the host.

(2) Fail to hot add vCPU whose PMU is turned off

/home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
-accel kvm -machine virt,gic-version=host,nvdimm=on                      \
-cpu host -smp maxcpus=4,cpus=1,sockets=2,clusters=2,cores=1,threads=1   \
-m 4096M,slots=16,maxmem=128G                                            \
-object memory-backend-ram,id=mem0,size=2048M                            \
-object memory-backend-ram,id=mem1,size=2048M                            \
   :
(qemu) device_add host-arm-cpu,id=cpu1,socket-id=0,cluster-id=1,core-id=0,thread-id=0,pmu=off
kvm_arch_init_vcpu: Error -22 from kvm_arm_vcpu_init()
qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (1): Invalid argument

Workaround: Keep PMU on while the vCPU is hot added.


Thanks,
Gavin

