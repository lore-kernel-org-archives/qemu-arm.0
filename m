Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp753785ocs;
        Wed, 28 Sep 2022 21:31:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68bUIBO97Gm8T74zDpc3V8Rh1w4v3jvghWOStamZ36rZ5KjXb3Bazww+6eisJVJ6iyKXEO
X-Received: by 2002:a05:6214:3006:b0:499:1f87:dac9 with SMTP id ke6-20020a056214300600b004991f87dac9mr1120720qvb.0.1664425870380;
        Wed, 28 Sep 2022 21:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664425870; cv=none;
        d=google.com; s=arc-20160816;
        b=eShO90RZKA28vu5BFYJYoeLy1/wpBmfz+3kHLlyO0w8/I9FKo/0pavCHUcYW21ootw
         x3/P2ajxIks5nGLeg6mhBDZzsvVSG3sy5wOHyYBOIN0UzJV7+/WJ6E7CUW0qQJFNyIfp
         t30dcx5SMkYy7LsqfOOxcdIIcBkuaUXiMHbYmjFgfEH77B2x8B9+Lj0KyTtaerb9CX/b
         kBYwM+YsBuOSoa6f87w5vq6VQ09iRL1jTxAKrQJ0EAHI7Bgrdbru/jr4QnT9lXTVw/L4
         TlAl6AsBOavQCIZkfjK+QOJPQL5C6JRLpvBSVgUdkrldoLq+c6/W8v18XopjKhQxrj3R
         vgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=teCrwAi0598F/ilUCIdS1ud+xCVdgBRvQ/gZZpIuHdc=;
        b=MFQy67PDCHKhnQMqBxA43ZJG6dFFAcY7vT4VeIKCe+EWLei7cgVdkgvtJ3pJrlUvIg
         DnK92AFT4R9sn72+PM80utYcS2fzhv+0oDWgnbG0oYe7nzy4PUxJKadWdtGfY/MZVaZt
         Vi3vjOkI/nnIze7WL/L0ph7pv5vo55ZojMXzzUkpV5jf5+2F0RibQvuSIaA/chgibxyg
         ISGI+43OOlw/b0miMjVUIXe95vSqM3I2Ug9uDGPcqbrs4WDp2j/OPfIuL6kVcKfDjbui
         JNELK1h4dvVYaPFX3MBqtKmIpNLuP3PShuZlIi/RFLp5UTamYjVjrjRWvgC5zfqPkvyT
         SpHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umEzM8VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ac84e85000000b0035ba8411e2esi848047qtp.67.2022.09.28.21.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 21:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umEzM8VM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odlCX-0005eq-Vz
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 00:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odlBl-0005dZ-Lu
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 00:30:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odlBj-0003mh-Vf
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 00:30:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l9-20020a17090a4d4900b00205e295400eso237720pjh.4
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 21:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=teCrwAi0598F/ilUCIdS1ud+xCVdgBRvQ/gZZpIuHdc=;
 b=umEzM8VMQwDhBhmY7/Rp3/LE1/4cEeYquLDIlerWGuWnXSohzoDdZ3LhOBiBGEiWUb
 3zTDRusUz9M+TqucX4JA3y+B0/yQoMijMuSOaG4fx1FUY4a4DXcQPB13eal9CewoKKtT
 P4H3ZlOOtIYNvePlJ5BdzgaD/ZdEuruLJ7DUQbAL5bBQji382xC6HFQfqagX3CXSfHrv
 8DzVvqnAbpOiAklzi2XLK6Zmf5WtFtAjN73bP4VXJ9C7H5q7wZi1txZLZbEUqn73jY+S
 x/yyjIhMa5PtglY0hUhltOrXv+ZDOZx0yYmnf6X/Bbo7D/KgwIQ8UBHdUsRqAAqzU1lj
 OUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=teCrwAi0598F/ilUCIdS1ud+xCVdgBRvQ/gZZpIuHdc=;
 b=jiqQ16YioOJt0tJXHsMGA2Ud+vAJE75K6XBOqxa4mic9Xg4LO4b6flMXIILIJopY9q
 SE8MpZf9d+RR8UP0xvQCanS1dTQhTOmS2RGw/2qRycs7guzrJUYFqHPCHHTiV3dhgXhD
 FU8lq2otCBcgMccio+dtq4IBbieW+3s0nhWFNUR8EBKO41vIkLT/DiiJ9yIVGQhGFQA9
 fkG8UiEcEQNK9dfaEXicVx+3nK6GsqY0H78eyy+/GG1+jrB2DhTMQ0vRJ7AVYUeJzyHV
 AgWLdjc4lpIcK4Ptw5AiFMb8PUYs1lMQXC7Xzz67wIV6unQ1A8A8omf1qjgIHAGXSVmt
 99QA==
