Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2335533lfp;
        Fri, 14 Feb 2020 12:15:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxKYKtGeaVlifZqpuGGiAH3KXcm+pHF02Dn0itVa8Gg+vGvp3yuFHOVkDYt0Z3OIQ4lnFa
X-Received: by 2002:a05:620a:100d:: with SMTP id z13mr4342947qkj.266.1581711336874;
        Fri, 14 Feb 2020 12:15:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581711336; cv=none;
        d=google.com; s=arc-20160816;
        b=Ytj6SQ1/ZiUyYLesNcWwBFgJDp2s4MSWWcSC2H8OVoFT7Aq4PwpwJPfgAN41ElcFmL
         ZI4Z1Bije0pThehaQ0uW1eal9VOXIXadvfwlG+2Aii740POOtZMAjRSSLp6tvVa3zznu
         6f/qZFc8PEpmiYqD+U2kQDw8/WO86iVKc5x9jja2g0HX9gkFg2EErdYC6jai0p+jtGh7
         fgxuKDo3weqr/DpWhToL8QLsL4zoXwkdzc/094Wrf0iDZQrljlOwhh59mcy8+4XeWV75
         DO/GfYyUIHOzVIlabttpLQF+nKpgZ233gzYNymEPue0LT+1W1bZqHRlmVO6/bwgoPp4k
         eZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=v5A8/WwtRpqCRFFnJaduKvXrVT6yYRPQfe/LQc8wy8k=;
        b=fXMZAOcN1PqHF8Iecgnigud3ezsS6l7p56kcADAMvgKbjMXFUlaI2gvvWx0ScJLugN
         9WEAzYsSHNApJOcMUGGxVHiF+VuQzo4J6YDW77PqbLeSY2ZzUUGxKY+1f14bOIyIajlg
         eK3gjJzZsOzUBQ3Phl73SYes4B74Wxg0SyagJh5o4vCn4iy9N71NErlld+rOgSUjc7I/
         NUvBrsIFRMlNTQP4BGf3y+pDfh7KARLc0hTkVN9MyIUJjpSmD8/tOKufrGNff1E0GUuw
         121ak6UcJ9clW39M+PaDgk2xjP3pPetelqWYU68WYn8BeONP7tplNevyzneFeqq+w11k
         q7DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVd3ipzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si2207711qkg.185.2020.02.14.12.15.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:15:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVd3ipzZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hNA-0002Zb-AW
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hN1-0002XH-SJ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:15:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hN0-0006zz-Kj
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:15:27 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:32901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hN0-0006yS-By
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 15:15:26 -0500
Received: by mail-pj1-x1044.google.com with SMTP id m7so1011586pjs.0
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 12:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v5A8/WwtRpqCRFFnJaduKvXrVT6yYRPQfe/LQc8wy8k=;
 b=XVd3ipzZVb29X4+EP0HhGGSn8Wjq2wxzDFZQFULgJL7GQR8COs4rCe5bzP08wtc+Fx
 L7lcpy3PdZRRcu8M+sdd6retlginuFSbq+8xaAaQXsUHM7/F6Qm5NK4Usr7PKynKwV2H
 qo8Mg77awLuveVMfpoLb0TYem38dpMiaB9Cx/xC4i6F9MiGfrQR98z4psYRXkXfiaMWj
 AhcipoJsECSSjk1BUiXxOJiLxtsL7yMppTaSymlvLtdJtmXk5bs2LJVYcJe2Od7AY9L1
 eyqnev+b0WHYNWExw8DwLvxE2RTS2kVtgNImut4qaf20NrW8KjAbNWubxfXytJpA2ReK
 Zitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v5A8/WwtRpqCRFFnJaduKvXrVT6yYRPQfe/LQc8wy8k=;
 b=gKVxY4w2bIHVJvSJPY0OahmaGnKBa5SiTzS7fdvPtNJ0mlYti+pmGMhb5G35TXJ0Jy
 WL4BfbK7EYZ+n9HJtSWZ5RQJ7uUP5r07zyThQBbATDPR2AoWI7d80/SXCjnxXcSIB9gn
 Q+wGroz1Ej1aV1QbEgb+Nml72P8JeY23qQzM5rHnict5G45nbSESwP+K+c/N8pMHaLXD
 a9lRu0BNHl9Ev1W3u8T+HqQflkjPi3T0Y7ldCvc/oD8feCRsDyVXvgiRXef88jFPH2eW
 zmHdDSpgUS/fwlg/GVdqKWpj6rLEKj0qGIRTe4g5VtfyjCpTb5cLOsXJIqAf2B74U5Gc
 OODQ==
X-Gm-Message-State: APjAAAXfyswTZGJRcdScfbrczwl5dajm0PzClWkDDMxmtGm6UTBSr/eT
 0BHjselrLWqppj1TNcUIlvJQpg==
X-Received: by 2002:a17:902:8a83:: with SMTP id
 p3mr5210422plo.56.1581711325136; 
 Fri, 14 Feb 2020 12:15:25 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p3sm8110059pfg.184.2020.02.14.12.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:15:23 -0800 (PST)
Subject: Re: [PATCH v2 10/21] target/arm: Stop assuming DBGDIDR always exists
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4d592ed0-10c3-683b-84d8-cf17a2d491dc@linaro.org>
Date: Fri, 14 Feb 2020 12:15:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TmfrcWeNTAtO

On 2/14/20 9:51 AM, Peter Maydell wrote:
> The AArch32 DBGDIDR defines properties like the number of
> breakpoints, watchpoints and context-matching comparators.  On an
> AArch64 CPU, the register may not even exist if AArch32 is not
> supported at EL1.
> 
> Currently we hard-code use of DBGDIDR to identify the number of
> breakpoints etc; this works for all our TCG CPUs, but will break if
> we ever add an AArch64-only CPU.  We also have an assert() that the
> AArch32 and AArch64 registers match, which currently works only by
> luck for KVM because we don't populate either of these ID registers
> from the KVM vCPU and so they are both zero.
> 
> Clean this up so we have functions for finding the number
> of breakpoints, watchpoints and context comparators which look
> in the appropriate ID register.
> 
> This allows us to drop the "check that AArch64 and AArch32 agree
> on the number of breakpoints etc" asserts:
>  * we no longer look at the AArch32 versions unless that's the
>    right place to be looking
>  * it's valid to have a CPU (eg AArch64-only) where they don't match
>  * we shouldn't have been asserting the validity of ID registers
>    in a codepath used with KVM anyway
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h          |  7 +++++++
>  target/arm/internals.h    | 42 +++++++++++++++++++++++++++++++++++++++
>  target/arm/debug_helper.c |  6 +++---
>  target/arm/helper.c       | 21 +++++---------------
>  4 files changed, 57 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

