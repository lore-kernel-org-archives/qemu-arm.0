Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2598963njm;
        Wed, 3 Jul 2024 06:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuUmvGIQdSbevd2Fn6nAXExMPtl7iBwE8uDnLFvVOUUeswZWlViyPe5gAGfryjf9Jh5EIN
X-Received: by 2002:a05:600c:35c6:b0:425:641c:5f46 with SMTP id 5b1f17b1804b1-4257a02cde0mr68243235e9.30.1720013673275;
        Wed, 03 Jul 2024 06:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720013673; cv=none;
        d=google.com; s=arc-20160816;
        b=g5FX6ljQsEiwG2hwwm9Se+wMAZr8hfVcEw1dnVnVg3PR9tUrL5niW+Gw4fi+OLc7xs
         UZ6pDoCgpwfh3trgygmj23uk/ZRLdIM3N3mhpQ//XwCK32y/bFNv3tAyJc95kPx1H739
         SHlC5MOwgDEuiYD/t6INpwfgYdBkYzR3+aODvWp3bOaUa/CL+aYUTZ+pEnTIPNidFSvz
         pPD6OvrJ0QtVglkdKkDCe5MQz2lB3n+ZafQVqNCkxl4XwaNPzf7SfwEMVnd+MeEi6s+E
         FkicqSOoFiWDg7fImXtiXeMrrWl8jAHRbEqKGW80SaJBs5Z5ZMPBBBhRA0B+WOwvzLFR
         oS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=mfZjrBnjQAc2g3737Msklio3dXfCX7+a7lHHtBciKYY=;
        fh=XpqZTunMhNMbz/ycRN9sGGztuo/sgJDoB/7fDNd23MI=;
        b=rPF4mquBlPL21/2YT7JvpZC/qT0AgBxqc0zFzhLQOAH6mIgeY6r6JmbED8f5TENhLo
         67wjvnUkeXkwIPkIOAVKvutuBPKcdgj+UhdCvuFRelDwidOdxKLXG9g/634QFC5L9yOW
         f8H185OiMnIz88Swz+dtAvFKMR12IfyB44xi09fylc/xNbeueUNm6WxYiSaK4xw5qkOi
         hp/O/WbFD9aDOuESc4d2DU1t3tZGs0tP7tPrSWxDNnUjy6RPfusnw3h4zxoXyU67/AzS
         EKSoU6jhHCJ430PiCOUPeLMf0rDjxb55Wv5rJP0bTiQiEh4VXZESsBXuF4ci6ESm7AHH
         MG+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=kXOm1Kdc;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::ab as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com. [2001:41d0:1004:224b::ab])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4256b0c0f79si70508645e9.133.2024.07.03.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 06:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::ab as permitted sender) client-ip=2001:41d0:1004:224b::ab;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=kXOm1Kdc;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:1004:224b::ab as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
X-Envelope-To: yuzenghui@huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1720013672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfZjrBnjQAc2g3737Msklio3dXfCX7+a7lHHtBciKYY=;
	b=kXOm1Kdck0wb6gfJ1SjCEZ99lovuT69IkQG6pCczWL/ENrNSQ21LTZhSou5Uq+5XxmqCPY
	haa/1oM3ox334IEZe67f7Azug9Bg9i0pEFqIxcTIdplzTrl800C/p9bZrI7EOTNS+KgFCj
	+YokTjQm0wIG/0vkpcSzuZ6llQwIg64=
X-Envelope-To: alex.bennee@linaro.org
X-Envelope-To: pbonzini@redhat.com
X-Envelope-To: drjones@redhat.com
X-Envelope-To: thuth@redhat.com
X-Envelope-To: kvm@vger.kernel.org
X-Envelope-To: qemu-arm@nongnu.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: christoffer.dall@arm.com
X-Envelope-To: maz@kernel.org
X-Envelope-To: anders.roxell@linaro.org
X-Envelope-To: alexandru.elisei@arm.com
X-Envelope-To: eric.auger@redhat.com
X-Envelope-To: kvmarm@lists.linux.dev
Date: Wed, 3 Jul 2024 08:34:27 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	pbonzini@redhat.com, drjones@redhat.com, thuth@redhat.com, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org, christoffer.dall@arm.com, 
	maz@kernel.org, Anders Roxell <anders.roxell@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	"open list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 2/2] arm/mmu: widen the page size check
 to account for LPA2
Message-ID: <20240703-09f98f39f0aa78a0beb48696@orel>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-3-alex.bennee@linaro.org>
 <28936f0c-5745-14b3-1ecf-ae1e01c5b28f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28936f0c-5745-14b3-1ecf-ae1e01c5b28f@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-TUID: LHdGmiKzIcWQ

On Wed, Jul 03, 2024 at 11:52:05AM GMT, Zenghui Yu wrote:
> Hi Alex,
> 
> [ Please don't send patches to the old kvmarm@lists.cs.columbia.edu as
> it had been dropped since early 2023. [1] ]
> 
> On 2024/7/3 0:35, Alex Bennée wrote:
> > If FEAT_LPA2 is enabled there are different valid TGran values
> > possible to indicate the granule is supported for 52 bit addressing.
> > This will cause most tests to abort on QEMU's -cpu max with the error:
> > 
> >   lib/arm/mmu.c:216: assert failed: system_supports_granule(PAGE_SIZE): Unsupported translation granule 4096
> > 
> > Expand the test to tale this into account.
> > 
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Anders Roxell <anders.roxell@linaro.org>
> 
> There's a similar patch on the list [2], haven't been merged in master
> though.

Drat, I queued that, and several other patches, and then, for whatever
reason, I delayed the merge (I was probably just waiting for the gitlab
pipeline to finish...) and then forgot to actually merge... I've merged
now.

Please don't hesitate to ping me on patches that linger too long. I
sometimes need that interrupt to trigger my context switch!

Thanks,
drew

> 
> [1] https://git.kernel.org/torvalds/c/960c3028a1d5
> [2]
> https://lore.kernel.org/all/20240402132739.201939-6-andrew.jones@linux.dev
