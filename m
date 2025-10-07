Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2476CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 13:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v683c-0007Fq-R2; Tue, 07 Oct 2025 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v683b-0007FK-8N
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 09:48:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v683S-0007ag-Vv
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 09:48:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso4737540f8f.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759844912; x=1760449712; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6ZG6KtDpB1f5Isb6p40/VGcJa3rDHywmdw6TLwXJEE=;
 b=JJRj3mwuJxgEEM9mBK8B2Tdy8VXajeY4SDGtIzfc5y8Z//t09AIU6tufdMgDUoAblt
 WJxNVjfkRFATH0cSBLyDjdy70bTK4f4O+t9cX0tFzjUv/Vxyd6fiJr7ZNC6kxjl9gaE6
 pLSDS3LeCwVG7IkQ5HkgX1h8pdUBcop3C25tYndg6n3fzdNc/ukIOP62WFXV5+4WtsQh
 zEiYGCUjqtEvoNchcZh1vaYqbfySGeZhIWayDQ+2ld5wa0bnvRBpC6ILc2NGf21puKhN
 Ek1yAWZNX2njABYOLmSshCzfvUDiz/4iGCN+b7UiglZMyUlVUP7b0ZvijNRLB+3I/Hud
 KUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759844912; x=1760449712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6ZG6KtDpB1f5Isb6p40/VGcJa3rDHywmdw6TLwXJEE=;
 b=mMg3uTEoP+ATt4haZLs9bYCoA0oOeQE0Cpey+5psCzlDDCGoxtDRRlwFKcPlkX7JCs
 8sCEESDKu2SZTqDFygD6yny5CTgDr3hY8UtbrTgyY8FNwnhVh0BwoP5n2Koa5OTsEIly
 RsbDrHlvba8ecK0h1MBcQFlzBW8zsh6K2QdWQcu/MDlTiSMR9mcmPNpO359zgy2gItWh
 5sJcxj25XIxKYxSLsu/ymNHgrUYNCc193JHA2LLzGRb6C5ZdKQ9uR1ts3mCz29nWM76u
 Lz+LXAPMsnhrtXkUlCnyOIUH+jd2cv87GXARHXhChPn2t6H1P5HLtiUP6kSnlLXLRS7S
 694A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE3c1ti2hhC714fmaxuAroQhWRmSTfLkBgMnkI44SVc6ZgUKm9xTcgQ9m3T0eBtp/nhkKK6BzMxQ==@nongnu.org
X-Gm-Message-State: AOJu0YwRBJ76lKmn05ZYuGwOubtpDUnzFULVqT1k/sYos6vqarn7PIXH
 Zh5MZtbMJrsFXW3fCMCOlV22kuDFpK443O5jkHdVOSxdauC0ExkrgZx7qO9kEqzucFE=
X-Gm-Gg: ASbGnct0sNmNc0tJgeTy4KVre7NtdeJoeAFy7LRRyAB7h8Wtx0QkODX2iZOn0thn0kv
 vAxJ/6MDPi9vsJh35rIr4MYKwv9NBJyEM3kdjXg9zPrfQ8GTtF/mKuRp+aLgALzfH0bSgQycaV1
 Ktt/Pq+MFWoEPhWzB+JAxQAFNidZWs+VQvkX3RpvXqFOzJ/FVizx4riHSLU6Mg+uXqVaOFL7Fao
 8bpvyHREHX0vaFqyhR91qV0kgJOnGPJ9txJ5mBicw1NcwJQ2tTqbs3D3QMhcm8qTc3s0v7+RpDI
 fV6veafwM+gtKnwCNE0hOQ7R3vss9rCtA5niuoE4NfknjwJ2+rWRUOEH9j2XzQFlLsfzyQYv18v
 54abfkjnFzGBcARWnH09ZFzx/9AKcbDE7J5zN7sW9lmF5dgATLe7QekFF17mPUMskodzBgeO6wI
 erpcrwE4D0eGfqVVKTmQ==
X-Google-Smtp-Source: AGHT+IE+BWHDJYUOxUycI32bKtFoxGHlKeZV6KEvzq5EFqba3o48Z9/K80tz4ThEwbmbAtCgQYwjNg==
X-Received: by 2002:a05:6000:1acb:b0:3fd:eb15:77a with SMTP id
 ffacd0b85a97d-42567137c93mr9628290f8f.6.1759844911866; 
 Tue, 07 Oct 2025 06:48:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe49sm25800014f8f.21.2025.10.07.06.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 06:48:31 -0700 (PDT)
Message-ID: <66dbc389-4c83-4552-b447-87c0e1ada48a@linaro.org>
Date: Tue, 7 Oct 2025 15:48:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/max78000_gcr: Do not ignore address_space_write()
 errors
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jackson Donaldson <jcksn@duck.com>,
 Jackson Donaldson <jackson88044@gmail.com>
References: <20251007024006.43166-1-philmd@linaro.org>
 <CAFEAcA_ytH+AwTr9LAZBP2nbSTod0FkfuexbewW=T7Pbb3nkmw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_ytH+AwTr9LAZBP2nbSTod0FkfuexbewW=T7Pbb3nkmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 7/10/25 10:27, Peter Maydell wrote:
> On Tue, 7 Oct 2025 at 03:40, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Convert max78000_gcr_ops[] to take MemTxAttrs and return MemTxResult,
>> allowing the write() path to return error on failure.
> 
> *Should* it return a MEMTX error on this failure, though?
> This is a question of what the hardware behaviour is,
> and there's no reference to the datasheet in this
> commit message...

Right. Thanks!

> 
> thanks
> -- PMM


