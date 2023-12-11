Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp407793ejo;
        Mon, 11 Dec 2023 10:44:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl8OaB6mpWok0jWTxsjKzs/Z6SYLtPposl/XOEqI2UECYGZej49rQ7AN727V+jRDyjepGk
X-Received: by 2002:a05:6808:3847:b0:3ba:92a:910 with SMTP id ej7-20020a056808384700b003ba092a0910mr2583016oib.104.1702320249814;
        Mon, 11 Dec 2023 10:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702320249; cv=none;
        d=google.com; s=arc-20160816;
        b=f9dY2m3JkqkFVD+pmAOWhXuISJgwjQrZxCUecLNBhrzXJecslhCC5gURHSySGdhCYt
         s8K0l/s0LSodxYOwoPYIaQ1TUU9wjLfrg5V308amtFiGxwMzI0DPlUkc1P7KrYxATKxR
         TZ1b32bweQuQa89qx+lXK/eAfcc3v3o8n2WYwSeH+J8fxn7UlWHaXnn+ZvSbDcHlOU+h
         RuqCWNY0KrGuBe6d4NRcEyo7Yut5j0Es0oT4EFrRG8i7QPV5lG7APpT2wNWMqE+EplbT
         m6XVrSC1WVQhM4TOyHlIWq3DQZaQx2DGHbSELITNP3hDvUNXoGtpjQlQtJo79L6ISmHH
         4YyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7iIbUe4HqEzpB8PWwuLJHVnIrXVBAvNw+FJ17pUIqGI=;
        fh=j5DsNx8XYpJ4X+T+PgVg79Q4FslxBxbOXBGfiRSMgY0=;
        b=F3YE3htFtSuVU85+TmDlw0UNK5+53yMptRokfR6eQDbs92jZ+Hg/abynHSqBE7X9DL
         7tLLqxrXi0cCKYf92i2zpTeai1Y0WsYJZ41ceZUHZ09AiX+ftVdRwsAjURiABCFFVRV4
         RWAEtSjIaxwrMTzAWWQTT5Op/znntC9NSIWjcv3SJ2btVxzhnG84EHuUCgS0abxd2wfP
         4vfn8ytrVRQYjYAZ1A3sODQQsgFJcve/9uDiWgmx2aWDNiPljQJKWngdFWeIpMZL3xpb
         MiVR2E6egIdo+ZaRF7OWiSckvDwJGAtafmxS50o57Cc7GxHD17OaBy/iAAkzyLHTzByN
         AnoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOZFMVl9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a05620a0d8100b0077d708299besi1469781qkl.425.2023.12.11.10.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 10:44:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iOZFMVl9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rClG6-0004Km-U1; Mon, 11 Dec 2023 13:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rClG5-0004H7-5c
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 13:44:01 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rClG1-000133-E5
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 13:44:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso4584273f8f.1
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 10:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702320236; x=1702925036; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7iIbUe4HqEzpB8PWwuLJHVnIrXVBAvNw+FJ17pUIqGI=;
 b=iOZFMVl9+KDPFORkOWyi3tCCk7SAGCQmk6Cu6MNeDQUKqTIyEAXG5dnpKT6A5It5dh
 cNOESu8BwSt8s0LZb9H6z91BzA1oXGaIMdtwIpmUlQYQYSFBwzNtyHkpQnpi3nenVYIC
 N0GmvASkLGg8+Zg5JhSZurzYv6M1G44rGsZhg1vyOrm6/gc+bOH9s6sggDyS9rdpHuI8
 wsOuS+/MVyiA3uiswWpTHkduQWEPk8swvlde5itE8UKL6kc1XIbA8v9EabXlytu8nyfN
 zXE9PLHI874M2H4RsBaxeZzczSPSKdjus0Wx9D8//Qffol9OrVSxZZhGYj3sCBWeMufF
 6k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702320236; x=1702925036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7iIbUe4HqEzpB8PWwuLJHVnIrXVBAvNw+FJ17pUIqGI=;
 b=Qk+4n0vbZzkcFT91l4HaIiQmQeOIBUxr9bGJ1XLckg19tmzGG53GCYTsoHSCTLDBIm
 utrSlaTi+umDgzGtjfvcfjkBKMfDi1uemU+4oY/x42ZS4vH9sf1zVd5pswrT4fPE8Hd9
 DL6F54IIOZM65isPfRxp0rMGqL5IQsoommhMwGs/PIzqHNyi3Pa98CeSAIOhuYfTth8L
 x5SQYsaSzrZhYed0p+7tdRxz6rRh+h2CuDVJre1vOM2JvWXsk2UDLRVVyOX39YBrr9E1
 yYKGNbg4GZLBH1FImw7GaU1hPuhhqR70XGGLjdvFWJjAn0emkDFsgdyi1MlbfLvHoq4A
 Lt8w==
