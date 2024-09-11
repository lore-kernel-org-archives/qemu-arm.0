Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp91643nji;
        Wed, 11 Sep 2024 02:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWR1KPBbXQAaruc1kGJmAvAkWr09/iSwWSg+4SoOgWZe8hYlrh87APHy3RwUKUPft29RMAGhOnykvahCA==@linaro.org
X-Received: by 2002:a17:903:41c2:b0:206:a277:6152 with SMTP id d9443c01a7336-2074c6a46f4mr46267845ad.38.1726047703665;
        Wed, 11 Sep 2024 02:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726047703; cv=none;
        d=google.com; s=arc-20160816;
        b=z2KnQ6a9ZRkYPahf0jRdus17uIjeAOLgkql+11SLhfxOcr6E85bNFqcUlWSOBhFpl5
         rubiksM42AsRUvy+3AHS+rDCXckbLXGKAqEh4NxfKDqLRD754rvmENdS6ZN9Zvgjr3pQ
         lNQzfsjXkKR6fd3SxrH7fBVE3ChVs6+hPMmLN0qUR7DA044NAAax2MnWIhEDdDKNKV9b
         dEbJx9kLdfejw51Nh3V9oP5Ned9q553uJhZy0OSUuFiTv2qTmz5gVzjSZ0Hunn2TT76U
         2H6a9/THWkqwWLKgTYxHjVGtH6joC7yBQn82Ph7r389+r+jwLKSbftdXDIGnteBabyrc
         BmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kn5qlxz6rYEqhaF1IlMFBCOQtR9IuIiaMxxsFKOJnss=;
        fh=VC5Y4bSoIxs5ye6mfY6LKApVL4lYe9VBDvBlXhlvAlg=;
        b=jEbtZZiVk6COEnSywd9qVPoDI+ub4ibcVCt4VYiGbZURUQEm/KBsRB3tAPzk8yOlcb
         orKsBlG31xA3GYgnP0eXR5GVA1w2xgF1zTjOycRaCrk9c76S7VXz5xWT8cUeZJB3hxNW
         ltiKjPbCbf6MY5zTny/CnFarNBnu0jkopVDTPzx09o2LPKOI5ZwQ3iiDH0entHe6dJ6Z
         rFSkx9wmKhdhCn8DdjXGxbxkNPyuGMy7BhFAFpW3qT3t1Wh7A1zGEg972CYgtzYfnWtZ
         zPvpxnOlXC9F6FwgeE5E1PjlyTXD5jFKLAeMOeD8dRTb6bJMev8w823RQ4vXhE7/91+G
         uRpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AehN7COl;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
Return-Path: <dbarboza@ventanamicro.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710e4ba25sor76523855ad.5.2024.09.11.02.41.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 02:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AehN7COl;
       spf=pass (google.com: domain of dbarboza@ventanamicro.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dbarboza@ventanamicro.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726047703; x=1726652503; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kn5qlxz6rYEqhaF1IlMFBCOQtR9IuIiaMxxsFKOJnss=;
        b=AehN7COlDYsBCa7j2ve2/1sPeAk7UigFuyQ3UELY/mzNdZlaImKBG/7uf+Jrk4y/Ur
         ZlZc+XrCeE1y96ccIQ+c0ctDvvglCw50aFsuCgcDvarpE6Vulp+Q6p71tg3YPC+pb0yN
         X0cM9aeKL3oJ3iiVlG+8iF+31e+Y1Pk5pWtxDriH4b98q9dYACkU/Ij/UE1xekXcw88I
         IR7fwaY0eIrWXtes0wZO9WvUzwcPt4kExzC1jPib4p/z3dMwgXV9P0c1RQmJHs/JIY6x
         6oeFCxO4tlzeEVuh6ayN+VvAT1cxOX536AMIttVAP8nA1hpG1o3ehT38sQseJ0Uzo1UP
         0laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726047703; x=1726652503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn5qlxz6rYEqhaF1IlMFBCOQtR9IuIiaMxxsFKOJnss=;
        b=NROXBcU3td6bd47EsGDsWjUhGi/D+bDR5h26Vi5+uiphJzETAWFWL4wNJvChix65Pf
         +pAVXolQ5E0lw/3BB6hXIZK5hwtpWpIn64GxzXMJhrHUGIJWruP8R5ntXVQVJPaBz+pO
         Di3U6gJ5vz/rwPFR44fpHXLDWYZmfv6Fv8LQnGx9Yt+ZeYi2+dZJWY6RCiV4Prb6dyGE
         TUSVmMou9QObbAG5a6DdvUVoCDsB/9FB3EB63qP/AxQSa0xHj2aym/SujkWBE3yMWm0C
         TLWiec8ZM59LnJgnRxLjVMI8sWrYfIVAck1olUYKEkRpQtKPbEWbKaY0aMZH0ZAeCHHi
         aFEg==
X-Forwarded-Encrypted: i=1; AJvYcCWGaA59gUtE0p90LjupbdUG6iHicSyAbuMSrgx9E9G9JOI5DM2auPR+8UvgA30ZjrKI7ReBZBkdOHousw==@linaro.org
X-Gm-Message-State: AOJu0YwtYm83A3Pv9IdtjIjT/7tLKO/ZAal8kTjdoMxiUSLRlO8C6gJH
	3DqNFu0gg6LgNiJxHswCDrBExTTdrnovhlCUag65gmumr50E0MT1Ccweq1Z8mXE=
X-Google-Smtp-Source: AGHT+IG7rMRmLj/y96aXDOZLOEvKG9GOrb7S5g+4beGqyo1xcxzviLsaVZV/GqWsQoagVaROIUgcuw==
X-Received: by 2002:a17:902:f790:b0:202:19a0:fcba with SMTP id d9443c01a7336-2074c6a4573mr64727285ad.41.1726047703192;
        Wed, 11 Sep 2024 02:41:43 -0700 (PDT)
Return-Path: <dbarboza@ventanamicro.com>
Received: from [192.168.68.110] (201-68-240-198.dsl.telesp.net.br. [201.68.240.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e321fdsm60213095ad.83.2024.09.11.02.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 02:41:42 -0700 (PDT)
Message-ID: <c9167c3f-9cb4-458b-ab1e-ee5c1103f76b@ventanamicro.com>
Date: Wed, 11 Sep 2024 06:41:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/39] hw/ppc: replace assert(false) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hA2rDxt+46vc



On 9/10/24 7:15 PM, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/ppc/spapr_events.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index cb0eeee5874..38ac1cb7866 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
>           /* we shouldn't be signaling hotplug events for resources
>            * that don't support them
>            */
> -        g_assert(false);
> +        g_assert_not_reached();
>           return;
>       }
>   
