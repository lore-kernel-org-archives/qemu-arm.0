Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2497608lfi;
        Mon, 30 Mar 2020 02:09:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuYygpOYaq4yYSNZntDUqxiEZUF19sKO+Yz7beznzTzMTzCTCe71/4qRsF741lSwvezt5Ay
X-Received: by 2002:a05:6214:70e:: with SMTP id b14mr10500660qvz.246.1585559382420;
        Mon, 30 Mar 2020 02:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585559382; cv=none;
        d=google.com; s=arc-20160816;
        b=U7gyskwvE7SW56lXWJegKUhrO8rzjXJ8A8MDJdULud8/dR+ZpTMzVyhYHd9sC2veJJ
         Kv2fhF2V7+qByuxLNWGeQFQwULGCwhEb8s7miVAJfZYecZ5Iln8lRHAOd3kUr7/iMC6m
         sAY56RjPnn5PUMcZjdVB1DgXLhV6kg0p9piZAFfH5jTYTbNcdPk18wYHqwyJHH26ALTU
         kLoU/JCOPIBH5IeteeUjwbZWCDOxWPNzyLYGXiV/NLfWcsW2mFFyqFRIGa+Iv4PGNUPA
         5ew8EbmZJy9VyVT9N5Zk7srQaG99/OWqFJJ8G6C87vJkDqsVXMcGPfXaoDpuTDrVmbSF
         I+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=o90aux+gJuYZZ35aBpKAauPQDQOQmxZUCFQGlqjLIsc=;
        b=YQJczvH5oPUA2IXt8KNJenJIrLojzTbfeoTZSHgwJB7P+TcQ2QKDzF/Fp34ObDEfL0
         9txmrdPMGmp8OF2H8+AvdebxVPcfS3Zv6+nIGm9eRyz8wvaFo2mq1LaAMdkw3Lcvh8IT
         rFW+3NA7A1TZtev2PiMEPSfobeR62B0fQY9PPMFkGa9+5m9XlztSYwMg9PHuHuVeKFP+
         O6veUr95wgqRV8wf55eFylzlJODyiV8SdZlNYf8bZXsj64WSO9iROtV4wr5nvD8szxJW
         W184/6KOLEMj2fPovlOnsKq2AfMEnAAMBTCP3yag5qjlDMaqDxhhGp8NxxMgXiagj0F0
         4XJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrLcJzsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si7821835qvx.78.2020.03.30.02.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 02:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrLcJzsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIqQP-0003Hz-TT
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 05:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <changbin.du@gmail.com>) id 1jIqQD-0003DW-Jm
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 05:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <changbin.du@gmail.com>) id 1jIqQC-0007YE-Gz
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 05:09:29 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:37410)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <changbin.du@gmail.com>)
 id 1jIqQC-0007P2-Am; Mon, 30 Mar 2020 05:09:28 -0400
Received: by mail-pj1-x1044.google.com with SMTP id o12so7058908pjs.2;
 Mon, 30 Mar 2020 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o90aux+gJuYZZ35aBpKAauPQDQOQmxZUCFQGlqjLIsc=;
 b=QrLcJzsw1dwKUcw3n2EIP8FAS5disqHLjkybsna47wFVst4lQ9Qx/j2DNFn9Rx2CuX
 NlPiX0RtPCie7oP4ZSQngoC6duOW7MtDm7aIBscxKV+ZDdW1tXnC5+JnWertMIkICY94
 BfwCLLpf7RNuZoXLbREzmdOhFljI5xTGhgfTVS/R5cWVUfyktqtzqlDjQUt1dhxmmyMi
 BrTrnXiRvrbexSXtUyC2YytjJyqq6rchuQo2HZo/87gvPuueL+OUweeyoct1MuQiVER7
 dz6C6PNE6cSZBftzbAfNdI63kiQNfz3/qcUKBSWqc8J/Pxj5mBxfoL3aBw2MiSFYKoRq
 X2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o90aux+gJuYZZ35aBpKAauPQDQOQmxZUCFQGlqjLIsc=;
 b=FCedm1/q5qtyKF1IwKaeK2KI+3iFg4lId1UlIus2CQtNewmg9tVhH0KW60bjqixlpa
 E+JMEpX5cXfdTzNMbZM4lA0/BgkcTCUvrJK13BHpVIWFNfC5In6SoOurzZmkVgIe11KV
 D+okeoaDhDigxTpl40a9QlGaMSdjAeEsZpRglXjyu1M6+k603avLswVKy9P5FdvmUyIW
 i+Zg7CxmIl01+VYVQbINjBmPSfNUs1GyUutWDUdUpK6iCQxwk2ZfVy0HNVEgOw/XGzGk
 qevhhniA0Bvi8grJsI5gbovkWxQOnxuODSW2ws6PirZotMkelkrQFdkFSwKay8ZBkYJS
 p9XA==
X-Gm-Message-State: ANhLgQ0LkHNxzDG6ojtKfWXAKE27l7+NEY61+mjeEz/4vXx1SfsPs1lp
 9Z2UgfyxFWVoMTGN0VUY2Xc=
X-Received: by 2002:a17:90a:8e84:: with SMTP id
 f4mr14347349pjo.72.1585559363826; 
 Mon, 30 Mar 2020 02:09:23 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
 by smtp.gmail.com with ESMTPSA id x11sm3791086pfp.204.2020.03.30.02.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 02:09:23 -0700 (PDT)
Date: Mon, 30 Mar 2020 17:09:17 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] target/arm: fix incorrect current EL bug in aarch32
 exception emulation
Message-ID: <20200330090917.kovajpwnb3mxbtc7@mail.google.com>
References: <20200328140232.17278-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328140232.17278-1-changbin.du@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqmkq7F5Lzek

Hi, Peter,
Could you take this fix as high priority? This bug has made qemu-system-arm
broken.

On Sat, Mar 28, 2020 at 10:02:32PM +0800, Changbin Du wrote:
> The arm_current_el() should be invoked after mode switching. Otherwise, we
> get a wrong current EL value, since current EL is also determined by
> current mode.
> 
> Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b7b6887241..163c91a1cc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9172,7 +9172,6 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>  
>      /* Change the CPU state so as to actually take the exception. */
>      switch_mode(env, new_mode);
> -    new_el = arm_current_el(env);
>  
>      /*
>       * For exceptions taken to AArch32 we must clear the SS bit in both
> @@ -9184,6 +9183,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>      env->condexec_bits = 0;
>      /* Switch to the new mode, and to the correct instruction set.  */
>      env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +
> +    /* This must be after mode switching. */
> +    new_el = arm_current_el(env);
> +
>      /* Set new mode endianness */
>      env->uncached_cpsr &= ~CPSR_E;
>      if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
> -- 
> 2.25.1
> 

-- 
Cheers,
Changbin Du
