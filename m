Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp258241lfb;
        Fri, 8 May 2020 08:38:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6eLIKHGLg9LU9v1NbAcifulEnQ+W9YS66h6GNzoi577THlcZWwhoZDTZDi4c4t7mDxFyz
X-Received: by 2002:a05:6214:158b:: with SMTP id m11mr3346198qvw.168.1588952310588;
        Fri, 08 May 2020 08:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588952310; cv=none;
        d=google.com; s=arc-20160816;
        b=bUg0mS18XbEgibX3ZWbZVxK5XSKbZJ/TYOB00NI7shBMhn8hwEII2sGfGClqhmH60j
         fXoViHV/l2nAQ5HUZJcAp7u7iFD9JSA6iF31ONyMWqgJvrAfpSmaQj1pfuxPg+RTpSMf
         YszkgbsUO3x6g3vP8Tz2KTJmtfeTuSOi+0/bPMWgErwY8akvHD3xYz3wRWe3qOyEcRQx
         PwsHURu+WXZ1StgmFCiDWqPT6RGGqCQ3hkWIyJ39CQY4L7H30xoUZMYEENChJlC5QHh/
         F7via6dp1ZpUiPgCUPbwx5C6wu/5L/bKtV/L/XAlqHPqoVycjC2fPaF45Cs4anBzMlBr
         lclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=efdEzAVZoqUilZ5KPe1GctEjRCGzwaERAh49d2ZqPBU=;
        b=c1bRK4AV4lT/mA5iClzkICOD2d8fr569YOBFckTcDL4TWHXX6ZKDPHC82IOZe6CUTj
         Hx50azxtNp7bUTPg3AVd1XOiJ3+qJwK0FYsVrZIbCtRi6xedSLeOjWhcFzQdHxpgWYta
         fe/lZToDUWhXARDfSq8rut05mhgnG/5vHJo/5p+E+vcx5GIyau1Gnd0CbjtFp/pBgA+a
         GSPVKXtvzIQ2j0yAfBhrEe5xPKD0h0ihFplbponJk7Inb0CeUEnWNKvsDGZ57kIzzUIE
         gpPb2UcHD8o8N2b/7wcwME5RVqLPb6qhZfLWDSCK1nP6O9DcfzMtYmqRNoHnCBYaQ4Eo
         Joeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FIfxqFzP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id v33si1187736qtd.339.2020.05.08.08.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 08:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FIfxqFzP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX553-0004P1-Vn
	for alex.bennee@linaro.org; Fri, 08 May 2020 11:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1jX4rK-00007k-P1; Fri, 08 May 2020 11:24:18 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:54592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shannon.zhaosl@gmail.com>)
 id 1jX4rJ-0002dD-Rr; Fri, 08 May 2020 11:24:18 -0400
Received: by mail-pj1-x1044.google.com with SMTP id y6so4417547pjc.4;
 Fri, 08 May 2020 08:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=efdEzAVZoqUilZ5KPe1GctEjRCGzwaERAh49d2ZqPBU=;
 b=FIfxqFzP5dwFKdw/CgVu4lGSf9VJCaiXgfjfbBB60x6ifE0NAdovInYpaqQJQrTYdQ
 LFMr7mMOYjrCXSJy5S/RXIu+658jvBz7iKvIItBWBrWtlDjhAapzRtTB6yD1TIeKtnkr
 deiVa5FMdLvUo/D4NLWRGJEUrc4a5X2v0iCG5YgBIJt9tt+K6a4Y3na42X6keU4gtQ1Q
 XVe9MDm4SV+wuOQBwOarBhg+E4O08oqt233lczilK4HoelQd4bdD95XE9lWBm6fWNzrB
 0pLF8RKfDBUOatJjmKiTfvwd0KObGH+VfY+D9uYByVjfP2Gk1El+sbhmO48NCCCLlTW0
 KsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=efdEzAVZoqUilZ5KPe1GctEjRCGzwaERAh49d2ZqPBU=;
 b=tl5Dj6eaOSjxILrzdrSarY8OcK15oIg4vB7LibmWcEfrW0mNX2AbqeExdkPcI3sqaI
 iAv5s3NqrXqsIwKsCFdXLWCHyl8AWd9MSwX8cIsvAPQXY+nlks9pB+0IefSZhDKDNnBJ
 7Z9dwWDB+brD9x70wx6189Zt5sFdXSXeHsoWLAVYrb3Ga6Wk7VYBpQ8HnEwOB94ybOCg
 NM1mpiqrmgvxjRoCxsDw3SUADy9b8YhyJJVEYTA3wZYaclclQSVdAKGy9Q08x0PN1Owp
 KL2VgGcLnCzIuK6IaWJUhshBfVmx2KD1eLTGk8LpVg3FQMPG8YmseOGFhDiSYyEplASd
 7qhQ==
X-Gm-Message-State: AGi0PuZoetq83KyxUjPYp+c/4tWYBiA9xME8m/+P4T30Eq3VEO+5oAfy
 DWcC0eHAAJ5KNg1Hjdw29Ew=
X-Received: by 2002:a17:902:a981:: with SMTP id
 bh1mr3015317plb.43.1588951455848; 
 Fri, 08 May 2020 08:24:15 -0700 (PDT)
Received: from [192.168.3.36] ([125.121.205.131])
 by smtp.gmail.com with ESMTPSA id mn1sm2585518pjb.24.2020.05.08.08.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 08:24:15 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arm/acpi: Add the TPM2.0 device under the DSDT
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, imammedo@redhat.com, mst@redhat.com
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-4-eric.auger@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <976a1479-4443-da02-2ad8-1e1570742caa@gmail.com>
Date: Fri, 8 May 2020 23:24:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200505144419.29174-4-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=shannon.zhaosl@gmail.com; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, gshan@redhat.com,
 lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0re8vccUalsO

Hi,

On 2020/5/5 22:44, Eric Auger wrote:
> +static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
> +{
> +    hwaddr pbus_base = vms->memmap[VIRT_PLATFORM_BUS].base;
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    MemoryRegion *sbdev_mr;
> +    SysBusDevice *sbdev;
> +    hwaddr tpm_base;
> +
> +    sbdev = (SysBusDevice *)object_dynamic_cast(OBJECT(tpm_find()),
> +                                                TYPE_SYS_BUS_DEVICE);

Does it need to check the tpm version like you do in previous patch?

tpm_get_version(tpm_find()) == TPM_VERSION_2_0

Thanks,
Shannon
