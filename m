Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1094715ejx;
        Wed, 30 Nov 2022 02:35:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5HK3W9Z6zKIUY8b9q9Fk02Pe9mUoNPOV+l6jZHeV4hRmfKHpczZEBZqNQpraXM1RhyQR8r
X-Received: by 2002:ac8:6f1b:0:b0:3a6:1d17:f4be with SMTP id bs27-20020ac86f1b000000b003a61d17f4bemr38070131qtb.484.1669804517723;
        Wed, 30 Nov 2022 02:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804517; cv=none;
        d=google.com; s=arc-20160816;
        b=ywSSpwnNwcrdytUzHFTpYWfVpUmUqKx93zUEh90aIr83s2Vfx9sFfipeTe8Aarnyl1
         HWum/9zDbSPqFv4i9IGQ4N5ylwXLE0XIv1db0EvCGbKdmae5M4N6d5dVSOLRs/F6/9pR
         JOquH3MwCZk8weHJXpdKayJ46Fofq3tqtNNNzLk70b/sPysecROQFSaoxNh92MmyO/o9
         BFXt1C83PIffi4X3YRUtywCGXS8VjmrLJCnFMMum3r6+bbotZAJ0lokw1KxG65OnRdlS
         8+svgYyb4H1JcBpwT0+Be0pMqV+jtEmn7o1pcXncNK+HoviYR5338d2bX248/SiKz6tC
         C+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hTxWwQ8pnHBAhVWILiznOV1ouS7gsNZ043hLdvyA3EQ=;
        b=zkjQp+cGYu57wWLEfZ8ouFK3EiSkBO6Sr6P8mMv+FEHbSr7p+vpvHwrYxn3jGDOG/P
         3Xeta2qOEATQGsh50LxJ5MxAbdHkGgbF/5bLrbdexaJzvFo/vd8RRdPoM9GhohU+jHTC
         LlwbNnGkQWAGnAMY0mVsZAOmOKJmv8O1thslzsqjh0i1UvclR4YNz9VNRgnaJCgE8+3f
         OmuP8EG98HID+iXyp+lvAn3eBIaWB8/s5Qh28r8V6SV+Wzzqbv4C0HY1+rYhd/uPJHW0
         P0GG4fLZbh2pOuiA/bC6GdyFxe3nC9oeLLCxf4Wjh3zKM51xMO5/dgbR5XF+EQmv3usr
         C8YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zs4THspA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26-20020ac845da000000b003a689976789si573502qto.166.2022.11.30.02.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zs4THspA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0KQU-00046R-9M; Wed, 30 Nov 2022 05:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KQ6-0003oE-Ma
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:34:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KQ3-0003I0-Vk
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 05:34:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q7so25466936wrr.8
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hTxWwQ8pnHBAhVWILiznOV1ouS7gsNZ043hLdvyA3EQ=;
 b=Zs4THspAXzcYFHeduMODa1aGlXvp5UcNzgDJy74d03NjTwsfadh02kdVIenV5wAaeQ
 EjCwz1Aji1NNwMXKHmp4hJIeajJ30HCnIAKMpo6V7o8wVqNou5hpx6dc16A4G51ve9Ot
 0pkJ1mLulh30lQelm7Isup1osITGF4ZVfyGzWPmTgwBPX/ZIdQ/VRC5SJMEaFlIoHAB5
 36EkJo205zNkFdf5ZcdVk3vie9jc6uvnBgIq3Bkz4e4y9s9soBcyCrK1AVpWkcxbjUSK
 D44Dmb5bz+2hP5UrUWcWyfaL19jdbrE8UArKp1TOmzZTPk1bsvDaD6ehPuHxDUyhUqSG
 x+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTxWwQ8pnHBAhVWILiznOV1ouS7gsNZ043hLdvyA3EQ=;
 b=pKH9Jx0YnwNgx5VT7lz7gGsiMDQZPO/WhMw9HCxOGqkMJB6WCfh4oIddcdMplfefR6
 YdCuygmU9gTgl6PRe7RjZdcvih0IbgTekf/wMNfyh58SyrLUoSfMYdah/8HHhFCXrM/n
 ls0Joe5835i59788kDA2ACamydo0XqB6gegnvmGMZZTOkiX0viKJAS45EDHqfwpJjIzu
 gR/O+6GLhRRU/7Bc/5HMQ088Ud3/PUD7m7kbklpbBYzO9zd4FO2Kp6Lg/pJ2OUgBwD2N
 IEVD0NSIuH4shoBemDafYNDR2bLHqoxa7Ev4kJKKY50A0Wy+vtS8IFVRMKuJrnTRg7eU
 jqQQ==
X-Gm-Message-State: ANoB5plD7lr3vAKV55W9OQtT7V2N9ye3nIQ2PtR3Jxi0STio/gtqUYsd
 aW1ZHCc+nVJpEiNwJbNhwidFJQ==
X-Received: by 2002:a5d:5955:0:b0:241:553e:5040 with SMTP id
 e21-20020a5d5955000000b00241553e5040mr31335614wri.578.1669804462618; 
 Wed, 30 Nov 2022 02:34:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b003c65c9a36dfsm1360913wmb.48.2022.11.30.02.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:34:22 -0800 (PST)
Message-ID: <ba706176-3d87-49ce-e9d4-9bc059bc8812@linaro.org>
Date: Wed, 30 Nov 2022 11:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 9/9] hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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
X-TUID: bIfipIqr1k2Z

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_ITS device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

