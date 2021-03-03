Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5552494lfg;
        Wed, 3 Mar 2021 09:49:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6xuyHJ5jo1L7DUHIfh5avqpwaLv+JzS6Ss1Vnmug8MJ9vVKN+iN25XhEurNobaLK2kg/W
X-Received: by 2002:a02:9083:: with SMTP id x3mr27241137jaf.17.1614793745694;
        Wed, 03 Mar 2021 09:49:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614793745; cv=none;
        d=google.com; s=arc-20160816;
        b=TQIETRomx+H/hY2zB1+u1ZmotWutXMdekJl8oGdIrMc76Ef4BtHHQUcsp9GDPNVaG8
         lkSN6dEz5k6qIlmIzT7qbhXQRRTTKj43Gw3bR4xBXZWmOTJs1qI4Zn3At5qf/RnllDjt
         sd8XrPuEOtoq8O5PCg0q8aezQ1b0N6pK91IlSptm7RbQSoCddbXXarVce5vNv8zOmHgl
         3im1mB/PqFin/WxhTi2PHD9P5slSIogYy8P1oRlWKSmNLM8RMpD7dhNtQX6V9hBZCLZf
         BRko3ceHvvvHaU4/D78iQ88bqb8Cx1/MBxSg8uY2BSr4n0fZju3zyg4se5b6HkQkTW5I
         42gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=fTSpjDILTyJ0Rw3B8UwbNDlFjh7OVwpFX37SmRuOmOs=;
        b=B8L9Lh80fnGLcxYtxFlDWxRbHmuxmRMa5uD66FKLSf3ANbOEGgtEgbHIy9UuvjZC4y
         0teGVjv/8ZFjqhRJMoh7KuCLQU/ZtEVEHx24avwTrFPmVUOSB1RJt77NlAowYnQ4sh1e
         h64u7U1p/Qro2QbqELCQ9WOraiEi5qid8130BDg/20ikDznWh7MC+pNZ5ohkQwzDYYgn
         zkbgmgryopRc1YGgld6sRbXPCAKJNee7qa1R70zMXa6Jac2fKjgRBaIznvJ4vy9aUfix
         toJASVVzuuOCTbLS49ftFlkXbBNz/MxKUB0C+q4I/bUEJDB2UvOxMpjUdCEz3s66E5eE
         isJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=tpaAf5oH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si17712748ilu.80.2021.03.03.09.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 09:49:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=tpaAf5oH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHVcP-0002Wx-0c
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 12:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHVcG-0002VV-0L
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 12:48:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lHVcD-00075X-UU
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 12:48:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id n4so7134414wmq.3
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fTSpjDILTyJ0Rw3B8UwbNDlFjh7OVwpFX37SmRuOmOs=;
 b=tpaAf5oH6dpjOkXfBfSHh4nZcAxoZj1hn8K2vEx02J16b3TwtiWkgsjbonhR8KrGL1
 I2O+wsv82uu5RTjPpNpGZFsohVU/PdLDbj0Dr9jDpkP8TbXhubSQ/crTeIGrBuYIS6rr
 86BxFmTx7aMQIQ5ZcXwx2DXkk62Xm99pjuUale3GBomOj9GpCMcPfVm+XMLStD6PHWhZ
 rUSpaD3ZKgw9T6AUuVoVsIWbUBXJ4b0sr6ciTzXA0XmdNG4jK6Ko/DPVpmZxkk8aeCLh
 uOuWk7YQ9y7q92ZpKqlXCzDMWYb0tnkf2NG+vu/Ta+miuFyRs4NQCIjXtYyWLTcmA24S
 UlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fTSpjDILTyJ0Rw3B8UwbNDlFjh7OVwpFX37SmRuOmOs=;
 b=R1we7kz0GC8JZQQBfkjplf2rm+57gUCvoD8pQWRUOHNEUFP0AtbFlN2DxrH1SdnPDe
 j7wS9Yn7XPeRjyUPVJN+2TvWWSeo1P4KgG+w8qVICvxUpYHyWP6ALueJO/fetnfZbadj
 xFFh82xecUc30WA3FMB5KDWeNXZ3E6QGd7DU3/RtFT9bAWkL4R96sbtI+p56hAgi2Sk5
 1daTK6xOsJTCaEyumLqd2U3Yu2nxAOnIdRuwcO5wmeplGymWSxjtS00EloKV9DnVvjVu
 /q+dJGKxnCttA9PQRfWvtOW7JxrDdD81uxYOTbLii7YIfqdpH2cBDYoZ0/8YMfZnMpPw
 FUEg==
X-Gm-Message-State: AOAM531mLd0ilN2qL12qfPdRQVh+8OiAA1VuagBAsGGr0ARuPK+grU4r
 +BQoEEUkijx/1DMKm48RvWtjow==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr166631wmc.94.1614793731317;
 Wed, 03 Mar 2021 09:48:51 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id v13sm7794719wrt.45.2021.03.03.09.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:48:50 -0800 (PST)
Date: Wed, 3 Mar 2021 17:48:49 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Message-ID: <20210303174849.GF1664@vanye>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1K5VFvJrfn99

On Wed, Mar 03, 2021 at 16:16:34 +0100, Marcin Juszkiewicz wrote:
> Arm BSA (Base System Architecture) specification says:
> 
> B_PE_09: PEs must implement the FEAT_PMUv3p1 extension, and the base
> system must expose a minimum of four programmable PMU counters to the
> operating system.
> 
> B_PE_21: The base system must expose a minimum of two programmable PMU
> counters to a hypervisor.
> 
> It is then repeated in SBSA (Server Base System Architecture)
> specification in level 3 requirements:
> 
> Each PE must implement a minimum of six programmable PMU counters.
> 
> So let make QEMU provide those 6 PMU counters.
> 
> SBSA-ACS says now:
> 
>   12 : Check number of PMU counters      : Result:  PASS
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Leif Lindholm <leif@nuviainc.com>

It would be good if we could get 6.0 closer to SBSA compliance.
Would it be worth the effort to make this controllable per cpu model?

/
    Leif

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0e1a3b9421..02e25b5c22 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -38,7 +38,7 @@
>  #endif
>  
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> -#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
> +#define PMCR_NUM_COUNTERS 6 /* QEMU IMPDEF choice */
>  
>  #ifndef CONFIG_USER_ONLY
>  
> -- 
> 2.29.2
> 
