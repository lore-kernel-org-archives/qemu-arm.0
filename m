Received: by 2002:a05:7022:221:b0:5e:6ea8:9f07 with SMTP id 33csp206284dll;
        Wed, 15 Feb 2023 23:47:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/XOg3oJAcpVoI1NB7YNQFJotx89t/yQ+b67/2lffud2XgiCP2c4UW6SrFwVEtpPRwzxQh2
X-Received: by 2002:a05:622a:243:b0:3b6:3b60:e0 with SMTP id c3-20020a05622a024300b003b63b6000e0mr7544756qtx.31.1676533665970;
        Wed, 15 Feb 2023 23:47:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676533665; cv=none;
        d=google.com; s=arc-20160816;
        b=hbKHUGYZW7msdFqLDYK8GmyYHaNb/1mKGAHhJvAfk8NUPxGfWvYUycL92h48z0MABl
         IsdPiIZ1wjZnjz2MTx2xDlgsmfG05elFfFpwZj7oM1IDDTW3/tG2zbgFYxey8uehGTvv
         TZK2y5Ke232qEO0B+rweFDylKKwUOM7f0v9IkisnD6Ka4R2dNBGXfPdct3s1e43TnLQs
         6dghOss87OCNeKkRXLNEEkZMCLMM9lej+hk4kwNm5DdIfCWzYaj0X6Q9foWcUBIvQ3j+
         qfZCRl+s+SBLPMPj4cepAKHit1KGYhN3wETxi5ZdhLt56G1TAYKgEFbqribpY3EvgO5J
         KrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ltSUp0V0DygOjKUG1rVyntURKUpZZwTHSMKbT96DuUQ=;
        b=giNJniPk+6XJ+hniYAUhs1d5PTP+qGHCP32Kp8ZJma9W6PNjMb+TUc+f5d0QpwmiCV
         hEIRY2b+Vg9sVq/HrhmPD68FvPC5Cj16dieSVO9SjAgGjD4E4N9LilJDDlsu+KCHDTX2
         GnUOjIyOXZYG+DUk1ALGRAvdZtdCKSv5DrworSJ4mppuWsyj7Yp8sRDzbiBhrmti+3Pn
         l0ZpubLTA5ZFBrZ0598CY0gzmnjplHUPWaRME9E9bGiFssGh0LNznOl3Rsz09Z8zVLu1
         5URaJ8OdhkBWuVuLhOwx5uzTDpKWM4G462g8Fwaoe17N9rkzgCBtfi+MklDdAJOdN4Tj
         M5Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qDOHeWko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020ac8431c000000b003b8422561aasi8641qtm.46.2023.02.15.23.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 23:47:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qDOHeWko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSYzB-0002hz-P1; Thu, 16 Feb 2023 02:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYz0-0002hI-6x
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 02:47:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYyv-0004QB-9f
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 02:47:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so3599757wmp.1
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 23:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltSUp0V0DygOjKUG1rVyntURKUpZZwTHSMKbT96DuUQ=;
 b=qDOHeWkobdnW5g1DP1w5i44v/lLWQejx8ejmGqZsbaqb1Pd1RY7td9w+Ow4vUzhiNr
 UktpT5NmxZ0JCLa6QkQwHDEgCAK0rWDfKbrt++qTeHl7wszJ8/hWnqK5IIjKhINKRtxB
 zgyR5RkA0yPkMRmHvOs+J+wp2/FqDOK+ipnbg3LBoQmgYVpXtJV+Oz9gQZwjfx8sV5Sp
 SAPKe8jc5GhQkJhAf8EL711qhX8kK9K4him44Vs5sFIRmsguZ7uout5sCFLr8AumG2G7
 3Xa+kdarPhpYe669qUgyfDFAbOqe5Z57DxZWAJida1T27cTAc+bVPsO4ECu/j0w4XCWO
 Cvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltSUp0V0DygOjKUG1rVyntURKUpZZwTHSMKbT96DuUQ=;
 b=0fynIbnrkDYBoza8KgdqZt9TTTA6Mi5e3ljfS6woGkQa/u1CESqAElWBxWuVfoDsXm
 4GtPbUBkUrLJvD9+GgYb5isjIUTemjTQNEw+5HlHHGygJDKWZV5ERAapZ/wkCpgaXQOA
 EyG9L1OHKrRbr4mMcRX80NZywShUQmwLD2D2IIOF4Av3tJAfJjj0wHYCcWA0eYOmXj0Q
 6lcCeSsyykVtt4AOuelpU/qN+jgzUFIYpROnEAqr30HZZyGHIisZaDlVM65vGFgK0rzQ
 ppdenR61e/5W0NsE5dzTt4pd8DxeQXZbPe4DuuuWjPV4PKNLys6xa40pWxyqSOdJP97U
 UgUQ==
X-Gm-Message-State: AO0yUKWVfbMmaq7BTt0RLRIP2VyMREsbl35Q6lA4Ceqqf8jnomkKdkcj
 QFNHSP0L8efjDIdIPRfM9CBUhQ==
X-Received: by 2002:a05:600c:180a:b0:3df:ef18:b0a1 with SMTP id
 n10-20020a05600c180a00b003dfef18b0a1mr4507581wmp.12.1676533622946; 
 Wed, 15 Feb 2023 23:47:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc401000000b003dc47d458cdsm841300wmi.15.2023.02.15.23.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:47:02 -0800 (PST)
Message-ID: <65c1948f-2fd8-a725-4fe6-1a6b6a996ebb@linaro.org>
Date: Thu, 16 Feb 2023 08:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 0/4] target/arm: Cache ARMVAParameters
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anders.roxell@linaro.org, qemu-arm@nongnu.org
References: <20230202075242.260793-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230202075242.260793-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-TUID: 4Rc7rhTzkeFx

Hi Richard,

On 2/2/23 08:52, Richard Henderson wrote:

> Richard Henderson (4):
>    target/arm: Flush only required tlbs for TCR_EL[12]
>    target/arm: Store tbi for both insns and data in ARMVAParameters
>    target/arm: Use FIELD for ARMVAParameters
>    target/arm: Cache ARMVAParameters

Applying: target/arm: Flush only required tlbs for TCR_EL[12]
error: patch failed: target/arm/helper.c:4151
error: target/arm/helper.c: patch does not apply
Patch failed at 0001 target/arm: Flush only required tlbs for TCR_EL[12]

What is this series base commit?
