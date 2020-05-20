Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp584159lfb;
        Wed, 20 May 2020 06:33:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhRZ0rQnpRcAj/36giweftsup5D7CvTmDv4Aon3jFm7nVqGsZFJzn3Rz4ChRjDzqhaUIvA
X-Received: by 2002:a05:620a:208f:: with SMTP id e15mr4336130qka.377.1589981584228;
        Wed, 20 May 2020 06:33:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981584; cv=none;
        d=google.com; s=arc-20160816;
        b=O0KhrkEf0LoyURonCF5TnbcEyMgzPZagYOIvGG8t/7Kdg0eKFxcWz8HY2UOCyE7h72
         fzkf2aIpWw8U7X+7Wr7Cvb7rv6CjmQ1PG8arvQH4qtHKD2tabb3GAMkyztLXvHf4NWlk
         A29JoJycO1eYHIAzKXlPdH+LjXm+BFB70euD+nrkF7bnKNUIXJpJP+qY88je8VFki04E
         JkGLyxsZhQ2+q1VWmUHadfmWZ6oWX8DhpqEhmtD9487XU1uqIILcWdCOGAnttrEmJmHG
         vWq2SwYCEFEx5Z6fz+OtATn/AV/TPRvXy5H3vcaUwuLNVrppjnK36x/E453RHQv8uXZD
         tPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IwIHrpyVIX86aJn0ORsOQ0Yk0TNb79Ag+DOjqPnc9zM=;
        b=0WuVdxQYhggbhkxrk1FX12c7tJn/Ttln28hmh2HDtqCHIkEILj9ydLeNSNFuep87Ah
         sKz3z1vXBSwNBya8ZVm8bMWZoFUNSMR5AIZ6kthjxD1dbi8g2XVhPiWDyovkbuH5O2b4
         en7VZmjlI9F16hSN+J9hmm6Vl+/fc9BdFsQMKvBt+LzO0TbOLPmwObBARqQxqABFaVsJ
         M9IW90psBgQygoe7Gw4Dc3UAsm2MShq9wrZ1V7HbV9TWuZx7t+ZVMxMqCX22pySAv1pt
         pjebAdWfNSN26AVuM0tUNmWCvewE5v+x0Lvia+DQTaofjP2lPoba+3oEUlsN7vt7aeI+
         VLbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X97PBlUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si1799427qkk.12.2020.05.20.06.33.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:33:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X97PBlUX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOqF-0002oG-Ir
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOjP-0006AD-MP
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:25:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43118
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOjO-0001Nv-Pe
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwIHrpyVIX86aJn0ORsOQ0Yk0TNb79Ag+DOjqPnc9zM=;
 b=X97PBlUXtA2Kpt5dNN6Oo9eZ8IcsUZB009ZLxOjTSwgga/8ZUcEyK1kN4DAakjROycaieN
 /wXhCoDw/kAsXDbzY/SE3hO2nBE4ctIYK2aSCr1c9FhoKTzP6YZi/f5Bekj3lFvsFU7Y10
 o9WB6BkmbQ3/eO0KI7hzIaz4BqMPb4M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-ZlrvZl2NPGSTN1GCxiDk2A-1; Wed, 20 May 2020 09:25:56 -0400
X-MC-Unique: ZlrvZl2NPGSTN1GCxiDk2A-1
Received: by mail-wm1-f69.google.com with SMTP id l26so898853wmh.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 06:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IwIHrpyVIX86aJn0ORsOQ0Yk0TNb79Ag+DOjqPnc9zM=;
 b=Wk5T09sUBewv0aWRJDYHVNdUmazd3KGsHwfx2KUHA5SkI+Q1+APctPztd6bX+/7icQ
 ua7m+DMWRmev3toWBtMGLryoWalO+XDsj5bmovLsrSn4m5xrbdT5SslmGi9YluMt3Qty
 EluDVj2HQpg1M/tcHnjK+NX6a3Vwl4TLIhcf2/8UqWBbM/TFIEhuS+VOwBbfirhUS5lX
 PlS1zGUcKLX4tX44GclwOCt24R1XfoUO0jFcCLcqwqo7Af2S2r+tomB9yc76rcxNujf8
 fBFnfUs/TTj28Dmw1UHUrvf6Ibx27b0pS1odLZfS7SzaSfTDN8716gYxkEk9lmLQcnZe
 g5vQ==
