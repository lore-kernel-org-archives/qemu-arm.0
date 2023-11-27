Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp751505ejt;
        Sun, 26 Nov 2023 20:24:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuHjcgkMicGgkwBnnaoYnmrfUb9H3H3PG5K645PjON4qA8fsvWJRKjDdSd1V/+A/7hiMZi
X-Received: by 2002:a05:620a:851d:b0:775:d031:a0c9 with SMTP id pe29-20020a05620a851d00b00775d031a0c9mr9529317qkn.2.1701059084198;
        Sun, 26 Nov 2023 20:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059084; cv=none;
        d=google.com; s=arc-20160816;
        b=LGNrnJg42cnCUHhZIZ5gUddzPG5EuAdfetxtKCCmfLUrx5XoJrc6GX4VOnjdwopf+6
         gn4v05YMp8QcyPQuVXzrJa5TwaEAAaEW1FlrzTCVpzm1ZNTWBPSYCczglw7gCqKa8Jx5
         qK1LGNwoaIYD/mvPL2ZMgMLtyUqGyYdz1VPOXPOoO2H3g/RY2iZGLI36OaX0AXCK71pM
         2+YV74z/vM6jEYe68KGPLuTEey1gL+gJCQOhQJkzKmTz/2TLClJYIvw1DnqgOuiIJ+WF
         OfEv4jnehrjCyOncE/ayENa2rDUcMBYTTH/fCqZSrx9tvaNUaWkipXLReeSdq4nXMAC1
         CD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=OY2jbKqt5/1kxrDyNtxelLcyNktzbfwx1g/D+cp7UymUOknOKLuOThWTJxkrYpeuv8
         b/j0cJKzjO7FUdgAjX+/4ROnHhUK28gR5PyAsBFqm8RZ44tY2wRKOUV/PMpcv4gNXIHO
         DIhDJ4ObXiiFccJ8KI8yHQbSgHRMWdDqTZgf/bC8a2HBQ/lGfp4OJpS4c4xs+yJeOZmb
         M97I0ztNRVmVrmZu73bBtUdpo/pHUqCJ9rtgbqB7hVvNwjkP1lDJ5YfvvS7qwRS+oKec
         ok4VvS+mvdcym/oXnTbDh2OB1ejaJSlPjrqW71wQQVICI0z5fCrT8/V/V/zNkSI0w6TA
         zH5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TvmuOIf8;
       spf=pass (google.com: domain of kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id h14-20020a37de0e000000b0077da484038csi2139140qkj.579.2023.11.26.20.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TvmuOIf8;
       spf=pass (google.com: domain of kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2476-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6AD91C2084D
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FD45382;
	Mon, 27 Nov 2023 04:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvmuOIf8"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D540712D
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
	b=TvmuOIf8gJnw6MVUszLE88kYPgpYlm//RkBcCmVDrPzqbDBWOd7sozAfmEM/fzsbExiBzI
	wOSjmeuduUT/hsBZaXp3nZykYvQSHHVvK5wVp82V3/3GZ/ELRNEbS54O7ApGcbuR/TUm/Y
	ZP9pmznusoJfXTStFDObJU4mzNB0m94=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-HYowTSKZOPqrCwwBdsFYHA-1; Sun, 26 Nov 2023 23:24:35 -0500
X-MC-Unique: HYowTSKZOPqrCwwBdsFYHA-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6cd0a9b5a90so4541303a34.0
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059074; x=1701663874;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzPDIBNHl9MOltvsq0mdaA199GFM+p4KPfAkED3jE+o=;
        b=vHZ/tL884uifQb5rqEg2jUf74HaOX3ha/suPXHWAj6ajSnslVla96JzHFxUdh0ZqKf
         3z8LP1Wudj0mUyH9NlAGWcareY7nrzlMkzi1M/WmIc40ep/zkeS8Ut0dbfkUNzN1O3vt
         SrDgFfw2euk58xlvdYVFuNxGQWLBpfClWbceBsFrJkcyRDd5FKTUdcHa3erUL00AXKhY
         o5w0nXDRZTwOcsm3LsM6LANQP317lyI0pOAr8TIZdWjo3uSnv7BdS3dbTKA6p8p8yFDA
         9tm3vV28UK1GgwfB1RGBF46fXU2DxNVWIxR2oWR1C5DQwSSqOPz6/rlWRtV5+ljKuV/V
         paIg==
X-Gm-Message-State: AOJu0Yy5wQyGIvqrB6/mVA/m4XIvZIudbuHgarSgp/sJy9uJfwLEuhRA
	0bUsvkyjM3v8ZjDpQ9zS2L5JWDaNaxgeNxOSXbhzHBkHHuahn/RNAHCefV7j2YnpLvRHJkN3QD7
	Ebu1yNKVJXeMr
X-Received: by 2002:a05:6871:e70f:b0:1fa:132a:9b00 with SMTP id qa15-20020a056871e70f00b001fa132a9b00mr11727291oac.1.1701059074747;
        Sun, 26 Nov 2023 20:24:34 -0800 (PST)
X-Received: by 2002:a05:6871:e70f:b0:1fa:132a:9b00 with SMTP id qa15-20020a056871e70f00b001fa132a9b00mr11727285oac.1.1701059074542;
        Sun, 26 Nov 2023 20:24:34 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id m22-20020aa78a16000000b00692cb1224casm6337813pfa.183.2023.11.26.20.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:24:34 -0800 (PST)
Message-ID: <903f8425-3c49-4f21-80e9-24f208045c96@redhat.com>
Date: Mon, 27 Nov 2023 15:24:29 +1100
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
X-TUID: STs+g9/6cg4F


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

