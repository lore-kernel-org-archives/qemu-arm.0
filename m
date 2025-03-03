Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2801938njb;
        Mon, 3 Mar 2025 10:21:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVV3RgujiiVsMiJWHx6Tj6QwP+a8gpPvfBiErkNRDFuZZWSa8E8SLCBhsJlAt0++PbL482W4iB5BqGoEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFNOCU3dO98dw+Xv9hM+BLjrBdek26qGjqAX52cMxlfwtdoiT7i9t47O+tSP7OEa+nHoTOw
X-Received: by 2002:a05:6214:500f:b0:6e4:42c2:dd91 with SMTP id 6a1803df08f44-6e8a0d63340mr222083526d6.37.1741026076521;
        Mon, 03 Mar 2025 10:21:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741026076; cv=none;
        d=google.com; s=arc-20240605;
        b=Z72ThuQw55tlZZE0KY0XjcUSlifvrjPOxILav7bWFJDpDRov4tXijmIYGRVsZ6bFbi
         2qSXhzT7SWmhoT2LTL9gdchxiO4oCRyyM/2Pd1ltXv3W+WvfbcDD3hwTBeLtjTQN4B9g
         yB8U82feytKiabb7OTeKfF1g1ce1Gh7L1FsRgIrGaie8LgD9yH0pv/0tK8V3MhrDn1D2
         hPsckw5ZIeNhrh/bka7pLGufznAesLKK5xWX1HcILP4IXFRdz58fMBcMXUTqmbUBLDLA
         zoxvwSZHaDKnbJVYOd0mwY53kYww7bkzVGbeeaUKOkPBmsR6YL/fG4pujW/EnE03ZPRK
         Vyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0YoHIuFSEeK7MKuSnvIBX2jv7utQoX9b++yL0jPdWzI=;
        fh=zZbRPOD2yD1se5JSkhIXQLPlBLqZWuHcUlgU/IuZOsc=;
        b=YKoBD23qdhGgV2tRXfuNGGObcBWI0+YNPgp1aAnYhe4Anfmu5uVroE3gZQiaQ2QddG
         2mjG6+fwATJtTsD9OsYN8HiwH4FFU1dolj7lrX2jtj1B0T+7SA53OO2kOwx8aP13JzM1
         1RHiJ9qiyLgZ9Rpjk4aLUjljPtJBeOwAgmvBbXy9SJiLMKNDGSwcaGFUiG28QXg10vyW
         FslMEUsAH4i7hIRS7KtcvN7zgE5bvbSYNfIhXWtHBLGcIAVEng1J4dMqC8aOrjsk4uNr
         7aFSh6i/PmJB32xdu6XwKeECJzyQcQhkVi0dKY8Ape6bzVj2H/mQCbRiIhX3WNRr108/
         ynIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMoRW3ZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0ba8si89617426d6.256.2025.03.03.10.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 10:21:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMoRW3ZF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpAPL-0000Sb-2w; Mon, 03 Mar 2025 13:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpAP9-0000Qa-SP
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 13:20:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpAP7-0007LN-GX
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 13:20:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso30703485e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 10:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741026031; x=1741630831; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0YoHIuFSEeK7MKuSnvIBX2jv7utQoX9b++yL0jPdWzI=;
 b=wMoRW3ZFLUlZDw1zZQkrUba12Xi5MUw5CVC7dg/cIQ+Ds8tWmmMahCwB1Y1aj0zDSb
 cwVQmH9sy6DEMthZe5T8RdC8yUfONfNuxZjkqMyTvJQTYVDlK8HHWD9FDGcrDiarPchB
 osUZ3l/nFRkxMYci6x+q3XpUftG2JGE5T1qqzEEOwhHnuKKTYNgY8yubIfkE5lA2JPV/
 p43eqyE3/si9kOrQkvEHX93pe8HQjfWgZaT7IQdzEPWVgC9Pz/7uNyRF9yHTP3r+E0qs
 8D685wgmV0PSY/+0ENMUAeaE2cmuNOhEqljLjoQMJ1kYKf3yGQhCjuUTLJzCpHj3WGZ3
 V10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741026031; x=1741630831;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YoHIuFSEeK7MKuSnvIBX2jv7utQoX9b++yL0jPdWzI=;
 b=pKp6iYogdxQ6Q6Xs8S/MkG0tC4ONzP3XIPev107qcphuyHL62HHg+j5+8fsD8MQetF
 sBdwoSBiuAja8uSu5jYb9nNLG0QsRuWLxYSAgdCKRQezvrtB60IR5qTPVLSV3njlIf+Y
 w4Zy5qQqU6Gz1gg0OtZVjyGesLxa6d3rTfO6IaUbJl5VDoJExes/Ky6RQHnf4WT3NVlU
 fUSV72XRucJnanm/oy3yL+q04FgDB4w6vp8MbLiVsyog+bLVjfbwodsqN21NtKRlADB8
 tjXCtN8FzxRtaL1WuvpYfxPy56jwN0TKnj6NCSKnSCb4yjb++fC/LLyb5SoatNsDPpGd
 3z+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn9Exna22d66tJOQ8PX+mc/lAIZ/KlNwz7jrJqepQHNq6tpsqMonA0ftlqffcEWU7Q+GT20ASktg==@nongnu.org
