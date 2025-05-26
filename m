Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3998175njc;
        Sun, 25 May 2025 22:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBCzRNixPcE85cEryD3asbUx9W9e1iWyi1Hxx11JozyOFxVWnxxNwuZCEq31awRaWPDsgn
X-Received: by 2002:a05:6214:5198:b0:6e8:90eb:e591 with SMTP id 6a1803df08f44-6fa9d2b14a5mr130159966d6.24.1748238828893;
        Sun, 25 May 2025 22:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748238828; cv=none;
        d=google.com; s=arc-20240605;
        b=lWDzCRNGricIVeLubND9jTlOS/fK2l21GtRwNsICkbB/6y+TQXd7SVSuxB83rmx7W3
         u/YB1vIcnLvQsCUZESbYyOWhX+APZVPN17yVlSxWh8nwO9rteWXfwLuRJ+saHsuCbF3i
         KInHtE20tbBYRtg+JZ/ZJy4KkAUOnzixxEVh5Piz+pqyH/GLBeZ6VxbnhBzoA0Pruopg
         xIC7GkBB2G/w7kXdmURmwRBKdgEnUsUxVEpcbNo0gnvzSbR6q4Lg53b3J4XGjRJo5Mmy
         f6nx3T5rAzZ2RyTtPzuIAo2EXpcg3axClb7sbnv8jui/VcSNS3nEPZSVTLaErxQ9T0Fn
         bFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HyrblzNbRL7yCY9da3hkCslV/WelzeNIBXzw5f57kVc=;
        fh=QgCdY9cYGrTUoDn+pQGySnMyiLj2vHoPRUE44SjoYSc=;
        b=OsuCF304UlWQ1BRWmbU7F7Ai7NFqMP4HdgzFNhUF48bSmctXMJ+ywRl5RtkSN5ugiD
         xhKk2OmP5nzFa3cZPfNcRQvG+KT19ddOZOhmtUteXKV+0ENnPjhY0Gm9ImmBOgsL6t0Y
         V2ngyGDcL+tNkFJb0lOAFDY1gZRZZh5PzKFUB+pqFMu0aFRZFbROc5aTFr3/ovAfiq+d
         wKciYLZ3jGrp1Rm3bBnbx2H90AVjD1yriH3OXKt9c42vAMcgI3afca6UpnL87FrIxXee
         3K4USWiHIjoeQwYY9nh+GH0o3pT2xDtelBzvvCoRlegAObSRqT+gKuUOW4i1wvcRBJ/T
         Q4dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nx1XmVIO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6faaa08ceaasi17641216d6.329.2025.05.25.22.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:53:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nx1XmVIO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748238828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HyrblzNbRL7yCY9da3hkCslV/WelzeNIBXzw5f57kVc=;
	b=Nx1XmVIOqjo4lnbrWjppR13WeKO3D6wzj6peg/dwfX187IxqiQiUWDPRq4+ur11VIHaLGQ
	nqTSdqIVcsy0pHcCT16DOIAiVCWKnRGTxsI5bjKlV3gtY4RAtg50cbDuiCKj2LhPB2hhfr
	kGgYbKVIsd1B+1bYAhDIi539b47jYl8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-lVi3PMp-NaiLGh0AEAOP-g-1; Mon, 26 May 2025 01:53:47 -0400
X-MC-Unique: lVi3PMp-NaiLGh0AEAOP-g-1
X-Mimecast-MFC-AGG-ID: lVi3PMp-NaiLGh0AEAOP-g_1748238826
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad55a32b7afso105364366b.3
        for <alex.bennee@linaro.org>; Sun, 25 May 2025 22:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748238826; x=1748843626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyrblzNbRL7yCY9da3hkCslV/WelzeNIBXzw5f57kVc=;
        b=QmvM4ge/WkSI+ioRPFCCboFH31xbyI+97eJzCTP4iJfxDgEMsxTzjezIdsgIG/GVHD
         wnFzQresYgsCT2Sc1TAsVLU1XFM4y0JDvCIlELjgsDoAtzHl3U3ZJk/EsrBb97SjLitw
         RU0xP31sbEdn50jcPAk7IvJD+C/rtaNgekj4/twz0uqzNM52/M6zFLuzI1TTMcl8BUsE
         WU/yJtiNwHPI+mF7XT4VN+zUwKEo03VEJ5c20T2o3KbsId6wY8folbDllhhpj2H5jdAR
         icaM25blfHMYD63IFc6R6rIS9WinnL8b2bSw/hIQHgkz0Y4v6yb8fNnHBOrNXXAJHy9T
         VM3g==
X-Gm-Message-State: AOJu0YzkRpX8rFa6AdCExR3/eJFcwwf7JjJ+u9sslHB3ToAU+kK8riwM
	np1yGMvurIvjQEzEYrXRYKl6E7Q86IA4OL9Pd67VlNIDZc0yzbCEhXc7PlaUYbrOZ4ZLTIbh/vH
	XR/YwGCzGLZH6dMf9PvW5pk3DbPLtsiARMMx62FsIW+aUCCELD8oONCKfS5MMRwYBgxP2824AWW
	n96gVJwCtTTyDfIaUqvgadGvAbqLtz80AYDiRAanbH
