Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDEC87FDB
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 10:35:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulPre-0006Bz-5L; Mon, 11 Aug 2025 06:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPrZ-0006BS-40
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:34:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulPrM-0003Kg-MD
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 06:34:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso2501282f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754908468; x=1755513268; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Lw9QNqUJGrzicgzTxw+TESKlo9H8Z/mCFgdXJUskwQ=;
 b=s4oKlxMNs/gi6Jvtyw9RkRaVhq0BI+UU8NcSgzzcnKw0n/Ls0PAeGrMC1Lq5j4uBfT
 qQMv+8LDyn3x38FFnHM0Rm+slwRZT9a148B/JdEBJh3K8HR1f5v0sqFikZe90NlDjK20
 U2lA3fiIssgAY5+EGx+evnX97em3oAjGngX1WmF82J6Ow95sbaA/CyFzz7yqu3MW4bBo
 UEH/K8lavA0Tav5JmyB6TsSnsQOZEO41G+odiZ2FBLD/qVvOQwMCO+yqyYV95t0Qd2x1
 CgL8uh3g/JX4DBANy2aFPNu+bXSUbf8qGNjX759JVtXBJGnSuhNU7wzGLBtYxXXLtm4B
 em9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908468; x=1755513268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Lw9QNqUJGrzicgzTxw+TESKlo9H8Z/mCFgdXJUskwQ=;
 b=vOpOOz+XIyWDDQA743IYDJ4aKQWb5ucyBw7TqEdy2FwmccIlDgDkHeFu9H7ewSXttV
 JBi/bsfGcPxf1pzEMIhDAOwy3gDc1QxNuCAd4n7XMl1ZUGMXoU3EX0RRXmDaVi8QgExC
 S2OOGlAWe49RJCRfjvvI/Uu+zaUAzzSbYmTr3UXfbUvd1ErVPhIwiKQEszmO5ROGQNnc
 bA/3fbYTCpPQ/GjAsqHMhuIEjJg0sbsqLBBPjfAzScQXG2XtW3l6gn41Q2HiQu5ANqgf
 LxahPcMfXropDPMFCI96XtuDs8+mYCUJpFVYutzOl8m9JtUsH48RxoHdzfoP7g8N87m7
 xk8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKabu12cFTjD3Lp8WT20toa7BlGDT0YRa9JxXfpc9nSKiV7XGdh9m0V/fxBjMVGYfKe9ST7GuVRQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmM4qCrLHE5vDfm1apueBG3morlBgaYO4G+UAQhNRu8ClIsLho
 tAflg5Hmd9LoX8rXZWiI8MKEMeZg14dkscbMUtoSIVuYcRpxHE7EG+wtGAOlubonjdc=
X-Gm-Gg: ASbGncsGN8jOc6DATkteBceFpg83PDKbV9ZNkC4owsEqdTNz8PwLZ+FJ3Za6XsZ7I7N
 N62W7aLnou97p51tw5/aU84MXcM6Fhik+0B1OfphJgoioEXcXAnggld5wuILC185BDdcWx46F1v
 ZvzNy824jwxwsQK212umZpt02idZluaPNwqbT1eIxQmZu+ju9yoBGQ33GZuDSxDsV005zlB5jqW
 cbi2hIZcAl2isw48en6jQagOTrJbP42S+nsq2XV3fdBmibQmdZWOFQ4IMeqFPvY1XuhC1fvvhjV
 w3kMB5de+D+xBGSczFG+LYyiJuJBOo1xN0v5n4OmXqcZyPiEgGsGi0Z9lGifTr4amPtrHeInohR
 /Z6GwAXwRjblVM4LXV4jTHtccw+7hHxLat9VF9v4YU9KwbVHPx9LuKmCkdy62lyNbzQ==
X-Google-Smtp-Source: AGHT+IHaCISQ30mfYnoTYeVABYZciJd1BrsIlOkyNm5PZh89+OY4R3FlWLKVxgVS4fK8XFOLvNE5Lw==
X-Received: by 2002:a05:6000:25c3:b0:3b7:7901:b38b with SMTP id
 ffacd0b85a97d-3b8f97c4875mr14022115f8f.8.1754908468389; 
 Mon, 11 Aug 2025 03:34:28 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c48de68sm40362941f8f.67.2025.08.11.03.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:34:27 -0700 (PDT)
