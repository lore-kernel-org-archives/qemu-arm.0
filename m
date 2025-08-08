Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9650C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 16:11:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukPgh-0007TM-T6; Fri, 08 Aug 2025 12:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukPgf-0007Rc-TJ
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:11:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukPgd-0000bk-Q6
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:11:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-76bd041c431so2291074b3a.2
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754669478; x=1755274278; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oy8fGZgz5czm6m7hc2lpWMbnjzGx0NfUtBl03J+qjEk=;
 b=hRvPjwrIYQjAoahJcrjvOifkANe/onxfavDfByEDJ6gfGN4/FWxgeONYkBcCvdYlnK
 k4hi1ZybX+h77hcvQrw6Y/SATCGefAbei/0XsYYRCELo0UV2vUZHpo3fY3NG8yGNY6ZY
 oAIGmHovDNiCOvm0FaW9gmUV96VAqhzIpu6jDK9obsLLX2T7OJnPSg+8CU63pQ1jdYuF
 l541N2Fd7O+FgzQGGbgXTk5CFhUEmXmZRXY5slhlzvIUoIflChbakU7fDBBo7j+Lroxb
 lTpaugdmbFpn9uwzj5D6A33dTpVNo/i/Q7QkH8tJRDR7Ga7shOJDqQDyOtoYBt6uU1rn
 A6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754669478; x=1755274278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oy8fGZgz5czm6m7hc2lpWMbnjzGx0NfUtBl03J+qjEk=;
 b=WhjaE/gl3Ur+H5Zx8nr5j5HfS1pfBgEiXvbn3MGtBUaGFCfwq3nrc/c3tOLeeEI0zV
 1N984Mfe2NWfNonoWM/AhDzkW1mPPvBuY0EQMt6FKuccZcKc7fqm07vEoZq1V/SgL5qt
 3GLDvgwQgjRk5SlBqqn3/mKt8fH8y4vPe0+/E5mXvys7L4eDKieIlee699pS9W7if2E+
 GNUpG+m3/GIedNZnAHcjgKD7HRRuxTFohS7gg7Hf6PlKyb+xKV1mswoNdaGP4HJdVcMm
 28DGuwiuJoCzZ3GWFSPIMg+a+FUkpJn4tQaX0PHr/yANgnnRSYqceLa+8CuG150pilhv
 5Tkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlPtIjS7vJmmJVi5Dzm3jCqFHfIn7EAsQUe8y/HeDeLDcEJ3B/hIsDKya6rKuZ1osLI3xx3ZbIOg==@nongnu.org
X-Gm-Message-State: AOJu0YyxSuxGqolVQSkmjQP6hnF9tDeRWYMSQt/5vUPGZJgwBtpWI3hP
 xigOUqlDsXG++fiN7lX7H+XVJBZlXkP4yAQEDg/fGaqzoNWfc2Rdg0CfZ0uNAMej+qk=
X-Gm-Gg: ASbGncuc+PIJO3gNeLCl+03fgBgydAowHQcQsGNsfwczQI7mEDPh3kCir2xOazZLRCV
 CbTYYuyj3Nk+kMhJm6slcM3lOXGwW9T47E3xfjftz/nwWW6ahwtUj+18u5yQCkTT0z9w6IoyN5f
 vIqOSLjlnc0WffdG8dRclkQaFuCiLhIqYGBO1QiPPR1D1bmU9MKv4s4p1Fh8+bIDROkgm7u5tXv
 Nla/fDwgMgy3vDc/E5Q3xSIhLA/mcSpWtamMzoMZaU1RdVSG11BassV6S6rUmHB+Y1qGw0Wmi5q
 4im5mp8fDXpD0bQiVqXMIH95Dah/vCYQ+Vy5hlgKd6gefM8Evf4z+dj2amDVuxZHJSaoh7IJ6oN
 MyOPASmgslpSCjkh/gD/x2JVD2R1+847T4Ls=
X-Google-Smtp-Source: AGHT+IGx/y52mouG4lsErVttNo3EJdka0Se0YFszE34++m+vyYXuagFz8REM/OfiVmieFG3hGj49xQ==
X-Received: by 2002:a05:6a20:3d8b:b0:23f:f659:a0ef with SMTP id
 adf61e73a8af0-240551adbd9mr5801495637.25.1754669478180; 
 Fri, 08 Aug 2025 09:11:18 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcceab691sm20638770b3a.55.2025.08.08.09.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:11:17 -0700 (PDT)
