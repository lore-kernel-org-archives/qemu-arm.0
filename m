Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020A2CCD18D
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Oct 2025 17:26:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8MJU-0000jL-Mj; Mon, 13 Oct 2025 13:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8MJP-0000hw-UU
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 13:26:20 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v8MJM-0004rs-Us
 for qemu-arm@nongnu.org; Mon, 13 Oct 2025 13:26:19 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so47905735e9.0
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760376375; x=1760981175; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UpjLcCiNhxrbyzdwKLuAzLzhsQqt38WZSGQD7SsU9dc=;
 b=sS33s+sliQFjlepjI5ijYvvEJTCzRQYa6PPMSJN1p1X4xyb0HpDtDNABUpAsn530PX
 ovh97cYHyLhaZywidUsQm/kbzaRFwF9rZzgs0ryyqGF4pebpjD1Zjp1CXgq942ZF6Al5
 4Hqkp6fT2hRKMjDCTQVQCH41UN9JzWmduX4IGLxSewoFNxl59BOx/FeJ23EQabDMNl4Z
 c0pO9aajDoZr30gqdWHh9Nr8JhuxDTegRqlcRjOJicmKtbq8m8f5/SR9tW315jj+KOYa
 n2DfQrN+dyUV33ahVPfnsNTrWM2uUXJEADsnWNj8TLFQZ2JrRyDWY98d1wfb8V6jEewF
 LPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760376375; x=1760981175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpjLcCiNhxrbyzdwKLuAzLzhsQqt38WZSGQD7SsU9dc=;
 b=HIIpSYI0GfiaUjcSOAyt/F0JiQBO/VWM0qJ+9zIGQ3TFWbeCpR1M0ug4qb9JO3XzZb
 kZYazIBnbYSaQ0IoMCgSCABs85xaqmpLqfIP39r+tkUWhZvSBIkBSmZ30m65GVFP+y9T
 c9X8elntl/NpJsYhKzDwmpjKoPGKS/Eg69jkR6vtvDD+j9JwwhWb+Cz2l1ZFEzXOFIAQ
 w8NTd+WeldlLMufLDNk1qEEv3RcQc4J2tyXHFSb1hhA0tqYxL6l8GJgXMNMst3aR1S07
 lTwtGCBJjP+Cj4QxsP0tWtpkTxpPmQ2yLN8dbT6/wceCnXKoca8tf8r1QOxWg8OThRy7
 htzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRwWBDvz93f/VORWlNqztqPQnZdb4G/SALWC+uH/rD2VKdzXclbt1GSqzScxyZWlT1m9KiVVWldg==@nongnu.org
X-Gm-Message-State: AOJu0YxqIbtdcQxmA4LLPlwu3dfjgTwcuAU/6jVCCvHWZfQTVH3+qrSb
 X8cFl90mJsGwVZz6oo/HTEtJ4thNgSFHeynUBVUQMJufl4G+lLUsCA8k2rrX5zUwy3w=
X-Gm-Gg: ASbGncul1C+4caZDXi/nQjPScm3An8asFFv2Xyo7R/4aiToXiLqSNMWRZOme0iVtfkT
 N4jmXcBfy4LUjDYZQXFxL2E2nCtV51x0iSd8yapfkRJNe6+dGGgVqcfGN1ZqCErDzsfFyDx2ggD
 xNXyxMmhf+hB+3aDwn1cXFnRHA0TWFKfcq5HR/TAWkH/bVDTtMIMBM5WXheiolXimz0Fv8o+UPp
 HZP7DDSTW7vWdlMAi5YW/MIcCaPegKlPSSl0q7JZ9hm1rTGs9NY/P5If1lhMdud7+X7NUNTYqSl
 KVPRfEjSjYVnn1Oj2EPT33duEQLxqzxLoZsu4TL+e7kEDv8tfkLs+urkOvDsBxwZy0Z0jws7iQA
 7GEQccNvrZ6CB/a2KZVozfmeeImCwLBAFCGgBguo4etdM27UdADJEUJ+N/mJxWIVIhwPi/ZXJ2A
 bxyoxD9iHBKKRVF5THMKsXbZ4=
X-Google-Smtp-Source: AGHT+IF3j/Ua3au/GFUHEi7nHUj94RB3OnJ+CXZL84W0XlsbVeW9jVUJuLOHHR7/du7sCX+xR7U3SA==
X-Received: by 2002:a05:600c:5492:b0:46e:477a:16cc with SMTP id
 5b1f17b1804b1-46fa9af84ecmr149440365e9.24.1760376374773; 
 Mon, 13 Oct 2025 10:26:14 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4989601sm192455665e9.9.2025.10.13.10.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 10:26:14 -0700 (PDT)
Message-ID: <e06b47fa-361b-4e6c-9477-61b556808670@linaro.org>
Date: Mon, 13 Oct 2025 19:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix reads of CNTFRQ_EL0 in linux-user mode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20251013161040.216819-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251013161040.216819-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x343.google.com
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

On 13/10/25 18:10, Peter Maydell wrote:
> In commit bd8e9ddf6f6 ("target/arm: Refactor default generic timer
> frequency handling") we changed how we initialized the generic timer
> frequency as reported in the CNTFRQ_EL0 register.  As part of that,
> we chanegd the linux-user version of the CNTFRQ_EL0 sysreg from

"changed"

> having a constant value set at compile time through the .resetvalue
> field to having a reset value which we compute in a .resetfn.
> 
> This accidentally broke the reading of CNTFRQ_EL0 in linux-user mode,
> because the cpreg is marked as ARM_CP_CONST, which means we translate
> it as a read of the compile-time constant value in the .resetvalue
> field.  This is now zero, so userspace sees a 0 frequency value.
> 
> Fix the bug by dropping the ARM_CP_CONST marking.  This will cause us
> to translate the read as a load of the value from the CPU state
> struct cp15.c14_cntfrq field, which is where the real frequency value
> now lives.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3159
> Fixes: bd8e9ddf6f6 ("target/arm: Refactor default generic timer frequency handling")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


