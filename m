Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp640063njb;
        Tue, 11 Feb 2025 14:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU1P0fk8PNn0Xp78mFN6ECd/VN7gn5yjMkzB6sdFPQoTxuV7acQ6I+yt5Oal7hb1KOGBTkfpKL+TNHbJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEAgHTpwVNAVfUpUCqur7WdKUhKImMQodE8cI3/+pvGxvEspJj2XUVMdWQ9wnWRyE5F169E
X-Received: by 2002:a17:90b:2f0f:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-2fbf5c0d99bmr1460034a91.14.1739313357510;
        Tue, 11 Feb 2025 14:35:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1739313357; cv=pass;
        d=google.com; s=arc-20240605;
        b=MfepVs8PPfqokr/M8ZnyNARJkJMwsWNk3pyMG2T2JaniQLY6LcJqDDEuiv+QLqBYxF
         4XR+4QolgLjuyOj3ukA1/YSITSpUrIn114ey5oifg3LHEjvapPCkFMIShzMFPJsXrvwk
         d5+QQnIKXTOvmH+GoWMKr89PKCWSfwaNyh294Uvi7oEm4R7PbNwo6oK0WA7lM4kO7zQP
         +3VadM79B3dJ9GmVjlmHKr54R4roxiUjk+qjoE59UpWSadZtj9tIx8jX1sc+AuQXcyd1
         brhA8Q+xq8gW9XLOtIy6bVSu5aOLz9/WWWE8SdebsWXzTmq9sx+Yh1jvqXbqHqaEgzeJ
         YXpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=AQmLFir4UkEGYUUsaqSF/TAOnlHne0O7Pyi3Uz6Gm6s=;
        fh=74JbBFi8iqgiihXjfquiCvJZeVGe9Wtllh2B6NUIp5s=;
        b=hYEjpdAldKT7mbpFwbkv7GIWhMQnFtEULeVkY4+8Yrkq/G7jhyhzVIlmRQ2ZdFRL1p
         UDLYUlZZBD9O0JDd8+6D9hHLDjWmrUAMd77AEwU+jauvU+qrEDRKvrFFPhZ4beRsJRdk
         AlNvdz8rkTaWNJtqUV1luseNpndiq9eKjnfkDzNREdzverJwAqAgyMlzVc5EY3h75MIM
         SIjSjWYRPyPzfWmyCArLnwZOxi+DinB+I65r0Dd08M0BPOuE39fJvtorioYH6yAgX/dR
         h0BbgGXpMAIUEy5caDP/Pmk/3sxiF+exVUxctwTHXLusTAElJOZ/+Zk4AhJQqbDQ0ORN
         CjOw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QmPSfKUP;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2fbf9adc20fsi148204a91.11.2025.02.11.14.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:35:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QmPSfKUP;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-37927-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE0B03A49C3
	for <alex.bennee@linaro.org>; Tue, 11 Feb 2025 22:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB50268FC2;
	Tue, 11 Feb 2025 22:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QmPSfKUP"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD6267715
	for <kvm@vger.kernel.org>; Tue, 11 Feb 2025 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313353; cv=none; b=FAU6aFKq8oilJYQI/haBNHPV+sS0lJWRsHASlibbdb+k3alm2zRMe5t6vAqPjFzVbAqVBTZ3ibh0j9317ILI+tNBDon4e/QZPo0dBXwQ+LkJVHktXCtisr0/fwjtFhPpAhxf80U8BYmzE3Euq5L/6lWGrJl9kZUMJEqNI+aIS4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313353; c=relaxed/simple;
	bh=Xkdp9y4dsVSdxrh44v4Max9ccE+5GLe6LAhQMb/0OyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAl2vLHq7pTjRv/CGVsY/6aJ65fghJj8y//HjxK16V99WKi8sjMPOkJCEVdfMQ8VToaRlnEgY5yVu/+xDPHt79EHfQfWv53jDYjGrGpENyd68bC3HuGcWN1imXZETwCZXG0bUBfiEt2B2G1sS/SfjTl6vJgoVAP53K/PZDnUI1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QmPSfKUP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739313350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQmLFir4UkEGYUUsaqSF/TAOnlHne0O7Pyi3Uz6Gm6s=;
	b=QmPSfKUPEzpS5S8KwQAh/2R4PaNjZ/uW5qWXA+gJSOVJhRI05zOcp8uEfixVXXGinhEDes
	g/TrqvbR+ho+iUTZ1wAoYuyGp0JEgJjfXbhnoOc9QVfS7KRo19AHIAUpOOLrgmyKJgHrfs
	xSplmJgsxXOBHVTBvCQNsaHq84g0MGc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-64K664KnMBSjiydg_jO9gg-1; Tue, 11 Feb 2025 17:35:48 -0500
