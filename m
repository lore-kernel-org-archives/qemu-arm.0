Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1448678ejn;
        Fri, 28 Oct 2022 10:57:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5u6CD3QJXf+NdDF+UDQhIxSoebFwxPii48H3UoQPUjfVFykI3WqjI13Nnp4uRrEX9A02t7
X-Received: by 2002:a05:6902:124f:b0:66e:e3da:487e with SMTP id t15-20020a056902124f00b0066ee3da487emr487155ybu.310.1666979849175;
        Fri, 28 Oct 2022 10:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666979849; cv=none;
        d=google.com; s=arc-20160816;
        b=Pk90g7XWIVgnvo8+GK1nfK5LbP1PYtGevkvkiX+6/67wV/d7fNSa9wVlFF7hAxMla7
         tTlG7DaScigwC8mpnjFYFHaOG3tlZykWG2fwjnsqqblaD1VuBLm+HmKTTnJ5kekvfHCU
         H835xuN0Z1Ilje6l2znl37laJHnLfMoVzqAFi7ElAsjhVHMMaROMb00HVXN+F68yspU6
         bP0uXUUiIFt1iCLSQn7CYSA2lREc3kDfGEMK3DyTLAWss1CmYJUF3ZmcJqhvf0jOly9U
         Cx7hliK8xVawdn32SJQETIA0q/FTmGNHNnqme9NE8OM2orxJQUms1Hm9lb8lud6LcWzz
         8d1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c1XmoAUQj3+jFBnGeB4GeekYFOj+FFZJbONcyLLcspQ=;
        b=zuRIjIgJidHjlT65oYNc3SfD8X06QGT7OseN0R8E6k3OHLtMvrvX4t31mw4UZWqgdg
         HCBhsXaRoTqqvAuOwsPbRwwv9Q1NxfXbCQKUfoVAbLJk/YZ3P0t3xQowto2tYiJ0pg36
         tMb1QXH8x5Jf+3HGgY+JXMG6/yAnkiB6yn57VPqeDinl1AuYZj0VM4sajCFuFHEOrFcP
         J1MoPwae7laqkgTx3RQtKetpkyv8WvS98HLh+Uwei4x08YThm7bQhtmf0WsGHB7SRihw
         f+2mSydoFlaFF4yAzSvJLZzUYluEOuZpBqFV7wQpqkxnjQOgabJ467vo2U8GDC6ZLkLm
         NTsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=BzQ6U+EN;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id 195-20020a2505cc000000b006cb3ae32703si4735618ybf.345.2022.10.28.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=BzQ6U+EN;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=c1XmoAUQj3+jFBnGeB4GeekYFOj+FFZJbONcyLLcspQ=; b=BzQ6U+EN8+ZxedMiAIZIhXOoNY
	ypgoCymcrhksfp5EFZ3UecTWgkETbMjmTzKTr7mkiqEauLe5Yk1vpqx2k9umGEhlflMubWBY0/B+i
	XW5Vq8O/9+RDC1N7oThhM/gD6iMQ4kgVLMqfw4BM/bZXnVFz3debQC/D+lKu395+fVxs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1ooTbj-0000BI-LD; Fri, 28 Oct 2022 17:57:27 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.25.146])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1ooTbj-0007GZ-Do; Fri, 28 Oct 2022 17:57:27 +0000
Message-ID: <7da20a2e-81e0-b3ad-c2d6-6012fa7edee2@xen.org>
Date: Fri, 28 Oct 2022 18:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com> <87wn8l3d3r.fsf@linaro.org>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <87wn8l3d3r.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: PV4jlEfXGxzM

Hi,

On 27/10/2022 09:02, Alex Bennée wrote:
> 
> Vikram Garhwal <vikram.garhwal@amd.com> writes:
> 
> <snip>
>> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, adds a
>> TPM emulator and connects to swtpm running on host machine via chardev socket
>> and support TPM functionalities for a guest domain.
>>
>> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>>      -chardev socket,id=chrtpm,path=/tmp/myvtpm2/swtpm-sock \
>>      -tpmdev emulator,id=tpm0,chardev=chrtpm \
>>
>> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpms and
>> provides access to TPM functionality over socket, chardev and CUSE interface.
>> Github repo: https://github.com/stefanberger/swtpm
>> Example for starting swtpm on host machine:
>>      mkdir /tmp/vtpm2
>>      swtpm socket --tpmstate dir=/tmp/vtpm2 \
>>      --ctrl type=unixio,path=/tmp/vtpm2/swtpm-sock &
> 
> <snip>
>> +static void xen_enable_tpm(void)
>> +{
>> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
>> +#ifdef CONFIG_TPM
>> +    Error *errp = NULL;
>> +    DeviceState *dev;
>> +    SysBusDevice *busdev;
>> +
>> +    TPMBackend *be = qemu_find_tpm_be("tpm0");
>> +    if (be == NULL) {
>> +        DPRINTF("Couldn't fine the backend for tpm0\n");
>> +        return;
>> +    }
>> +    dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
>> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
>> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
>> +    busdev = SYS_BUS_DEVICE(dev);
>> +    sysbus_realize_and_unref(busdev, &error_fatal);
>> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
> 
> I'm not sure what has gone wrong here but I'm getting:
> 
>    ../../hw/arm/xen_arm.c: In function ‘xen_enable_tpm’:
>    ../../hw/arm/xen_arm.c:120:32: error: ‘GUEST_TPM_BASE’ undeclared (first use in this function); did you mean ‘GUEST_RAM_BASE’?
>      120 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
>          |                                ^~~~~~~~~~~~~~
>          |                                GUEST_RAM_BASE
>    ../../hw/arm/xen_arm.c:120:32: note: each undeclared identifier is reported only once for each function it appears in
> 
> In my cross build:
> 
>    # Configured with: '../../configure' '--disable-docs' '--target-list=aarch64-softmmu' '--disable-kvm' '--enable-xen' '--disable-opengl' '--disable-libudev' '--enable-tpm' '--disable-xen-pci-passthrough' '--cross-prefix=aarch64-linux-gnu-' '--skip-meson'
> 
> which makes me wonder if this is a configure failure or a confusion
> about being able to have host swtpm implementations during emulation but
> needing target tpm for Xen?

I was also wondering where is that value come from. Note that the 
memory/IRQ layout exposed to the guest is not stable.

Are we expecting the user to rebuild QEMU for every Xen versions (or 
possibly every guest if we ever allow dynamic layout in Xen)?

Cheers,

-- 
Julien Grall
