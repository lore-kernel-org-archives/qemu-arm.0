Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp632695lfm;
        Fri, 17 Apr 2020 08:45:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypJa4fnDsti2jlQlYAOUOyDxTV0v8mzBx/AAKyUH8QKhBnJx6lMvWcslRLHAKKtRBSqkusix
X-Received: by 2002:ac8:7496:: with SMTP id v22mr3657201qtq.348.1587138314701;
        Fri, 17 Apr 2020 08:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587138314; cv=none;
        d=google.com; s=arc-20160816;
        b=qHpLWRQ77rzmZM8PAvRJfWMch23+RpZhe5aBERZ1Obp24KKgDIxDPGaZgeFP26jUab
         9ux5ga2kP3WwNes7MSy7N5bS9hXy3SmtwhFfMZUsgt91nfmOHoViT4C+i7FaWR5eYx/7
         nadBJdaIRZZYiJlRyWjV8IJSMyydIHjTl5FSH+0uR/gS13pNLnBB6P75ZNuuyKOT/oHt
         WhosjUSXBTr+vC8iHYtYxWLviKMPusyt11K/qUqj08cKs5R6WhTuOmNuncMoc08it/w8
         oauHzhVB5y9HxW00JJ6knD61yx1QJt43i6EpQSyM+PX0vQzml9oKcPQlm5sfcd60wpcC
         AUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=S7ZNopsLY+4c0MxDoi8HaUVT0NAryJP5GfzG/43hYZs=;
        b=F6zJjlAzOYAyMidOzbTQGSyscA5pVbBvBSKKHGS6zNnTWHPF3YZqww2WK07fmPDq8t
         vTfJkM1+nzlHJxipgwlNSUxv7EoKSQpMDIthxLBSQuLjlnuvP5weAsmjcFjcKIGUE22L
         /IhNi2EW1J/GBBnVbBYZhYGWTxrbSOGduptfAQouXTQMjMbsl0+D/lTOmjaoeget6pFG
         8wDK+7J9wZFvXnwCdZb38XosLwmcUgBAbqj+nuTXkOOkO5b9gIAArv/XTcHOlCwhwiu2
         +PZFbr+QHbIXYcMpGqLspmEWwn+AcES/vN03EjT41uFbHIbnddzhK7ojCuZDc6V0tUcL
         wKvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F8WT4GMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71si13560185qtb.177.2020.04.17.08.45.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 08:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F8WT4GMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPTB4-0005Px-4t
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 11:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPTAp-0005PE-9K
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 11:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPTAo-0005KH-8B
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 11:44:59 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:40111)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jPTAo-0005Ii-0W; Fri, 17 Apr 2020 11:44:58 -0400
Received: by mail-lj1-x243.google.com with SMTP id y4so2495060ljn.7;
 Fri, 17 Apr 2020 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S7ZNopsLY+4c0MxDoi8HaUVT0NAryJP5GfzG/43hYZs=;
 b=F8WT4GMAXDUuOpKFcVQlNBgWQBVq6xUc8GU5Lj3oW+fXdqzoy7tR6GBt9Kp4uu2Yl9
 ffankAD4HKNDCSuV9pumY6SbG9Dlh1nkAzosJoRBHCddk2TXMiLEANk1TDDj5vLHwZQn
 Lf64srJnFATFsReyICN3CS0CLh/Ydc4YFP5Uvz+t1Z8gA9vbtnlxkPILPqh3hvFf//Z9
 B/GdkzQQFmQZdNg4M3wJ4n1AApKa0I58CUC1W4pSAYycqpJUY469wrEQTiQDdP3Ja6bl
 yGdAX1l0elsP8dxj8YMNEiETNTBMYMZuRPEwqqFeA6Li93equud5J0ADHps7doRUKKEK
 Ku4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S7ZNopsLY+4c0MxDoi8HaUVT0NAryJP5GfzG/43hYZs=;
 b=kUwXdEUJVwqp5QIU66m3FzaBjDYxL6sk0op4/HRpWYxyvQRM/PRxxb+lpEvT41jOV/
 vztGXNCqoKo7yFo7UqxkHi+L3IMTysCjSUI8iQVIS0w830gSEs/b0Od0Tnkmn2P5kpfV
 K9ye7QQbwRJ0D9PlMC/I6/SnJaCWHxiF31DTZUpBlML4uPq2abQ5RsK6Fc09HXNoT9PG
 uFtPxTsupX6cVY2XjWOlE0iV3VKOcjPjv96ojXZLi+Z5pDtYOP68eqvy3Wgy0d8WCUfM
 9rspCk2VocBymCrq78EBZAwirruh+BkSCUN3H9cjd5mjmTOhB+b+K9dwV6vDcaTXb6VV
 xDKw==
X-Gm-Message-State: AGi0Pub3hISgANXhj8NwSbpCNrjDwwnsB6qSm3mburH4zSQU2AFLltNp
 FfEvMsoqMQwKfyEE4vNB7NY=
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr2573867ljk.14.1587138296072; 
 Fri, 17 Apr 2020 08:44:56 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y29sm16666917ljd.26.2020.04.17.08.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:44:55 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:46:06 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Ramon Fried <rfried.dev@gmail.com>
Subject: Re: [PATCH] Cadence: gem: fix wraparound in 64bit descriptors
Message-ID: <20200417154606.GC2669@toto>
References: <20200416090247.353414-1-rfried.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200416090247.353414-1-rfried.dev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cuVnQvHYX2hG

On Thu, Apr 16, 2020 at 12:02:47PM +0300, Ramon Fried wrote:
> Wraparound of TX descriptor cyclic buffer only updated
> the low 32 bits of the descriptor.
> Fix that by checking if we're working with 64bit descriptors.

Looks good to me, so with the indentation fix that Peter mentioned:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  hw/net/cadence_gem.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 51ec5a072d..b8ae21cc0d 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1238,7 +1238,14 @@ static void gem_transmit(CadenceGEMState *s)
>              /* read next descriptor */
>              if (tx_desc_get_wrap(desc)) {
>                  tx_desc_set_last(desc);
> -                packet_desc_addr = s->regs[GEM_TXQBASE];
> +
> +            if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +                packet_desc_addr = s->regs[GEM_TBQPH];
> +                packet_desc_addr <<= 32;
> +            } else {
> +                packet_desc_addr = 0;
> +            }
> +                packet_desc_addr |= s->regs[GEM_TXQBASE];
>              } else {
>                  packet_desc_addr += 4 * gem_get_desc_len(s, false);
>              }
> -- 
> 2.26.0
> 
