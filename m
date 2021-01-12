Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3097657lfq;
        Mon, 11 Jan 2021 16:19:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUIficDrIFlPtY03dQEXIvwqwedw1rtXlgkzt+z5xPXpetqH/9+SYne8+gBuAW/+Mkfb+n
X-Received: by 2002:a25:4106:: with SMTP id o6mr3328861yba.60.1610410741287;
        Mon, 11 Jan 2021 16:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610410741; cv=none;
        d=google.com; s=arc-20160816;
        b=xYPyXFBJK+gev26GCxR7f+cemwQbQ7Jd0DAPEIp54WZZPM5m/kPGu+SAZpRPJxUEhB
         8bHi2sKIPsRBx3LuLcfVABN6mRVME06Ia8rdK7UX3ogubrsH+WmqWozS+othFmQbUmPv
         LPPKo9Ys4UkeOHVl/xGuO8pBVXOTTIN6oxg8co2VIDPbqXFW2elxUqMB+gb/qAhFYqFN
         Cgilm/Ir3cKvAUvMBLlnOOyWzT6Qm6tuG7PO0sOmXC4DR7DCtl9IsbvQk5UoIS43oP3B
         olRRB5UjkyxKWteZBPdq4a2yngu2i0iUZlBRtRjCtDgKjPFHXmnD85xctbi//lNhcQDq
         NQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FGz41Yi7w1wzxoCAn+MLhQyAagGUSJEur9OPosgee14=;
        b=RpjkuPmRsIzVvUv+11mAecA0BFU7Sgry9IJcPQRIaqFl+sp6vYixGumrkNjWv6cNFa
         JoazyFLZwvPMLHaCHDUrL6YDBugrSjfB3LJ20jygbUMbrTuncVH2hkmwc3pWymV5NUhf
         CotUEylqVv1bx5jL52wcFr8PW4qkpCdBS8wbC7hsFn0Bo9a0bYkS7Z5eQjLQtrz9zedI
         VvjTIS9MALqB62jz06WWwVNWYVJB4ZPYaoi1d7DMIy1JFq7oTC2U+XbPsp2crQKKDGMN
         XK7V+S1oUQsIb6DFtiimU8z3ovNn16jZxWqgVCcoYkD/IH9JgGp9S+IjIi4vOq+ROcEU
         EkAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJA9lSUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o144si1238077ybg.420.2021.01.11.16.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rJA9lSUY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7Om-0005WK-MK
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Jb-00029B-0X
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:13:40 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7JW-0005Kc-UZ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:13:38 -0500
Received: by mail-pl1-x62f.google.com with SMTP id t6so424207plq.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FGz41Yi7w1wzxoCAn+MLhQyAagGUSJEur9OPosgee14=;
 b=rJA9lSUYJGhpn7UhRnszTOviey4gGX5UrbnsL/yBCid3Uj6g35E23rTwoaNxlPk6Hs
 AuSeBNyemKBWuN7ykAofGP6eapYftUoEsVyV6g+64vg7rV8ABUuZTc67udqqu/iXcpS6
 S+mScWVURnKo9555uJPrvhXqFb1AGdRE6BZ4edfCuA4RUXrgpbVPATk6+EQIvLwSJDxm
 Q10n4rlM5wPJ4/cxwxztcwSF6+Mh0jbCO6GlCXkZ/QKJzunMfcUw/9b/51noRVXXeVnO
 nebu3m/05XnBXpZMAjjw9IJgtF67Zc3BAThYOdQ9UThSOwjy7kA56ZVeNxNHCRDJyccv
 XHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGz41Yi7w1wzxoCAn+MLhQyAagGUSJEur9OPosgee14=;
 b=IwUiVTdKmLMZZDouRqCqINHz/nKj3LfkzLqvBF1DddXeJJWUeRUQmfA/nRWy+s9rI5
 tLCyCqwkrGLwWcbhwcNSVR/cmMWtrRp5YJ/xrHNNl9P90+i6iCn5pBPBofSEk/F3lt7y
 Xdzsl8F0aK2icf1PXXlUlMVaMtRs7AuTdyoUEq39oEA4+47PDqpWkt1FHNFbHGRVj4SH
 prUjypNZxO72UlXw/d16K7wP3Dcq4lHXJ8G6kxQKoHkTG62bj0Z+yCB9RdGnFmEayLMr
 mBZ7eI+BSEBzSfGa/mLcVN7T3yFvYwgYxPxJx9xGSOOdpOstjwfRfbDjQhky7Z4Ujktg
 ugDg==
X-Gm-Message-State: AOAM533BfDFVW5xTscV25ncohY8W2qR6ZJDPZo187vYwnaBmIS409Zn2
 0eM+fw8kGYPucn1vQ3nWTtH6WcYUuOGJOA==
X-Received: by 2002:a17:90a:fe86:: with SMTP id
 co6mr589886pjb.96.1610410413039; 
 Mon, 11 Jan 2021 16:13:33 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id d6sm611060pjh.24.2021.01.11.16.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:13:32 -0800 (PST)
Subject: Re: [PATCH 16/18] target/arm: add ARMv8.4-SEL2 extension
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-16-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e32ca89-51aa-85d1-0a8f-e9aa7e037be4@linaro.org>
Date: Mon, 11 Jan 2021 14:13:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-16-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tjpaYif9oavC

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> @@ -3297,7 +3301,7 @@ typedef ARMCPU ArchCPU;
>   * We put flags which are shared between 32 and 64 bit mode at the top
>   * of the word, and flags which apply to only one mode at the bottom.
>   *
> - *  31          20    18    14          9              0
> + *  31          20    19    14          9              0
>   * +--------------+-----+-----+----------+--------------+
>   * |              |     |   TBFLAG_A32   |              |
>   * |              |     +-----+----------+  TBFLAG_AM32 |
> @@ -3346,6 +3350,7 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
>   * the same thing as the current security state of the processor!
>   */
>  FIELD(TBFLAG_A32, NS, 17, 1)
> +FIELD(TBFLAG_A32, EEL2, 18, 1)

Note that via other in-flight patch sets we have run out of bits here.  I've
rearranged them in

https://patchew.org/QEMU/20210111190113.303726-1-richard.henderson@linaro.org/

This should be nothing but a minor confict to fix up.


r~
