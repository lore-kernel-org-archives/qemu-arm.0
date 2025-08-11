Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF22CC87FD2
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 10:41:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulPxq-0008RF-16; Mon, 11 Aug 2025 06:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPxo-0008Q7-0b
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:41:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPxl-0004rG-6l
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:41:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so35156085e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754908865; x=1755513665; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3242HSrf+maEBiFnxIJjp/97eu1oUsjXSoH1Q/0ZCc=;
 b=cQIvqt7PAA2gzD+G1SsRFWMses9hLTXZX8LUL3YlhGV4WwqvNj04GVqs2M7I/KwjMA
 opkznuakxSH1O2Z4rMC9yihlMZIe1RWfgVoNZWJjv7pAX+kIQUWqKLKIJ9edH+ESOP1Q
 4bj+QX0ug6IH3erFtXif1G3S7xFxyhICNpRs6Y47RtpUn2YUQYMg+0eruGCkCrkMa6ce
 OEl1K/IhVW6L2Q0OvPZQ3pDhLJD0KNcNvJqu/lPWww3VBktWMxNAZfRg2iUYmSYnrhL6
 KffxtR1UMAxYTfntZZAhe+CKG2hkO/mOMVv2r8+tho4T64Tuq2ilw6bWrsUL+8EcmdzM
 aQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908865; x=1755513665;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f3242HSrf+maEBiFnxIJjp/97eu1oUsjXSoH1Q/0ZCc=;
 b=tPK0+gobNnt/vzFGaWUrb/FINDvcoQs/AMgB1MK1geDW1cymk2nmSHHd2kdGwlQW5I
 5TaSRHfBiFh2Ad70Em57sOrUQayeEXZi/DScSgv2YNpEDgclV8DCwYWAanNB1rDVzUC3
 Gfg/SZbrm7BDfoVvrCnD+JibKkwE8QEU3z7wMa7KpjRJqmvbYI4EPVamRbJj5K79m/7g
 7KzENQu/ULdwxxRC2aJCkrThULremIzQcTUMTyQXrKgwXytOvzm+aieSzsqGYdy0/LDl
 0SmHTeoyoUphcW+yO4ZG2PA5tHQ2Ii59cvKzoV0ENFOrLDp4HnzIqfnsNwEWtAovU+MT
 SLpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8R/hI4m+NLu3ziAIz8CkuOjeZyob4Gv/61SlgYjq82nBogcDPzqqCoI6V98IQJwxJKONgtJggOw==@nongnu.org
X-Gm-Message-State: AOJu0YyPyov9TzC3kWsBTezZaNlViyd+UKNhDRllnhVvAFqaAOr4P7wa
 9l1Gn8KT4ldTDWupOUDudBaupB0kXd1tVAbIqf16hTLlnVCjF41VHtn/0XvUPQITSZA4Jg/1Jf9
 HZUWm
X-Gm-Gg: ASbGncuP4RITpnI3ka1CKn6/KvxW7WAtidqf06xzgXvYlwBRMNn8h2rfky8tKZHVZd+
 kLZHSiEpj+/o62nmaQ/MV+FWmajRv//+Ru8WpPIu2a2MCDau6jimuxIfr/5qzv2rxlY6dSrMHbJ
 A4zGDR/p7OhKxTkN6FrdcNTCQtsLIHnzfB6EOMJtS+leuUzxVQ6fHFQn/2fG9nb5vDRGI++Gert
 +g816HPnn3az2xufGZL75s/pB8vkU2TpkggH3tjP6WASd/RfYOYLrhxu0so6LcIziEwn8M3rEep
 afH3wvmfHN00PiykU3yBCX+SkpE3EPxWzqoQG9HkHV2oou35o4zm+tjGuU4VRBgObtEjrcEbpzv
 JL9T+d7YDV4h8kCbFizu7A4nr5+jV0o9P0cSuTCE8cLx0VgKr9DEJxnNmbZ/0X/JIPQ==
X-Google-Smtp-Source: AGHT+IHDOfv8bk13Er32V5qJi5p0Tev/TKIgt77Rqllo3oJoK7O2WDdGr0qNDpSoeeJ+eeK6nr5wbA==
X-Received: by 2002:a05:600c:354a:b0:43c:f8fe:dd82 with SMTP id
 5b1f17b1804b1-459f4f0f57fmr116790005e9.18.1754908865308; 
 Mon, 11 Aug 2025 03:41:05 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0cd2c90sm296408435e9.17.2025.08.11.03.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:41:04 -0700 (PDT)
Message-ID: <61a78e65-4164-49a2-8ce4-d95730b10eaa@linaro.org>
Date: Mon, 11 Aug 2025 12:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 05/11] hw/arm/smmuv3: Support secure event queue and error
 handling
To: Tao Tang <tangtao1634@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <20250806151134.365755-6-tangtao1634@phytium.com.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250806151134.365755-6-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 6/8/25 17:11, Tao Tang wrote:
> Following the implementation of the secure command queue, this commit
> introduces the infrastructure for reporting faults and events back to
> secure software.
> 
> The secure event queue is now enabled, serving as the primary mechanism
> for the SMMU to report translation faults and other architected events.
> 
> For more critical failures, such as an abort on an event queue write,
> the SMMU_S_GERROR registers are also added. Finally, SMMU_S_IRQ_CTRL
> is wired up to control interrupt notifications for both the event
> queue and these global errors.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmuv3-internal.h | 38 ++++++++++++++-----
>   hw/arm/smmuv3.c          | 82 +++++++++++++++++++++++++---------------
>   hw/arm/trace-events      |  2 +-
>   3 files changed, 81 insertions(+), 41 deletions(-)


> -static inline bool smmuv3_eventq_irq_enabled(SMMUv3State *s)
> +static inline bool smmuv3_eventq_irq_enabled(SMMUv3State *s, bool is_secure)
>   {
> -    return FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN);
> +    if (is_secure) {
> +        return FIELD_EX32(s->secure_irq_ctrl, S_IRQ_CTRL, EVENTQ_IRQEN);
> +    } else {
> +        return FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN);
> +    }
>   }

Or using bank as suggested in patch #1:

    static inline bool smmuv3_eventq_irq_enabled(SMMUv3State *s,
                                                 unsigned idx)
    {
        return FIELD_EX32(s->bank[idx].irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN);
    }



