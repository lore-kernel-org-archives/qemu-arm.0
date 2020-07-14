Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp352425lfm;
        Tue, 14 Jul 2020 10:11:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBOLs1nB6QiKlJxza7/T3/zsLZDvRyoW3MMIVELzBMV9+wiHuS0U7nFBnaHjs7cKZoE5my
X-Received: by 2002:a25:da83:: with SMTP id n125mr9053588ybf.381.1594746679952;
        Tue, 14 Jul 2020 10:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594746679; cv=none;
        d=google.com; s=arc-20160816;
        b=hYCrQxAwMsa/ue6Ss76Q4H0b92OlNy3/JSG+CqYdU1tatfxDjaAlctUBs71dTmM6K3
         8yRXmtjct76rrb0jyicU0V3rVZVShQHeBNzsKBPFnT5HpF3NfzKAzIOGYMw6K8XSNG5+
         skBbAsSCvCCtcg+FFTATqlYW0ctmgS0bIgIfuveyyozAzpYGJIVI7tMXvAsonjDCnMnB
         SvMeemSuISGUJ3oOm4AhjlHkzJyeivvscxZMXa+foWQqBqJwV+EvKNEk85CRt+mhYlI+
         Bh/p16CoQoFjUBlyQZnL/+pmwbYp67wr8skJbbd14GOFR4qMTl4Ib159ooks2SaNiUZM
         /vPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SGh41sP+ng8YW5CRVmuH9/ipR/ed1r8PqiQRoixxRg0=;
        b=FEhLZqvNHjkOtBe9Z4rA2UCzuKn+y7arX2wl7D8JY0NrOE2FiNiypaqKQZkYjNpikq
         Y/dtZX6zYXkDutaJXryMD7b8EFG8vPXsqGlykBXDF+XajiGIQ1xCNV7F0ZDkNLj55Ifn
         BuyiuQiow/r5AgWAmPh1hWSpDy4LQgByur8TY4xU40GhwtZfTU0giQEaxqT4cfSBwfKJ
         srvq9GXFQiiFeJbdnXKXz/Yf0h91XxiG2jRwNDe7hZg56TdeGRtiz1wWJoeZqY4TgLYl
         CbFK0Ad7Y3ElUs9xPnNeBUM3B4Oq+aCpbrXEd0+sJklUta+ZkpyiLOVj0XtR1VOdeEdH
         +GLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cjGGb9D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si7981084ybr.109.2020.07.14.10.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 10:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cjGGb9D9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvOSd-0007Rq-BC
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 13:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvOSV-0007QL-1m; Tue, 14 Jul 2020 13:11:11 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvOSS-0003Oj-Od; Tue, 14 Jul 2020 13:11:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id z13so23208197wrw.5;
 Tue, 14 Jul 2020 10:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SGh41sP+ng8YW5CRVmuH9/ipR/ed1r8PqiQRoixxRg0=;
 b=cjGGb9D9EItNuycmzLU5xt0SYz1gBg4HvmVkh7BenKJwNLSh/9YjbbJPusLzivZd+3
 yEQj13fHMYC4d6oDWs/k0WEvPhYsQpn8p1rpN2O1kPfds6zCYTB7m9lqL/utWArPlyg+
 HSPGtsu9Hfv+CLc0vMMMeInofuc+TYmmord7ZkGV0EWtLVidFEO88EUAnUUpt0wxcOuM
 x6J9dOr/CbuG/XhEfI2NZ8/awooLha/F6YNji/xltAiK/l2fbf3an2xC+g6xxzCQwk36
 rQoHQymdFF0/w4eC4qqRgzWSijo0uxkD9CWWLf4KBHuYbTNgXgTLa3jCPg+TrTKB8r/+
 wgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SGh41sP+ng8YW5CRVmuH9/ipR/ed1r8PqiQRoixxRg0=;
 b=eldnpNU4nbvKqeu1QYsh8/DZQ2KxDvYETOfz6c9X8mb1fV7jhGd1GTinzxuvL8iYWz
 5/XYzJfdyV5lx/alZKVi8fzbe5SDDcMNk/Zcl4eGRvTqZQlLfDU1qx58zpBOC0oCj8mP
 YUDGuZhbq094qtz+FXEPI3t8n+NQGbvDzHy+vfuURtjLNxawTW7EVJxfHeTcaRDFpKdE
 6JxxMu+ikFK9mv/8VB3G0pO1oct1wPOLChDJi53erbtQ0TrncwQuZAZOZcZxz3DoJqYH
 dbIS8oCwjy33BrIB7RdX6s1ePow2Oyk14kUgsh2yIev0MTTu3pXZrk+RqGE4fLyeIcbk
 /lyA==
