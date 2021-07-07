Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2661043lfk;
        Tue, 6 Jul 2021 18:26:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQC6hm51uqzRCfLEgsn9dIrzrrlOE/QShsUSRGAL/KBkcv2ASPwvSUS7sKkTl/Ubu13rnu
X-Received: by 2002:a05:6102:954:: with SMTP id a20mr18242206vsi.50.1625621197589;
        Tue, 06 Jul 2021 18:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625621197; cv=none;
        d=google.com; s=arc-20160816;
        b=NDVfmp70pTSrdqydxf3/hSqaGhh8bDFQfQ+kV5njlBhN+5W74hN4pKeZCRZWtfaZl7
         Lm9CTPjqOJn7u/CcDyyJe8u3ITRRGQNG1jtaRE0qNU2YCqwGob6DKHVcaHvzV2WRJ7cI
         JZ8/5ndPX7aS2qVP3DhNtqdSr8tZatjsmBaqBF8GkO6ZSoNMD9nrB/EEVS3Zjic3VPCZ
         ecYZo3UfxPRuxmRTsHxcSCDu4rRDSvR8+f5VliKXd68I4J7JB3HUt7p5ktoi2nCRrfLC
         WSHjk8HmvQmSGA40+Lh7u5ckRj2ueKVU956DksKnBFJ3B/j6IxrB3lZSW7f4qMzuf3cQ
         3ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=97dWQTK0WkbE88a9uFtTKzUR61elIjKO5cQBqs1RizU=;
        b=I2+Z1uPEyRyAVjmgtbBNmqp5T1edPClJZPsOg0K72n6aWosJyCfaq6eE2n0kIERQKe
         owyLRSrs2UUppJ/8hFKjyrOOCISXST/7zCIYmuDhL4ikz/ed8WlDFAfKVIf5KdcYrfhv
         7P5j8jRxDzuMo2mzUxqKBXVMCibKiZ4UgvPuKl9XlNGIGTmFST82/tUUrmYQAEvgfgVQ
         oCNDg2LklKLFYOVXLkNgoGf7Tligiz0CbRbqAxe98zAEISgBcOEqXrcWhnrMnqw1v2JC
         sntJuXGqqG2OQBZmXdgr8e/BT4p4WUQVngK0Usa4RAbiMmU/RNs03AbsCymH5kbThGY4
         YXxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e40eV8az;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p32si12628599uad.165.2021.07.06.18.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e40eV8az;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wKh-00038o-Fx
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wKT-00037x-9P
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:26:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wKQ-0005OV-2t
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:26:21 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a6so146579plh.11
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=97dWQTK0WkbE88a9uFtTKzUR61elIjKO5cQBqs1RizU=;
 b=e40eV8azd2K7uCpj4OLF33hiFy073hYvBKgoc4Ld9NMggoU2g6e13FRjg8s5OkodD5
 vy9QadOZyOEIxUCAIit93/Da3CHG+/VpW8R5Vw7a2t2BbpQ4wsqTB46oeA7U5zP6m8sW
 vFA9IY0Dhuu509idwwm5gy6u/ZwFzwx44vgoz65XzBKXHwXxR4VpRGwNWuuyi9qvnmPf
 RnqkR7Rm/WdhV78exsqvvOgzmLtl175B+EKJzUWJb/oea+QlXo7KUo2hGwInSq2KPusn
 LtCalL9296LMf1QKaZE5Se07I3npXhdciXKwXyD135/JkNgv/+/auJlyUKLHgjZQ+BYn
 F8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97dWQTK0WkbE88a9uFtTKzUR61elIjKO5cQBqs1RizU=;
 b=chnq12Veob4mHvlKM1rK+7byimF+XDwnSPf31VyDxQDS8qMH9le7WWOxC+yUB33irm
 i6WwlDuBHzWAszWaMkCwyoF2yDq8UvRSDfAWnFMwPmddDqd0zz033jDw3RDQPa7+M0p7
 Q1cEk1CT3GUi9zNGeKnmKu0meB9NhpGBI7kRd3e34mms8OWFkI0HXVeh9stpQOYt9lZL
 GTt7e0NPAggTzKnOBzpizlzimZ2v/zInabizGD7yI3iqbjYYDOTrLT0W/evL3o+6Uk0O
 rSzqcgGQIPNjz9TLT/7qXgJxPVTjR71fKhXC88Tc5bKNQJanpm8vV6SHY/wz9YRt4tqo
 NEyw==
X-Gm-Message-State: AOAM531imv4EDKwEBR3R04pnQH3XiE9CQpU67/hw05FSNGsywA1tM613
 SQc2zxBZeuQZD1+X1P9xtXkfUA==
X-Received: by 2002:a17:90a:5401:: with SMTP id
 z1mr22642502pjh.7.1625621176824; 
 Tue, 06 Jul 2021 18:26:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m9sm17484569pfk.20.2021.07.06.18.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:26:16 -0700 (PDT)
Subject: Re: [PATCH 04/11] hw/gpio/pl061: Add tracepoints for register read
 and write
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <744821fd-9780-fc60-81e4-d4d751b3e490@linaro.org>
Date: Tue, 6 Jul 2021 18:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4El4SoFTU9K4

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Add tracepoints for reads and writes to the PL061 registers. This requires
> restructuring pl061_read() to only return after the tracepoint, rather
> than having lots of early-returns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
>   hw/gpio/trace-events |  2 ++
>   2 files changed, 50 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
