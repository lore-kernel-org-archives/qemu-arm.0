Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1625141ejb;
        Mon, 2 Oct 2023 16:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFicw2cBHzSeiaCKOvY+r6Mo2+jlt/1436VQD7S/u7gx1NqTtJH096+ixnEPxchRT/hq33
X-Received: by 2002:a25:d501:0:b0:d66:b73a:8356 with SMTP id r1-20020a25d501000000b00d66b73a8356mr714102ybe.14.1696288791511;
        Mon, 02 Oct 2023 16:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696288791; cv=none;
        d=google.com; s=arc-20160816;
        b=amqKmnWjMt96XjPc989dLz+oUrFSvY6joeNwQ/RLzxCIHm7c4Kyf8Vr0A3ijFA4h5l
         Jl8GVexv2Nvsfsi8Z6hdLTxzRvGYfDA6TlVvla/nI8+AQr9aozFwMWvS+WUfUb/EuLuh
         1QcczWZpCk/DMHOBChNtgkcC5+Q8iBI1bJgLBTR37TksMHGWyO2uF9hjMw1OjWb0UJjq
         u3z2oEiEcb2ivJlU6w/QmbtE7X1YUwm1JmXz36E9cI3PoXx4AhyuaD0OxYxpe9pLCfUr
         eVAmMkUbSJubsgsGnhR+shIes46mfxnY/ZFNeTWWI7mDQIEHj/ZLiDGHpLmmchEYN3t7
         mJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1Vs0EGAymtTvEBv2kg8ycVMlwZ6qOaMg/mXgYFFPxHE=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=PQDIpPSS0NfiGDB+h/HqP5dTLGOR5tXmT6jfPVqkIBC7EZIcXmBxvQ+qIU0ZTr6eta
         Lsuxm91ljP+bsuGL1pJnEiSFeq3zZlgkrX2qmO3I8cWvw1WrJukCPkIYonuckI7WawLk
         wzSh6mYl8qIUotHTojqcyVuLbYs9bOggijeldC6PkG9HVqnptI7rWXv0hfne2EidrY/D
         52phWJqx6j9S19Gfukv58KPOXPsTKm+U66yxNLFjpmpDeVmi0gBzZfgDAJuYBNA5mSOJ
         YblohqTKF2KFmCfDW4DeYGpxX4zjtDzcpKTH5LQ0RECQAo6kA7jEnGynjIZEe4nay5xq
         aRkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZjE3L7h;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f199-20020a25cfd0000000b00d7e312a0260si33303ybg.146.2023.10.02.16.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZjE3L7h;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696288791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Vs0EGAymtTvEBv2kg8ycVMlwZ6qOaMg/mXgYFFPxHE=;
	b=FZjE3L7hieXKTKiGTee/UPemgZXGU1455pqp2r5QCn4QCA66AWHsNnilw7EAoKhOdAMEub
	M1EqDyBn7zgGtDPDYQEX2JzgvXT6ZJNL8cpobogzhdnAoQUnuEAMphG4WlMMoIoOB/okcz
	LYovdo625ui7+bYcvar+V5Iqm1qM634=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-GHOPQIycOZyLtw0v_gkHaQ-1; Mon, 02 Oct 2023 19:19:49 -0400
X-MC-Unique: GHOPQIycOZyLtw0v_gkHaQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-692bbab7a4fso2667752b3a.1
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 16:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696288788; x=1696893588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vs0EGAymtTvEBv2kg8ycVMlwZ6qOaMg/mXgYFFPxHE=;
        b=f6VWcrc/ZN3Kjxp2hEfCiKMEkEU8Txkhd/jcMNzNjIFI4umvk2ZiOCqzdiSV4/xerH
         5wEPPs81xNC2fdAAAhSyqm+Yx/oqgOSVC3J6fMUHyPUFVUljlZFTpCGH+YXG6Jlcgatx
         85HVEKSh7CryNsN+SP/ZwNRsstooOPuGGwrki4Wt3PZNrn0cCVkU+NcdmJcUrL/v2oGJ
         4MZ1fFwLHg+359ZokQGaXZofj1enCL4Af0HV+8LD/tQxnAVcVDPA3qkhnZd3A7nfpsL5
         egxsHbMigL3AwOWJcsWME9Y0n2l3E0DndmFnS/nFfnjExJsmJe7gVIVm/L+xUs5h0b9D
         FTCA==
X-Gm-Message-State: AOJu0YyKkWzNCvmppehjX4h4O5Cf6WfFFnL22AcFVAgQNog9n+ZNFAX2
	TPkepX6b1kclVfJVgZODyI3nDtibv8fNeibAtXa8Y+V/mbWLH1GXqLrdkw4CWTuzchQVZOY14l1
	W5zp4jqkvA0HShxiZ
X-Received: by 2002:a05:6a00:188d:b0:68b:a137:373d with SMTP id x13-20020a056a00188d00b0068ba137373dmr1917709pfh.17.1696288788303;
        Mon, 02 Oct 2023 16:19:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:188d:b0:68b:a137:373d with SMTP id x13-20020a056a00188d00b0068ba137373dmr1917664pfh.17.1696288787917;
        Mon, 02 Oct 2023 16:19:47 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id x27-20020a056a00271b00b006884844dfcdsm37163pfv.55.2023.10.02.16.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 16:19:47 -0700 (PDT)
Message-ID: <64ecbf50-2287-6bd4-d2bd-e37a793ed6a9@redhat.com>
Date: Tue, 3 Oct 2023 09:19:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
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
 <20230930001933.2660-3-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-3-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: S0/w+OBsq6Ov

On 9/30/23 10:19, Salil Mehta wrote:
> CPU ctrl-dev MMIO region length could be used in ACPI GED and various other
> architecture specific places. Move ACPI_CPU_HOTPLUG_REG_LEN macro to more
> appropriate common header file.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/acpi/cpu.c                 | 2 +-
>   include/hw/acpi/cpu_hotplug.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
