Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp167673njb;
        Thu, 25 Jul 2024 17:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpY2PrV8vBK2O1Yg7asBs9QnuH7FGJ5cfwiS5eaJUySFDhqac6ZIbMf1oEciegblr5JtDdI5A/UHkPgA6BKdLwJ+g6k9iR
X-Google-Smtp-Source: AGHT+IEavFGorzgA0PoDMgCpMnutqwl/665nUOinNuZblJDJcomig2htgpjTEtELacQCXa3t4k2+
X-Received: by 2002:ad4:4ee3:0:b0:6b5:4a87:4034 with SMTP id 6a1803df08f44-6bb40878ceamr43592066d6.49.1721953641070;
        Thu, 25 Jul 2024 17:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721953641; cv=none;
        d=google.com; s=arc-20160816;
        b=GY1q0/G8OfZOzzdRBrc+twu+ZnknI2ODs0G1yEris+wvXVbMmugdjOcdyvNtU1Vvbx
         fpIvH0TgQ58STgU2Tm6COKguhlX3iirnxYccu35qOO8ec8ChvTYYDUFuPNHSy+e/Wao1
         kfFVYUlACEvX7dNwRRddlSYrXHediAz/7y3qGbdgcO++deKaeiKOHWN8Ld/xFMTImItQ
         b4LS4sv9iqSwQsV9OJpgCzg+rdtcaQXb2sapas97j/kdNl7vKp03MEwsULPCl2e+F1iR
         lvExSLNAugnbwyx7bV+Rw5O4oBoYoKd6oM9ax4PJNevgjQ2xuhK4Hb6yYqnkJKK26AsI
         MWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rIbBOruk98ENJ1APHewWJU7cFZJmyxfAZQ7nEUlWnCs=;
        fh=EJfwJHGb7ua1/e1//JluEBzUluJlqHiru6ZJGUTvIEA=;
        b=g2w4xbwua4otyrMRux04vV8ZPPrcjNwzX3Zz9oppetYC4UoTQCc9sRcgcsg9s2Am8f
         12emPja8iUjeXtc+RzuMDPj8WGbIlm0KFsuQ2ggiLCf+thJf4vvEcm/BfIQEVCvRXE+P
         ujC46bYq9vpW5O/kx+1vGf/+p2MTegYLrUf9i9hJLYB8az/FwaTTmwVcYnYeJF/wAQAY
         YatdXKXtWyqYP9kXW6HOmUmIg/wIXNCWbwbcER596Jjz6itbqTJ1mCDboTXywwn80lEt
         bz7arM4SaWtaUgCj2H2M3PCRhsblcT3T7/UwBNRCplYDN8CuEKdxymf5hK9MYjpZsY8/
         uHAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkVUnvUO;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3faa98c1si29741756d6.317.2024.07.25.17.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 17:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JkVUnvUO;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721953640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIbBOruk98ENJ1APHewWJU7cFZJmyxfAZQ7nEUlWnCs=;
	b=JkVUnvUOs/vzZndxk6kyNFsxXoYIg1aPjqiraVzo7PCNXj0Z4/reUOfU11zRIcSkDY5Skq
	O655JoD/Rrgw6e0v/4NY7aylk0cfljhdw6rPU8S+qg7i6aYoWUPYL+XPTb7JZRcRvjKpU7
	wglt91AIeSgVn1czopKSvHAC5eHB268=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-sVSx3brFM0SQGq_w9cOwvw-1; Thu, 25 Jul 2024 20:27:18 -0400
X-MC-Unique: sVSx3brFM0SQGq_w9cOwvw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1fc4b03fe76so1342155ad.0
        for <alex.bennee@linaro.org>; Thu, 25 Jul 2024 17:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721953637; x=1722558437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rIbBOruk98ENJ1APHewWJU7cFZJmyxfAZQ7nEUlWnCs=;
        b=OWDUo4ZfYC69Adw4+Xc5/RgJdqjFKctRvA8qsHm3L9Nt2p4sFaNv3g3FSCjKySYqRv
         JCry9AD8Be8iMHBNo3DpSLhmww80/RN/bfk3EJl1aPw0aIMbHoPW0sMWnqbkBeOdTmck
         88ieCUZQYhNtOYT4R0gK0M5+Vb3QyeVD4gleWiqQTrmcvnSGFbnJSv0iegl1fvurnIpZ
         44mVo0ky6RX1+qIgwwWo8BRgAz85QCRUka5lT9t0EvljlVO+LVCF1QYh2cyaWG9TbCjF
         pNU5YsTzN2OmhfBnkIYVCGhV/FOUXx7ivWnQpCmf0qvBwrJIKVALfRqJOyTRUviEIO4V
         GQBg==
X-Forwarded-Encrypted: i=1; AJvYcCWhihkKDcMZWx7twOc/5/BX6x1hunj/uBXt2Br85j0dkSveovMP74BPBVtvk47iD5/gtxy2b/V7Ie+uWc8qivm1Usz01AuA
X-Gm-Message-State: AOJu0YzJFfjLag5UTkE2O15ny99YhWYBX+ZqVT77OeOCirvlBRZFZnz5
	LkM5e9PtyYKjdhZygoXDahQxm+osYtkBNdDBHQSZ60TL9qmlIhxy9kzS0uS4h/eJy3kLulj4C+C
	/TnY0bQaj+pE92gBe31Vyf7eqkV2b9Iv+8aahiVFj+46Y0Mzp6XTyaw==
X-Received: by 2002:a17:903:2352:b0:1fb:80b9:fb8d with SMTP id d9443c01a7336-1fed933cbd4mr46866815ad.56.1721953637529;
        Thu, 25 Jul 2024 17:27:17 -0700 (PDT)
X-Received: by 2002:a17:903:2352:b0:1fb:80b9:fb8d with SMTP id d9443c01a7336-1fed933cbd4mr46866495ad.56.1721953637116;
        Thu, 25 Jul 2024 17:27:17 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([43.252.112.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2fc46sm19994675ad.207.2024.07.25.17.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 17:27:16 -0700 (PDT)
Message-ID: <c774b733-35e2-4060-b86a-3804580d6acf@redhat.com>
Date: Fri, 26 Jul 2024 10:27:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark
 logic
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, richard.henderson@linaro.org, imammedo@redhat.com,
 andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
 eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 npiggin@gmail.com, harshpb@linux.ibm.com, linuxarm@huawei.com
References: <20240725145132.99355-1-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240725145132.99355-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Mexd83thh/kT

On 7/26/24 12:51 AM, Salil Mehta wrote:
> Loop should exit prematurely on successfully finding out the parked vCPU (struct
> KVMParkedVcpu) in the 'struct KVMState' maintained 'kvm_parked_vcpus' list of
> parked vCPUs.
> 
> Fixes: Coverity CID 1558552
> Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU {creation,parking} code")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Message-ID: <CAFEAcA-3_d1c7XSXWkFubD-LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
