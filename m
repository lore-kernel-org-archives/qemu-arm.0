Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp752964ejt;
        Sun, 26 Nov 2023 20:29:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlMwb7TLjfKKRTmNqqSdB/w+JjFgC3COSwcCA3qU1DxkwABVzLIroCROGenS1fQccnmxO0
X-Received: by 2002:a05:6871:419c:b0:1f9:eaa6:9c43 with SMTP id lc28-20020a056871419c00b001f9eaa69c43mr15249075oab.31.1701059362963;
        Sun, 26 Nov 2023 20:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059362; cv=none;
        d=google.com; s=arc-20160816;
        b=sHNgmxJfe4svLrvUlrQZzid3Xr+mVTAcZD6m5Kyjo9/4Y+CeTnU4v5NaLxE/Vz9nRC
         celRcFn5AT0mgs/kgHTncIw3Bij9M6nMhgrTMs+n2ByApfDiKTVXZmwtX+cIWkjTYSWi
         WvN9euV23L5FEarwCcgerNdq08DREOCXyomkrEWO1Uf/M01VsKK+iA5Uci0qVb5CkCJB
         HXdS4GrD4IqJ0gC3siKlqEQwMaVKLvoLUuBDjkKiEUnGuVeIJr7F/Yu2m5/69lMmtRnc
         hIsQmCHprQAXUQZSIQDaOWT2Ywt6yigsWkXOGiPTJ6WGvV6b0AmVWeZet5+9R+t854bI
         OUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=uTJbdB49WbhT9nfFscdktMnYs7K7t3F10x3+Dyunhh4=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=cAtCgQ40chvXdQQjC8MHzbtxlfJU4wbxkPs4MldHQ3Vg2XKIkF+LxnvE8cmejBsuom
         iqbFiTLFuKW6UkhsB43Hi0l/HRksGVegW2kUW7sdjwWs+Jl1JKQmjVgCJahLNQFzw8eZ
         YoGdiYTxpFlgji3mBRmt1a5kX62AaGrCRTagn1jR3MITRgEVPUEKXy/t92G26WTIcfrB
         +gICNfqicUslZhc3vSCD8zA1LawIyEThzv8q1iUpcyQKDey0ezxX56OoDf6PiUeH31Oo
         NaRJ2/OIwbvY4jqbXs9pRlkv01Ryx7xC6ZDKsm0vJbRXjKdsH+HzqVPMieWV7jeuTvWr
         kc/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IFpaxsy/";
       spf=pass (google.com: domain of kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id k2-20020a634b42000000b005898d648224si8899593pgl.12.2023.11.26.20.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IFpaxsy/";
       spf=pass (google.com: domain of kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-2479-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66BEA280CBB
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4988953A0;
	Mon, 27 Nov 2023 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFpaxsy/"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CA0111
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTJbdB49WbhT9nfFscdktMnYs7K7t3F10x3+Dyunhh4=;
	b=IFpaxsy/aG5sgGVk0na5PTXxDUp04JAnXu1Xt+HFTBqM0ZYZWqjHSWAWo28HbB02P5SnvZ
	WQxgUWi+8v7ENBL1DZ4Up+aG8C2P6woEE78pFXT+pCGSwcLCYd5IDyvffHnyIbCFkrHwNv
	goZhSWxJvC1Xun7UiWLYi+T20PNgFgM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-SuMJLV_-OLG72USQ6YEi9A-1; Sun, 26 Nov 2023 23:29:13 -0500
X-MC-Unique: SuMJLV_-OLG72USQ6YEi9A-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1cfb5471cd4so14085355ad.3
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059352; x=1701664152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJbdB49WbhT9nfFscdktMnYs7K7t3F10x3+Dyunhh4=;
        b=QrBi+g+cCtV6ygzT1hoO5jSKi93UYYF+kRiYDQgXKQ69pLon89Jr3ZhUmC9PQf5xjt
         8V2u3wdKAqY1ebZoF3Y5Cl3AZTb8NCPNnRhJRtwAmKCNUSdOuV3OR5KHQ5ARPxG4VHp5
         y3uFXo5dYRRu5r7t8BOpz3CO5D6wegjo07JIDE8KlGR5H6JhHifodiv8vw3Hz6y/Ull0
         apGwdKGUS1o6MSUErMxC08tkQMYt+a+xm9odcoHWHYpQqTRcF7HRZaD9HioAdgckH9fv
         vf4FyI6zSDP1V/AYlHnpeq8nTrEc89+oO8ufhkVyQ4B0GodKS2Slk8Jn+wgYKlVtXxL6
         tEgQ==
X-Gm-Message-State: AOJu0YwbA5eSlkfKf3ZK3j5Ah7vVP9Hl0zRPqZBF01ESAfWlyToRBL41
	fceNuo9HA+xjBrj3flsukzGPIejXVCvVN8M/FRmS7Djp3exrLYX5gcWiBc0miEOnZkKPrMfPueW
	of0GiIOMWd/k0
X-Received: by 2002:a17:903:1103:b0:1cf:6e3d:d8e7 with SMTP id n3-20020a170903110300b001cf6e3dd8e7mr10024129plh.26.1701059352691;
        Sun, 26 Nov 2023 20:29:12 -0800 (PST)
X-Received: by 2002:a17:903:1103:b0:1cf:6e3d:d8e7 with SMTP id n3-20020a170903110300b001cf6e3dd8e7mr10024114plh.26.1701059352408;
        Sun, 26 Nov 2023 20:29:12 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id x17-20020a170902ea9100b001c5fd2a28d3sm7196296plb.28.2023.11.26.20.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:29:12 -0800 (PST)
Message-ID: <68fd2489-4eda-4cc5-abb9-923511475e37@redhat.com>
Date: Mon, 27 Nov 2023 15:29:08 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 12/16] target/arm/kvm: Have
 kvm_arm_[get|put]_virtual_time take ARMCPU argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-13-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HVaiHkVduZx9

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

