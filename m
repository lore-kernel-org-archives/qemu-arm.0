Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp621978eje;
        Tue, 13 Feb 2024 23:38:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUamCdFNWr5/ZRCvLdKrDYAZ0xTulW1qzR8YfYOdPO7/OLR4bhpJSa665m/O2L5wQ4JLjpsG3eIrE4XOMDxdkyE2avSxUJx
X-Google-Smtp-Source: AGHT+IEzoBHdelRmjxpWUMGrsXBWT326CbE8U9CYVo9RRmRb7opNz1xm+9po8awEMLsUIbO5mVAX
X-Received: by 2002:a05:6808:e88:b0:3c0:30af:16cd with SMTP id k8-20020a0568080e8800b003c030af16cdmr1887848oil.50.1707896285344;
        Tue, 13 Feb 2024 23:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707896285; cv=none;
        d=google.com; s=arc-20160816;
        b=PM2bKA3waSnP07RtBz18l75+GE4v5i2hLpx+9QFTK284Yvs1CpXTV5X0pcr4lKSVUC
         35Rd7yj/EdQbN7UQkX7c4tXVailnu/glBrZ4hufBxlfxzieSwqU5AyGcXuWK9EfLBnqJ
         NChqVD6Zo+aqXhxsJMWrtgkWUpXTdAS/VwoI37vN0e+N288zKwdQKacDm+LDQ4iR7cq7
         6LzqeBcKniM2UedDdXuyNou9IxKGvaPAmRYDXhNch9eGJeAxfkcJDFvd3q9/kLbvO+Gk
         vz61E+tKlXVKTCzGt4ZgVqt01VPwWfc7Hn+HpMaodRSCHoynqxb38C7PhNEO7zPP8UGb
         CQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pNNk1WpHEZtIFiIVRsIe+/+qoaz0uoLcc5dRK+maGMY=;
        fh=vTJOQI7vmVVcBnuuwmpu42pbA7fD/cBQj5bbYU/v/H8=;
        b=AufX/SICWHgdaphiEFeYLgxfwymHeYC7t4uT7A875Qz7D7iMSezdepm0nXo9nujcSe
         AymaHQdU4i35oOSp3KW/NlqUmMziNOHZwrn0JbIQeitjf9lPs+TrPx7L68BucP4jQymP
         VpOKhCoU4QLfSKKX+Y+uWiU2sBzVIib9f95Hm/oa0mCaaungQmnEiAz3fKaDlZk0/d/w
         MlOAy+zHxLXDSjZG07WUKDVDT7sVsAyamPDr+EMsVdpa1hZPZVZxOLUD+JcxZZ5Mzid1
         nGgCcOZHtLcI3B+G/x4p7rjnvVES+KpYIDKkZHL5RAgLN2XCpUbHFoYZuAnJKHv4dVSP
         6LDw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjIBWPLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVa1KWnxowLmruJgKUx4nRbk9fTU7JT7KUmctovfuZGhytCOxnPaRD0+ffNoUnfod8NbsV3fJ+Q8gzoAK6Pa5e7DoilxVZJ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020ae9e114000000b0078538825194si10237484qkm.421.2024.02.13.23.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 23:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YjIBWPLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ra9py-0005kD-6K; Wed, 14 Feb 2024 02:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ra9pv-0005jT-8o
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 02:37:43 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ra9pt-0006RI-I6
 for qemu-arm@nongnu.org; Wed, 14 Feb 2024 02:37:43 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5600c43caddso6188294a12.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 23:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707896259; x=1708501059; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pNNk1WpHEZtIFiIVRsIe+/+qoaz0uoLcc5dRK+maGMY=;
 b=YjIBWPLvRrN19JQAcaApqNGdF4Z3C3RM5E8pd8dGpVktvJ6XLU9cWA8VQ9tf/5GsZS
 Z6RSKrcLxvR3px5LImM2xf+GsciKhM6FpkOQn335xwO1fE2rAVxVA51pwLnOswS/sMIq
 +n4yj7UF2C2Xektz+YRjJJ1E8Xqdm5eE8jiFImZ0kiUatMVZhxqjv3UY5+tCI83rx42H
 ieMSICCxziPgP0SDOhI+yXG7i0/hQFcQy7y0xhOHeQmQ+Uj85jqVRxt/jTqrzE2IxQBG
 H8ImznmZiYSYBYs3+ay0ZWYDGv+rLHEomoPlZThAtO0pvNMKjJd+qSCz66l2hkT18GWq
 diKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707896259; x=1708501059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNNk1WpHEZtIFiIVRsIe+/+qoaz0uoLcc5dRK+maGMY=;
 b=MPz7Bs5AqHzrAjN4Dhqy+m8CwkBSInr8kYRp5aP/hhq99LfB1uNNu8AJnma8eJbxe3
 Oao+A+H2uA9WdMatAH7Yfv1C0fmb3d6t0ym87h3az7ofJEXPlknC4BPivn92qHGsZVSs
 PX8a4UnFl2v8DQVrzDV+ikGtwbHsb6iYNNxOhAzzzAgGDPt+aQh1G/oPX/TrNIPfl8Mx
 xev972rqje1njJqSzX6uqgetl2pH5S9Ze8CTbKze6Tk4992IBthhS888t0mUVVEhpshU
 vmMAbepY/jUSry4WSlkfba5n3MDCbnO9GjOVye5y8tD33OEFZG9u6zL+zRk7pwngrxCt
 bGsw==
