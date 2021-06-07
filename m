Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3475434lfa;
        Mon, 7 Jun 2021 06:07:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydQgeuI47+S+F+pLkRGdit8WUw4M1BNpx6/Dzxaa6wO6Wi76Q2giHarn+GBHQcbx3k7wzX
X-Received: by 2002:a17:907:948f:: with SMTP id dm15mr14448744ejc.476.1623071268247;
        Mon, 07 Jun 2021 06:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623071268; cv=none;
        d=google.com; s=arc-20160816;
        b=qL57LdtfrHbGxX66UBvCkJnp/lt8UQsNeQF07iy7m9BH5PaYIKIw7CKPB8th6NCSUH
         /fYyfyjrMnwF/JyIzcHBU+3ljFUEV4ftO5RC7pSu0sG/XI50pHV5IIqC1ipHKFvnmigt
         +eZqCZ/QxhnSJiQD1u/GN8F2AtPnlUtv3TnSKRMj+vNGG/eHMD8WL8CpJWtaOiS2U1gk
         Inf8l0361uiGlDzs6d0keZEedrDPhSDqqIkKJ+nb5rTIXIv4p9S83JJtgP1NmzRIN2AQ
         a9YhlFLmWE9OB7oSbwHrupqDqwfu9mIVRbPQRLN4pztgKVyPvmXbLMSAJO0ly7p5+EVP
         vxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=BOQN2e4mcLDUJ+FFgwXMgyNzY8zHjv4RlqJIYxabbfY=;
        b=WMVC9N4kgN4V4IE88ipIUTuvyoykxn5nOyNOsG4BVmv8PH2QfSWPM7fBABdvRslYtn
         fec9Ny6WAuR+DU6OTiQi1FsVt5YTiYg1odNEcBb9NqbkQUQ5162xab6o2SlJqlIN84Tg
         IdodCAtdjUKSkXdANqgIDjC2tpU6gwPGuOPzkmhonZ0X/cgosigRX3PmHtHxFNtplu1a
         wF22gWXPOukpHDHrJF5JK2TLV0ua+8yhe7tODTPZGOE5ahl/RUT+FCVOfXRXkMxb+Rvz
         wDSpKtmVPaa+c13+FrtVXPnI+zNXM3UTs7OnLQoxgoMJ/hlNnBOsZNIJDzDoLHY4kjrP
         lzYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpSKSvdc;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id jg15si12242300ejc.143.2021.06.07.06.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EpSKSvdc;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623071267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOQN2e4mcLDUJ+FFgwXMgyNzY8zHjv4RlqJIYxabbfY=;
	b=EpSKSvdcVHzKAoX5W3hS/Ho9tXNC4+msvR0u1t20gltS1F41UiN/gV/wGhbk0GOp2SmDoN
	1XqtsmUMGA/Bn4yTu9/nZyZrsW/Ae+tOgMOtnspA8WVSVfWuhLYXG1u2qxAZ749Yn3IYom
	UQn60hO5/jLwr8SiIlwyBwmWJZ36Abw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-QcrY5YlnMreL3IBD8NUhNQ-1; Mon, 07 Jun 2021 09:07:45 -0400
X-MC-Unique: QcrY5YlnMreL3IBD8NUhNQ-1
Received: by mail-wr1-f70.google.com with SMTP id m27-20020a056000025bb0290114d19822edso7829648wrz.21
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BOQN2e4mcLDUJ+FFgwXMgyNzY8zHjv4RlqJIYxabbfY=;
        b=n1oDyJQomslzoJwP07F48+wjSjn/iHy+MjJHHnQrRS+OWBXEDVj4Tuj72Z7fEUw+gN
         xutPSi2MDUxkNe5qAcBVizoByYnCKprS3FhhXQHb7iW4KMshAmlJ85w82wROhOhGlY5f
         ljkTJkehmD982GfrZZ6xuxWQFfeKjk+t6RHkBE/Cv4hB9M7CunoMtPYc1UimSPRQ+umN
         6kW5lPWZOn2WqrWg1PACgjix5IEEX3TZOWFEnCcwqvMw4vzshyxevHmm65AWISbV29c3
         L2umJduQaMH6TTlM/PuD0QWQFvY+o7PTxypUYNUwkENOUtyNe9qIO+ug9EkADtU9gHZu
         QOlw==
X-Gm-Message-State: AOAM5323FyVCVilK/xnY9hcjJn5wQ77EeE1xqRnGwK4NGnE0ZNOSi7/j
	I/tLI3wiMFyfrSLArsjagZKZnpJ7S223zVAbRKf15YM9x4GEm9NKFEgtflg0PvlpSCRbucqatv1
	aNNbpLl9F59/YOc1x
X-Received: by 2002:a1c:2384:: with SMTP id j126mr16631522wmj.59.1623071264776;
        Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
X-Received: by 2002:a1c:2384:: with SMTP id j126mr16631497wmj.59.1623071264579;
        Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de. [217.87.83.110])
        by smtp.gmail.com with ESMTPSA id v17sm7192977wrp.36.2021.06.07.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:07:44 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 02/99] accel: Introduce 'query-accels' QMP command
Message-ID: <14b256ef-4fc2-302c-45b1-295c26aa76ce@redhat.com>
Date: Mon, 7 Jun 2021 15:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: skYlMi/4Ej4p

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
> 
> - Accelerator is a QAPI enum of all existing accelerators,
> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>    specific information. Currently the common structure base
>    provides the name of the accelerator, while the specific
>    part is empty, but each accelerator can expand it.
> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>      { "execute": "query-accels" }
>      {
>          "return": [
>              {
>                  "name": "qtest"
>              },
>              {
>                  "name": "kvm"
>              }
>          ]
>      }
> 
> Note that we can't make the enum values or union branches conditional
> because of target-specific poisoning of accelerator definitions.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-3-philmd@redhat.com>
> ---
[...]
> +static const bool accel_builtin_list[ACCELERATOR__MAX] = {
> +    [ACCELERATOR_QTEST] = true,
> +#ifdef CONFIG_TCG
> +    [ACCELERATOR_TCG] = true,
> +#endif
> +#ifdef CONFIG_KVM
> +    [ACCELERATOR_KVM] = true,
> +#endif
> +#ifdef CONFIG_HAX
> +    [ACCELERATOR_HAX] = true,
> +#endif
> +#ifdef CONFIG_HVF
> +    [ACCELERATOR_HVF] = true,
> +#endif
> +#ifdef CONFIG_WHPX
> +    [ACCELERATOR_WHPX] = true,
> +#endif
> +#ifdef CONFIG_XEN_BACKEND
> +    [ACCELERATOR_XEN] = true,
> +#endif

Nit: Use alphabetical order here, too, just like you did in the enum?

Apart from that:
Reviewed-by: Thomas Huth <thuth@redhat.com>
