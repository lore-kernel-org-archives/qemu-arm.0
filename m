Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2209651ejc;
        Wed, 27 Sep 2023 17:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQkzL/zH58DVACH5K7JQqy6w7vrC4C6u915pr2qRhpWtOQCTEsvT7WfuCm3eiamtiR0CTO
X-Received: by 2002:a05:622a:4f0e:b0:419:6391:6bee with SMTP id ei14-20020a05622a4f0e00b0041963916beemr1770756qtb.67.1695860918830;
        Wed, 27 Sep 2023 17:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695860918; cv=none;
        d=google.com; s=arc-20160816;
        b=V0MW1utLU5YaOTnjxAWQXcXd7a92PT5wdRqxKSM3VyLAQLD7uLmv0K8luL/WWe8cmu
         iTUf0dbt2o6UNwpUuZdPG5fFQpNvXEqT4uXIG8/ZMSQ18fGpCvcOpoNjXVCTbT5lowak
         Uui425xHkhUOkyZpWKzsBL/5pPOFvoQgZayBdeizk1hEYCxhNJJTXra7ErXdKyiCUono
         jqzrlGETHE94fD09CFnJV2+lsFmJBL7t2ZdyMWkkZpWCFfbF79pY5bp2qsMoMDP4NCD8
         8cfEOowhK+nhdyM9LSHFIef39sebFlG2+58xMLTVDXVDEPrGuFK37+1AdGYJ46FsawzC
         KaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=naGB67P35Hh6ey4h7HMOBQWk3NFVJt+hndCv0Q54Ov0=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=AjdVJ1DRda2C7RGX/GLMU2aGR6C0kBw6ZsmWOnFyx0tP7L7uPxycmCi5ByDwLzHcgb
         c+PRxlbH+ImE/ujDcoBBWvvVrEbcaM9OVU8D6XenFn6hOVMMTN/rgvKZs1A1+qtXZVTR
         gAHgvA0XSHNTbNkhD6iISlGzcTWQNarz4dE726cWMvgq0M4mSUqkQwuTY9OmNdgyLdo2
         56JUMOKtFHjPglCglh/b6ASXSLj2aXecjfWb+zFwwwFA011R77gOpLLWU8hGmzcEM0c/
         8xAz39/xum+lYcDrF/9cjb/EnIvhO1SokayItCsbWc8/eGAA2LLONvczPwEt5YhW/VhJ
         vprA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZY29oz66;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d8-20020a05622a15c800b004108aee38e8si8884796qty.122.2023.09.27.17.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZY29oz66;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695860918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naGB67P35Hh6ey4h7HMOBQWk3NFVJt+hndCv0Q54Ov0=;
	b=ZY29oz66MDak94WtmU8YBxMB11rNOMYEnEjm+Tqpi5VnZkMw1RKzyTfBt9YT3sbkTIvhMN
	F2ln6zbEaQueTXwksiQPSxI41uHg2igk+Nx8w9DDu9Hw700ECF8TN40kMKdCJcStA0O0No
	XmpcSsxhPbxzftC2g2FN/8SMsyvJHYM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-rZx5EvIYNM-DM-etzJY55Q-1; Wed, 27 Sep 2023 20:28:36 -0400
X-MC-Unique: rZx5EvIYNM-DM-etzJY55Q-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c60dcc3d9eso123869515ad.0
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 17:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695860915; x=1696465715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naGB67P35Hh6ey4h7HMOBQWk3NFVJt+hndCv0Q54Ov0=;
        b=eLG70xf5KLeqVjMSpsncAFOcrKMUJcOeo6sCpAz2saGIx+AHIKL+vcbZgFkFGNQJZN
         /t7H56YfLFzzJYx2LjMX4YxiucjqrLvNV1zyDi8GjE5ZCjapTXP7oieuyy257/u676np
         SYt5Xbq9TjDR6dvXneMJWJVhs7wWeUKng/7isgUveQq6AnI397QDYh+b0Z43pugQolU8
         aH1o7t1VE2u+lQdCgT6vvx0yoAMFqmDQHCJcIJ3QJPyL3lem1nfkIdXMy8p3/YRdnVZm
         F8q1gVstePGn48jU09o6TGX73WUIVrSXWOc7PBesRfuol+X5e3GP9GENUXGMcPs9K7wz
         9BrQ==
X-Gm-Message-State: AOJu0Yx9Hf4ixik0PTr5ZLRpmdl6euVQkVRzfWsfC4JggvtVjj3WpbDR
	grqk5zjc7j6kZqgkGwJ7xJqpECYHo+0gb8mWXjFbTjhh03iUSEx1k7GD3jVfnpRmPD2+cMVBRhU
	zYhXm/SRnCRHaAPiE
X-Received: by 2002:a17:902:7682:b0:1c3:f745:1cd5 with SMTP id m2-20020a170902768200b001c3f7451cd5mr3436197pll.34.1695860915034;
        Wed, 27 Sep 2023 17:28:35 -0700 (PDT)
X-Received: by 2002:a17:902:7682:b0:1c3:f745:1cd5 with SMTP id m2-20020a170902768200b001c3f7451cd5mr3436153pll.34.1695860914750;
        Wed, 27 Sep 2023 17:28:34 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id a2-20020a170902ee8200b001b66a71a4a0sm13692639pld.32.2023.09.27.17.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:28:34 -0700 (PDT)
Message-ID: <dd1028a6-e229-07e3-95e8-ba636dc0651e@redhat.com>
Date: Thu, 28 Sep 2023 10:28:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 11/37] hw/acpi: Add ACPI CPU hotplug init stub
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 mst@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-12-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-12-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: DUeZhitdxn3y

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI CPU hotplug related initialization should only happend if ACPI_CPU_HOTPLUG
> support has been enabled for particular architecture. Add cpu_hotplug_hw_init()
> stub to avoid compilation break.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/acpi-cpu-hotplug-stub.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..c6c61bb9cd 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -19,6 +19,12 @@ void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>       return;
>   }
>   
> +void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> +                         CPUHotplugState *state, hwaddr base_addr)
> +{
> +    return;
> +}
> +
>   void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>   {
>       return;
