Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp427837nji;
        Thu, 12 Sep 2024 01:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHHTi9pqa72lraMlC5Na4ZeXIEeHIVdKndrm9P6lcM0tg5Y5Igc7xjJ4HEBd4u2pGQOcsg1NKHbfRYJg==@linaro.org
X-Google-Smtp-Source: AGHT+IH2f/PNuwZKL+t3+2gSvDyhX9EV+7XRo+x1SL2GvgwTgJ3KeJ9U6oXGnAJybyRjH+uKxddm
X-Received: by 2002:a05:622a:86:b0:458:3be2:d2d6 with SMTP id d75a77b69052e-458603ca3c4mr30917831cf.47.1726128163187;
        Thu, 12 Sep 2024 01:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726128163; cv=none;
        d=google.com; s=arc-20240605;
        b=H1nz5J/ln9bHIx72VutIl7XiOdijAlVzFLVihjDMeKaFIWFJn7offF5X1FYTEMC+uJ
         JdJIJm6SM6kXOxGQAdOGiXAah4S5qXgtrF03xPPXesa7PuYT0scdRguofmr+SrIvUjpK
         P3NxKxRxsLhzufpJPAF2Nfrz0hhJdUYWqzVLOvtYH9aP9RIdsa/bacw2la7NFujeUrCN
         6tfvafDjEa/u5V8vVCHVzck7Qbr1PB77mbR+EakZa7NjYSaIUWf1tLn0LNB8wzQvg2Hq
         8Fv2bqhHQNZysYwxc46bYHYsJxZXSmp7KcW280tb8H9XXcSf4r5xiLDyrCMkMs2AJBHu
         YZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZJCCBAsy1yjL6s99J+14imn5GBc215lIAHWntNhCiQ4=;
        fh=Sc3m3l0MTpjfkYSaXfL7OUDV0fYFGgThu/ksgbbFptY=;
        b=jwMex66rInqiN19J1SFOzygVxGOCY6WwnV/J3C1xZOeQLHemgkG1rqSjiYUbxqsWUk
         QkIVajJvprEGmp3bOaML1EhOxSIRTgTcpDkL7/m3mYmGBddZIiomU0Ff6YDYu2iPOy0k
         iynR7fmRu8rXjqpLscawukQ8p0XQBxynafUz+Zr7lfXChdn0rQikp/b0/NisvsWINK68
         OhtHjund6IliNi7pVWZkLGTlIXH5XNx+zeDNq68XMTVoTlYyYrOt7brBxg/ZfZcEVczq
         JbglzpbfGi4tprosYhr4G5jVoHhMYYVMWwacKzVi6J8R1rrNIi9+EOGseKLeuo4teyoS
         9S0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xvz3KKJV;
       spf=pass (google.com: domain of clegoate@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clegoate@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clegoate@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-45831ee72b0si46332981cf.42.2024.09.12.01.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of clegoate@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xvz3KKJV;
       spf=pass (google.com: domain of clegoate@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clegoate@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726128162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJCCBAsy1yjL6s99J+14imn5GBc215lIAHWntNhCiQ4=;
	b=Xvz3KKJVrI8WNOY4v8x82Vkhg6GPmQQBDdgqhG82L2PZryERWjTwNzM6WdXsEezKEs3Kf3
	ekylSZMElzT+0mBgCMOH7y7WKQuDbLWupEMHgiJ/BXrfUyC0iSwy/0ZpxqQPlMNFV4B5QG
	YSQqF8FAOC/WvT9DUmNt/gd5H8NBLNU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ABLkzuPLPG-zrec0_TjFeA-1; Thu, 12 Sep 2024 04:02:41 -0400
X-MC-Unique: ABLkzuPLPG-zrec0_TjFeA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb857fc7dso4967395e9.0
        for <alex.bennee@linaro.org>; Thu, 12 Sep 2024 01:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726128160; x=1726732960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJCCBAsy1yjL6s99J+14imn5GBc215lIAHWntNhCiQ4=;
        b=UZdOdjLQXKnH9JyhxXNppO3rhsSULtpcXxjwykY/kJixqh9EEKOfU4KoE9fK79scUQ
         sm0C/oySi9xAIvu/4oDNHz2gcbK9ckXerq2MunZTfuDByzLWPqxjUj1iGVFqq9nWbS+H
         Q46GCtq639gGitPtQ2mE8jRxb2B9aDxxBkNJwgiIR6FIVTVpX+n87OI36UI1+oJYRSuw
         zT3h8Y9JEjBk0gx6kqEn79uRD7WpKdZKspwxPbZepXrCRMiQpMwGXwhfqA/Ebg8wgyEo
         GZHXCC31auH+EnWeq3LURrLxMQilat2WJCnYwjgXF8zeZKiPGQMHwzt/Lxy4A9DmzZn7
         WY2w==
X-Forwarded-Encrypted: i=1; AJvYcCV0c/STspT1AmFEFnxakUvoGMUacN+V/Ec7aHE1vxKxcqzMhUUdgJVPSEyXUo9lJZPtWcu5DDLMOgjPvw==@linaro.org
X-Gm-Message-State: AOJu0YwLe3MTkadcVaxy7KbI+79ykXXmmwS6WGIuGQD965Ct0NG8r3Gy
	fKhEf3VJuQuF98IAdcB6X5RIO7k2Yb9xFpXPM7RA4F+sE0HmWEbo7qGiZU3o1VezkcJsJCLJ6fE
	Plxx0T4VvlMKThzxOpQfQNvWv8fa6aOj09B6Hi+ax1oWTrMxe9+T5jQ==
X-Received: by 2002:a05:600c:511d:b0:42c:b62c:9f36 with SMTP id 5b1f17b1804b1-42cdb5389e4mr14181075e9.5.1726128159717;
        Thu, 12 Sep 2024 01:02:39 -0700 (PDT)
X-Received: by 2002:a05:600c:511d:b0:42c:b62c:9f36 with SMTP id 5b1f17b1804b1-42cdb5389e4mr14180635e9.5.1726128159137;
        Thu, 12 Sep 2024 01:02:39 -0700 (PDT)
Return-Path: <clegoate@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb32678sm163754975e9.16.2024.09.12.01.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 01:02:38 -0700 (PDT)
Message-ID: <fdd3f261-c2a5-49a7-b8ef-3e99287a0921@redhat.com>
Date: Thu, 12 Sep 2024 10:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 43/48] hw/ppc: remove return after
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, WANG Xuerui <git@xen0n.name>,
 Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Corey Minyard <minyard@acm.org>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jesper Devantier <foss@defmacro.it>,
 Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Xu <peterx@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-44-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20240912073921.453203-44-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8mnNSgsHE16r

On 9/12/24 09:39, Pierrick Bouvier wrote:
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/ppc/ppc.c          | 1 -
>   hw/ppc/spapr_events.c | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index e6fa5580c01..fde46194122 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -267,7 +267,6 @@ static void power9_set_irq(void *opaque, int pin, int level)
>           break;
>       default:
>           g_assert_not_reached();
> -        return;
>       }
>   }
>   
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 38ac1cb7866..4dbf8e2e2ef 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -646,7 +646,6 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
>            * that don't support them
>            */
>           g_assert_not_reached();
> -        return;
>       }
>   
>       if (hp_id == RTAS_LOG_V6_HP_ID_DRC_COUNT) {
