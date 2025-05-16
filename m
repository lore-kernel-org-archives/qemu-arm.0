Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2469187njb;
        Fri, 16 May 2025 04:38:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3/etY/zTBwn7T6rK7kiDkCCYGkTfvM90AZygntVEwkElgRM1UZWhNSFgkqZwdU/89xcawiVNUGx6O4g==@linaro.org
X-Google-Smtp-Source: AGHT+IFj+zzKmuWRSq+kGx11BWHZj+8dDYsHcaKIXRHCahXkRhNW+FKTnsRp23A4fbtldUih2JkK
X-Received: by 2002:a05:622a:4007:b0:494:7191:9f80 with SMTP id d75a77b69052e-494ae5309d6mr49236241cf.16.1747395502475;
        Fri, 16 May 2025 04:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747395502; cv=none;
        d=google.com; s=arc-20240605;
        b=lXFMSGSoyyM38EplfOhMOC8LFOq1mS/jUo0cm9W6jCz8B0H91hIrRqOQYKExQZFqVn
         fr6cQtt0AXdYVYYS58VW8gdSr0odk0gAviTH0MUoDiBSbmYmUd5YxxgmM2va1FVPzDHK
         ssK9ameja4gm021yLbR3DcaeAGCLvheiaEruuMDH6uHsBKaS5YbLtPqOWdZRURa9TUwn
         vfVgOLx8BwGIjA4PssHGC5eRyM29ufOJDRcvJ/hKrIzCykxoAAOtGe7Z/h7Xv0NTGPzO
         NRAJCfciAdjtGoMcs2zhwQa2nNq7Q+qBxGPvbcbw5l9vMjp4elIsTElJyF58KscvPwIt
         BcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xZiL7C8ZZIe5yuMZECibEb9dEBxmu+cL20UcsLUd9p8=;
        fh=Tm6V6rUUoasXce52UCTYbjlNxfk0eRqQhBijY1o7j58=;
        b=lKZ8JNDN/BSxmimqfB630D/nzZLodj+5rBU/nrkvY5BLeHYzufgD6fXYK1UDEnypUJ
         XqRlWykDy3ER9VOERj8WQNPy5uaSrPuBtgStNSZ1sqCLCbhl2aRu1Vn8nXGVuB2nN6Vw
         ehm6/Imnd34+6JMGYxnhglsuJLqvvm5nI7SPXN6eifcR9NwCoTAucg89kFwRNbF25GYi
         cfqQRIMikzjk344C9K4YD5vKeDdk2DCBFMug4ZnUyJl0pKGfH/BSl1olHIqtCAi0ipn4
         +EHWM1bcFWCvxYs6Ybd7n3svEb3dGY+KEbxmFG7RYjMAsqWY7LST6+tyDjrVxf30jxvF
         OJow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xd6bnWnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40c86bsi20382411cf.103.2025.05.16.04.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 May 2025 04:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xd6bnWnx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFtOC-0007KO-9e; Fri, 16 May 2025 07:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFtOA-0007K7-Km
 for qemu-arm@nongnu.org; Fri, 16 May 2025 07:38:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uFtO8-00015O-DL
 for qemu-arm@nongnu.org; Fri, 16 May 2025 07:38:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso15098625e9.0
 for <qemu-arm@nongnu.org>; Fri, 16 May 2025 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747395481; x=1748000281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xZiL7C8ZZIe5yuMZECibEb9dEBxmu+cL20UcsLUd9p8=;
 b=xd6bnWnxbn7i8N0WbrT0fG29BpjHFLyJrEHYHPY/S+vSMcwI+ucn3usb6XcNt4DWBZ
 HlOf2Z5ShlgKZ95q1i9weHK1u5lJ3hP/dRZMh8ccMOdlciRBwXkwHTEU7Nf1r0FprtMO
 z/d0z3AgwK0lrwIT+jZngK+R/blWFzeD9kG2/lnfMEtWoYzfaubaklA83lGQSyyZ8L/k
 2QxyjVN+RnFsXHVaNB9isMgKyCCpuBT4SY8Sbwli8glz/UzmFlWu7H/1WGvf0nS0hpYX
 PEbATF/WyCFZbUIOAliLbO5dXJ0S0pT+8d7W41BzRKDqz+kjBaBeN3626wLK2c3S/El4
 pcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747395481; x=1748000281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xZiL7C8ZZIe5yuMZECibEb9dEBxmu+cL20UcsLUd9p8=;
 b=ZOHTQwbhXmtGtFn4lwBCGjK/qYmqX9iuB/j8rspFkX0Ay6OlGG5DYzUCHA6DzcW+Fr
 OPC2fqWBVCTE+xFgFe+rgle3Tc2s+zJh43IubLMKqpgT2vBvI4mJufHIW6XwYUnOANs1
 JTQW4tawvyTQ0ySntXZOqfynE3QvSoIq3BtAGs86YJOvDhe2QGTqAoLE7kOSmeb5BOEv
 HH9BLKxhxMHH4Odkq/kZsvoqMMRcwO5wuuOEzveqWCNTXASmK1jiToNBBwquw4Q7AJPU
 1gALCdjAaROl4JNrfUVoO12hTviqc3LI/yzKmxUJxgKMLrU28+1zMyAQ0NBmO66zkryC
 kT/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpPyYnd8QUXjfmoW9DwmvblYG24TH96y/ILhFZzoi92mWclnyQhj/HCXe8kdz4y3Ut7Qv1mGji9Q==@nongnu.org