X-Gm-Message-State: AOJu0Yyy7Y09TTC/C2rg/bX3VeND3zfU4BIplCWhwIqqQ8cxTbG6+wJp
 84UEroQrWrHsGdsy5WNpZ+CCpuUsVJL/r1m5aW9+dXxQbeIwVVPRcSiCMjPR1q4=
X-Gm-Gg: ASbGncuzmzMEXPbbRaMyBY14rbSDjgEoj83amgZn1dJ7+tH8bElSjhfJTBT4BkJNlJ5
 KGzQ16w15oGCq6HSB5PRZOWftG9PkDVLChlCSxtOnctjwxVR2Ysm6WGG2M63y6sT5f/VR3gc228
 7A3aB7/Ebknq6z4J65srlzt59nLhQq3/kftQsGwawkyA4phgnQehDkLYRoS1NKzg52cazGTI9ZR
 m60RtzO3vv6Cw7xJUbgfHdkO2xfv5r0pcy7MP56uWpVxaMNnr6QbGXed1i6PakpH7rMpjc4SaDc
 RI6LnUtD9gWu/jpMQA6fOw59cmykEnpPPb1xoBDanhXqqquTl7X2XIW+jpo6mrcbfxbMuXBZKew
 UqVRchRTp7MyI
X-Received: by 2002:a05:600c:3b18:b0:43b:caac:5934 with SMTP id
 5b1f17b1804b1-43bcaac5c6emr5374455e9.10.1741026030801; 
 Mon, 03 Mar 2025 10:20:30 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm203944225e9.39.2025.03.03.10.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 10:20:29 -0800 (PST)
Message-ID: <2a4229cf-c789-41ed-ab46-0f0fd9efd19a@linaro.org>
Date: Mon, 3 Mar 2025 19:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/11] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Alexander Graf
 <graf@amazon.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-12-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250112210056.16658-12-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: W+PytEIvlZsD

On 12/1/25 22:00, Phil Dennis-Jordan wrote:
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
> ---


