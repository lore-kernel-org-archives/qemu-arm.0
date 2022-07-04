Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3071835lft;
        Mon, 4 Jul 2022 02:10:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGodeM6LmDdNv/8c/+l0DPNWudBxCB4j1wNGmsi5TRiaJZeK3cL4r22njEEvZgFBzTH0Vm
X-Received: by 2002:a25:9b88:0:b0:66d:b166:a430 with SMTP id v8-20020a259b88000000b0066db166a430mr22838778ybo.80.1656925835166;
        Mon, 04 Jul 2022 02:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656925835; cv=none;
        d=google.com; s=arc-20160816;
        b=ECG9v5jFd3f1uF+i3bJIMGiJ9w/J+gi5roZL3lwz1eqmZwJbXuQ8YGz2h1iO4ofAaQ
         lNu0X0IeBvKK4LHTMSIsNcj6ituTNNquUL67Ky2ijat3Da1HBe/tyuDC+8VOUC6a0MCz
         kk5yE1x3+SZ0qQ/nqOA4CiCX/7qAoijFk7tmd7YfbVWh+22jJ+pDkZw9hddcXE2t45go
         g0JIsSt7Q2ncCOIEsdS+8+DPgj27JBvnaVso1J9v5WtZ4lJo2Yv+p0z494NdIEl64GVd
         bdg1vFRVTUcopHL0AM9OgrjRlokzpn/zpTs5t/lq9zTpXxJgoB2qt+EFU4Ae/AILQUeH
         kzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BzSYqUDqIh66HgbhWmV+ZxG3+ESGQuCVc9Av+YEBkFc=;
        b=kWNGb0M0eqNjvkLXoyin1+su46D1q/5ZUQw6xVwr3RlIMjHCg9KH0AuWkswWVdbqbF
         Rbo3cDUfovqIgCTfYuJdJA3vSKFoPyODXE26je759ySc60KYsLgLSubikwTaku3D8nGB
         YeRhzWYtbSpVtvExnwzP1O0+MnyfRVB832NkQayG8EVTNDC+wqwpSwEGvsn4fV12VJbc
         KtJPxGzMSAMh239HdbyJFEqmKxHOIhboy6B33EV5IDEAG1o9EOwKv3+TwVTGu61/vp56
         a00j5uVo8wp1ezUjvuWvuDmD6cInz/64+Y+8VmUk396tMACjavHmKB3S5jhv4UQvK2HJ
         OVGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q33JID0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a250b0e000000b0066e207eab72si8711295ybl.2.2022.07.04.02.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 02:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q33JID0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8I6E-0008WU-HB
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 05:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8I4O-0006G6-6d
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:08:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8I4M-0001Eu-9m
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:08:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so4648183pjm.2
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BzSYqUDqIh66HgbhWmV+ZxG3+ESGQuCVc9Av+YEBkFc=;
 b=q33JID0N3HuGxQNQtODokipRa0WkqEQ2GL+m7IW1U6fxOFn0Ez4M/84OmRbSLivM+9
 ac3VB9r2UB3j9dX8STmLbbS7gxEgKBFjBVLAxz3a/sHrZQaztnSXbFVKwFGukp8kmqzF
 Pbj7tB/GHN3kyYQNiEkd3ar95Y3p57VEqhQWYBl9akqUG6Mo+6aHKrlHSXBEKF2k5P8N
 EdGBrI8Y1XEdriCUY6UaJNL4lAJHF40b7tQEjIp2vGr6K6GtsM8Tqk5wbIeUijS+TVQM
 mIdrCkpgwmYV0U3fa8n/CC1zJu0PSOz4ODORe8+RMAUPfBNQkVlZhRx3+JVEoxuRiE3M
 gkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BzSYqUDqIh66HgbhWmV+ZxG3+ESGQuCVc9Av+YEBkFc=;
 b=Ns5VQT1XwLV7lW82cherMRPHfUNsvYoBPe2RqRFze6kyKqYWhdkCaL2fuikt1oMwQt
 QslaDQ8ROJVJrqP3hGEv8HRDfyDLADXaE4nWzTk5YjsZmiZwOh0bu04MBWOuilzoVhIo
 60FcRdV1trGxShJWZEHdmUI4pXFl7hSOI+31UXbgLuzb8KI7GrCu3KlHs2HYZ2T7aKip
 P4wjcmQpAWtVFyQ3vglkfqZt0J2F2+8zJL0u8X/6VlM3pjUWeq3001iXz57hmKvxCq6I
 dAcdAEqm/LvErXsXUdWVEpWeTTOJvDQxfHble9RqM44NqXM8DpTpMwLzQjEjhklGVgSq
 uP0A==
