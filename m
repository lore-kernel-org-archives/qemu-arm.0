Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80DD6ACE8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 11:23:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWC5c-0001OI-Oq; Thu, 18 Dec 2025 06:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWC5b-0001NM-2n
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 06:22:35 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWC5X-0002pT-Fr
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 06:22:34 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477b198f4bcso3877985e9.3
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 03:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766056947; x=1766661747; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dNVuCOcU0WvPTFGbmqWdJaYC8EnlyUQ6JIDvQH8knzY=;
 b=VXmRODbIDkm798cL/LmkTXXJiVuWwc18Ykg75YvPO1WfYe342mDi+ejm2O7e3Rk5EK
 V9p4OQp+EPTgsvEd1qcOKvI1O0yaMIoP5dOuigQlEqmb30f4B+NL4UqXXDkAQ35BHohm
 Llof1yOCvr71qIvs3FIef/BpxczwN5E/BIMaUuXHhVXVTPL902xF536MtOc7mZx9FHFW
 yxHLPPm5bM39m0ghbXWCj7UZKd6gzKpHmQanQoWfLhWYbpti15NF0MSPB16QVwdUE+EF
 KlzLDs1eQhap2KwekyYh9Qq2TpPmGnCvgiAChEisRZ+PcU0BpnZjt78MJjPgc+fidZvG
 Kl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766056947; x=1766661747;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNVuCOcU0WvPTFGbmqWdJaYC8EnlyUQ6JIDvQH8knzY=;
 b=Wv2qXi/cVGldO6Wz0XbD6HWjC8DQaYfM5IiHe25c27D/3KTG/pS68AjgweOgqWCxfm
 i6oN5JYlRmKPeRV/GSaW0Z2DqRjXfEuHYHBwIc5Nk4FkM85KdUf3EcxLdn6GbdHNq9bp
 VwplYKwhifrgsXxFd0h40b8hiPhOmAGrLVNVs7IzkCv/JnWxgScFsjB580CmfFxwPhiU
 M2JFXzus6s2iSz6pJkP+EXYJqh0rqmxD5Oq0+T/UH+A79u2lQe+E78/iATm1hJsGlqFU
 uaGBzadOW5/yvBlDqA/xMg61fdgA1RT2bh9WrIyDMCkTx1k4pMZiOuGMmAEgXHW4WlEA
 pwZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4Eaq/J/+O+cQOjHZy/ePSwyohqSdMUfzr9yzfF+pFyobeAYhcrOUvYTaEqojORi6ZiIKGkHZa5A==@nongnu.org
X-Gm-Message-State: AOJu0YxSMTTW39nRP+oS15vfUbUlvFBpo4Rg+sgidtAK3WfFi3i2gJsz
 3g5LgkA4bPdT+TvTcD0Ypnf7n1u0znPWbakfmqFSSC2SV+U09KkcSx8CgWuQiYy7F9Q=
X-Gm-Gg: AY/fxX54GIAlq2HrBJYUAtn/p51FoiV15/ubj9OFIPIsAajisVFLMOR8w6R/ZmrnmQ+
 oml0Q2kJyaRzUnmk8tSdIafZBAkoScewrXN5BCUq6heYVIvIQM8GvPg/5VKfBTQyCpg0J9IQGQJ
 bAQSRd8038JUDzpVbaNNppVv1umnZmPq53iDekjNtlASdSARPC8khunpY24Bb3Io+BawpaxHmpb
 bxyjp9Nn+tmrxS3Pz0o+t7ZabqNP6r4njOfuzi/0T+3uoIq49z+QGj0ptHqyuwEMpBALkfeOtc4
 CUoZEk/DV26PxVdc9gjSrgbsgWaRKvO98kGLVKKpiNv4ymj2skj+QY7KnPRbwwJb7FfNifUAWGk
 WK8SkOZCEaReYQOrTuzYlzVdyflUS6yuh6B83S1+5EV4lvS9PQrqMFCNERBdD78yt8nhfk8Bj5b
 jqfJkb72XbrfGcFifA5ms/qzYHLC5e/ukBVqb7sAw9Xrg3Ve6nkXfiZg==
X-Google-Smtp-Source: AGHT+IHeixqm57kUURBE60Y/aSC37eGIH/Ae6Dy2uYYke1gui4PzzdIFnr4gTma5spaZwJ1sZc9Y8A==
X-Received: by 2002:a05:600c:1c2a:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-47a8f905313mr231606595e9.23.1766056947364; 
 Thu, 18 Dec 2025 03:22:27 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244998c8asm4547267f8f.30.2025.12.18.03.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 03:22:26 -0800 (PST)
Message-ID: <7d238d0d-df26-43fd-bfac-a7d94064d486@linaro.org>
Date: Thu, 18 Dec 2025 12:22:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 v6 08/13] hw/sparc64/sun4u: Use
 fw_cfg_init_io_nodma()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20251203060942.57851-1-philmd@linaro.org>
 <20251203060942.57851-9-philmd@linaro.org> <aTBccn2LIv7puGzR@intel.com>
 <05f92a77-7587-4441-a252-01e4705a6892@linaro.org>
 <c03820b8-7745-4b8e-8e69-a37c872257f8@ilande.co.uk>
 <aUPAysAYqTPAfgzD@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aUPAysAYqTPAfgzD@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 18/12/25 09:52, Zhao Liu wrote:
>>>> I think maybe one reason to use `ebus` is because...
>>>>
>>>>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>>>> -    memory_region_add_subregion(pci_address_space_io(ebus), BIOS_CFG_IOPORT,
>>>>                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>> ... because the parent region is managed by ebus.
>>>>
>>>> Perhaps we should add another argument: Object *parent?
>>>
>>> I thought about it but don't think so, all instances but this one use
>>> the machine container.
>>>
>>> I'll improve the description.
>>
>> The reason that the fw_cfg device lives under ebus on sun4u is because the
>> ebus device is effectively a PCI-ISA bridge, and the fw_cfg port is mapped
>> into I/O address space along with other ISA devices. I'm not sure that
>> setting the parent to the machine is the right thing to do here.
> 
> Thanks Philippe and Mark, IIUC, ebus doesn't have the hotplug use case,
> so it lives long enough like the sun4u/v machine, therefore replacing
> the parent object "ebus" with machine is safe.
> 
> And it might be better to explicitly set ebus as not supporting hotplug
> (via dc->hotpluggable = false).
> 
> Adding a "parent" argument to the generic interface fw_cfg_init_io_nodma()
> doesn't seem necessary at the moment, since using the default machine as
> parent seems enough to meet all current needs in QEMU.
> 
> What do you think?

fw_cfg is per guest, and there can only be once instance of it; so IMHO it
makes sense to use the machine as parent. I should have posted a better
commit description upfront, sorry.

