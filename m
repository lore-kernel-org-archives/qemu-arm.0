Received: by 10.25.44.15 with SMTP id s15csp669252lfs;
        Fri, 28 Jul 2017 10:02:51 -0700 (PDT)
X-Received: by 10.237.36.38 with SMTP id r35mr12446203qtc.327.1501261371283;
        Fri, 28 Jul 2017 10:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501261371; cv=none;
        d=google.com; s=arc-20160816;
        b=DVJk7+jvRC2hi4ZWQYauZ5B2h3WWOiDqoBV+WEJ/W+ASDyTRPENiTuGkFs/Mo2ZTOw
         nvui7/HEOxl4O+ISRf4hbMt3FfvGBCM/P+K+r1mrHhAjf2srKTUWGS6Opb57OPAY/slj
         kO7dGVimtcytqIdICjukiRZRd0igk3uEUY6y28cxZFCd7eo5vSgTvXlQGWPNVBAAQs2B
         W5d0YLAHmpcgMElzDCS+gwgJkOdEBncQhxs3D/hv1G92q8kvs1xgy+Kvkb0hftZgRqPr
         wPgoyFLpluHek+DVmJCKIgpzWhguV0IjeXnfoq/Sd1433CHyoeO1ngTJ3g6XTBbUMi+8
         c3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ovY678s7tjaafuHT9lnxVNUABDLI3MSwkMqSF4JORbs=;
        b=dOc99cJQVQzvqLIkvADH1VUyrCUhhZxERrYIF+LV2/Rn5+GCfYHNvabbT1utJb40Sr
         +o4QiQzwKqgD6XdkqxFDhGZViXr3+y9MgCcZlDxs8YKcK7PC+eqFIzSLEA4aJs2OHBsD
         b2Ey+cTeE2MIOMcdxtSjtHhSA2ercfd1W5cbK8P57uOJpTZBxh3pSUbbPw2QxSjvT6Em
         bXDpVogCadcplSHjUh8eysPdH/2kaxZ2NdxIJZVkfst1FrQ2lupL+jO5I8VLrF5neAeo
         +IEa6NqnsYfEp9jck05aSYga/co/Cq0JsAIzRrLurQGAYtDp6tqapTxKIaWiQDftB9XN
         xH9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=u4IMqJbf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si17594832qkd.76.2017.07.28.10.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Jul 2017 10:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=u4IMqJbf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1db8f2-0000CH-L9
	for alex.bennee@linaro.org; Fri, 28 Jul 2017 13:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8da-0007sr-Og
	for qemu-devel@nongnu.org; Fri, 28 Jul 2017 13:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8dW-0000fa-MU
	for qemu-devel@nongnu.org; Fri, 28 Jul 2017 13:01:18 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1db8dW-0000ey-H0; Fri, 28 Jul 2017 13:01:14 -0400
Received: by mail-qk0-x244.google.com with SMTP id v76so9989358qka.5;
	Fri, 28 Jul 2017 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ovY678s7tjaafuHT9lnxVNUABDLI3MSwkMqSF4JORbs=;
	b=u4IMqJbfj1GezBLsOeIGkKn+AWZnSFL4w6RnQRpHXE0AH/4wMSCLN2APd0AllvMrq4
	uBvZagDRtxHbZO1j3BmMj2KrwhRXNDL6RrD7hH5MPY/ILu9vys+akFaTwl737J3TCRhz
	Nvw5s9eMdejLbfXFdMCxBY152wyukSZw5yEgZF4IhmEwxqrydFGTWVeKJ6kYeZZFoRv8
	bE7hRUNbjXcE8UPkNujvV4MNiXeuxr6dsdcMXOJhHv4mS99yA7sk6A8BT1f+K/vP5KXX
	EArMO/phdhFElJ1cN8wDsuY20fxbditevBnl7Sm5O1EgxyzVf0baAjf5aUy3rsv2F7o4
	mm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ovY678s7tjaafuHT9lnxVNUABDLI3MSwkMqSF4JORbs=;
	b=c8CcyLuajmsxNwjsGv8SbtJEFm88MkMGlbP+N/RaAFsjCDH9cBw0rA6XLFt9zxRgzn
	R8ZXGCAbML3LCixNkIo5wyS/EoWzpzpSWlchVG8aRqDr2yBhMPyCLO2cjavGlhHSyRhG
	Ng12qJPxG047jp5GQ+1ODgwuH92058Dq7b/BLfZn0lCCiDFMxX3PDvr+h1YKgfBwh61V
	cDoRQqejtGP7e9w4s83+UQGBvqZ+ga4uxsbCOGTfqQO8u7aO8GPY7bcJRZQSblvwpG3m
	bsxupTYXYA52a8GLSCMKtpAjktE8DQfe7yo8wf1ohgCEvgqGhf0X13J3jBAfpppw8Z6r
	2giA==
X-Gm-Message-State: AIVw1112sNoa8nY0hNnambWijZVUNh6T6/krMmBe0yIkilG6GyOprwYF
	20fr+LuidE5gP8y+TGWrQQ==
