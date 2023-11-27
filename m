Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp754700ejt;
        Sun, 26 Nov 2023 20:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIl6PUnf5zMTTexZqyahiWW48AMQp/1FhB21bpJSj7BquyPI2xYzpjyq0EhpywgZlAzvUa
X-Received: by 2002:a05:6a20:918b:b0:187:4e8c:ac5c with SMTP id v11-20020a056a20918b00b001874e8cac5cmr14971746pzd.1.1701059662638;
        Sun, 26 Nov 2023 20:34:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059662; cv=none;
        d=google.com; s=arc-20160816;
        b=CL21/IwmOaJHoLwTzrd19AnAnvVUvzzaGMjJmaNE9uIawQK4vJrugpRUBAM8Mjguk+
         9uxacdWVtlSWELAQV1FLlUZAkhFIQxhjLBDwbS4BDq8avmUPFrNKMVhITL6w8S5GLyIk
         Y7gIQLS/0bNZZmZUhXuFVySa/ROrrk//k1kw1x7UGNl4TiE0xQi9kAcSix+zKSMhnCcc
         7haJng2389kXE4pb8g43D213LjU/g7dcpgBj2MOMVT2x0ZlLoRXwkXcG5J2lrOFpj7/o
         VVCjXNXyUzA/TKQTNn4qt8tgBjvfYkA8oljUI28iqmFnbswetgfeQ7olTyySAY+lwHe1
         e6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=gSA58iUvUBsC1b1u6GQ4O/2BKg3wGqzTJrYmpkYZHAknWH1NE5p3kWgYmBiKRc2Co1
         aRrP+pcZTIqui6bSeeEl0xzRqucUb60w9bjlLT89qDsBcrTu7mr8KeTuA5U4JUJ5dD9x
         OiAgGhf7ZGsIgsurGn9o/ZXqsu5HSk5a94pANIVbRq8y9wmKU3V91cxGz879Wd5Zpx7z
         iOFqD5PtGvUDW8ZXmI+uuegCnhdn+RjiZjhksIgMTHnJj9dG39wr8ggkFfumJCTZimxR
         1o+G6PVq69Ya2bbSXZ3nnk1SDf6OrSfvWjvv8VpYgaPCcjV6IzVJW3K0FehJSFnv73P5
         Re1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dlvQOul+;
       spf=pass (google.com: domain of kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id y23-20020aa79437000000b006cb90b336dcsi8597605pfo.267.2023.11.26.20.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:34:22 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dlvQOul+;
       spf=pass (google.com: domain of kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2482-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8279BB20A3A
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36F3C8C4;
	Mon, 27 Nov 2023 04:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dlvQOul+"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697F6111
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
	b=dlvQOul+u0OErR4MRBBe9glyKYax7R3azoT47gZZ11WcoQ6ZhlYqUn8ip1cDzauXADN6/9
	hf9D34hAjYlK28BIBf+LsLYBhL81o+hozDxh71e11Qv96n2yZYdAt0Nalgo5ov8M45HWp5
	GBvVazfOMf4cCFmfxzIO9pUj0M5sbjA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-EW33a3duMaOPXSPtK3kyYg-1; Sun, 26 Nov 2023 23:34:14 -0500
X-MC-Unique: EW33a3duMaOPXSPtK3kyYg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6cd84f397bdso1228693b3a.1
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059653; x=1701664453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
        b=pPX37LK21MpJTfDd7qzdKZMpTG6s551P5w3WwxaV3EwGdiuCto1alkQ6C5Xs51kSNi
         mjHuTsrgVJTj0LHrQjxNrCFndwxAPdLrbfOgKE6Fv30mNk0CB2xb42XAKjNyMVYmaps+
         SVZdYVYJBKICRK+JeJ7NiQMwKYd4+sGZtKeCKVtbNvfE5QhBb2OBMvIIkPNAsPax88t9
         8dgrc2oAdQTsGXg/wZ43GN7HMpEMr6FnOsJRE6r4SMZhkMjTpaR5LI+0C1Q+jU3AzVXI
         BWydzeJrCxkBpA5OGMTaGfRzun9/wfSUp8Iah4fZtdXE78jj5gusPVoYOmfAnm1CA6JD
         Lz8g==
X-Gm-Message-State: AOJu0YzAYnCNOJQYWX3mEzlW471K+06SzC1B417aONs5HMyJy1MmAJ+k
	FDmkPCw76IAT6RD/EOnRfx/LM7QB9RltsmJ5UBsinmC3AE4oyuQVVUk79amtNG0QgS8Ve4OGckY
	+vfrFndzQQEGc
X-Received: by 2002:a05:6a00:878c:b0:6cb:cc23:f69f with SMTP id hk12-20020a056a00878c00b006cbcc23f69fmr17422045pfb.16.1701059653296;
        Sun, 26 Nov 2023 20:34:13 -0800 (PST)
X-Received: by 2002:a05:6a00:878c:b0:6cb:cc23:f69f with SMTP id hk12-20020a056a00878c00b006cbcc23f69fmr17422028pfb.16.1701059653030;
        Sun, 26 Nov 2023 20:34:13 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id s13-20020a62e70d000000b006cb8e394574sm6373833pfh.21.2023.11.26.20.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:34:12 -0800 (PST)
Message-ID: <85197b61-e668-4c4b-adcf-d81e183b45b9@redhat.com>
Date: Mon, 27 Nov 2023 15:34:09 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 15/16] target/arm/kvm: Have kvm_arm_handle_debug
 take a ARMCPU argument
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-16-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: k/UvyxkqBQTD

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

