Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp842416lfr;
        Wed, 7 Apr 2021 14:34:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIv7sTgxUvdNjKoD1cB6Df//y4pzMLQvnETYycjGGnRjVi/2SewU3suwenXhf01Kyzeqwh
X-Received: by 2002:a05:6e02:ee3:: with SMTP id j3mr4317022ilk.215.1617831275219;
        Wed, 07 Apr 2021 14:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617831275; cv=none;
        d=google.com; s=arc-20160816;
        b=RwOr8vruedWk/jZdJvHHJtFz2PxJwPrVMgy1b688K7X5i67mBohO89sE1KR0oNaalt
         c5JWCfrM7oWyLvZLhzWJ1RpWA61i8IPswrHfW0IXu6gTzyEnOgbueW+dnGF2lxWRDoE/
         lakE1YAeGO2eppJAZS11XWQ84xJmzbBUYBOMFIjFJqrc1WfOPeDyFgc85E3kD+Ue+kqF
         1eeSjtcOR8FguDHDjv5daJv329LAvGQWZbIpc3m8tkX4Tlozs4JD+1G/RBv0wXXWxMPm
         ahWDNuk4N0GXeUXlUxXJ1NoUVT4OYzaz/zPs3+cSnS8erUSFTiMZ3CmpOQERWjK1W30H
         hbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fW7SXTGv9BEgM6iPhefPI5d/wleHrGKi1p8hfS2UOMY=;
        b=w5WijevZGvxB6A9E0p1UfbmMjfhQuxlhWbXdaryhjMyjtObUReUeV2yQlJEyUu7OJk
         5q6UoschBYCFoq6Z1smlLCNVclKL4yaXaOpIyAUmoGmN2RFsIfr08QG6RxF4c8piSdY4
         CQj7WX3okMap+CqU7zwbr00hz8DsBJP86Zs4KjVJfsC61y7qeYYUglHaG53LHLr8Ex2C
         F2zRb+7dhuejWBdYFy9Nudo3+z8hY32OWsiG9Z6U458xtUJGTUHzOTO0OF0YmxVxSuua
         7NAF+20i7YK/UcX53OqkPQXvvsayfeGH7+1AmIU3IPNXjQu7Vapo5YWAiFw9c0joAeRm
         qsDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=nngyr1mp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si20679627ilq.137.2021.04.07.14.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 14:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=nngyr1mp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUFoo-0007b9-G6
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 17:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1lUFo2-0007Ao-JS; Wed, 07 Apr 2021 17:33:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1lUFo0-0005eV-OA; Wed, 07 Apr 2021 17:33:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AC62611C9;
 Wed,  7 Apr 2021 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617831221;
 bh=H3BNz9VL4I6WB9CZkTHtz/z+G5hsGf/gzNTWDNy23Ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nngyr1mppFnrZT6rxcKuoKepRvQzhNapYJ3XXMnWI4cyxaHeHUuCHq7gIA3powyiC
 wEAusgs7Untg5K56TqGuqQTGBIgMqbbbSFhTTF7xz2uSRZMokowNy0DvVYkrhue+YS
 pQVX8iM9yBxsKNycjo4pWn8nu0616T7FMquy2B/Djpwf0qjjj+k3XD/lKyU4ad2jW3
 EGEFNeu3LynTzXEL/wMyvItHbxy8MFslosFVG7/FfkXdeo4m8TFVm0VKNSyNMDAYuS
 dAS0Mttkt5F0HYFsm0ZxObvj0xSXvzlCIVpCZ4gXt3j+NZx7OdAE5d+A3K7WFGZlU5
 62ylsVv3vcybg==
Date: Wed, 7 Apr 2021 14:33:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 12/12] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
Message-ID: <20210407213337.5zzpfs5epzdp75sj@archlinux-ax161>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-13-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406174031.64299-13-richard.henderson@linaro.org>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=nathan@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OSS3q0e5IISj

On Tue, Apr 06, 2021 at 10:40:31AM -0700, Richard Henderson wrote:
> Unfortuately, the elements of PAGE_* were not in numerical
> order and so PAGE_ANON was added to an "unused" bit.
> As an arbitrary choice, move PAGE_TARGET_{1,2} together.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
> Buglink: https://bugs.launchpad.net/bugs/1922617
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/exec/cpu-all.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index d76b0b9e02..32cfb634c6 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
>  #define PAGE_RESERVED  0x0100
>  #endif
>  /* Target-specific bits that will be used via page_get_flags().  */
> -#define PAGE_TARGET_1  0x0080
> -#define PAGE_TARGET_2  0x0200
> +#define PAGE_TARGET_1  0x0200
> +#define PAGE_TARGET_2  0x0400
>  
>  #if defined(CONFIG_USER_ONLY)
>  void page_dump(FILE *f);
> -- 
> 2.25.1
> 
> 
