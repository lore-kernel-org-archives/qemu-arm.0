Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2214700ejc;
        Wed, 27 Sep 2023 17:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpRG9JRHcr06pI5URCrT1z2U/KsS2gmoVJX7h6nhFDoOCMaQA+7CWFCzt6RFmGTHqecgD7
X-Received: by 2002:a0d:d40a:0:b0:586:9c7a:d9ec with SMTP id w10-20020a0dd40a000000b005869c7ad9ecmr4152295ywd.9.1695861656865;
        Wed, 27 Sep 2023 17:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695861656; cv=none;
        d=google.com; s=arc-20160816;
        b=LLZtGeOyzIjvQuCtkMue9S346KzphOEMnIT8+u+su1ouzYqO1NRNugF7xPWM9Hndsk
         jhYOlKlPR8VI6PAdPuQsOb6MmGw4jY0yCYFlR3+AfwQ0f3Lwjrpr6W14f3FG4pdKRDXf
         PEdYJa+2ZiXshL3SmvmD3bBt3TYSaUR1eG1IHBqzMsAJLUtx5jVCsfsZPUNITZHq/v0a
         1AyNUiMFJK6syGImkSo2Rwy8Va3xhjpgjMwWbxquOramHRLzvd2MhwKtu50xLxOXywAc
         mdd7KMZkaC40Rah316IcITq7DRFIb6uMqLwMqmeaUXKZ8CC0MZEERW9S9oVbgK4hUkyd
         CvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fx7kCxpZ9MjvNdOhB1WJA/J0BdYu+k99RFDCkPjREH0=;
        fh=fO+ncAaxY0Wf5Oiu0zeLu9be5DWOx71LYjyGHoG8Yc0=;
        b=PW+yjC3e9hxc7J1l14Oq05hiU/HL9FGKTeRCCLaWCYOb95pnD2q5Z0WmNd6FeoWUJD
         t07grwZuI0sQDewpZrYGgww02JfuVKKxxJ7HUzjuoJ6Dcc0V1SQilS2q9WiWeFFtprGr
         qxj6EhGQonhdjIbWKTyVEUxq+CR8dmn1BKwmj1TmXTw5PAPBFH150jRjouEpdZ52GDDT
         sWPWWUcN1VLtfLJ2/nXpqmPzmGUutjRqzdEjgo3N6iy3h5kLFWrwbh9KuJ5hIkZq2Y0i
         aVRmk5qkgexcAIWKFiDRv20iH1ocSZbtaw5H0fbgHmW7VRAr0fvlUTu0AOhvO/1AGXQl
         I9WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSMTVnun;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id b65-20020a0dd944000000b005772504da6asi6252807ywe.152.2023.09.27.17.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 17:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GSMTVnun;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695861656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fx7kCxpZ9MjvNdOhB1WJA/J0BdYu+k99RFDCkPjREH0=;
	b=GSMTVnun+XEBH5b4KJJPphCjqYtJztvWHjvCXaBQj54YQtRxauYXZZrbzTqImhiEEJ9zkb
	1BHPW8AD9M3j/hyCuofZipAt2sA/b0Bd42MkO9QTtxCOO2aijkrYOhd9VI8GK2iQuJph/m
	NRSAqsgivYdJD6HFe7W1X7KeXOdTnTE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-nQeuBbpCMFO0ET-ciCQLnw-1; Wed, 27 Sep 2023 20:40:54 -0400
X-MC-Unique: nQeuBbpCMFO0ET-ciCQLnw-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-565ece76be4so15448072a12.2
        for <alex.bennee@linaro.org>; Wed, 27 Sep 2023 17:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695861654; x=1696466454;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx7kCxpZ9MjvNdOhB1WJA/J0BdYu+k99RFDCkPjREH0=;
        b=bsygCcfVzMtfpZa8qI/YlE52Z2VV7o73KF9bsvSsk+O+dep0lO7rHrVWd3fSV5J3lU
         8jUqXOj3ggh7KjbaqfTxz9Tqs5SYRzQn6fA3s7eg+Tlvs85b1+6rbWLm8aPZCste+4lA
         AFoQmjnIJHvw1kjf4kgEIGf8gW45LqVB2H2C57MdjxNWU5rhUemWwifTfhwy+RaR9sYd
         V0Cy4yj7zbjMgdk6QYY3opKdVwVJ3lWLJ7F4tIdcLNZdxOWTcOKze/22Qq0TKk5BCWHi
         lbF1sKpHdy1rp7OK/ewz67pxNyYmVcRId7bIs+iSH3lZPOc5+k4+l+H4GxUt/PNUJmYy
         ASdQ==
X-Gm-Message-State: AOJu0YxisgJNTjuFHmKnpD0FjXVh1n37PtqFZBiU0kFCrl3OiBp5t6Ma
	LGYg5wv1a24YN5krguJTAcHxh/NAPioMJs1GH50iuQApDsFc0Zt6x33d77L/QCAJpXKifPNFqWW
	+/bJ8/NMJa8spTT3b
X-Received: by 2002:a05:6300:808a:b0:10f:be0:4dce with SMTP id ap10-20020a056300808a00b0010f0be04dcemr3466648pzc.8.1695861653869;
        Wed, 27 Sep 2023 17:40:53 -0700 (PDT)
X-Received: by 2002:a05:6300:808a:b0:10f:be0:4dce with SMTP id ap10-20020a056300808a00b0010f0be04dcemr3466609pzc.8.1695861653618;
        Wed, 27 Sep 2023 17:40:53 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id gk6-20020a17090b118600b00263cca08d95sm4484265pjb.55.2023.09.27.17.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 17:40:53 -0700 (PDT)
Message-ID: <4fb2eef9-6742-1eeb-721a-b3db04b1be97@redhat.com>
Date: Thu, 28 Sep 2023 10:40:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFC V2 12/37] hw/acpi: Use qemu_present_cpu() API in ACPI
 CPU hotplug init
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
 <20230926100436.28284-13-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230926100436.28284-13-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: sjHo628zZNk7

Hi Salil,

On 9/26/23 20:04, Salil Mehta wrote:
> ACPI CPU Hotplug code assumes a virtual CPU is unplugged if the CPUState object
> is absent in the list of ths possible CPUs(CPUArchIdList *possible_cpus)
> maintained on per-machine basis. Use the earlier introduced qemu_present_cpu()
> API to check this state.
> 
> This change should have no bearing on the functionality of any architecture and
> is mere a representational change.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 45defdc0e2..d5ba37b209 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -225,7 +225,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
>       state->dev_count = id_list->len;
>       state->devs = g_new0(typeof(*state->devs), state->dev_count);
>       for (i = 0; i < id_list->len; i++) {
> -        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
> +        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
> +        if (qemu_present_cpu(cpu)) {
> +            state->devs[i].cpu = cpu;
> +        }
>           state->devs[i].arch_id = id_list->cpus[i].arch_id;
>       }
>       memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,

I don't think qemu_present_cpu() is needed because all possible vCPUs are present
for x86 and arm64 at this point? Besides, we have the assumption all hotpluggable
vCPUs are present, looking at James' kernel series where ACPI_HOTPLUG_PRESENT_CPU
exists in linux/drivers/acpi/Kconfig :)

Thanks,
Gavin
