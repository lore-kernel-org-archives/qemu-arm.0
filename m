Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp361897njb;
        Tue, 13 May 2025 01:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWDrr2aZJTlh/tksGePyjIH0/WN9D/7+7znGMgwOF22n+KnMrJ9AJOhd1YSuKW44iAfiq4mVovs+Yir8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFVTxuKd5i4zDHHK4YXtbRF3nQP0p8dMOdcJ15/inrL5dtHb1WUbbnPHzJ3mr1o4ym7yjC2
X-Received: by 2002:a05:6402:518c:b0:5fe:431e:591c with SMTP id 4fb4d7f45d1cf-5fe431e5a05mr6271539a12.22.1747124233792;
        Tue, 13 May 2025 01:17:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747124233; cv=pass;
        d=google.com; s=arc-20240605;
        b=i2nX3Peu2IwdM+omWjkeLMeRFrGDLTZhV7QzQmiHt9nDZ9WjQ93B5Zc9jBzPqkwOk+
         kvl4lG9WKvzNaLGUQj05SfLthjvvSqa0cuwPp38eOGXCBaFjMtPftKdQZvUXsLlGIwMz
         TV/NQsmU3NvU0TUxez7mgzb6CXfsa3Es3AFmLyxc1Ieza1BDtN0JC5K7DyKfcZXScyra
         kRzofsPwx3+mJoFLBFT/K3uD9SZ6nBNDViwqyZZWSv4G3GirGQuFF2SaSBtysjcuAwQG
         MJBGgZ5GDlkol8qkGcF+YVpAp+8Dha1kAG8M/jsOtX+fmguXU5drP7DGgBYXtZIfspJL
         D7kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=TtiueEWiZviwIh7GeF47XQVseYGD54OAElPbnCaybHs=;
        fh=OTXSBrDApQib+ID2JqYSozxrgQNkTnrzhx34gsy/rcU=;
        b=O7LBKDGQFgzgoxl4UMieJwvTSkxz8zNvw+ujsOdMjxjqO2qTSWNqyta+zTSWIDM9Dn
         38/WKoVpqT47DmurlOSuEBjyO89wTCAN6tud0PGVnd/njgtu3vO2eAs8JUw7V0Ix2//s
         qmjh606/8bJ97tno10zQbWYisaxxWMTh1B62Otgf/9tMdtZHDRPvW1YcIbLMolv0ltZ/
         xVjapVtNfkC7cQcTjtGKippvDPIw0Z6jCNeV2QsEG8jgOyQ9M2aUt64HFK2oUBLQpPR6
         /Wa5eHL/CaODjEczqVDs4LAfqREoLcPLLT3UXtgYdDRNXo5YeE8GBWNImS+mU9r+QAXC
         Eywg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AKJnTuZ2;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fd1777c2a8si4373930a12.555.2025.05.13.01.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AKJnTuZ2;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46304-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F9B61B408BA
	for <alex.bennee@linaro.org>; Tue, 13 May 2025 08:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B208E200112;
	Tue, 13 May 2025 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKJnTuZ2"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EF1F1908
	for <kvm@vger.kernel.org>; Tue, 13 May 2025 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124225; cv=none; b=h1Grls30Zbr9Hmv2OWzam9JyJuqRhKPAUTnwTkHHsgixyT8ALaOf/sAI6Fk7wyvKbSitKLdJaV22d6Y7L4r8mVbwCGc378c/vi6C0cy/ukRleMoOTBojF2NBHFbIrFxWCeVXwZbafFA710TPIq5KV6g/hB0HeANuX/FyYv3Jclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124225; c=relaxed/simple;
	bh=XSDohxmXGW1A0ucXCeFWinwHu31WVxdeQUdpLHShoNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c57JuuoXo2spD2OSEvG3quHH9OLdYWIY41jg1gT79x1ILW0tC1KP+dfF5IhKb/zJQ25tBPGdDW1pAeYlx5w6TKh3veCpj25XDvo2+nLX5ybEQfEeHAe9HOFUvDsAuUBQMYXKJBsRZTddeAsmE5L49bMnnEvV3ej3GAE9O59JBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKJnTuZ2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747124222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TtiueEWiZviwIh7GeF47XQVseYGD54OAElPbnCaybHs=;
	b=AKJnTuZ2Ol+sh+zfPLalhh2XcQqEipELM2YsJKtD3JkRmqWB6g0XQJw58jCLKhaG4kK/zi
	/47nPhOytJOMc4CvdIOvXswASsXYzWzUwkGILWQYkbGluJlfLnIxRViYQH7q0eWwA3YJtg
	SOjgukjHPL6eqAz+4SNf36pyQkczOKQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-7bSvCSJGMSuiBuKo9eEgsQ-1; Tue, 13 May 2025 04:16:58 -0400
