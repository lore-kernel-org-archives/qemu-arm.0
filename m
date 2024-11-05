Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2495802njc;
        Mon, 4 Nov 2024 16:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGDzcBP4DDQSp5t3Ssh1mF5Ja6NVXiooVqG8irn/aRYv4fE/S6rbE3gQKaOg+3Ntn1wUWQYvI/ObyFBA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWV0bBcCRcyHuA71/3iE5mDBTb5Hz2tsRvc1+m8z/I/Ku/Ufts5O6+uI1w386LnRlnZfdZ
X-Received: by 2002:a05:620a:2483:b0:7af:cd33:33b3 with SMTP id af79cd13be357-7b193f3e059mr4893299985a.42.1730765640753;
        Mon, 04 Nov 2024 16:14:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730765640; cv=none;
        d=google.com; s=arc-20240605;
        b=Jtkv0M5ShE9f76hE6JmxerGz5z7Wk+PZkJpM+ntq/D7pVb5QjJnT9KYv6FEj8Oy84T
         RPdXEFhDrekvslFVYBdu7gOVwlLfAC6xC2TkPE1ho9IhocFy6vwFpaZEUCM7BNq40OTW
         R1EfJ71iaRk1NmwKKFSiY5IFST/qxskaNXtvyg0gxxTOgvSzYOd9T8UJac1N6DtPd/UY
         /OYmU1sXkR4tl5TQQ/i5W2ahM+TjWqsJGr3q9wlGM2yG1wJEo7EK2YzjW/tAe31hhsjk
         1l7BtdwHw8FOJz3VY8YBu3sBA8z/T32p76e307SvHlNkV+HlNv0fiEGQYCokOf7NCkbt
         DqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NIAS6+midGNCR8Ettd89A2LqtAZNT8rANSQ6Lqjg6/A=;
        fh=t3O2U8gKJkEwCOC8O1g62GqIM/n7NyKHlDi8Z05baAg=;
        b=HWkdCGnDeA/sbn1s6lOdsVEMQ9V3SrOR9dFJnSsHg+80r+Kii/ihu/5kUbOoPqN8Vu
         aaW2Gq7CYuuDXU+K50PhoVTlPxJi+JkzRnNlLfaTQpsikpdtoVcwiqLcFUpxG6VGUgQQ
         lWcPNjFx+Xbjf84Exoo3izauJuRP643D64A1jCWTF/I7wD4mXZ1bYcgbn42C2FYwiTcV
         wPNKyi9Jjglfoa2ETx9+mSUdIW6ZQZ43o3yGFlMmVMoGBPkxBULsO20ndhfWG/fm9D1Q
         ubApEaBuznYLPQQAJ4d3W5vTKLaXcGi1xOqM2oAZmK0FUxdpgVz8JKWU0vKCc4fcIH4j
         SVmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YwedjO0k;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab6b7csi1267572285a.646.2024.11.04.16.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 16:14:00 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YwedjO0k;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730765640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIAS6+midGNCR8Ettd89A2LqtAZNT8rANSQ6Lqjg6/A=;
	b=YwedjO0k8ZT/7XlL3vwHZwiJIfxq0OL66ljdoOlvRPtgXa2rV/7YwizamcwgAG4vweRa//
	EEh5I//PGYkDe7bQefCwGXm+OjnjyP0rr97y7sWjxi72iMU+uXFbvdyN+SkRMiQ6/nSC58
	aVxr3ygPiaEm/uzueoloBTQUhS3kWG4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-gIinF3FbNBGIAKUPW1bUkw-1; Mon, 04 Nov 2024 19:13:59 -0500
