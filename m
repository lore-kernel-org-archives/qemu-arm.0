Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADE1C87FCA
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 21:07:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhwyS-0004zF-U9; Fri, 01 Aug 2025 17:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhwDu-0003uM-Hr
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:19:26 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhwDs-000257-SR
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:19:26 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7682560a2f2so2691330b3a.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754079562; x=1754684362; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CptNeUlPmzJxhRSJy4CfQx61s83a/WcunKZ6vxtsxjk=;
 b=T4HAbsNG172Ddtkq3uGh1InlirySy8FMpP8zdCF9UnJZ6q/3+zaEfoSwnBag7qfirI
 zyo1/auHFGxM3ahlg0iQskTPWlkWwAiClTkGHioBc0zgKnNBu4chuPW1aG7/lhV6R5JF
 B9iKNDVHUdvw+ZHs/bXq5DexiI+/XHnp4HEiZUe4wwySZRjZ20UDaRw8CcaS3sYcOhne
 m6JMIoGM5Cp88d3LNGIW3+1lGllD/TcFlAYrWbnJ/v+PGQQs8feoedHZ7NPKimSVjG52
 Dgkw9t3K802Q9YwQWKNwE/DPg7NAdZUNIAloOznle52J67YU+a8CKKiNm+FNEMfdr0Py
 M2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754079562; x=1754684362;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CptNeUlPmzJxhRSJy4CfQx61s83a/WcunKZ6vxtsxjk=;
 b=LI9vQz40pEwFLL8lauJqWS8US368SLXsW5mcfMt3jvFwZnnsTGyBjqpaqvYl/b8j8Q
 MZrywFDSFMpbtJEz/AHSO81J17xBA+K715NrY+x25Q1iny9nJs1f2tOBjpgykHesvs2T
 jbpK2hV10lPLnvED0tJ1INCKxuHnF182KL+/QugFjxjGiJb1HI5u+PiHVX66Lj+Krykl
 ffMXy53QEj0h6Afj3LVtlqYriDn1mx7evy8LZo6FzK/R0DDdT7DN0mM2kYjSrD0nh7gB
 wB4+TyNHE81O96EurBoL9lZk1unJZJR81XuRqbAPSSv31lNQv16ftg6fc+QAwX2CATek
 xuPw==
X-Gm-Message-State: AOJu0YwTyrgvlfTFxGTTDBY0fxk8qcX5o8+vz1y1Q5vNAqxeM3sPt8L2
 R2gWS7baj2cHCiJovthislJvbqPTrojROCQF5Po6b6OR5u6ZVzq8OQbioqvrzIzGxjZNM4LJdc0
 RlFRe87k=
X-Gm-Gg: ASbGnctbyW/EQUkd12TPEr8lmOxNQZJuYJZPnMiJoCpNVKulQy3JX+y/31fDMuN70IV
 OySCbKXWxNzt/ZDIMj48qlTI83hi80sXd5Ubu6Y3lkV/214kOh4H3qhzzvDhMPF3x3YNLhH34BT
 a8ZW1X/ogEJc2eAedu5KweclMINWbAqvfkM9DhhOTK3NebXf6OqkywupYrHsYuBoFEx8Tjifu+d
 orndgTwHzc3RJHCRa3VC/mwF2x/TzVi51UXBhga29dR1WcPGEKImrTsxH5RlbeY9w6YrCiDz4Ra
 nxPxq8J/hXXt7HLMW6SI5ssdK/tJxNGZ1iqI+RmbKxyJNm5mSlYwnRkZ6MMEjub97hghqNZWTHe
 5E6pZY6taL/ank4RbWoPJ9zlAxiEwuAp84ysUfn/r3xR8hmtAhkc=
X-Google-Smtp-Source: AGHT+IENmDtsjaMEUtyKwuN4Oqxn8s67iHVaD29mCGEEetaPoizsmt5U4P6yio5n7Wl6C8zBEtonIA==
X-Received: by 2002:a05:6a00:240d:b0:73b:ac3d:9d6b with SMTP id
 d2e1a72fcca58-76bea8c3e72mr1089194b3a.4.1754079562546; 
 Fri, 01 Aug 2025 13:19:22 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd05dsm4697688b3a.81.2025.08.01.13.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 13:19:22 -0700 (PDT)
Message-ID: <383bbb24-3b38-412a-8036-b29f88374cf4@linaro.org>
Date: Sat, 2 Aug 2025 06:19:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
 <b2e40787-6043-4d4c-9cbb-731d0e92e25c@linaro.org>
 <f398a65b-7b1f-492d-a612-eb3d6322ae4a@linaro.org>
 <afb60f16-5ed1-4612-ba78-d849d9fa3998@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <afb60f16-5ed1-4612-ba78-d849d9fa3998@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/2/25 02:12, Pierrick Bouvier wrote:
> My comment was related to vmstate_pstate64. Sorry it was confusing as I left the last 
> change concerning helper-a64.c, which was not related at all.
> 
> So the comment was that vmstate_cpsr already contains the lower 32 bits of pstate, and 
> thus we could save only the upper part in the new field.

That was part laziness.  By saving the lower half twice, I can simply do

   pstate_write(env, val)

to load the data, rather than

   pstate_write(env, (val << 32) | pstate_read(env));

or something, to merge the halves.


r~