Message-ID: <4ff26d30-3b0d-4392-8bac-698ecb0fbdde@linaro.org>
Date: Mon, 11 Aug 2025 12:34:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 04/11] hw/arm/smmuv3: Enable command processing for the
 Secure state
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>, smostafa@google.com,
 jean-philippe@linaro.org
References: <20250806151134.365755-1-tangtao1634@phytium.com.cn>
 <20250806151134.365755-5-tangtao1634@phytium.com.cn>
 <0b38d386-9d8b-46bd-a981-718cc7281eb6@linaro.org>
 <f74b4d64-893f-4b39-aa95-4e9ff52edebd@phytium.com.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f74b4d64-893f-4b39-aa95-4e9ff52edebd@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Hi,

On 10/8/25 18:59, Tao Tang wrote:
> On 2025/8/7 05:55, Pierrick Bouvier wrote:
>> On 8/6/25 8:11 AM, Tao Tang wrote:
>>> This patch enables the secure command queue, providing a dedicated
>>> interface for secure software to issue commands to the SMMU. Based on
>>> the SMMU_S_CMDQ_BASE configuration, the SMMU now fetches command
>>> entries directly from the Secure PA space so that we need to pass the
>>> memory transaction attributes when reading the command queue.
>>>
>>> This provides a parallel command mechanism to the non-secure world.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> ---
>>>   hw/arm/smmuv3-internal.h |  8 ++++--
>>>   hw/arm/smmuv3.c          | 55 +++++++++++++++++++++++++---------------
>>>   hw/arm/trace-events      |  2 +-
>>>   3 files changed, 41 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
>>> index 1a8b1cb204..5b2ca00832 100644
>>> --- a/hw/arm/smmuv3-internal.h
>>> +++ b/hw/arm/smmuv3-internal.h
>>> @@ -319,9 +319,13 @@ static inline void queue_cons_incr(SMMUQueue *q)
>>>       q->cons = deposit32(q->cons, 0, q->log2size + 1, q->cons + 1);
>>>   }
>>>   -static inline bool smmuv3_cmdq_enabled(SMMUv3State *s)
>>> +static inline bool smmuv3_cmdq_enabled(SMMUv3State *s, bool is_secure)
>>>   {
>>> -    return FIELD_EX32(s->cr[0], CR0, CMDQEN);
>>> +    if (is_secure) {
>>> +        return FIELD_EX32(s->secure_cr[0], S_CR0, CMDQEN);
>>> +    } else {
>>> +        return FIELD_EX32(s->cr[0], CR0, CMDQEN);
>>> +    }
>>>   }


>> This looks like a reasonable and readable approach to support secure 
>> and non secure accesses.
> 
> Hi Pierrick,
> 
> Thank you so much for taking the time to review and for the very 
> positive feedback.
> 
> I'm very relieved to hear you find the approach "reasonable and 
> readable". I was hoping that explicitly passing the parameter was the 
> right way to avoid issues with global state or code duplication, and 
> your confirmation is the best encouragement I could ask for.

An alternative (also suggested in patch #1) is to use index for banked
registers.

For example we use M_REG_NS with Cortex-M cores (target/arm/cpu-qom.h):

     /* For M profile, some registers are banked secure vs non-secure;
      * these are represented as a 2-element array where the first
      * element is the non-secure copy and the second is the secure copy.
      * When the CPU does not have implement the security extension then
      * only the first element is used.
      * This means that the copy for the current security state can be
      * accessed via env->registerfield[env->v7m.secure] (whether the
      * security extension is implemented or not).
      */
     enum {
         M_REG_NS = 0,
         M_REG_S = 1,
         M_REG_NUM_BANKS = 2,
     };

And generally for address spaces (target/arm/cpu.h):

     typedef enum ARMASIdx {
         ARMASIdx_NS = 0,
         ARMASIdx_S = 1,
         ARMASIdx_TagNS = 2,
         ARMASIdx_TagS = 3,
     } ARMASIdx;

(not sure this one is appropriate here).


