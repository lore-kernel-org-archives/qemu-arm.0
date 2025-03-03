Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2836379njb;
        Mon, 3 Mar 2025 11:24:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7AoCglHt2yzoLAbOiASyJfj99xOVO9iwRL7wJiRF3O6hlt1pcF8d7lWK7kcQiyaIQo8l1DTR+8bQL8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHH/K0hyhPfuUFoCKBSusxc1h8wj62SkLo1AKeeNLzLU6zmNl/Zu4QRj4Jpeqj4B/TjJVQp
X-Received: by 2002:a05:6214:2507:b0:6e4:6ee1:a282 with SMTP id 6a1803df08f44-6e8a0d099edmr217580306d6.18.1741029842905;
        Mon, 03 Mar 2025 11:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741029842; cv=none;
        d=google.com; s=arc-20240605;
        b=XPMljsyWJvBg36mwgK2qa6fUXnNQCPNfiRllN9px6smpB4kuljq8Z3Bg+HWxpzNI06
         fU0aPYpyndbW8vL657h0eKkFQSGjziHxel3Q/mYYgBkyjz8ttmVIYGZSmRKrGHKPiJTk
         yj5Gq3Jkm2mkBez3msgBbH2QXKdT8x4RrLxoNuW/Ew3QNbcqNWA2yVDnDKBQbhhOb0zZ
         /xT+xZJWLg5OuzGQq9mZGbScJvYDnocZOCGo1oBNYE6u8ldrRVNlb9fbIP4BUym2CYMb
         o5NDLjnS5tTn0KNrPMwJa+JgaonmJKAIc3kjgi9k12B44mAku3bSE1R1kxcMgymColBV
         HpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Bl5On9k/V9AzXz5wfiLyRv7wQgqEYXE2HlwhsnKy1sk=;
        fh=c3ouUvOwYk2oAXWccbN5sPuMFh7Ogyt4+OpDN1e57uU=;
        b=QD45POX6Koq3z7Rn6rA9nLikPWI8Rv9meEhxNlBOi1LEcqC/tDtbLyhrGohh/R412h
         cmxVmn8Mteaoow9eUH8+tqjLlUde3RScoAp10MNrcf60w8iWGDXs8/rCHm5VcOJHoSMQ
         prh2H6Hk0nuGKO6hqtyMu1X1w7Yu3S8joTq5SucZ4V0qjb9BY/zloGEyKZukogW95kzc
         pHzRwRTxX2LPdprnVgCcYs2yH7ffIn+pCxBsZfbZgHfvotsuwmHJwlZL//9sEmTNE63v
         pvIJaUh9ZjvCCBCorexYQ/nFtqN9C9pL0G7cD9uuMUlebtLw7f+kJMK58BwwZrPHXJ5B
         xbZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAnlaAfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-474f561f1a0si12144201cf.263.2025.03.03.11.24.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 11:24:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAnlaAfw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpBOL-0005dR-1g; Mon, 03 Mar 2025 14:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpBOE-0005Z8-IZ
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 14:23:48 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tpBO8-0003vB-TM
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 14:23:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-390f69f8083so2273066f8f.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 11:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741029817; x=1741634617; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bl5On9k/V9AzXz5wfiLyRv7wQgqEYXE2HlwhsnKy1sk=;
 b=qAnlaAfwM5tWfZ6l2C4ySBGaf3AdJD4IOZU6C2RxTFnYpObQTtTDyypSVJfB89cKfI
 PAEdDgucqPJbJcLMCbxDnhxbGEmaDrwYIM3K6YGmjUeRwrvMIV+ITOUfN5XlNnywG2Oi
 iAy+icq1rf8nE0XWk62NJKDHSx4hzycy2PeV2SH2Q1+1foYro/mY66KveeFsxH7yMc7V
 4fEXL90j5bNM+PLTQ0Q9Ig5/Ui5sX1voOhc03ENvXNh4NS0EcDnmUHPlAh4rBWa9E0nL
 P/+0PF4DGWOaDzRhmSEe4Dwg6KeqbuVL0vEdkGjnSriVq/E+Om+4Bxmb6XmlsSPmdiYE
 VLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741029817; x=1741634617;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bl5On9k/V9AzXz5wfiLyRv7wQgqEYXE2HlwhsnKy1sk=;
 b=HVvGGG0wq30T7ZWWvW/Kqmfa899e53HMJF6PeyxjLf4nXWcAdJdXjPMGDX15KctAaO
 cO+eewlYHzZ9fuD46t/bmr5Hb/HAVIk9cC5UqfKiKwT93dh3cQylD3nQho2oc4T+YHkT
 w73j+FCTJesW5mbXJov4Yt/18f1WfA4sRHWgZTS3vtv9gKB8ugUBJxZX+KAEUHag++4L
 aejgTM/wavx1zYuL8nDxLfGY9YkKRrP4nouZvBnm6KY5gcJ6hB/g10ytG1fFtRf6iiAH
 BqnAW4IRd7EkVhhxrASMIlL9Vy6mFB079vK0pg5Ug6HQ/4fDL0vpyQsbGcqPeDi5LC/1
 ry0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoKVMWzX7bWonwHUlNLQvYJMsi576c0uqC9HvLaaNMOh1kPAf993wsQqblPOedaCcHFxf5N3eKOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxjyZbSctfqcw4GSC9Y0dzwGudk5cXAN+LqxqSdvQvG7O8Wxo6W
 BcrJ+gv/KeKZ0MtXfhhvaFgu3GLiucCF3u9Ey8xSkS32apmCwtgtZeYhdAB5nOk=
