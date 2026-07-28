Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1928FC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:50:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woj89-0007EH-Tp; Tue, 28 Jul 2026 10:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woj88-0007Dg-PB
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:50:04 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woj87-0002WZ-3F
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:50:04 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-845c92bc464so3320787b3a.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785250201; x=1785855001; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qXeyqD6qBKRU6fqapNM8AI24tkEcceS5f8qDV8l9Xgw=;
 b=W3+grCBQn5gdbFr9ZL1w7z2KY43pvIIIBpwevXVzF5fuT1MZT9DcApYIYXInkU5VfN
 sGE221eEQO6tpWrtjgMMzE5SkW6Psmzq+sMq2+z8SNEKXl4DR2EFdwr0bA0kkv3HE7+j
 7EUSMtKJez+5vdW2/TVmHnmL5W++c4jtPbOVqXtpqo1M5+dnWDzm+/XYN10r3BB2CpTQ
 pKS0iO/IBapYElC+q44iduunzi3HaF/vH+4tYA451ZuRAsm6qb0MdmJoFsBB/uHnKYsq
 dEG6eJE263Akknvo+2adt7WIdeE/BbLn5MC46lNc4hKHalOnYW8Fy2X8NIrh0o1HT86L
 KjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785250201; x=1785855001;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qXeyqD6qBKRU6fqapNM8AI24tkEcceS5f8qDV8l9Xgw=;
 b=qiiVrufLH9xA+R52aybiacw6R5W4Yrqr5ZWM5g1dWMw4l8znVgOntJeStxrgs9XWgq
 /sXDLXMF6Tw+dK5OG7YFLFkoKBQ0W8Lgyqbn2SkYSDrD/YYZN9Fp1p720+7MFWaraw9a
 HNZLyLpz6TmVrViY3WqkYJ1bBYEKWZ8He8GTEo3AdZwaUthHsP74RTXMPB/bdazCbmd8
 NKq+LIWpNvkotoabccwB2XkTs3Mqb1/V4eFNr0wHUVHvwigc3+k5HTIbUOeRZZtdufo1
 LjcYcSJAkDipcW+ET/V2onuGzb+fSVJO/MB7aOmGlRayI8PtBW7c138gH29kFMSG2Eu5
 1cnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGF7i0ltDi7+EDX0jMiAptzx+RKRsb0ydUk5+SDy+7i3cE7gT5Pp9X07ZQCxx+PmINn1SM9Qp+Sg==@nongnu.org
X-Gm-Message-State: AOJu0YxalJC5D9Y3031Gqdw8JYP6t+QFzs7KsDQ1jakRawVz+dW2ruG4
 i+mijQNbKgm7gmBseDO6PvGNHjT9/ptNcy+feo8PsP8NMXa7ieGUWIjmu0we2Bqs1NA=
X-Gm-Gg: AR+sD12BCcRET54yzKmatdEFj5FVqTKJfb6HbGa1TNebZAbojAjKQDM+LhK/muj5gXl
 2JiMxq73trMGDakc6RQ9WqoczAF8jS4Fs06vIZe1RsY15fXzqaAlZXarHDIJ+7M3wTABPfDrLzU
 VubvuGr7tFAVAHv+166OhyJ4hVZ/6+PUDTeTBvYIWkb260VN0jZrhhXxFLsnSODShmEzU+3gFHP
 neZOD6XHkY55GB/fSgGF5S7PjP1a8TJXL87hXCqUzhcCTxlprZ0u/FD1o0a41ewxzd2DTntIwPY
 ssGffKAv0eFsi5f8MgApbg3ZssL9agQf48E8xGJRv2WOjwJXiZfr9RAMb+tsHCH02L+xFDruof4
 2dVhz0U1uNnqm4IICnXhIx26nUZXvb1Y5m0xeBtpySgtZGA6hoqVBg0vKpuZPEa7pvlqI7DT9UG
 5qQIojAaj/eluOups89FIXgv3qcIxLb+C8BQ/7LV6SkX6XicbtnDst
X-Received: by 2002:a05:6a00:c8c:b0:84c:1cd2:142e with SMTP id
 d2e1a72fcca58-84e9314556fmr2923107b3a.23.1785250201159; 
 Tue, 28 Jul 2026 07:50:01 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84ea0373cd3sm41763b3a.42.2026.07.28.07.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:50:00 -0700 (PDT)
Message-ID: <151be7b4-3a86-44c6-83c3-31c01dd47654@linaro.org>
Date: Tue, 28 Jul 2026 07:49:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] target/arm: Implement FTMOPA (non-widening, FP32)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-2-richard.henderson@linaro.org>
 <CAFEAcA9DCByPPCL6fSnuMYmpBALNJaktyEB8ywAU2BU39GnaNA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9DCByPPCL6fSnuMYmpBALNJaktyEB8ywAU2BU39GnaNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 7/28/26 06:10, Peter Maydell wrote:
> On Tue, 14 Jul 2026 at 00:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
>> +static void sme_tmop(void *vza, void *vzn, void *vzm, uint64_t *zk,
>> +                     void *fn_opaque, uint32_t desc, MemOp esz,
>> +                     void (*fn)(void *, void *, void *, void *))
>> +{
>> +    intptr_t oprsz = simd_maxsz(desc);
>> +    intptr_t index = simd_data(desc);
>> +    intptr_t esize = 1 << esz;
>> +    intptr_t host_adj = HOST_BIG_ENDIAN ? 8 - esize : 0;
>> +    /* Base in bits for op3[index*:csize], csize = (VL * 2) / esize. */
>> +    intptr_t ctrl_base = index * oprsz * 2;
>> +    /* Create a zero for use with the largest esz. */
>> +    uint32_t zero = 0;
>> +
>> +    for (intptr_t row = 0; row < oprsz; row += esize) {
>> +        void *vza_row = vza + tile_vslice_offset(row);
>> +
>> +        for (intptr_t col = 0; col < oprsz; col += esize) {
>> +            void *e2 = vzm + (col ^ host_adj);
>> +            void *e3 = vza_row + (col ^ host_adj);
> 
> Having just read patch 4, is it possible to do this with the H
> macros rather than a manual host_adj, as we do in
> sme_tmop_2way_sh() there ?

Not without making copies of the function specializing on esz.  Of course, it turns out 
after the fact that only two esz are used, so perhaps it's not that bad.  But the element 
selection logic was confusing enough to suggest just one function.


r~