X-MC-Unique: gIinF3FbNBGIAKUPW1bUkw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2e2fb583e4cso5865964a91.3
        for <alex.bennee@linaro.org>; Mon, 04 Nov 2024 16:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730765638; x=1731370438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIAS6+midGNCR8Ettd89A2LqtAZNT8rANSQ6Lqjg6/A=;
        b=NwOCNrEZpoYcYvmnpx0fCZB1VnbeXsFWxD6E90LCUdGDZm1pQ5yVTgK4sZF74jsI1O
         VCKQbzboUyDwlo0v6xjvhA0YmJDL8eerkAQXW6rGugKJmzNCuVmty2YuHQPl0idAVeUz
         J+yprKk2d4byhdItABzUwtrP7ycImP2ul59ZBZZ/U1pmJjZJpOyMCtV4Ryd+27PrXgpw
         t5GcIpGM6hbiCSHvoY2nvIHHBP95wElM40hjxdqbq46VUjg6sPQUpGgIrj6fvhdJ6Bvc
         vg4fLjYESTv5Bbb4R6BLoDIh7AcMtgr8qjS/TKY8dZfAE4Q6yPwWVa7qLXjCSCBC7j+O
         sX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTt+B+YvMrEKyN7OxeplZBvzDxDXyzdLLR+X83VbvbkmYrXZK7NwLUVJW2hS1jRCeziyeXdORHKpBZNg==@linaro.org
X-Gm-Message-State: AOJu0Yy/gjGNifu13LQk/ySzoGAhPt/WjNYaWDqW0xR91tAMMVUK3N4D
	pA99GvYFspQDStOtD5KatfcxtYhsfyUSphxWyvEK5uX62H4QxpZxnZRUfhOyuuez+041O0YwbcQ
	/bJosVKnbPRqV6dG8iyvninTLC6nIKobvgUz8h+iypHDJV7GOZ25W9g==
X-Received: by 2002:a17:90a:e01:b0:2e2:d82b:d144 with SMTP id 98e67ed59e1d1-2e8f11ba066mr39098324a91.37.1730765638031;
        Mon, 04 Nov 2024 16:13:58 -0800 (PST)
X-Received: by 2002:a17:90a:e01:b0:2e2:d82b:d144 with SMTP id 98e67ed59e1d1-2e8f11ba066mr39098294a91.37.1730765637696;
        Mon, 04 Nov 2024 16:13:57 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa2606dsm10472665a91.20.2024.11.04.16.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 16:13:57 -0800 (PST)
Message-ID: <3d5d60a9-dfdc-484b-a1a2-a34bcfdbdd85@redhat.com>
Date: Tue, 5 Nov 2024 10:13:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
To: Peter Maydell <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 richard.henderson@linaro.org, jonathan.cameron@huawei.com,
 alex.bennee@linaro.org, imammedo@redhat.com, pbonzini@redhat.com,
 maz@kernel.org, will@kernel.org, oliver.upton@linux.dev,
 jean-philippe@linaro.org, lpieralisi@kernel.org, david@redhat.com,
 philmd@linaro.org, andrew.jones@linux.dev, eric.auger@redhat.com,
 npiggin@gmail.com, harshpb@linux.ibm.com, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, shahuang@redhat.com,
 zhao1.liu@intel.com, linuxarm@huawei.com, gustavo.romero@linaro.org
References: <20241103152455.202462-1-salil.mehta@huawei.com>
 <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KXebDwqwM2o/

On 11/4/24 11:26 PM, Peter Maydell wrote:
> On Sun, 3 Nov 2024 at 15:25, Salil Mehta <salil.mehta@huawei.com> wrote:
>>
>> Extract common GIC and CPU interrupt wiring code to improve code
>> readability and modularity, supporting reuse in future patch sets. This
>> refactor is benign and introduces *no* functional changes.
>>
>> Note: This patch has been isolated from a larger patch set to facilitate
>> early merging and reduce the complexity of the original set, as it
>> operates independently. All original tags and author contributions are
>> retained.
> 
> I would prefer to see refactoring patches in the context of
> the series that makes them necessary. As it stands, there
> doesn't really seem to be much benefit to this change.
> 

+1. Please include those 3 (refactoring) patches into a series where
the background is given.

Thanks,
Gavin
