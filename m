Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp970201ejc;
        Fri, 20 Jan 2023 02:19:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNsguwm4euvNyM+0M24wZs1jnOTQXf8g8B9DFQxYo8zkkFiU0ttO9t+TDiuxYbv/gUZxdw
X-Received: by 2002:a81:950:0:b0:4e0:a722:3eba with SMTP id 77-20020a810950000000b004e0a7223ebamr10727594ywj.21.1674209966002;
        Fri, 20 Jan 2023 02:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674209965; cv=none;
        d=google.com; s=arc-20160816;
        b=vY0Ens32K4MX4Bd1Won3el6QHEnycN5PZe+x0X/l+jpDbE35kL5rD/baveuNLq4whZ
         kWNIhGSWZfnBY6omUZNySWIfcDM7KHw6GuqVzKhKpIEjJxnJmsc32dISdmd2pYlRJtr1
         0ltAGvxfPjh9EmtvqMfF7z9eXmNFFTyN2gwnItOGD8bq3cxUj/Ip+T8Axh46x18tBC41
         IFszXyluyOuAAJYMBNY6SiqAf8dFqYmVzn+/4/3eW9giUS6UmPmjSLEpav07/wmMjJxw
         ooFtEnVRIPsliZVLn71aJUtP6iktSZannBv0xbgfyFxXSgmsbD12hzpAUVMZUQlEVPF0
         0wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ePz7yb+ojbQCubOzDz2TJWD5Tn+FWaHHy1W4HDqqSTM=;
        b=T325zZ5l0ypT5Hq7rjlAdxFKNjHmH+0R3YPaEmcIz/pZev10nhVWCf52RAgsqbJwJ8
         MbkRJ+sSaleMtSQPTcWMwqR5zYVEPyCiIHnXf7CecgjVmgwJ2zgG+BIDCv/VflN6G7UR
         +FmPM1WUP1oDoQ87sgy5uAI6VlV0YEKj2XnsdoLD+ST5vF/R/V5PsYrnU4tewHUvnoTB
         rzg0NhNeJdJgARmCvgbJgt8OEvUqEoKpBG3avpsasFN88RWzGD7R81ZR2mRqVsVRR4gA
         rebW/sHGegSZ5cuQb4ltkcUrSxDu2SyaaroQh8v1biesgxMvZh997QszN5MFr6WOIiNg
         2eZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VW8jf2OP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id l64-20020a812543000000b004f5c4380bf1si7246386ywl.379.2023.01.20.02.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:19:25 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VW8jf2OP;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674209965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ePz7yb+ojbQCubOzDz2TJWD5Tn+FWaHHy1W4HDqqSTM=;
	b=VW8jf2OPaTg0oL8bHaEPVMmD4O2vKlCGOtYUkvhkIy26cA+b3/3Lp4y9cKgNkUWu+ISORH
	+XT+1W6+rpi0TdjTNfbTq3chuawsDHiJPn/SEg1Cpe7uBMYpyzGeChpgI+d3PW3ZZ+vWAG
	LGinv6kiWkrdoDw7ZuNa+1ItNXgUpP0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-gND_qT5hM-CvDwGHXU4eBw-1; Fri, 20 Jan 2023 05:19:21 -0500
X-MC-Unique: gND_qT5hM-CvDwGHXU4eBw-1
Received: by mail-qk1-f200.google.com with SMTP id bj28-20020a05620a191c00b007068d8b5051so3180113qkb.14
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 02:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePz7yb+ojbQCubOzDz2TJWD5Tn+FWaHHy1W4HDqqSTM=;
        b=K+q6qGzrOvD5vP4r4yXSHTu75CY6EFYExkRcRul/7lBMmDpQEgcmCn3Aeh0Jfyq/d/
         /3VUJ5cl0NI8CHj6qZns8jBnDMyhb+g1hScR/BKuuroJCfHTvnyM0S9l17Wu/XK9Jzyl
         a5MOU7WRl3UUKkiP0JEHAezYeNj13KtR47fZNUKW4eEdclqdw8dAX3D9JkxCFNDVJocn
         wB7wey+Nyt9uBFXUTxvrUvnG6QgHMYrJeBiHYqrXoQIJvZT5fq37vdF4/3Y/dVzgmTa8
         wcR1fZZRaB7GLMWmSc7twoU2afnJZcgVNGMhCbGFyLxuTosrcSV59KeKOhYSuxsS99qQ
         AQJg==
X-Gm-Message-State: AFqh2koGRt8CQ/hOARoF3LZpiFYw/2rPbvKAao2NYwJR4T7Y4swDm1qV
	GmtbKxzLCe4t8a7y+KxdPGaOsUqTFdJFMiQPt5NVmht62+2w+j+KJq5eYRvb3vbHZj336Z9lu3N
	CuvTOiWgCEwahdPP0
X-Received: by 2002:ad4:4c4d:0:b0:536:ba5e:6ac0 with SMTP id cs13-20020ad44c4d000000b00536ba5e6ac0mr1013357qvb.40.1674209961448;
        Fri, 20 Jan 2023 02:19:21 -0800 (PST)
X-Received: by 2002:ad4:4c4d:0:b0:536:ba5e:6ac0 with SMTP id cs13-20020ad44c4d000000b00536ba5e6ac0mr1013338qvb.40.1674209961240;
        Fri, 20 Jan 2023 02:19:21 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id w22-20020a05620a149600b007090bb886a2sm1650203qkj.118.2023.01.20.02.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:19:19 -0800 (PST)
Message-ID: <a7701410-a612-d9d5-1a66-d71adeadf2b5@redhat.com>
Date: Fri, 20 Jan 2023 11:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 05/15] tests/qtest: Restrict
 tpm-tis-devices-{swtpm}-test to CONFIG_TCG
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-6-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: f2j6bytEcGgl

On 19/01/2023 14.54, Fabiano Rosas wrote:
> These tests set -accel tcg, so restrict them to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 1af63f8bd2..9dd5c2de6e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -204,8 +204,8 @@ qtests_arm = \
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
>     (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
> +  (config_all_devices.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?   \
> +    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>     ['arm-cpu-features',
> @@ -295,11 +295,15 @@ qtests = {
>     'tpm-crb-test': [io, tpmemu_files],
>     'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>   }
>   
> +if config_all_devices.has_key('CONFIG_TCG')
> +   qtests += { 'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> +               'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'], }
> +endif

Hmmm, I think the second hunk is maybe not necessary - it's just for 
declaring the dependencies, but not for adding the tests to the set that is 
run later.

  Thomas