X-Gm-Message-State: AOAM533aXZnnHvdZBTRI7le5zUsTl0BhgSNVUwbLQELWNPUyJG3EuFfr
 nMolFZKetvYZgvED2Ci6KJI=
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr6684856wrb.232.1594746666528; 
 Tue, 14 Jul 2020 10:11:06 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id j6sm30661417wro.25.2020.07.14.10.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 10:11:05 -0700 (PDT)
Subject: Re: [PATCH v5 04/11] hw/arm: Add NPCM730 and NPCM750 SoC models
To: Markus Armbruster <armbru@redhat.com>
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-5-hskinnemoen@google.com>
 <3ec30463-03f8-98e9-9a14-01b0bb698c9b@kaod.org>
 <CAFQmdRYQxMz_qSr4i_cyqRPEGuq7At=VEOGvsupR3=W7pE3q=g@mail.gmail.com>
 <7c978e82-8890-9ba4-096a-92d7cff60b0a@amsat.org>
 <877dv63x2e.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <11c410d4-b310-faf1-5116-2ab62270c3cb@amsat.org>
Date: Tue, 14 Jul 2020 19:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <877dv63x2e.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4jYThwKn3z1O

On 7/14/20 6:01 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> +Markus
>>
>> On 7/14/20 2:44 AM, Havard Skinnemoen wrote:
>>> On Mon, Jul 13, 2020 at 8:02 AM Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
>>>>> The Nuvoton NPCM7xx SoC family are used to implement Baseboard
>>>>> Management Controllers in servers. While the family includes four SoCs,
>>>>> this patch implements limited support for two of them: NPCM730 (targeted
>>>>> for Data Center applications) and NPCM750 (targeted for Enterprise
>>>>> applications).
>>>>>
>>>>> This patch includes little more than the bare minimum needed to boot a
>>>>> Linux kernel built with NPCM7xx support in direct-kernel mode:
>>>>>
>>>>>   - Two Cortex-A9 CPU cores with built-in periperhals.
>>>>>   - Global Configuration Registers.
>>>>>   - Clock Management.
>>>>>   - 3 Timer Modules with 5 timers each.
>>>>>   - 4 serial ports.
>>>>>
>>>>> The chips themselves have a lot more features, some of which will be
>>>>> added to the model at a later stage.
>>>>>
>>>>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>>>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>>>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>>>>> ---
>> ...
>>
>>>>> +static void npcm7xx_realize(DeviceState *dev, Error **errp)
>>>>> +{
>>>>> +    NPCM7xxState *s = NPCM7XX(dev);
>>>>> +    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
>>>>> +    int i;
>>>>> +
>>>>> +    /* CPUs */
>>>>> +    for (i = 0; i < nc->num_cpus; i++) {
>>>>> +        object_property_set_int(OBJECT(&s->cpu[i]),
>>>>> +                                arm_cpu_mp_affinity(i, NPCM7XX_MAX_NUM_CPUS),
>>>>> +                                "mp-affinity", &error_abort);
>>>>> +        object_property_set_int(OBJECT(&s->cpu[i]), NPCM7XX_GIC_CPU_IF_ADDR,
>>>>> +                                "reset-cbar", &error_abort);
>>>>> +        object_property_set_bool(OBJECT(&s->cpu[i]), true,
>>>>> +                                 "reset-hivecs", &error_abort);
>>>>> +
>>>>> +        /* Disable security extensions. */
>>>>> +        object_property_set_bool(OBJECT(&s->cpu[i]), false, "has_el3",
>>>>> +                                 &error_abort);
>>>>> +
>>>>> +        qdev_realize(DEVICE(&s->cpu[i]), NULL, &error_abort);
>>>>
>>>> I would check the error:
>>>>
>>>>         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>>>>             return;
>>>>         }
>>>>
>>>> same for the sysbus_realize() below.
>>>
>>> Hmm, I used to propagate these errors until Philippe told me not to
>>> (or at least that's how I understood it).
>>
>> It was before Markus simplification API were merged, you had to
>> propagate after each call, since this is a non hot-pluggable SoC
>> I suggested to use &error_abort to simplify.
>>
>>> I'll be happy to do it
>>> either way (and the new API makes it really easy to propagate errors),
>>> but I worry that I don't fully understand when to propagate errors and
>>> when not to.
>>
>> Markus explained it on the mailing list recently (as I found the doc
>> not obvious). I can't find the thread. I suppose once the work result
>> after the "Questionable aspects of QEMU Error's design" discussion is
>> merged, the documentation will be clarified.
> 
> The Error API evolved recently.  Please peruse the big comment in
> include/qapi/error.h.  If still unsure, don't hesitate to ask here.
> 
>> My rule of thumb so far is:
>> - programming error (can't happen) -> &error_abort
> 
> Correct.  Quote the big comment:
> 
>  * Call a function aborting on errors:
>  *     foo(arg, &error_abort);
>  * This is more concise and fails more nicely than
>  *     Error *err = NULL;
>  *     foo(arg, &err);
>  *     assert(!err); // don't do this
> 
>> - everything triggerable by user or management layer (via QMP command)
>>   -> &error_fatal, as we can't risk loose the user data, we need to
>>   shutdown gracefully.
> 
> Quote the big comment:
> 
>  * Call a function treating errors as fatal:
>  *     foo(arg, &error_fatal);
>  * This is more concise than
>  *     Error *err = NULL;
>  *     foo(arg, &err);
>  *     if (err) { // don't do this
>  *         error_report_err(err);
>  *         exit(1);
>  *     }
> 
> Terminating the process is generally fine during initial startup,
> i.e. before the guest runs.
> 
> It's generally not fine once the guest runs.  Errors need to be handled
> more gracefully then.  A QMP command, for instance, should fail cleanly,
> propagating the error to the monitor core, which then sends it to the
> QMP client, and loops to process the next command.
> 
>>> It makes sense to me to propagate errors from *_realize() and
>>> error_abort on failure to set simple properties, but I'd like to know
>>> if Philippe is on board with that.
> 
> Realize methods must not use &error_fatal.  Instead, they should clean
> up and fail.
> 
> "Clean up" is the part we often neglect.  The big advantage of
> &error_fatal is that you don't have to bother :)
> 
> Questions?

One on my side. So in this realize(), all &error_abort uses has
to be replaced by local_err + propagate ...:

static void npcm7xx_realize(DeviceState *dev, Error **errp)
{
    NPCM7xxState *s = NPCM7XX(dev);
    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
    int i;

    /* CPUs */
    for (i = 0; i < nc->num_cpus; i++) {
        object_property_set_int(OBJECT(&s->cpu[i]),
                                arm_cpu_mp_affinity(i,
NPCM7XX_MAX_NUM_CPUS),
                                "mp-affinity", &error_abort);
        object_property_set_int(OBJECT(&s->cpu[i]), NPCM7XX_GIC_CPU_IF_ADDR,
                                "reset-cbar", &error_abort);
        object_property_set_bool(OBJECT(&s->cpu[i]), true,
                                 "reset-hivecs", &error_abort);

        /* Disable security extensions. */
        object_property_set_bool(OBJECT(&s->cpu[i]), false, "has_el3",
                                 &error_abort);

        qdev_realize(DEVICE(&s->cpu[i]), NULL, &error_abort);
    }
    [...]

... but the caller does:

static void quanta_gsj_init(MachineState *machine)
{
    NPCM7xxState *soc;

    soc = npcm7xx_create_soc(machine, QUANTA_GSJ_POWER_ON_STRAPS);
    npcm7xx_connect_dram(soc, machine->ram);
    qdev_realize(DEVICE(soc), NULL, &error_abort);
                                    ^^^^^^^^^^^^
    npcm7xx_load_kernel(machine, soc);
}

So we overload the code...

My question: Do you confirm this is worth it to propagate?
