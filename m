Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp865766njc;
        Sun, 9 Mar 2025 18:22:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2FOlseBopJBmdj9MZvp/ZgzpkdTkLM+2aK4T3RuP0U+MmJEzeslVwV8skIUhp66pbdJ+VpbDz8v5e4w==@linaro.org
X-Google-Smtp-Source: AGHT+IE+xu9D8rzpzu5MVEqZPuSyVWs0sSqqRnG3T4fpYgkVLi2qv391tjfn0cjXs7QNV/tA/J+3
X-Received: by 2002:a05:620a:271c:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7c5544e2e11mr274607285a.57.1741569759758;
        Sun, 09 Mar 2025 18:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741569759; cv=none;
        d=google.com; s=arc-20240605;
        b=HzopBQxh+QZC6yMv2yZMZ6zC1hTJnqeNJj7W4xN/GSyzFcdl4OVr9wpP1dSS+AqDd0
         9jZYSsMSvn2oPvbyGwQpf+WZL9jZq/oshraieGmvCgREisQCIbbcCn+Fegb1fHRoFI87
         6qDZ3X414fVqqWl7wmCFl2d8a+HuKBxDHuV5b33oRQ0eD5OMLLJVT/U+WcP681NSc1PP
         CsFbYyJ8K10Do0hOLa3fWuufKEKFTnkFT6v0uPWOMXKYIp8OEMlwEQt0WhiMdQEZAKYC
         /QspE1vH66c/UeCxJ4SQGZ0Bc/m9MbregzLjPv63vV4cLiNd+CXyl5BT0LYexp8EI637
         lPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9e5aV7YQbUvontpDsTrK6eK7yd4RTpsE6tpVFvOqS/0=;
        fh=AHq6ANMxphN9mN6a4cTJE3sb280i2jMqvUL6a9wZb1s=;
        b=W00rl4xhgmqxeSzJWVbWDgSKcUjKSg+5eHI1O50xpfY6rxqP6AWRxxp5L65zc5aysv
         PWC1jLKN9gHqCA7jYQ+UEytgXnF1a78DPqi0VGTgdNklGS7DBSdG/wGRHRj3Fik+R5Xn
         hkSNzwoN7JHEIxaV1/Ty+ugrJYELGP+oO2bQVGiwiu2QRqPxwDCgY9jy3PFYiozupuy3
         diSs4Cm7wR9PJVfb7MndACn3k8Cu8zD2E2hs67kS7LHegvf6MaAcJlfoFZHBFYe9jTpg
         rZxzslHSiw3bP35WteEw2RLFAYbFOWda4ACzlJaJ5SJ8ik4GODPJARtOqPRfp2P/7krU
         Lkag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWxRsbjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c546665014si326235585a.458.2025.03.09.18.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 18:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWxRsbjy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trRqO-0002VE-Rd; Sun, 09 Mar 2025 21:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trRqN-0002Uj-6V
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 21:22:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trRqL-0005HV-1H
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 21:22:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so20942065e9.3
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 18:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741569727; x=1742174527; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9e5aV7YQbUvontpDsTrK6eK7yd4RTpsE6tpVFvOqS/0=;
 b=GWxRsbjyYFu6yB+LH1fEguQPGyyzrpS4l3O67bNpf7g1YzEVlMMVHAauhJNywd9oPW
 nTQNIz+yZtMnFiT/3tBZIuqM9gfFWK+6udAvXSWwl82pGQ1sTxp57Jm7UlZJ5ovatfMO
 SeCkIbEYt3KABs6McgzyNjZIohiPuD5SexziewfkhODipK/GxGQDOHxO2vqQT+mvzxtJ
 u6RsEUUQ23qCIEbqoy98/I3ZIfjvSYjZxvUTxnPJeRqcGEPYFA0phJbroM82S/4d7fxc
 b7basBJYHdjUzuiWjC7oM/MqcL3MEkHdUryl27Hn8R8bJ+i2VBQnHGzxmkRUnj68zQIr
 WtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741569727; x=1742174527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9e5aV7YQbUvontpDsTrK6eK7yd4RTpsE6tpVFvOqS/0=;
 b=tsaNGouEt8njByBE4mfZ8neP8APRGfQi6naCqy7Du0YeC/OWTnc6Ex13pIY5LAFckk
 nNMTIPB18D5PxYXthLNDzYndMupeZ3NPQo39uISFOsY71+HkgK6CtPpwu+qSVB3zctiE
 M0TTKwQMEhspzWH5+3IJgeQzInT6dxOQh/Eg/DOqDQzMhMvK2nMPSdp6rVYYjtIy8QOz
 l+Qn3Y1G4V1eCQAjsGhJ+578I9L+636X8KCZ0JAlQVkMdzJqNKjhhoXE/lbQ9P/69xqC
 Sk2jKpCTgut7wZxg8HNiQnBUlMSXQ+IlDzywxf2Q++m8FApf2O0QIPaQ4GkVDfy7WMdQ
 auSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX49EXxGAwgEqFmnIlAmijIhlQU5iMXRn1EUfAqueqAfPSk1+EQBQam2IpeIbMZ+5cd7JJRKWq5Qw==@nongnu.org
