Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5866952lfg;
        Wed, 3 Mar 2021 18:26:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyowhAInaJzOe6CI9vLr7i1/Je1WKy6mMGs78Ulherf9eB6E3WYvTM4w8Gq8zm7MtE3iy8F
X-Received: by 2002:a92:1312:: with SMTP id 18mr2083527ilt.92.1614824765961;
        Wed, 03 Mar 2021 18:26:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614824765; cv=none;
        d=google.com; s=arc-20160816;
        b=DjOoYwr9/AwsrIZFTuuy+FqnJUoYGEdeH53CbzgpEcp/8QonHb2OAadK1QJ2bX4FuK
         N45KkupIH8wiStDmp+sXNkCpm4Ng8dyWJbyKziqF6QfFAma/oYC4LPIvQsfYKNCFNQg9
         Hntx8wlip87mLGSv4xCUYkwKxHM1VEI4WjhKbfOX7SQXvSo11ZteU9P3Drro3eH+258s
         Z5MZcXWa/JzBAMP1buYQqoJyQabUVsHtY5me8A+IKIRXbjbNLpjDt2oyiIo7kbVaJXYH
         YK4zKc2cX5/K0EL0JPeEMQ0idJdb4gMRfGXPRsTKexgACrMU6xeQM+ScoaVrvQtZNtmw
         WOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XPfBpbkfMKyo4uWM+HOs5ZeOcnTnwl6JG1fNoxFLjEk=;
        b=Cv+hg5XkNgpNCgIeaVehBWsA8pdZ1sJNdIpA11KnXRTy19/gosbPJ7B2pBEysjd/E1
         UN/+MufFvYNwhbbWZzeIRsF9ReEy1axwwm1UyZDeREyinQNbEt5QyJYO9HxdpeRRHKEr
         +W+ajbMRyrABwd6fYxn9rmkIbV+Etm1uZ3Rnu/LKURM79eLE8tgzyCzp9KJHPbNT+KVY
         uISi94HcV460BARkdv6s3ZDg4CdRVheItPAPWnhvEufTgPo4VhJokbu+mmEd9dIwcwJ4
         B3rb0n/MXoBDICw/ZxJ0IH0s3WlLQ+FUu5voeZSqtF07PXBwzklPAvizWurfSry3vaVe
         1lPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDC8tfyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si23812283ilf.0.2021.03.03.18.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:26:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KDC8tfyb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHdgj-000356-85
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdgT-00034X-Ol
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:25:49 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdgR-0000qC-Qk
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:25:49 -0500
Received: by mail-pg1-x530.google.com with SMTP id l2so17907961pgb.1
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPfBpbkfMKyo4uWM+HOs5ZeOcnTnwl6JG1fNoxFLjEk=;
 b=KDC8tfybz/Rwy/psZaJ+p3L5eCjwVLqzALGryIfMWm+MQ7VrWqxHGwDb7vGE23RQxW
 ndgFyo5TToojcYWojZSOyxNwcZrPGtTXWadWEdVX3PKzjXwwRx0SDLeTYQ5YAwwHl+eh
 3FSxYC53Ciy/IbVpQ0XohyQfhhM0e4SVbG2B6fr3j1zGtQRGqRhyANkfWaEdVQAISul5
 lHi3xnnbdXdQ/cUgoLBNAcY4wKyA+HdvsC9+zA9QMv+6YDhMVahqWFtwP7iMuo/Rwb0S
 iO5F0VcFxat7RrLPfMbojoAyYTdjOB/wVqcn3/4T2d9jobCXvoevPGweTCz7iwmCz7OH
 ZAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPfBpbkfMKyo4uWM+HOs5ZeOcnTnwl6JG1fNoxFLjEk=;
 b=bbCSL7atfvJgcvOdZ4Kkoo6NET4x5+qb9Hyl7j50q1BLxHV7QaThWW5cpc0f2IRH92
 mAldtRiO/lCvW7VI9LYZZByW4OH+xOafPseIksp+KNy6hjSj9OaXJtJ7g26NxeiLO1XL
 NMefYG1qnRzthBOEv3Lvr2zQqftuxteSoWhD8Z1fmfgtEsKFTPaerZd0HgAcKYSeZpYo
 XXtoe4uGe7rcug0a+F3OzVNXdfn60OHogxLYS9QJecdvhWqRlQmGnu2YCDXrXesSFoUx
 VxavQTlJ+anROz5F+8E0w5F6anxnnr5oahZyjTRqpXfyJse7iaMC29OLohMW04JRvtNO
 LwXQ==
X-Gm-Message-State: AOAM530rIQszyWbhDuvY0xeLINvYDpQpuw4kpomz77OrYQ+rWofX+Skj
 iy9C/4e1S7Em/3mpNbvA0dlbUA==
X-Received: by 2002:a63:ce18:: with SMTP id y24mr1737522pgf.246.1614824745978; 
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k63sm27026584pfd.48.2021.03.03.18.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:25:45 -0800 (PST)
Subject: Re: [PATCH v2 23/24] docs/system/arm/mps2.rst: Document the new
 mps3-an524 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5cb7840f-e6ba-228a-a166-bc46a7500a3b@linaro.org>
Date: Wed, 3 Mar 2021 18:25:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRjCJRXFNk4I

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Add brief documentation of the new mps3-an524 board.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