X-Gm-Message-State: ACrzQf0kMaySKJpBM5w0Udjl0J4KRq7hG1Jl6WQ06OZgTNAUFofQM/ja
 4/BQ/Zao4uRMQpFOnn+tp3VsJg==
X-Received: by 2002:a17:902:6b8b:b0:178:7cf5:ad62 with SMTP id
 p11-20020a1709026b8b00b001787cf5ad62mr1527916plk.13.1664425818038; 
 Wed, 28 Sep 2022 21:30:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 mh17-20020a17090b4ad100b0020322204672sm2441730pjb.38.2022.09.28.21.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 21:30:17 -0700 (PDT)
Message-ID: <db58b288-2200-fe0b-acde-501510c2e5b3@linaro.org>
Date: Wed, 28 Sep 2022 21:30:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 9/9] target/arm: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-10-richard.henderson@linaro.org>
 <CAFEAcA-jUebgHHpShKWaR48ctfYBfpFgAkGPbxbp=13gNR=U8g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-jUebgHHpShKWaR48ctfYBfpFgAkGPbxbp=13gNR=U8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjQS8ROJsoea

On 9/22/22 07:07, Peter Maydell wrote:
>> +    /*
>> +     * For TARGET_TB_PCREL, the value relative to pc_curr against which
>> +     * offsets must be computed for cpu_pc.  -1 if unknown due to jump.
>> +     */
> 
> I'm not really sure what this comment is trying to tell me. Could
> you expand it a bit ?

After the effect of an indirect jump is applied, pc_save is set to -1, so that we can 
assert that we don't attempt to use cpu_pc again.

>>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>>                                    const TranslationBlock *tb)
>>   {
>> -    ARMCPU *cpu = ARM_CPU(cs);
>> -    CPUARMState *env = &cpu->env;
>> -
>> -    /*
>> -     * It's OK to look at env for the current mode here, because it's
>> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
>> -     */
>> -    if (is_a64(env)) {
>> -        env->pc = tb_pc(tb);
>> -    } else {
>> -        env->regs[15] = tb_pc(tb);
>> +    /* The program counter is always up to date with TARGET_TB_PCREL. */
> 
> Is it?

At TranslationBlock boundaries, yes.

> Is there some documentation in one of the other patchsets about
> how TARGET_TB_PCREL works in general and what targets need to do to
> support it?

I tried to do so in the generic TARGET_TB_PCREL support patch.

(1) PC must be up-to-date on all TB boundaries,
(2) translation is given a full virtual address, for the benefit
     of the (nested) call to cpu_ld*_code, but should otherwise
     only consider the page offset portion of that address.
     (a) unwind info is a page offset,
         (1) restore_state_to_opc must use a deposit, and
         (2) arch_tr_insn_start must mask the translation pc.
     (b) pass a complete virtual address to translator_use_goto_tb,
         which will compare that to the translation pc to decide if
         we've crossed a page boundary.
(3) Relative updates to PC should use runtime rather than
     translation time arithmetic.


r~