X-Gm-Message-State: AOJu0YzlsrufFoNVfUGCbMq0ue+cRPyHtygyXExOwfndoWIaI2pt937O
 0saBqoa4IFFughOxkLSI4HH+MlfUEwoKYBEDhkqIc56ITQViwkdgNJsn/R8BO2CJskZs5lfdTU5
 rTJo=
X-Gm-Gg: ASbGncs+c6NakATonGNYQG99i7TK5VDbsdl91aHSTm+HaHlcqivO+mAZ0M7KZOlP5Ly
 du0HTnOJkKOe1XmQ3gPwSZGlyfY8m3XcvxItjSeTfW88sBy+0BsM7/z7nQtJD90TeW16N26d101
 e5VR2jtoEATeePRKsVef1Eg9SYZZQ67a5+9M2yKmry/rwMYLQcAxFIPM9xEdkFmDGS2h2Ls7QuK
 N5EiLFe1nRfJ+U94cGSCI/3OnEOxRo3Yh3C4wsY5lqxrrT3LSdRrw8oiFf26UncX+XVWF1GNoLO
 zgwebzxc0W2O5AVlQ6M/eW+a15lqozdiM+9bozLYhEqd26NwrNPxw04KJDBTyVQFhXKIFT95UMG
 vTWXmz/33otTA
X-Received: by 2002:a05:600c:a3a1:b0:43c:e478:889 with SMTP id
 5b1f17b1804b1-43ce47808eamr49833215e9.0.1741569726761; 
 Sun, 09 Mar 2025 18:22:06 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e1d67sm13334534f8f.74.2025.03.09.18.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 18:22:06 -0700 (PDT)
Message-ID: <6ab75235-0ba3-45be-a0cf-ec3ae96e856d@linaro.org>
Date: Mon, 10 Mar 2025 02:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 09/41] hw/vmapple/vmapple: Add vmapple machine type
To: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>
Cc: Alexander Graf <graf@amazon.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250305012157.96463-1-philmd@linaro.org>
 <20250305012157.96463-10-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250305012157.96463-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DsUJUNaYIYXO

On 5/3/25 02:21, Philippe Mathieu-Daudé wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple defines a new "vmapple" machine type as part of its proprietary
> macOS Virtualization.Framework vmm. This machine type is similar to the
> virt one, but with subtle differences in base devices, a few special
> vmapple device additions and a vastly different boot chain.
> 
> This patch reimplements this machine type in QEMU. To use it, you
> have to have a readily installed version of macOS for VMApple,
> run on macOS with -accel hvf, pass the Virtualization.Framework
> boot rom (AVPBooter) in via -bios, pass the aux and root volume as pflash
> and pass aux and root volume as virtio drives. In addition, you also
> need to find the machine UUID and pass that as -M vmapple,uuid= parameter:
> 
> $ qemu-system-aarch64 -accel hvf -M vmapple,uuid=0x1234 -m 4G \
>      -bios /System/Library/Frameworks/Virtualization.framework/Versions/A/Resources/AVPBooter.vmapple2.bin
>      -drive file=aux,if=pflash,format=raw \
>      -drive file=root,if=pflash,format=raw \
>      -drive file=aux,if=none,id=aux,format=raw \
>      -device vmapple-virtio-blk-pci,variant=aux,drive=aux \
>      -drive file=root,if=none,id=root,format=raw \
>      -device vmapple-virtio-blk-pci,variant=root,drive=root
> 
> With all these in place, you should be able to see macOS booting
> successfully.
> 
> Known issues:
>   - Currently only macOS 12 guests are supported. The boot process for
>     13+ will need further investigation and adjustment.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-authored-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-ID: <20241223221645.29911-15-phil@philjordan.eu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                 |   1 +
>   docs/system/arm/vmapple.rst |  65 ++++
>   docs/system/target-arm.rst  |   1 +
>   hw/vmapple/vmapple.c        | 618 ++++++++++++++++++++++++++++++++++++
>   contrib/vmapple/uuid.sh     |  12 +
>   hw/vmapple/Kconfig          |  21 ++
>   hw/vmapple/meson.build      |   1 +
>   7 files changed, 719 insertions(+)
>   create mode 100644 docs/system/arm/vmapple.rst
>   create mode 100644 hw/vmapple/vmapple.c
>   create mode 100755 contrib/vmapple/uuid.sh


> +static void vmapple_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->init = mach_vmapple_init;
> +    mc->max_cpus = 32;
> +    mc->block_default_type = IF_VIRTIO;
> +    mc->no_cdrom = 1;
> +    mc->pci_allow_0_address = true;
> +    mc->minimum_page_bits = 12;
> +    mc->possible_cpu_arch_ids = vmapple_possible_cpu_arch_ids;
> +    mc->cpu_index_to_instance_props = vmapple_cpu_index_to_props;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("host");

Not sure how I missed that earlier, but I'm now getting:

$ make check-qtest-aarch64
qemu-system-aarch64: The 'host' CPU type can only be used with KVM or HVF

> +    mc->get_default_cpu_node_id = vmapple_get_default_cpu_node_id;
> +    mc->default_ram_id = "mach-vmapple.ram";
> +    mc->desc = "Apple aarch64 Virtual Machine";
> +
> +    compat_props_add(mc->compat_props, vmapple_compat_defaults,
> +                     G_N_ELEMENTS(vmapple_compat_defaults));
> +}

