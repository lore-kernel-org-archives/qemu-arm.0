Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2041986ejb;
        Mon, 9 Oct 2023 08:21:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHD8pjcCxMnIfKkWm0L5fHFFowWiYkdsP7jWsmpGVWOsRZg3CCsXYMf+582qsgfiKOxtrGu
X-Received: by 2002:a05:622a:1742:b0:410:9af1:f9b2 with SMTP id l2-20020a05622a174200b004109af1f9b2mr22008824qtk.3.1696864896783;
        Mon, 09 Oct 2023 08:21:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696864896; cv=none;
        d=google.com; s=arc-20160816;
        b=IffAsKr7W8qnchm8oHzDqeucwB5tM/52ALU/xWRBVAz5hsEsDOF++MIUB1nHh1ceq7
         3CahpUHwXgkCibVj2nABH0t/U/hM3HkW67okTEqrVd+ah3ohprlY/d7oah+f4y33RGma
         MKA8wBwPcm07aOryqF+ZIi56eeXho4G/ZOW48+3MUZKu+gXCIhyDtVnM8wDTb9XnUVsB
         nMbFoIhBAjCIN/nX2USXMrnzKuNwpxq2yZFefY9ANvzEmF4afH2Ea/NpEQz7Wt86/zZy
         UB+jqRHlMyuH/jDGzd13K8+sx9S1fhpNmL50IXsoPaQZp9xAC9t4/fzYi91WYOF/tiGS
         eWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=SDJrEpCSBJJB1M5Nf7IS/ukbAEF1qbAyaYsHfFthvwM=;
        fh=B6hYtw/BbyOqu6OjGRBKzIZ+XNWqkJzkX6KeV9DY8XU=;
        b=ThBzxTdTdCvpzKCRyk4jcsx4+XTYyMVq6QlOznqqQqnUYwEMwjvJBQSuiIKE8rTMq1
         3t28PNJK8Zt7tDOTeTNxylmTvQyneZDqagUcqEJDoA1Hf+jt2c+owJJbZ4acpws0ewZ3
         f6Qw73eQ+BHqx2Ig41c6wV1pFnO1jyho1sfTE5sxMe3u39cG3VImHLS9K20G/CMlkQ2B
         Bk2HoyTjUBTkmq8kKnLdDZui2kLdJFbrXPnZ/ncP1rlrkti2uhJa3ct0ol74xAAiiURR
         YIBa9VTTBS5nByfYjeZ3W1xHVywxFFX+jTM4QSOe6wXIa7XRi6k+ukDAtE/Fa2EyBVAj
         hcww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErZZXgqe;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id m19-20020a05622a055300b00403f3141703si6261639qtx.619.2023.10.09.08.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:21:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErZZXgqe;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696864896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SDJrEpCSBJJB1M5Nf7IS/ukbAEF1qbAyaYsHfFthvwM=;
	b=ErZZXgqefjm9N5pXpl1+y47EENt08vCkpukALr/5JhzYPIRcHVa9ydXNCDNzOJb2TsvRxX
	vfgPWgenR5R07luuWSVpXKhBOdgVu4wjXMeeg6VPGX42H1pIHI6nCu/e+8Jgs1mgGtp8Gh
	9CKW3V1HYmEud9FrcpPb2zruMr1kz9Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-22bNqr1APb60CrnlvkJ4pQ-1; Mon, 09 Oct 2023 11:21:32 -0400
X-MC-Unique: 22bNqr1APb60CrnlvkJ4pQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32006e08483so3037466f8f.0
        for <alex.bennee@linaro.org>; Mon, 09 Oct 2023 08:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696864891; x=1697469691;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDJrEpCSBJJB1M5Nf7IS/ukbAEF1qbAyaYsHfFthvwM=;
        b=EFNvkxHbjnlaE2ZBSiMwcLzLkqxNWBed8aBrgFUNeA7OubXd6wx4i7wPmd32wrptCq
         8uJLwVKFRxfYMCRTUIBNGzt7cElo/p7SzSJmA2w2OOkEGWC2OSleC3oil43roHZtB1o/
         NMZ2nFxPC9AwdwE8mOQE8IzkqqG0j8btGwrmg0CauMubZDR3kSbOQfVSkyTIfTHQP7XJ
         KqDNLiBwIAw4R9kSXsyXfDyuvufdlycwFgmLuuizpZB7AOgGtfwhMaJ0IKzOUo7iuq1L
         AT5DplV802TkuVldNyDBfhyFPY9c2no4ReOu3O5rH1hlEnwA+fEABtprPz5E7Z5sAF1m
         oFSg==
X-Gm-Message-State: AOJu0Yzx8ofoZZf1PHi9x7uE0u4WnDkv3hSsM2SHC/c+goyzuFCYv0Q+
	60EG2G9rtgm3LWycGcNdgXMMm7N7EMArt8fWYlrYq9kv2rYA0t8EPQWcfsRdwBj9KxzqXjDh96y
	DVY0DLC7a1hd5Xy9B
X-Received: by 2002:adf:e3ca:0:b0:317:6a07:83a7 with SMTP id k10-20020adfe3ca000000b003176a0783a7mr13789200wrm.38.1696864891560;
        Mon, 09 Oct 2023 08:21:31 -0700 (PDT)
X-Received: by 2002:adf:e3ca:0:b0:317:6a07:83a7 with SMTP id k10-20020adfe3ca000000b003176a0783a7mr13789115wrm.38.1696864890057;
        Mon, 09 Oct 2023 08:21:30 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c733:6400:ae10:4bb7:9712:8548? (p200300cbc7336400ae104bb797128548.dip0.t-ipconnect.de. [2003:cb:c733:6400:ae10:4bb7:9712:8548])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b00327cd5e5ac1sm9951674wrs.1.2023.10.09.08.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:21:29 -0700 (PDT)
Message-ID: <792f9f38-6031-1269-109e-941d2ecaddf9@redhat.com>
Date: Mon, 9 Oct 2023 17:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 Linuxarm <linuxarm@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-2-salil.mehta@huawei.com>
 <a02eae26-6018-6f5c-1b82-e6061544022b@redhat.com>
 <63f8e47efcd045b1b8481f6fd427c4b1@huawei.com>
 <ae2e0fc1-7967-2bae-e4fa-b4d886ba4671@redhat.com>
 <0c972e213f9a46c3a595dc7f933046aa@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <0c972e213f9a46c3a595dc7f933046aa@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vQSoBk++UkPW

> 
>>
>> kvm_precreate_vcpu
> 
> pre-creation is very much specific to ARM right now. I am not sure
> if it is right to have an API with this name in the code which is
> common to other architectures.

I don't like exposing the concept of "parking" CPUs externally, which is 
so far handled completely internally.

[...]

> 
> 
>> kvm_create_vcpu
>> kvm_destroy_vcpu
>>
>> One could even make kvm_create_vcpu() fail on ARM if the VCPU hasn't
>> been pre-created.
> 
> Right now, we abort the CPU initialization process if this happens. I
> am planning to change abort() into 'fatal_error' in RFC V3 though.
> 
> 
> 
>>
>> Or did I get it all wrong? :)
> 
> I won't say that it is just another point of view which is absolutely
> fine. But I would like to stick to current APIs.

No really strong opinion, I wouldn't do it that way. I'll let others 
chime in if they have an opinion.

-- 
Cheers,

David / dhildenb
