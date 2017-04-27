Received: by 10.25.0.144 with SMTP id 138csp677905lfa;
        Thu, 27 Apr 2017 02:42:46 -0700 (PDT)
X-Received: by 10.28.19.6 with SMTP id 6mr1645316wmt.96.1493286166416;
        Thu, 27 Apr 2017 02:42:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id 66si2567601wmm.122.2017.04.27.02.42.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 02:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id d79so3325378wmi.2;
        Thu, 27 Apr 2017 02:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8eNpZEW+oMI9a7Yf2/FfvnSGsuf1Xd23HRNn+Q0bgSw=;
        b=d6aNg/F3SPTSPcZwnpftax68m5HP48YYva37rJeeafhGr/EIK855OKc1E9OPi9xINH
         ArnRqrtZU+7z9Gpy3g6z821UNY3erIdh6LHOdenfFADV3j8hB0HZ1SDus3HKovoB8szL
         DR7dVQFKTuFC2oMJqQa+rYg/O5ORN4pf9RTBmyJBLgZdOu/iSEwzhvjvn7xKq+eXN82e
         7LVC6O6ZjKDY5M98NPuqeZhukdwdl3Z3JSH1brxbxG9Q7PwBuhLeh6rP1sNWc6Zf3rRt
         sV575KL5QYyGlnUe/XLBOrr+qqodcUg9RAevSI/3KUhEqwLKbF3Qfr4/k/AlXLx2Ib4a
         JIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8eNpZEW+oMI9a7Yf2/FfvnSGsuf1Xd23HRNn+Q0bgSw=;
        b=VHJ+mkq4bmGFWBYXOfWpilMeSvPfdWSnLsSz5nofcIgtaO0xiCclFDrrobdndq+Icg
         lyH5fOLdGo7U4AxJppVJyuPuYWXbLdyn2nEPZBtkxpNJXKBVFdQ/rccgKjMOOypvvpC1
         74K7HYSIO+EmcSnLUsIOc9EM++TGarg0wb/2/TnLOQTcyxFCeGtVeW0YrTeSfc0daHUA
         KK+jhQi7vbAB/9v78k7ITkCOfd9kLEpiYGRiArgw/F9YnqTvZVoqUTK2VOmruTpVhRap
         QfPDD56z10MVA1yChq9mQg7ne7CFdDggHY4WodIrbZdFSmbPIcYolg7GdugqQeihGBz9
         ofzw==
X-Gm-Message-State: AN3rC/7Y2X/XwxNL/98e02qTsji+IEDTRiEUgA6RGJhbqQjSp5BnuxWY
	b1htQVfZsQ723ip2jS4=
X-Received: by 10.28.12.78 with SMTP id 75mr1606076wmm.13.1493286165220;
        Thu, 27 Apr 2017 02:42:45 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id w17sm9164628wme.13.2017.04.27.02.42.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 02:42:44 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v4 07/11] target/arm: optimize indirect branches
To: Aurelien Jarno <aurelien@aurel32.net>, "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
 <1493263764-18657-8-git-send-email-cota@braap.org>
 <20170427093639.x4ckqibxcdgj76gf@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <59cec207-d067-db90-6dca-e0a236145c11@twiddle.net>
Date: Thu, 27 Apr 2017 11:42:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170427093639.x4ckqibxcdgj76gf@aurel32.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 1I3FNR5WunWd

