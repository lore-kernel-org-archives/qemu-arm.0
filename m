Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1636890lfb;
        Fri, 3 Sep 2021 13:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw91yL3K47XObxfbAzspLkyVtxlM/j/H9IEKlGVhPLPi34Td5wtWW53Q0QimmNCvJ3+4jmn
X-Received: by 2002:a05:6602:1246:: with SMTP id o6mr571500iou.173.1630700561419;
        Fri, 03 Sep 2021 13:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700561; cv=none;
        d=google.com; s=arc-20160816;
        b=ycb+6/QyLN1l2x5//G5+JOCdjR1bgeQhwxdowS0YCYSvJAxWb9rk2BWDZomUbGhUco
         MOq/AOJB/xVbAvYBdla2klkdyQpMFMtvjcSC5Ry1AC2vs43w7/8Z82SGNf0/HDRfxiI7
         +DnTQon3C+rWb54CIHNI7lBDjMVLCMAHR6IQewgSYRBKjKTF5FxWvzNZWbyBe3TPoYKg
         Lr4FMzQCqEO8n1U0/inCMKz0TXwS5ilWQTYjuvE0Rx9i/HD3Hj4J+KAX61WRV288PhZ1
         fxIg31PC+pNyjVRO7cTX99v5MR0BRXRnZdAfGKzDur+TfdPzXQmkpkHAAl1qKZWmtD/A
         USmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
        b=WYJnwW9/Gl5FgEkV5LwIkORGEpWQgE9QW5yeMlRYprYzpi4fJ1APMWtUdpRSXeOaAx
         TIGfeSMt1LEzsyTtQvwYHW5eMzmFDme7Fx3Geu0zrnc/8mS3CVmjg4N+xnLWXc5SyfQz
         Qwgcucb3Qy7ii9UltxgDsMrizB8hPLVIBicIiCvFI0hY/ixNTr4r/MrN2tdHFIVmwCQs
         f/PRABCzAwIykLkCXgif0IDZCmX+LUInMoXkbAXI7pbDWvis1NJQ+JnyhCiGMJqkUBQ/
         kD8boBqTc+maVXAQuxVWdKIYGd82O9rIFOUK9+1Wv8CZ05I8wl8v3m9ziGtGepXcRXBI
         QfbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COG3NPL3;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id h14si267554ile.129.2021.09.03.13.22.41;
        Fri, 03 Sep 2021 13:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COG3NPL3;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350362AbhICUXk (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350319AbhICUXh (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:23:37 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCC9C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:22:36 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so296908wml.3
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
        b=COG3NPL3Vxpz88wlWI3lGdCLg/LDdsQZJexfhJnrghpwFEqcukZveIdAk/fFiP0wKB
         7HNAWQIl6rmgV04BpIshszyQzk9qq0Q2NwrgljJCneyfFgOJ0xAXKUZsaU/hrF0B0/AT
         3w+VRd6HCQDmcDCjwEVjMOfRX4d+x+Lya4wftnpVkB2KXN3pr43vNkh+vseHQcZijosS
         Q3FflSz6b5FTlNEGFg6AgPTW3cZ3FSliEWoFoIHYG+zwm5ACts2RQXEeZ5OBwv2FsHiM
         zzHD5y43SWWwvU4sjxJD/8SKKcD/qNm8NbTssviVjN3cg7xbLdiiJSNeDTXPZ9eqrqkH
         KpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UnbOiyADd1ZMlxRvNb9HZP0pt1hL83FL8WVZjS8Ogcw=;
        b=iZuhDrI5ZKHsElCNjDYRlxm/IrBKvE7ZHSRAUFOy16Yyt18Ow7mBPTvw/1b+3uawSh
         mdHcDIy8nFI3iKvVATSBwMwTETZwKVW1DYqyZ1w3EPcaQFxr0Niq3HvT5cDmi7wFlvye
         0dDeanu/xE2Vax8Yftc9LJOUOKrafr4cEwNI1JS6PswbARJhOHx/W2IFjcxX9xGwswal
         lT8KXYrdSBVCLdyzgkM6g4eruJSnR6EaP7/uicQzx15LyW4c1QTEds4CNNi2kK/lM0zo
         8R2xG0oauua15sodJbGsgYGb+gg9tLQjuoRT276VfXifZA/alxRiaq39ofbASDDbSphm
         FRnA==
X-Gm-Message-State: AOAM5307tCz4OZilxHCd2f6C7SeJI7wnKMxkzeywSNZdNOqEwm2RXhok
        DqtqwOBkdO42ab3Az2u+5Sqz1jVl6QSwW3zLghI=
X-Received: by 2002:a05:600c:19ca:: with SMTP id u10mr432498wmq.178.1630700555348;
        Fri, 03 Sep 2021 13:22:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id p13sm244311wro.8.2021.09.03.13.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:22:34 -0700 (PDT)
Subject: Re: [PATCH v3 13/30] target/hppa: Restrict has_work() handler to
 sysemu and TCG
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210902161543.417092-14-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f644d61-92e9-2161-284b-0643edd4892b@linaro.org>
Date:   Fri, 3 Sep 2021 22:22:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Wmr6ozku6ney

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/hppa/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index e8edd189bfc..cf1f656218f 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
>       cpu->env.psw_n = (tb->flags & PSW_N) != 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool hppa_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
