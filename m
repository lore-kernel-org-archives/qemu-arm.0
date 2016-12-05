Received: by 10.25.159.131 with SMTP id i125csp1664406lfe;
        Mon, 5 Dec 2016 09:22:15 -0800 (PST)
X-Received: by 10.200.41.100 with SMTP id z33mr49174990qtz.154.1480958535665;
        Mon, 05 Dec 2016 09:22:15 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id 23si9367708qkd.84.2016.12.05.09.22.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 09:22:15 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id n204so40276251qke.2;
        Mon, 05 Dec 2016 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=mcGK4GePYrayWVNc2Er+y3CkTPwWWPYryOwlLCqEVSc=;
        b=KJzXB746p0mwea1v7SD8oR1S4b+bvyysd+ITJn1zENmRHKdq90Xx52pJAiBX0QPB21
         Ofsi955toHK8NO/K4BrPbGxKcGrUw9hJuAb2HztUYdrLtnTG2ZVtMgdvUmsa4++1bBka
         t4q034b2l/AbI+cZrkEfKMsukYb3lEWkL1P4vzLB1TtP3S8HSEe9o9zcc6CL36x2W35W
         rpd7ZZL6Cv+SlLG4GzZ1HdSO7QXa8B9B82sh6UNryrGQ0iA11xTp5raIWkGVaP/VYr1S
         ZwCgCtyKCVSJcQujhDX6pEGCI1HtpVz8jtSlHWSAbjjkzE9YLvDCJRWyau8sPRiXrFju
         dBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=mcGK4GePYrayWVNc2Er+y3CkTPwWWPYryOwlLCqEVSc=;
        b=L+5HeEtvQ/sVKAeUXmgfQZEe0EcdWVFlYuwiFc4lt6PkT+vlisfXiSPkNUbopfux0J
         uHjsccYiC1xZsgxfFVNMFnduBg1yAqjRksbb/vsfRD4DqgGffP1L3PufmwN7/P5vsRsu
         3EwS4/PaWqezWTxutYEg6Bpz8c4sJfNOcz907GDNmLA7PFjrxDEr3gaxp8FwPfTwVEK5
         /Egtseeemo31Iurj5FuvbBHQL3eKoha4jqFO2x9Zq4BhoZKxvHp+nmM2Mb0a/moVb6mk
         RHGf5Uck+oGpdKqfuqfSRYs6xBoZQPO1zaizFWQRaN5vib3mt9KZhWGzqGq+xTwXG3J5
         2RFw==
X-Gm-Message-State: AKaTC01wgWlvvb53vew3aA+5dtjUOVKMX0VQltZIAA4pMnU+d+2FCZisM+Luh+P+9eJlZA==
X-Received: by 10.55.185.133 with SMTP id j127mr49332463qkf.39.1480958535196;
        Mon, 05 Dec 2016 09:22:15 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id 21sm9912639qkh.4.2016.12.05.09.22.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 09:22:14 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-2.8] target-arm/translate-a64: fix
 gen_load_exclusive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 stefanha@redhat.com, peter.maydell@linaro.org
References: <20161202173454.19179-1-alex.bennee@linaro.org>
 <8737i21vl8.fsf@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, cota@braap.org,
 qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0bde5bb4-091e-e250-b283-5f1faf8e4351@twiddle.net>
Date: Mon, 5 Dec 2016 09:22:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8737i21vl8.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: bAea9XBbPb4M

On 12/05/2016 03:09 AM, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> While testing rth's latest TCG patches with risu I found ldaxp was
>> broken. Investigating further I found it was broken by 1dd089d0 when
>> the cmpxchg atomic work was merged.
> 
> CC'ing Paolo/Richard
> 
> Do you guys have any final TCG fixes planned for 2.8 that can take this
> fix for the ldaxp regression?
> 
>> As part of that change the code
>> attempted to be clever by doing a single 64 bit load and then shuffle
>> the data around to set the two 32 bit registers.
>>
>> As I couldn't quite follow the endian magic I've simply partially
>> reverted the change to the original code gen_load_exclusive code. This
>> doesn't affect the cmpxchg functionality as that is all done on in
>> gen_store_exclusive part which is untouched.
>>
>> I've also restored the comment that was removed (with a slight tweak
>> to mention cmpxchg).
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target-arm/translate-a64.c | 42 +++++++++++++++++++-----------------------
>>  1 file changed, 19 insertions(+), 23 deletions(-)
>>
>> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>> index de48747..6dc27a6 100644
>> --- a/target-arm/translate-a64.c
>> +++ b/target-arm/translate-a64.c
>> @@ -1839,41 +1839,37 @@ static void disas_b_exc_sys(DisasContext *s, uint32_t insn)
>>      }
>>  }
>>
>> +/*
>> + * Load/Store exclusive instructions are implemented by remembering
>> + * the value/address loaded, and seeing if these are the same
>> + * when the store is performed. This is not actually the architecturally
>> + * mandated semantics, but it works for typical guest code sequences
>> + * and avoids having to monitor regular stores.
>> + *
>> + * The store exclusive uses the atomic cmpxchg primitives to avoid
>> + * races in multi-threaded linux-user and when MTTCG softmmu is
>> + * enabled.
>> + */
>>  static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
>>                                 TCGv_i64 addr, int size, bool is_pair)
>>  {
>>      TCGv_i64 tmp = tcg_temp_new_i64();
>> -    TCGMemOp be = s->be_data;
>> +    TCGMemOp memop = s->be_data + size;
>>
>>      g_assert(size <= 3);
>> +    tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
>> +
>>      if (is_pair) {
>> +        TCGv_i64 addr2 = tcg_temp_new_i64();
>>          TCGv_i64 hitmp = tcg_temp_new_i64();
>>
>> -        if (size == 3) {
>> -            TCGv_i64 addr2 = tcg_temp_new_i64();
>> -
>> -            tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s),
>> -                                MO_64 | MO_ALIGN_16 | be);
>> -            tcg_gen_addi_i64(addr2, addr, 8);
>> -            tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s),
>> -                                MO_64 | MO_ALIGN | be);
>> -            tcg_temp_free_i64(addr2);
>> -        } else {
>> -            g_assert(size == 2);
>> -            tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s),
>> -                                MO_64 | MO_ALIGN | be);
>> -            if (be == MO_LE) {
>> -                tcg_gen_extr32_i64(tmp, hitmp, tmp);
>> -            } else {
>> -                tcg_gen_extr32_i64(hitmp, tmp, tmp);
>> -            }
>> -        }
>> -
>> +        g_assert(size >= 2);
>> +        tcg_gen_addi_i64(addr2, addr, 1 << size);
>> +        tcg_gen_qemu_ld_i64(hitmp, addr2, get_mem_index(s), memop);
>> +        tcg_temp_free_i64(addr2);
>>          tcg_gen_mov_i64(cpu_exclusive_high, hitmp);
>>          tcg_gen_mov_i64(cpu_reg(s, rt2), hitmp);
>>          tcg_temp_free_i64(hitmp);
>> -    } else {
>> -        tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), size | MO_ALIGN | be);
>>      }
>>
>>      tcg_gen_mov_i64(cpu_exclusive_val, tmp);

Acked-by: Richard Henderson <rth@twiddle.net>


r~
