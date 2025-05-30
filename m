Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1091332njh;
        Fri, 30 May 2025 05:11:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoD3w7crwudc4e2qzSp9+3Bg8ydJoQNaPcYzPErOU0hHgnxd0W+KqJa18Opbkku9rFowggDYzx/VtsBg==@linaro.org
X-Google-Smtp-Source: AGHT+IH/8ixJW31rLQ7TYdHcPlbPXnRpwnMNgrfQHWqSTgV1A3RAj/r2qHdO55WOIsjjDco7JBwb
X-Received: by 2002:a05:622a:4011:b0:4a4:3c3e:5754 with SMTP id d75a77b69052e-4a443ef6eb5mr34976321cf.32.1748607096719;
        Fri, 30 May 2025 05:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748607096; cv=none;
        d=google.com; s=arc-20240605;
        b=buUO5YFpxcQl6TM6yQLVKTqi4aAPGlJM/auv0Xr/w3sht3ErLigKodHgrtZTYC3vRY
         sjTjEQtqEeLniR63XYpkf7agKJyZN//kAG8LU1xw+Jlf+GMlz/IrH2oiZ98Z0QVlksFP
         71xbJ0zOu1/3qMncCqI9hk4x3ypV1Ber564Qu94pwI4T8Hz1cFq0BxeeNHubLtnnaMP5
         Jfu5FAHwg/OTfIzaW/eifMj5kazxU57FXzmN00hCph5xNcd1TzBsrpfM8gUXheF9hFHA
         jeJevcSIw5naH9iyoJhfHj6xQn949bYPvtB/FqEOiX0d8DsP+fc7rDzOV1Tv5pflavNY
         7psg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=56Obo1kAqckMoE+zmxTq8NB/uf8Zra/91iFs6e+CSNk=;
        fh=JYoOqrEPOfYbL22MZAslprOvWev7/qEKRGWAF0t5oAs=;
        b=HeGlpIY4Y7IoLcWlvj3S+/DCCSnJOGBDxyBQnSNJwcqCfWyIQ3sGj3Jeq0EzYdvzVq
         rLggcIueMJzuI8iDNNTurQo2YodtadO/sliVCg+x6zzJsU6/g4+3arhlNm15xq7R80Qu
         DlUXetgaRZF23kwC8O4cV++O4+REhOkKJqBu4Y2YWxypzzQeMM37vhFLp9xfn8Hdf6jI
         XMUYT9EmZMk+kMsVoSmJ4Dl7F7Y+V48D72uOYaIdRfBkPHLKgZqos6wVYOLMpR62Iesj
         AvnzVlH+aNSrVDTegTKGMgk5SJAzebVIjZXS37XF2aT+QhhLI5eL8b8MjHjyjLnwSEQw
         rqfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=egH9ZraK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6ee2e4asi37404456d6.487.2025.05.30.05.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 May 2025 05:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=egH9ZraK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uKyZl-00018H-Mu; Fri, 30 May 2025 08:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyZk-00017T-6I
 for qemu-arm@nongnu.org; Fri, 30 May 2025 08:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyZg-0005F5-Ix
 for qemu-arm@nongnu.org; Fri, 30 May 2025 08:11:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748607059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56Obo1kAqckMoE+zmxTq8NB/uf8Zra/91iFs6e+CSNk=;
 b=egH9ZraKToyVyk/zkc6KeH9EfMlAQbyvWNSQWdl/ICD+0OsV2aaUpGYIYaN1jEgbrpzSZr
 WAYP/LlV48I8KlXiOG7ify4Wr47HjaMLSmIWdz/4HFr2H7oyyIqx1NoYuuNj3r2bQvd9+k
 V+p/IRZgola3IyXGWHmvaqekdN8/R9A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-Xat0Jf-mNp2yp0CCrNIWmQ-1; Fri, 30 May 2025 08:10:58 -0400
X-MC-Unique: Xat0Jf-mNp2yp0CCrNIWmQ-1
X-Mimecast-MFC-AGG-ID: Xat0Jf-mNp2yp0CCrNIWmQ_1748607057
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-442f4a3851fso16704205e9.1
 for <qemu-arm@nongnu.org>; Fri, 30 May 2025 05:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748607057; x=1749211857;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56Obo1kAqckMoE+zmxTq8NB/uf8Zra/91iFs6e+CSNk=;
 b=cPZdXBFXu7H9Lk2tCXmba6TMgmY5Gqu6A2Pnj+3m4ZqfOEVnkxg+hq0Qt5IxuNdXlY
 juMqTDMX/54R6T+prdUo9TXADGNEJ+Cpw+HV5JWAMVdPCw07o2o6kYXpJkD+Vm8iuIN8
 /amhnbE9lLXjsQHE7JN439lZyKPPOqyzQkdPzJxAknIysqXo7h6R/+EP8PyAb1Z43dzf
 8VRn0dJbCG1JgxlNFFKShbp6Pde3JoIwQ2ZIQtW4bRIh5VCWCq45Q4unQGkYxzTF0si3
 Jic2awSqaAzNKOn1Loz9uWteACtZDQpNlFwgoL1XJOAHoLz31Ej14tF4bJyD4Mq2TUzI
 qmlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5l7JjNRz6wgo/ZGxGSNRIP9tifbATQip5krsjlCvLCuoYezQhnYdjGfH9I3NAvZ2xAoBIRpIXkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxUc5inhQYdHjv2SFoQRC4jicsQ71sB/Yz/3ovC/B+p48IwH8uM
 m/t+eBr0O/clmkdtSPWb9a++ZWn3fvZSEzjwdDGGTN7qtDPS5TqDEN+6Jeg6mK6ZnFnlm2O0c6b
 t3choXxoPIqHLIz7uj3UDc6JrVKwJIjkWT5vRysJWTdd8efL4dU13TA==
