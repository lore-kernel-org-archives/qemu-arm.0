Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2947832ejy;
        Tue, 4 Jul 2023 07:30:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWihJr8MQOCGXXV87szEcx/Dcdw3l3DNvfNIHBXQ5x4avLFCgOAbmiWpyzQnTzW2IsXK8q
X-Received: by 2002:a05:620a:4056:b0:767:47dd:15f with SMTP id i22-20020a05620a405600b0076747dd015fmr15981105qko.15.1688481025052;
        Tue, 04 Jul 2023 07:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688481025; cv=none;
        d=google.com; s=arc-20160816;
        b=DYX6RcWB0kk7W8JiBQDaSEjdNhjuZKqAhDzSbmIV5XSmFtjLYiBxJCtxFkzOQxxFxf
         8/KjXTPkzHFqbluLMGsbfTcymL30EKJ1J3/jZbaRxkfgaJNd/oYsDCydvz+IvY9uS4hG
         nz7Lzv11WYtsKqsQyks/ReDyXk8CluCejszZCy1/JSCCMH6gfYDo4ME3ohK7IOPXdJ3M
         8uow67dRdqGgcptizGz+MCDhQibc937fRrzZX4JoZMc6+uBOi58LlBmvCzFT2E1KBfKG
         7xY1dwWfwK45hfsuKBceAuI18KuX6tNSjbXNRkjDNtfh1F0a8r01MaWgfZe/21utNydP
         8oUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XEsfGONhUXyIvqAMq1pA305psYj/evf+95AVezYLCWQ=;
        fh=io2b6Ltg0uchImskinPivNiiEkwsX5U7IbfoIL9vHTM=;
        b=tz6hLFjr3hFXLShlqC0DWteIoWqL+V6avqXtzEFl8yvq6Cjz9VTvCZlJcJgybGhBvt
         SP0NJXO4dN2bwqwuixW9fMi3sHNPZZKKSawF5Si0M2hrbOaDWXhAQee6z64UMndOMWB0
         eOpf91R41QrC7pN1fB/wQnqdiHSfsg73/W6uMYm86KEQNQfKDiww49Xso3f3lK0KxtaS
         10TX9/ByCROm7u8iCDiCcr2xxiO3Up+m43BuiqJwsr3F8x2NNvjDzjIm+fZyiO/EVQE2
         CCIUGwdo08APOSFq5byv777R/1LbZggCkt0Bt36wnCueqsBvtys+ooeWtQGVkPCgKwg5
         jInA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HTHwn0/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05620a147100b00767736f875bsi1987194qkl.643.2023.07.04.07.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:30:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HTHwn0/K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGh2X-0005CW-LV; Tue, 04 Jul 2023 10:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGh2W-0005AB-BH
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:30:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGh2U-0006dd-Ny
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:30:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbac8b01b3so47128085e9.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688480997; x=1691072997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XEsfGONhUXyIvqAMq1pA305psYj/evf+95AVezYLCWQ=;
 b=HTHwn0/KvwZzbEIQaE7Fb923FvnJW4vtepasqX8qVwl2YwoORRqf16LN8Cmh7nMcLp
 ILyAIbaqt1VO84drmbHMPyn9kxUxlMRNmnrnXoqO+jTjLnyamhFz2Ykm+dW9FkgL3wTX
 5XrDHROnp4nb9t7FmVhuHHbdEMU+8Nzr+diiT7E3QxaeOB+ztboPUEHCUruqWB8t+tTx
 e7bt4NJYPt1KfMlxMj/QRBHHmo6Zl/5sTN1OLuskxn5RbLl5dCQG2DPwSTOBUZ5CSq/l
 7BnqATdXWeTFoM0JKxgiJyHcNpLny5BWM4onUsGwjxOfuRkaoHmkZUZPMqoSSjPWJh0m
 9esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688480997; x=1691072997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XEsfGONhUXyIvqAMq1pA305psYj/evf+95AVezYLCWQ=;
 b=N3taJX3Eb1KD9Db5JXtXxQ34/UWc188s/hnD4yTwuGEnTlJF/SzkLxMOtLSwqbvEt7
 BvSEGOJNDTuERjQMskavKwEPYPvJZQvQNpXjf/3l9n7JJ9oR/noK5n2cRtNqL3GkSjQK
 n+qm7SJ+cjAItqeJTcpxgqvFQ3tTkmSWFmp1dahR6cTyXX/Z91Mx4HLvDTnrcC5Lq/zz
 /rdfseJ8zUMPHvjyEa3USSPC08Rk0s//oswf1jh2MgO1XNxclz6XbUI+Kcxe4gORdn18
 4U+ZUG2b3FqgKOYHMMLzWuhPV6HiLSydbauGgtDW4Le8EyxjAsXKzvGBuo1MaPZ+ybAK
 NScA==
X-Gm-Message-State: AC+VfDwFbNpKMoJCV5uo0PHbfTeEjSbdFfClqRC+perF9l2Jl/9XwXGA
 Wk0QpE2vV+yeEmo5M9XCZz8miQ==
X-Received: by 2002:a7b:cbd8:0:b0:3fb:acbe:da5d with SMTP id
 n24-20020a7bcbd8000000b003fbacbeda5dmr12301579wmi.4.1688480997149; 
 Tue, 04 Jul 2023 07:29:57 -0700 (PDT)
Received: from [192.168.1.102] ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm28624066wrl.72.2023.07.04.07.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 07:29:56 -0700 (PDT)
Message-ID: <ab63c24a-db11-9e2b-1f26-29ea7bac2b60@linaro.org>
Date: Tue, 4 Jul 2023 16:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 12/15] hw/timer/arm_timer: Pass timer output IRQ as
 parameter to arm_timer_new
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Sergey Kambalin <serg.oker@gmail.com>
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-13-philmd@linaro.org>
 <CAFEAcA_BSA8s6_8BbMZG9wGWMg78u-k-GQ8ZG8n-MUCRNeEUDA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_BSA8s6_8BbMZG9wGWMg78u-k-GQ8ZG8n-MUCRNeEUDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1zuqt3FdNBK4

On 8/6/23 17:00, Peter Maydell wrote:
> On Wed, 31 May 2023 at 21:37, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Both SP804State/IcpPitState peek at ArmTimerState internal state.
>> This is fine so far but we want to convert ArmTimerState to QOM
>> where peeking at QOM state internal should be avoided.
>> ArmTimerState's IRQ is just a pointer, so we can pass/set it via
>> argument, avoiding accessing ArmTimerState internal state except
>> from the arm_timer_*() methods.
> 
> If we convert ArmTimerState to QOM then shouldn't the
> irq become a sysbus IRQ on the ArmTimerState object,
> and the looking at the internals go away automatically?

This is what happen two patches later in "hw/timer/arm_timer:
QOM'ify ARM_TIMER" (which is hard to split).

At this step ArmTimerState is not yet a QOM object (neither
SysBus), so we can not create a SysBus IRQ.
