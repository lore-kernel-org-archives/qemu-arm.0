Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1503094ejo;
        Wed, 13 Dec 2023 01:42:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHykSEY/e0xb/a1anjUgNM99azZJnsf8mAmrHOaIBp77E5im9IHPPQiuglLPJaytBQjJHtA
X-Received: by 2002:a2e:9403:0:b0:2cb:27cb:3d7d with SMTP id i3-20020a2e9403000000b002cb27cb3d7dmr3384508ljh.84.1702460575052;
        Wed, 13 Dec 2023 01:42:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702460575; cv=none;
        d=google.com; s=arc-20160816;
        b=fznEH0+o/O5KnBZ74w0v+5OhfvCKEdgbhL5yOSODDiPLud2l2ZjOZ5bN6ccb7kJ8Py
         XG1V70tl95ciBXZDJjmB53QOTOrMiH/5n+l2L30CoAZVVwWPG9jk/96cAvN9Tuzgbyd0
         9KIE4yBIcluBsjXoGJRXmA+QS7J3lYkXjNx7r+vKdxS5hAPIMkcTZGjD9EU+r5jkPgZY
         mkHXeS17nriaEGBTPZ2RoHI80fViN3HAlgBSBt+Td28QYUdqNKPTuc2zyf9P8Ewf0UJG
         sAi9uovhxonC54cqRcXHBuHUi63fKpWhh07bSJPryw5oSYX1ivyWWPHioV5QIDETemdc
         3jFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=K853PDx7iHxwDMRe2s2uwXiHrYbBJ011260FxoeToU8=;
        fh=28yGS3SIOs8TS4/UaHs3T8z4mCqBo3XVBdDLWztEuAM=;
        b=pjiC/XIs1dqyB/VZhcADfH8Xhs5JO1QDAZIbo/zi8N/joEA1Z8W9ECJbM0FLxhSdeq
         7gfxBsLiQGQa7waW3CUnG5eZ+5a1gLfqav97sHRWq1Jp1TAtj0i7NCH9TQURJXZT3/cN
         uyB7YzQGZTimD7DcstuTXGblOetOkbS7QrCzZfy1Yu/xeXsSgMC2SyAYEAx3h207Xl2J
         YoiRfF2uZ2WCsWWkNaUKc9R2nzV+5mKF43kZEnSYkZiM96ZB9USSJV0egWXgRkTMkSD1
         81JPdm3FhLfMz4QtFZB3bs7MTU+6tawov7wS+HDIi1tNpRM8eMs31skGjk863Jfx44Mx
         nM5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzaQhbem;
       spf=pass (google.com: domain of kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id f17-20020a0564021e9100b0054c923c76bdsi5181671edf.302.2023.12.13.01.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 01:42:55 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzaQhbem;
       spf=pass (google.com: domain of kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-4312-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B552F1F211C8
	for <alex.bennee@linaro.org>; Wed, 13 Dec 2023 09:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A0AB219FA;
	Wed, 13 Dec 2023 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzaQhbem"
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC2FA4
	for <kvm@vger.kernel.org>; Wed, 13 Dec 2023 01:42:46 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bffb64178so7845847e87.2
        for <kvm@vger.kernel.org>; Wed, 13 Dec 2023 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702460564; x=1703065364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K853PDx7iHxwDMRe2s2uwXiHrYbBJ011260FxoeToU8=;
        b=dzaQhbemb+bWejsyz7bA2zfzO9+JLxy59b5XULf8LPBybg2JNRpZGltxO4cqsVbY7S
         o8/f7UCH5yPpiIkOIXa5/Qe4CJs5rpJgEj44C8zTwSW07XxJ+0y9zLYvnFlDoQ9qfOaa
         ofJBD0tawdAltN5G1JJGFY0FTGkBp2mBcwe/wq5RyY82isqfPPIsx4mvtBYnPRnBCHiG
         q+9lDX4N0b+UtKrV7QI2qjgacqA87NIBJlgA6qWaeBNDMv+fs5IoBTo/x4S91ObuM1I3
         JZPYO0iDmQQTrh0qDO1satAWrOoNlMRhXzjPfJwhucA794OtZVFLnV/P695MuBcHjLPZ
         sWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702460564; x=1703065364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K853PDx7iHxwDMRe2s2uwXiHrYbBJ011260FxoeToU8=;
        b=s5MjEv58IFnOyzz7oszxh2HAX86P29y6GhfrQf78DfiHjjOAAjAPWR364ta+XNOA7t
         kUG5SAkCgz8kuJtppOJVXA4iaEBVu8E0XsAX+07Y6mBQ9MTBZLMq0d/D3HI+kjruqQxe
         rbDiUwXzs8bybkyfXj3dKTSR/rlDobFZO9RuSAA3rC7Kn6bYZCFZXTnk+Ki+nHdJjul8
         MkAoyzBzhGswkEXL3Ctypi9F9VHb6Cv/cG5/5bZxDzLViudW4aGAMSR2TYxt46SjB7hH
         /12QNolftJPy9LQaXChlrT89yAEfISpQpmbyQrBiAaHVuZmo/unUn/sOF8vOWcfB9YnY
         E2Sw==
X-Gm-Message-State: AOJu0YyDOoQPgKnBamgCiofLLt1RwiYWuq8ruSY0X6yuDSYaYN0svUYR
	mLqkGqOCVNuHmSyGtIB4PHG6b3IjdVTZubVw1BfG9g==
X-Received: by 2002:a05:6512:ea3:b0:50b:eec1:2b4 with SMTP id bi35-20020a0565120ea300b0050beec102b4mr4700825lfb.79.1702460564574;
        Wed, 13 Dec 2023 01:42:44 -0800 (PST)
Received: from [192.168.27.175] (234.red-88-28-2.dynamicip.rima-tde.net. [88.28.2.234])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d608d000000b00333357a77c4sm12791087wrt.34.2023.12.13.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 01:42:44 -0800 (PST)
Message-ID: <e4443aa8-1b36-41fd-b1a8-6ed7ddb2f130@linaro.org>
Date: Wed, 13 Dec 2023 10:42:39 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 00/16] target/arm/kvm: Unify kvm_arm_FOO() API
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <CAFEAcA8S7Ug8uFpvDO9FarLpLhTr_236H8gOK=dEOWQZe-3zgg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8S7Ug8uFpvDO9FarLpLhTr_236H8gOK=dEOWQZe-3zgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +GGaMZjzt8Eu

On 11/12/23 15:36, Peter Maydell wrote:
> On Thu, 23 Nov 2023 at 18:35, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Half of the API takes CPUState, the other ARMCPU...
>>
>> $ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
>>        16
>> $ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
>>        14
>>
>> Since this is ARM specific, have it always take ARMCPU, and
>> call the generic KVM API casting with the CPU() macro.
> 
> 
> 
> Applied to target-arm.next for 9.0, thanks.

Thanks Peter, the only change I added from Gavin review is
on top of patch #3:

-- >8 --
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6fb8a5f67e..3abbef0260 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -148,7 +148,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);

  /**
   * kvm_arm_add_vcpu_properties:
- * @obj: The CPU object to add the properties to
+ * @cpu: The CPU object to add the properties to
   *
   * Add all KVM specific CPU properties to the CPU object. These
   * are the CPU properties with "kvm-" prefixed names.
---

