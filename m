Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1605ACED61A
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 11:25:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLJpO-0001u1-0N; Tue, 18 Nov 2025 06:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLJpL-0001ss-7U
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 06:24:51 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vLJpI-00054P-P7
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 06:24:49 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so36875575e9.2
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 03:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763465086; x=1764069886; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bvDpP2IVJJRQ+n2zQy2iI+FpIq3ypH8hVi0ntiSMvg0=;
 b=BlXDwJBmlh4e1erPAplGd4BU+kD7eHp3QTU7+gb82/N6LQ5ehRJaDlh0qYARH1IdNV
 Qx8HPYFzaRCbUgt/LtRNklqACFRRnIHiEfkE/yFatxDvy14QZTlL2F+OvcRY+ovPp/e0
 DN407Ve4dtXa2C9MT6t+a5mSLMq92PbJSND8LepEnVx2clShJ4IYUj2SklfgKi6I2kRY
 6OMyixqEWnRFMdCCdwNCt/QGjQXXmpEvzdrH4uIohzwOvYb6yqArTSmwfRsvOyVHSC4y
 ixTgY8YSEQ6Jyc8oVg5ZhzTG5gHlt8a1Y+sf1/+CGjH/vvANQwiQLYXf4FeZTXdSPz/C
 M2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763465086; x=1764069886;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvDpP2IVJJRQ+n2zQy2iI+FpIq3ypH8hVi0ntiSMvg0=;
 b=wQ3DXu40ELnOFvsnMST95Rj1qireXL2QG7YE4MHjV7jFsdZ0o1cOTQbO6M0v9WRRIW
 qh1z67hrnQWcHhNHQT5LfeoVYbbX5OxXnzPxG6IXGoMo3NsBr49qxgExD/t4CM6QZBD6
 QHTbhTb8stzFox8Wmv+CQTBov7/T8aa+oeQ602DwG2V+zciYRYes+6Uf/N/jhKm5+qAO
 5MWWJo+yI8n7Hgh8fJfptTFfa9Xzbslo8FbyM+fPpf62L9vX3UZtdlSvF5vOWks+YrQ/
 qiQ99owiJ2TnTSVNhRTTRntGS15tDQLLuH5RasAOSnFxK3hmRrlzvaygbmpNGjn8buhu
 MTzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNq8591JMna6bzcEOQQ9Mwd9scKbeZjAHUmtBPDyWrxrb6jNvE9UJMe/TorSY4yqYi4EHuhMqcRQ==@nongnu.org
X-Gm-Message-State: AOJu0YxROJ1YjpDTSkzSP3Kz73r03MB/WZeAipO6CD//+sD+eEuZ/VU5
 tOysbuejpu+0QuJPcX/dyj9+zBgzQrtDCJEcxfOxorGHd5c1/nw9ruKC2R9iNhfF/ydFxc5OII9
 JJTK2GZCysA==
X-Gm-Gg: ASbGncv0AApLSPp3kiZfs33wKdX+mmFuAxEaZOX0Ltk29F5ouy40TeUbMYTBT496R+s
 BzuDhUc0us2Xxk5kAHnOS6Vb4I7uBE4hGwOgGCBCr5txkk73I0FXIwadeTG6yMcbzKZWvWLnT7N
 6MS29aNQmjv+72mabbpsg22joZt9vKRzeaaElpoZdid2lKdEWJvydU1/XmsE7S+4w0eHN9upJwn
 kHC5ksKhWyMhqYzD+R4kw4qVFQqyxNLMOwYrqHRiyFILccXqG7AxD7RaHnMbAjyXrKyC1aXeGNK
 UFi74HMl5/WFbCgMjQ0+a9FH4ZLchiMGknj7Sj5eI6nCP8zVUKWyv/SOp0E/X463s4wZr24jwJw
 wWIb/RhcqOh5pUdFtSXfODUutnyDeT1BOXxiZDKfw3wIB49K8lkDA7NYsA4jej9aoo0TEiO8227
 K1eMVghi9zZHtwQalTqTPi8zzUC4jnSq27FSPJagqsYjs=
X-Google-Smtp-Source: AGHT+IE0dHq6LcID9k6G9kb05S9J6cdLFX9bBjgLMeMdCr/xfrlAMZsbAvkfBSPydap974Q4xJywhw==
X-Received: by 2002:a05:600c:4452:b0:477:832c:86ae with SMTP id
 5b1f17b1804b1-4778fe5c755mr136090025e9.12.1763465086396; 
 Tue, 18 Nov 2025 03:24:46 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779f44a0e4sm143767415e9.15.2025.11.18.03.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 03:24:45 -0800 (PST)
Message-ID: <8a86dfaf-eba5-4348-8885-58c520355e47@linaro.org>
Date: Tue, 18 Nov 2025 12:24:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] hw/arm/imx8mp-evk: Add KVM support
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20251101120130.236721-1-shentey@gmail.com>
 <20251101120130.236721-2-shentey@gmail.com> <87v7j8r399.fsf@redhat.com>
 <CAFEAcA_XORdwONC2YbVKPois6BLPEr0dFt_QjTHE=UWmiCiv-g@mail.gmail.com>
 <2EAC1B70-89DE-4694-A4E8-350DC6F9C343@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <2EAC1B70-89DE-4694-A4E8-350DC6F9C343@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 18/11/25 10:49, Bernhard Beschow wrote:
> 
> 
> Am 17. November 2025 17:38:03 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
>> On Mon, 17 Nov 2025 at 17:13, Cornelia Huck <cohuck@redhat.com> wrote:
>>> Running current master (resp. with this patch applied), I'm getting make
>>> check failures on an aarch64 (Mt. Snow) host ("qemu-system-aarch64:
>>> unknown type 'arm-gicv3'" while using this machine); going back right
>>> before this patch, everything works fine. Haven't tried to debug this
>>> yet (maybe I'm the one with the weird config again...)
>>
>> Is this a KVM-only config (no TCG) ?
>>
>> I think this happens because the KConfig now says
>> +    depends on TCG || KVM
>>
>> but because the machine by default doesn't use KVM then
>> trying to run the machine with no extra arguments falls
>> over if TCG isn't present.
>>
>> This thing we put in to handle "creation of the SoC object
>> via device introspection means it doesn't have an ms->cpu_type
>> to look at":
>>
>> +    const char *cpu_type = ms->cpu_type ?: ARM_CPU_TYPE_NAME("cortex-a53");
>>
>> also probably won't do anything useful under a KVM-only config.
>>
>> I think the simplest thing here is to put the KConfig back to:
>>
>>   depends on TCG && AARCH64
>>
>> People building a KVM-only config almost certainly do not
>> want this machine type and its devices, because the main
>> reason to build KVM-only is because you're in the
>> "virtualization use case" and want to not build in a
>> load of not-security-supported machine types.
> 
> Do we need this treatment for further machines, e.g. isapc, e500, mips? Or shall the CPU type handling in the SoC consider kvm_enabled()?

Good point. My understanding is only virt x86/arm/ppc64/s390x are
"security covered", but there is no explicit mention of that in
our doc. (btw why not include isapc? as it is a subset of other
covered x86 machines?)

