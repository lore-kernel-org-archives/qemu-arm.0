Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1514618ejo;
        Wed, 13 Dec 2023 02:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEy2mZS06jTOnNunmOz+OOrrM+4sSRH9dkYVatWxRxQgOcZsD10Al0gkkG3v5JOtPtAZ9H5
X-Received: by 2002:a05:620a:1a08:b0:77f:3f7d:b49c with SMTP id bk8-20020a05620a1a0800b0077f3f7db49cmr10352646qkb.94.1702462138917;
        Wed, 13 Dec 2023 02:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702462138; cv=none;
        d=google.com; s=arc-20160816;
        b=accHH9mhqG6Xq3Pxj1zQ0mDd9Pp0SohKXeysqpM97YwyEYBGkNEY4HwjtTSGt6f/v7
         xPET//7+KcO309OzISBrsAeez3WIa6vClF+ZLeZSXWP6befoub4L8sdD1X16hB0AHCM6
         3xirSbabpB3Y3cKZrNzmlC1rst4PJWuAr7w4W2w4Othj7anxRFvrdMizL3lKKbGonBRg
         IDxUluK1CgXD3r/Kv+HEyeiapfQSlr2GDftggIgWyn0nO6eo7sx9DYMAlPfI/oDdKCw6
         O1AIL8LUa3fuhbTzb6PQGUWkXYIjuogt0b0f7Jb14hAOIRM1ZGTpeO2PwKeascr8JWdx
         T8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1jeRVloAfgc9VzxVBvU1eZ5DA0UROdx957mdkIzl4oQ=;
        fh=1Wre7Y5BWcly3RKZZf0DWR77AeLUi0gssqHNLPYoAqs=;
        b=kGrXxr8akDAnUncVFVZHzzKWkgGrzo30PlCNG0Fd4xqphCKDGXTZYvEg4e6U3j94aO
         NzVBEPGO79l4WbaEWhXH64mLav0ESBr7njimwm0Rr7Np1pEMT5EDtcQWHLYZi7QXyNFj
         NtAT9lD8FaAxpcNDcl/AMuRLDq7tNL4ZJWOygKALvBnqGpXQDpoWH3fUdnizCTIbe3HO
         tdDU0WDz72d2x2GJ0uEZvPhCnZ3TZqtfvvYxYKQjBZt3MqIgU8uQPEdGpws7fooJbpra
         Q8bgs089xwHMrkgPr/o5Sre1OA/r7PQLh6z24qTjFyZ2X1Mavmd5TTH/gSLdfvKFXfK0
         eE4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KUqJk/4k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs2-20020a05620a394200b0077d91e758d2si10632630qkn.282.2023.12.13.02.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 02:08:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KUqJk/4k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDMAb-0004O5-Cq; Wed, 13 Dec 2023 05:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDMAX-0004Nk-Vu
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 05:08:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rDMAU-0005Sy-IL
 for qemu-arm@nongnu.org; Wed, 13 Dec 2023 05:08:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso68839465e9.1
 for <qemu-arm@nongnu.org>; Wed, 13 Dec 2023 02:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702462120; x=1703066920; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1jeRVloAfgc9VzxVBvU1eZ5DA0UROdx957mdkIzl4oQ=;
 b=KUqJk/4kyGkcfEFKCyxE+PhvUnuypsaXB6wW239kJ2aArHKExWiKrZos4dbRiDvrOh
 +EFoXECX3gdVUuYetmmbqfm1FJnNR1S1IWsJA6QAFSpouYrpfVMR1ex+SXzeg7qTWbPQ
 gV979wDVkw4lQuX3dlXbkxdMxWK/kO53nYxnepkdZnyHP57bIaWLQiR0JIFY2o+5OMk2
 EI8XziHTePvP+ZQ1z/pLwrGTat2IV9TNv0yTaZ5UpVTlgonGNeNnXb8qLQm2P8C4TyDk
 9nSvn5cAjc7gHg2XIwQVxLkw6on8MTERYckDAty+8LJKDBK57Put8anE57h3n5I16pui
 9C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702462120; x=1703066920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1jeRVloAfgc9VzxVBvU1eZ5DA0UROdx957mdkIzl4oQ=;
 b=YlKfxAi1dRdosSkLN2UDQ14Wtf1GINFcMZx+zalFRbJau26HJIjEQ7K8ngHef34nvS
 X8KadYfaAxkjjtXTaq8q4dwUv4v5c5X/PJwZiVgC5SLgPngRGV5A2Wuk1VBkbp6b8Bm6
 OutIEINwaZI8Qxn0GQkP87tav9+G6Xpxx+/WBkMzbonOkPw2SbecAlXBKBbVPT+ZN8Hk
 HHIaLWWwWjcOH09k8uM+MDN9LX6TP/bs89ASEeJYFTv8WZjFnOTY/q9hceGjwpHaY5p+
 DQt12rn6fKXjyTfK2d7UZkqCL3hh9Le6MtqM/aoR32/pCshu6L9ZiuEfj/eUkoUDODGi
 qkyw==
X-Gm-Message-State: AOJu0YzbE7yberlHRLMqUdR96xN0Rl+tbLXSTxW/1E7NFnOtPjm/EkrT
 xjwB0HLBxE+ERGyVjvtbliQi/w==
X-Received: by 2002:a05:600c:243:b0:40c:5583:c69d with SMTP id
 3-20020a05600c024300b0040c5583c69dmr1114688wmj.112.1702462119858; 
 Wed, 13 Dec 2023 02:08:39 -0800 (PST)
Received: from [192.168.19.175] (234.red-88-28-2.dynamicip.rima-tde.net.
 [88.28.2.234]) by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b0040b3515cdf8sm19847959wms.7.2023.12.13.02.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 02:08:39 -0800 (PST)
Message-ID: <ff0237a8-9e1c-46bf-ae69-99c3f33112f6@linaro.org>
Date: Wed, 13 Dec 2023 11:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] Unified CPU type check
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
 <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: F9JcWS5wL3iL

On 12/12/23 05:55, Gavin Shan wrote:
> Hi Phil,
> 
> On 12/4/23 10:47, Gavin Shan wrote:
>> This series bases on Phil's repository because the prepatory commits
>> have been queued to the branch.
>>
>>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
>>
>> There are two places where the user specified CPU type is checked to see
>> if it's supported or allowed by the board: machine_run_board_init() and
>> mc->init(). We don't have to maintain two duplicate sets of logic. This
>> series intends to move the check to machine_run_board_init() so that we
>> have unified CPU type check.
>>
>> This series can be checked out from:
>>
>>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
>>
>> PATCH[1-4] refactors and improves the logic to validate CPU type in
>>             machine_run_board_init()
>> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>>             individual boards
>>
>> v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
>> v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
>> v8: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
>>
> 
> Ping to see if there is a chance to queue it up before the Chrismas? :)

Series queued. "Before" Christmas will depend on the final release tag.

Thanks for the various iterations,

Phil.
