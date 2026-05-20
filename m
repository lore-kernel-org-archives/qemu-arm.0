Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D991CD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:28:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkgk-0007hh-MT; Wed, 20 May 2026 13:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkgS-0007MM-FE
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:26:25 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkgQ-0004OD-3K
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:26:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-836ed29d1e5so2269370b3a.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297972; x=1779902772; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gLuo/t16axaVgNDuvZNn5zkWfPM5x0pxxDbNPCoQofo=;
 b=EeftiTsGN1hTV8r0iVJiIfFVwNDrUhFz/DaI+BqRt3Zxxf4ALwWPnz+wn0qXnv+917
 XJIQ52suOmaAfWQH4H2z7oQqGu6+rI/BQkAQ4qB1u7kaBAfZE5OhAg6mCfIdBE6FEa/c
 Q53SfvW7MrNB/NTDDPZaEdFPtfTu/7fJFRDah76cd8gqX6ufIZaw3gFdHuLVyfPKZKdl
 HEq9EZMfOIAjzbUxl9XVD9dK2F3lUBdqgywFA302IQYGTHZCo4tOenkV1dHqFxi3YbHZ
 b9EGuAwZtLCiMxy3hYM5hATGJEfYt6in3T4t/LhPJrvitfgSKMmWBpOX25HDoVMJVk1P
 HzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297972; x=1779902772;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLuo/t16axaVgNDuvZNn5zkWfPM5x0pxxDbNPCoQofo=;
 b=pRRGZ+Qyr6Svw1VsQBrxRAUnGKjfGzu3WjNzHm9ABMQsocgzRzrROthi5kx+PFkkKp
 A7VAnJKBmqX2AcYU0Tf/jDdRAZulewGuNp6aFeETwV99GU1zYb9KFHGPwDD+kCl70HR3
 TYSgtAWsf+z0/f0ZHm+0XZBNaDvqwgML0mrc/VWB7M7i2c1feDkUUuA7c4h6nOuEBlCq
 g/8d+WSiED0MezMSWDLJnrNay9hSYsBmccRLRwbWKuRvTwOaTZZsZEuGs2nwbiQxFRDY
 JkMAkp7R/G0sQszqWW/7KulvHfIF0ji+2yGjyKbb6Y1kgY7blequRTkGdwIoc6MDLurd
 eRsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ84JB6FbppxcfJau0kJmEO/nNDUwSAU24vVzx7RypjjdPIpc4ksoIAjPbEKyKM7Eku8srRA+GTmsQ==@nongnu.org
X-Gm-Message-State: AOJu0YxPr+v55FWoQP34HGvt9B9tE2mEBNdaz+gskwCxt9+hgSgTxVeP
 JMMXgYZz41uLIzvwB+eSPcCDiBIOY5PWgdDAKUo1rt/LI6syjKBFd9j5osZF0ggvLg4=
X-Gm-Gg: Acq92OFDwUFycdrDOHEqQwQJi25um+ztN4u/m5wiBiUXbdNUiyoeQo3vKpYjrpDphVF
 zq++LwE0JYbCEipl4PnPs5+CdQ/Kt0urBA8ojuwqNmNCCfs9scUho56Mb1gWGFJGGbaeJ+N7Y65
 3i+GN/TvT8Fg4cQQ+aWOkPkpgrIw9GdQim6czJYoxGc8+bA659sS1wdbBDAATQszZKGIm6wgqw+
 7RAO3JEexjRWJlyOvOOWkg4BznZcu3OqKK/STFnHCfzrahQsNEDiWxzZ89+h2r7rmND7tdvS5aM
 wQv4SRODZnVUhrx0ZjsiAogqEKDmmNXpvOiApR49lduMpX1E5Sifd/D3gfEa6fbhdO4/Nu7YIBW
 HTC807nnkHfo84GySeFHfNa8niYNF/9oiBhSJpD6ziG5QywHoFhcZPLxgcEyKJ7AmSWeGz2wA+2
 L752FJXl4THZXOVdtAuuGb1BMweFqwlqewepIVJhuk1ToRmjc=
X-Received: by 2002:a05:6a00:908a:b0:838:3404:c2b1 with SMTP id
 d2e1a72fcca58-83f33c9cf52mr24909168b3a.18.1779297972008; 
 Wed, 20 May 2026 10:26:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f196660f9sm27377330b3a.10.2026.05.20.10.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 10:26:11 -0700 (PDT)
Message-ID: <672cc2e2-93cd-4146-bcf2-cc000695a122@linaro.org>
Date: Wed, 20 May 2026 10:26:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 59/63] target/arm: Implement FMMLA (FP8 to FP16) for
 AdvSIMD
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-60-richard.henderson@linaro.org>
 <CAFEAcA971nFuXNkQbswiDzRXQ7WsrW9GTVzH5A2rPGym20yMKg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA971nFuXNkQbswiDzRXQ7WsrW9GTVzH5A2rPGym20yMKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/20/26 09:36, Peter Maydell wrote:
>> +void HELPER(gvec_fmmla_hb)(void *vd, void *vn, void *vm,
>> +                           CPUARMState *env, uint32_t desc)
>> +{
>> +    FP8MulContext ctx = fp8_mul_start(env, -1);
> 
> The scale_mask here should be 0xf as this is a halfprec
> output, right?

Yep, copy-paste error from fmmla_sb.


r~

