Received: by 10.25.0.23 with SMTP id 23csp566512lfa;
        Wed, 14 Jun 2017 18:20:32 -0700 (PDT)
X-Received: by 10.84.197.69 with SMTP id m63mr3260482pld.50.1497489631948;
        Wed, 14 Jun 2017 18:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497489631; cv=none;
        d=google.com; s=arc-20160816;
        b=Q2amyl7uu2V6d1WNF0zI8h8/YdAG/pz/HOFK3oXvpdmShXlB7PFo260tulNMCakNiz
         RESgmrWFeMB6d0DOerq74GPTyuqIicohXB4Qnl3oiGvdQTATaRDzFaj8nk8qwxKD85ph
         wl2yaWYO5QcM1Qp75709GEAaipqyQ8Q9Rdvk1bhwD4LhKMzOS3tNO16GRMt3us7C9uGi
         iVxmPSq89XECb7OGvcTGtZy85AofXNh4rIXyHTVsujtiBiRWjX6aYSBABYYXAUcuC0BM
         EjDrK38vLZx10qDuLA7m/jQvBC5yM26jgrOfo3Pkv/fAS30j45MrppHHsM/45tgc+TRi
         qDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=8Y9n/xhdZqrkv5a9sdbQ8CyMeoKVHWvS7ycYncLxpu8=;
        b=tdRT99+dYHtZZqc+ENV+kuR33ZBtcb+7LqnTXHpAgkGCzwu6EUP0IEfh8sxAU5Ip7a
         hc2oTVD9akjGgVA9j7+YP9JEzx+M6qIPUNBUuNbvccOSV3faIeOVHNbz2qb+Eg+9xZ+E
         4nsHz9CnTIgtwDgrup87SJyxVPDNT4lOA4c+tfP16YoZP7GV4RX5vl/jD+zGI8JJZzOz
         ZgJhdjmYbXet2D/KVSeTQ65/i+mCTVv/iOMOWxIsP/xuW2E9G0qRm8agDDuUbaT1qdap
         J3boP8UFgrutbhCjRmLKM0d2mxe0rkt4poyFo66Av8BR4deFq7T7rij5WOiVEsCrj3M6
         AMfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=r7r1KHV6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id r15si1161408pli.238.2017.06.14.18.20.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 18:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=r7r1KHV6;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pf0-x242.google.com with SMTP id d5so53322pfe.1;
        Wed, 14 Jun 2017 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Y9n/xhdZqrkv5a9sdbQ8CyMeoKVHWvS7ycYncLxpu8=;
        b=r7r1KHV6VcK3umeq//U/lNmGYV7+/O3uYx8ODZAGPPg+fA9oz4+ZkB0GkElgjEYbSw
         PDlz+ZT6afEQP2FuZqbdCxlxvQGzpmtSCkRwH0d2X4Xp1IuLZI8xK0pkp7WMt39C0sXA
         A3YjB3YHl41sjvB+pI55nv208J48nDf0qX2ZTTabmo3CbgVmZFAPR6HiRXAsRIPUlFZD
         pbNNdFbA4NeDMWbFkm79afE10LBJjbaOlVVH0KdoEjP5F1Nosb6utrWn1uGVVY8/DcDk
         edY31f9OV/uKbb8PzkCKYfe5y4+VZueEPyKIB5DzGE6fQj4OsNwkv2n3llGCyZPEgnMy
         ktyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Y9n/xhdZqrkv5a9sdbQ8CyMeoKVHWvS7ycYncLxpu8=;
        b=uYFu6yb2Pwh9iEQ6HZ4mufJfFkkYsUAKQl9xkAJN6kBqiIfz4nat2W85mHX/vPHNcc
         spzxZuQ9G4AOIxau3usVfwljqAghF+jPhB1ccgcs66ixEeux4NjyesV5votpi3ph6TP7
         UKLWil4T88xNW6W7KniD5dAaGmDDG+u+tJHKefsbJ06WV3Z1RfuwSBT4+6T6JHAjBWVf
         /cB8o03M/cBVj3R/JhPW9rbCactNNKVolqayy0Uhe81MUklILItAAtBWuFYULKtNNSTA
         5F2M9lSNdzfv0RsYenBj4fdgOaUI01NDlMDk2R5rubfF9wBOqpvgpiWsSOLYxzLzELHJ
         qIfA==
X-Gm-Message-State: AKS2vOz6j/lghWcPtaTj9pOlH6ZRscGZyJ1ukLQrYjifeSPROj6xl8zP
	a7YF8XziEwcuIDv6uP4=
X-Received: by 10.99.186.91 with SMTP id l27mr2730189pgu.87.1497489631280;
        Wed, 14 Jun 2017 18:20:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id g27sm1977871pfd.80.2017.06.14.18.20.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 18:20:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH] target/aarch64: exit to main loop after 'msr daifclr'
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20170614194821.8754-1-rth@twiddle.net>
 <20170614194821.8754-6-rth@twiddle.net> <20170614203343.GB8420@flamenco>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f348b0f7-a8ef-0347-2312-93462d8652f6@twiddle.net>
Date: Wed, 14 Jun 2017 18:20:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170614203343.GB8420@flamenco>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: w8OeQ7tBvK2C

On 06/14/2017 01:33 PM, Emilio G. Cota wrote:
> On Wed, Jun 14, 2017 at 12:48:21 -0700, Richard Henderson wrote:
>> Exit to cpu loop so we reevaluate cpu_arm_hw_interrupts.
>>
>> Cc: qemu-arm@nongnu.org
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>   target/arm/translate-a64.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 860e279..e55547d 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1422,7 +1422,9 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>>           gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
>>           tcg_temp_free_i32(tcg_imm);
>>           tcg_temp_free_i32(tcg_op);
>> -        s->is_jmp = DISAS_UPDATE;
>> +        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
>> +        gen_a64_set_pc_im(s->pc);
> 
> For op != 0x1f we end up setting the pc twice (first here, then in
> the switch statement). It's still correct though.

No, that's why I switched to DISAS_JUMP.

> 
>> +        s->is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);
> 
> Could do without the parens.

I think it's clearer.

> +        case DISAS_EXIT:
> +            gen_a64_set_pc_im(dc->pc);
> +            tcg_gen_exit_tb(0);
> +            break;

This gives translate-a64.c and translate.c different semantics for DISAS_EXIT. 
I considered that to be a bad thing.


r~
