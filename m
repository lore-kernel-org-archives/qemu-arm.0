Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp967612ejc;
        Fri, 20 Jan 2023 02:14:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsr3JnL3tytCt+j8v9/YbzmdBLuKuLUE7hja+X4Z1wIsW1UURsfbWo6Alm0f/9tqiOAtxN6
X-Received: by 2002:a25:1682:0:b0:7fe:9e7a:acd with SMTP id 124-20020a251682000000b007fe9e7a0acdmr2921431ybw.47.1674209649657;
        Fri, 20 Jan 2023 02:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674209649; cv=none;
        d=google.com; s=arc-20160816;
        b=CWLVt7iDM4cVqTWud1IHtoK2/vLLPD1I1Ew/hrUny7WzneB2KEcP7QWnvb+lZtpgFA
         3/suRvrPTbMi2MnvchuRgkDV9+ZJyvd36CZPgI4MM72FURrbnKRQAA8N9pR05TD3iT+u
         wBEYuQUi62JgZHoNkuC/Rf8mqdLNA6/KOJedqfKIKOLCMrM4hB8ojLlhWMdVbnGTUBeF
         2wfgijP9p52Vo1UzfnNlHzmkSmR78ZKoFQ50T15hl79aVATxFrZwLmqjAAVjO0YEsXrW
         geJm11XFSxB2/+iSteZ5uOG5DWVI4GEQIjKSf87fGJLr6RwGHRgYjF0Gfxc1TzujdI/X
         B7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ganEYfTx0epMSRmvc27vudc0WF68SCSzWUuncl3k3Ew=;
        b=j1DyEm5MtU6cOAvxTs3nWh66eXtcbcXU/K8X/JJ80kd2PUFKSVfuG/sjBxy+3qYy7h
         RvaIGP6A4wDnx1TSREnxp6lgI/bkVBV7TOEkVAyzdNrMyPwluOkOHic9EC8GRVYvkk+R
         P81CRoeiuZdh+fwoEXh8xWoQR6GtnbNph1S67HU2sPlopzo2OLaYfCLa3F+ZMkRomjXS
         AcK44xV5SUn1VvdS1F5ODofTajQj7EqJ/HezwlYrWPPOj0CXa2K/bH262N6RM/UYKT25
         1hoNLJdktLYnbh8WDpCSugQIRYMAY3NedukME0ekfmI9nKrpAVr7nQYdHSkM/dSCryB8
         9rfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="h40i/S5c";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f5-20020a256a05000000b006b9af34c3d7si35664071ybc.505.2023.01.20.02.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="h40i/S5c";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674209649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ganEYfTx0epMSRmvc27vudc0WF68SCSzWUuncl3k3Ew=;
	b=h40i/S5cdjVKptBHjSQazLtE7zBny2PP4y8MRMZ+NmWnraY7t9Q2LrWPrVB4LVzad+MrPw
	+pLrKa5MzZI6ObRpLL0Wcgyoj4lsEhPgNdW8O0ksjdY5vCr7Wd0ciahtHia1PdgTuhUYK8
	KkLHAj3WV9UTg0tqUOzSxZSsus2kDkU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-451--T041Y7IOg6aqhJw8PZadg-1; Fri, 20 Jan 2023 05:14:05 -0500
X-MC-Unique: -T041Y7IOg6aqhJw8PZadg-1
Received: by mail-qk1-f197.google.com with SMTP id s7-20020a05620a0bc700b006e08208eb31so3164511qki.3
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 02:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ganEYfTx0epMSRmvc27vudc0WF68SCSzWUuncl3k3Ew=;
        b=idWLYfRRNlps6ieiivTVTMk+tRZYQFt+qAg86qsb9y/0E8e1mGfqBlaKsRG6FrqfAu
         3oR1ExQk72/x74LzZwwQIOur26et9jF8jQ7vhUQIMYfos2OGGHQjn0pzIbyp0D5O/QO/
         p3jCgTUS0S9z41eCPdaV8eQAyHpNLQbtHrkR8bS+dszXO2RXNcyQhpW/+kdXht4z0ZYU
         dD4uPL8j8nZxgK8bvWvHVmCyJLegfJBtD4Awhktl8VzxBK4O+G+mFaPpOp8BG1z1C8GF
         5M1QYFPKchN9Y2RqdyXewhDGz/SiD2OKEILISkLr2zrJjOmo1hVtNBpRdbuzZcMbJjmy
         /s+A==
X-Gm-Message-State: AFqh2kqGeaSfAZ6I8MyZeBLnnO3kt3JjEm8KYDUdeW67/GhszVAjQXmq
	oC3n6S8hDM+GX4zB2HVn0QRfD2AT9RwTbEHT8c4PkDHe/g1A4YFuKQh5LWn81A9iBO2Jps0dl7T
	3sv8CcYfEo0hGFKnp
X-Received: by 2002:a0c:c3ce:0:b0:532:23a5:8271 with SMTP id p14-20020a0cc3ce000000b0053223a58271mr20514554qvi.8.1674209645350;
        Fri, 20 Jan 2023 02:14:05 -0800 (PST)
X-Received: by 2002:a0c:c3ce:0:b0:532:23a5:8271 with SMTP id p14-20020a0cc3ce000000b0053223a58271mr20514534qvi.8.1674209645129;
        Fri, 20 Jan 2023 02:14:05 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05620a319a00b00706a1551408sm6386423qkb.4.2023.01.20.02.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 02:14:04 -0800 (PST)
Message-ID: <295984f3-1086-1b25-b378-6a1c9c6bf258@redhat.com>
Date: Fri, 20 Jan 2023 11:14:01 +0100
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
X-TUID: BQ5EAGmT3PLI

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
> +
> +
>   gvnc = dependency('gvnc-1.0', required: false)
>   if gvnc.found()
>     qtests += {'vnc-display-test': [gvnc]}

Reviewed-by: Thomas Huth <thuth@redhat.com>
