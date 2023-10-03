Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1646332ejb;
        Mon, 2 Oct 2023 17:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9KRSKqaiGOZqy7Kiyv9fK9IECHPeqqe1yDt+2LPi/Zeko7NJLdJ6w5ktw4C9dd0OQzbVy
X-Received: by 2002:a05:6214:3381:b0:65b:1802:4f38 with SMTP id mv1-20020a056214338100b0065b18024f38mr12505365qvb.25.1696291931502;
        Mon, 02 Oct 2023 17:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696291931; cv=none;
        d=google.com; s=arc-20160816;
        b=KqeK0snCkTTED+QcVgPf6jAg6E4hYPTBvXIBAIdiN1YgcTWTDrz+TWMTuZUhjo5Ujl
         Qs3OzseCa2jiTJ7X7ol+bAKNIPNOtXyV5K/XjMBxEG9JaeOkJ4gtxngmmVA3svme7y34
         4fr9RB500U5bollrjpbjNHZKuBW9Olq4cDy+NuIdzQ0NtidMTt9a1pXEqQurXcbTzWyl
         dAkGPZl3d9Ipfvc6DzkiwuqVMbz8YnzpTgA3SgRhkY3Iyx24PaYQfgE7ojwNgmOQg5hT
         0gR3QFrPVsTgi0jEGWmeRj5Du+qeM0zxSFwin1nD6A76SQaMTjqlLkA8Vt9WFEMPJm1K
         tiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vOalhfNb/eZqIOQ/CLiocaKQNVnKGkw2Uypd4hV8Y80=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=lZqAzwV4+1QNs2mkzeTs7fNGWVQJj2sy9kgavpo63R2ZjyvyHTgFrdVu993/78ZAaI
         PKd46ElshMnHqjJ/Lqv9rXaMSZ2d0pkEqE6szAXj/iTs3eId9AHKZwUO1CGjs1zXSyeD
         J8FuckJqbUaK2K49CwSlHw0IMjlxFt/77zE3GCmaIB58q499s7Pt/ApFvGAMR9Pik5UN
         HSFqC8F0mhmmgM0u3CSszoeVbVCz1wRP82sE4A6+CErIs4rNZxHBFB9T8w/eAJU9T1qG
         Rwlqx8Gy05733k6AjyYshWaO7Z2We5pcJ0QmU13zVThaKYJVqSQP0181kv19T/Oi2KQf
         sviw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeH5FreM;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d9-20020a0ce449000000b006563271b4dcsi17716qvm.107.2023.10.02.17.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeH5FreM;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696291931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOalhfNb/eZqIOQ/CLiocaKQNVnKGkw2Uypd4hV8Y80=;
	b=aeH5FreMek7HKEhXvGhi3+cTFv5b+mFuU5hiY5pHjzPjuI5/uFeQW+WTKY6Y6Ka9w4SvaG
	EM5xon+gPsOlLN5W76daHltcSYaJ2y/bPGaQhdzgW/O++6h8JLnQ7u1E6DDfhd/gIwC5n2
	jSksYfRiwLBpAI9ryVxCqKDNypn/CVE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-TJM5npQAN2ObGUuJmCq8bg-1; Mon, 02 Oct 2023 20:11:54 -0400
X-MC-Unique: TJM5npQAN2ObGUuJmCq8bg-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-690bb524a97so335307b3a.2
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 17:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291913; x=1696896713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOalhfNb/eZqIOQ/CLiocaKQNVnKGkw2Uypd4hV8Y80=;
        b=BHVgWQhqrM3QU8KyCCmIDCXuXohSk8WykoB4cDdKWKoAmvVLy1lF52TQZrec9yRhfb
         qoBD8P+Veo9w9UtDaxTp5k5uUfG2npAITadjqWxqcFRCcgIVWq8zUqrU2yuNMi3jv2y8
         kIZy9AKPeZTOaWQvH8sNzJPZOdC1oMdVyNVDeNUJytB+idCpTNW2McNntSbFTlfk4zUa
         OQ2okjdnDrxipQjCg7mdEIURyWwhYPyA9e2OoR54f2ukGLjuhodIFLRpHpGg8wzJBFg8
         hPjsneQxPUVzD/SJV3tbn8n5DkDjMPqMfmz1RefWkKyopX9uQ4fOpF4lBrdB8JDlApEr
         OLiA==
X-Gm-Message-State: AOJu0YwwoF4iThaz/Om6ndar5N+l/m/elLXte6SoShRCa8GX5yvuwg+D
	IUhQVYDqYPSvVeEzcMC3AbLG0RQB9J20E8ve1ikUzayVpDlMQRVFeIgztwwKMHga7yf04kJiTON
	4heyT/mnTxGMNhV+B
X-Received: by 2002:a05:6a00:1393:b0:68e:3d83:e501 with SMTP id t19-20020a056a00139300b0068e3d83e501mr16145930pfg.13.1696291913624;
        Mon, 02 Oct 2023 17:11:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1393:b0:68e:3d83:e501 with SMTP id t19-20020a056a00139300b0068e3d83e501mr16145914pfg.13.1696291913373;
        Mon, 02 Oct 2023 17:11:53 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id e26-20020aa78c5a000000b00693390caf39sm72190pfd.113.2023.10.02.17.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 17:11:53 -0700 (PDT)
Message-ID: <4134b7ab-7a76-77b9-e8c0-7e6d75e0ad50@redhat.com>
Date: Tue, 3 Oct 2023 10:11:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 07/10] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
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
 <20230930001933.2660-8-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-8-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OhbV2VjQtUb3

On 9/30/23 10:19, Salil Mehta wrote:
> ACPI GED shall be used to convey to the guest kernel about any CPU hot-(un)plug
> events. Therefore, existing ACPI GED framework inside QEMU needs to be enhanced
> to support CPU hotplug state and events.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/generic_event_device.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
