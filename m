Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4335341lfg;
        Tue, 2 Mar 2021 02:07:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9Juv7+cxw/a5X25t4koeRkaxseWoYcWUbAe9335/2DcC4woRuEdBMzw9C5MijPN5gMgsj
X-Received: by 2002:aca:d15:: with SMTP id 21mr2633634oin.150.1614679654777;
        Tue, 02 Mar 2021 02:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614679654; cv=none;
        d=google.com; s=arc-20160816;
        b=lxwmdVO6X8vI6Q8NlMD+vaq1sXdoW3p3zxJbcUElBKOwlsV1qTYKnVtCowMM/A9cRh
         Axfi3mC3Qv62jwotyaKGUG8eQpnoSiZEpYG8c18n/jx3JtGw3dBcPfvVZ6DBOBwgNTje
         56YkxGMRwrdJwMjlgCSLpauCrFusrD+5hVFNr8sqFbhm1CTS7kjQrLJU6AkPENlRSrG9
         M6OEIQKQ3/Xw9mst4f45DvUF/vRuHlaLDx8HndtQH9YVUh13+kYaUx20kAh0cZNTEuE2
         mBpgvDj6MvdLrkCXSpASAin0sDM1z+r7lDKbpYpJ7hily6HHeuZZhXMRAp+c31i72zJY
         HVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=dIQklW/Wi4L2ZHBE9Z7KTonkjQ5g2zwvpJqGXC/z+mA=;
        b=nTvKj71DSrAC3Cir6rUXxJDbND3u5UJEQbWoqqAIi2GPY+WWZJNfE3UG//d7xZ/lpY
         Dipj25txJGvR9qIfJzhDqp4QAABR/SYFY7cd19lwfVbECGcQqgBu3p2XDWqG0GBLjZwo
         hNKAGktmPTVqwohJnHdKYeueRipPD9pKlk4MkS1GK8gtjw07P+cUe2fpAlRutKc5x7qI
         lDd7iqyUUmGX4y5VJJa1ebtOT3RPKdd5pxCEvMvt7D5R/RdX9Oah4QsHLeCLLF2APKL4
         ZLrbFfP8OIrIkvhYVxEkPD7y8VKb76D05faGh23hce0k3kD6UaxpGH7Qa5zZliymUzH/
         F87A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkU0Lbiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w192si5908628oia.155.2021.03.02.02.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:07:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UkU0Lbiu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH1wE-0001Us-2E
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH1w3-0001Tj-AL
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 05:07:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH1vz-0004FW-91
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 05:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614679637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dIQklW/Wi4L2ZHBE9Z7KTonkjQ5g2zwvpJqGXC/z+mA=;
 b=UkU0LbiuV7ho0v103sudJR37lL6R8zZtcHApZmy5C91dBkJMg6JUxRMX/2O2tjQ4r2xhTy
 BPqkptAQZdMYW/1F+bXmnQq0iAm5YYM0A0Y34/shWyFqSaJ09fjtE76vHQqWjmgXQ4+D+7
 FG1FccqxPQXe1GYZwPg1GTVgDVte+ws=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-c7g40YsCNBu0X1mX50oeXw-1; Tue, 02 Mar 2021 05:07:15 -0500
X-MC-Unique: c7g40YsCNBu0X1mX50oeXw-1
Received: by mail-ej1-f70.google.com with SMTP id p6so8240175ejw.1
 for <qemu-arm@nongnu.org>; Tue, 02 Mar 2021 02:07:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dIQklW/Wi4L2ZHBE9Z7KTonkjQ5g2zwvpJqGXC/z+mA=;
 b=W4GuKLCXyw88+tcWUMytH2TcRBsyHyjfQlRSNAUiuD7rMjiT1rZ357/omphDKQtJrJ
 5Lf8OPrCrXIB3vg680B6ueGgFsU7kt9vMRnXvmV4FLhAN5P/fTSNtNB7h5TatyiscVfn
 u2QOAOHWuTv07AADXBMe1zjV6MLkFDmOkUK+FcnRqeH6/IP+HMAJAbxaDIcVVXabR1+8
 DoAahs7kKG1x4PAds9s33iD6GuEWbousM6HkzHhuqpXs4UzIukdaq5286LBfIsmy9rEx
 j6osGMdud/vPcHuH3sBgc6Qelwb+z4G48oiY9949vQSVt6fdfzTrFz1iRlUT5su4VUIG
 uBpQ==
X-Gm-Message-State: AOAM531zhoKXsFIlF/A6sZ+tGQMCwCZ9H1NYwLRSksekQ4B5M8+ZK3+j
 3g9y6p1d2RLjeY2nN23s+1T73jOWOMHjVrXO1heS/Km6HyI3vjSVPopQEyZ90qQZz+VEA01iYO9
 zIft7q629o0cp
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2383793ejb.56.1614679633123; 
 Tue, 02 Mar 2021 02:07:13 -0800 (PST)
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2383767ejb.56.1614679632861; 
 Tue, 02 Mar 2021 02:07:12 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id y8sm17234778edd.97.2021.03.02.02.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:07:12 -0800 (PST)
