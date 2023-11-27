Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp742408ejt;
        Sun, 26 Nov 2023 19:59:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm47dIhdmzGFC4b1Txz+QWD92SU69+k5l2eQycxH/kQ/6GDxQgm94DKiosDGHEtzlAAX0q
X-Received: by 2002:a05:6a00:f8d:b0:690:c887:8cd8 with SMTP id ct13-20020a056a000f8d00b00690c8878cd8mr8742609pfb.32.1701057590991;
        Sun, 26 Nov 2023 19:59:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701057590; cv=none;
        d=google.com; s=arc-20160816;
        b=gVAoi4fFVvQPt0nuIS6vCLwo+VkjJD/tK5jqtzU6aoLaPAksYcjqOPWTqzpMZdBTq/
         dv1QYdv9MfIVeK8x6TFTzirwiWcXfIMRM6vFjpvehC6NwQspI2y1SQGfovYOATHVozrQ
         6h1/bdth40Lf1T+n/yOAYF1Mp1YQ1zC2XtjrDBS5AP/qHucb25gUBR9KlZ0QWGGvdCWt
         kLjDFES9eXxKc2BSVXCNCJmsq8fYUCtTPIxbmCqXk8XxRMlz6zUA4m1zratMG7VHeXN9
         0vzuUgs936TrTEoCgExNL2MZ/IZQoRXwEsy4bze13g4LXHntHwmU8E2S6Qk1bhbSMDrx
         MZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=jCO1ba7StEvXUkbZaSH8q8Y/0Tm0SlHov8qnehHodAY=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=iwZ13ugPofZgxhY58ULKBBUicP6WjNseInXEmzw6s2LG3ccqq45R10XnnylNsaddOE
         Svqc0HzsFl7BC69039qvi7aWjFgQukj73fZdoDClaSz/rNIEZV1ELP6ylXYw2VhokDpH
         ilrbQPX4MI9lQ/MUQo8zZXS0CmPVECAtzR3PXfIRH4iib0VnSSLLcjVObrRVyqCCDg7P
         aOFUHiwIdfJxvEPqXyKT/IK9u4ypR9g54bdlG2Dz8cikLMAAtcXAlomCPrZcWxAHo3vx
         qtNaRlvG7JP5oQ8eIWnX4gpUkFqVAKoXqbOfMg3RIhj/5+fsst+AN3DeC0l80MsRQKC2
         +RuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hJ9UN7R0;
       spf=pass (google.com: domain of kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id cn4-20020a056a020a8400b0057755b2f032si9052247pgb.542.2023.11.26.19.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 19:59:50 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hJ9UN7R0;
       spf=pass (google.com: domain of kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-2467-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B374B20A45
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 03:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D7746AC;
	Mon, 27 Nov 2023 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hJ9UN7R0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7483A12D
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 19:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701057580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCO1ba7StEvXUkbZaSH8q8Y/0Tm0SlHov8qnehHodAY=;
	b=hJ9UN7R00hgHi+p5y5UL1LSDBDq00bZg5ckb/Sz6rVO1vqyWPPVIA4ivADz0DAIDeWUmrS
	icuHAbTbr2dsSyN56MeiMU+XENnkQiZa/MUXZvpnGQupVS0xWPpJ4dOXNAreEXDFQv3Vos
	5yahavnWKP/OVYbEumFZ/hZ2PM0Tzs8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-q61HzMOAOF2wpU0Fu84GrQ-1; Sun, 26 Nov 2023 22:59:39 -0500
X-MC-Unique: q61HzMOAOF2wpU0Fu84GrQ-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6cba754b041so4203398b3a.3
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 19:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701057577; x=1701662377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCO1ba7StEvXUkbZaSH8q8Y/0Tm0SlHov8qnehHodAY=;
        b=kLQEzNlEiWn96dYljHL+TGHwEDdm31mjhLd4k3MY2jImx86moSYiFypOebWuwoEEq0
         HdrRAahWbxq8vV6blryE8BZYNXeQRFC4URtsQQAXnA8SlcNQVite1tO9GqcN7hivRbWT
         GjoVbjYynUDKQSenienm+ji+iSx9/3wxZJkfYPIDO0laznL2OOxIClgSeb2XNUpBd8Hv
         +H9tQq+/dgLkWbPv9CdKx3v6eaxO5QYUSOuMCKpC5zUy1857Uc6cbYoRzzm0f1J8JV6T
         shRcT57LdNUFgb8WnNSJ79ZYT8XmLTOab2beq1MpvrLC8UNHGDrnYsErAf0PyLoI95jn
         X77Q==
X-Gm-Message-State: AOJu0Ywuz7vzqXplBHjVNzisExGrnHTIOEXGrZ6j8O2Ku+N4ZilUNu9c
	6ao+6zeCLC/LvPjECgOS464jDMzEPlxFflh41j41sxMTYrRREZkWXb88GGddlq3Bt5zRIS5XWhw
	XAzIqBAPTHhWZRoBYaKMm
X-Received: by 2002:a05:6a20:e308:b0:18b:4e39:835 with SMTP id nb8-20020a056a20e30800b0018b4e390835mr10267596pzb.31.1701057577462;
        Sun, 26 Nov 2023 19:59:37 -0800 (PST)
X-Received: by 2002:a05:6a20:e308:b0:18b:4e39:835 with SMTP id nb8-20020a056a20e30800b0018b4e390835mr10267590pzb.31.1701057577177;
        Sun, 26 Nov 2023 19:59:37 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id 102-20020a17090a09ef00b002800e0b4852sm7502806pjo.22.2023.11.26.19.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 19:59:36 -0800 (PST)
Message-ID: <54e21c86-2ec1-4eb8-9c79-1ae14715beef@redhat.com>
Date: Mon, 27 Nov 2023 14:59:32 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 02/16] target/arm/kvm: Remove unused includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-3-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: m3xObk09GzNy

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Both MemoryRegion and Error types are forward declared
> in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm_arm.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

