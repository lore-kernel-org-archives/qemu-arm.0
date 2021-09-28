Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4789276lfp;
        Tue, 28 Sep 2021 04:47:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ4mVtpgzgWMOorT1yPgdMAkx5AtMoQINKdrqZRxdOLDo27qPfTM4A3rpzsv5kIdpmg9oY
X-Received: by 2002:aa7:cd41:: with SMTP id v1mr6888756edw.393.1632829627719;
        Tue, 28 Sep 2021 04:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632829627; cv=none;
        d=google.com; s=arc-20160816;
        b=1DEMp4cR+m3f5+nFGiXpGIJ+K8OeZz9nJgF6D25q+Ngyr/cxCs96VCsISC+gwwoMZn
         q+f/Vt2E3ZI0EurSS9j2d7q1HoeWGR+X3rPqGs7kEMfdAK5JcsLfX9FEEHzssoTZFGW3
         yYiWAJuNTi1oaUMDEgneDvJAPU4fqkgP1YMrKE5SfoAFkFF6IkzT9Mpf2FDMkoYcIQ6f
         nu6ObplmQ9ZaCrzr+w7SWmutWi7fo5LeWJaiv1YoY7UmOucxSxmvra/rkC64pN15W9k8
         x/+MIzG5Ivmvzke0jfYUS1z/qAzZEnX2tjiThYXeyddAkuP+pRfhPgsTiixd5OaWKHzE
         04Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JqjCzZ1UEWvXHRaC7ovjrK+5TmN/nFXR7PNO7Ej4Kxk=;
        b=ABh9HMrkppChnewUd+to1foH0Uh9PgB5vr9j2/JV/sr+RsGqqOsUfmMtZF1YAWOO/a
         LOaM+FodBhx7LB1W+WO3ooAqkyVErp9xlN2Ir2DFXxqfOD/lnMSM2/YrCkm1gMXw1I3V
         XBa1FnS0rXL4MttbTYa+P6lDMvE/C6cAsSFpU/C/xFeG0s9NqA4Z0KOGBPVVQ339CZwy
         kmTCcSbu0n6fxdpCtBxcC4j0rOE2hsUtqiWL3qZXjjDf3eZMJ9CBImf2Hrysec28l14t
         z/3s0R9kx1wdYB1ge7bMA+iHPPBUxhJEXfCVOV4hpJ5HB0keHoqd2nC9w1jxmFX7gOxY
         KFAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFr1xnrG;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p14si21854211ejn.419.2021.09.28.04.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Sep 2021 04:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFr1xnrG;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632829626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqjCzZ1UEWvXHRaC7ovjrK+5TmN/nFXR7PNO7Ej4Kxk=;
	b=IFr1xnrGtMcjErHF+wf32zAuEVYfZ4ScYTO3WEpHuGrC0TGh1T1/eHeTDsuP1vXx4kqWLa
	Snu/9x71lJrDJjrjqCyZ1am2w4ULWyXORhbOmkXiA4fs9UCba+47Tf/g/IOtRkgGGvQevB
	kj8LWBwUYAdIlHu94TopUmm7IibC/Rk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-q5VcibzUPFqiJ-6453xqag-1; Tue, 28 Sep 2021 07:47:05 -0400
X-MC-Unique: q5VcibzUPFqiJ-6453xqag-1
Received: by mail-wr1-f70.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4so15025399wrt.9
        for <alex.bennee@linaro.org>; Tue, 28 Sep 2021 04:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JqjCzZ1UEWvXHRaC7ovjrK+5TmN/nFXR7PNO7Ej4Kxk=;
        b=ZSqRwaajikR2Du9QERe9+WEN8Q7UnGC7QQZt+BOsWWc6U7xkkbbWgSsKaL6b54O6h/
         eZFE5292pnGq4Sg2uZy1J2XlmT7La193cbbXiwZ0tcQlj9qEDDYDcl3TouEX5RVK0DeW
         UwMyy6AKz/3iKZ629O27poLocaGTa27KtMxhSVtISg7fDTUrqbIioEWePgyTTbK9w4WM
         9iz+XHZ32XXNQ4O63wAKjZRMDw0EHi1s3zydhLF2BixPAqH14M5LnbjYV48hKeAbo9tl
         nPSdBU0c7hXHGOfnczzbawFW2XVMlaCLVqamN/DA2nJohDBO0H3sLZyPJJPY1Z5gVknj
         ZdpA==
X-Gm-Message-State: AOAM5322t9RzyUMZPqabpqyiRYfUPupmyyeoh75Rzlu7GGXqR2S7Hmvk
	lAsJcx60aUUG6LTuu3AtgoMFhaaLowPiDe6hVw4YEspbTgvVnXbvh4FtxUs4EJahfsoSxz0Lh3N
	j7o+I0vVD/Veq3PCS
X-Received: by 2002:adf:9f45:: with SMTP id f5mr5843440wrg.170.1632829624333;
        Tue, 28 Sep 2021 04:47:04 -0700 (PDT)
X-Received: by 2002:adf:9f45:: with SMTP id f5mr5843388wrg.170.1632829624087;
        Tue, 28 Sep 2021 04:47:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
        by smtp.gmail.com with ESMTPSA id h18sm4284951wrs.75.2021.09.28.04.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 04:47:03 -0700 (PDT)
Message-ID: <5e36f960-7b40-a55b-ddba-1f635a39941a@redhat.com>
Date: Tue, 28 Sep 2021 13:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/29] tcg/module: add tcg-module.[ch] infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier
 <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-riscv@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210831121545.2874233-10-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: nVhH1X78nlTO

On 8/31/21 14:15, Gerd Hoffmann wrote:
> Add TCGModuleOps struct, empty for now, followup patches will fill it.
> This struct has pointers for tcg functions which are called by core
> qemu.
> 
> The struct is initialized (at compile time) with pointers to stub
> functions.  When the tcg module loads it will update the function
> pointers to point to the real functions instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/tcg/tcg-module.h | 8 ++++++++
>  accel/tcg/tcg-module.c   | 5 +++++
>  accel/tcg/meson.build    | 4 ++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 include/tcg/tcg-module.h
>  create mode 100644 accel/tcg/tcg-module.c
> 
> diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
> new file mode 100644
> index 000000000000..7e87aecb2357
> --- /dev/null
> +++ b/include/tcg/tcg-module.h
> @@ -0,0 +1,8 @@
> +#ifndef TCG_MODULE_H
> +#define TCG_MODULE_H
> +
> +struct TCGModuleOps {
> +};
> +extern struct TCGModuleOps tcg;

TCG functions taking a CPUState argument should reside in
CPUClass's AccelCPUClass/TCGCPUOps, not a global struct.