X-Gm-Gg: ASbGncua3jMsvCXr9VBnRts30tk9SsXdQbf4rwJeq9pykA8j5H6cZMDhf/C00pLZgZb
	UrynwbvroyUW88qJYXPAE47r0b31yFBUhmDBinJgJqnXHCjZ+ebUjNTKGkcW1x7A2SfcDlUBd56
	YAYT9apxPBZrj2quQldDRa6G5Ixe1SV1NE6qVthTyvtp3ALk77Ja/vgFCxY5tqaHB7zYg8yQJyT
	svQNb9HVjEOr5rlH9YWWbIrATgpyz53IS9D3yIMh5wtN2v3rFIdfrUQBte2xk56xzaCT6MLzZWg
	6Yfszxr+Y3exbr+WJK9SrY8rs7OO5LF6mPXvWo7lOnQ=
X-Received: by 2002:a17:906:dc89:b0:ad2:1a60:f83b with SMTP id a640c23a62f3a-ad85b03b69emr714966566b.11.1748238825968;
        Sun, 25 May 2025 22:53:45 -0700 (PDT)
X-Received: by 2002:a17:906:dc89:b0:ad2:1a60:f83b with SMTP id a640c23a62f3a-ad85b03b69emr714964266b.11.1748238825522;
        Sun, 25 May 2025 22:53:45 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-201.web.vodafone.de. [109.42.49.201])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602f33182d8sm2889939a12.7.2025.05.25.22.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 22:53:44 -0700 (PDT)
Message-ID: <168a934b-4659-41cc-beae-3264814636ed@redhat.com>
Date: Mon, 26 May 2025 07:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, eric.auger@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
 <87a57210k3.fsf@draig.linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87a57210k3.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S-ue-ZHsDbK0Surt68p9kH_UybW00CyemyMlkNipxPs_1748238826
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Uv8MxIUI0I/L

On 24/05/2025 17.38, Alex Bennée wrote:
> Gustavo Romero <gustavo.romero@linaro.org> writes:
> 
>> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
>> hot-unplug on arm64.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   MAINTAINERS                                  |  5 ++
>>   tests/functional/meson.build                 |  1 +
>>   tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>>   3 files changed, 80 insertions(+)
>>   create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 23174b4ca7..9ebb768214 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2065,6 +2065,11 @@ S: Supported
>>   F: include/hw/pci/pcie_doe.h
>>   F: hw/pci/pcie_doe.c
>>   
>> +ARM PCI Hotplug
>> +M: Gustavo Romero <gustavo.romero@linaro.org>
>> +S: Supported
>> +F: tests/functional/test_aarch64_hotplug_pci.py
>> +
>>   ACPI/SMBIOS
>>   M: Michael S. Tsirkin <mst@redhat.com>
>>   M: Igor Mammedov <imammedo@redhat.com>
>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>> index 52b4706cfe..2d68840fa2 100644
>> --- a/tests/functional/meson.build
>> +++ b/tests/functional/meson.build
>> @@ -83,6 +83,7 @@ tests_aarch64_system_quick = [
>>   tests_aarch64_system_thorough = [
>>     'aarch64_aspeed_ast2700',
>>     'aarch64_aspeed_ast2700fc',
>> +  'aarch64_hotplug_pci',
>>     'aarch64_imx8mp_evk',
>>     'aarch64_raspi3',
>>     'aarch64_raspi4',
>> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
>> new file mode 100755
>> index 0000000000..fa1bb62c8f
>> --- /dev/null
>> +++ b/tests/functional/test_aarch64_hotplug_pci.py
>> @@ -0,0 +1,74 @@
>> +#!/usr/bin/env python3
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# The test hotplugs a PCI device and checks it on a Linux guest.
>> +#
>> +# Copyright (c) 2025 Linaro Ltd.
>> +#
>> +# Author:
>> +#  Gustavo Romero <gustavo.romero@linaro.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>> +# later.  See the COPYING file in the top-level directory.
>> +
>> +from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
>> +from qemu_test import BUILD_DIR
>> +
>> +class HotplugPCI(LinuxKernelTest):
>> +
>> +    ASSET_KERNEL = Asset(
>> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>> +         'current/images/netboot/debian-installer/arm64/linux'),
>> +        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
>> +
>> +    ASSET_INITRD = Asset(
>> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>> +         'current/images/netboot/debian-installer/arm64/initrd.gz'),
>> +
>> '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
> 
> Hmm do we need to specify a checksum type now?

Yes. The whole cache management of the functional tests relies on the 
checksums, and we certainly don't want to have surprise effects in the tests 
if the assets change without us noticing.

> In fact could we use the existing tuxrun images instead of relying on
> debian stable not changing?

There seems also to be another image with "20230607" instead of "current" in 
the URL, maybe that one is a better fit?

  Thomas
