Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp506672lfo;
        Wed, 3 Feb 2021 11:40:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze6hygZDy+sBwrgzfgs2rAU6t/NTzz77hd07GdgSk1kfRCXX97xKqa2j9hA9m97xrysyeb
X-Received: by 2002:a5b:444:: with SMTP id s4mr7039114ybp.172.1612381217816;
        Wed, 03 Feb 2021 11:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612381217; cv=none;
        d=google.com; s=arc-20160816;
        b=rSID8+reipD3ug5tPXpDF2x8+BfyAgGkC5DmJcsLlTY1Km+QxBxuqE9rBDKlGBqWUR
         N4z1vKN/KaPSUQnMjWtWK4NbW5XhKcu9aLVxOO03A/dEeOvErNdNLCRu6FfSuK7S/LDd
         xgj99wGaFjz1u8aZcQof6rLmr+wWQOlufs2cGpDkY7RcIEDVje/z2ssI/nnB03Jl6m00
         rZEQ7jzmpDcwqLqiRFrNUeWtJrGyL75pKsO2+G+TTBao8bjl3bAlu/Aug0z7D3NwU5j1
         HFiBS8hRBIODYHFQgNF0VfiD1Q+ZzvsDuAYbY7CLvTC1OIwCeF5C/pbMYuPdMzu4ftpi
         rHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Cs9h/ffY5s4ZZxlFWluRkP9BBFE0+Iz8u7LrtIefvkY=;
        b=mNPlQ6mJQomrenV/6zrmvLMwuC2LBCyvNGvwC0X27DVn2uNCMdNvsfDWCYNprysQxu
         S41wASZkO10mcvgUtuFMFqPVlSNusblmrcYSIrlj1JGuYadWKKrRqtOIfpkv3D3fjAmQ
         nG8q+LstlnFE0r16/2ZkpzYB6SXaKz5NyrgHKfHkD2C9TjRXzcUTiMsOsLX6PzcJ0TLv
         WJolmlrZ/Vx+m8FC6L3VeCWKRY/zBD4ia3d3C9d4hsihdwNgEYo4cFDbznI8iVKq5ePx
         Skcw0cf0JAXC6j3wabIMuJamap3OAsyW8d8kffBMsQ0jag7GKJSdCa6xEk23gwI+0y7n
         Gg6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fcKTRfnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si3102268ybo.42.2021.02.03.11.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:40:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fcKTRfnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7O0f-00067F-6p
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7NWQ-0005L1-At; Wed, 03 Feb 2021 14:09:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7NWN-0004lu-M9; Wed, 03 Feb 2021 14:09:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id c12so487860wrc.7;
 Wed, 03 Feb 2021 11:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cs9h/ffY5s4ZZxlFWluRkP9BBFE0+Iz8u7LrtIefvkY=;
 b=fcKTRfnZ+k6S9COR0hLsnpYHk1q0gCmns7yz45NS0viVpYQL5YnWQW3v/Cc2Lv4j9N
 hGzXSH1n5nK1bi17o5Yf5q5emHCPR6QWPDyJ1MNO9gkUTgYHR9fMK5aU8dcg0xxpKHos
 RWY178zMn+Rr20Arwy6DKCnooxk4ddmdXMPu61VBMMkUygMhqot8PmzDABQ+Mj4wIVQr
 mYQkNjGZsu1dYPgxrTyAZo0ws8kSS48mlCWRKvE6jTk7bmfjrzZ0YNRGZXMZ617IGUBr
 nHXQOEJPDtfntzpchADrUwoxqnMw4LkImXOr+3LiwAju7y3DQNRWSYFMYn5fIHnalpC5
 jQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cs9h/ffY5s4ZZxlFWluRkP9BBFE0+Iz8u7LrtIefvkY=;
 b=JMNxrNFuqjst35fKUJDGOPgmssTybXb3Nn6XneqBNQJgiGAhOnI79KD9+d0iVVSetg
 xJWvcmYjotbFerBgsS95gb1qLE704mxOzx5tBZ5CjB2vBr/jtQBbssfbO+WJXjlpba20
 3wdAYValsratABemsAQuOfFOOfQi0n6VYSH47wX9cwfJT/EdyYMkeZPAHRrmjZzLs8J5
 UnYkBcELkJbeZmiPryBCXjIG4bRCVIVAajruV1eVKsapIbFaLA3YeDEBRx59RUof7P1g
 VMvZsBOXiUTjIWaeG8cJJmKvK3yBq+xw/aH3v5MCZwKL5YfAxka/Pv9VK3ewremHpAop
 oWQw==
X-Gm-Message-State: AOAM532ZzIdyVdhCfjNLKN/fiZK6gvZ+FwwsXX00dGkdzyr54HogGlGE
 nhsX+t9EWHbQurCFILs4DMJJLrSmiIs=
X-Received: by 2002:adf:f307:: with SMTP id i7mr5092970wro.367.1612379337366; 
 Wed, 03 Feb 2021 11:08:57 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id b138sm3557914wmb.35.2021.02.03.11.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 11:08:56 -0800 (PST)
Subject: Re: [PATCH v5 03/31] exec: Use uintptr_t for guest_base
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd583fe4-46c5-a9dc-dd3f-c38504e2e498@amsat.org>
Date: Wed, 3 Feb 2021 20:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203190010.759771-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5NUpbLBe0Z4r

On 2/3/21 7:59 PM, Richard Henderson wrote:
> This is more descriptive than 'unsigned long'.
> No functional change, since these match on all linux+bsd hosts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h | 2 +-
>  bsd-user/main.c        | 4 ++--
>  linux-user/elfload.c   | 4 ++--
>  linux-user/main.c      | 4 ++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index c23c77589b..c52180e8e6 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -158,7 +158,7 @@ static inline void tswap64s(uint64_t *s)
>  /* On some host systems the guest address space is reserved on the host.
>   * This allows the guest address space to be offset to a convenient location.
>   */
> -extern unsigned long guest_base;
> +extern uintptr_t guest_base;
>  extern bool have_guest_base;
>  extern unsigned long reserved_va;
>  
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 65163e1396..c09d74d788 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -41,7 +41,7 @@
>  
>  int singlestep;
>  unsigned long mmap_min_addr;
> -unsigned long guest_base;
> +uintptr_t guest_base;
>  bool have_guest_base;
>  unsigned long reserved_va;
>  
> @@ -965,7 +965,7 @@ int main(int argc, char **argv)
>      g_free(target_environ);
>  
>      if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> -        qemu_log("guest_base  0x%lx\n", guest_base);
> +        qemu_log("guest_base  %p\n", (void *)guest_base);

Why not use PRIxPTR?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