X-Received: by 10.55.51.16 with SMTP id z16mr10415021qkz.73.1501261273636;
	Fri, 28 Jul 2017 10:01:13 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	b42sm17469075qkb.17.2017.07.28.10.01.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 10:01:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-3-git-send-email-peter.maydell@linaro.org>
	<7834a272-4106-f076-a62b-9cff45f4ae42@amsat.org>
	<CAFEAcA8pSnin+c90RAutxckifw1HTpeZ75OUMwC3kBurSpVBjg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3952e0dd-fefd-cd05-70c6-51b614e47fbb@amsat.org>
Date: Fri, 28 Jul 2017 14:01:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pSnin+c90RAutxckifw1HTpeZ75OUMwC3kBurSpVBjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.10 2/5] target/arm: Don't
 allow guest to make System space executable for M profile
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /K9KpQYiLeqc

On 07/28/2017 05:51 AM, Peter Maydell wrote:
> On 28 July 2017 at 00:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 07/27/2017 07:59 AM, Peter Maydell wrote:
>>>
>>> For an M profile v7PMSA, the system space (0xe0000000 - 0xffffffff) can
>>> never be executable, even if the guest tries to set the MPU registers
>>> up that way. Enforce this restriction.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    target/arm/helper.c | 16 +++++++++++++++-
>>>    1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index ceef225..169c361 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -8251,6 +8251,14 @@ static inline bool is_ppb_region(CPUARMState *env,
>>> uint32_t address)
>>>            extract32(address, 20, 12) == 0xe00;
>>>    }
>>>
>>
>>
>> I wonder if these should renamed pmsav7_is_ppb_region() and
>> pmsav7_is_system_region().
> 
> Yeah, perhaps better; I'm never quite sure how much disambiguation
> to put in to file-local function names. Maybe m_is_ppb_region()?
> PPB and system region are M profile concepts, not PMSAv7 ones.
> That doesn't seem any clearer than where we started though :-(

m_is_ppb_region() isn't bad.

> 
>>> +static inline bool is_system_region(CPUARMState *env, uint32_t address)
>>> +{
>>> +    /* True if address is in the M profile system region
>>> +     * 0xe0000000 - 0xffffffff
>>> +     */
>>> +    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3)
>>> == 0x7;
>>> +}
>>> +
>>>    static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>>>                                     int access_type, ARMMMUIdx mmu_idx,
>>>                                     hwaddr *phys_ptr, int *prot, uint32_t
>>> *fsr)
>>> @@ -8354,6 +8362,12 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
>>> uint32_t address,
>>>                get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
>>>            } else { /* a MPU hit! */
>>>                uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
>>
>>
>> Maybe names access_perms/execute_never are easier to read..
> 
> Following existing practice in the LPAE code, we use the
> field names that the architecture spec uses.

I see, but below xn has an helpful comment /* execute never */ that 
eases code review, maybe add both comment on declaration.

> 
>>> +            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
>>> +
>>
>>
>> clear MemManage exceptions:
>>
>>                 *fsr &= ~0xff;
> 
>>> +            if (is_system_region(env, address)) {
>>> +                /* System space is always execute never */
>>> +                xn = 1;
>>
>>
>>                 } else {
>>                     xn = extract32(env->pmsav7.dracr[n], 12, 1);
>>
>>> +            }
>>>                  if (is_user) { /* User mode AP bit decoding */
>>>                    switch (ap) {
>>> @@ -8394,7 +8408,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
>>> uint32_t address,
>>>                }
>>>                  /* execute never */
>>> -            if (env->pmsav7.dracr[n] & (1 << 12)) {
>>> +            if (xn) {
>>>                    *prot &= ~PAGE_EXEC;
>>
>>
>> and here we now can set eXecuteNever violation:
>>
>>                      *fsr |= R_V7M_CFSR_IACCVIOL_MASK;
> 
> No, *fsr is not an M profile CFSR, it's an A/R profile short
> descriptor format fault status value (because on R profile
> that's what it will be used as, and M profile is using the
> same MPU handling code here). We do the conversion in
> arm_v7m_cpu_do_interrupt(), where we look at the exception_index
> and the exception.fsr to identify what CFSR bits to set.
> 

Ok I missed that, thank for correcting me.

>>>                }
>>>            }
>>>
>>      }
>>      *fsr = 0x00d; /* Permission fault */
>>
>> I don't understand this mask, I don't have bit [2] defined in my datashit,
>> maybe it was expected to turn on exception Entry/Return which I have defined
>> as bits 4 and 3 respectively, so I'd rather see here:
>>
>>      *fsr |= R_V7M_CFSR_MUNSTKERR_MASK | R_V7M_CFSR_MSTKERR_MASK;
> 
> See above, *fsr isn't a v7m CFSR.

Yes, 0x00d is Permission fault using short-descriptor translation.

So:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> thanks
> -- PMM
> 
