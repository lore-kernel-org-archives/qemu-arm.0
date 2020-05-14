Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1395889lfb;
        Thu, 14 May 2020 06:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznhLT0E3DT1KY7yS4kHzFyDYx9/687ZWdG99D1bARtHwDa7NBtxVKa8/KVQ6zRsb5iH8E5
X-Received: by 2002:aed:2b25:: with SMTP id p34mr4504117qtd.383.1589464488869;
        Thu, 14 May 2020 06:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589464488; cv=none;
        d=google.com; s=arc-20160816;
        b=II9KFp9zkI+8h0rnWPGr2RDxIwRJR5i2MhC82EraLxNWbYiQI0UTvO1xsLSMrhkJHM
         0UVQoeEzEtKKIHMv5yOEfYq6FVPK+3pFw8hyuswmIEIDS7fPQAPhs4oIsuoFNf6/rSt9
         BXN3MwGw7pOxnSyx6e2bux2itRPlXAdMSgfMdlkIAWTflFjHSlW3bkV+J6aUjRVaesWl
         INE78Mb+JiQV8GOZ8iV2L4zGsGW7LpeawW1w86AHZ2vJVpqgnbO8h4C/Rzk0qXK9NAX9
         OkyHcVU2lZ+XQR1LdjwJ9AD+luyy65+iQ27l0A/jP7owK2WuqUcP9zqef5DC4Vdd25YI
         p1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=iO3sxqa6uRbK6tbM9gvYcV5wCzXYGAcL3OcFmKTeXU8=;
        b=rJnF5s3WTWA1eOM0Je5FSe0LBcEksmOt/mlrbcLFCRw2esxIUA4TSJA/WCQKlDADBF
         hHqA9PimTJl1Gs4y/Z/pxNTTQ4zRYyidmftzqY3+0PMpwegw40rHzrZOQ/ba5QzPUBpm
         njkykCHJpbg6E9LO/7A+/vawOZ7vjt90J40khLLwiMjphI4pR7ZaE3YTR/tjaF+Xi2pV
         I2tr2F1JUHjuVd/sZ/Zx620xYYyaJFuZ8PBQtPIJFtSqgN33BOCzKmE3q4efLU73VSVt
         99BtxjH76vA1kJ8BxP4lLuGMBVf3ShNLukwVNq5z93wFXffJ483bGgvSW6fyyP3bMIn2
         e/aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L8SyS4cL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si1446289qkl.28.2020.05.14.06.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 06:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L8SyS4cL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZEK0-000560-9D
	for alex.bennee@linaro.org; Thu, 14 May 2020 09:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEJs-00054L-7e; Thu, 14 May 2020 09:54:40 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jZEJq-0008Cn-OL; Thu, 14 May 2020 09:54:39 -0400
Received: by mail-lj1-x243.google.com with SMTP id f18so3568323lja.13;
 Thu, 14 May 2020 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iO3sxqa6uRbK6tbM9gvYcV5wCzXYGAcL3OcFmKTeXU8=;
 b=L8SyS4cLvHZ32MAPdS91cLeNrTFXVTVEeGLdkGX+yFPuuVqbLsSq/n+bVw66x/m//v
 +lUDWWsT6hFoHEGmraMtnnZI9tDSKX3aSHxJdvTeRfKTUB1qkW/GHUnMW3KGMuuoMI5v
 7/pl0DLIs9YB0lKXMcyK4HtJZ5EzqLCoKGndirAVw4fDWWEU3u51+3loilhTI7s16zy/
 XsA5+87uKhfs66cQGjqNUFTKx/ehte3x1tiSLVL00N2Q/jh0ZVOIMPxBTi3Hpjd5maBX
 25pRyTRcBfp5Q2/DU1/krj0K576UUMcPy11QGp6fhwwhVBhdq1GkzB+pCDZ/BhlIJaq/
 cBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iO3sxqa6uRbK6tbM9gvYcV5wCzXYGAcL3OcFmKTeXU8=;
 b=jQIqYU0VagXp5nQHmD3rT8rjRn7rDenzEldKM4VPyrgLuK3Ysp5DcOtJOrbUFSUmwh
 bBBS7DvwNPqt6jox17oT7gBC8LOTnHTPKlFMWzAjkd5F7h2Znk/9omuscAvozgl3aJXh
 u/aHynPh2c1EHYfZISFn15ctvFcYPzX/9FmUjuSXgU/A2zvK/tqeMhzETdoRJJ5DEHzj
 sUVjbARAvczZcmV/LXZzOCJNqJvEpc70jos4F7dRb/54wh1cAthIHPIV1VQ6sF97gCM8
 XrTFaaMkZbiGQEs1cZO7CB2sNn3bM1TJHTH4s3mFT8jKTSTWLpnGND6HfNIdDvlxSNY/
 JHww==
X-Gm-Message-State: AOAM530ph48nuKE7J2PeoXNZutYkCyrbQ4u8gJ2znqrYpMAWdIFyNZ3l
 R3TJKt8snrXRsdYNJubCe50=
X-Received: by 2002:a2e:8590:: with SMTP id b16mr2994989lji.45.1589464476110; 
 Thu, 14 May 2020 06:54:36 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id i11sm1941877ljg.9.2020.05.14.06.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 06:54:35 -0700 (PDT)
Date: Thu, 14 May 2020 15:54:18 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 1/5] docs/system: Add 'Arm' to the Integrator/CP document
 title
Message-ID: <20200514135418.GW5519@toto>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151819.28444-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZJP2oBwnJoIY

On Thu, May 07, 2020 at 04:18:15PM +0100, Peter Maydell wrote:
> Add 'Arm' to the Integrator/CP document title, for consistency with
> the titling of the other documentation of Arm devboard models
> (versatile, realview).

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/integratorcp.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/integratorcp.rst b/docs/system/arm/integratorcp.rst
> index e6f050f602b..594438008e4 100644
> --- a/docs/system/arm/integratorcp.rst
> +++ b/docs/system/arm/integratorcp.rst
> @@ -1,5 +1,5 @@
> -Integrator/CP (``integratorcp``)
> -================================
> +Arm Integrator/CP (``integratorcp``)
> +====================================
>  
>  The Arm Integrator/CP board is emulated with the following devices:
>  
> -- 
> 2.20.1
> 
> 
