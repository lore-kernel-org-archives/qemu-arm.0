Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2227784nji;
        Mon, 15 Jul 2024 05:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUh1esiheBgHyR+wI5Bi030iAVrXSMIxOhTUyyuZUnatDcRYU9iWDIvXTIxzhP10k3wDWcwID+RIKiZ6Or3NGBahPWUZJgO
X-Google-Smtp-Source: AGHT+IHLMyOJ79b1PFDqqulNuQY++7myHcEJ5DdXYAffD/g+9UYxfzmBWzCVvlDpkJVkUP3DasCk
X-Received: by 2002:a05:6214:2425:b0:6b7:42ab:f7e0 with SMTP id 6a1803df08f44-6b754d8614emr159214226d6.19.1721047807011;
        Mon, 15 Jul 2024 05:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721047806; cv=none;
        d=google.com; s=arc-20160816;
        b=J8HaZkqOVbvA9s/tBl12XsTQbv3poXcI6NgDZIfJ41Gr5HJ4LD82/ZWaSxQDEQzB98
         wxaYGc5QTqdBhxF2OviT+7aUqsWMnSX8II0/uNJNxEl1S5GOJ/IPh6/PaABh2/bB/nSy
         6zinU2WWX6oaXmixwotYVDvlDsAgv0pg4cHd5wVsRym03O9x2/+A2i8aHSqFrmi17e+V
         3SCxXyox1hDtwmP1TMj/IilrSJzzm9pKipHbCMRbumUAJD3x3eoYlewSDthDMV8nUBrw
         y2bo8oWyAAE00DZO1+g65XzZUjKN2GmkOKsKHK4hoNLNjJpVCtiybQsGeCXzF261uczJ
         6XSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=lu2dlxaAnoyG8M5dAWM8Rq5ps2y5YNbk/Nphh1M5u8c=;
        fh=PIp/A01AkUnfEgZPb/Qq4JKMsqgLMiWujxs1mfn2TY8=;
        b=JAxPTgagshp1zvHTpXbvXUtEx1t6AjnAwF0+Nxrx0uTEVupAcVQbUiwazhfKlRHd3Y
         w6MhRDvE7+8lKvFhaql7DCBlhNlw1bKqFsDJEKhHnxxbZc64Ux8ksRMKHJ8NX3KFHbXD
         f7D9aixZqntsSULcoy4ONhCnd+UPOc/29to0ugTOHqB1GC/Nuv8W2WMtwvcKCw44qLPF
         qrpCVjCJOzJ1ljv1lOUkQEpO4Uu0sKkhXWOh5q1mgJiEjpNmd03NS5WlQyfDUWYMv4qu
         x38MINC8k0uEMbUGrIk4tAukraChWk40yW4dPjZzVczVMnMTfS8UzmOU1KMsuN1BCgYn
         CSzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBJn+pqP;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a5ec3csi50099436d6.509.2024.07.15.05.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBJn+pqP;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721047806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lu2dlxaAnoyG8M5dAWM8Rq5ps2y5YNbk/Nphh1M5u8c=;
	b=SBJn+pqP6aIDlw2NUDabL65R+nrp5Pb761V+ZRORpx51t1y2TR7H1+76KGKoLwnaWTnlcQ
	7CZkrdfM4AxXdsmc/1UikCUu/CrDLoV/OChaHaTH5YCkXdJq/Sd0M8WI1GT3oVyovkJvGY
	f0YeBNN0G1D9AcWypStSgRZl+uDPhaY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-6aD4zaAUPlG3hAXubNzpnA-1; Mon, 15 Jul 2024 08:50:05 -0400
X-MC-Unique: 6aD4zaAUPlG3hAXubNzpnA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42674318a4eso40479765e9.1
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721047804; x=1721652604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu2dlxaAnoyG8M5dAWM8Rq5ps2y5YNbk/Nphh1M5u8c=;
        b=bvxms/IZ0373rBoTFgpKQjt5Ht8HyrKxSWxYN9RSuO81QgMpVY10Sec5GtG+pIxSwq
         0lo4kyr9zuF1rYCB75kK7kxdn3MHgAq1b8jUmFMFt5iyRT9FQFD9KJzDTz/BPeUoF+x0
         gJ8a7iy/ewXBdT372secPIJKHQL0GkrzZJKgFcEVT3Uxl+MspwWBTp+CoJuco8nv8OzW
         rn1LDWWTJ3GCmvZxvtM6pnOMh6mGUjfrTror9S5ENpesZntToAgaSOX9FsXhst3aEPK9
         569qytzIo7qnDBrs7wmFQ3PGwFnMYLKxTudU/YKSL564duVJSUNtWt6yC3NbfGFvwrDD
         q99g==
X-Forwarded-Encrypted: i=1; AJvYcCXNgZbUFRvkya6taQ7KwE1qSVfHAAsz6985b/182XFp/G3qOrTOH5/U8SLMuQMCQowGC93mcV36aDe0SaZqUnRa1pWz4eKA
X-Gm-Message-State: AOJu0Yyd6rZrqfY3ITsYMcSJhS+KaNGAKSDENH6A94t2qR+JT3EtoiMo
	Xp/JrWgzjbKPp0MWeoDAncoONCSf5sczGNGcpyksBCgw0oZ1WfususJwKHU5tryA7u7kPOpEo7p
	Nb5WeLp23bxz1jzFrsGUiHNPUz/oir4OliblBP7hFUiwj9/DSvyeIGg==
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-367cea46438mr20868817f8f.8.1721047803993;
        Mon, 15 Jul 2024 05:50:03 -0700 (PDT)
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id ffacd0b85a97d-367cea46438mr20868788f8f.8.1721047803690;
        Mon, 15 Jul 2024 05:50:03 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf151sm6303913f8f.29.2024.07.15.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:50:03 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:50:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V15 2/7] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Message-ID: <20240715145002.0cedd39d@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-3-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-3-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dV8rt7yA5Uwt

On Sat, 13 Jul 2024 19:25:11 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> CPU ctrl-dev MMIO region length could be used in ACPI GED and various oth=
er
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
>=20
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/cpu.c         | 1 -
>  include/hw/acpi/cpu.h | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 2d81c1e790..cf5e9183e4 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -7,7 +7,6 @@
>  #include "trace.h"
>  #include "sysemu/numa.h"
> =20
> -#define ACPI_CPU_HOTPLUG_REG_LEN 12
>  #define ACPI_CPU_SELECTOR_OFFSET_WR 0
>  #define ACPI_CPU_FLAGS_OFFSET_RW 4
>  #define ACPI_CPU_CMD_OFFSET_WR 5
> diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> index e6e1a9ef59..df87b15997 100644
> --- a/include/hw/acpi/cpu.h
> +++ b/include/hw/acpi/cpu.h
> @@ -19,6 +19,8 @@
>  #include "hw/boards.h"
>  #include "hw/hotplug.h"
> =20
> +#define ACPI_CPU_HOTPLUG_REG_LEN 12
> +
>  typedef struct AcpiCpuStatus {
>      CPUState *cpu;
>      uint64_t arch_id;
