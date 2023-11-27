Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp748109ejt;
        Sun, 26 Nov 2023 20:14:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE34LvV+yHWxdU4qhsBYRbEJZ34rhcu7NKjjmn2FF7ofuYNDG3lPWx0YUcTZNER6igUC7Pe
X-Received: by 2002:a05:6a00:1d01:b0:6be:4228:698b with SMTP id a1-20020a056a001d0100b006be4228698bmr11286383pfx.20.1701058454559;
        Sun, 26 Nov 2023 20:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701058454; cv=none;
        d=google.com; s=arc-20160816;
        b=TjzmAp+n3O5sVTh1ocNBHFc2KTq8m13f9RGVjrGvpXS7hxfzINsozD/IXnNSYJqYjU
         uKIoqPXEQetfCzVJF69PSbDPpu2AmOLeMCZTUTK6LIqF1la37miBrf4xomoJrrnLzvba
         U1KA9FjHzHy2bRlJS8TUSKJKllR0rVsZT9Oo3DjW5LTCimDy6TTh9hSMHiEYHB+4Qj3S
         ZC53hA7eN8r8qPQ93himZCavLbQ8YjBOCOfZTebMBIsi5mbM2srA/jKOd3VuWTsvk+Rj
         Nn8ik15Fw2WWSJ4Qi8dEOknNRoNFo1v7rhImoZqLXq0Xf+ALIwQJgoG3U/TKmgnUajtW
         dIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=55HuZwlTrXr491X1QtFyKDqXPxkmAiZuFkdy/eIPI8k=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=T88cNPfuXzq9BQnfGZIJJ9a8/LtIWgylBsou4VlOQmQe7W/2ZKRuRnKvLXatYYB7iE
         ZyukgwouSCtrtuCDkk1fKv42B7+G0yIQ2xjNzrx9Ipuz47pTx5p+YM6fx4rGUDWTJ/mf
         IdyNoaZOuUS9Ghg25VZBHvWb2eJEKIiP5lFx8tNmxM+RKPIxLEn3Z9hGKJYfgomxCUQN
         ZBEXfgx5IkJl9GXAHxsnSSIjkt32i/IqynWOE8XP2E5+FyOO2UiaqiIsRRRC3Os5HGep
         0/lX9WkQgkL6YY3X3tjPaQL0Q8X/KfO0cOTZjb/BzN1GO5AKvb+REHGk10e+siBYjVWT
         9hqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=euavnfzy;
       spf=pass (google.com: domain of kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id f23-20020a63f117000000b0059cc8d682dfsi9101645pgi.814.2023.11.26.20.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=euavnfzy;
       spf=pass (google.com: domain of kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2472-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FFCDB20A33
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1969A53A0;
	Mon, 27 Nov 2023 04:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="euavnfzy"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B0912D
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701058444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55HuZwlTrXr491X1QtFyKDqXPxkmAiZuFkdy/eIPI8k=;
	b=euavnfzyjy4U0sLrND2qcYUPXW9oljr+oX/2ogP+MsBhapaam/6VFo/1OrH5QsGblXL4x1
	MoIYto8jI09XgCkR4FCVOtzj3HV/4Nh4Koe67Qtrrhv0uTz45iLhRCOy8hxJmSdrF0xY9Z
	e48+1lD//YAhtslgdC2Td6OmMRFZrEc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-V2DVb81TM92Pdo20XIDsCQ-1; Sun, 26 Nov 2023 23:14:02 -0500
X-MC-Unique: V2DVb81TM92Pdo20XIDsCQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-285a1530b7dso1826091a91.3
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701058442; x=1701663242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55HuZwlTrXr491X1QtFyKDqXPxkmAiZuFkdy/eIPI8k=;
        b=Ic3ftUJHjLqgnyApZWN88hvmzMlqPBxtpLe9lsCw097E2B8JnnF4r/4UAJD8uHycda
         gsKCtD88ckLQ+0jxo4ml7rp3PdUTi1pJuzsWayMFzb9hqqpwdCUQKb0LZ5yTmtJ1YCop
         zKE5vnSWRGfcOc31sRAwmepEvCjiLaQt23JKwHet0DqaXvrlPR3/Dy184DC8GcYplJic
         M8R4sgGiEFdQHJAbLK3pdglbcpbobfBFl/3OVHcrIiMr+cjJ+KNb7nwaaiKd9ATg/ORS
         HEQ1xa5OZ/bmgM152JTiBAL+vaXxvZCZMYBDpIcqYk5w0V+NXGQjJVpvllwlAZ0tDhhG
         aFbg==
X-Gm-Message-State: AOJu0YzXWKEYuGKOCGWPlkEKb13E0OGZ1dIvNy2M3WSJOCZ2aPl6F7g0
	HHZGTuSZtYEJF0gryt8Ut/yDmYnsZ5M+IEOgIXJs87NGgh9X0ne0Tvhshi5jMTjNj6/AODIRFdI
	yGuTrSpVlzfw+
X-Received: by 2002:a17:90b:1e44:b0:285:b019:1505 with SMTP id pi4-20020a17090b1e4400b00285b0191505mr4170791pjb.45.1701058441976;
        Sun, 26 Nov 2023 20:14:01 -0800 (PST)
X-Received: by 2002:a17:90b:1e44:b0:285:b019:1505 with SMTP id pi4-20020a17090b1e4400b00285b0191505mr4170781pjb.45.1701058441675;
        Sun, 26 Nov 2023 20:14:01 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id 102-20020a17090a09ef00b002800e0b4852sm7521850pjo.22.2023.11.26.20.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:14:01 -0800 (PST)
Message-ID: <886ab4a1-02be-4345-8881-0f29f23283c7@redhat.com>
Date: Mon, 27 Nov 2023 15:13:56 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 06/16] target/arm/kvm: Have
 kvm_arm_set_device_attr take a ARMCPU argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-7-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F0p7Q9gXIotw

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

