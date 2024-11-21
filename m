Received: by 2002:a05:7022:213:b0:8f:43c:4b5e with SMTP id 19csp4345696dll;
        Thu, 21 Nov 2024 11:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNtvRV2o1ard0tW1e3H8Fm54VsZegxC0hR4eUMFyUq7SFQfSa5HJpBtToRi6Eqxcd/534u
X-Received: by 2002:a05:6902:300c:b0:e38:9735:61b6 with SMTP id 3f1490d57ef6-e38cb573f67mr6677582276.19.1732215811495;
        Thu, 21 Nov 2024 11:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732215811; cv=none;
        d=google.com; s=arc-20240605;
        b=FbN9nE+//KKOrsy6eRzAkM7J0etbORXi2aMAxTRIzNbTYYgf9pNESIUR990O9q6O6b
         5jBBJmcSDCBEIQBxURlRuPC2Ng03Qb2HvbdxKJIkLv+j+IXdIoOqaNB7hsN3v2Za/zyq
         VSr9Mfn7pU5mxefaKNGcgP067uPWg8RqWgO/nwunKt1XrRU8lLI03vO7P9gtiFjapd2A
         Qh6Z98JD/NLoFMECLCaSX7hDZ1NeXwRbbV5/JzmkEcRx2iJJgnHXdHwUXm452if9M4iv
         P7nWif/pduAKVo2BEtJuwqPEtyRFQIFGBBlKqrhNg1wxQ5zKQz1l2BYwS7Z7+ONvaUpO
         WCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=IWsjYsBnacBCJXffRg4TOMqxnT5yfzq3EAuSbjWJybI=;
        fh=B8ecu/9Oh5kVb32FtTGLAXEBw4/2GsOdE+Uggv0YjBE=;
        b=lTqP3i4efTd931V8+DprH9QaeqY+PP48RWNFxte32iJdnFCO+rav1jfw7rin3EjuQG
         oP+qbN6fpQsUuZQG25htYOCricaybRPp+b1mFNirR01i+vgGAxkVBrbRPmx8P6cVv73C
         2fNpbM/d7iv9CWCP3a8cVpRwjB5CIH8VP1p0SNW9sHbvy6JZuBSxDsvDmBjzhJcTpUpH
         mbBRYAXR5O+nSd0cXO4IA8CE1vOs6K8O6Ytin84QvTg3Yb6wgBiGk8NWk0IhQ+NR7U5x
         gh86CGPBZnTYuWJh7lJPCk7aPGywvVcIyKnCBU6+HPgoWcmylCj8QDFCzGnSmeMcY1CB
         C5CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dYNWjYPs;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e38f64b3f1asi317876276.565.2024.11.21.11.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 11:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dYNWjYPs;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732215811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IWsjYsBnacBCJXffRg4TOMqxnT5yfzq3EAuSbjWJybI=;
	b=dYNWjYPs9k8314CHS+kCFSHqZwWMJgFeI/eVU+gH7x4XbBkWLNAOu3KZrrK7gU5T4pM6jE
	nMptMb4IimGJpV4s+NL8b/8QE1hsfbV85WbM+HG/0XrL4i2ZqzZ+6GgqLTn7izihZ7jPqm
	XAF2jCeB4PtOqlvtbb1HzgXQbCkZglc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-HpSr-ErfPNKzJqP0VS3edQ-1; Thu, 21 Nov 2024 14:03:30 -0500
X-MC-Unique: HpSr-ErfPNKzJqP0VS3edQ-1
X-Mimecast-MFC-AGG-ID: HpSr-ErfPNKzJqP0VS3edQ
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b161d4c422so160421585a.0
        for <alex.bennee@linaro.org>; Thu, 21 Nov 2024 11:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215809; x=1732820609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWsjYsBnacBCJXffRg4TOMqxnT5yfzq3EAuSbjWJybI=;
        b=FfUzGe4LJSQZJF0FXuBktPuQc6+kWxnHSAC5qaK2gNdUsOP5FzK2m+JGmhgSkq57Dx
         WnfsdYHPEdZGI4kpTn99wiOWWldwpSdJfZcO9ShN4wIqW79EJHrdour0AewTrJlyyYgv
         q3SChEuysBLviNunmElmpsfm/rKf3c47Ui7NjOzviilQxk+V3iFv06+gVI1AAIqg/7t0
         Om/qVb3GXVbE6LOVWXF6N2XeYwJAw9NtmLrHDThcpv99Fsa9iY2x77M0DZx/CyP1lPnJ
         ISzY6LZsb86GKoYHuHOoxo+MJXo9PRpGVKvRtEhfg2pzKx6PD/yCfUnjT3XboP64Hfkl
         BPYg==