On 04/27/2017 11:36 AM, Aurelien Jarno wrote:
> On 2017-04-26 23:29, Emilio G. Cota wrote:
>> Speed up indirect branches by jumping to the target if it is valid.
>>
>> Softmmu measurements (see later commit for user-mode results):
>>
>> Note: baseline (i.e. speedup == 1x) is QEMU v2.9.0.
>>
>> - Impact on Boot time
>>
>> | setup  | ARM debian jessie boot+shutdown time | stddev |
>> |--------+--------------------------------------+--------|
>> | v2.9.0 |                                 8.84 |   0.07 |
>> | +cross |                                 8.85 |   0.03 |
>> | +jr    |                                 8.83 |   0.06 |
>>
>> -                            NBench, arm-softmmu (debian jessie guest). Host: Intel i7-4790K @ 4.00GHz
>>
>>    1.3x +-+-------------------------------------------------------------------------------------------------------------+-+
>>         |                                                                                                                 |
>>         |   cross                                                          ####                                           |
>>   1.25x +cross+jr..........................................................#++#.........................................+-+
>>         |                                                        ####      #  #                                           |
>>         |                                                     +++#  #      #  #                                           |
>>         |                                      +++            ****  #      #  #                                           |
>>    1.2x +-+...................................####............*..*..#......#..#.........................................+-+
>>         |                                  ****  #            *  *  #      #  #     ####                                  |
>>         |                                  *  *  #            *  *  #      #  #     #  #                                  |
>>   1.15x +-+................................*..*..#............*..*..#......#..#.....#..#................................+-+
>>         |                                  *  *  #            *  *  #      #  #     #  #                                  |
>>         |                                  *  *  #      ####  *  *  #      #  #     #  #                                  |
>>         |                                  *  *  #      #  #  *  *  #      #  #     #  #                         ####     |
>>    1.1x +-+................................*..*..#......#..#..*..*..#......#..#.....#..#.........................#..#...+-+
>>         |                                  *  *  #      #  #  *  *  #      #  #     #  #                         #  #     |
>>         |                                  *  *  #      #  #  *  *  #      #  #     #  #                         #  #     |
>>   1.05x +-+..........................####..*..*..#......#..#..*..*..#......#..#.....#..#......+++............*****..#...+-+
>>         |                        *****  #  *  *  #      #  #  *  *  #  *****  #     #  #   +++ |    ****###  *   *  #     |
>>         |                        *+++*  #  *  *  #      #  #  *  *  #  *+++*  #  ****  #  *****###  *  *  #  *   *  #     |
>>         |     *****###  +++####  *   *  #  *  *  #  *****  #  *  *  #  *   *  #  *  *  #  * | *++#  *  *  #  *   *  #     |
>>      1x +-++-+*+++*-+#++****++#++*+-+*++#+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-*++*++#-+*+++*-+#++*++*++#++*+-+*++#+-++-+
>>         |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
>>         |     *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #  *  *  #  *   *  #     |
>>   0.95x +-+---*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###--****###--*****###---+-+
>>         ASSIGNMENT BITFIELD   FOURFP EMULATION   HUFFMAN   LU DECOMPOSITIONEURAL NNUMERIC SOSTRING SORT     hmean
>>    png: http://imgur.com/eOLmZNR
>>
>> NB. 'cross' represents the previous commit.
>>
>> Signed-off-by: Emilio G. Cota <cota@braap.org>
>> ---
>>   target/arm/translate.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 02cad96..d46a576 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -65,6 +65,7 @@ static TCGv_i32 cpu_R[16];
>>   TCGv_i32 cpu_CF, cpu_NF, cpu_VF, cpu_ZF;
>>   TCGv_i64 cpu_exclusive_addr;
>>   TCGv_i64 cpu_exclusive_val;
>> +static bool gen_jr;
>>   
>>   /* FIXME:  These should be removed.  */
>>   static TCGv_i32 cpu_F0s, cpu_F1s;
>> @@ -221,6 +222,7 @@ static void store_reg(DisasContext *s, int reg, TCGv_i32 var)
>>            */
>>           tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
>>           s->is_jmp = DISAS_JUMP;
>> +        gen_jr = true;
>>       }
>>       tcg_gen_mov_i32(cpu_R[reg], var);
>>       tcg_temp_free_i32(var);
>> @@ -893,6 +895,7 @@ static inline void gen_bx_im(DisasContext *s, uint32_t addr)
>>           tcg_temp_free_i32(tmp);
>>       }
>>       tcg_gen_movi_i32(cpu_R[15], addr & ~1);
>> +    gen_jr = true;
>>   }
>>   
>>   /* Set PC and Thumb state from var.  var is marked as dead.  */
>> @@ -902,6 +905,7 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
>>       tcg_gen_andi_i32(cpu_R[15], var, ~1);
>>       tcg_gen_andi_i32(var, var, 1);
>>       store_cpu_field(var, thumb);
>> +    gen_jr = true;
>>   }
>>   
>>   /* Variant of store_reg which uses branch&exchange logic when storing
>> @@ -12034,6 +12038,20 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>>               gen_set_pc_im(dc, dc->pc);
>>               /* fall through */
>>           case DISAS_JUMP:
>> +            /*
>> +             * gen_jr is not set on every DISAS_JUMP because for some of those
>> +             * we do want to exit to the exec loop.
>> +             */
> 
> What would be the reason for that? IIUC the lookup_tb_ptr helper calls
> cpu_get_tb_cpu_state to get the new TB flags go lookup from the current
> CPU state. It means it is able for example to handle a transition from
> user to privileged mode. Also the exit_req flag or its new equivalent
> is tested at the beginning of each TB in case there is an interruption.
> 
> It therefore seems to be that we can replace all calls to
> tcg_gen_exit_tb by tcg_gen_lookup_and_goto_ptr with the program counter
> in argument.
> 

That was my thought too.  The only examples I saw while converting target/alpha 
that I really want exit_tb are when I have just flushed the TBs, and I know 
that the lookup will definitely fail.

That said, elsewhere (in the v3 thread?) Emilio mentioned that ARM has some 
cases where it wants interrupts (or something) to be recognized right away, 
which would also seem to call for an exit_tb.

My thought is that these cases should be specifically noted with a new 
DISAS_EXIT or something like that, rather than overloading DISAS_JUMP with a 
gen_jr flag.


r~
