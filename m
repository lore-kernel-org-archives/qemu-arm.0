Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1437315ejb;
        Fri, 16 Feb 2024 11:18:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8QHoNXD8EIiVGpPSJPe7bYd1KclKplRIg8mJbQIuBYfKy33kIpxGXoKu3aBKarNit+rNXKX3bblrERMu5QCtDlafJbii/
X-Google-Smtp-Source: AGHT+IHwyDVmovfjUS78VWrBvddQCvJlLZ2G228vcrIiYc549Nh1K1DsODm7vvJIMI8AIdEDi5GR
X-Received: by 2002:a05:6808:3006:b0:3c0:32f9:8a38 with SMTP id ay6-20020a056808300600b003c032f98a38mr6014409oib.52.1708111107284;
        Fri, 16 Feb 2024 11:18:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708111107; cv=none;
        d=google.com; s=arc-20160816;
        b=d5eA6WYFmARQYlciZXiwqZiaumMSpIKWRZnzYlDLmyyJ3tKdycRobPI1044wTHe2Xk
         nk8e+HHIcrVheY8gyKiOrRxrLi0nunMB5f6S8QInSAT6DDth/ZsvSnZlYuJuDyZbjTlj
         NV3A1Y4Luieo314OSlSB6iEqXnVzGxU11Mfx59gbhhAvhUZ5Q9QPdrl1Pk6Dgnivyvrz
         0Pt5OIsods5EWoUM6q36BhPLjbjGZlRwj98yP9q7n2AsjioaLt5Y5fCE6ClCWs7DxrVM
         Xmai4mjHu7D9P0WbcZTbePrRkDx3ZwxzH/WNFdHh8BSMIVQthmHRDYx8riVesaeCEnmf
         4Vpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ipa2AM2+0IQzaimn5gn7z5C81bygfD9LxyUBDHSCB1E=;
        fh=oS77B68A7imEv8fDKku8a5T6wOmcwkGUNq5F7EslyaM=;
        b=VxQMH7jfhYN639mAqfckCufqLroqRBYdIOyJmnmLXHlpnO4Zz/q+nIQ/r7tURgsnwY
         3KzxB6JCHZwKkMzU8jWsWnlhbpIYtMTlCsBzWz2UCNkMEgv/GeC+VUTy9jIuj5E6BLLp
         2MrP849bQZ3RcqW6YjJhuykdfpIv6WsnL3gMY5+Y8sxW17zp/yOsWVegxwtL6tM9jHFC
         DGFMorYz2K8jmNYyzLZ7X3DMBQ2em8zr33hQmh1lXX+C3cbN+deQ4J/ZgIzxbxVMZ7gK
         yTtzv60QbcAv35wEoOhbORHk70nIpjl57C1Kc9jeXGI6nmOFja1bZT4Hfciy9K1P+Thf
         YHJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfErnamA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a0562141d2e00b0068cb0a77fb2si452937qvd.342.2024.02.16.11.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 11:18:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfErnamA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb3iV-0006wn-83; Fri, 16 Feb 2024 14:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rb3iR-0006w9-Ia
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 14:17:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rb3iM-0001PL-AR
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 14:17:42 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1d93edfa76dso9560495ad.1
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 11:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708111056; x=1708715856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ipa2AM2+0IQzaimn5gn7z5C81bygfD9LxyUBDHSCB1E=;
 b=lfErnamAJX82tJYnrQ+CPCAfJG3vwEIFKPjD3NCCAW1mJqeZQkVceHCcT9qf4+/tDo
 zdfo3ipYG7zzh9oLjvXjkQJAYloAoh7xfP8dJQUG+LziKxqkuFquPsLf+e+BodKTCD4R
 1p3emBcsDYpsBmo+0VY7Hv4tv4sJUWrm4KZdh+VMxufEC0hW+ajDFiEHvp7PtSxS8D+B
 2ny+T43No1h7Yex0KIPVJeBuVQsT4L3JKEOXOqoSrxADTTjFwXcCdohdehu52MjeCA3L
 HpZHo7k4whl/k21p/VmNr/d5bhMBvFTWjiGwOR4wxl73rMNFpd/seg+H8qWvjPbBFt8i
 E+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708111056; x=1708715856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ipa2AM2+0IQzaimn5gn7z5C81bygfD9LxyUBDHSCB1E=;
 b=CoVm/x9I5JIWWiLKb74SQGwyN4CvovtXcWk0LcguTi5fhQaOyFz6KAZBsyS8a7k6EM
 VzAX1iUvlb4KAi0o9wUbKoe0vW8rmtfe4M7zLEc6QFWqIVTdEit/z8EB3kMCh9FuzJQu
 c8s5FETUlaGqs2Xo4fDPv3R3m3GwVgWrZKQjVBPGPYyPJ8g4eNgmeQcfr/GYvql+HGoG
 3TBtFfTzfsy758o2vnaask942yIw2V3im8huUy75Q/uRJH38HSlCFR/+95oOtuBSDu3s
 OA53HB84tje9pVlSYBq5skj/CLxPCnILhsedqO8BW9JvGKZFjokrOsfnrFuBB8pFRBSx
 DNiw==
