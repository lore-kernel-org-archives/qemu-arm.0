Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ADDC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue,  5 Aug 2025 08:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ujCei-0002Vb-2r; Tue, 05 Aug 2025 04:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ujCeg-0002Qc-Cy
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 04:04:18 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ujCee-0001u1-6L
 for qemu-arm@nongnu.org; Tue, 05 Aug 2025 04:04:17 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2405c0c431cso54118785ad.1
 for <qemu-arm@nongnu.org>; Tue, 05 Aug 2025 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754381054; x=1754985854; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LXMDaEo4BJL2dMLIAuzlGj21wSzNnwv+TLEJtelUu68=;
 b=Zmwq+i2noHHVhZ8qSSp/6kbMes9ph13R78PNzEmryIsk9gyfsDrelas/ex/sCi1rbW
 pYJG7MDbX3DycFkowIm7g9lHvypPe3Trb2Wje1njY8OxMDwn3vfjFnW6v8vlgQkp7yFc
 GlrQyaTqmd8OUdni4t4hxV98gcnhD5jcfhzabJ/tb2bNtAs6e1y3EmNUVfvwXBDR23En
 oMDLOEZDsV5hewqUFzrYgW2pyf1q68q4QBXIqaKple/IOVNogJtvCjsZ24bCcL0FOnyC
 y4mWXIoQiMaXOgrxFwP+kAjB0hyGiMhUdZMOyWXP3zdS2yo1IwTjy/MsoBs5jF3Pje44
 LRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754381054; x=1754985854;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LXMDaEo4BJL2dMLIAuzlGj21wSzNnwv+TLEJtelUu68=;
 b=UZFKd52c+J47RBKqYlQKlB/X3bEUBtdddODRXQBBo2LJbGnBgNRuQAju6mKnc/2FuB
 05LGS3gel8FCE8FaiWZrDjYYyevRb4VKT/QOmRRs+6tImH6PeRb3KTwVdZeikVQ6y5QA
 +9etL0tpa784we/srZ55kzvhSGf3cjPGyEyRuEaM2jju41uCtSjFUjVn9hEtjIot7vEu
 JNUDqdo+7Zkwr39mBeNP15Dl9H7hz/ws2t/8REgCwAI5GpeWICKERUyjCs4lRPC5WfV4
 6YSvWO82b6MGUyMXRtuGjxF0TCVovj7rtfD4dP7Fv4fB917buydt+a7B2ihl3oRtgYcm
 Colw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3M4Ib8uQLxh3cgWcJgw6/IsKVTN7+d91HZMtNPeHvwKnEwwFpKfS5sccvujqd+/yVj9idtBENig==@nongnu.org
X-Gm-Message-State: AOJu0Yw06x8EOj8+zoqNAoGD3bIN4IG5RCb64/BWv1pGSghHDdtmZHg5
 HgraFHQ5Sk0Jy20t1EwQuueF9b2SEf4eM9o5/lx+/2705L5ohiHYffjHRQ/BZgd2JQg=
X-Gm-Gg: ASbGnctzPR5cW/jyzCCszyURd5on9QTwVewnHjkwDlH2esmLHVsVi82qxIdb7fYl64F
 +9vIK3LRuafQHQStVP5hwcLnkGY1zLnmaLBz7BblzrYGVXMtyebCEleNkJDO7AI3zwHGWNQOxu/
 q/+wuw/T6GpWe1zQDqhBbG2/nt/X45CzymUwjliUWpSmQ49rtR0idGAoW9yGO5tqTxK2LubAZFi
 Qek/xmoGA+7ppveV5eR68VDQ5CIRyOtLYrA+kg2VFKY2cQI6kBb+42dhPVqnLVuMd4XeAZrp6C4
 CPfDu1O9Lj674A0yxL45SZoRL3o5guEntivLCr0MSszJ+/o+YdozYNkzYdzYYqIRLEhkR0Nn7xB
 ilT7IG8Vs22TncBHQTBNOIwKvXqVeST3lqbxxvL9P
X-Google-Smtp-Source: AGHT+IGAXeoDZ2NToANIfJRp3IRm4yxeS4ipJBIVjWzOEWeNguDh+WIVPVKj2mr7Mk64fSsYkKAU/Q==
X-Received: by 2002:a17:903:2111:b0:240:a21c:89a6 with SMTP id
 d9443c01a7336-24246f58785mr129071695ad.12.1754381053907; 
 Tue, 05 Aug 2025 01:04:13 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b5f2sm125967755ad.125.2025.08.05.01.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:04:13 -0700 (PDT)
Message-ID: <a38ce19f-7520-41c4-b6e9-54d4ba8c14cd@linaro.org>
Date: Tue, 5 Aug 2025 18:04:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/arm: add support for 64-bit PMCCNTR in AArch32
 mode
To: Michael Tokarev <mjt@tls.msk.ru>,
 Alex Richardson <alexrichardson@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250725170136.145116-1-alexrichardson@google.com>
 <befab3c0-024c-43ca-8d5f-bddf960e9a21@tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <befab3c0-024c-43ca-8d5f-bddf960e9a21@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 8/5/25 17:44, Michael Tokarev wrote:
> The mentioned commit:
> 
> commit ae2086426d3784cf66e5b0b7ac823c08e87b4c57
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Mon Jul 7 09:15:47 2025 -0600
> 
>      target/arm: Split out performance monitor regs to cpregs-pmu.c
> 
>      Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>      Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>      Message-id: 20250707151547.196393-4-richard.henderson@linaro.org
>      Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>      Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> The thing is that this commit not only split out parts of helper.c
> to cpregs-pmu.c, but it also modified the code quite significantly,
> which is not even mentioned in the commit message.

I most certainly did not modify the code significantly.
The code was moved from several discontiguous blocks, but that's it.


r~