X-Gm-Message-State: AOJu0Yzeg+yY0SvRT0to0d0XQRL1p+CJ3Uner2w3ujA92UFMUnIkjw7A
	cijy40yZMYRyeIOk+FFBnLtnwOR7Xzv98QEtTTngG7wDrkV8meQK2+yy/4vWa9GRFHQbdTnkb+Q
	tnL+VolO31HJXUy71oLSsvFQYIDN1y5paUZneYOuJbRQqtxka7SOt2TM1CbkXVw2Zn8ogU6okgD
	3rtMbok0r2ifOIGpU09ayCUYm8QonG1Vk=
X-Gm-Gg: ASbGncvpGa9wxwwuHBhMfnZQJNUXBrQoZ+1kL40bDOuue+/FKundAaFA1sG/QnL0G2r
	4vGza1hT6KK9qXC3oTW7ImQiu+3oSEKya2WJ4mQthJmUcpIWeZmnWvLnGhbGGdlP18OpfG/3HUp
	+Ui/Z6s+nOH7NW/jvdw0spRKH137zd82CoxdNMFCF42JpXMKnn1QAL8d9Jied0Gj6DWjx1KG+1u
	XSP5CV5+JH2UrZmAbCGSrnWR5kUDmhsxWeE/NEC6DpRYvYXoOJun2CpP+ac68hG16rowO47+K4C
	tHHdm2zXSppL
X-Received: by 2002:a05:620a:1925:b0:7b1:ae59:47c4 with SMTP id af79cd13be357-7b5144df608mr17491885a.2.1732215808950;
        Thu, 21 Nov 2024 11:03:28 -0800 (PST)
X-Received: by 2002:a05:620a:1925:b0:7b1:ae59:47c4 with SMTP id af79cd13be357-7b5144df608mr17484785a.2.1732215808471;
        Thu, 21 Nov 2024 11:03:28 -0800 (PST)
Return-Path: <clg@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b51415286esm8565485a.101.2024.11.21.11.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 11:03:27 -0800 (PST)
Message-ID: <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
Date: Thu, 21 Nov 2024 20:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XUcH3YoEwtNK8G8X4HIYVn4KoJ1Idx33fvnLbC_hap0_1732215809
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yy33FSWz1v4w

Hello Alex,

On 11/21/24 17:57, Alex Bennée wrote:
> This is a mostly testing focused set of patches but a few bug fixes as
> well. I plan to send the PR in on Monday. I can drop any patches that
> are objected to but I think its pretty safe.
> 
> Contains:
> 
>    - Daniel's clean-up of functional tests
>    - Another avocado->function conversion from Thomas
>    - Update the tuxrun baseline images
>    - Minor fix to the rust pl011 device
>    - Documentation clarification on identity
> 
> The following could do with some review:
> 
>    tests/functional: update the x86_64 tuxrun tests
>    tests/functional: update the sparc64 tuxrun tests
>    tests/functional: update the s390x tuxrun tests
>    tests/functional: update the riscv64 tuxrun tests
>    tests/functional: update the riscv32 tuxrun tests
>    tests/functional: update the ppc64 tuxrun tests
>    tests/functional: update the ppc32 tuxrun tests
>    tests/functional: update the mips64el tuxrun tests
>    tests/functional: update the mips64 tuxrun tests
>    tests/functional: update the mips32el tuxrun tests
>    tests/functional: update the mips32 tuxrun tests
>    tests/functional: add a m68k tuxrun tests
>    tests/functional: update the i386 tuxrun tests
>    tests/functional: update the aarch64 tuxrun tests
>    tests/functional: update the arm tuxrun tests
>    tests/functional: Convert the Avocado aarch64 tuxrun tests 

Do you think we could include patches 2-4 from this series ?

https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/

Only patch 3 lacks a R-b.

Thanks,

C.
