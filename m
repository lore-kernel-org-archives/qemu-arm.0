Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1635373ejh;
        Mon, 8 Apr 2024 18:57:46 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWAnfmw6WO9NFIkL7c8CUXGkgt9nIjwg23sRCLwBgK9nbvTPsWNh3YMRzhWviciCn44JKdjYrf6yBCB5QPt/ADCTsT2j8qH
X-Google-Smtp-Source: AGHT+IEfOMc/gxP8aOjCi0Ag5VSjtizCay8fbHdBmWWhsvm5DLAHuDyESko7sdqVkG6xmQ7/1Nys
X-Received: by 2002:a17:907:944b:b0:a51:cc20:c626 with SMTP id dl11-20020a170907944b00b00a51cc20c626mr4658464ejc.24.1712627865888;
        Mon, 08 Apr 2024 18:57:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712627865; cv=pass;
        d=google.com; s=arc-20160816;
        b=PnWzhSR9FdXjGS1axWXZ3WQUHTUB/7gOL+ZY6YutE5UKMItXO7GOPKIXSYAPsyKff6
         BfSCbqD/pV7Wy20GSMaR21O1dM4P0Yd0XUT9L/AEMkZW8aVAdS3c351oI+uC5MaddQK9
         vrVMmKiVC256kBDNEPxjQz0MILmOO0cq3WyBXTqmMAbyAJjk1EoeDCGAK0aUtxq8SNPK
         G1gMKfoJkK6pfwu/Z7bBJ1bPDQPzofrplrFqw8ugvhE7YFbGl24uwGQZqiONdTIOdg47
         pchfgrbPlfi8z4cirsauLY4b6lIdAuQR3LIVzLqc9bury/qS75u2/E/F9AjT+sYS9IWO
         Dp6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=K+42ipXqwQuXXtOk9qA2zLETHrzi/w24r5QbQrZ73KA=;
        fh=BklyXzj4MJhFCxMNUtDcW7Mptl9Z5z/W+jPtCsrpVEc=;
        b=Jjhlg4na1AASMpXT7oqWIURqubtqq0ilvcvYvAdXFQquA2a6I/0gp/S8Hocd7SSmzj
         Wkad0CO1+3Jad2QClH+Q45uJY770Yiih3m4gdJM6urJz26okVGt9NKbkmVmMwzzqD0Nb
         Vivzf5QPeAIoFx9TVW24aBVJfYV71vzQRAaB80Hu1zHh2NYAKfZl5aiFDo6E9ponEfNI
         ByGWtYuSaroal1jxyBDqAS2L6xaEx7Irc2KSuEOk2YqBdyg1N5HI9thd/zTSLz30q94G
         9QqW5I3uxU/ZQ1P3f0TWT5IFoQF7U6Aex54H+HPp4VpUntTM0Qo5sMwLzjluxDiXx+CN
         aDCg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R9lw45KT;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id pw2-20020a17090720a200b00a51c6b0cef3si2348822ejb.962.2024.04.08.18.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 18:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R9lw45KT;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-13946-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 966631F24D74
	for <alex.bennee@linaro.org>; Tue,  9 Apr 2024 01:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BFF4E1DA;
	Tue,  9 Apr 2024 01:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9lw45KT"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF4F8A0
	for <kvm@vger.kernel.org>; Tue,  9 Apr 2024 01:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712627861; cv=none; b=il2nSDlJFrX8+1ZPCKlea09GblV5SygyKnIegOWULndwijG0M0p5MajxZhIbpO3OE9TcMmYzhgzH52R6AsoBAmKACz7uRGsK3MAoEdCEqS9aCIjPcfLkEFjMH76RoEY6fw2bbZ5LRyK7rgNlIbjqsmOpJA6sDWKfQoDmmn1cndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712627861; c=relaxed/simple;
	bh=jjIrK8aXDT5zHvMeKovJBym8BsLDqV8dNwlJMp4W3sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KH1sllEwpCQPtDja4tG9jTaHLOtdJTkDcntUAbyYGa71AYBHKLcgZaXwCAPypI6Tx35I9A/tOgaYOcpKu2jGjd5RmRBCeiJXoz91opev6ZiDlKqcBHeBW9Kl1xdb4M5OkCnBUQqIXGE8Qy1+1Z8SRv5qP46HRfQ9OgPmD7NKHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9lw45KT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712627859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+42ipXqwQuXXtOk9qA2zLETHrzi/w24r5QbQrZ73KA=;
	b=R9lw45KTP9G01Khm5EE/FGn33cP2nwmvZTx5/o67yaRyfD1in7h27pSvbP3DHCgSTOfR+S
	FbMMqAvrlB+aX8uGfZlYaHOWs46DPaUeyj32bB1MFNl7XfatbvhJJaSwKLCw0yxXgLXyOv
	3PnrPVWCT7/IGwe/v4fSw3xfZ3rs/lQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-1gWp5Y1vOSSOZ7gYgSnh-g-1; Mon, 08 Apr 2024 21:57:37 -0400