X-MC-Unique: 7bSvCSJGMSuiBuKo9eEgsQ-1
X-Mimecast-MFC-AGG-ID: 7bSvCSJGMSuiBuKo9eEgsQ_1747124217
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso25380275e9.0
        for <kvm@vger.kernel.org>; Tue, 13 May 2025 01:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747124217; x=1747729017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtiueEWiZviwIh7GeF47XQVseYGD54OAElPbnCaybHs=;
        b=cCladUY/oKi7ErmrisOLv+8B64CrxGAh9TjLCROhomvwEgY2SQMcEtZxO1LAcrV7jO
         8IzE196JTxolxcONZk9W7i8tLMV4psVZ15cFrjlJsXqrWCSwDZaazGj2282M43+lcvYD
         rlsW2u0OZBCTzv2afl9JqBFBFR0Pkjt6s0+l8OGv/GA3xJVtFSt5BPLyxIKf/NZLavsr
         qrJwuaRAFgRD+bHOvyctOwQ7Wx+qVpHtRWfPZzngfjZHAcm3NtTJIeAVNps6bI5vzZy9
         ULHG/j8YL4x6hSuRbHvguSWhz00hMuWaWyJW3/Rh/1a30vSCXwFdQ4HWZEjqlRRjSCyb
         Yknw==
X-Forwarded-Encrypted: i=1; AJvYcCWvLvO5AQLBkGdzY6muW+m3t4fY500eq0VfOx43fF28rH0/7PKT4TuNiERXlEkoS5/yK3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9QVytuek25WpSZJYcsUtkELFQtq7MX3tWLZThDy+/xvW1avls
	uDBawQpucbO6iF+CbemCm2UVllQqlFJxkUHlSJq84qWkGir7RmZ1RuCOJWXhSeU3ohOKBeDIeeE
	/YbUW54cPykOfUXB31ByWClC7fUrqPdXdokMCGgknOT86oBKHRA==
X-Gm-Gg: ASbGncuNhwhpc/D1rAYWbfK+HNAhMNuZMGlC2zgmj7YgIDJeddE6/3lXTJ4ruLmNdBa
	nwzn6w1USjozb9/DUly+RBdqvSFx0YFnNg5MNAQ/ZwDmqEIUKTF/GMS562W+gOMketjnqiuNrCb
	da+D3/MX6Fe/T9WQ9AOkVpEOCWFfhub5aGXR/sgeX4ip0PvED+6Br+1ie34KE0Sm6zJhOHUCRNJ
	GFZenUROXGlJQ55eEOFj6yREPrkj6KutN9ZQoTYdRwqoeQ0NHHbjfIx/Mnb7+htzhTq1tAHenaA
	llyn47jWKh9qynBHDrrz21HwRmGLhi3ggq+fs34AZNw=
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr5897792f8f.28.1747124217064;
        Tue, 13 May 2025 01:16:57 -0700 (PDT)
X-Received: by 2002:a05:6000:1a87:b0:3a2:6b2:e558 with SMTP id ffacd0b85a97d-3a206b2e7cbmr5897756f8f.28.1747124216678;
        Tue, 13 May 2025 01:16:56 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-48-129.web.vodafone.de. [109.42.48.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2ab2sm15094625f8f.46.2025.05.13.01.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:16:56 -0700 (PDT)
Message-ID: <fee40b62-a98c-46d4-baf1-d108da775c9c@redhat.com>
Date: Tue, 13 May 2025 10:16:52 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to mark internal properties
To: BALATON Zoltan <balaton@eik.bme.hu>, Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha <anisinha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com> <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
 <CAFEAcA-kuHvxjuV_cMh-Px3C-k2Gd51jFqhwndO52vm++M_jAA@mail.gmail.com>
 <aCG6MuDLrQpoTqpg@redhat.com> <87jz6mqeu5.fsf@pond.sub.org>
 <e5a305cc-4c8b-48df-99fe-539ebd9b72f9@intel.com>
 <f342557b-e589-f51d-cfd8-04f97e9c5efd@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <f342557b-e589-f51d-cfd8-04f97e9c5efd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: UgZCpMvrqD8B

On 12/05/2025 16.41, BALATON Zoltan wrote:
> On Mon, 12 May 2025, Xiaoyao Li wrote:
...
>> We need something in code to restrict the *internal* property really 
>> internal, i.e., not user settable. What the name of the property is 
>> doesn't matter.
> 
> What's an internal property? Properties are there to make some field of an 
> object introspectable and settable from command line and QEMU monitor or 
> other external interfaces. If that's not needed for something why is it 
> defined as a property in the first place and not just e.g. C accessor 
> functions as part of the device's interface instead? I think this may be 
> overusing QOM for things that may not need it and adding complexity where 
> not needed.

Maybe some things could easily be simplified indeed, but for some others, 
it's currently the way it's deeply rooted in the logic of QEMU. Have a look 
at the hw_compat arrays in hw/core/machine.c ... it all goes via properties, 
so there is certainly no easy and quick solution for this.

  Thomas

