Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BAFC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 12:51:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhpDu-00069m-7j; Fri, 01 Aug 2025 08:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uhotA-0003jg-6x
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 08:29:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uhot7-00054V-7J
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 08:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754051366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM9lZxHQzSjVXT78nF2/noSWJ8oz+r63yamxSZ9A9qA=;
 b=BG7bbR0Bybmp07Lk5FqXrg79CIsFOagOEx6ZPc8sysRxdPqGH7eO8gQghahHMt9Aj33mJD
 UZOBaWOWVB3hn9LeEoD1C7LbYIWWnYX2YW/M6ZENHP5LtIYH2A+RpEy27tvosrvp5QL1M7
 XgD11Dv1N1L5SC1uHQB7M38s2VCm7Bk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-zYVJn2n9PCmYI_Vlfl7CnA-1; Fri, 01 Aug 2025 08:29:23 -0400
X-MC-Unique: zYVJn2n9PCmYI_Vlfl7CnA-1
X-Mimecast-MFC-AGG-ID: zYVJn2n9PCmYI_Vlfl7CnA_1754051362
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45626532e27so11208715e9.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 05:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754051362; x=1754656162;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lM9lZxHQzSjVXT78nF2/noSWJ8oz+r63yamxSZ9A9qA=;
 b=wK90MH4xIcE1vN42Y6mJ7VKMrdqpdKrK9umdUtCcd/H59JAEATkf3NsewhJcUgvM0q
 KmM4YttZ+zu5rOUgPsA046rLNbn1D6v2ZXEHiwgMJVqgxGbUzc1fQdxa2PacPtsLWAeA
 0l/rsF0zZpVz4kCBNTDKt4VXqBTJXWjYxlbUt10mGoDlp5m4mjELY/hFz6LdU7skkEqn
 h9ZUmKM5aDh16hfp+h9oMfK+ev0y5Z2KhV6BRU/EqfJxqhg+d+3XHS1w9kU9yP+c/RS7
 wOIH+C3bDffxQMFUTxyq6D4as8OC5oE+ILXycROFSlBAWqwQpVE0n9oQ3dySlYJrcyOk
 9lzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcp9ChagBzLk8MarooF+H3DVmq9uDn6GgkCuC0hT8zwCJOeJKCkU/vOgPBn1trAW4LEC5SgBplCw==@nongnu.org
X-Gm-Message-State: AOJu0Yx8rpu5XwwYIjaEPHE+EStJNiTEZEkey/zjYrlWaZx7RWFJdI85
 wjEq1Kb5t0iPl9GN91fbBYc1RYLX0oXhv+pWpymtaT4ed1s/kH/SF7nTyT7Zol5bTUdlZ+TveNX
 cYhPtlfZdxO0PHDTxqwKJYATMU+V8Vo40T8ANpj2KzdLakxvSUgBKMw==
X-Gm-Gg: ASbGnctg7DgQXYqBm2SgnobXbfeoT68+YMS3isrS/LmpLoYgK4fDKpC6AxB+WORoVg2
 IO3vnKXiH5ux/SlvqXHrD/rgvVfvqgzOhWjgkdmeAEXfZHr+z4OG3uIALMwnzf9BOnf0lOdYYFJ
 vPhDHvK6xFhkarNI0d38lurDX3uHZcdpC2DXTf0Pgkm5+fCkUDNWk0Wclxh4U1SfjI9Wv91GSmy
 svQk6EDjy661C3HvVtX+IUKmvkDryaQBjVPAXzLhYFgHgyT9WEx2lURsNV7XqzGR4KJOEJNvoym
 kOzg+OflJ/DX2tDltrbPNNyO4OKducUr
X-Received: by 2002:a05:600c:138e:b0:456:1d61:b0f2 with SMTP id
 5b1f17b1804b1-45892bdf7ebmr111755505e9.30.1754051361864; 
 Fri, 01 Aug 2025 05:29:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd+gjhjuuhRv9KIRn2pJpIwQ7ylXM8ojJJJ5JCdsEkH7C4PDNXGrPEJ3+kNdY4g3u7RKfMbA==
X-Received: by 2002:a05:600c:138e:b0:456:1d61:b0f2 with SMTP id
 5b1f17b1804b1-45892bdf7ebmr111755215e9.30.1754051361430; 
 Fri, 01 Aug 2025 05:29:21 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1515:7300:62e6:253a:2a96:5e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfeaesm111587495e9.16.2025.08.01.05.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 05:29:20 -0700 (PDT)
Date: Fri, 1 Aug 2025 08:29:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com,
 Jonathan.Cameron@huawei.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, shannon.zhaosl@gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v7 09/36] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250801082904-mutt-send-email-mst@kernel.org>
