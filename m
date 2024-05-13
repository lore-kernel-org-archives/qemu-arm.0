Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2205200ejb;
        Mon, 13 May 2024 06:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDS0aQSdZ5eiF/SPL29292zdhPlqvX5RXdTdwZv5bOeF0N3jub7gnMQj+ofT4KzSd5iwgqs7dpHu6M8HSa2j0fHFDQKsoQ
X-Google-Smtp-Source: AGHT+IEMt29Pw/NAvceUV0aIhIAUloVnjnxm5cXxmQE1w3xDtJT8ti4+Elft6aqrc3qwgO3xlt7N
X-Received: by 2002:a25:8111:0:b0:dc2:1f53:3a4f with SMTP id 3f1490d57ef6-dee5b0d3880mr9989473276.5.1715608682708;
        Mon, 13 May 2024 06:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715608682; cv=none;
        d=google.com; s=arc-20160816;
        b=Szk3BNRzaGJaduJF0vIGdkqaD/RmuG33DgS1JcsQBYdJ+uEgObzry+j76wMGznECl3
         xu9qHVc9ayjK+hvo+026rkZn9pU3nspMS+o5eS15dJ/yzsaNLs1xRyMRbZeuuaC10B+9
         DmiyAR0GMWCm6rg0pb5cOOqC/yR6HtuHY43pcd/JtSk53RCBbnlgSY2ouEKDz2mvrmEt
         5oZ29jZTW7moowEQ4khFW0fzZffcLpYDksARH+FMnX/ajmY606Unhn5ucwwMaaDCWjFr
         dxB/98NGLVxwBmQXBVaMzKzujxrczzdh9M9n/EEljDymV4PwsNA9fzO2/vHj6RSXzp23
         HzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+VNh/kHYnh/7Z34zKfP/vR99iIquYdkKDu1MTgWSTIo=;
        fh=HZiYvpWh3hQ0p7t2cMD/KvA3QTzbAdnrjzUeVNUWMKo=;
        b=m9sCC2GtQWEniFVtYBbyRkLYJaxjlTK5q8ofLgfcPDt9bSJWRwwVAAHTmcwGbITluu
         zPmlKbt8FZ7KwuajOCcYduIi/qtgx1ZQdPIUbjx8a3CYizKYr9MPYslikfO7fAq/ngy9
         lLC2GtpAAT3JitMJJ622xflDTxwj8Jj3DDc22DqLn192n6omVRQOXfMq4AXlILsGztTP
         F1KazGpXTRaK3MXzfuklyzZQZrVzCOS9ajectbjdbIHUC/SEp0gnLBKqpgjXDkG/SN8u
         /x/2ooyYBkx96oswDFjx7S5W31H7cPZI52sAw8zXoTrosMfrmCtdSCi26F6MSGe3Ttxd
         N7TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=6oAI7d+s;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd3825299si4590245276.258.2024.05.13.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 06:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=6oAI7d+s;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=+VNh/kHYnh/7Z34zKfP/vR99iIquYdkKDu1MTgWSTIo=; b=6oAI7d+slUEQimBzi7y3XdyGeq
	vfL8Ia5DQmgyFsMsP573P40VjC1GJdGxwH5YvQma0ZKDRu9QayBg6HsybJ5w0JkwqlaKRTmiNG/sY
	PK26o0dpNvGvoSvd0ogEmyXI+m4YRI9GCGG8f/SDuwxtdwgmxusvFFnwo7xzUzIaMjG0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1s6WBX-0005GJ-6w; Mon, 13 May 2024 13:57:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1s6WBX-0007Bh-00; Mon, 13 May 2024 13:57:47 +0000
Message-ID: <b537180b-56b6-4d9c-adea-b3d57d188404@xen.org>
Date: Mon, 13 May 2024 14:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/18] SMMUv3 nested translation support
Content-Language: en-GB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 eric.auger@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240429032403.74910-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mBVMXGIGgzZE

Hi Mostafa,

On 29/04/2024 04:23, Mostafa Saleh wrote:
> Future improvements:
> =====================
> 1) One small improvement, that I don’t think it’s worth the extra
>     complexity, is in case of Stage-1 TLB miss for nested translation,
>     we can do stage-1 walk and lookup for stage-2 TLBs, instead of
>     doing the full walk.
> 
> Testing
> ========
> 1) IOMMUFD + VFIO
>     Kernel: https://lore.kernel.org/all/cover.1683688960.git.nicolinc@nvidia.com/
>     VMM: https://qemu-devel.nongnu.narkive.com/o815DqpI/rfc-v5-0-8-arm-smmuv3-emulation-support
> 
>     By assigning “virtio-net-pci,netdev=net0,disable-legacy=on,iommu_platform=on,ats=on”,
>     to a guest VM (on top of QEMU guest) with VIFO and IOMMUFD.
> 
> 2) Work in progress prototype I am hacking on for nesting on KVM
>     (this is nowhere near complete, and misses many stuff but it
>     doesn't require VMs/VFIO) also with virtio-net-pci and git
>     cloning a bunch of stuff and also observing traces.
>     https://android-kvm.googlesource.com/linux/+log/refs/heads/smostafa/android15-6.6-smmu-nesting-wip
> 
> I also modified the Linux driver to test with mixed granules/levels.

We have tested the series as well:

Tested-by: Julien Grall <jgrall@amazon.co.uk>

Cheers,

-- 
Julien Grall
