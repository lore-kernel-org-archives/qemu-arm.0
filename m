Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp752450ejt;
        Sun, 26 Nov 2023 20:27:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjv+x11J1KXHZ+X+xYXjYsFL7p43nU1pNrK9j2sHnLwSBHHI0hZGrb7ue0wP6FCX+uo/xb
X-Received: by 2002:a05:6a20:4415:b0:187:b16f:e779 with SMTP id ce21-20020a056a20441500b00187b16fe779mr12737954pzb.5.1701059278637;
        Sun, 26 Nov 2023 20:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059278; cv=none;
        d=google.com; s=arc-20160816;
        b=oVTmzytvPDa6l1s4cDpfDN/OtM3jhKsvXyOhqXoL68HohNFI/QNiIT1DlUxSn95PkH
         JgKoj6iaol4KMw283hZcT3TDMNavSc5kiqgqp4j4ycfdgIQCa8B1uU7I4d+XQe5BFEPQ
         foHuJqAj58Qz+sTQspzl7qCkUCHvxhOfJAkxX5kPg3/byszl5QNp5l+KGTifJA4+rdS6
         bs9cX+f0mjVKq3qZVG/deo6WNExDewVSvwk6GlAxV+T9J36OLAP2esJLRk0joAjj5WC4
         WTGQqnozeCB0AAVXzXtnotYI1gXIbHHtqJPgOpE1pU/99PTKkQwPKoeUGxjoE+PX1uL5
         fEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=jvCVTxjOkxUOHLZp/16U9d/S0vtQXSNNB3qTwVNhrGFLJCcQmxIpVlXEVsIK1qNeKQ
         MpxTcXzQTiJVuSDk5pfiSIMc7k/qLfV3QCY85ynuwAcw2enumjNXDktTAdP4pD0Fwnsn
         9Lruv1yToCK9LedGwsNYoF+VCqLDaqqOIYyehD9Cu8U6XKhPoI7rNydxS6RYpaXQISWo
         f99LGiZToJtfRAcDeZY6f77KT3QuuDSj4v33VjCvhF5kiYtqyE6di8810DRshPw+NO5/
         OcIpZhWyHEPSFE8nYO59JGFeEZLDnRyTF00ddlpX5fO1qitxaK/C8oqY5D6n1kgA9/ND
         lZ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxY9b3s5;
       spf=pass (google.com: domain of kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id b22-20020a170902d89600b001c9af7debb2si8688972plz.525.2023.11.26.20.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:27:58 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BxY9b3s5;
       spf=pass (google.com: domain of kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2478-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 856E3B20A32
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512AA5672;
	Mon, 27 Nov 2023 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BxY9b3s5"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9713CD7
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
	b=BxY9b3s5PWNLthscGOpW3SKRGWj32qNEJ2Ja14KsM1Dkze+OjSEGXtOswErwcarLB6VaMN
	Iz/UL5seoJPbNUySWlZB3MZ9JkHOBewhuNyJKM0gtEfKmbnMf59wFIgRdFJemxGWHfgHDQ
	hXr4jS/C9Eg9PAEKgkDELKt/upmeK3o=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-Nx6aeQkHPi6SzIw_6ikZYQ-1; Sun, 26 Nov 2023 23:25:53 -0500
X-MC-Unique: Nx6aeQkHPi6SzIw_6ikZYQ-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6cbe0378d0eso5412418b3a.3
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059152; x=1701663952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
        b=WoMDkMDvf3v6qJDOPVSzzdbJsrf8CAt2nTzqwC8mbjIshFdR/K7auZaqAa8mPiRy1L
         g0xL42HNHX4+VFndJHMmWediMhNvHPUeW5HuAj0KmVZZ7NaoA4OTWKa/xxn8Z4hCjDK/
         fxyjX31HdOn8XsQmJIJh3eb6RySwm+1ymWUpC6KRL2w5dbGk/54Xpx2NUd75cPxBG5n5
         4qe0xugDt3qrQGrKW6fDFsIV3xjdLULkplYaoAHOO9hijsLV3XTg2GjRqvEeZ/367/Az
         HXzBR+8vQiMQWD1piMGmawty+VXnpu9PgbntW2r7i7Sqdr6VWF8JlIWEbkdA+icMUWvB
         G1OA==
X-Gm-Message-State: AOJu0Yx8pwvOX8KT9FLMz7NnlrnFX6razDWzwwPnbohxbB69nZaQo3zk
	n1HSXPZfWQVYnPFcaotPeEa1EN8Lctz1h9Mz/uN28HzP6SoEDsLtDKZpLivzILDcQrz4d7bIqTF
	l7ThrDdMNSTxs
X-Received: by 2002:a05:6a00:1954:b0:6cb:a1a7:ebcb with SMTP id s20-20020a056a00195400b006cba1a7ebcbmr12097189pfk.24.1701059152475;
        Sun, 26 Nov 2023 20:25:52 -0800 (PST)
X-Received: by 2002:a05:6a00:1954:b0:6cb:a1a7:ebcb with SMTP id s20-20020a056a00195400b006cba1a7ebcbmr12097178pfk.24.1701059152198;
        Sun, 26 Nov 2023 20:25:52 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id m22-20020aa78a16000000b00692cb1224casm6337813pfa.183.2023.11.26.20.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:25:51 -0800 (PST)
Message-ID: <e9b5be52-fd68-4152-b7c0-b75772dfded8@redhat.com>
Date: Mon, 27 Nov 2023 15:25:49 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 10/16] target/arm/kvm: Have kvm_arm_vcpu_init take
 a ARMCPU argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-11-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nkJREmCpK4gT


On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>

Reviewed-by: Gavin Shan <gshan@redhat.com>