X-Gm-Gg: ASbGncvyoAoSMRsX4QLwdxHWdFntmk69qaPZiWK0GS3J0OCJvORKO+BphhxYv0JWZoD
 a46Bh+eSws0QKWXkJuVNzvW00HfzfjUUkjP9iiVZJqoVMXUcXV3z5eHZvZbMfbgQbGUXrI6cwL5
 eV47usIh4n9QyEF6ouU8p6u9obmCQjenHnkRd2e/4grRVYHPHyh4HZ2bxTIYTgLos2Ng/+x6qNK
 AzEUrrkXLbY26XNYzDCW+POhskT5Rhx/7OyF8rg9cYZFli7HZRZD7kkGotkCe4eY1FOiSanB24C
 MIEH0Q==
X-Received: by 2002:a05:600c:3147:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-450d8757eb5mr22549895e9.0.1748607057056; 
 Fri, 30 May 2025 05:10:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3147:b0:43d:b85:1831 with SMTP id
 5b1f17b1804b1-450d8757eb5mr22549375e9.0.1748607056632; 
 Fri, 30 May 2025 05:10:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fb00ccsm16526085e9.17.2025.05.30.05.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 05:10:55 -0700 (PDT)
Date: Fri, 30 May 2025 08:10:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Li Chen <me@linux.beauty>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-riscv <qemu-riscv@nongnu.org>,
 Li Chen <chenl311@chinatelecom.cn>
Subject: Re: [PATCH REPOST v4 0/4] acpi: Add machine option to disable SPCR
 table
Message-ID: <20250530081034-mutt-send-email-mst@kernel.org>
References: <20250528105404.457729-1-me@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <20250528105404.457729-1-me@linux.beauty>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YcOity5EknWzdkVB-6BKCP4wMu3LnO0fl2lm2su8zMI_1748607057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XweoOpgCrWMx

On Wed, May 28, 2025 at 06:53:34PM +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> (REPOST because the previous post failed to send to qemu-devel/qemu-riscv/qemu-arm,
>  see https://lore.kernel.org/qemu-devel/1971648603b.dce1f5d22901195.6702025346547333607@linux.beauty/T/#u)
> 
> This series introduces a new machine option, spcr=on|off, allowing users
> to disable the ACPI SPCR (Serial Port Console Redirection) table.
> By default, SPCR is enabled. Disabling it can help ensure that the guest's
> console behavior is determined solely by kernel command-line parameters
> on arch like arm64, avoiding unintended serial console configurations imposed
> by firmware.
> 
> Also add tests on AArch64 and RISC-V virt machines using TCG and UEFI boot.
> 
> Changes since v3:
> - Add Reviewed-by from Sunil V L <sunilvl@ventanamicro.com> for patch 1, 3, and 4.
> - rename enable_spcr to acpi_spcr_enabled as suggested by Philippe Mathieu-Daudé.
> Changes since v2:
> - Omit UART device from DSDT and SPCR construction if no serial device is present,
> as suggested by Philippe Mathieu-Daudé.
> - Add Reviewed-by from Gavin Shan <gshan@redhat.com> for the first patch and fix style issue.
> 
> Changes since v1:
> - Add bios-tables-test for RISC-V and ARM as suggested by
> - Add Acked-by from Michael S. Tsirkin for the first patch
> - Add Reviewed-by from Bibo Mao for the first patch
> 
> Li Chen (4):
>   acpi: Add machine option to disable SPCR table
>   tests/qtest/bios-tables-test: Add test for disabling SPCR on AArch64
>   tests/qtest/bios-tables-test: Add test for disabling SPCR on RISC-V
>   acpi/virt: suppress UART device & SPCR when guest has no serial
>     hardware

Who's merging this?


>  hw/arm/virt-acpi-build.c       | 18 ++++++++-----
>  hw/core/machine.c              | 22 ++++++++++++++++
>  hw/loongarch/virt-acpi-build.c |  4 ++-
>  hw/riscv/virt-acpi-build.c     | 10 ++++++--
>  include/hw/boards.h            |  1 +
>  include/system/system.h        |  2 ++
>  qemu-options.hx                |  5 ++++
>  system/vl.c                    |  5 ++++
>  tests/qtest/bios-tables-test.c | 47 ++++++++++++++++++++++++++++++++--
>  9 files changed, 103 insertions(+), 11 deletions(-)
> 
> -- 
> 2.49.0

