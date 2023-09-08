Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp654398ejb;
        Fri, 8 Sep 2023 12:53:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2hlQXuBQrFy7IPzdJ91iSIUg2CuHiAWlvS7Kjx0aMoutxrtHF3eIT4Ehzp7PoGLbkWoBA
X-Received: by 2002:ac8:5849:0:b0:412:f12:2398 with SMTP id h9-20020ac85849000000b004120f122398mr4484868qth.31.1694202817896;
        Fri, 08 Sep 2023 12:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694202817; cv=none;
        d=google.com; s=arc-20160816;
        b=qd4639n9UrLVFH3QXtlRsunCxrshEMWNS9mpmZ6wEjRy3m6U9gFibahrOvv7zua8FD
         66lUNKI0ICF1By5HAonkrmlg0KoSm25FxPjPzfwT+eE/QwFrswQI4OOEE6b27Ufv56ZX
         j/1r5sBXIpnumuGWKMMHTCAoJBzH3aZyBpKzlLK+VypoyDxiL60Ko4tDJJld+TfADhHS
         B6LnWivAK0ERYurUwq3RiKtU2pIiT7kW3lO2Thk6vTV1tnpG0GlOUInACQm+CQ/ERY0p
         DKjhsIQmB7t23DwxOKHzToOKbNOW4g3sg6Y+Mx2mKDXK9oSYuIDEtNN1aEce9m86laib
         R/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6JqJRk2/gSMGWvfvRuCmQwxhY37zdCiRPduWW9ZXVU4=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=pv7yDG43kl6iUguk2fnxbMzQgfZ/MGKWiFUi0CMh0H1bO2PcDSlGTkhauVkTXbcr9F
         jOWlFV/+vXq1rkRfMDdac/w6xi/IdQonpaHrb9MErllBzCxh+YAdIytXqdM1675MbEeP
         TDYxAaxp2b0WvWpW3pQdLkAZmfiTWFzmO3ioLRVTDIgP2TlqnrXz12vvk0j8zhwc9/Ji
         hs9pxYkXaJPKdH74o6qKM679TQXDtikCt49v4Rs+rcJl719Ea2dEe/wpC2vzkp4s7BHE
         6jAHHSUINTdd7r6gokIEJnA1U/in+5nybj6+NONLaxBOFI3Iu/bRJk4lAK1pv1g5fIem
         8sBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z88IQJmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020ac85f8b000000b00403b3e135f6si1598048qta.785.2023.09.08.12.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 12:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z88IQJmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qehXc-00007P-V1; Fri, 08 Sep 2023 15:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qehXb-000074-KS
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 15:53:19 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qehXZ-0000LH-9J
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 15:53:19 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bd9b4f8e0eso18521265ad.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 12:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694202795; x=1694807595; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6JqJRk2/gSMGWvfvRuCmQwxhY37zdCiRPduWW9ZXVU4=;
 b=Z88IQJmFfpCY7paexd5t9NZ2Wh3UmD0kngXdK19RNa1NM6cYW7j7uhsvotsjDhSdal
 5l8qUvvKZfTyr5FVfxrAjB8pma22bW7yHcZcTy+NB+fGKtjjZMOgUPCqplcihCSOjmi1
 WQejNuEyOuoi1dnmL9K7XOVhCSL1cCVEeGnBcPyienw0+cmnmeAy822wEkNW1dCrJ2Kd
 2kGI7CynUibwFtGyrsYjpltNfmsOubwu4LeIpv9ge5oUgM8T4a7LkPXEhkRlemAez7/e
 b6h8dnk1Tm7GzcjZoqrS3zletzgtoPaz5rQo/A2CegBcv/EneRrIYdIDWCM2NUOqJJun
 LJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694202795; x=1694807595;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6JqJRk2/gSMGWvfvRuCmQwxhY37zdCiRPduWW9ZXVU4=;
 b=trK2LGigsQkmhu7mxkBY73f2lsD9nRS7Kfrr/FnOW4eWs4gykP1AwRUfDEp1la8yDY
 KVHfIkWusyywJDM3h07f3SomF1xwnAI/bHZ6inUXVF+n5UU/vnNua+I/M2/bPht6jh0N
 iWjDrHDqZVOa5EFNavJ4uf/CB+rZ98sJHdlFFGhB9YxfqsLLiiDoFmM67j/v504yjyEH
 ptk0L/kmsw6k1BC8x+8hFpRdrFbKyrJD2octGUxxYjq7vst9Ojd4u/Et3czOD4+QuSN/
 zPNpcY0u2TnX0nZh7Mbr/abBdUyiw5gM41PePhm42ifsnIfAe79uolkeXpw56ag8gQKB
 JGmA==
X-Gm-Message-State: AOJu0YyH8zA7KZrL4rybK5WsgljA5GdgLFzqgL2HBJ8kpkO+m8BmfNJY
 c157lV5Wvf5rk51tdaMpEu7R1g==
X-Received: by 2002:a17:902:9f98:b0:1bd:ca21:c83 with SMTP id
 g24-20020a1709029f9800b001bdca210c83mr2967237plq.68.1694202795069; 
 Fri, 08 Sep 2023 12:53:15 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902a5cb00b001bdd68b3f52sm1929218plq.302.2023.09.08.12.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 12:53:14 -0700 (PDT)
Message-ID: <efa7d7e7-1a64-45b3-d76e-1ce1508a3be4@linaro.org>
Date: Fri, 8 Sep 2023 12:53:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 02/14] target/arm: Don't skip MTE checks for LDRT/STRT at
 EL0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pf/UNG/5tcoZ

On 9/7/23 09:03, Peter Maydell wrote:
> The LDRT/STRT "unprivileged load/store" instructions behave like
> normal ones if executed at EL0. We handle this correctly for
> the load/store semantics, but get the MTE checking wrong.
> 
> We always look at s->mte_active[is_unpriv] to see whether we should
> be doing MTE checks, but in hflags.c when we set the TB flags that
> will be used to fill the mte_active[] array we only set the
> MTE0_ACTIVE bit if UNPRIV is true (i.e.  we are not at EL0).
> 
> This means that a LDRT at EL0 will see s->mte_active[1] as 0,
> and will not do MTE checks even when MTE is enabled.
> 
> To avoid the translate-time code having to do an explicit check on
> s->unpriv to see if it is OK to index into the mte_active[] array,
> duplicate MTE_ACTIVE into MTE0_ACTIVE when UNPRIV is false.
> 
> (This isn't a very serious bug because generally nobody executes
> LDRT/STRT at EL0, because they have no use there.)
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/hflags.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
