Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1356880ejb;
        Sun, 23 Jul 2023 08:30:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHFnA4d41tnG9jkBbftwIUk7rr+s9+4UOqylj0MEhtvSkdmSeetVjB0BwTnyBnWWvCsN4os
X-Received: by 2002:a05:620a:170e:b0:765:7a1e:a456 with SMTP id az14-20020a05620a170e00b007657a1ea456mr5850923qkb.54.1690126206010;
        Sun, 23 Jul 2023 08:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690126205; cv=none;
        d=google.com; s=arc-20160816;
        b=gIqhbU6nY43+vIKh9yOsLZXATaF56l/WzPEaC0mZOhcl3VVNWV3edXXwbkXSE8F9Re
         lNbXt9fjiDmKQ0C04fZSkYOe7tQeXV1o6VUWzYclf/9j1Vt/g58pNOQ+s3pAj2i9L35p
         g5DK6WuGAI1mvxtUCGj/l1DW8qgZrAiKeCXKl089kn8Xp++4erocah3s+pSsnKhidgKm
         Fri7O9OGuFNqYwIljO61bmndan9Vw1kaqyGkCrAVPToklR78qlJ5NmHMTIf8V3r19QXa
         Ak9xlsWo8DFQtte4NsVlyqR2+7bGaNrawSClHhn8Jp026O0WdTSUVdk8edckyqQAllMn
         zTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hMSbM4o/QNAWjg3NfP2THi27wvPf38ApXknvXZ92o34=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=hJgqOUkSOVf0hN3AKbb1jDXtgCIQ+5r/gLXuGGxkxjLKozFSDaDZR5GZ9Br4zo2v8H
         I6vdFfdIryXHqIXEDB1fNxe8M0BJu7/C22D6oO3ExTLatZXtzhNTH/4H4bjs+s8lFL3D
         91chQTY+8lvrLflk9DvuxCHTZGja3m8jEKjemxOEW/YLgBtpSp9aDI6mZd8FBtC3hjkf
         nV4yR2Jcw5v0DkFAJFbhQg0oOZ6uPhuu6J4CyXDmcwZn3Dr7PnAgRFI67GyPr3mmP/wT
         h3AYgCeQs0D9tfreyj+FH4mKKSmz6d3dPCPpOhWQaw9YaUeDArjNbDnLUndwOthtYiHE
         jMeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDrd+yrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b00767c50eea70si4395620qkp.375.2023.07.23.08.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 08:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fDrd+yrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNb1e-0003PD-7r; Sun, 23 Jul 2023 11:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNb1b-0003OT-N6
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:29:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qNb1a-0001hp-6O
 for qemu-arm@nongnu.org; Sun, 23 Jul 2023 11:29:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso2828458f8f.0
 for <qemu-arm@nongnu.org>; Sun, 23 Jul 2023 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690126172; x=1690730972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMSbM4o/QNAWjg3NfP2THi27wvPf38ApXknvXZ92o34=;
 b=fDrd+yrOH+XLKUIqVS9/uyYlUFcc3nwqx6Z43w0M33on8vPoPLszrJ0jIB9K0XmQmc
 RB4Po5SiOtndhECiZvIkhjKAWpRYipe1D4bG9kSts8Hr7KHEzkS7wVrZsibKILLhOcrI
 BgbeA8Xtn7MJVS7GhoDTPFm0L7p+MQV6yt7Q5JGJzfGJa0VQBnHPWUh+fUg+SghC9nA1
 WEgcQQiEUPv0Ofv+UjSuQAlJf2ixyMTRkki4EC88LfP8LoLX+CTx4g8dInUbiq+1LtLO
 umzsXZ1pqdGKj+4hzCtqgNtazd6j2mFyGJAp+7nPMhpFn1QmC/F5j8gcG/u0JQAQgWLW
 LLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690126172; x=1690730972;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMSbM4o/QNAWjg3NfP2THi27wvPf38ApXknvXZ92o34=;
 b=OR1p04vWJFEyAJzjL7RLp7H1pe4Gf+HDdlounUUE6VXDsIygqmxkD5yH+7t6yE7Xkb
 aLzpfMjClGreNyPdgR49aXZRkbOYNfT8KxKZtY/7mIBevjzWxVUjJvXTwrEOlJPjz1tF
 jIzcAloz7U/kDjHQ6gQLegKM4t3y4AGBH7Rsm9yhLpTnY8UEQu5reZmNwG0wpaCnw5ze
 XcCzAaCGuZb2fRuayLedTLyF6ax+qCvHGY+ReZidq0vEALvK4E+6+2c9JcEhsJu+woi7
 9XEHhkXMugRoZO3rW0wBa46O76hdVYlgemTphkytzozqDT2EwLwsGwunH7hxNN82BLIF
 opzg==
X-Gm-Message-State: ABy/qLYQQylZfNPTj53Iohzu9EETikWUuanCMYKledSw72FYtVupxbCf
 Liwu4GM7EfQkvth37301I1uf5x5vIh8NMMCGCv29XQ==
X-Received: by 2002:a5d:53c2:0:b0:315:9ec6:7401 with SMTP id
 a2-20020a5d53c2000000b003159ec67401mr9533585wrw.21.1690126172540; 
 Sun, 23 Jul 2023 08:29:32 -0700 (PDT)
Received: from [172.20.15.116]
 (179.181-106-213.static.virginmediabusiness.co.uk. [213.106.181.179])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b003144b50034esm9970006wrv.110.2023.07.23.08.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 08:29:32 -0700 (PDT)
Message-ID: <1d76f32a-a9dc-bb38-b23b-0de89f303f17@linaro.org>
Date: Sun, 23 Jul 2023 16:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/14] target/arm/ptw: Only fold in NSTable bit effects in
 Secure state
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230714154648.327466-1-peter.maydell@linaro.org>
 <20230714154648.327466-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230714154648.327466-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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
X-TUID: cpAOFVvm8rF2

On 7/14/23 16:46, Peter Maydell wrote:
> When we do a translation in Secure state, the NSTable bits in table
> descriptors may downgrade us to NonSecure; we update ptw->in_secure
> and ptw->in_space accordingly.  We guard that check correctly with a
> conditional that means it's only applied for Secure stage 1
> translations.  However, later on in get_phys_addr_lpae() we fold the
> effects of the NSTable bits into the final descriptor attributes
> bits, and there we do it unconditionally regardless of the CPU state.
> That means that in Realm state (where in_secure is false) we will set
> bit 5 in attrs, and later use it to decide to output to non-secure
> space.
> 
> We don't in fact need to do this folding in at all any more (since
> commit 2f1ff4e7b9f30c): if an NSTable bit was set then we have
> already set ptw->in_space to ARMSS_NonSecure, and in that situation
> we don't look at attrs bit 5.  The only thing we still need to deal
> with is the real NS bit in the final descriptor word, so we can just
> drop the code that ORed in the NSTable bit.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
