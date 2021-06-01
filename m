Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3500649lfm;
        Tue, 1 Jun 2021 03:48:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLWs9df1R0E0Jmbo5CiFPQumspmisPWYRPoOxA6yqiCOucy42CESkI1qL7O+UubemeyGA9
X-Received: by 2002:a17:906:c0c9:: with SMTP id bn9mr28906430ejb.7.1622544504743;
        Tue, 01 Jun 2021 03:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622544504; cv=none;
        d=google.com; s=arc-20160816;
        b=0l6Xbrh/SbvxVKb+pSwhV0Sbk9Ed9S9QtiJ/MdhVtgvKNFJuve5+E0pJloKWcTX9Gg
         nb0xYvOOKJ+xbVG2c7t1Mhx/ZYnf2clXX/DiUzmqpXmyW4FW7foHo1EnNZSKccp01Ehx
         aIbUQBiL03QnyEvk2T4XQPeHuVTeo8D0i2Srkzr2V0Sb8bYpg4jjpPl4UF7D0QXtS3sY
         gHz0wdKtt7KKgn0bR0toWsSCwulOLK4V/tnaHpHNw2+3F24Go7sYlfa5aNhK2ywmCErT
         dMi5xFoT2LcnvelyPP14wvV2K7MT7mH4Tfm2637hSBWSbhUK7gNozk9RjaxqRsK39G1B
         i+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=3Ic4NWOLQ0tnymafCtBcrjzUOFMCWmOrls8If2U4umc=;
        b=aGRdREAdouN1o/6Jh5LJ4h8Xl4/CdRbSlfOinJb5M/KiQYbKXZIpyNHAO4RpkuX0Lu
         rUlgbCUewHq8j0lnsnhzM9YWszviqJyt8HsJ4Xj15BIYrfS5qjx+AdgICokFQ5fgW3gG
         0UKPZjQnijYmjpu6oPjSUpfbovFam7faT9dJi+1CfQE9WnIUw8uk/zNP7lja/DYGHNjg
         2xiGqASJc3+hW0GIqVVFcMQGaM6NlAaI5Qzu93nzVaRpASUKEdEIhCGCgoeTzNupv/2y
         ep+f/W5jSSYH0tJ3SxGuh65bv5+m0xaCjB08kOVJQ9ODUfaW+8SQcXR92OwYZmB2JzRV
         DIEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNnoPGVB;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r9si15122658ejr.730.2021.06.01.03.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 03:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNnoPGVB;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622544503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Ic4NWOLQ0tnymafCtBcrjzUOFMCWmOrls8If2U4umc=;
	b=DNnoPGVBChiQLCershIu6SuM8YdkMSJ3U13QNvUWJ4DkXZp4ZwGIlaP8fw8H0cazOR38Pc
	g/9KAzHQmex1BiQrnyEcImiv3MnXnGG6p59N6dsqQi+02fzkPJbAM4LWudiPMufpGRLftM
	D+S8n5zRYVmq8bHUm7AQRVs0GN6cngc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-LlEZfbN_ONCyJmHhL90cGQ-1; Tue, 01 Jun 2021 06:48:22 -0400
X-MC-Unique: LlEZfbN_ONCyJmHhL90cGQ-1
Received: by mail-ed1-f71.google.com with SMTP id i3-20020aa7dd030000b029038ce772ffe4so7635725edv.12
        for <alex.bennee@linaro.org>; Tue, 01 Jun 2021 03:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Ic4NWOLQ0tnymafCtBcrjzUOFMCWmOrls8If2U4umc=;
        b=MeMgz9p9MrgM5K/UgftYKchNPjJr5Dzre2QVI/OH39sN20mx9pLpeO1sAGPuyOooYM
         +T2Bgmfj3UMG1R9tpZm6W9RRVAtCi1owoB1xUEnHTTIWk1tD1FsSb8zUDUj6gGb+X+9o
         QjOLnZt/weF9Da/5ken/Mc3J899SL0OjwohOSLjU7wrSg+b+IIA5rHuTzsgqBhEmZM1X
         trn2mb155b3Qwub1fkl2Mtibr8wGNVEZH3ScYegpdmCaQkr8d6BGdiUMZvnbmFIsFFcz
         8P4dv54AwfIwTGpBx2FThndEXi8hAQL1rsmDkhfAhDlsgHfbIBnlDG6Qs2rZBOLF8uzy
         k3/A==
X-Gm-Message-State: AOAM530LWCgCRAGxb122CP+Afcag3BqzXEB5uzz2epQHfK+uvz/SWRaW
	XuV+yO/041aeJtAbpdaPKHi48LAKcqpDr94P/g4NxtJzeyNUfuzGk7u3AxrHoYqefG3ff6Q6ndG
	cPti6RYxXYhoIseIU
X-Received: by 2002:a05:6402:883:: with SMTP id e3mr31426983edy.1.1622544500983;
        Tue, 01 Jun 2021 03:48:20 -0700 (PDT)
X-Received: by 2002:a05:6402:883:: with SMTP id e3mr31426971edy.1.1622544500833;
        Tue, 01 Jun 2021 03:48:20 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id r1sm6653071edp.90.2021.06.01.03.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 03:48:20 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: allow the overriding of default-config in
 the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, f4bug@amsat.org
References: <20210528163116.31902-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5313539f-c41a-3dda-cb51-5dbc0443dd61@redhat.com>
Date: Tue, 1 Jun 2021 12:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210528163116.31902-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yaxh8j9aLMgo

On 28/05/21 18:31, Alex Bennée wrote:
> +  --with-devices-*[!a-zA-Z0-9_-]*=*) error_exit "Passed bad --with-devices-cc-FOO option"

Extra "cc".

Looks pretty good otherwise, possible tweaks include:

1) check that the architecture exists (i.e. that it there is a valid 
softmmu target named after it)

2) checking that the file exists using "test -f".

> diff --git a/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak

Not sure if you want to include this file or it's just an example; if 
you do, you probably should either remove the directory or call it 
64bit-only.mak, without including aarch64-softmmu twice.

Paolo

> index 0000000000..3626de9e3c
> --- /dev/null
> +++ b/configs/aarch64-softmmu/aarch64-softmmu-64bit-only.mak
> @@ -0,0 +1,10 @@
> +#
> +# A version of the config that only supports 64bits and their devices.
> +# This doesn't quite eliminate all 32 bit devices as some boards like
> +# "virt" support both.
> +#
> +
> +CONFIG_ARM_VIRT=y
> +CONFIG_XLNX_ZYNQMP_ARM=y
> +CONFIG_XLNX_VERSAL=y
> +CONFIG_SBSA_REF=y
> diff --git a/meson.build b/meson.build
> index 3f065f53f2..656ebde513 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1350,9 +1350,10 @@ foreach target : target_dirs
>                                                  configuration: config_target_data)}
>   
>     if target.endswith('-softmmu')
> +    config_input = meson.get_external_property(target, 'default-configs/devices' / target + '.mak')
>       config_devices_mak = target + '-config-devices.mak'
>       config_devices_mak = configure_file(
> -      input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
> +      input: [config_input, 'Kconfig'],
>         output: config_devices_mak,
>         depfile: config_devices_mak + '.d',
>         capture: true,
> 