X-Gm-Message-State: AOAM532BB0Kft46DZh/rHjk/H6ctOQIoxWGynwFPfZcoQG2RjOb64qhV
 0dHs50RuMf4EnURPBkrmhksP+YqEjC/hi5ePvFrvIoQ9sLeH80IAkd/nU7KGX+PhUOmDaPSKTnJ
 G4Sr1fjjCe48r
X-Received: by 2002:adf:80f0:: with SMTP id 103mr3988799wrl.232.1589981155241; 
 Wed, 20 May 2020 06:25:55 -0700 (PDT)
X-Received: by 2002:adf:80f0:: with SMTP id 103mr3988774wrl.232.1589981155011; 
 Wed, 20 May 2020 06:25:55 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h133sm3213832wmf.25.2020.05.20.06.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:25:54 -0700 (PDT)
Subject: Re: [PATCH v3 01/22] microvm: name qboot binary qboot.bin
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2a9e8f07-a1eb-9c3b-5070-51d5a87d76d5@redhat.com>
Date: Wed, 20 May 2020 15:25:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-2-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NDyjixYsjEww

Hi Gerd,

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> qboot isn't a bios and shouldnt be named that way.

Still it resides in a directory named pc-bios =)

It is used later in x86_bios_rom_init() as:

     bios = g_malloc(sizeof(*bios));
     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
     if (!isapc_ram_fw) {
         memory_region_set_readonly(bios, true);
     }
     ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
     if (ret != 0) {
     bios_error:
         fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
         exit(1);
     }
     g_free(filename);

Many 'bios' occurrences.

Should it be called 'qboot.rom' instead?

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/i386/microvm.c                       |   4 ++--
>   pc-bios/{bios-microvm.bin => qboot.bin} | Bin
>   roms/Makefile                           |   6 +++---
>   3 files changed, 5 insertions(+), 5 deletions(-)
>   rename pc-bios/{bios-microvm.bin => qboot.bin} (100%)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 937db10ae6a5..867d3d652145 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -47,7 +47,7 @@
>   #include "kvm_i386.h"
>   #include "hw/xen/start_info.h"
>   
> -#define MICROVM_BIOS_FILENAME "bios-microvm.bin"
> +#define MICROVM_QBOOT_FILENAME "qboot.bin"
>   
>   static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
>   {
> @@ -158,7 +158,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>       }
>   
>       if (bios_name == NULL) {
> -        bios_name = MICROVM_BIOS_FILENAME;
> +        bios_name = MICROVM_QBOOT_FILENAME;
>       }
>       x86_bios_rom_init(get_system_memory(), true);
>   }
> diff --git a/pc-bios/bios-microvm.bin b/pc-bios/qboot.bin
> similarity index 100%
> rename from pc-bios/bios-microvm.bin
> rename to pc-bios/qboot.bin
> diff --git a/roms/Makefile b/roms/Makefile
> index f9acf39954dc..d6d4948bfc31 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -68,7 +68,7 @@ default help:
>   	@echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
>   	@echo "  opensbi32-sifive_u -- update OpenSBI for 32-bit sifive_u machine"
>   	@echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
> -	@echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
> +	@echo "  qboot              -- update qboot"
>   	@echo "  clean              -- delete the files generated by the previous" \
>   	                              "build targets"
>   
> @@ -194,9 +194,9 @@ opensbi64-sifive_u:
>   		PLATFORM="sifive/fu540"
>   	cp opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>   
> -bios-microvm:
> +qboot:
>   	$(MAKE) -C qboot
> -	cp qboot/bios.bin ../pc-bios/bios-microvm.bin
> +	cp qboot/bios.bin ../pc-bios/qboot.bin
>   
>   clean:
>   	rm -rf seabios/.config seabios/out seabios/builds
> 