X-Gm-Message-State: AOJu0Yy5szy7KEqZoYevFX3BT7yCfw0tIdRgkfJVttCQ1uIaOKFeoDPJ
 dIM3jwjkxi6iuN9DIIqwJ0JBUw==
X-Received: by 2002:adf:e951:0:b0:336:1b04:c0c1 with SMTP id
 m17-20020adfe951000000b003361b04c0c1mr1299666wrn.12.1702320235861; 
 Mon, 11 Dec 2023 10:43:55 -0800 (PST)
Received: from [192.168.69.100] (cor91-h02-176-184-30-150.dsl.sta.abo.bbox.fr.
 [176.184.30.150]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff448000000b0033344666878sm9151217wrp.91.2023.12.11.10.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 10:43:55 -0800 (PST)
Message-ID: <89aea648-1254-47b8-a194-e4d22de5c097@linaro.org>
Date: Mon, 11 Dec 2023 19:43:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/21] target/arm/kvm: Unexport and tidy
 kvm_arm_sync_mpstate_to_{kvm, qemu}
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-21-richard.henderson@linaro.org>
 <db8f1d15-121c-4597-8f04-15661c7eaa3b@linaro.org>
 <CAFEAcA94EdEEcjvTZLYwnuv=ngQz5sD+ihY7ez+soeJMu=aXow@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA94EdEEcjvTZLYwnuv=ngQz5sD+ihY7ez+soeJMu=aXow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: l6WxtNWDkma0

On 11/12/23 15:34, Peter Maydell wrote:
> On Fri, 24 Nov 2023 at 12:06, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 23/11/23 05:42, Richard Henderson wrote:
>>> Drop fprintfs and actually use the return values in the callers.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    target/arm/kvm_arm.h | 20 --------------------
>>>    target/arm/kvm.c     | 23 ++++++-----------------
>>>    2 files changed, 6 insertions(+), 37 deletions(-)
>>
>>
>>>    /*
>>>     * Sync the KVM MP_STATE into QEMU
>>>     */
>>> -int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
>>> +static int kvm_arm_sync_mpstate_to_qemu(ARMCPU *cpu)
>>>    {
>>>        if (cap_has_mp_state) {
>>>            struct kvm_mp_state mp_state;
>>>            int ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MP_STATE, &mp_state);
>>>            if (ret) {
>>> -            fprintf(stderr, "%s: failed to get MP_STATE %d/%s\n",
>>> -                    __func__, ret, strerror(-ret));
>>> -            abort();
>>
>> I suppose if this abort() had fired, we'd have reworked that code...
>> Maybe mention its removal? Otherwise,
> 
> Well, it's a "KVM has failed in a way that's fatal for the VM"
> kind of error. It's OK to drop the abort() here because since
> 7191f24c7fcf we will catch error returns from these arch-specific
> functions in the accel/kvm generic code. When this was written
> before that commit then if we didn't detect and print something
> here we'd just have silently dropped the error, I think.
> 
> I added a brief note to the commit message to that effect.

Thank you.