X-Gm-Gg: ASbGnctKnCEz22z15iHrGiFXg82v0p/SB4D4XuTdd5S9lz9FttjtAf8ni8VhV9Ui9T3
 UXhQAwEEKlxnLuRHRisNZM/46ZQsNptf4r3q3u2NHKitDndCkz7diwjOBu23AMwmj7hezsFfnrO
 Pkx9B53gDreqW9BbMTKFPlM25Uw8Li0JWrWvbZriiyM2zbP32Y3Og1VzyovGm6AVTHKVDxzkNUW
 JjoDnu7Ilti/ChE8mDd7QH3XVrYxKO/18FfTBkgqnmfgiNASzityirobHVqWQp+I9pystPKnO3L
 nsWRN2C47FSUgmYMweqV9+++vB9/6Rdzt//jtfmb7aj1vHxvhVhgpSlwvS56qpUgYG2KXZS1Sre
 nnsn4HZkWz9aa
X-Received: by 2002:a5d:64af:0:b0:390:f738:2467 with SMTP id
 ffacd0b85a97d-390f7382999mr9655552f8f.33.1741029816706; 
 Mon, 03 Mar 2025 11:23:36 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4796084sm15584542f8f.19.2025.03.03.11.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 11:23:36 -0800 (PST)
Message-ID: <1f53a845-1680-41c5-82c2-606492098b80@linaro.org>
Date: Mon, 3 Mar 2025 20:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/11] hw/vmapple/vmapple: Add vmapple machine type
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, Alexander Graf
 <graf@amazon.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-12-phil@philjordan.eu>
 <2a4229cf-c789-41ed-ab46-0f0fd9efd19a@linaro.org>
Content-Language: en-US
In-Reply-To: <2a4229cf-c789-41ed-ab46-0f0fd9efd19a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: Mkfub2owmtiv

