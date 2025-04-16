Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp247508njk;
        Wed, 16 Apr 2025 10:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8vdrk4z1X1zTlospr9sdKeQcYX6mcNAYfrgSm92CwPLosEXa5jEr49jHRnK+93XZxa83VJYiiRn5snw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmL6jK/6Bx8/wpBG2K12F4gF3EaPJi1Qvv8YMoNK68S5VgIqmFns8NrbkRYizlg5GeaHlU
X-Received: by 2002:a05:6102:36c8:b0:4bb:e1c9:80c6 with SMTP id ada2fe7eead31-4cb590417fbmr1836953137.0.1744823829746;
        Wed, 16 Apr 2025 10:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744823829; cv=none;
        d=google.com; s=arc-20240605;
        b=EAq42OtBwLiL1t7EiziMshuLTWBGY4DykPcmftxKZbGTAsXTEBupy+YMUcHjyFUn4j
         hZTbbiLB4Dd7y+VLPjFQBv4rGmiEGygYzxbmzg1o4gfdp7cfX/i5etix6+67r0IBu3QK
         O9SqcjXbLtGZlOxul7mr+agkzpLsUCGdABrfYNZoRq6wuw0AYq+sTzizcmCMTFg1aDS1
         1nDLqbf1SHh31iXf7dDXBEtKRdz1fUU0vZuIxfwG3GgwdBl3sKg6Q+PMUZSyrVz5xmuF
         b98wJu7ZagyL0Nyepk3g+ROCdoMeDBOwB88l1+JiYApbzV2KZXgL05GnBODPpj3dAQV0
         ZxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wp3Br3vlGsteJ8ox9+DcOowfAt22e0pJC9nZY84QNAU=;
        fh=hqPZChjvkHSu0row2+3qhy39mgLN1v+hy5ML97bXr6U=;
        b=iC2V2VaZGnQ7xMCJGQyophY+b1VudjjLQ0dVX+cIdW/6oreyfLwixtgt3llk6I2Wmj
         ntoG353Qo6RN3bjff9gQYwib1sFKoyU7uWmGzg7Wns7QV9qJWLnTVTgatGLxuIYgHUo5
         sxzPMlKCQAUQmQWYz609A1GjJSmiiP2Vt+PWtHCTK60IbVVQWzZywAugu3EvdC5Zgt9j
         Eajyu0RidAQLDC1n9+4UOGbsXtOQHUPJdhZHE9tsStdhysMB2WLc/06URWcreTlaq+cB
         PEzUq1ji51j4zCMgJOTS3TsJM+iP3UXvrXz9npfhnh7LgUDivtbVan+je0Etm0rfcCFj
         EsSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6YDPwWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c9921235si4660027137.667.2025.04.16.10.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 10:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6YDPwWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u56NR-0007ij-AN; Wed, 16 Apr 2025 13:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56NQ-0007iJ-85
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:16:44 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56NO-0006ZP-D6
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:16:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-73bb647eb23so6475508b3a.0
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744823801; x=1745428601; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wp3Br3vlGsteJ8ox9+DcOowfAt22e0pJC9nZY84QNAU=;
 b=M6YDPwWsuZLwgJJ5fztXQS1RB7jAFaFB/EDrJBLi5vcs6HNfBjkFGSxkPWokWL5zQb
 Lr8yuYvq5LrwMX0+vBTfg7xvNy4Ys497uFdkFYIF1KFoaJJjpjUjKwioVHDYG7mzfQQW
 AUXkyYeZX4FVWmqZcWf9aOquVRBsh9CGM+a/ZHcqSM7AhmX8gaExGfUKft7HZ2gURRDK
 SZDJzeEsCjStqaVU1OEcqlrU6E5+5H7wZTZASRTF7IQRt/KtxaOrFKPfTnXUjfuwEo9G
 GSOCWzV+kFnKezwOz8S9Yt1Cp7nXhpVHEbI8hfdw/iaKgPXMMOalagLNv2YkwJF90Isv
 tp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744823801; x=1745428601;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wp3Br3vlGsteJ8ox9+DcOowfAt22e0pJC9nZY84QNAU=;
 b=ch4Y4CaNHPEeZ21JgSZNne+Grf4V3+8KpZSRACbV08tOegqB70WQa0F6ix/prSqXF7
 ai0RNFK4GyH4hodaXwjc16AuBPbra5qLHgchiQ92iPQc0Sr7fZ4Y1AORiM212d3DWm/l
 08zE68VIpeYk/mUzLXTsZdW1STnzp7bxtbQ8Y/kZztTXERePIAxh6+DfclpfQqkg644q
 jjZHUczxj56VSUnyCm6pgZZeg74siwh8Pe2FGrAbBOYZV4pvZkcdQmEU5msVjYlHy48D
 abTUxK+3xl94tRoBvil+cpJ2I6VaOrw28oD5oDwgdFBwWIx6yKdVp/3WAJ3xp3odQnH1
 rZPQ==
X-Gm-Message-State: AOJu0YzibVqtFxeXr1I9clHOC25sRGBMPXXT9g/VfDo5rjp2V23iOZDg
 KxLJaNQ35AJcNG1dbL5sNZufXphvuJ0ABEvOzyJgHLPeyq1psD98TO0GQXaXt8s=
X-Gm-Gg: ASbGncs0DIykLGghb0gwmeZR1oYmgxkAeTiPifvt1kmf2VOD833D3mS238I1SnWJQIR
 JDc80anmMm+lO7kLe8J/xMDpE3QE/RgqYwfalpl10MKYVkqU/E8ayNt1Mmrb2rD19u8CHr9MyId
 Riu7/esWZ9cj4+o+AdF0kRAFHc3OoGa1L3xd50ACF8qdiQxlcMvUwLkBq+gNOODUjgatTi1dtun
 ulYenoO6jxBAL3ugzC1Vj4KUT675n5igv/vfBodj1Of8Pa9yUpKO1KSAOvoGkG9ASyLkzYEzNl/
 AThaM+WrxKFpRh7TI9dvN14D12bva7e04bcK6ZbhJVPOrpLiv3UbrAqMPGkVYwE+mzvYOBhTPER
 BKCQpt1c=
X-Received: by 2002:a05:6a21:8cc6:b0:1f3:418d:91b5 with SMTP id
 adf61e73a8af0-203b3eeedc5mr4781375637.24.1744823800885; 
 Wed, 16 Apr 2025 10:16:40 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0b220e997asm1545162a12.37.2025.04.16.10.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 10:16:40 -0700 (PDT)
Message-ID: <9a681970-9c85-49fa-abab-25a878c38b79@linaro.org>
Date: Wed, 16 Apr 2025 10:16:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-3-philmd@linaro.org>
 <655c920b-8204-456f-91a3-85129c5e3b06@linaro.org>
 <e30bcd1e-6df2-469d-af6d-67b2a263690d@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e30bcd1e-6df2-469d-af6d-67b2a263690d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kZGB2LCU7HLO

On 4/16/25 10:13, Pierrick Bouvier wrote:
> On 4/16/25 10:05, Richard Henderson wrote:
>> On 4/15/25 10:22, Philippe Mathieu-Daudé wrote:
>>> CPUARMState::pc is of type uint64_t.
>>
>> That's not a good argument.  It's a guest virtual address, and using vaddr would
>> self-document that fact.
>>
> 
> Ideally, should we update CPUARMState::pc also?

I don't think so, no.

r~
