Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5639489lfh;
        Fri, 3 Jun 2022 06:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQfO8yIP64aNyCn+63SZCHAWNGkeWN2/tPOV3gGNz7OimQAUS2vSis5Og2CygrWFD5gEmj
X-Received: by 2002:a05:622a:d3:b0:2f9:1b8e:19e1 with SMTP id p19-20020a05622a00d300b002f91b8e19e1mr7453674qtw.666.1654264320379;
        Fri, 03 Jun 2022 06:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654264320; cv=none;
        d=google.com; s=arc-20160816;
        b=FOA43G5WVK2BSkmtM3Nd3XbVU3q7xjT1dfKufuLeAE2NyEnkxplV5JvI2cjcUJHKmP
         So6CDUyTK2LESz+VR71uxZa+1yZe9J96INW/EUFJZKfT/VkTxzO075hcSsO0gxzGgsFS
         IRwXjDjwGjzRNK8TJV+wfiKzONTHWQ4xnBBD/isk+hBDY3j8N5k3iTIyMqyd9P3Va+Vo
         gjEfzHwZcMkiQHS8GBrX1nEGW1WV0f70h0t24obv1FfW8SenebXh+D05IXSKodX92frT
         60e+WBAnDzrpzVmN/e1splO63tJ6rduyKNY7CIrspSl2+0/BK9+M/7lQF1812ByCfAgk
         TE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:reply-to
         :dkim-signature;
        bh=Z9JCXnUurIwSUwK0JpXfUDvLBqHrB+6HX1OZz9atQNw=;
        b=MePJjVrmqcI8ejVxc47lQKhoKe/fwktviyn44RZqiTsRttmU9K7+sFYqzysIkdpef7
         E6UcSW5qs3i3UP6TAyZFYm7owfyb2leOeelVfN4Hh4+mznaHSbBhzvR9G+DDvZoGFc+K
         sAGnOdSPECM8fxlmA2C2XXt3E5K66pk0lxE/u9h/h/SN8tkudZKBCy/XBKPMBQoWs5cK
         dR8xS21fYmbbGlxhg8yWOyw5zzWnPBXY33UjY06OqDuH3oErHGfPKD+SGuELpuJGoBc5
         UZX7zfVSBnaddlRV79i3OsW7UfP4eS2c6XFKrhr21DrSLjVIVTb1oDeoTa5xbASnEwUm
         bNBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0NEyYGS;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id s15-20020a05622a178f00b00304ddfda0dasi1130390qtk.449.2022.06.03.06.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Jun 2022 06:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0NEyYGS;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654264320;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9JCXnUurIwSUwK0JpXfUDvLBqHrB+6HX1OZz9atQNw=;
	b=X0NEyYGSDS6+ZufUu3TTnYYA+etoerXPlhandAzpuAxDAsU70bjpmaKjY4oxX7xtxk9RNI
	8xnNld41EyytebvxKiaqwbXMz01eMstGOWPjA+Zc+ctuYzVPxiLbNaGtQyghmIPEu9dycl
	rAW/TgPbibHHE0oa4Ew8hL8ORud5TUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541--Ixm3F5DNgKR9wNPuiMF5w-1; Fri, 03 Jun 2022 09:51:56 -0400
X-MC-Unique: -Ixm3F5DNgKR9wNPuiMF5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 335B4101AA6A;
	Fri,  3 Jun 2022 13:51:56 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E21F17AD8;
	Fri,  3 Jun 2022 13:51:52 +0000 (UTC)
Reply-To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] tests: Prefer max cpu type when using AArch64 virt
 machine
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, cohuck@redhat.com
References: <20220603111849.1481100-1-drjones@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <370c0e42-4daa-3370-ad76-a5ec1d10cb0d@redhat.com>
Date: Fri, 3 Jun 2022 21:51:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220603111849.1481100-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-TUID: DoK7O3YFvU2T

