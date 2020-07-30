Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2702333lfy;
        Thu, 30 Jul 2020 09:12:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDRm3O5RaVYAJwMYw5iqjNj9BcYQ7IPcG0boPpZ/OwzuxfvT0S68NBanTE6RxjZl2dpmmh
X-Received: by 2002:a25:7542:: with SMTP id q63mr5905734ybc.19.1596125557432;
        Thu, 30 Jul 2020 09:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596125557; cv=none;
        d=google.com; s=arc-20160816;
        b=lymkHDWEM1inBUlotx+wvei3lr7wGv2hvWifGGYbvebJwRQEYHHxq+v7nTSv0n1D4m
         Himq+dvyl9MpzXqjFtvOrO6Da0f8tyj8N8b6VlmRlw36bQM/NJQ/efzIM6R83AH3mZu7
         7jcufEXvF9Necz/wL5MAu0HGrToTWI/HwCouQSTMDZeaTU0uMBNu0fCpRKxh5u2h1Hfb
         2rjbz+Wfqo30oS6zd4N5tXUopiRypP/XbWxMK9xRmxgMaPRyUL2S94kETs78vH6/BGBT
         /bNuKUwrUEfAv8FMKn/M0NOaw52509QPZp+I/ByqMuwIYPaUaNronn9YCFo4Z/f/xqCv
         q3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=6AmNJhCqaT3lFRHiPhTvavMMXgP1Kog8WuR7ZOTUQM0=;
        b=pJc/ufdwHVwkWgyRyplxvuw6RPHh7fBNz+HRvzhqbYp//TqBdMHdbzxA5Kn4sXI/ki
         u17ONJ4zYBoMiqfSCY9i8vEUzg/62PVisVkMXJs0OPabLseT5zVJEXvcJ68RWCF/Sm9q
         Ok+v48+HhyMPC1RH7kjz1bIQWKUrQ35e6iSYNmaQZLWqOkNakl4ibic16A6cuTKdtcYK
         kE4ZJAxJVEPN8Z2s9flrofFoDzunAbfGcjO/bwl5rA8DK5eYsCmwybJWLgxIRW8b0sTB
         Ew6JWIUQB60q6A3+4EsGE3edxNYHEykE9yfYL41k9R4GDZjYUsAc8zRZs/M/a7Ch9rlQ
         PNVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h+rPtxyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si4811251ybk.483.2020.07.30.09.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 09:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h+rPtxyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1BAa-0005XA-QI
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 12:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k1BAR-0005UY-A1
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 12:12:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60300
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k1BAO-0000MU-VV
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 12:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596125544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6AmNJhCqaT3lFRHiPhTvavMMXgP1Kog8WuR7ZOTUQM0=;
 b=h+rPtxyAke3hbqDgDpGbFXbJTcs/WMhgLv0LQJdXxsb310O9rYw6b3fxPaKCYZZDJ+zeXF
 f9sECveDCnD+kCRX8yIHucI2/QhwJmRFlcUWooGdbpeTh0NSg3fwk7pIYpxuEKZFZomuFp
 NOUz17+gW3ThfSuOybv/ocgG+Z+Q2ZE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-SqCXepQsMVKjXJTw86FoMw-1; Thu, 30 Jul 2020 12:12:22 -0400
X-MC-Unique: SqCXepQsMVKjXJTw86FoMw-1
Received: by mail-wm1-f72.google.com with SMTP id y204so2381298wmd.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 09:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6AmNJhCqaT3lFRHiPhTvavMMXgP1Kog8WuR7ZOTUQM0=;
 b=JKOlPV6MTpmonD0+ip7brxiqoIST9VQWB0cQXCIIS3DlL0M6jQEKoilYscbCoRrtqe
 gmsbAUklaMt6MfH7fs6/sV2d3hpQ30VBBezkykCfEtYVtDw6O+8L61gpcTb7w+ia4t2+
 wuNmaYzhiCi2dtQiqQwjsIZTO+HOmpOZgTs3YwI9WBw7i+/LyWK+cJyJSYe2J0J5jjQC
 0Y9ugzNhRR7UkutJ7OXCbBZCtsdynjRdrDJS8u59hcW6b7c1/koLiSou54XbHJ1x2HhD
 flsr97oGPUfQfDviBKEOT22oklBytGx0H0IFDdLRilpldTUP4F/UvYtM8uUl+qOKtx+n
 llcw==
X-Gm-Message-State: AOAM530a3D6ZKclf2a2+S9us+VPGT5swIA7Pxf3M708jMhvcBa39u5sk
 54S6o6Nh5IrCs11kfGlyE5iTGnlR07JMSH2Te0FHrovazcnhwLWK+JFKT7u266q1flDBPwWFivH
 lKQahCNpdEmVQ
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr3212664wrw.13.1596125540987;
 Thu, 30 Jul 2020 09:12:20 -0700 (PDT)
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr3212644wrw.13.1596125540740;
 Thu, 30 Jul 2020 09:12:20 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm9712725wrw.93.2020.07.30.09.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 09:12:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm/acpi: fix an out of spec _UID for PCI root
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200730155755.188845-1-mst@redhat.com>
 <20200730155755.188845-2-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <dc8df953-39cd-8a96-af81-8c15e69caa67@redhat.com>
Date: Thu, 30 Jul 2020 18:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200730155755.188845-2-mst@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:59:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, vit9696 <vit9696@protonmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UR32ZyDUpTRt

On 7/30/20 5:58 PM, Michael S. Tsirkin wrote:
> On ARM/virt machine type QEMU currently reports an incorrect _UID in
> ACPI.
> 
> The particular node in question is the primary PciRoot (PCI0 in ACPI),
> which gets assigned PCI0 in ACPI UID and 0 in the
> DevicePath. This is due to the _UID assigned to it by build_dsdt in
> hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
> identifier given by pcibus_num in hw/pci/pci.c
> 
> In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
> the paragraph,
> 
>     Root PCI bridges will use the plug and play ID of PNP0A03, This will
>     be stored in the ACPI Device Path _HID field, or in the Expanded
>     ACPI Device Path _CID field to match the ACPI name space. The _UID
>     in the ACPI Device Path structure must match the _UID in the ACPI
>     name space.
> 
> (See especially the last sentence.)
> 
> A similar bug has been reported on i386, on that architecture it has
> been reported to confuse at least macOS which uses ACPI UIDs to build
> the DevicePath for NVRAM boot options, while OVMF firmware gets them via
> an internal channel through QEMU.  When UEFI firmware and ACPI have
> different values, this makes the underlying operating system unable to
> report its boot option.
> 
> Reported-by: vit9696 <vit9696@protonmail.com>

Ditto:
Reported-by: Vitaly Cheptsov <vit9696@protonmail.com>

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Peter can you either ack or merge this one pls?
> 
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 91f0df7b13..0a482ff6f7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -170,7 +170,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> 

