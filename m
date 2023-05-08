Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2197757ejq;
        Mon, 8 May 2023 10:34:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5t9j1UIbsDe+WXgONIhuCXKuS+2caRJoaueo1EPjquCPNdEeDgkx/ky7b0ZF+w2CM1pZo3
X-Received: by 2002:a05:622a:54f:b0:3f0:ae16:685c with SMTP id m15-20020a05622a054f00b003f0ae16685cmr16589341qtx.61.1683567247165;
        Mon, 08 May 2023 10:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683567247; cv=none;
        d=google.com; s=arc-20160816;
        b=BpbwKtvDVDmanr8xcP6PvT1J26csh227wjRQ0Eq4hxpMuur2PBU8Pjt8EkLfE38izY
         5h31I3o50/RmVZAQs+IhrnJBcg0MQHa2BxLEbgJnWrK6RC5l6Cl5IaVWQBoxv7fxUpeb
         fgRY7Uh8AgHLuDsBM/EWo1u5Lw2EOcumCo20Tsp3xwWfQFkUs8Y6OcUyPkxZftF7I+PY
         y9Z2lTpCjZ6ZiP/evrBqaj1A7itjB3303pEvKHyaChLX9waPeCaQCQoIX+vQH8PCo2o2
         efInUE5geOWi0MeKjzbYrgigg7lV0H4gxpIIsXkj0LijhsP5qkJRhvLnCEPxHoB1Dmcb
         r9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TyGWmb4jftapJkM1KAGRfZBkads5mtllx4kmPYXMNoI=;
        b=Edi+ItPNZBkdZ3bh/BhD2VZAjOijV/i00qn5jFeZGnfMGgzVZxkZqaV9KMrUBHW4Xu
         FgmnLKYKPH8bKj+8xQuV2l7sIdGmVDC2/mN98kci2Tji9UXXyR/G4whtJ1GGYXay3NCe
         xP9DOVFZ/egjINjevJp2qau7ykfH7/HSf8CIWtBnLJrr97Z07lgq5iR7SCDxUhvF98Qx
         8BjlwOpyy1jPESFNi89eCBjLkk5Fz1qgMTw0q0WUhDCPZhUYe+YnQQLBrlmClMLhS0hs
         xZ6kEd+qY8AJCqLOS04H24CbukqG0TueFpNTB1I5iIOgkNpAU91vP/hkb9JdZlVtKLWL
         tDoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO3bMgnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020ac85e52000000b003e098f36ce8si3179635qtx.109.2023.05.08.10.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 10:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UO3bMgnJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw4kL-0001dn-Pu; Mon, 08 May 2023 13:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4kK-0001ck-AH
 for qemu-arm@nongnu.org; Mon, 08 May 2023 13:34:00 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4kB-0005ck-1Y
 for qemu-arm@nongnu.org; Mon, 08 May 2023 13:34:00 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-55a1462f9f6so45107697b3.3
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683567229; x=1686159229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TyGWmb4jftapJkM1KAGRfZBkads5mtllx4kmPYXMNoI=;
 b=UO3bMgnJvVg6A4TLeO6qJq8kPf609tu+bVPr2KMJmpP6ER+su66MFY4/Gv6mVRl3a5
 A5qLtfVBvxUrRB5scc/kjD2FOf5My6ga/OBVKSKc5na5Ie/0u+xagtApSrc/rbn757H9
 g+h73v0Q9IZ9GWtNrPVDJNhxdMcIM593tvbUerdckyvKOIHGpj66pj83JAz+tYra11Ln
 GpkE9L14FiNzpaWFFwgjQeP37Spyhb/2NDs3Loh9g4L4m8pfoOi+kYVVLh73fe15TrwS
 JZxepZLLf0iKWJRyDGItK6IWH4nrf15mHqoKaRb+K41cmW6H4bcijpGMJ77dvaqjvN5f
 Zj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567229; x=1686159229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyGWmb4jftapJkM1KAGRfZBkads5mtllx4kmPYXMNoI=;
 b=cWb5NCt7zAurQqYwowU9VcR7pwkrnu24H11frEHqXeiHUgDpTJgk7OQdzsG+X3Z6Bp
 7ORBSOUNxvBmJzmADOw5p2PjofuMKL7NJ01DHbT3VM0VJqE9l1QJp+0JeWANXi3tz42q
 1CW7g2US4EdjUP3WHuDSIV8WKPqSLgnncu2vGnJz2NNnjNHNVXOEwCNUgTNRYtg57VXL
 n2iEjaTM24Z496bLGfuES1YRwm1rueT43R0ut6mg9MbycJ3QkT3Xw6QXLafWj1gkPkKI
 zsZfZvW0VD8LvUyIfCPCrwY4qGKM6jI2a1YAgLwe3wrzoQj5s1CQF7eWALlaYhP9FLlL
 7Y2Q==
X-Gm-Message-State: AC+VfDyb7kwV9xF0OIlF/arSui/03WeMJQtG3fpVkfclyCFq9lAHV4Il
 DuHaVzH7EKDV9zDevyApwD0Fkw==
X-Received: by 2002:a0d:c341:0:b0:556:bfac:ad12 with SMTP id
 f62-20020a0dc341000000b00556bfacad12mr4881101ywd.16.1683567229368; 
 Mon, 08 May 2023 10:33:49 -0700 (PDT)
Received: from [192.168.110.227] ([172.58.139.115])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a25a2d0000000b00b9e6f1f9c76sm2407808ybn.29.2023.05.08.10.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:33:48 -0700 (PDT)
Message-ID: <1e19b569-fbc1-89f2-3616-bc319d3c63e7@linaro.org>
Date: Mon, 8 May 2023 18:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-50-richard.henderson@linaro.org>
 <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2h1GYvtB6iSo

On 5/5/23 14:19, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index 37870c89fc..4dd33c73e8 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>>   {
>>       TCGLabelQemuLdst *ldst = NULL;
>>       MemOp opc = get_memop(oi);
>> -    unsigned a_bits = get_alignment_bits(opc);
>> -    unsigned a_mask = (1u << a_bits) - 1;
>> +    MemOp a_bits, atom_a, atom_u;
>> +    unsigned a_mask;
>> +
>> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
>> +                                    MO_ATOM_IFALIGN, false);
>> +    a_mask = (1u << a_bits) - 1;
>>
>>   #ifdef CONFIG_SOFTMMU
>>       unsigned s_bits = opc & MO_SIZE;
> 
> Same remark as for ppc.

Because the alignment was not required outside of prepare_host_addr.
RISC-V does not have 128-bit memory operations of any kind.


r~

