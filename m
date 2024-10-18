Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp601340njb;
        Thu, 17 Oct 2024 21:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmhgGaN5xgyAPtYSjZZdJwi1TxUgjoxuwKbAfGfOHRAZPr/PnKM8IAZyWEtJ8bkHqwq9ZHx+raYK1zIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IETypr71oH0ccPyCck0P8KapSSjJXFv7Vzm4GdxhkW59vv+B4Rss2BpoHMr5TryfV4ufEx/
X-Received: by 2002:a05:6102:b15:b0:498:c4e5:bc4f with SMTP id ada2fe7eead31-4a5d6ac0ae7mr1413231137.17.1729227408223;
        Thu, 17 Oct 2024 21:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729227408; cv=none;
        d=google.com; s=arc-20240605;
        b=i806cXYljazTaNkbShevMcoU5TSExBmHLhQUKjYVjxoqyDqv0AUoHIQic+tZgAlRqA
         tRk/3KjWvoxxWEs2PX1Jz4ruEGiGeQnPIvHXJWYoVVx5KThtwdY7TvwfP4Dh/au5quzV
         8UtG0BcgTr1PX6c/org8TTAEHgUjQ7dLumWmWKlmtjnx0QYV2EsgNs0fnxcVTIa9QKUg
         wYQ8ncfU7khIGhys9CnkZBY5mzBjqWe3H0dAjrTIM4enw96FkDBCD2pKk+4MovV2zWJx
         OBe3o6B6yzZtxTKgBLa4iZ7Cxihjc8O/cVlaEJ170gnUAtG4mSWm3Mgkw0YOXyNOOINB
         lSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=P6Ndt7yrpVW12/neQbnHDM8O8pMGuchHfl0s9xkY5HQ=;
        fh=/nhCjAoEdUA2dzoS1LvpfqHYO60MsIX8IOtpbq0PUYY=;
        b=Y/VH0mR4Op4JXyC0qDh+ya4AKSqrD3sDY6mQQlTN4GZtbhNUn5W1VfefItv2gYFki3
         Cl6iCi+/wwh+LTA6GOnuG1VxqhvO/kzPJRiIoeCexQFR9uTKKFQyNl9s4e+nXoIPvbXD
         yzTKO7jrMuCk5GBi2pbTRzSQkD1VeyOwKO68XLK9deZPDLcJgMZ5FnUI3rxP0CTsuD05
         VRmiKoZhuceSMetOSgMes/DWm8NDC+B3Er44tir/WkOsODrqZvuJFJncG3bYd+x4lwa8
         5pIcy0hUZ5LdnXekQtP+LX+N5F90nganeWUId7ZQuzZpse08Ungr4Hi8sXxnYnc0OHaK
         IUmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="W7/LQnnk";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.18])
        by mx.google.com with ESMTPS id d75a77b69052e-460ae968f38si8966451cf.183.2024.10.17.21.56.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 21:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) client-ip=192.198.163.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="W7/LQnnk";
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.18 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729227408; x=1760763408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bGu/+Db0FA2igHiNwYPOV2iX0Touqy0Pg/UF/MibiE4=;
  b=W7/LQnnkHt+XykD99PL2laVJ6mbOUq2Crty+XZpjxr2EwS3YCSl+NqBj
   jhKetbRrsye+mloPH2sqTXuCZQB3OIWx/fA+L4xaRf2HFPxGFylgLwSDN
   BzEfrRdZA+7h5DW7Ke9hNpCNhZKiJKM/VErFjbz2kKv1nkGjwzyZXo+Sl
   IAQFpEr6oAngEzjK7GjfOxl63bYXYugZFUgxq3bDJdWjlnmjlLCm6olQN
   RYjm8VcZ4QeG773vErPMCtt9HLmMVhGneh9iNZiEUK8RJq1BJVISQaSBM
   fgK/Z+JFRss0w/bvVYIIEAhoFwIsNGLbZhxSvKN9Ro/xXMXpehVUq7MxU
   Q==;