Date: Tue, 2 Mar 2021 05:07:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210302045453-mutt-send-email-mst@kernel.org>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302100614.42acfe68@MiWiFi-RA69-srv>
 <cedb0323-ac0a-2eb5-497d-eb66a0dfefb6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cedb0323-ac0a-2eb5-497d-eb66a0dfefb6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ax24KpZ/HDtN

On Tue, Mar 02, 2021 at 10:43:55AM +0100, David Hildenbrand wrote:
> On 02.03.21 10:06, Igor Mammedov wrote:
> > On Mon,  1 Mar 2021 11:48:33 +0100
> > David Hildenbrand <david@redhat.com> wrote:
> > 
> > > The resizeable memory region that is created for the cmd blob has a maximum
> > > size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,
> > > as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
> > > we require more than 4k and can crash QEMU when trying to resize the
> > > resizeable memory region beyond its maximum size:
> > >    $ build/qemu-system-x86_64 --enable-kvm \
> > >        -machine q35,nvdimm=on \
> > >        -smp 1 \
> > >        -cpu host \
> > >        -m size=2G,slots=8,maxmem=4G \
> > >        -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
> > >        -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
> > >        -nodefaults \
> > >        -device vmgenid \
> > >        -device intel-iommu
> > 
> > I don't see what's here that would make cmd_blob go above 4k.
> > can you try identify what actually fills it up (perhaps we have a hidden bug elsewhere)?
> 
> VM initialization:
> 
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
>  -> new table size: 128
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9659
>  -> new table size: 256
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 384
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 512
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 640
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9659 - 9903
>  -> new table size: 768
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9903 - 10023
>  -> new table size: 896
> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
>  -> new table size: 1024
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
>  -> new table size: 1280
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10023 - 10225
>  -> new table size: 1408
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10225 - 10281
>  -> new table size: 1536
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10281 - 10505
>  -> new table size: 1664
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10505 - 10577
>  -> new table size: 1792
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
>  -> new table size: 1920
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
>  -> new table size: 2048
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10577 - 11471
>  -> new table size: 2176
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11471 - 11695
>  -> new table size: 2304
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11695 - 11735
>  -> new table size: 2432
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2560
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2688
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2816
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2944
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3072
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3200
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3328
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3456
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3584
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11735 - 11807
>  -> new table size: 3712
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
>  -> new table size: 3840
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
>  -> new table size: 3968
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
>  -> new table size: 4096
> 
> 
> When the bios/guest boots up:
> 
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/tables'
>  -> new table size: 128
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 64 - 9769
>  -> new table size: 256
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 384
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 512
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 640
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 9769 - 10013
>  -> new table size: 768
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10013 - 10133
>  -> new table size: 896
> bios_linker_loader_alloc: allocating memory for 'etc/vmgenid_guid'
>  -> new table size: 1024
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/vmgenid_guid'
>  -> new table size: 1280
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10133 - 10335
>  -> new table size: 1408
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10335 - 10391
>  -> new table size: 1536
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10391 - 10615
>  -> new table size: 1664
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10615 - 10675
>  -> new table size: 1792
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10675 - 10747
>  -> new table size: 1920
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/nvdimm-mem'
>  -> new table size: 2048
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/nvdimm-mem'
>  -> new table size: 2176
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 10747 - 11641
>  -> new table size: 2304
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11641 - 11865
>  -> new table size: 2432
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11865 - 11905
>  -> new table size: 2560
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2688
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2816
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 2944
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3072
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3200
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3328
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3456
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3584
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3712
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
>  -> new table size: 3840
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981
>  -> new table size: 3968
> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
>  -> new table size: 4096
> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
>  -> new table size: 4224
> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
>  -> new table size: 4352

yea it's because each command has space for 2 file names, so it's size
is 128 bytes. So just 32 commands is 4k.

Question is what is the extra table and why isn't it there before boot?

-> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
+> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/tables' to 'etc/acpi/tables'
 >  -> new table size: 3840
-> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
+> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/tables' for range 11905 - 11981
 >  -> new table size: 3968
-> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
+> bios_linker_loader_alloc: allocating memory for 'etc/acpi/rsdp'
 >  -> new table size: 4096
+> bios_linker_loader_add_pointer: adding pointer in 'etc/acpi/rsdp' to 'etc/acpi/tables'
+>  -> new table size: 4224
+> bios_linker_loader_add_checksum: Adding checksum for 'etc/acpi/rsdp' for range 0 - 20
+>  -> new table size: 4352

simply put I would expect the command blob size to be the same before
and after migration.

> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

