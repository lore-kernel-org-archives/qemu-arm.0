Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1745070lfq;
        Mon, 11 Apr 2022 09:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwUKHFjdiovKl2EoeOBM77Nf6MlHHnFXgUKJQvB/T/ULPfua3VWdxmXDd5sKaAkt5rWfFJ
X-Received: by 2002:a25:dd87:0:b0:628:e822:bd with SMTP id u129-20020a25dd87000000b00628e82200bdmr21274662ybg.505.1649694545223;
        Mon, 11 Apr 2022 09:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649694545; cv=none;
        d=google.com; s=arc-20160816;
        b=Js9ATU7SrOtnxObgWNZV/T52dyLsVQ4MdRZef0/YJJ0f+VFr1SQphksVXwKYfoLi5y
         /YymS5JX6FKLZJfgHJoEUdpvkzSoU3lCgLs5YLw6v5OgxRJxfDmkVHKBTYThuXg+kwbR
         2ebn7+WYk26t1cCCFIFyQcEj6TMcNV4AfTKWgv0a5i0QzCz2zpFHVolLvqN5pMd8dYPB
         Dqh1T/n9zcc+OFlJOSeV4hxnOQHZespEj5st76H2ZdK8dgMgOPFBiiowqaLLXEYf5ybL
         9ZUEhIP9tiXEJvRIqaxpU9xBHXjMn3Fi9Fw9roX/j3Zljq2cmO7tO7Db6Na+Hbd3auMx
         V6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=XqM9oxu/BICMRdxmQdQx6E3Fn48BhOaZeXIL9gHebiQ=;
        b=Uny/WLvOacSbBbY0ZPhfwQigaCkOT+7ONqN4kqhX9JBjPXtfcL1fmZDcjidsjHF9Br
         XZEWpGJQNqNxNbywaJL1xBkn6NmALP+05DQwmpNaUyzuS7VXWrGDWggHJmC0wfZUtPAy
         CNAa9/vyC2zeuMhnfrwXc28eyC6ak92ZAbYh3A3NYBQ4AAjTSz4axAMWSU2nf2aJYNA3
         qjnDD5wkiUpt/31IHwlrpNjebdkP3KH/UChM80NNUmPEUgnFmDWRXW2cDMTUZ4JCV4bS
         Vrfwb/N92M76oWDE82vMQQvES8/mSuqEf7hPoowLvl2jp1YQ8iJIIsIwTaLhq0+faNTK
         trng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smZ2xF0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u64-20020a256043000000b006339940463csi4301459ybb.678.2022.04.11.09.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smZ2xF0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndwuW-0001S6-Iw
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndwu9-0001OS-RZ
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:28:42 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndwu8-00086w-9v
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:28:41 -0400
Received: by mail-pf1-x430.google.com with SMTP id y8so9877002pfw.0
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XqM9oxu/BICMRdxmQdQx6E3Fn48BhOaZeXIL9gHebiQ=;
 b=smZ2xF0lYT6jOQSx4dmvo8eeoebi+knFxAN1ohkEm13jKeGeGXImbgVlRMP2KqNvO9
 u/k/LfqboblWd3EoSg2GS6laigmtzNFgkt3O9Rq8sA/EamokXiXp6nVh1obc97b/7lxS
 YtQ91bm1193CePK1ZiXFSZEctnDGLmNVgxMMEIq9AqGIBjrzn4t2lImEmsGtLbFKB6l5
 /nlNnjpEzlnz4PSr+8+BTeoitTDICaSZ4mjlkXEC9s2BO9IueXg9lhBrZ8BR5DY9PzW5
 fmMBjMjD1sVhI14VBgJzRcCnjdS95s64Cq761O9Z4O/fFakWHhVBkJRN92fApOCanwgy
 VoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XqM9oxu/BICMRdxmQdQx6E3Fn48BhOaZeXIL9gHebiQ=;
 b=aCP361l+woifKYy1ID/hpJT/A13AIeoQBsotRClaGRf3OQ72yShpI0S/AG5/2djhZF
 9U+zBjgesNGs/P/ipDR2Bzc5uug1dzvifyX4O8PdFTKZBsR+7yglt9TF0zhbY/J0JOJq
 CBUR4GCXGXJBaOte4DULZB1C5pI0TDI9zXDb264hKptkpgJmh2yBUhljnCkwLX+hZ68X
 b6SSgpmZGWOo2p6ZuMPVAB7cKSSPrkPaHIP9ItTZi9ifTHQ9CkVXKsPtWsBaFZOCRkOZ
 rqn5A89hng3VKUnYFQF/2P1i5xQv/lBqCta5QJLK7+9IjjJLolAeI4gnJSiz0CbwyDFf
 awCw==
X-Gm-Message-State: AOAM531kdv+VaBiRspWsQszVOvRIaiLwkauVZIh0nkjNS/ua2azaRCrs
 yzxOkxB6TCByxttsDyRvjabkfg==
X-Received: by 2002:a05:6a00:999:b0:4fa:964f:9021 with SMTP id
 u25-20020a056a00099900b004fa964f9021mr33731763pfg.34.1649694518141; 
 Mon, 11 Apr 2022 09:28:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a63b510000000b00398d8b19bbfsm241445pge.23.2022.04.11.09.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 09:28:37 -0700 (PDT)
Message-ID: <6e9d502c-343f-7d20-27d8-ecf57e020d66@linaro.org>
Date: Mon, 11 Apr 2022 09:28:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/16] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-4-richard.henderson@linaro.org>
 <CAFEAcA_HUXLC1Rr05rVCsMyY_EgqdQxpx3mnrrJA2p-WL79c0A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_HUXLC1Rr05rVCsMyY_EgqdQxpx3mnrrJA2p-WL79c0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MeShQy3Y/JhE

On 4/11/22 08:37, Peter Maydell wrote:
>> +    /* aarch64_a57_initfn, advertising none of the aarch64 features */
>> +    cpu->dtb_compatible = "arm,cortex-a57";
>> +    set_feature(&cpu->env, ARM_FEATURE_V8);
>> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
>> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
>> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
>> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>> +    cpu->midr = 0x411fd070;
> 
> If we're going to claim in the MIDR that we're an A57 then we
> should provide the A57's impdef sysregs, at least those of
> them that are visible to AArch32. This may otherwise cause
> problems if the guest OS tries to write to one of them as
> part of some errata workaround.

Ah yes.  Thanks,

r~