>   MAINTAINERS                 |   1 +
>   contrib/vmapple/uuid.sh     |   9 +
>   docs/system/arm/vmapple.rst |  63 ++++
>   docs/system/target-arm.rst  |   1 +
>   hw/vmapple/Kconfig          |  20 ++
>   hw/vmapple/meson.build      |   1 +
>   hw/vmapple/vmapple.c        | 618 ++++++++++++++++++++++++++++++++++++
>   7 files changed, 713 insertions(+)
>   create mode 100755 contrib/vmapple/uuid.sh
>   create mode 100644 docs/system/arm/vmapple.rst
>   create mode 100644 hw/vmapple/vmapple.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e220744abf..3a3d9e19f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2791,6 +2791,7 @@ M: Phil Dennis-Jordan <phil@philjordan.eu>
>   S: Maintained
>   F: hw/vmapple/*
>   F: include/hw/vmapple/*
> +F: docs/system/arm/vmapple.rst
>   
>   Subsystems
>   ----------
> diff --git a/contrib/vmapple/uuid.sh b/contrib/vmapple/uuid.sh
> new file mode 100755
> index 0000000000..956e8c3afe
> --- /dev/null
> +++ b/contrib/vmapple/uuid.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +# Used for converting a guest provisioned using Virtualization.framework
> +# for use with the QEMU 'vmapple' aarch64 machine type.
> +#
> +# Extracts the Machine UUID from Virtualization.framework VM JSON file.
> +# (as produced by 'macosvm', passed as command line argument)
> +
> +plutil -extract machineId raw "$1" | base64 -d | plutil -extract ECID raw -
> +
> diff --git a/docs/system/arm/vmapple.rst b/docs/system/arm/vmapple.rst
> new file mode 100644
> index 0000000000..5090a8997c
> --- /dev/null
> +++ b/docs/system/arm/vmapple.rst
> @@ -0,0 +1,63 @@

Alex, Phil, we now mandate a SPDX tag. Due to the license used in
vmapple.c in this patch, are you OK with me squashing here:

-- >8 --
diff --git a/docs/system/arm/vmapple.rst b/docs/system/arm/vmapple.rst
index 5090a8997c3..c5b1bcf45ea 100644
--- a/docs/system/arm/vmapple.rst
+++ b/docs/system/arm/vmapple.rst
@@ -0,0 +1,2 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
diff --git a/contrib/vmapple/uuid.sh b/contrib/vmapple/uuid.sh
index 956e8c3afed..f5637221d23 100755
--- a/contrib/vmapple/uuid.sh
+++ b/contrib/vmapple/uuid.sh
@@ -1,0 +2 @@
+#
@@ -6,0 +8,2 @@
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
---

?

> +VMApple machine emulation
> +========================================================================================
> +
> +VMApple is the device model that the macOS built-in hypervisor called "Virtualization.framework"
> +exposes to Apple Silicon macOS guests. The "vmapple" machine model in QEMU implements the same
> +device model, but does not use any code from Virtualization.Framework.
> +
> +Prerequisites
> +-------------
> +
> +To run the vmapple machine model, you need to
> +
> + * Run on Apple Silicon
> + * Run on macOS 12.0 or above
> + * Have an already installed copy of a Virtualization.Framework macOS 12 virtual
> +   machine. Note that newer versions than 12.x are currently NOT supported on
> +   the guest side. I will assume that you installed it using the
> +   `macosvm <https://github.com/s-u/macosvm>` CLI.
> +
> +First, we need to extract the UUID from the virtual machine that you installed. You can do this
> +by running the shell script in contrib/vmapple/uuid.sh on the macosvm.json file.
> +
> +.. code-block:: bash
> +  :caption: uuid.sh script to extract the UUID from a macosvm.json file
> +
> +  $ contrib/vmapple/uuid.sh "path/to/macosvm.json"
> +
> +Now we also need to trim the aux partition. It contains metadata that we can just discard:
> +
> +.. code-block:: bash
> +  :caption: Command to trim the aux file
> +
> +  $ dd if="aux.img" of="aux.img.trimmed" bs=$(( 0x4000 )) skip=1
> +
> +How to run
> +----------
> +
> +Then, we can launch QEMU with the Virtualization.Framework pre-boot environment and the readily
> +installed target disk images. I recommend to port forward the VM's ssh and vnc ports to the host
> +to get better interactive access into the target system:
> +
> +.. code-block:: bash
> +  :caption: Example execution command line
> +
> +  $ UUID="$(contrib/vmapple/uuid.sh 'macosvm.json')"
> +  $ AVPBOOTER="/System/Library/Frameworks/Virtualization.framework/Resources/AVPBooter.vmapple2.bin"
> +  $ AUX="aux.img.trimmed"
> +  $ DISK="disk.img"
> +  $ qemu-system-aarch64 \
> +       -serial mon:stdio \
> +       -m 4G \
> +       -accel hvf \
> +       -M vmapple,uuid="$UUID" \
> +       -bios "$AVPBOOTER" \
> +       -drive file="$AUX",if=pflash,format=raw \
> +       -drive file="$DISK",if=pflash,format=raw \
> +       -drive file="$AUX",if=none,id=aux,format=raw \
> +       -drive file="$DISK",if=none,id=root,format=raw \
> +       -device vmapple-virtio-blk-pci,variant=aux,drive=aux \
> +       -device vmapple-virtio-blk-pci,variant=root,drive=root \
> +       -netdev user,id=net0,ipv6=off,hostfwd=tcp::2222-:22,hostfwd=tcp::5901-:5900 \
> +       -device virtio-net-pci,netdev=net0
> +
