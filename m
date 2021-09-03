Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1643037lfb;
        Fri, 3 Sep 2021 13:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb3UFxnGKMjVNYgieOETALUx8RUL6TCGxBDTsuCD8Nt3nEaBrFgvMDF9lRJmdx3LN3fnf+
X-Received: by 2002:a02:cf06:: with SMTP id q6mr714188jar.89.1630701111688;
        Fri, 03 Sep 2021 13:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701111; cv=none;
        d=google.com; s=arc-20160816;
        b=D0ntGEryerRQF5mSJ0Mt6LyQrGp5+ta3GEoQj6cXc68GGbXqIVqOhviV0zDm5YXifa
         8fz7fabsDrqQG0l5uIDq0s7UgSEPZItEBrcSCAtVK1INkalAMMAgSwIePPMo9qzhfNPA
         seGAj0zUpnQwjPHAQwMQBsBj4mlMMA2n2saCpSG08JUWl3N1SueaVVVNZSZWaru3559y
         17l/xk9gIK781g/ZiUjoMeQlq3ExDRGlQf/2zGg0QAIvfIk3wA0ApsUOj8O7OyMpcLLp
         0d/ST+3wtnF1kA6hu8TEooOymy+/IgXp9FoHl34jMlmSVHuvtt2sB+Ux5lPzbWDxjecj
         VrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
        b=gEHJhpOIdhM5nLBZFoCl2ku2uveHrwe2bWAlzbOF8Shrax5U2qWdfmIOQv8ZMxFISB
         JT3+6grVsWAdWJoozXJTndApYiQo9gJ74lEHBspZtiZ+0I8FfKcuHO7aUnpP+GNCm8Iz
         lSUb/Jth4Bio8AZ2ZnP/CJsrnSydNZtgPjBkR+1zh7pbH3mov0r8xiXlFWIF287mf1LX
         b8M5DnkeConDm4W+1nU8dh+P+MulMPOUMO/xxXkf5MRSQCr2FPGFgsdU/twXz8dfZOTO
         hl0FITCSvNQK2wXO3jSVUzW5HL6xJd44FK8pwHACV8dPYKvOMM5+TsHlcISXxf9uN4LD
         gX8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHJmUzDO;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id y12si267281ilg.98.2021.09.03.13.31.51;
        Fri, 03 Sep 2021 13:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BHJmUzDO;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350672AbhICUcv (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 3 Sep 2021 16:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350564AbhICUcu (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Sep 2021 16:32:50 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72444C061575
        for <kvm@vger.kernel.org>; Fri,  3 Sep 2021 13:31:49 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g135so87793wme.5
        for <kvm@vger.kernel.org>; Fri, 03 Sep 2021 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
        b=BHJmUzDO3YywOUa9sdMc6M7Mu/GQRndqEiNv6lAlw/Rx2vJ69SftU14BI/7FyKvVj9
         /uSejEVcW3KrPYDJAJyYChPMo1COohaJL/FXfRq2f06sB0IBPSkSyKXLV8C/rFTDVb7E
         WjHNSLL5Ss9dhHvBCzA6nwVi4BQ/020CB2mCBU5FNscWowKriFlIsU05ePAcI11HBhBZ
         8EJaMt/LSnFNof7n0feMVm2QdfWC+CGhuNk0uCoYDLrGLAXIEX9D0/LRxoU1O0AF4UA4
         kzHj1+GLCmB1fy3OyPTx6ajgae2BTAFMx+usPTXWXhBd7mz+rL1Z/GcPM+49esXseeLB
         SgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IuI8V71Jj+hTTxPmLaVm9RgBYo3XervExPJzr/+wck8=;
        b=n+IIcrBQFWALOrycQzQUZrXzzJdLVmYTgtL3c5h6oyZKqIQinsJ/H9gI7VZCIocvv+
         /OwpAJTtGIWDH2dfEsFnwQl35KLOBVZH3V11WZa2DA5+3kCbhTvAsKgbimIlwdUINaO9
         CC5bYjkT4TTnuuCnqnQO2m9iuVdevydU3newaZUXSoPHc7AvZQUiINNiGYMvtq8MhHgt
         VCA6SG2HPlM6UwPP7EAFimYoDNREkE95zhuBnT4aUTKR5yrbxWqnFgmSAN91ylCTyl37
         bp0K863XHoXVFicE1U4gRcAn03xtvPPxMkUIQ6jEXkEzImMFmplECqho/lxcMPkdtHv9
         VzSw==
X-Gm-Message-State: AOAM533tzNfOAuPUjjbQ3VVy7huHx4Qhzuy01cNfhdHzqFvLEP5oyHaM
        +B2XTAGcOMe4cZzk2tsYh9tAZiQiFnL3NqF2cw8=
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr440384wmm.182.1630701108006;
        Fri, 03 Sep 2021 13:31:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net. [2.142.216.190])
        by smtp.gmail.com with ESMTPSA id 129sm315688wmz.26.2021.09.03.13.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:31:47 -0700 (PDT)
Subject: Re: [PATCH v3 19/30] target/openrisc: Restrict has_work() handler to
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
 <20210902161543.417092-20-f4bug@amsat.org>
From:   Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed2e67da-0ff5-88af-6522-1fd029511e3c@linaro.org>
Date:   Fri, 3 Sep 2021 22:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902161543.417092-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mx/1dq76xpRl

On 9/2/21 6:15 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/openrisc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 27cb04152f9..6544b549f12 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
>       cpu->env.dflag = 0;
>   }
>   
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>   static bool openrisc_cpu_has_work(CPUState *cs)

No CONFIG_TCG, otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