X-MC-Unique: 64K664KnMBSjiydg_jO9gg-1
X-Mimecast-MFC-AGG-ID: 64K664KnMBSjiydg_jO9gg_1739313348
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3f3aa4b60bbso5308951b6e.3
        for <kvm@vger.kernel.org>; Tue, 11 Feb 2025 14:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313348; x=1739918148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQmLFir4UkEGYUUsaqSF/TAOnlHne0O7Pyi3Uz6Gm6s=;
        b=MjJzxFj/2NpcJ4Gf1Y1S1NOlrMnjshxIjHzNrqfiEWyYJ72W2y5hdqf5VKdKddlaVk
         X5NSGEKMJDg0ksCrRKITIDdWYeUVqh+oBorwCCkCBDE5oQDPNFYn7/voPni0wCaLMfc3
         dRrFKZdFPGyGNEsT+kkhd52DMD+3lsBAZN0qH6u39MRB8B7y0K7fNGWNEsIoz13duunv
         WP0zD6vU5mJ6QcFd2IzhfhyUK0BCeiQxlSqNbqqfunC5h3N+JsVVjnczSY59Ppufo6t+
         B1r+tgQ+FbBmxVKAKC8LBJJs/TbODHYIvvWh/SnG4i/IveTFjn9r53cAJ/XbqMcxFBaS
         7/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVykZV7Xe9vHkIAoQQhGSfgAr2Hybz8fX46m88eyDn73o7gCUzpskBVPqHSi/os4rXixgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0A42Wx4ooJzny438TLO0fvZTQlGklSZkBfgyFPe5WZktAXyK
	8KonMmQh8Siho8oMDF+JgjTCI9Nl3NXeFMfJD2gO0hGKUtwU/ASrqj4dwLdPYhJ57gg90da5gyu
	khxaRY0hqDgJADnVyspTDvc5wksnMvcaP0KYjlIh8wBZNrN0fCg==
X-Gm-Gg: ASbGncsyMSfSp2n+vzhv+WwR2p6BmqtarkVltC4S7j6VNOxOZ3HYA6NKc6JISthdkpi
	ZeJaTV4BM78+veoJ7fcu+3EPLi4npu1alUy3Jj47An6s0JYD+9MardMjuiF5E9ZFBLTz11CfLSf
	8H8cGzWubnW8mMveT1JBv177JsTPGjXzQxEaXDOSnPfHdDvj5QoE7zS2vL+1vWHdK70/Mg3AD5X
	MOdbQZBsV11CJOSfvsGSdhspgNiWQizDH0rN7hALCBh55CZR9pWTjFvLhc=
X-Received: by 2002:a05:6808:80cc:b0:3f3:b0ae:7998 with SMTP id 5614622812f47-3f3cd601076mr1099268b6e.17.1739313347791;
        Tue, 11 Feb 2025 14:35:47 -0800 (PST)
X-Received: by 2002:a05:6808:80cc:b0:3f3:b0ae:7998 with SMTP id 5614622812f47-3f3cd601076mr1099254b6e.17.1739313347528;
        Tue, 11 Feb 2025 14:35:47 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389efebe9sm3576089b6e.27.2025.02.11.14.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:35:46 -0800 (PST)
Date: Tue, 11 Feb 2025 17:35:42 -0500
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?=E2=80=9CWilliam?= Roche <william.roche@oracle.com>
Cc: david@redhat.com, kvm@vger.kernel.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, pbonzini@redhat.com,
	richard.henderson@linaro.org, philmd@linaro.org,
	peter.maydell@linaro.org, joao.m.martins@oracle.com
Subject: Re: [PATCH v8 0/3] Poisoned memory recovery on reboot
Message-ID: <Z6vQvr4dCCsBR2sX@x1.local>
References: <20250211212707.302391-1-william.roche@oracle.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211212707.302391-1-william.roche@oracle.com>
X-TUID: cIrMIJEKrTKW

On Tue, Feb 11, 2025 at 09:27:04PM +0000, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> Here is a very simplified version of my fix only dealing with the
> recovery of huge pages on VM reset.
>  ---
> This set of patches fixes an existing bug with hardware memory errors
> impacting hugetlbfs memory backed VMs and its recovery on VM reset.
> When using hugetlbfs large pages, any large page location being impacted
> by an HW memory error results in poisoning the entire page, suddenly
> making a large chunk of the VM memory unusable.
> 
> The main problem that currently exists in Qemu is the lack of backend
> file repair before resetting the VM memory, resulting in the impacted
> memory to be silently unusable even after a VM reboot.
> 
> In order to fix this issue, we take into account the page size of the
> impacted memory block when dealing with the associated poisoned page
> location.
> 
> Using the page size information we also try to regenerate the memory
> calling ram_block_discard_range() on VM reset when running
> qemu_ram_remap(). So that a poisoned memory backed by a hugetlbfs
> file is regenerated with a hole punched in this file. A new page is
> loaded when the location is first touched.  In case of a discard
> failure we fall back to remapping the memory location.
> 
> But we currently don't reset the memory settings and the 'prealloc'
> attribute is ignored after the remap from the file backend.

queued patch 1-2, thanks.

-- 
Peter Xu

