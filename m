Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1628543ejb;
        Mon, 2 Oct 2023 16:29:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuVceyUAsqM0I4Pkjp9Y5AoYm4Ufqr2LwGMzipjxuTyN8Q3nXSr6yBgRatXk78c17kXODo
X-Received: by 2002:a2e:93d7:0:b0:2b9:4413:864e with SMTP id p23-20020a2e93d7000000b002b94413864emr9725662ljh.53.1696289353625;
        Mon, 02 Oct 2023 16:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696289353; cv=none;
        d=google.com; s=arc-20160816;
        b=VOxJbQxOWOcxuT0jcO0yWt7k9vHPItFt05OU1JZMFP+TKHuaJEYYiDXSn6Dpq+bt3Y
         enuV+5YcMJzP8Ify0Lvdx4KNT6O12T1tysMUik3Q//KWSQPVFGi7U4MQUgtD3V4OtMZG
         cUtWHEeCP8ANp9LyavyeY95AhF58JMZli7pY7/KCq4QwZzeky8mtyqJa1jxwQC9PZL1A
         cKriEgmcpxAMlc9bXQH/V1wM1Qn1P0VJDx5Dct2EgjfhBLW06w1hOVFs6wR+tC4et0fx
         0l2YzjzuT4+E3gOErXaYlD5Edck5Hdh0W96qd0UrQK2MC4013UWL70MViq9V85kBuIUh
         z/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kdb0u2mZD7engjCM6+bzo8+dGWnLDDh0vZKGl79Muy8=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=FsFBzD+RLQSD2QcFvKzjnRmXPIrUFao3k6z7YTAu1PeDKy6qwbHlUONSyz2S0nqWw4
         0rtWVrE6eKfxpP5z8GtiUNXII/FD9lfRo6MOTcTPyQu+qx0N48l29iV6173F29AGTtyH
         TZQpRZzwPBC4ToaNQHJE0ATa9NKiIUoiANc48DZ6NOkz+1/FlOvD2YoHVwQOPhRYFfV7
         os111TU9D79lVjRdDQMUciAOfV9tyu2hwfsp8dvPqQeDWC20snOCQlgf1QYtBiN+6Oh2
         Ci0SA4aTUaezqTG8yV1SwL8qkXOzHe41HoIxZjBpTFTvjUSyeUFa+HCnqMD9hxkO8cQQ
         PAOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dn1Li5WQ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y11-20020a2e978b000000b002bff38f9725si14028989lji.60.2023.10.02.16.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dn1Li5WQ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696289352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdb0u2mZD7engjCM6+bzo8+dGWnLDDh0vZKGl79Muy8=;
	b=Dn1Li5WQFTMVT7HsAgYYSyByJHWHOUcRwEZVfgABL+rwA8CXbo1TYmVs3fKmqGW1qBzb14
	oBMFSEq620BfIX7fNDP0tU30deWPMFdV6q8MeuhBIvZL4G79JGlqjiXtj/wxgGALXRAD9E
	yQk3/2STLPhJjJgGoU/z2MUPnOjsFNo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-_BSo40kbOPW3azpOrmp24A-1; Mon, 02 Oct 2023 19:29:08 -0400
X-MC-Unique: _BSo40kbOPW3azpOrmp24A-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c61aafab45so3261675ad.3
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 16:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696289347; x=1696894147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdb0u2mZD7engjCM6+bzo8+dGWnLDDh0vZKGl79Muy8=;
        b=fW7A6yN7qdWVBsPiWZw+ZNnvP4WEy8kMRE9lOVtEZPpWZ4MuNZh0EPhSH8NRLjPxAe
         pg+RSVFpJ0RC//RVQAD2EBzDJ3qtyZK3zc8zUzxVTCfvaj0bQNhxZWhbUPCkDGcDrJV8
         J4ZdwM8EqTWSZ23Sgpaj5NMrDVFovooabf/bljKZP3Em5DPBojtnJGygdkwIZ8GvPdWk
         20s93FkVc927D1JsioJ5DCKD9HRmWHUk63lBRfMl/iDvQuHoMPVcipzMDQ9gp/KOe4rv
         kQ2qFU8HYGYBGC58N/R/2/nd7GRdEHtRDosmM3B4xSLO7QCtcu6FFzMUbkn2mx3uRW/4
         PZ/w==
X-Gm-Message-State: AOJu0YzWQvj9ZKRH6ySA0qnyU4qNCie9HoQGJCJgkXN8bZX/m3bT+juY
	0LIKz52f/aEQAjy0vUMcRnjMJcO9uGOsn0WjedAF5c0YPrxJpLKQMHvZDokgxGBl7QjAA4HfcAi
	AgBQfNaNQmN2YxFXl
X-Received: by 2002:a17:902:b58c:b0:1c3:3347:996e with SMTP id a12-20020a170902b58c00b001c33347996emr9815305pls.23.1696289347581;
        Mon, 02 Oct 2023 16:29:07 -0700 (PDT)
X-Received: by 2002:a17:902:b58c:b0:1c3:3347:996e with SMTP id a12-20020a170902b58c00b001c33347996emr9815290pls.23.1696289347311;
        Mon, 02 Oct 2023 16:29:07 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902ed1300b001c0ce518e98sm1118pld.224.2023.10.02.16.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 16:29:07 -0700 (PDT)
Message-ID: <2e4705a5-3c24-ae6a-e030-b3d5f4f2e37a@redhat.com>
Date: Tue, 3 Oct 2023 09:28:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-5-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-5-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: SJd3RI4bcKPg

On 9/30/23 10:19, Salil Mehta wrote:
> ACPI GED(as described in the ACPI 6.2 spec) can be used to generate ACPI events
> when OSPM/guest receives an interrupt listed in the _CRS object of GED. OSPM
> then maps or demultiplexes the event by evaluating _EVT method.
> 
> This change adds the support of cpu hotplug event initialization in the
> existing GED framework.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/generic_event_device.c         | 8 ++++++++
>   include/hw/acpi/generic_event_device.h | 5 +++++
>   2 files changed, 13 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
