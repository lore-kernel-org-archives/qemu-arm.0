Received: by 10.25.208.194 with SMTP id h185csp2352101lfg;
        Wed, 20 Apr 2016 07:29:41 -0700 (PDT)
X-Received: by 10.112.140.169 with SMTP id rh9mr3328745lbb.69.1461162581769;
        Wed, 20 Apr 2016 07:29:41 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x22e.google.com (mail-lb0-x22e.google.com. [2a00:1450:4010:c04::22e])
        by mx.google.com with ESMTPS id xg4si3617013lbb.137.2016.04.20.07.29.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 07:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22e as permitted sender) client-ip=2a00:1450:4010:c04::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22e as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x22e.google.com with SMTP id b1so9126907lbi.1;
        Wed, 20 Apr 2016 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=1witUqf5vZCrL7kvIXbu4LC/j23Okn5Itij7ihzHHNM=;
        b=WXS+A1tN909cGxfsFgr6bIt4N74eW/67W6FpHezA/mxMc7eGIy1XT3V4F8vs++u2GB
         itRdUB9sm1PKMthv+uJ7/qkVCeMcwHXgztGZ0hO+HBnJvHSFQT7EZpViurmDn8awg+jO
         uTqk7zLotSn7w34jmQTpYl8+oPsQ2cBvamd9ohk/Eb4n0M/5hbkdaRQIPieDskZ+irvZ
         nKSiX4lJGPLn9KvBqe5NGQ9YILIMJ6bnAUx5I53QOiO2YK04AhAa1Oxdi3AHiJG9RGXv
         LMx6WYHwvDjE24GYd3nDizLsbCP7RcCH8ehpgWuY0zUr9odgWgt+NL8j6Yy8a548Zr/Z
         QMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=1witUqf5vZCrL7kvIXbu4LC/j23Okn5Itij7ihzHHNM=;
        b=OGB+T0gosmGa6F2FuCC7A0dvOGZrQDVOHRv4eKjT/7drapWwveRUE9AW5lxeBTIsuy
         0dpcNBPjw92YjR4OBATk95HW/E9CH90zrcHgEmy4yIRlOhHPyo9yfUzjMLPBoD/nCtmF
         iGFVTtHDxiS0X8OCRD1dpEBqkY0WWU2Saa55OjUF3kHwndijqj3I4RRAnT7er1uZ8cQa
         a0wcNzunv4QmATTvNcN1NcSE1q4p+lvwMUEJ4HqqZLgZ51V05bNXQ0rvXhfRz9qXnWD4
         3spedWN8EX1FD27nPUOCzkvet1EHXvBZE/CvqTpl0oKc+pW48T0y0N9vepYFnM3cPFjT
         5vVw==
X-Gm-Message-State: AOPr4FV9+A+ZEwcEvy/yuxSrnANirnFC9WxPnNij8depVogiGQLavaZPX4jQjZTx1aLhsw==
X-Received: by 10.112.126.36 with SMTP id mv4mr3755588lbb.97.1461162581627;
        Wed, 20 Apr 2016 07:29:41 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id l124sm1128653lfg.40.2016.04.20.07.29.40
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 07:29:40 -0700 (PDT)
Subject: Re: [PATCH 07/11] tcg/arm: Make direct jump patching thread-safe
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org>
 <87lh48v203.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57179253.9040505@gmail.com>
Date: Wed, 20 Apr 2016 17:29:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87lh48v203.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: TvLbx9lKxUqe

On 20/04/16 16:33, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
>> index 3edf6a6f971c..5c69de20bc69 100644
>> --- a/tcg/arm/tcg-target.inc.c
>> +++ b/tcg/arm/tcg-target.inc.c
>> @@ -121,6 +121,13 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>      *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
>>  }
>>
>> +static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>> +{
>> +    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >>
>> 2;
> This seems like something a tcg_debug_assert should be ensuring we don't overflow.

Then we should probably put the same assert into reloc_pc24() as well.

>
>> +    tcg_insn_unit insn = atomic_read(code_ptr);
> Don't we already know what the instruction should be or could there be
> multiple ones?

Actually, it is always what tcg_out_b_noaddr() generates. I'm not sure
it's worthwhile to introduce tcg_out_b_atomic() or something similar here.

>
>> +    atomic_set(code_ptr, (insn & ~0xffffff) | (offset & 0xffffff));
> Please use deposit32 to set the offset like the aarch64 code.

Will do.

>
>> +}
>> +
>>  static void patch_reloc(tcg_insn_unit *code_ptr, int type,
>>                          intptr_t value, intptr_t addend)
>>  {
>> @@ -1038,6 +1045,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
>>      }
>>  }
>>
>> +void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
>> +{
>> +    tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
>> +    tcg_insn_unit *target = (tcg_insn_unit *)addr;
>> +
>> +    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the
>> flush */
> So why don't we?

I think because it's a bit more expensive to take this kind of branch.
If we assume direct jumps are taken much more times than TB patching
then it's preferable to optimize for direct jumps instead of for patching.

Kind regards,
Sergey

>
>> +    reloc_pc24_atomic(code_ptr, target);
>> +    flush_icache_range(jmp_addr, jmp_addr + 4);
>> +}
>> +
>>  static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
>>  {
>>      if (l->has_value) {
>>
