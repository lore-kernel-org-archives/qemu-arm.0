Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2305630lfc;
        Thu, 11 Feb 2021 06:21:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuD0lk/QwmZuC8x7ZHRIlkZdB65iTz7Sw/LwrlBQ2fRJKbTUQ8XXtFLrFy8X69qZHlBXOX
X-Received: by 2002:a25:58c4:: with SMTP id m187mr11172568ybb.300.1613053312742;
        Thu, 11 Feb 2021 06:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053312; cv=none;
        d=google.com; s=arc-20160816;
        b=NZzT+DwEgEacxKYRZU/mx7wf3eOPEGeE1wbGybdTDnnS6Ylr3ZASI8nKonorjbqLT+
         QoAs61LT0gUBF47MJPuGC39+GPeqa5qr4RruEGvankSL9gGzww/t0k9a8rGOBVEUjfYW
         5eXwm43LkTja87QL9MMZaJwIECK64zSHk85bUF0b5wOnVASeRLpsj7QNMzOwd3b6g/Xi
         VZCEkDU3Jer7YeQVWuF1ejgRB3ukEZVhcbJSmLF2Oxnd4QiJmRCCaXDmh/ABKFVFMhd0
         DmFUge+6EvxcrTXo0LK6fDTEwbOHy5zGC5/b9qjGl27yAkab/yeRmTZ7V1gzSD7IJePv
         X1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=29ocy0CHrcUlYFE4fjk2O6DQXg3oSmFtyDv3hmlanSg=;
        b=ahsJhCmiqgqkVc8d3YZG1dRVgpHpcwwdG5AreEdE4Umd69LfQrsXQqHbPQsOW74SUf
         /gvnqjK79xsJQBfjhmG7fFBFjRQXNvRqXEAxAAJiSXzPXCbp/zPtNyYhwT52qYwSsx+y
         O8HjSqz+VfxPGaA2kAwr225LUtIWXxaYLISsmtvn2dkvI7nwQSSA0E1RO2zrVYrRralK
         Yig8hLmUlBnwWvOngOdyObM2Cf78fHP5KDCWYNzPSiTjdoXV7CbLzCYZo/iVQ98h5UEo
         tzjKBZJNGaUR3TJZxUfS406OH0K2gelNsKRlEiFHpcbg8iC+IcDTVaGXMMjqWAVwwpoT
         JGYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=YwVzJEtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si5773674ybt.353.2021.02.11.06.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:21:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=YwVzJEtf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACqt-000604-MI
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lACmD-0008Du-VR
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:17:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lACm7-0007pb-W5
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:17:01 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v1so746254wrd.6
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 06:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=29ocy0CHrcUlYFE4fjk2O6DQXg3oSmFtyDv3hmlanSg=;
 b=YwVzJEtfDgWQYz+mKrGJB8U8OeniMyeccOVBymr+aJfLEZxh4KXFpJDJ1o8JOH77JI
 VO+DEHsiPm7gxnuMGLxg3HPdWrI7kdh590h5IxePab2kxxKBARNBKLl0CSZbRA/dsAJS
 MJVpXptAPbB19k0/0wNLRosx6NUDlMqMBy13QSIEcijbrfczavQmsDuTDUnSQPjTSqD3
 evyLbom9vHIE4Snw7wcP7piVCrtEElMpMpRFXwRE8gsQgFEqT9LYYD9eYj6QpT7MxB6n
 v3w9f3wNyonSEUVaFW5m7pjOwDsJPHWZZs22VufuQKNX4x6QbWVR9l+7c+RT8rqOb2BK
 il9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=29ocy0CHrcUlYFE4fjk2O6DQXg3oSmFtyDv3hmlanSg=;
 b=Bv/q/BXM0kGiwTRcS0vrH597UiTp33DX9DPNn8OLk2UoSSSsojKTDoEVFtrLrbu9JP
 Fd/NKjZdDjGFD1XjWdjgYrQFFnrEjSQpd8pI7hBSXOcruEyEeyjJsFzIxNzXkHwV4FbI
 oAsvUlnfkClXo4Twujv/80wpWJoZS6UrEOOZDZBJMtDCK633uCVGJiES+2LsycanTtcI
 t6KmXqz/xjT7hHhex8/vOitbkCiNreyCuW75+GhONzXhCSX74cEaGrcbyfJ0fS01ts/p
 7Hwt8FXkl2SknR6YXCglDkZv2UP0ebD/D6R2L7f4sQ5Rb5o98JOPzGY1Iqut0btPv0Sz
 EnHg==
X-Gm-Message-State: AOAM532HXckN4zKqvBOewiuasb4JZipAZX+wFrZSsP6GjKqBC/sBiJRM
 gVlBiYocrX1PSFQGxD52pVfedw==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr1021651wru.384.1613053014691; 
 Thu, 11 Feb 2021 06:16:54 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id y63sm10295495wmd.21.2021.02.11.06.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:16:54 -0800 (PST)
Date: Thu, 11 Feb 2021 14:16:52 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH 1/2] sbsa-ref: remove cortex-a53 from list of supported
 cpus
Message-ID: <20210211141652.GA1664@vanye>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?utf-8?B?UmFkb3PFgmF3?= Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nIGKerfXeKxx

On Thu, Feb 11, 2021 at 13:36:37 +0100, Marcin Juszkiewicz wrote:
> Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
> above this limit.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Acked-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
> index 9f70735153..276243d122 100644
> --- hw/arm/sbsa-ref.c
> +++ hw/arm/sbsa-ref.c
> @@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
>  };
>  
>  static const char * const valid_cpus[] = {
> -    ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
>  };
> -- 
> 2.29.2
> 