X-Gm-Message-State: AOJu0YzxKvnmJ0a8vAJfPt3+Km5uaHtyH+RET3DFKKBq+r73Mrd6iPdR
 00pHhZ+SV7l3NLi/pTaP3lgcPiramCpV5VCtsYZwO7wWceNlu9e5yYYks8LVOsQ=
X-Received: by 2002:a05:6402:88c:b0:560:d9d5:7b0f with SMTP id
 e12-20020a056402088c00b00560d9d57b0fmr1323485edy.22.1707896259633; 
 Tue, 13 Feb 2024 23:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXlM5GhXFJOcu4Vk/Hd8Bn35JYR7un3bpLjZSnskAX43a97OfKrtF92xmDfcG+O1YmaDIaxQgCTMMNLIdgzN9g96M+HfdwvKx1ilWflAcnoR2+K+t7oSeEmWpzC6pcO/MBLLpMCyrJQfpCSGDeS0/vZ41GTJ4se8PI=
Received: from [192.168.69.100] (mau49-h01-176-184-41-88.dsl.sta.abo.bbox.fr.
 [176.184.41.88]) by smtp.gmail.com with ESMTPSA id
 en14-20020a056402528e00b0055fef53460bsm4438414edb.0.2024.02.13.23.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 23:37:39 -0800 (PST)
Message-ID: <1003f634-f13d-4a9e-af7a-34edc26e22a4@linaro.org>
Date: Wed, 14 Feb 2024 08:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: qcNXTuv6824N

On 12/2/24 13:32, Peter Maydell wrote:

> So I would like to explore whether we can deprecate-and-drop
> some or all of them. This would let us delete the code entirely
> rather than spending a long time trying to bring it up to scratch
> for a probably very small to nonexistent userbase. The aim of this
> email is to see if anybody is still using any of these and would be
> upset if they went away. Reports of "I tried to use this machine
> type and it's just broken" are also interesting as they would
> strongly suggest that the machine has no real users and can be
> removed.
> 
> The machines I have in mind are:
> 
> PXA2xx machines:

> connex               Gumstix Connex (PXA255)
> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)

I can still run U-boot on these, but Gumstix webs are
slowly disappearing with the prebuilt images there were
sharing. Their wiki is also dead. I'm happy to use a stable
release for my pflash experiments.

> OMAP2 machines:
> 
> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)

For me these are broken since 2020 (commit 7998beb9c2 "arm/nseries:
use memdev for RAM"), this was discussed in
https://lore.kernel.org/qemu-devel/f2f276a9-a6ad-a2f8-2fbc-f1aca5423f79@amsat.org/
but there was no clear consensus so I gave up testing them.
