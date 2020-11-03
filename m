Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4961155lfa;
        Tue, 3 Nov 2020 08:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPsf7Bu/dK9UxniWamHioULPkcThQk4lY1P0lQP52gbGHQ2pVGkBlcfWZbbjl6koawAPd3
X-Received: by 2002:a05:6214:1431:: with SMTP id o17mr27547471qvx.43.1604422399894;
        Tue, 03 Nov 2020 08:53:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604422399; cv=none;
        d=google.com; s=arc-20160816;
        b=t5wVy4cOOA4aSV6ItsVHxgf5ripHxEOkxUy1qVnwMuzN5oSGS+vnid/FH4jypqnOcr
         VOzf7KQwWi/V3Yv4/EPwHTtEPv7uFsfLz+n6i3HwJTkV1vAqIQXGXY7WC0BvlS3IPvZq
         GK895zTPGaXv9kCaZi6GLzuIEwRL2UB9URwOGeMYhZP1jTrbZERvvyyrFK/6ahR9GBOw
         ll8D/mrE0oLNtFU5LLcPSRonrWwxJy5rPe/SEYeM4FYnrBUiLwHGk+hriSgu1b59yoC+
         DE7scDaA7QHbuvCub3MUQxkmcCpGM0CjjUu+S7e1T8Tv2sRE3e/U4KHl4R29L2mZPwVt
         LmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B589FvnXtpMWbeAhQjtZHt3WqH6PPw9vab82qCgueJk=;
        b=T77N+Ply0tbDyVuDoLEXDkxzveSF1EHkl8DjOWIGbS7P7OeEoFA4nllpdw+YxGyqUy
         3RmglxSk9Jhfk9IHK2sGFcqmwMWvF7a3W09Lq+ieKFFR4Oi9b74Yz8LjOjUSYVjt5fGA
         AubPoUOJQE3NgV0ewGbQ0YGcThObHjiyACwG4unXf6mwCCzpD81IYjO3b+kfdlFOLQI+
         DyKU5PO+kVwp+QfKCqQZOuVxRcvjWP1s/Bvsv6Ues5VpLnFjLsh+X6a4fBBgZLn++Ng2
         aJZW1ng8sBz6mN6hgfPoBI5GC/gNQs0cosfZkiTMxbvwgd58DKv2RkWi/XJnk430QCxy
         CHPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UdsHU+Hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141si6032342qki.67.2020.11.03.08.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 08:53:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UdsHU+Hc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzYd-0007CD-6z
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 11:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzYU-0007As-Ev
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:53:10 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzYR-0005Ek-Mz
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:53:08 -0500
Received: by mail-pg1-x544.google.com with SMTP id g12so14123464pgm.8
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B589FvnXtpMWbeAhQjtZHt3WqH6PPw9vab82qCgueJk=;
 b=UdsHU+Hc9d7g246hQ49u++95yhAb7xoQ72fGzdms5FMc/XEpi8aW2ThZ2X8uJEwdW0
 dMeV/SY+2nQd8ug+4nLt+BOm+xn8pRPQeRmEXfeTj6Q4Hgjx2H1oR4+K8RlvP/cWD6EK
 tRFKdhZP9qMuOg+N57T8o3qQ9ej/lv3X4qo2Z0TdEyZFczQAbVG+hKFdYxDfsmxPqu0k
 TIx4rY6Idxh/kOVYqx8oimg0QG5Qe8LsRnZnpp1figewWua2ZxZlivgPY8BKgRYjnVYb
 kHKccd2wgWoJ9QHfJUAXja3BTgFVwiqTje8RHLSsuCAdSB2xihM2u0yupX9E2PqEpRSY
 WU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B589FvnXtpMWbeAhQjtZHt3WqH6PPw9vab82qCgueJk=;
 b=ldqJVpY5rw82gcPcVfSDW1YcGAKqQu5FD9djNBmHLi7cyr9ejP3XjbvAGySxGjvn7c
 mww6OpdYSTSURT6S+MyPhAO1fo/EOScKbdlmQluajKHNSrvfIhOc5k+VR+ftplL4mOYE
 d0gLWecdtMpt7BuGKtlGlh6bpv2rcREk/J9TZ+f2hHtzyPn4ID5HF9gAtswrFurIribW
 0890/Z33oPPgv2dFapp4Q07S3F6ECqCsZriSpI4BsiBKlwyiWg5508vwskusSS3x2/0w
 gcSyYcseae25iMq2Fx85zHt3SVmqanwuO3HkcVR7TW9hRL5vu8jNpRbyQByqAujsQkFQ
 AbNw==
X-Gm-Message-State: AOAM530Zmhi6SAIzkm1LhDppiwsn5kYSohQBnRv+TmzS5CZJT04j+EaX
 58D0ZCsJNLVbeASnXdlEOD6yNw==
X-Received: by 2002:a17:90a:134b:: with SMTP id
 y11mr68719pjf.182.1604422386120; 
 Tue, 03 Nov 2020 08:53:06 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id 145sm1711396pga.11.2020.11.03.08.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 08:53:05 -0800 (PST)
Subject: Re: [PATCH 02/14] target/arm: use arm_is_el2_enabled() where
 applicable
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-2-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f7fecf2b-1aef-ae0c-66b1-2dbbd7cfde18@linaro.org>
Date: Tue, 3 Nov 2020 08:53:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102105802.39332-2-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wqc0BT3bexIz

On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Do not assume that EL2 is available in non-secure context.
> That equivalence is broken by ARMv8.4-SEL2.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h        |  4 ++--
>  target/arm/helper-a64.c |  8 +-------
>  target/arm/helper.c     | 33 +++++++++++++--------------------
>  3 files changed, 16 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
