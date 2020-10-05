Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3845814lfq;
        Mon, 5 Oct 2020 02:23:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5pI9VLT/DL6jY2CuXSuh/2l1ineW7SIrZAnXS61PAGEL1UPp+s593RS+5fGfq8ESRrsGm
X-Received: by 2002:a17:906:1c0f:: with SMTP id k15mr999248ejg.343.1601889783052;
        Mon, 05 Oct 2020 02:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601889783; cv=none;
        d=google.com; s=arc-20160816;
        b=RGyTFIrJ7feX/a99NJKj9TZEkh6wF1WFKTn7pdpqHKmOH+htiZiYIfYXZmSCt1aHkm
         taT/KaTNw8mRFSpa8I3J5in412u3VAV1eiachLmKg3CnEfp8kaZY+dAjS/ToaLDPUDdY
         GZzDwuBtguWvB/qkc7/kST9sOS5TcAgA8f7bVJg5R90FgPk/m3zDoEKIQkycmdSP3xqr
         G6n0Wo9WMuVQnUsX9/Z0vYmbubPJ9fEMXpVysUb9XwagT0+1bPC91pvqSJf5rYEEnYoQ
         +u9Qc4YfLFx6owahb2VBO6lp1KURgsQx2Gjs9jKs0x2r9pQV03yA4ybzRFQE6u1/Z1oF
         uwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:cc:to:from:subject
         :dkim-signature;
        bh=ugm8HlWBBQwIq6YqZ4bqZwMlHXIN2IqfB12xnKXSLh4=;
        b=mS3UbWXzMJelTWBP3aWmY4Eqxsq9qUmUdLU+p8qLwHUJt+6/NORuCcR4ifSEP29lc/
         lJkARLB1SNFQcz/EBCe9M99km+xKbPKGZWAGf9InW5WQ2+5MofUmXW3+5yNC32Iuq7pQ
         Y4CAUkwKaRhdA60Zptofc+5fkQzZB2Rh6RaDlhja3ssTGEV/4uvXY+D8xXGOIV2EYg+5
         4JCw07OdbUkVQ2sHj4Ydv2s5nd6pEBoiAAQS5CM1OQb9SiYbN/d/VmmbGqQLDYetL9+u
         2bO6KeYRqq6fE0HoMOfb/OlTPhLjd4vuiS9ikFJqlT++eRrYO0u0ZgIzlOnUtW4+IxLc
         Ptaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zr9+LqYH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id l13si4916355edn.600.2020.10.05.02.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 02:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zr9+LqYH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601889781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ugm8HlWBBQwIq6YqZ4bqZwMlHXIN2IqfB12xnKXSLh4=;
	b=Zr9+LqYH3m2q1IdW/ADuGp20Tk7QlIixE07mwiyHONqiy1dKr+GD29vIth2xPrTvCiVOBX
	nhhRxBed0uZ6lnORynUOpP/PTlZzMbnn1CSJO7GiBz/FWLv7hjIv/g24yUmD4gAQgDluWy
	mgiSFU5Fa2oh0mNV0DYWVO4KlemTDjQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-cNU3j5iYP7ivcz1JaciqDQ-1; Mon, 05 Oct 2020 05:22:58 -0400
X-MC-Unique: cNU3j5iYP7ivcz1JaciqDQ-1
Received: by mail-wr1-f72.google.com with SMTP id r16so3739274wrm.18
        for <alex.bennee@linaro.org>; Mon, 05 Oct 2020 02:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ugm8HlWBBQwIq6YqZ4bqZwMlHXIN2IqfB12xnKXSLh4=;
        b=EZUm5PD9Z7zMCyNAR1EGClnAOoS5U4aAgC1Il4AZnherK948oG52QahfIQsnzrk3Ci
         79wqKlmKM8BES9niOILGaie/pZbZlNqeAMgZYiuAQXJDd9pX2+kz0E25M8NuCw0zDxR7
         drt1jX8T4KURUFP0IsfKW0zOnYUMxAGqKd/exHRX29odj7tm7V9kKYO5rxMT2yr7jY9m
         gLOWug4RjMllOizDYEKzJH6Lyt5z8tDY7nsiU4LCekOCzDUxoePjpMscLsUckdhsygwt
         wx0S7m9fOpfMUYr/YVfO9rZr1kw0bwlCjV7EA+oYBuDChEpzGgCuPTiRVvHBeLnN1gYW
         891Q==
X-Gm-Message-State: AOAM532+xJX0sAu1W1x/ttMg6MPo8ZeboySMPjpNkiHkcPmNyii5c94L
	U02AkQWQ4jf//UIcusao4Ln7cQMgROnLPvm0Tu01ztrf5BRivjzIMVonaZDOr9k2LwO0NYRo8Ng
	YSBN3C2xt+3Pb2k0p
