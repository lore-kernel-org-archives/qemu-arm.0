Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1293176ejb;
        Fri, 16 Feb 2024 07:14:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqLGkW/lSeXBYLVlFK5IGZ0Up8zvlcTQOnUZCYxVatHthkeFlnVfWvgRVUxup369RDG7+LrzxZMXoInJ7K9qo8X62g7lgl
X-Google-Smtp-Source: AGHT+IFVmn+FNlHCpdVUVrQzGY4r+Gl4MmsA04VJpW5e/CSBY6O7r+hHgZtKw7z97zQYXBSX+BeJ
X-Received: by 2002:a05:600c:1d16:b0:411:c641:a1cb with SMTP id l22-20020a05600c1d1600b00411c641a1cbmr4170226wms.29.1708096441443;
        Fri, 16 Feb 2024 07:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708096441; cv=none;
        d=google.com; s=arc-20160816;
        b=dd2f/1ksgRYhMQdvgeLZBupAN/wQSa0+mWu9St+7WvU9aKbOzMDxVOB/4tuC8ekL+9
         zuCHKRM0CW8fS/PI+9uvfK/lXmFDjVwNSPLsR3ejN0SJob6h+pci8FM0/5W7sMTIpCGr
         ht7+UG2814rg/M8KCyULpR8RjX3tt/xWnn9vM8CN21M1tnCiNaoonOKUTnJSvz1kf/X5
         wfioqNzkx4a+0JvI0zP9tQqIK2+AnU4D3xAXwpDXrjB8iwTB5oV1xS7UbPnzjQeYqxpP
         kwpnY+pGbdvpbSC0EUy7Q2b1GGSGaK8faIAmcgVwr3CXPCAlBhfx5QN2A9rYnUzQGVUM
         nosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=F3PJJYA2nZlZi/5UETmeE4BPv9o6wAsk50sXtv8oPWA=;
        fh=jF9xvB1isI+SkcMsDll0LN1MFJK7gW55/AqUVS0WoIE=;
        b=f+/4aZmWfof5U2rExvEVI4yPgU770jLl73j16X1ZjSFZuWiQc0eAY1xUn8FH4bDT7t
         kXTcewAWhaFpP5vvI7I1pRS7YrETUlnfe5I6y+xOdqVd9WEppFmlJNIAtN6Va8N8RLkM
         pBlEJrg2iAaB/oL+OAIi+f6nIma62jFHDbsuNUE6xLK40hNmqFslOUETIbWxSTgF1Jg3
         R8c2Jf+Fc5nA/JqLNoe9ys3HO+GpFjhyy/OaYcAKK1msoi9KSAtEmg6j4POw7QzxABZ3
         rSI+nS6TnYcYKRFuS/4yjeLNPb2c4ImUnk6cTXBUr6AQBRE5iVEatqkTV+OWWI76kZ2Q
         lU5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020a05600c315000b00410b0bbb354si1050203wmo.234.2024.02.16.07.14.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:14:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raztl-0006m5-0W; Fri, 16 Feb 2024 10:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1raztj-0006lW-Os; Fri, 16 Feb 2024 10:13:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1raztg-000384-JI; Fri, 16 Feb 2024 10:13:07 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F379C4DF67;
 Fri, 16 Feb 2024 18:13:04 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3E43481766;
 Fri, 16 Feb 2024 18:12:53 +0300 (MSK)
Message-ID: <572bd0e6-002e-4990-a9e0-e70eec65fd93@tls.msk.ru>
Date: Fri, 16 Feb 2024 18:12:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/arm: Adjust and validate mtedesc sizem1
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
 <20240207025210.8837-4-richard.henderson@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <20240207025210.8837-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 8LMaWkzVwn/c

07.02.2024 05:52, Richard Henderson :
> When we added SVE_MTEDESC_SHIFT, we effectively limited the
> maximum size of MTEDESC.  Adjust SIZEM1 to consume the remaining
> bits (32 - 10 - 5 - 12 == 5).  Assert that the data to be stored
> fits within the field (expecting 8 * 4 - 1 == 31, exact fit).
> 
> Cc: qemu-stable@nongnu.org
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h         | 2 +-
>   target/arm/tcg/translate-sve.c | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index fc337fe40e..50bff44549 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1278,7 +1278,7 @@ FIELD(MTEDESC, TBI,   4, 2)
>   FIELD(MTEDESC, TCMA,  6, 2)
>   FIELD(MTEDESC, WRITE, 8, 1)
>   FIELD(MTEDESC, ALIGN, 9, 3)
> -FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
> +FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
>   
>   bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
>   uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
> index 7108938251..a88e523cba 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4443,17 +4443,18 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
>   {
>       unsigned vsz = vec_full_reg_size(s);
>       TCGv_ptr t_pg;
> +    uint32_t sizem1;
>       int desc = 0;
>   
>       assert(mte_n >= 1 && mte_n <= 4);
> +    sizem1 = (mte_n << dtype_msz(dtype)) - 1;
> +    assert(sizem1 <= R_MTEDESC_SIZEM1_MASK >> R_MTEDESC_SIZEM1_SHIFT);
>       if (s->mte_active[0]) {
> -        int msz = dtype_msz(dtype);
> -
>           desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
>           desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
>           desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
>           desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
> -        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (mte_n << msz) - 1);
> +        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, sizem1);
>           desc <<= SVE_MTEDESC_SHIFT;
>       } else {
>           addr = clean_data_tbi(s, addr);

There's no question about stable-8.2 here, this change needed there.
But I've a question about stable-7.2 - does it make sense to pick this
one up for 7.2?  It quickly goes out of control, because this one
is on top of

  523da6b963455ce0a0e8d572d98d9cd91f952785 target/arm: Check alignment in helper_mte_check
  (this one might be good for 7.2 by its own)
  which needs:
   3b97520c86e704b0533627c26b98173b71834bad target/arm: Pass single_memop to gen_mte_checkN
   which needs:
    6f47e7c18972802c428a5e03eb52a8f0a7bebe5c target/arm: Load/store integer pair with one tcg operation
    which needs:
     needs 128bit ops
     659aed5feda4472d8aed4ccc69e125bba2af8b89 target/arm: Drop tcg_temp_free from translator-a64.c
     ...

So I think it's not a good idea to go down this hole..

Probably ditto for the other two:
   target/arm: Split out make_svemte_desc
   target/arm: Handle mte in do_ldrq, do_ldro

Makes sense?  Or it's better to do a proper backport?

Thanks,

/mjt