X-CSE-ConnectionGUID: R6usZFprSNaMjDuzfeDKxQ==
X-CSE-MsgGUID: oKgqyC25T6uOUY4b2JkjYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28184843"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="28184843"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:56:45 -0700
X-CSE-ConnectionGUID: 7gnTr/A0RBauVJqQ4cSmrw==
X-CSE-MsgGUID: mufS2+6KR1OT1OeLqwYIEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78664072"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa009.jf.intel.com with ESMTP; 17 Oct 2024 21:56:37 -0700
Date: Fri, 18 Oct 2024 13:12:52 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
	maz@kernel.org, jean-philippe@linaro.org,
	jonathan.cameron@huawei.com, lpieralisi@kernel.org,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	imammedo@redhat.com, andrew.jones@linux.dev, david@redhat.com,
	philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
	ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
	alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
	linux@armlinux.org.uk, darren@os.amperecomputing.com,
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
	karl.heubaum@oracle.com, miguel.luis@oracle.com,
	salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
	wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
	jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
	shahuang@redhat.com, linuxarm@huawei.com, gustavo.romero@linaro.org
Subject: Re: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
Message-ID: <ZxHuVC0uDL7kEB2i@intel.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241014192205.253479-4-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241014192205.253479-4-salil.mehta@huawei.com>
X-TUID: zoMuer2t8TUG

Hi Salil,

On Mon, Oct 14, 2024 at 08:22:04PM +0100, Salil Mehta wrote:
> Date: Mon, 14 Oct 2024 20:22:04 +0100
> From: Salil Mehta <salil.mehta@huawei.com>
> Subject: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled} states
>  in ACPI _STA.{PRES,ENA} Bits
> X-Mailer: git-send-email 2.34.1
> 
> Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the `_STA.PRES`
> (presence) and `_STA.ENA` (enabled) bits when the guest kernel evaluates the
> ACPI `_STA` method during initialization, as well as when vCPUs are hot-plugged
> or hot-unplugged. The presence of unplugged vCPUs may need to be deliberately
> *simulated* at the ACPI level to maintain a *persistent* view of vCPUs for the
> guest kernel.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 

It seems this patch changes ACPI table layout and then breaks current
ACPI table qtest. I'm not sure how to do such modifications. Maybe you
should first disable the related checks, then modify the code, update
the qtest, and finally re-enable the checks for qtest. This can help
to avoid any qtest failure due to this patch?

I think it should get Igor's advice on this. :)

Attach the error I met:

▶   2/920 ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion failed: (all_tables_match) ERROR
▶   3/920 ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion failed: (all_tables_match) ERROR
  2/920 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                                ERROR            1.24s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=/media/liuzhao/data/qemu-cook/tests/dbus-vmstate-daemon.sh ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1 MESON_TEST_ITERATION=1 UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 QTEST_QEMU_BINARY=./qemu-system-i386 MALLOC_PERTURB_=142 MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=./qemu-img PYTHON=/media/liuzhao/data/qemu-cook/build/pyvenv/bin/python3 /media/liuzhao/data/qemu-cook/build/tests/qtest/bios-tables-test --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-VRT5V2], Expected [aml:tests/data/acpi/x86/pc/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-TTT5V2.dsl, aml:/tmp/aml-VRT5V2], Expected [asl:/tmp/asl-XXM5V2.dsl, aml:tests/data/acpi/x86/pc/DSDT].
**
ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion failed: (all_tables_match)

(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

  3/920 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test                            ERROR            1.25s   killed by signal 6 SIGABRT
>>> G_TEST_DBUS_DAEMON=/media/liuzhao/data/qemu-cook/tests/dbus-vmstate-daemon.sh ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1 MESON_TEST_ITERATION=1 UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=./qemu-img PYTHON=/media/liuzhao/data/qemu-cook/build/pyvenv/bin/python3 MALLOC_PERTURB_=41 QTEST_QEMU_BINARY=./qemu-system-x86_64 /media/liuzhao/data/qemu-cook/build/tests/qtest/bios-tables-test --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
acpi-test: Warning! DSDT binary file mismatch. Actual [aml:/tmp/aml-D5K5V2], Expected [aml:tests/data/acpi/x86/pc/DSDT].
See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-G6K5V2.dsl, aml:/tmp/aml-D5K5V2], Expected [asl:/tmp/asl-AQD5V2.dsl, aml:tests/data/acpi/x86/pc/DSDT].
**
ERROR:../tests/qtest/bios-tables-test.c:553:test_acpi_asl: assertion failed: (all_tables_match)

(test program exited with status code -6)


Regards,
Zhao