X-Gm-Message-State: AJIora+lxdHCNK8to4vUh8aMwLEQIOW4MWGhUif5egKiungXifHa4A+k
 N7R67byf3ZehSalTCGddOpfYpQ==
X-Received: by 2002:a17:90b:4f8c:b0:1ed:243:ba07 with SMTP id
 qe12-20020a17090b4f8c00b001ed0243ba07mr35077256pjb.89.1656925716631; 
 Mon, 04 Jul 2022 02:08:36 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a170902b71000b0016a7b9558f7sm18026270pls.136.2022.07.04.02.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:08:35 -0700 (PDT)
Message-ID: <6176e126-60ae-7de5-1b22-dcfa585f4de6@linaro.org>
Date: Mon, 4 Jul 2022 14:38:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 19/45] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-20-richard.henderson@linaro.org>
 <CAFEAcA-v6_atdSMggO7mAfW0H96F8s2fZWLD3biHLjsFnbzYgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-v6_atdSMggO7mAfW0H96F8s2fZWLD3biHLjsFnbzYgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GIfR5a0t1E0v

On 7/1/22 21:49, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 05:40, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We can reuse the SVE functions for implementing moves to/from
>> horizontal tile slices, but we need new ones for moves to/from
>> vertical tile slices.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
>> index eef2df73e1..95159862de 100644
>> --- a/target/arm/sme_helper.c
>> +++ b/target/arm/sme_helper.c
>> @@ -19,8 +19,10 @@
>>
>>   #include "qemu/osdep.h"
>>   #include "cpu.h"
>> -#include "internals.h"
> 
> Did you mean to delete this #include line ?

I meant to go back and remove it from whence it came, but kept forgetting.

>> +void HELPER(sme_mova_cz_d)(void *za, void *vn, void *vg, uint32_t desc)
>> +{
>> +    int i, oprsz = simd_oprsz(desc) / 8;
>> +    uint8_t *pg = vg;
>> +    uint64_t *n = vn;
>> +    uint64_t *a = za;
>> +
>> +    for (i = 0; i < oprsz; i++) {
>> +        if (pg[H1_2(i)] & 1) {
> 
> The documentation of the H macros says
> "The H1_<N> macros are used when performing byte arithmetic and then
>   casting the final pointer to a type of size N."
> but we're not casting anything to a 2-byte type, so what's happening here?

Yep, error.

>> +void HELPER(sme_mova_cz_q)(void *za, void *vn, void *vg, uint32_t desc)
>> +{
>> +    int i, oprsz = simd_oprsz(desc) / 16;
>> +    uint16_t *pg = vg;
>> +    Int128 *n = vn;
>> +    Int128 *a = za;
>> +
>> +    for (i = 0; i < oprsz; i++) {
>> +        if (pg[H2(i)] & 1) {
>> +            a[i * sizeof(ARMVectorReg)] = n[i];
> 
> Is it really OK to do this with an Int128 store? That is
> in host-order, but the two halves of a 128-bit quantity
> in the ZA array are in architectural order. I suppose the
> source also will have them in the architectural order, but
> it does look odd, especially uncommented.

Would memcpy be better for you?

>> +    /* Resolve tile.size[index] to an untyped ZA slice index. */
>> +    t_index = tcg_temp_new_i32();
>> +    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
>> +    tcg_gen_addi_i32(t_index, t_index, index);
> 
> This code isn't doing what the comment says; it's just calculating
> the (not-yet-taken-MOD-dim) slice index, which does depend on the type.

I guess the comment applies to a larger section than just these two lines.

> 
>> +
>> +    len = ctz32(streaming_vec_reg_size(s)) - esz;
> 
> What is this the length of ?

The length of the extract, aka the mod.

>> +        /* The tile slice offset within env->zarray is the column offset. */
>> +        offset = tile;
> 
> I don't understand why we can just add the tile index
> (which is going to be an integer 0, 1, 2..) to a byte offset.
> In the horizontal case we add tile * sizeof(ARMVectorReg),
> which makes more sense to me.

Hmm.  I think you're right this should be tile * column width, or

   offset = tile << esz;

I wish I could compare vs FVP...

>> +        /*
>> +         * For big-endian, adjust the column slice offset within
>> +         * the uint64_t host words that make up env->zarray.
>> +         * This must wait until index and offset are combined.
> 
> Why? Neither the byte-offset of the start of the tile nor
> the byte offset of zarray in CPUARMState ought to be non-8-aligned.

Columns will not be 8-aligned.  On page 38 of 0616A.a, see the illustration of ZA0V.B[22], 
which is 6 mod 8.

I'll try and improve the commentary.


r~