X-Received: by 2002:adf:dd46:: with SMTP id u6mr5188154wrm.295.1601889777063;
        Mon, 05 Oct 2020 02:22:57 -0700 (PDT)
X-Received: by 2002:adf:dd46:: with SMTP id u6mr5188134wrm.295.1601889776884;
        Mon, 05 Oct 2020 02:22:56 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id a7sm11085392wmh.6.2020.10.05.02.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 02:22:56 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
 <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
 <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
 <8253ddd7-3149-17d9-1174-6474c4bde605@redhat.com>
 <36629bed-9b32-01a0-fdc2-831b10e4bad9@redhat.com>
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
Message-ID: <f3b931f5-c785-1d98-edd1-e5fcc91ff0ce@redhat.com>
Date: Mon, 5 Oct 2020 11:22:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <36629bed-9b32-01a0-fdc2-831b10e4bad9@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 4hl84IQ1F8PI

On 10/1/20 5:05 PM, Philippe Mathieu-Daudé wrote:
> On 10/1/20 9:38 AM, Paolo Bonzini wrote:
>> On 29/09/20 22:36, Philippe Mathieu-Daudé wrote:
>>> Yes, the problem if I don't restrict to KVM, when
>>> using the Xen accelerator odd things occur
>>> (using configure --enable-xen --disable-tcg --disable-kvm):
>>>
>>> Compiling C object libqemu-i386-softmmu.fa.p/hw_cpu_a15mpcore.c.o
>>> hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or directory
>>>
>>> See
>>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions#Use_of_qemu-system-i386_on_ARM
>>
>> I don't understand.  Is Xen adding CONFIG_ARM_VIRT=y to
>> default-configs/i386-softmmu.mak??
> 
> No, this is when using:
> 
>  config ARM_VIRT
>      bool
> +    default y
> 
> I had the understanding devices in hw/$BASEARCH would be only
> included for $ARCH, but I was wrong, any arch kconfig-include
> the devices of the other archs.
> 
> I tried the following diff which doesn't build because various
> devices in *non*-archdep folders use arch-specific Kconfig values:
> 
> -- >8 --
> diff --git a/meson.build b/meson.build
> index 9ab5d514d7..cfe19d0007 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -575,6 +575,7 @@ foreach target : target_dirs
>      if fs.is_file(target_kconfig)
>        minikconf_input += [target_kconfig]
>      endif
> +    minikconf_input += 'hw' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
>      config_devices_mak = configure_file(
>        input: minikconf_input,
>        output: config_devices_mak,
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 4de1797ffd..64c120175a 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -41,29 +41,29 @@ source vfio/Kconfig
>  source watchdog/Kconfig
> 
>  # arch Kconfig
> -source arm/Kconfig
> -source alpha/Kconfig
> -source avr/Kconfig
> -source cris/Kconfig
> -source hppa/Kconfig
> -source i386/Kconfig
> -source lm32/Kconfig
> -source m68k/Kconfig
> -source microblaze/Kconfig
> -source mips/Kconfig
> -source moxie/Kconfig
> -source nios2/Kconfig
> -source openrisc/Kconfig
> -source ppc/Kconfig
> -source riscv/Kconfig
> -source rx/Kconfig
> -source s390x/Kconfig
> -source sh4/Kconfig
> -source sparc/Kconfig
> -source sparc64/Kconfig
> -source tricore/Kconfig
> -source unicore32/Kconfig
> -source xtensa/Kconfig
> 
>  # Symbols used by multiple targets
>  config TEST_DEVICES
> ---

List of arch-indep Kconfig using arch-defined selectors:

hw/acpi/Kconfig:42:    depends on PC
hw/intc/Kconfig:31:    depends on ARM_GIC && KVM
hw/intc/Kconfig:36:    depends on OPENPIC && KVM
hw/intc/Kconfig:40:    depends on POWERNV || PSERIES
hw/intc/Kconfig:49:    depends on XICS && KVM
hw/intc/Kconfig:60:    depends on S390_FLIC && KVM
hw/mem/Kconfig:11:    depends on (PC || PSERIES || ARM_VIRT)
hw/pci-bridge/Kconfig:8:    default y if Q35
hw/timer/Kconfig:14:    default y if PC
hw/tpm/Kconfig:18:    depends on TPM && PC
hw/tpm/Kconfig:24:    depends on TPM && PSERIES
hw/vfio/Kconfig:16:    depends on LINUX && S390_CCW_VIRTIO
hw/vfio/Kconfig:38:    depends on LINUX && S390_CCW_VIRTIO
