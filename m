Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16994CD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQVwJ-0005tu-DY; Fri, 22 May 2026 15:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVwH-0005oi-Mp
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:53:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQVwG-0002iD-2H
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:53:45 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b458ca2296so56548035ad.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779479621; x=1780084421; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xtGS3b+AkFKVQp3luYBT4nrzed8IdHb22XzX7stXo5o=;
 b=qn8pzK179C5OJgMKLwGZ2UakRQIMubAfmaU1brrbe+TNJ8s7+GJdYY3ARpDGb2ED/1
 rigj3yRELKjsQ5vSsi0+oqGyAdAZOHxoUc0rWyd45xYWTS8JJ7v58PDMWou2Q/ejMUTb
 eeM6MW4LTrchlaWJEo7xus7CJyr2znlpcbwbSbnAyhLF8iDg0ENWyVtHkS5DWGPT4iZl
 s49WWen9r9yroOGFXKGBeZXPUxZW9AeVnJfQEFmrWUV9LFxFpfDsIyVeIbej1brxV++g
 R2QJoquu87pEeCvKT6N7uCpd8lRcYEsCW3U1njCmOLC3/Td2AZCPVdlVwky1FNUt0CtT
 DtuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779479621; x=1780084421;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtGS3b+AkFKVQp3luYBT4nrzed8IdHb22XzX7stXo5o=;
 b=Y7KW7kOHwg1FJopd6l9JAO/yTHlumARGIz3nrs+p08tigCyV2kOjtRc4muv/eN/ojG
 cwTElVx7ilXIlrGpUUxWLjCKqrKyArvwLcAwFGj4oe7ICKiGNcNH0TxDSUvlAdTS+O7a
 3gqolCpbQSJxk4XHIJGW8naSF9+4j/1Vu0aNQg+WCYnaSSLDFaIkCu8PgEdqPrhkXBtj
 5EAeBLcjemhLazJenPy4HAbctNuBJUFFcujHrrEYERPxN5nco1Be4o8dEKgimLIBPExw
 0wQPwwbuEvFIjd3wQtEvgtNTbjHMhzbhKu1O3sMqAYx64+KBCgTIU8/YNGUG5XlqVdJT
 W84A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OFttFwqfXXQCLd7xfpklZ7Mw9347kGz9enbT5wkZUUQQP1oEfgt9fvO2kY62peqIU6RZVnFvx1g==@nongnu.org
X-Gm-Message-State: AOJu0YxE8yFYrn4/JA2UAP3dmZNgwI8FsbiU8quPHeAm4Bcg9GAJzzCW
 ZWXne5jmWRNwPFrL7TwtrCGB8HLSnRgJ7HoaO4DMYBVJ9FDBXFnplKyjI/bdO4lbLqY=
X-Gm-Gg: Acq92OFSpEaSSdsvZX6tV6xCCyYmEIYhHGEhppi6PjI7ocfVwOrZx+1Q8H3zu2xDqOc
 xAnFumFwNzk6QsqMrQwcL/u0ppftX1ZfRdGnHt06dhvN/EIUPI/b2Ah1W3Voy5RRfQtFCp9dx3O
 AuZltpQx6+dqfmc0882igCznvVYDJ+LBhrL/OGnqZBogaFrMjuZuNNKnnq9DCs/M4qgYqJmt/jv
 du5JUQRdOgESBx+99NkUtibS4UlfS2GpzoqQPf/ikovo0gupMHcJb2PiPmxoFDL2woOPpGvXCPS
 vm6Hl0ohWOHIcYuItRABltG9PrF4bL837dlXg52RiqkBQTQo6WYYDbrHXo+ny5kK81NdOjRi5ie
 vpwGx6N/8eDjrIxvNfvCCcEzuSN5KcXG+USKTk3GttXWRBxmmLYXHtLE9LIHF6WDklZaz2+vm5O
 f0JDGji4AoJw10FzX0/puE/vOW4BKkWmloV1/tuTArUvigH1WxZyk=
X-Received: by 2002:a17:903:19e8:b0:2bd:b6f4:4500 with SMTP id
 d9443c01a7336-2beb038c123mr54710965ad.11.1779479620918; 
 Fri, 22 May 2026 12:53:40 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b3085sm24106105ad.53.2026.05.22.12.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:53:40 -0700 (PDT)
Message-ID: <ca98e83c-8917-4db1-b95c-ee3f5fd85f4b@linaro.org>
Date: Fri, 22 May 2026 12:53:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 25/64] target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT, 
 BF2CVTLT for SVE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-26-richard.henderson@linaro.org>
 <CAFEAcA-fwHraHrEuGXeDC93bctG7AAq+gv8Ew39OpR_6wzpdTw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-fwHraHrEuGXeDC93bctG7AAq+gv8Ew39OpR_6wzpdTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 5/21/26 09:37, Peter Maydell wrote:
>> +TRANS_FEAT(BF1CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
>> +           gen_helper_sve2_bfcvt, false, false)
>> +TRANS_FEAT(BF2CVT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
>> +           gen_helper_sve2_bfcvt, true, false)
>> +TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
>> +           gen_helper_sve2_bfcvt, false, true)
>> +TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
>> +           gen_helper_sve2_bfcvt, true, true)
> 
> Again, I'm not sure if this gets the "only legal in streaming
> mode from SME2" logic right, but otherwise this looks good.

Fixed.

r~