X-MC-Unique: 1gWp5Y1vOSSOZ7gYgSnh-g-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6ea1701d859so461432a34.0
        for <kvm@vger.kernel.org>; Mon, 08 Apr 2024 18:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712627857; x=1713232657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+42ipXqwQuXXtOk9qA2zLETHrzi/w24r5QbQrZ73KA=;
        b=iQHUClCGYjDb8F6YeRNNv5Vavb7QyqDRhKw4RxDNuHTwaIbpyWeOoj0ZiTowJAWEEm
         pY9mMEjsu+ozrXemI6hPe5DBzY2vKJg6pX1BxYDVNmZTB8lq8ZOv26AFvM3f+MvhcIUv
         dvyp3DSEAi6vh7CMWtfvYOXbg87iLImatUbBV26OvOW+zSOiOPSXkNbDRs8Rjru+m5jf
         W5qGkWT0swchMJ3nx3gqv21Onr9AqiHMMAliYkxnPk1q7LSMmmKIGM0Nis7GOUvui6d1
         qN5vkqSDpatOZ+TlheRRkDzoXHVaHuG44rXRSWVUlqH2kY+jrVqsnb4Aa11rIczSOJ+4
         G9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK+uBwepKbtIEDC2ZBg6Eofko1+m2XybgOea55dJfLXrsoYLGeygpaY8O/+FnXojlemn0TgfjGyherf7IT3lODc/gN
X-Gm-Message-State: AOJu0YyXiZjdD5CQJDDT39B/ZIvd7Bw+YqLVieaAOhl05YUvT1naX/Za
	/m+x5Z576uA3CX89rYcNRXcnczIWxIZYx2ONY2xmLh4iqaC7gdySBAzkg7PaEdz6liTeZeaJD4K
	QUFmoAl27xiUWS7oTbeSZwZ5TZQoABAuFl+x9pd2ZvarTI+v2UQ==
X-Received: by 2002:a05:6808:14d3:b0:3c5:faa0:64e1 with SMTP id f19-20020a05680814d300b003c5faa064e1mr3185254oiw.3.1712627856918;
        Mon, 08 Apr 2024 18:57:36 -0700 (PDT)
X-Received: by 2002:a05:6808:14d3:b0:3c5:faa0:64e1 with SMTP id f19-20020a05680814d300b003c5faa064e1mr3185243oiw.3.1712627856647;
        Mon, 08 Apr 2024 18:57:36 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id s129-20020a625e87000000b006ecf6417a9bsm7505819pfb.29.2024.04.08.18.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 18:57:36 -0700 (PDT)
Message-ID: <823e1cdc-1db3-4caa-8864-6eaead31da31@redhat.com>
Date: Tue, 9 Apr 2024 09:57:29 +0800
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, armbru@redhat.com
References: <20240312074849.71475-1-shahuang@redhat.com>
 <Zf2bbcpWYMWKZpNy@redhat.com>
 <1881554f-9183-4e01-8cda-0934f7829abf@redhat.com>
 <ZgE71v8uGDNihQ5H@redhat.com>
 <46f0c5ab-dee7-4cd4-844d-c418818e187c@redhat.com>
 <ZgwBvuCrTwKmA0IK@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <ZgwBvuCrTwKmA0IK@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aPZKVRoUhpq7

Hi Kevin,

On 4/2/24 21:01, Kevin Wolf wrote:
>> Maybe I'm wrong. So I want to double check with if the -cpu option
>> support json format nowadays?
> As far as I can see, -cpu doesn't support JSON yet. But even if it did,
> your command line would be invalid because the 'host,' part isn't JSON.
> 

Thanks for answering my question. I guess I should still keep the 
current implementation, and to transform the property in the future when 
the -cpu option support JSON format.

Thanks,
Shaoqin

>> If the -cpu option doesn't support json format, how I can use the QAPI
>> for kvm-pmu-filter property?
> This would probably mean QAPIfying all CPUs first, which sounds like a
> major effort.

-- 
Shaoqin

