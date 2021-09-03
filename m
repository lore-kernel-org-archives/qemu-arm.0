Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1638085lfb;
        Fri, 3 Sep 2021 13:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCtov3GBZIKoJQPEKeUz16oyjsBUqjsuaIeL+le7HhQWLHDOd8KbXWylxVoYV9PLDLhy4F
X-Received: by 2002:a5d:974f:: with SMTP id c15mr584973ioo.190.1630700675293;
        Fri, 03 Sep 2021 13:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630700675; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3XRfUR0q+FY2FRJYbnCtd98X2ImCNsjnloTfnZ8mP5XS0wcFfZP+viWN+q1yaeHmj
         IfCvIADqEv0E7Lt+WGPeBuqGR6wekqbodOq6suDrEecJZHc1ROZJdLoZGHYTQVcUtt/O
         1CA5bYVMqxvGJsOGBN68ZQu8FtLzVVOxQxVwzbDFbcLH/SANXrAic/pDUiLeni2EpcFb
         zyVIcOmjyPZBTrje6e8B2FmHSa3+wCboIh4bCxVcFsBIioCa7UKr5L5V8yb0Rqa//6z0
         obzohVcuEuLMl3se0Ju/1PYs8KaK0I0VoD1Z1OLZuvvE1kuit6nuS20oo2WX9B8UpRpr
         u93Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
        b=Gn/JZP+t98fmZtjrIWf/mry3eZ1SqqGry4cz48pGw7GYVnibaR+y57JedUYTH6Rhtg
         eM5QIA5JhoIROFXN/8FlbZaVlcyRiBJ9F3UsHMkrs38dpKovu53v66pouVZ+4JWYXJF2
         uYVwht517oRGxG0aTXT9V0TfnGxsHMStXcTuGXnna3xb5H8620BnK+/KEhlsjSVeR2mb
         klxHAretW9+LzxGtVLVCVtf7SOZFBUPK2Tu1s1e72P5NkaZWckoX66yDsCChdOz3jPd9
         4a/GyqLMY+X7/0RA7O7FfDdWwwGWjyE80moDHp/GLcoJ8fysfa5lU/cb9HBARjqbAMn/
         /fOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzZJ3Sts;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id c30si347119jaf.110.2021.09.03.13.24.34;
        Fri, 03 Sep 2021 13:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vzZJ3Sts;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350361AbhICUZe (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234379AbhICUZd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:25:33 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81596C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:24:32 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t15so330635wrg.7
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
        b=vzZJ3StsffaZE2XWFvvqf2xJqEy05bbfJRhtDaeaWq7QuAU52n/TB/ULQ8WeVNs54M
         UGk4VZfAumjAQ6YHZqLXwehiRMweE/3kJmX4Exi6/vcM0AbVsP9DyQ+kTZSyXOjSTQXE
         yltj+XKDtFQcrEjs98IbsnvIXwqtEH/TjR8pwEw8KEUkc8NYtmXPjP513FwOCCGUt9wr
         aStX5sxRH5/5TVq63meFggk5pkY4HjNNTzztQF0zM0dnsU7O4t2Ixsf6lRKnmGoibQxd
         a4FPgOEbY/12bxwaYsGxLbjms3hn+0Bpm8n2QXKQeM0XRr72OBCjWTcA7StsxwdGykZR
         MZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MUAOnWb7Jr2o1NB8tpwx1E/Lm7U1xeRRhxPNvAXjZbg=;
        b=JmtRfrYI81WFjdEdmFfXvgQygA3jPfq+XZ+sG1rFcG9Ir9b5fmuo0ieif4z+EXFP0P
         UsvcXoftQMU7NivQzPlNW40FkWhDxEa+ZyIVsFab1vc1KjlGpcXmq9S4vJVGeQ+7YA+4
         S5rsvG0pfZT+rJV2lPBUd9h5aRnbVtxyg4UIOY/fQrZohfK5/TJs6DkQ0HrkaP+7kE5f
         FZAEv9sYFTuAlFLb9WDh29G6/bBo06284nZCk72dlByrNpWMfpD5CcCW6CBG+kqRrsfk
         eOXa6UuXL0KOjfP27R46k1S3PGb03u6OAvc1PuLXrjz+oR5CE6bjba33uSeTMQspX6Ts
         fQOA==
X-Gm-Message-State: AOAM532DZNTgsNlLMUDR+87J3iqLfMuoowtXH0hce4gAwXwx/74oVQxK
        /MjVkx7wvIEjft1jrT3ciAaEggb4JoynsF6O/R8=
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr799125wrk.235.1630700671118;
        Fri, 03 Sep 2021 13:24:31 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id l15sm315117wms.38.2021.09.03.13.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:24:30 -0700 (PDT)
Subject: Re: [PATCH v3 15/30] target/m68k: Restrict has_work() handler to
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
 <20210902161543.417092-16-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ac98aaa-ca63-0db6-87ce-a77193044dd1@linaro.org>
Date:   Fri, 3 Sep 2021 22:24:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: OfyH4og38+5f

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/m68k/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 66d22d11895..94b35cb4a50 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.pc = value;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool m68k_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
