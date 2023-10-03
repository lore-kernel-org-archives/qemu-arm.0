Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1645838ejb;
        Mon, 2 Oct 2023 17:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY56oDL80drf0sKRWpblD3V9OxZHOjIUSry/BivnPh/Ao03gw0Ozq7nmDwaudIt01vDZfW
X-Received: by 2002:a05:622a:1754:b0:403:b088:5d3 with SMTP id l20-20020a05622a175400b00403b08805d3mr1319078qtk.17.1696291864210;
        Mon, 02 Oct 2023 17:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696291864; cv=none;
        d=google.com; s=arc-20160816;
        b=t6Fk10HDthmK+Udh0gmHN9NkipoBhAi4zpCOvTSvt+fTbFD85eTIMa+5OwBQVzKHGq
         A7p96IT3uiINcNuCIYfgH4XQuWU1uKBVQS0WDh00XSeQJSDj1PZddHsf3uGQfEZigk3z
         I+WVgTiSoF9wNTVtk4qgSJBTv/YQIcywL0FUfEFEBKAyIHRzIPRw0pWh/gSolpc4Kqbo
         sRLQ+DMrLZR9J9svLE9tfuQ/2NEUjQ+R1tTxtLluLHBd4Azd0UEhAjF1U/1/9fvw/qX6
         L1I96xXW7b4B/ROzHpKCUWr3sBYoXJbSj/F5fnbdTNYLM+ucGO0CxhARkz85ebGkqAJ/
         VkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9moNmM+DaQ6xrnDbiLNN/vIK+QYde3QGFbF7hxRLbOc=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=E7iz1Dqy10QHkdBIakhuV/CqWcko8NQwvtfc+LwEzMOlGxQ/FlTaxClAnDi84OhWiN
         Kmkc3qmSGEMGAuRyGiV4NS/ZiMNBh442NGpEYBw1Jd6dWPyhJD0aDTz9LqfZQxl7GJoE
         JXeT4gT4R9mmnJ9/dPvyTzHB5RTZFIHotrt6LCC5C25b6LLeXIl8MskX37qC6f4DHLBc
         ytaG1peM59nsJkqU25LRhYNon9wEvhTmPN2usC8St02aotr01s3zwOFsoOkpbVPMqh0p
         Euf094JaB8BdJUUtwLgXsnwqHbUVEefmZ1p0ri6X37glnvnDnhPpos8YmFI1IxxVLlx5
         rzKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aYN0J/k6";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c12-20020ac87dcc000000b004195a719fdcsi32069qte.563.2023.10.02.17.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="aYN0J/k6";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696291863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9moNmM+DaQ6xrnDbiLNN/vIK+QYde3QGFbF7hxRLbOc=;
	b=aYN0J/k6k1zC9uGtHOXxtjbVHeM8xmxjEfngAYjqxjH7MQET8RmgI+Olh9CE3olchsvIqb
	aS0BNEy0hSRPYsKXmtaE9H7K5/Nj5ATsDdwMNPlv4vu9WanEYraGILuPLxGzHaWRsMqxTG
	S8SNpTkseA2jpj51Fu42L9wYuUb/U6A=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-QVPAwjUOPpqNSFsAkjTWLQ-1; Mon, 02 Oct 2023 20:10:52 -0400
X-MC-Unique: QVPAwjUOPpqNSFsAkjTWLQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c727ea6b98so2460555ad.0
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 17:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291851; x=1696896651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9moNmM+DaQ6xrnDbiLNN/vIK+QYde3QGFbF7hxRLbOc=;
        b=dubKFuUVvxBNCc9WFSqg6PR4CiMXDL38t0fwKaiKnc0LPh7Vd3MFwJBs6jnhIw73I4
         vC94FTLDedYKS28jToBfoWAOgES7N7jcS7OLwZ1xrpFsx/gtpY/rS2ul35n5feFQvyKf
         epbIRHEmgY1BrDH6GwowdFAuVcIhINuCo7P6iWzZ7pXI2PtmHl7sM73Hq01PutRue/53
         3xXjEG4hJEui7GmC/0boxZyJJZKMQ8EuSULGFBSDymLc/wZ+ZgWXfmZW5IvWegoETd7B
         oZPNZ/FLbqkunEx3wpHhWWVkZzbcNQgDlVvp4plHwzC+HoW34UdoPatUJex1cQGhUBoG
         fSnA==
X-Gm-Message-State: AOJu0YzVLLiZoDZn3ZbnJLg/XJIA85c7+j5pQc88tI9+PJKQDRj2IegO
	1uSRFGoco9VXcHH7nXmrZHJRRvXvi8r2vRAcbLRRZ9K9QkiaHtVE1sgPX+ROR1oTlM+3Tchjd7+
	zLCkqetsdecl1MotJ
X-Received: by 2002:a17:903:2283:b0:1c0:bcbc:d66 with SMTP id b3-20020a170903228300b001c0bcbc0d66mr1975317plh.7.1696291851587;
        Mon, 02 Oct 2023 17:10:51 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:1c0:bcbc:d66 with SMTP id b3-20020a170903228300b001c0bcbc0d66mr1975268plh.7.1696291851286;
        Mon, 02 Oct 2023 17:10:51 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b9-20020a170903228900b001b896686c78sm46059plh.66.2023.10.02.17.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 17:10:51 -0700 (PDT)
Message-ID: <810a4999-9954-55f0-9408-b86b36e9e18b@redhat.com>
Date: Tue, 3 Oct 2023 10:10:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
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
 <20230930001933.2660-7-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-7-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lapIwcTVveI9

On 9/30/23 10:19, Salil Mehta wrote:
> OSPM evaluates _EVT method to map the event. The cpu hotplug event eventually
> results in start of the cpu scan. Scan figures out the cpu and the kind of
> event(plug/unplug) and notifies it back to the guest.
> 
> The change in this patch updates the GED AML _EVT method with the call to
> \\_SB.CPUS.CSCN which will do above.
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/generic_event_device.c | 4 ++++
>   include/hw/acpi/cpu_hotplug.h  | 2 ++
>   2 files changed, 6 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