X-Gm-Message-State: AOJu0Yyisnw0XVT9b+KuuFSOBDuOOxcNe/CO15muejQDfIcuTZMLCVli
 1xzigTCmtTDuIlmN03hZiVZc3C2DSOvg6ba6FNURJaboe+hWcGksm+eWOO4HFBU=
X-Received: by 2002:a17:902:7ec2:b0:1da:192f:3eb2 with SMTP id
 p2-20020a1709027ec200b001da192f3eb2mr4309447plb.46.1708111056525; 
 Fri, 16 Feb 2024 11:17:36 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 p3-20020a170902c70300b001db86c48221sm217260plp.22.2024.02.16.11.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 11:17:35 -0800 (PST)
Message-ID: <b93bf454-723e-456b-9328-2e2ec74070e0@linaro.org>
Date: Fri, 16 Feb 2024 09:17:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/arm: Adjust and validate mtedesc sizem1
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
 <20240207025210.8837-4-richard.henderson@linaro.org>
 <572bd0e6-002e-4990-a9e0-e70eec65fd93@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <572bd0e6-002e-4990-a9e0-e70eec65fd93@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UveQ8Irb5Car

On 2/16/24 05:12, Michael Tokarev wrote:
> 07.02.2024 05:52, Richard Henderson :
>> When we added SVE_MTEDESC_SHIFT, we effectively limited the
>> maximum size of MTEDESC.  Adjust SIZEM1 to consume the remaining
>> bits (32 - 10 - 5 - 12 == 5).  Assert that the data to be stored
>> fits within the field (expecting 8 * 4 - 1 == 31, exact fit).
>>
>> Cc: qemu-stable@nongnu.org
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h         | 2 +-
>>   target/arm/tcg/translate-sve.c | 7 ++++---
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index fc337fe40e..50bff44549 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -1278,7 +1278,7 @@ FIELD(MTEDESC, TBI,   4, 2)
>>   FIELD(MTEDESC, TCMA,  6, 2)
>>   FIELD(MTEDESC, WRITE, 8, 1)
>>   FIELD(MTEDESC, ALIGN, 9, 3)
>> -FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
>> +FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
>>   bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
>>   uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
>> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
>> index 7108938251..a88e523cba 100644
>> --- a/target/arm/tcg/translate-sve.c
>> +++ b/target/arm/tcg/translate-sve.c
>> @@ -4443,17 +4443,18 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 
>> addr,
>>   {
>>       unsigned vsz = vec_full_reg_size(s);
>>       TCGv_ptr t_pg;
>> +    uint32_t sizem1;
>>       int desc = 0;
>>       assert(mte_n >= 1 && mte_n <= 4);
>> +    sizem1 = (mte_n << dtype_msz(dtype)) - 1;
>> +    assert(sizem1 <= R_MTEDESC_SIZEM1_MASK >> R_MTEDESC_SIZEM1_SHIFT);
>>       if (s->mte_active[0]) {
>> -        int msz = dtype_msz(dtype);
>> -
>>           desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
>>           desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
>>           desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
>>           desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
>> -        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
>> +        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, sizem1);
>>           desc <<= SVE_MTEDESC_SHIFT;
>>       } else {
>>           addr = clean_data_tbi(s, addr);
> 
> There's no question about stable-8.2 here, this change needed there.
> But I've a question about stable-7.2 - does it make sense to pick this
> one up for 7.2?  It quickly goes out of control, because this one
> is on top of
> 
>   523da6b963455ce0a0e8d572d98d9cd91f952785 target/arm: Check alignment in helper_mte_check
>   (this one might be good for 7.2 by its own)
>   which needs:
>    3b97520c86e704b0533627c26b98173b71834bad target/arm: Pass single_memop to gen_mte_checkN
>    which needs:
>     6f47e7c18972802c428a5e03eb52a8f0a7bebe5c target/arm: Load/store integer pair with one 
> tcg operation
>     which needs:
>      needs 128bit ops
>      659aed5feda4472d8aed4ccc69e125bba2af8b89 target/arm: Drop tcg_temp_free from 
> translator-a64.c
>      ...
> 
> So I think it's not a good idea to go down this hole..
> 
> Probably ditto for the other two:
>    target/arm: Split out make_svemte_desc
>    target/arm: Handle mte in do_ldrq, do_ldro
> 
> Makes sense?  Or it's better to do a proper backport?

I don't think it makes sense to go back too far.

r~