On 6/3/22 7:18 PM, Andrew Jones wrote:
> The max cpu type is the best default cpu type for tests to use
> when specifying the cpu type for AArch64 mach-virt. Switch all
> tests to it.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   tests/avocado/boot_xen.py          |  6 +++---
>   tests/avocado/replay_kernel.py     |  2 +-
>   tests/avocado/reverse_debugging.py |  2 +-
>   tests/avocado/tcg_plugins.py       |  6 +++---
>   tests/qtest/bios-tables-test.c     | 12 ++++++------
>   tests/qtest/machine-none-test.c    |  4 ++--
>   tests/vm/aarch64vm.py              |  2 +-
>   tests/vm/ubuntu.aarch64            |  2 +-
>   8 files changed, 18 insertions(+), 18 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
> index fc2faeedb559..899c396bd55c 100644
> --- a/tests/avocado/boot_xen.py
> +++ b/tests/avocado/boot_xen.py
> @@ -66,7 +66,7 @@ def test_arm64_xen_411_and_dom0(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=cpu:max
>           :avocado: tags=machine:virt
>           """
>   
> @@ -84,7 +84,7 @@ def test_arm64_xen_414_and_dom0(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=cpu:max
>           :avocado: tags=machine:virt
>           """
>   
> @@ -102,7 +102,7 @@ def test_arm64_xen_415_and_dom0(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=cpu:max
>           :avocado: tags=machine:virt
>           """
>   
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 0b2b0dc692b1..c19022ea977d 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -147,7 +147,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
> index d2921e70c3b4..d6a6d7277235 100644
> --- a/tests/avocado/reverse_debugging.py
> +++ b/tests/avocado/reverse_debugging.py
> @@ -198,7 +198,7 @@ def test_aarch64_virt(self):
>           """
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>                         '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
> index 642d2e49e305..2bbf62f5036e 100644
> --- a/tests/avocado/tcg_plugins.py
> +++ b/tests/avocado/tcg_plugins.py
> @@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
>           :avocado: tags=accel:tcg
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_path = self._grab_aarch64_kernel()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -94,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
>           :avocado: tags=accel:tcg
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_path = self._grab_aarch64_kernel()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> @@ -120,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
>           :avocado: tags=accel:tcg
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
>           kernel_path = self._grab_aarch64_kernel()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a4a46e97f0b8..7c3a58a97460 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1270,7 +1270,7 @@ static void test_acpi_virt_tcg_memhp(void)
>   
>       data.variant = ".memhp";
>       test_acpi_one(" -machine nvdimm=on"
> -                  " -cpu cortex-a57"
> +                  " -cpu max"
>                     " -m 256M,slots=3,maxmem=1G"
>                     " -object memory-backend-ram,id=ram0,size=128M"
>                     " -object memory-backend-ram,id=ram1,size=128M"
> @@ -1363,7 +1363,7 @@ static void test_acpi_virt_tcg_numamem(void)
>       };
>   
>       data.variant = ".numamem";
> -    test_acpi_one(" -cpu cortex-a57"
> +    test_acpi_one(" -cpu max"
>                     " -object memory-backend-ram,id=ram0,size=128M"
>                     " -numa node,memdev=ram0",
>                     &data);
> @@ -1397,7 +1397,7 @@ static void test_acpi_virt_tcg_pxb(void)
>                     "if=none,media=cdrom,id=drive-scsi0-0-0-1,readonly=on"
>                     " -device scsi-cd,bus=scsi0.0,scsi-id=0,"
>                     "drive=drive-scsi0-0-0-1,id=scsi0-0-0-1,bootindex=1"
> -                  " -cpu cortex-a57"
> +                  " -cpu max"
>                     " -device pxb-pcie,bus_nr=128",
>                     &data);
>   
> @@ -1511,7 +1511,7 @@ static void test_acpi_virt_tcg(void)
>   
>       data.smbios_cpu_max_speed = 2900;
>       data.smbios_cpu_curr_speed = 2700;
> -    test_acpi_one("-cpu cortex-a57 "
> +    test_acpi_one("-cpu max "
>                     "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>       free_test_data(&data);
>   }
> @@ -1591,7 +1591,7 @@ static void test_acpi_virt_viot(void)
>           .scan_len = 128ULL * 1024 * 1024,
>       };
>   
> -    test_acpi_one("-cpu cortex-a57 "
> +    test_acpi_one("-cpu max "
>                     "-device virtio-iommu-pci", &data);
>       free_test_data(&data);
>   }
> @@ -1699,7 +1699,7 @@ static void test_acpi_oem_fields_virt(void)
>       char *args;
>   
>       args = test_acpi_create_args(&data,
> -                                 "-cpu cortex-a57 "OEM_TEST_ARGS, true);
> +                                 "-cpu max "OEM_TEST_ARGS, true);
>       data.qts = qtest_init(args);
>       test_acpi_load_tables(&data, true);
>       test_oem_fields(&data);
> diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
> index d0f8cd990245..d47533a835b7 100644
> --- a/tests/qtest/machine-none-test.c
> +++ b/tests/qtest/machine-none-test.c
> @@ -24,8 +24,8 @@ struct arch2cpu {
>   
>   static struct arch2cpu cpus_map[] = {
>       /* tested targets list */
> -    { "arm", "cortex-a15" },
> -    { "aarch64", "cortex-a57" },
> +    { "arm", "max" },
> +    { "aarch64", "max" },
>       { "avr", "avr6-avr-cpu" },
>       { "x86_64", "qemu64,apic-id=0" },
>       { "i386", "qemu32,apic-id=0" },
> diff --git a/tests/vm/aarch64vm.py b/tests/vm/aarch64vm.py
> index b00cce07eb81..a82b4dd7a91a 100644
> --- a/tests/vm/aarch64vm.py
> +++ b/tests/vm/aarch64vm.py
> @@ -31,7 +31,7 @@
>   # parameters that works for backwards compatibility.
>   DEFAULT_CONFIG = {'kvm' : {'cpu'          : "host",
>                              'machine'      : "virt,gic-version=host"},
> -                  'tcg' : {'cpu'          : "cortex-a57",
> +                  'tcg' : {'cpu'          : "max",
>                              'machine'      : "virt"},
>   }
>   
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> index b291945a7e9d..e2958ccd2a44 100755
> --- a/tests/vm/ubuntu.aarch64
> +++ b/tests/vm/ubuntu.aarch64
> @@ -18,7 +18,7 @@ import aarch64vm
>   import ubuntuvm
>   
>   DEFAULT_CONFIG = {
> -    'cpu'          : "cortex-a57",
> +    'cpu'          : "max",
>       'machine'      : "virt,gic-version=3",
>       'install_cmds' : "apt-get update,"\
>                        "apt-get build-dep -y --arch-only qemu,"\
> 
