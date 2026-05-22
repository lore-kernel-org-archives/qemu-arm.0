Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F54CD5BAC
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 19:59:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQW1U-00004x-Cw; Fri, 22 May 2026 15:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQW1T-0008WK-OB
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:59:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQW1S-0007Hq-8h
 for qemu-arm@nongnu.org; Fri, 22 May 2026 15:59:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2baca4df358so48241335ad.2
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779479944; x=1780084744; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6oMW9zb14EtLdW5uFRh0YvojS95OqvxMZ2hO2by1IQw=;
 b=lfQtAIsAcH0H9woWcUBLhc05QJgab9aQBaFasYkkhuW2qNnZjIvjIPOLuuhI/LFPsh
 6nbdUSCq08Xpi16iSUL/XHGvAL2sbq0ihHnFMgBbtvwa6ignrFq9UdVKenW8pCP/XyNX
 iHFMfrHPivBOFhnuokiE21XtE392Cm/zzAPFcmvQFyXDyNwi4XIm7RH2w3HZCvKImp3A
 1rAoodEF5T6gu5/Hqx88c88oKbdNsWyAyqtFeWBAPtG6MZHVTq8d8qswqo6CD64FQmAh
 Iz41zgjZFazkjAg6q/qCzxF5YT70298po56W6WCwfI1HKrQ4yFiVTtlp1Y0mj1nypBn3
 Ri7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779479944; x=1780084744;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6oMW9zb14EtLdW5uFRh0YvojS95OqvxMZ2hO2by1IQw=;
 b=flDioZqzsgXLfvh8eb2Ihro/UY6lsQNFrdRI6Ni9Coc8uP8BYw5CD2v4pbM0dWMI6c
 PTS1pu4XJ3Vc6fJIamvz36rCRMjNZjoSVkimTt3Bh2lk3lwXMYRPdvCmY643FXnvz11r
 YEkj4FEJM96M1JIICnb4zcw3afBD3CFt34bn6039AAOWzyE9rff2xeTopfQNjmrWZNr8
 Tr3wWCoxEAlwrPVX3oKxmZQXg1Oa9a6nTQwKpiCxQ6eU9fKtKPE3Xv2BqOvXF7Uowqo8
 pI85PRk62v4GBH89Y7U/mk/JsbW2fIIezcTAVnC3IyCaC4s+Pznj6qj3i1ZVr7Gp7y19
 ogmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VUTbEJF/WGf+cB369ysLSsRfz0A/NzNo4oi/Xy+H18gITeQ+dw+NOfmRkDlnBKBIZWv+bfidRKw==@nongnu.org
X-Gm-Message-State: AOJu0Ywmi0EqU7svFUI4ZB0HAkrHAA/n95+xcUA3Abz9iVyoLEwixxWm
 wN+aTWWXn21LfcH0IjTY8/THsAMQPpV8V3I2cH5AcAQCKtY7FPu4OnZmaalcQJ8vomg=
X-Gm-Gg: Acq92OEACv1CJwKk6a/IYjaFPDlk67vjVm8QuMfcvvroCs6mA8ruSyqD9/3qGnqzkQJ
 K3EPI6kMlSJrSD+7K2gq6L80vRhL+gueYmHLtTJcVyrdsSEgCeD+vRQQaRnez1KGV1pB4rhiJID
 RiI2F7a48tzdaFykUubfm4TyxGLj6u4G11xty33r4G8BeQg0BgdQTaLP8CZmGeqm3X6wJ5qTMA7
 tYgDgYKLuw6B0lNzbxxG1GNee0xPRzcreRtLwLv0cvqgMw2XrnT01Ah32eV5SxS/fXQxtVyNrds
 JdI+N0+V8ZESXw1rGoZ4Ty9LHeLg0TfIc241y1OUxcWmexFDk2TQa9RjA1R0ZY3T5F6LyGZKU8A
 x1ldEGTqLeue3RVGXwoC8kvPHkIS1g7dcTXIPn/gXGg6EiRpbLco3LJnis64Z4P/KXLtNZ0xLLz
 DuJycyEw8GhuReMURw2CwZAtnt1fV2R/0kCWnTwr+HAyoaOCs6Awc=
X-Received: by 2002:a17:903:1a10:b0:2bd:2430:eb7b with SMTP id
 d9443c01a7336-2beb06cbf6cmr57131575ad.12.1779479944505; 
 Fri, 22 May 2026 12:59:04 -0700 (PDT)
Received: from [192.168.64.111] ([50.78.183.177])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58b3c92sm26599795ad.42.2026.05.22.12.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2026 12:59:04 -0700 (PDT)
Message-ID: <14f3e7ba-1474-42e6-8407-552689f12969@linaro.org>
Date: Fri, 22 May 2026 12:59:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 31/64] target/arm: Implement BFCVTN for SVE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-32-richard.henderson@linaro.org>
 <CAFEAcA_DbZ3m+P6g=+uEvVJCSyUCuTdzDN26xwXLPTRrZLBOwQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_DbZ3m+P6g=+uEvVJCSyUCuTdzDN26xwXLPTRrZLBOwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 5/21/26 02:01, Peter Maydell wrote:
> Or we could shortcut the packing process and just return
> the right value:
> 
>              /* maximum or minimum normal value for E5M2 */
>              return 0x7b | (p->sign << 7);

Good idea, thanks.


r~

