Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2189184njd;
        Tue, 22 Apr 2025 01:00:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx2F/ftmdhaB01rD9d9Gn/5GunGmzLGcSLWALd9CUAB8pXQfhre0zc/VqFgBGpJPi67NaqTPfdQ4qB4w==@linaro.org
X-Google-Smtp-Source: AGHT+IGmHemM9X375OQjSR8bDRjG/3xDa3DJ0y9DWp14rwxqtUthIguu14TLjx5FO9CsEZF29SxI
X-Received: by 2002:a05:622a:1a9c:b0:478:de14:135a with SMTP id d75a77b69052e-47aec397f4cmr280189621cf.20.1745308845285;
        Tue, 22 Apr 2025 01:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745308845; cv=none;
        d=google.com; s=arc-20240605;
        b=CFL9anRtgGnn2aoGx9CM2lSqHPkwDnjRovmAQyVDQfp/Yhbv27zpJwTqm/Vl+8RqWy
         YteS+NI/LpiXsb5qoHt/dCDMgmMpe2daFpdunKIwcozBrjz6CA3FayZs0Jjqi9Th285W
         MdFSf1tYoh+J7ffB3bGSFnNOzu6YEUKYxYkFvi0o7Qm250xxML0vExEWyuOqSlmYihRN
         aJxQafSDiA8Wq6faTDTUEEQRvb71ojGq4SRbdXDDLl9u2rn3ua9D3peTK+tlZH2Ym54V
         euEXFgUaIJzx3bKFSLkv+B3+/eCPOsgVT2MbU/AwbEQtrcRSw2oApm0bH7JhZTYHoOgf
         upAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XQhecFhUt0uSRhihZ4E1MU1NFxNs2sSpQDUgPh/erBs=;
        fh=JDZ1UnW6sxThwQhL4bSJqkZk6nnDGGXTV0ifuvacB8c=;
        b=bref3jl2tW9HYnNpWtbSlXMJ4Z8ZM2x2p0B8ydq/tooBshObt6w/ZMZzMnoOsxyqc+
         DIT65Ca/Ehac40+On0aTmXSZJBSM7RIWmgaPs5M4Aqg4KUvo6VxYyDoiGijvAnzQ50Gq
         qlkuosCvW8bJWjT3GNuGLQZ2VfrKIZUI0n3OVII+El3vXQHe7WvopCmL6kGOHV+o/qeH
         WhZmvOSUzoO1X3xYs+bV12lCnwziBukJrC0Is/RnYRFgZNVLrmqctY3FRIIXAkzvnD6P
         0GUBm640o9BUoT64OAUpEJPquzWRMOgDNSSu5dRqjQaPOVyaXXdY928urRYBehcO1C+/
         dgJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQG0AXW2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9ca3a11si110414131cf.217.2025.04.22.01.00.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 01:00:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VQG0AXW2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u78YP-0002pN-Pt; Tue, 22 Apr 2025 04:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u78YM-0002oi-Az
 for qemu-devel@nongnu.org; Tue, 22 Apr 2025 04:00:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u78YI-0007TG-Vt
 for qemu-devel@nongnu.org; Tue, 22 Apr 2025 04:00:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso39577195e9.3
 for <qemu-devel@nongnu.org>; Tue, 22 Apr 2025 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745308821; x=1745913621; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQhecFhUt0uSRhihZ4E1MU1NFxNs2sSpQDUgPh/erBs=;
 b=VQG0AXW29ABVSvwgTuE4qoPGWPnyvLEx+m6wo4sJ6d2k5Py+CkGabkqWV/TLZOIABL
 6kyAmetnVeSU4Q+ZAsgUTFIUZzdyPgjhmbQR8/+8xFoomb8c9QGcgDPFjx4ify7l9GWa
 I57B5Gtnu+nJbzDyEZ2mek6rikLiCtG4IvcQJmLHgXN3KvJSAFkejq3v8OBFFKmeL486
 tvtuKhZgT0KQKYnnpx/z4wIquopxnopwUU+Vpc0VYfJfnnariw03xu3E7dV3cpYDl3T0
 ua7C4FU5WIQXk4jUoYqsZ0V1WfKksh5SUZRi00o/yegFh02xWXkxRoYoOvn4IRr9cv7k
 VIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745308821; x=1745913621;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XQhecFhUt0uSRhihZ4E1MU1NFxNs2sSpQDUgPh/erBs=;
 b=spl0kHjkPYPC5r6at0DWZWEAs2VRkoZzkF11cgDEOl7+Ev2ql7xH/SF46Ybq/imQE+
 B/2u9Cv68rnjqjYLNGd9Qw7ALYEjz8AoeDvu+qRAqvSW4OvwET1lRRupkAOJJYEC2PNj
 VH82t3P1ao17hqHkPuZ1t1JgKAzSmdEZyLLJlGe7zUZtSEBsYUHxGaAXZy0h3tcAMu9p
 TRJxwq9/ZkSPVJ6CJVrqIWnKZQ1ZHYYaWeywSV7PPLHcCIvXQ2lnDRR7G7yy5+Rs32Cv
 eSBQ+3389TUU8aF/bONJshV2THAgTWwP8b2HjBNH8gma+kfHgRkHvda0PpZqmUBz3oje
 G12Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVon/SIB2rMQDFGH9mPw/VR75NcuWfNqvipOUj9rJnAr/85/9Ih8r8GWNAvaGRdDQWaXQnHXU0TarCS@nongnu.org
