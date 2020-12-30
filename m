Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12281713lfq;
        Wed, 30 Dec 2020 14:37:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlWlkydD3gReuuoXRcxf7zyf3KsglzP775Dfl6f5OtcV2IjSFgYRDOti8d6J0KR9RCU4fg
X-Received: by 2002:a25:c052:: with SMTP id c79mr74365752ybf.287.1609367847797;
        Wed, 30 Dec 2020 14:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609367847; cv=none;
        d=google.com; s=arc-20160816;
        b=m5auG2FyKojLh7WvNNfUHmhvni+jN5F8u1fUK4DbFWPu9p5qH7g0lQeBtt4kNPiyIH
         E8AhRnTvE+Pueuoh+Fs3+R6hszStGSBGrqZQuqVm0gCeblSgHFek0D+naVwCOsmyApOR
         UCNDYZxeZCpWA4vZH5I/wpfws12ot7l5ue78XXKSWa5tXTKgMxGFdJd2qYyuA5ehiIxn
         RhZeEShk62TeSWTmnjD/esR3jktlwtOEv47CYDsQp1MXhgFuoKgxBIyeDoQbxGrZ3bc2
         z53hFso3yW3AmZvZFFn0hY4tVYLxY+GZ79sKqbSpEfphJoXtaqSzVl33dQrEYZV8FhN8
         m7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gp8A0yWzZKPMbq4rW1oqmT8ZXZHB3NWiwHwY3t8Pxvs=;
        b=Y3XDdygHm4vtTuYEamRXqLueoZZ6rfOOSyILUpjttXdL3TUBc0mRl7hTJp2KEfl2NG
         mJfVPkapk0riJAs+OujLv7wanjGmY1UX6zHlz7W3CJPI79cEiR2gKSS3xkXp2sPpzEs5
         Bj0OHuhhj61NmRl0XztlYJAcYDBsJM/O3oYM85bCssJ8gF2i3cjs7aKbjRarohHNZwqu
         cTm2t/oziduJa5C38R1HDmn6VOiX6itGc1GDSA4khtlAhqDmn7c0haGd6K9luufzipg5
         8lPtkdPeRS2AtYOkB9B+MXsO0f2i74G8avf9fp/1jWqYArHzW4PZPmybr9RiJwu7uKdD
         oBcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPYUqwfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si41122961ybb.349.2020.12.30.14.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 14:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPYUqwfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kuk5v-0004BR-3w
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 17:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk5a-00049V-B0
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:37:06 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk5Y-0000fY-Ss
 for qemu-arm@nongnu.org; Wed, 30 Dec 2020 17:37:06 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p18so12086096pgm.11
 for <qemu-arm@nongnu.org>; Wed, 30 Dec 2020 14:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gp8A0yWzZKPMbq4rW1oqmT8ZXZHB3NWiwHwY3t8Pxvs=;
 b=NPYUqwfCt8BTX3uRAfHDA57+OoXzUZUZ3Vv8NvUC/S6qZiF7J/heGjte5iCemR7Ruy
 w4fBfBd2sRkdXClejlQdo+c9D5uAnni3PWt67vh4pr2+KeynjtUpu7xAA/MzSN9Ebsxx
 pZkwK8wSh+q1HDoRM+ZBTa9zKcC9EWDmAbxQuwlWtwoiOz44qNGhvUWoSphudJ2wT3fW
 ++ybXoSFw8B6L6ZyS3AZWligxkoB+DKCIIrTNoBfb6NAOElB+K1edg6y/aWBpV1EQq9E
 AReiwcz50b8vj2CoNju2huf0aUCdKFa303Q7gd3YXdgR1ZsNWxYQVouaHFY9jEQk8tl6
 JMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gp8A0yWzZKPMbq4rW1oqmT8ZXZHB3NWiwHwY3t8Pxvs=;
 b=kDG7fQKcMIiePvxFt5q/ZvMnKPf61iL9IEiXNqXo1Nu6GhiYsmv5fGP9B/spArnDcV
 QHjNew+o/J8y+Fp/941ISNVeM0fPjqoAJC6y1U+EPodmrtdTLY4DAujlCiXpx00jyUnq
 fyo/3nORKUia4YGhmk9m1iE8+J8tkzRmGfpwG+p2yxqyKVVmpJDm0mOOxyUrFo7YQwDf
 fafnoC8FDe1x/NTtlQHvMLF+l2XqVcctGjbSITA0rc6unb70Qf8MtViYuRI7lCsKWDY3
 xlYoRBug886DfW180vmj3Vie9cD/4QwTFqu7z3c+qzZWLeZi1DuqunpIAmgFKnzxA/e2
 OX2g==
X-Gm-Message-State: AOAM532lRWZJdaCdLCi9pK3z+ChsWGkD8iOfuLRJs9A4W5ZKZEczM5PE
 dL5TQUoMIuA3y26M2NxevjfZlQ==
X-Received: by 2002:aa7:8a0d:0:b029:19c:2209:7b59 with SMTP id
 m13-20020aa78a0d0000b029019c22097b59mr49755663pfa.81.1609367823714; 
 Wed, 30 Dec 2020 14:37:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 h4sm41231159pfc.185.2020.12.30.14.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:37:03 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: enable Small Translation tables in max CPU
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-3-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c1fb01f-78ea-9f87-940b-246ea236277a@linaro.org>
Date: Wed, 30 Dec 2020 14:37:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218143321.102872-3-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NPBz3uz119mx

On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
