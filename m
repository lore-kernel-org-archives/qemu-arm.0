Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2259297ejc;
        Tue, 12 Mar 2024 23:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXrZDm8tw4SeJ5X++7IcM54bKIeYkiza3mga+H/wiuvicyiBOYtf6qk3lxqBVaZt2KSamT7jk1RRzSu01wzVmdoklXNl1nO
X-Google-Smtp-Source: AGHT+IH1VwY1d0wQJY7pWgPTK1wNUS2+WlrxnYBeS8oKCSyuBl5NxTDbnsSQLY8BNUcDV5rSz7KH
X-Received: by 2002:a05:620a:6190:b0:789:c69e:8c67 with SMTP id or16-20020a05620a619000b00789c69e8c67mr1842531qkn.77.1710309626345;
        Tue, 12 Mar 2024 23:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710309626; cv=none;
        d=google.com; s=arc-20160816;
        b=HW46iUSbar+fwW8vVdMmNu1g+uK3OdLs4ENkFYvvCC+OyieldGeDrkNMTzW0PeL2hR
         W28kKRvDBXebqYzQ6bJ0szZMmFY21y9DWu/wTwWxyP1hu0y4gcYgZabE/jWyT9XiUivt
         pa8sIhWt949IKzOSGsHpHg6bJRf8iT5Bk0ib9f5PDjlfLuXI/ckJr4H7L9bsgqK5N1al
         y/JSbAlZBGItAIYqdkj96fW9z5qBDhXux/uc2zKo/Oce67mkb7+TxZVdCeZ/Ch0teVGu
         3QGslkobKbs6UEO2LOu3/UxkOB/0dnzliTrDO8F6C178UWCHRPTJiGGcd/hKMhieSBk5
         mj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=GUhW5DapR7SKs6DhAPydPIoNVPxrxtNNelH9/Eile3I=;
        fh=nHXCxAu9yzvsZfHVth69sEU95KCk0t//YoILpnfCoG4=;
        b=hc1LBcx54cHRPx/Pkv/NpzMjx79rnGKNwQknsO6fk1z7UnRQ0DYyz3yWLwGVD5p80/
         f95js/pSDz45UL57Db4I5lhqzQrt2HdB+FJEjj8cLe8/vf1P1/NfCkXfJhFKWkw86J3Z
         kaLYI7mdcQ1O9jTBPHzpbkGuHwe51Z+7gyxA2ch2vpev26fG8F/MWu/cMubuQx3F6r3U
         JlzijqviSJlgad0lI4WCUUDOFg8zNpP5dR4orPHVoZppCwiTgstxrjungjAh1ncVc/8u
         szdaJbqQPvI71c/Lodb09ljBYbXpRk5OlXCSQXPTPOYWP3eHJ5ljDu6ywsFx/bM3Hpl/
         uIVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZSG8RX4m;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.12])
        by mx.google.com with ESMTPS id z7-20020a05620a08c700b00788258b007esi8717373qkz.715.2024.03.12.23.00.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 23:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) client-ip=198.175.65.12;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=ZSG8RX4m;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.12 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710309626; x=1741845626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PVsToUiCUiOhSzkdiRM4zUD+fdyiF34qLsiHYhQsYC4=;
  b=ZSG8RX4mfEqZ9NABTwfPoWKXAx80O7d2cgeAryw5/MNkYKBiKTqPi+Xa
   l52JnA6oRHHiA4F5wCxHhtM/DCsRu2bddyzuuXpwLQOp/nFEztl9l9F98
   TMw+S1SYtjXXmJ5u8d7XsbHSBzRxIj8D/fcIrXOxMml2AtFKw+EvAwgZd
   ECsYc8VZd2TxkbhQ7aN/sDMQ+Z7eR+YxAQ33zOULjNYXyLAW8At56L/dL
   mXlVcmGHL7PuIAOZdYPT+sch0zWOTo9hS0e4RBc5o+ijfR1DSUGd3+fvI
   6VTZnR1BUicv7iOtDDEUc4EwSUPP4kOvKI/DaRJ5TK65KrDk9Tscq1lCN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="16501386"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16501386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 23:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16519824"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2024 23:00:12 -0700
Date: Wed, 13 Mar 2024 14:14:02 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	mst@redhat.com, will@kernel.org, gshan@redhat.com,
	rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, linuxarm@huawei.com
Subject: Re: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Message-ID: <ZfFEKgpRiEOZo9xd@intel.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-4-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312020000.12992-4-salil.mehta@huawei.com>
X-TUID: kziUO10t8W89

Hi Salil,

It seems my comment [1] in v7 was missed, but I still hit the same
issue. Pls let me paste the previous comment here again.

[1]: https://lore.kernel.org/qemu-devel/ZXCqp32ggIFvUweu@intel.com/

[snip]

> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp container",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);
>  }
>

I find this cpu_hotplug_hw_init() can still cause qtest errors (for v8)
on x86 platforms as you mentioned in v6:
https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-820f4a254607@opnsrc.net/T/#m108f102b2fe92b7dd7218f2f942f7b233a9d6af3

IIUC, microvm machine has its own 'possible_cpus_arch_ids' and that is
inherited from its parent x86 machine.

The above error is because device-introspect-test sets the none-machine:

# starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-3094820.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-3094820.qmp,id=char0 -mon chardev=char0,mode=control -display none -audio none -nodefaults -machine none -accel qtest

So what about just checking mc->possible_cpu_arch_ids instead of an
assert in cpu_hotplug_hw_init()?

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 4b24a2500361..303f1f1f57bc 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -221,7 +221,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     const CPUArchIdList *id_list;
     int i;

-    assert(mc->possible_cpu_arch_ids);
+    if (!mc->possible_cpu_arch_ids) {
+        return;
+    }
+
     id_list = mc->possible_cpu_arch_ids(machine);
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);

This check seems to be acceptable in the general code path? Not all machines
have possible_cpu_arch_ids, after all.

Thanks,
Zhao