X-Gm-Message-State: AOJu0YzzZ+aTkl2/UAedfxjC5EwyRXuQvIVndgaIrxvMI2qPpWr4V6YE
 MSVv0F0Bz01/LfA9/npOQ5M/DkwocoUh3titjfxDB0LX2f+KXV2/1iYr8/pTy8E=
X-Gm-Gg: ASbGncv/jjtTqUz74D7uYYB1UWNHcEtS6SMQRp4xmrDVdskD3+wt5pDYnAP1xzBwcez
 cqoavblYqwSAZTjVF+TOTVsQQTcLUL5NKIHW4QgLtmW2qUHm4oNsxqp6TOJZ0i4KVDIJ6epp39R
 LxDGNtcefOFn58ZQ3WYrayfWUNvB9Lt5FsSwwHG+eJUavDYL65Lf0R6STzkCkNeHtHgKMb2eht1
 I2aKuhsH0B3BXo1+8dvK/OiQSFO65qs703g3HB0wDaLvK9zA0jq2BJDjQPGDv/KQaoFgxBWvYAI
 XobjJUiyxSYxEipj3KMiqQTd+Mi78GWwU4+My/tIEuq8L7tfRtx8Phoz9Td4I6RpNte4eVQvmaa
 oSS2CY4eS
X-Received: by 2002:a05:600c:5395:b0:43d:db5:7b1a with SMTP id
 5b1f17b1804b1-4406ab96f63mr135440195e9.12.1745308820916; 
 Tue, 22 Apr 2025 01:00:20 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4be2sm14065833f8f.83.2025.04.22.01.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:00:20 -0700 (PDT)
Message-ID: <2b3ca5a6-a2fb-414b-bbcf-f2ec9ce2df28@linaro.org>
Date: Tue, 22 Apr 2025 10:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] acpi: Add machine option to disable SPCR table
To: Li Chen <me@linux.beauty>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <87a588wsc9.wl-me@linux.beauty>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87a588wsc9.wl-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d6gpvSKpzLNH

Hi,

On 22/4/25 09:47, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> The ACPI SPCR (Serial Port Console Redirection) table allows firmware
> to specify a preferred serial console device to the operating system.
> On ARM64 systems, Linux by default respects this table: even if the
> kernel command line does not include a hardware serial console (e.g.,
> "console=ttyAMA0"), the kernel still register the serial device
> referenced by SPCR as a printk console.
> 
> While this behavior is standard-compliant, it can lead to situations
> where guest console behavior is influenced by platform firmware rather
> than user-specified configuration. To make guest console behavior more
> predictable and under user control, this patch introduces a machine
> option to explicitly disable SPCR table exposure:
> 
>      -machine spcr=off

Please add some tests in tests/qtest/bios-tables-test.c.

> 
> By default, the option is enabled (spcr=on), preserving existing
> behavior. When disabled, QEMU will omit the SPCR table from the guest's
> ACPI namespace, ensuring that only consoles explicitly declared in the
> kernel command line are registered.
> 
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>   hw/arm/virt-acpi-build.c       |  5 ++++-
>   hw/core/machine.c              | 22 ++++++++++++++++++++++
>   hw/loongarch/virt-acpi-build.c |  4 +++-
>   hw/riscv/virt-acpi-build.c     |  5 ++++-
>   include/hw/boards.h            |  1 +
>   qemu-options.hx                |  5 +++++
>   6 files changed, 39 insertions(+), 3 deletions(-)