On 3/3/25 19:20, Philippe Mathieu-Daudé wrote:
> On 12/1/25 22:00, Phil Dennis-Jordan wrote:
>> From: Alexander Graf <graf@amazon.com>
>>
>> Apple defines a new "vmapple" machine type as part of its proprietary
>> macOS Virtualization.Framework vmm. This machine type is similar to the
>> virt one, but with subtle differences in base devices, a few special
>> vmapple device additions and a vastly different boot chain.
>>
>> This patch reimplements this machine type in QEMU. To use it, you
>> have to have a readily installed version of macOS for VMApple,
>> run on macOS with -accel hvf, pass the Virtualization.Framework
>> boot rom (AVPBooter) in via -bios, pass the aux and root volume as pflash
>> and pass aux and root volume as virtio drives. In addition, you also
>> need to find the machine UUID and pass that as -M vmapple,uuid= 
>> parameter:
>>
>> $ qemu-system-aarch64 -accel hvf -M vmapple,uuid=0x1234 -m 4G \
>>      -bios /System/Library/Frameworks/Virtualization.framework/ 
>> Versions/A/Resources/AVPBooter.vmapple2.bin
>>      -drive file=aux,if=pflash,format=raw \
>>      -drive file=root,if=pflash,format=raw \
>>      -drive file=aux,if=none,id=aux,format=raw \
>>      -device vmapple-virtio-blk-pci,variant=aux,drive=aux \
>>      -drive file=root,if=none,id=root,format=raw \
>>      -device vmapple-virtio-blk-pci,variant=root,drive=root
>>
>> With all these in place, you should be able to see macOS booting
>> successfully.
>>
>> Known issues:
>>   - Currently only macOS 12 guests are supported. The boot process for
>>     13+ will need further investigation and adjustment.
>>
>> Signed-off-by: Alexander Graf <graf@amazon.com>
>> Co-authored-by: Phil Dennis-Jordan <phil@philjordan.eu>
>> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
>> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
> 
> 
>>   MAINTAINERS                 |   1 +
>>   contrib/vmapple/uuid.sh     |   9 +
>>   docs/system/arm/vmapple.rst |  63 ++++
>>   docs/system/target-arm.rst  |   1 +
>>   hw/vmapple/Kconfig          |  20 ++
>>   hw/vmapple/meson.build      |   1 +
>>   hw/vmapple/vmapple.c        | 618 ++++++++++++++++++++++++++++++++++++
>>   7 files changed, 713 insertions(+)
>>   create mode 100755 contrib/vmapple/uuid.sh
>>   create mode 100644 docs/system/arm/vmapple.rst
>>   create mode 100644 hw/vmapple/vmapple.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e220744abf..3a3d9e19f4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2791,6 +2791,7 @@ M: Phil Dennis-Jordan <phil@philjordan.eu>
>>   S: Maintained
>>   F: hw/vmapple/*
>>   F: include/hw/vmapple/*
>> +F: docs/system/arm/vmapple.rst
>>   Subsystems
>>   ----------
>> diff --git a/contrib/vmapple/uuid.sh b/contrib/vmapple/uuid.sh
>> new file mode 100755
>> index 0000000000..956e8c3afe
>> --- /dev/null
>> +++ b/contrib/vmapple/uuid.sh
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +# Used for converting a guest provisioned using Virtualization.framework
>> +# for use with the QEMU 'vmapple' aarch64 machine type.
>> +#
>> +# Extracts the Machine UUID from Virtualization.framework VM JSON file.
>> +# (as produced by 'macosvm', passed as command line argument)
>> +
>> +plutil -extract machineId raw "$1" | base64 -d | plutil -extract ECID 
>> raw -
>> +
>> diff --git a/docs/system/arm/vmapple.rst b/docs/system/arm/vmapple.rst
>> new file mode 100644
>> index 0000000000..5090a8997c
>> --- /dev/null
>> +++ b/docs/system/arm/vmapple.rst
>> @@ -0,0 +1,63 @@
> 
> Alex, Phil, we now mandate a SPDX tag. Due to the license used in
> vmapple.c in this patch, are you OK with me squashing here:
> 
> -- >8 --
> diff --git a/docs/system/arm/vmapple.rst b/docs/system/arm/vmapple.rst
> index 5090a8997c3..c5b1bcf45ea 100644
> --- a/docs/system/arm/vmapple.rst
> +++ b/docs/system/arm/vmapple.rst
> @@ -0,0 +1,2 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> diff --git a/contrib/vmapple/uuid.sh b/contrib/vmapple/uuid.sh
> index 956e8c3afed..f5637221d23 100755
> --- a/contrib/vmapple/uuid.sh
> +++ b/contrib/vmapple/uuid.sh
> @@ -1,0 +2 @@
> +#
> @@ -6,0 +8,2 @@
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> ---
> 
> ?
> 
>> +VMApple machine emulation
>> +========================================================================================
>> +
>> +VMApple is the device model that the macOS built-in hypervisor called 
>> "Virtualization.framework"
>> +exposes to Apple Silicon macOS guests. The "vmapple" machine model in 
>> QEMU implements the same
>> +device model, but does not use any code from Virtualization.Framework.
>> +
>> +Prerequisites
>> +-------------
>> +
>> +To run the vmapple machine model, you need to
>> +
>> + * Run on Apple Silicon
>> + * Run on macOS 12.0 or above
>> + * Have an already installed copy of a Virtualization.Framework macOS 
>> 12 virtual
>> +   machine. Note that newer versions than 12.x are currently NOT 
>> supported on
>> +   the guest side. I will assume that you installed it using the
>> +   `macosvm <https://github.com/s-u/macosvm>` CLI.

I'm also squashing here:

-- >8 --
diff --git a/docs/system/arm/vmapple.rst b/docs/system/arm/vmapple.rst
index c5b1bcf45e..35c329ea5a 100644
--- a/docs/system/arm/vmapple.rst
+++ b/docs/system/arm/vmapple.rst
@@ -19,3 +19,3 @@ To run the vmapple machine model, you need to
     the guest side. I will assume that you installed it using the
-   `macosvm <https://github.com/s-u/macosvm>` CLI.
+   `macosvm <https://github.com/s-u/macosvm>`__ CLI.

---

to avoid when building the documentation:

docs/system/arm/vmapple.rst:17:'any' reference target not found: 
https://github.com/s-u/macosvm
ninja: build stopped: subcommand failed.