Message-ID: <6190716c-09da-4abe-94e5-2b713855f0e9@linaro.org>
Date: Fri, 8 Aug 2025 09:11:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gdbstub/aarch64: add CurrentEL register
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
 <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
 <CAFEAcA-2Zt7HTDX_bdBHjJyQS7o=csE1x6eDymyEPkV3K+pXrg@mail.gmail.com>
 <CAAjaMXbZK=n_HJGrmuGv1DZZ3AeaX7-fK-soFto4J=w-9=vdmQ@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAAjaMXbZK=n_HJGrmuGv1DZZ3AeaX7-fK-soFto4J=w-9=vdmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 8/8/25 5:26 AM, Manos Pitsidianakis wrote:
> On Fri, Aug 8, 2025 at 3:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 8 Aug 2025 at 12:30, Manos Pitsidianakis
>> <manos.pitsidianakis@linaro.org> wrote:
>>>
>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> ---
>>>   gdb-xml/aarch64-core.xml | 5 +++++
>>>   target/arm/cpu.h         | 1 +
>>>   target/arm/gdbstub64.c   | 6 ++++++
>>>   3 files changed, 12 insertions(+)
>>>
>>> diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
>>> index b8046510b9a085d30463d37b3ecc8d435f5fb7a4..19ad743dc5607b4021fb795bfb9b8e9cf0adef68 100644
>>> --- a/gdb-xml/aarch64-core.xml
>>> +++ b/gdb-xml/aarch64-core.xml
>>> @@ -91,4 +91,9 @@
>>>     </flags>
>>>     <reg name="cpsr" bitsize="32" type="cpsr_flags"/>
>>>
>>> +  <flags id="current_el_flags" size="8">
>>> +    <!-- Exception Level.  -->
>>> +    <field name="EL" start="2" end="3"/>
>>> +  </flags>
>>> +  <reg name="CurrentEL" bitsize="64" type="current_el"/>
>>>   </feature>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index dc9b6dce4c92297b2636d0d7c0dce580f1806d5b..c3070cd9863381fac40f5640e0a7a84dfa1c6e06 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -1473,6 +1473,7 @@ void pmu_init(ARMCPU *cpu);
>>>    * AArch32 mode SPSRs are basically CPSR-format.
>>>    */
>>>   #define PSTATE_SP (1U)
>>> +#define PSTATE_EL (3U << 2)
>>>   #define PSTATE_M (0xFU)
>>>   #define PSTATE_nRW (1U << 4)
>>>   #define PSTATE_F (1U << 6)
>>> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
>>> index 08e28585396816ab90d6d8e460ff8171892fe8da..16b564e1a970cb5e854a705619f71ffc61545a73 100644
>>> --- a/target/arm/gdbstub64.c
>>> +++ b/target/arm/gdbstub64.c
>>> @@ -48,6 +48,9 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>>>           return gdb_get_reg64(mem_buf, env->pc);
>>>       case 33:
>>>           return gdb_get_reg32(mem_buf, pstate_read(env));
>>> +    case 34:
>>> +        /* CurrentEL */
>>> +        return gdb_get_reg64(mem_buf, env->pstate & PSTATE_EL);
>>>       }
>>
>> The debugger already has this information in the 'cpsr'
>> register, so it could implement convenience views of
>> the subfields itself if it liked.
> 
> Yep, but consider: it is a register, architecturally, so it's nice to
> include it for consistency. It's redundant only because gdb has cpsr
> which is not a register. So this is about more about being technically
> correct than correcting an actual problem.
> 

I agree with Manos on this.
As mentioned on a previous thread, cpsr is not even supposed to exist 
for aarch64. So adding architecturally defined registers, even if data 
is redundant with cpsr, should not be a problem.
I'm sure gdb folks can understand this too.

> 
>>
>> If we're going to do this I would prefer it to be because
>> we've gained some consensus with e.g. the gdb maintainers
>> that this is the "preferred" way to expose the CPU state.
>> The XML config stuff lets us do it in our own way if we
>> want to, but I think there is value in consistency across
>> stubs here.
> 
> I plan to upstream the XML patches to gdb as well, separately. But
> since we use custom target xml it's not like we depend on gdb to
> change it.
> 
>>
>> thanks
>> -- PMM


