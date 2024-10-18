Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp848502njb;
        Fri, 18 Oct 2024 07:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWapxyULExBcZGe0L9E2bmaKKvoviBLbaZto1/bDB1cAG7LH8HMC21XunnLoVNtjfiIiyDQGlzxGrec4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEJVxZJkJTMNurn8AftNV7TAKwe3cspvAbouGT558hnYpxAsFSTl9R1/U9rvPNl9Rdz1+H6
X-Received: by 2002:a05:6808:1307:b0:3e4:4b8f:cb8e with SMTP id 5614622812f47-3e602da5e1cmr2238277b6e.35.1729261098905;
        Fri, 18 Oct 2024 07:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729261098; cv=none;
        d=google.com; s=arc-20240605;
        b=HIqEn0DwnBL3U25dcamxFnSaxEGF2j3PzpGxvlGvWHWWKSJVDEu+NGRqcif7KA3C+j
         shbEUB+WyyjbkdByAEQmt29c055wm8duaLrcQiTRyNyWMmzFUHvulv0V1Tl3hQGrj0/N
         r3c84ibnB1zk57dOVtZsYCgbmu+ZVZMn3B6BDiD5Ox/WyFu1t0yes7zbecOKBx0HYyRL
         OmW/3fbcIoEwoY3OeV5o6tckDpYkINBtFHJ5A5GOy2m19+19OlCL5XMa5HOsMleNmF2J
         E0BksVsvJ+9egOGHj+BK3Nc0ZiqTRpfW59vDnZ9Cmbe4W2fnOk13liPgHtEhXOtz9PpW
         048w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=Vlis1wrdCPzJs0A3Vea7TA2gh4nT9iyy+d6woLENJUw=;
        fh=e5+O3SR6KKeSK/hiXUbyB6fQO5OvwSSjHlKWdVK1ULg=;
        b=PEJ9oGbmoHORJaZUMVLVOXFBlTJJ+6hxaHAcIBgbwZeTmo+FWZSt//te6EgSSY53mK
         sz59pOwtQgBkFYuHH/VQz1QzTvdWVvdnfD05p5TZn3cYxmAZ2re+q2zlmHS69kMF4vdB
         u3g6ggjhOgp5bZfbU8rHpAZMfgZOQmtZ+NPcJwekzVbuNbDVsHqBwdsJ5EuWt3wHFOP6
         uOfd0SRVIqzl2iSoGiT4SDXyt2moOQCSbwmwxr+lDX2Qojh8PW6fU+huZj7a+9z/Exge
         CUZjrV5I9NFPb9YwpoVzSTZEJTsNMjbZXdyMHrvQYexBhiVD+KcKYejpS0jre9bZVezN
         5b/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxUbOJQb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-851e5bfaadfsi278477241.186.2024.10.18.07.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OxUbOJQb;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729261098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vlis1wrdCPzJs0A3Vea7TA2gh4nT9iyy+d6woLENJUw=;
	b=OxUbOJQbd5IcuoV4Y4RCi2wy7RilBUeZFZxSV0XakHNG7VczDsQJzUnR+Mr0HJgB+yqJrL
	bMxAI06+e5cpxZsZ0pjDiRgs5bkv3szeHwAaSVz6nA6y828e2QL6E0r4svuyIHFpRqqgra
	RY05bzxUxbtmPlC+PeXfz7cU3mR+F+s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-T4X2uEYMPUmkC0vSlODx4g-1; Fri, 18 Oct 2024 10:18:16 -0400
X-MC-Unique: T4X2uEYMPUmkC0vSlODx4g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-431604a3b47so7854185e9.3
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261095; x=1729865895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vlis1wrdCPzJs0A3Vea7TA2gh4nT9iyy+d6woLENJUw=;
        b=fmxds8ZCHDYVOgSXmP+kW9d+ZzDYKnQoFeqGrJn2PlG99IHO1QCSDbrv+IZ+mfSHpJ
         N+AptuOnH6VSHEOmSYQx6oqplvyzML/zb+xQ1u2UgvJwqWQrUdNCj94iqefhAzljrLro
         y+TY33ClfhN45hOmWgKP7hEKOyRlDVxjlTXixwhGJr2ocg4yqG4g/a61m86L6CXxFma2
         JlBDro42XSjcJDX7NZgNDJiU1OsEWX2r0yaD2GJ9LDbQRL/Pvmzm64o/LlJpVpp0CDYJ
         HInpD1GIMPNHYdY9HBcYRl/Xu11iZJlHA7aaxT/uXGwV1kIxUV2VmXKu+aoNMOKjiuri
         wtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQjClr+6dY0cqxcSonD0E+gKLM9c0pun0YaBq4QZDORtTq7Ucd7UFB18tUucTGAIojKQNBcIjfNue0IA==@linaro.org
X-Gm-Message-State: AOJu0YyKYSJdqKIOrtGVu03mPGc7sxIEaCETm5G8vki8a6ivOVYZV81I
	dOlwxKR9vKi8uR0Bm2nwHdTTsTopkyIBqVAf47fQqR6kzCXBeojcrXIO+gOdXfzios7wkyS9N4B
	nWuadpz/mHeiHmP4U3ZgzQwy7dJuo4+ZTFhYJR7GBgex327lv9PXKyg==
X-Received: by 2002:a05:600c:c84:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-43161622973mr21143195e9.6.1729261094919;
        Fri, 18 Oct 2024 07:18:14 -0700 (PDT)
X-Received: by 2002:a05:600c:c84:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-43161622973mr21142685e9.6.1729261094538;
        Fri, 18 Oct 2024 07:18:14 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067dbb4sm29303585e9.9.2024.10.18.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:18:14 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:18:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
 <eric.auger@redhat.com>, <will@kernel.org>, <ardb@kernel.org>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <gshan@redhat.com>,
 <rafael@kernel.org>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH V1 2/4] hw/acpi: Update ACPI CPU Status `is_{present,
 enabled}` during vCPU hot(un)plug
Message-ID: <20241018161811.4a88c7b7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241014192205.253479-3-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-3-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: XVppxMsA6WgY

On Mon, 14 Oct 2024 20:22:03 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Update the `AcpiCpuStatus` for `is_enabled` and `is_present` accordingly when
> vCPUs are hot-plugged or hot-unplugged, taking into account the *persistence*
> of the vCPUs.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 083c4010c2..700aa855e9 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -291,6 +291,8 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  
>      cdev->cpu = CPU(dev);
> +    cdev->is_present = true;
> +    cdev->is_enabled = true;

hmm, if cpu is always present, then these fields are redundant
since
  (!cdev->cpu) == present
and
  then is_enabled could be fetched from cdev->cpu directly

>      if (dev->hotplugged) {
>          cdev->is_inserting = true;
>          acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
> @@ -322,6 +324,11 @@ void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
>          return;
>      }
>  
> +    cdev->is_enabled = false;
> +    if (!acpi_persistent_cpu(CPU(dev))) {
> +        cdev->is_present = false;
> +    }

and other way around works as well.

then we don't have to carry around extra state and making sure that it's in sync/migrated.

> +
>      cdev->cpu = NULL;
>  }
>  