X-Gm-Message-State: AOJu0YyOBUrc/1y1j12Izwa2/mLJRDvpneIk++0EjCSOHgnQmk2I+3ZE
 zlHyycfTzaAXfDNWe2b/M4H5MqAPsUEhaSImaQIY4tseLilBbwRBHG8BoNWSp1EP7TE=
X-Gm-Gg: ASbGncstJoELqhw7wt8oz9Js1L6uv2j4ucK+/eQSEA338UDVH6kqyNIT2zIJ0fXeXBW
 bQde9nNM5u6vnD0xhiai1XPWfR+e7PldanA649rKKeXKpf1pPCNIxbMqagcQPvq7Oksos5U41RV
 9++sFacnICPg1eCg9on4xilyM/JOixhYajmI3SF5XPPTxwjlhw2AuHtqhFUdgn5J5mrVes6jVk+
 zGGSGid+zzJ7Tk+ZtVEPhpjEJL7sduVvhS47zQ7JtEjNP69kAbPiCQXKOpB5FiAjAP0yGlO+arw
 bNnnqU5lBF4X+NEwkN3O6HfKijj3xWBH5KCJJj4dZ5FX2Qo28cMH4JSYXk9S7cxhiXDBikSF/CB
 Bv7HRnAtID3Ls
X-Received: by 2002:a05:600c:1c86:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-442feff8596mr23249605e9.15.1747395481000; 
 Fri, 16 May 2025 04:38:01 -0700 (PDT)
Received: from [10.61.1.248] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f33690f0sm102074085e9.1.2025.05.16.04.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 04:38:00 -0700 (PDT)
Message-ID: <ecde12de-3e81-4d81-839c-7e97b6a2f668@linaro.org>
Date: Fri, 16 May 2025 12:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-3-chigot@adacore.com>
 <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
 <CAJ307EjyFBDLMe6EaeNUTWSwNTkSxSYJq5VxAD5u0BwZVu4Fqw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ307EjyFBDLMe6EaeNUTWSwNTkSxSYJq5VxAD5u0BwZVu4Fqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7Tj20dIyuRa3

Hi Clément,

On 14/5/25 14:41, Clément Chigot wrote:
> On Tue, May 13, 2025 at 5:39 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 13/5/25 16:14, Clément Chigot wrote:
>>> From: Frederic Konrad <konrad.frederic@yahoo.fr>
>>>
>>> This introduces a first-cpu-index property to the arm-gic, as some SOCs
>>> could have two separate GIC (ie: the zynqmp).
>>>
>>> Signed-off-by: Clément Chigot <chigot@adacore.com>
>>> ---
>>>    hw/intc/arm_gic.c                | 2 +-
>>>    hw/intc/arm_gic_common.c         | 1 +
>>>    include/hw/intc/arm_gic_common.h | 2 ++
>>>    3 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>>> index d18bef40fc..899f133363 100644
>>> --- a/hw/intc/arm_gic.c
>>> +++ b/hw/intc/arm_gic.c
>>> @@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] = {
>>>    static inline int gic_get_current_cpu(GICState *s)
>>>    {
>>>        if (!qtest_enabled() && s->num_cpu > 1) {
>>> -        return current_cpu->cpu_index;
>>> +        return current_cpu->cpu_index - s->first_cpu_index;
>>
>> Note, CPUState::cpu_index is meant for accelerators code and shouldn't
>> be used in hw/ (in particular because it vary when using hotplug).
> 
> Is there another way to perform that then ? As you can see `cpu_index`
> is already present prior to my patch. I don't mind improving it as a
> prerequisite for that series though.

Yeah it is a pre-existing design issue, I was just thinking loudly,
no need to worry for your use: if we ever clean it, we'll also
clean here.

> 
>>>        }
>>>        return 0;
>>>    }
>>> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
>>> index 0f0c48d89a..ed5be05645 100644
>>> --- a/hw/intc/arm_gic_common.c
>>> +++ b/hw/intc/arm_gic_common.c
>>> @@ -350,6 +350,7 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
>>>
>>>    static const Property arm_gic_common_properties[] = {
>>>        DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
>>> +    DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0),
>>>        DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
>>>        /* Revision can be 1 or 2 for GIC architecture specification
>>>         * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
>>> diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
>>> index 97fea4102d..93a3cc2bf8 100644
>>> --- a/include/hw/intc/arm_gic_common.h
>>> +++ b/include/hw/intc/arm_gic_common.h
>>> @@ -129,6 +129,8 @@ struct GICState {
>>>        uint32_t num_lrs;
>>>
>>>        uint32_t num_cpu;
>>> +    /* cpu_index of the first CPU, attached to this GIC.  */
>>> +    uint32_t first_cpu_index;
>>>
>>>        MemoryRegion iomem; /* Distributor */
>>>        /* This is just so we can have an opaque pointer which identifies
>>
>> Alternative series motivated to remove &first_cpu / qemu_get_cpu():
>> https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.org/

(Just an observation, not an objection to this simple work-around).

Regards,

Phil.