References: <20250714080639.2525563-1-eric.auger@redhat.com>
 <20250714080639.2525563-10-eric.auger@redhat.com>
 <ddf6f9e3-daaa-4ea1-a5e6-d402a75524c8@tls.msk.ru>
 <914677f4-07ba-45fe-9dc2-dea40940e789@tls.msk.ru>
 <53971ad6-9f50-45b0-80c4-eeedb24e53db@redhat.com>
MIME-Version: 1.0
In-Reply-To: <53971ad6-9f50-45b0-80c4-eeedb24e53db@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zC0OOzdhUzmkeydhW2czgUuF5MdET1p1gQsglfUXr9k_1754051362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Jul 28, 2025 at 04:56:37PM +0200, Eric Auger wrote:
> Hi Michael,
> 
> On 7/28/25 11:07 AM, Michael Tokarev wrote:
> > On 27.07.2025 14:48, Michael Tokarev wrote:
> >> On 14.07.2025 11:04, Eric Auger wrote:
> >>> gpex build_host_bridge_osc() and x86 originated
> >>> build_pci_host_bridge_osc_method() are mostly identical.
> >>>
> >>> In GPEX, SUPP is set to CDW2 but is not further used. CTRL is
> >>> same as Local0.
> >>>
> >>> So let gpex code reuse build_pci_host_bridge_osc_method() and remove
> >>> build_host_bridge_osc().
> >>>
> >>> Also add an imply ACPI_PCI clause along with
> >>> PCI_EXPRESS_GENERIC_BRIDGE to compile hw/acpi/pci.c when its
> >>> dependency is resolved (ie. CONFIG_ACPI_PCI). This is requested
> >>> to link qemu-system-mips64el.
> >>
> >> This patch somehow broke microvm-only build which is used by debian.
> >>
> >> configure options used (trimmed a bit):
> >>
> >> ../configure \ --without-default-features \ --target-list=x86_64-
> >> softmmu \ --enable-kvm --disable-tcg \ --enable-pixman \ --enable-
> >> vnc \ --audio-drv-list="" \ --without-default-devices \ --with-
> >> devices-x86_64=microvm \ --enable-vhost-user
> >>
> >> configs/devices/x86_64-softmmu/microvm.mak: ---- cut ---- # see
> >> configs/devices/i386-softmmu/default.mak # for additional devices
> >> which can be disabled # CONFIG_PCI_DEVICES=n
> >>
> >> CONFIG_MICROVM=y
> >>
> >> CONFIG_VIRTIO_BLK=y CONFIG_VIRTIO_SERIAL=y CONFIG_VIRTIO_INPUT=y
> >> CONFIG_VIRTIO_INPUT_HOST=y CONFIG_VHOST_USER_INPUT=y
> >> CONFIG_VIRTIO_NET=y CONFIG_VIRTIO_SCSI=y CONFIG_VIRTIO_RNG=y
> >> CONFIG_VIRTIO_CRYPTO=y CONFIG_VIRTIO_BALLOON=y CONFIG_VIRTIO_GPU=y
> >> CONFIG_VHOST_USER_GPU=y ---- cut ----
> >>
> >> The result: FAILED: qemu-system-x86_64 cc -m64 @qemu-system-
> >> x86_64.rsp /usr/bin/ld: libsystem.a.p/hw_pci-host_gpex-acpi.c.o: in
> >> function `acpi_dsdt_add_host_bridge_methods': hw/pci-host/gpex-
> >> acpi.c:83:(.text+0x274): undefined reference to
> >> `build_pci_host_bridge_osc_method' collect2: error: ld returned 1
> >> exit status
> >
> > In hw/i386/Kconfig, MICROVM selects ACPI_HW_REDUCED (not ACPI or
> > ACPI_PCI), *and* PCI_EXPRESS_GENERIC_BRIDGE.  But in hw/pci/meson.build,
> > pci.c (where the function in question is defined) is built when
> > ACPI_PCI is enabled.  Something's not right here.
> This commit added an imply ACPI_PCI to the PCI_EXPRESS_GENERIC_BRIDGE
> config in hw/pci-host/Kconfig:
> 
> config PCI_EXPRESS_GENERIC_BRIDGE
>     bool
>     select PCI_EXPRESS  -> selects PCI
>     imply ACPI_PCI
> 
> In hw/acpi/Kconfig we have:
> 
> config ACPI_PCI
>     bool
>     depends on ACPI && PCI
> 
> ACPI is selected by ACPI_HW_REDUCED
> 
> config ACPI_HW_REDUCED
>     bool
>     select ACPI
>     select ACPI_MEMORY_HOTPLUG
>     select ACPI_NVDIMM
> 
> so logically the ACPI && PCI dependencies for ACPI_PCI should be
> resolved. What do I miss?
> regards
> 
> Eric
> 


Not sure I get what are you proposing?

> 
> 
> 
> 
> 
> 
> 
> >
> > Addig kraxel for 24db877ab6e6 "microvm: add pcie support".
> >
> > Thanks
> >
> > /mjt
> >


