Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2680615lfo;
        Sun, 31 Jan 2021 06:18:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwagojCYTXiidI/XysieMDpEu1kADxSN3ABkNgUhUCSuhb/913CWuaWjm0+klaesUmycpHi
X-Received: by 2002:adf:dc88:: with SMTP id r8mr13922946wrj.401.1612102691410;
        Sun, 31 Jan 2021 06:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612102691; cv=none;
        d=google.com; s=arc-20160816;
        b=NUjcgrZ11YVx2zMNUj+B8k9ALFP6suLXV3WQvklK+wXjuPQdvhY2B9/SvdwhG3GxHX
         GhG0cv1mmyF0AJHgJ2peaiBisDAgcmIMVE0ATSAYSXBpx96OE7syTnz0FDYUBzmEysiw
         vxDcO/gMRkMhU02aHJl3eHuq589MJsq2Y2O99ZJTNftECx1dkmu07/rfnXvYP7j3iWqh
         pauxZd3Qiiu14+fs88Kt5ad2hr04a8O8/oXZbl34V6WHI5RCirqnzUJ4CIfYGdRCoiN4
         vALwM9KcYZ+Mdn4K7XbRsUy7/qsRDg4Hdr5CnPcSIT2DXSiZ0OiXwii+pUJ5pQ9cyK2n
         fv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=GBftTCfNId4U1vUnhWErrESydhe5sEsUjd6ss5Q3vIg=;
        b=XTTveQubtEQEF7j+fRTXR5yJ9XGVG3a3KosY3fCaKBIn4Le2bdR4j+RJTSj2a64ZLI
         e6QV+Kh8gNnBHgDcHQO6wWeO8p5J9lgo9tluDW4IBhWO2CbWPJ6uNsyW96M0ZzzFtO64
         RU595kGaZ9y+KGkg2GBl5glcPp8Qwo4PG4eLWhqr9JKvtXEnTnN9/N0illxm/DIYPoKe
         OHLqpnVGe2iVeRXGZowRpiHknf3vVn80tIN3pSVH6qsCvUqYblZfnQZE9yFMRo/CBKdk
         PcB3FfL8WtCoVA3mJx1IVteFFp7MFIzu4ClZ8lQUMbzYyIJ9rcsiMvBhL/xpNq8X3jHW
         aegA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id i74si13398401wri.118.2021.01.31.06.18.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jan 2021 06:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C0275ABDA;
	Sun, 31 Jan 2021 14:18:10 +0000 (UTC)
Subject: Re: [PATCH v6 01/11] sysemu/tcg: Introduce tcg_builtin() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-2-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <87d562ba-20e5-ee50-8793-59d77564f4da@suse.de>
Date: Sun, 31 Jan 2021 15:18:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oT18OgB5bB94

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> Modules are registered early with type_register_static().
> 
> We would like to call tcg_enabled() when registering QOM types,


Hi Philippe,

could this not be controlled by meson at this stage?
On X86, I register the tcg-specific types in tcg/* in modules that are only built for TCG.

Maybe tcg_builtin() is useful anyway, thinking long term at loadable modules,
but there we are interested in whether tcg code is available or not, regardless of whether it's builtin,
or needs to be loaded via a .so plugin..

maybe tcg_available()?

Ciao,

Claudio

> but tcg_enabled() returns tcg_allowed which is a runtime property
> initialized later (See commit 2f181fbd5a9 which introduced the
> MachineInitPhase in "hw/qdev-core.h" representing the different
> phases of machine initialization and commit 0427b6257e2 which
> document the initialization order).
> 
> As we are only interested if the TCG accelerator is builtin,
> regardless of being enabled, introduce the tcg_builtin() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/tcg.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a7..6ac5c2ca89d 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -13,8 +13,10 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
>  #ifdef CONFIG_TCG
>  extern bool tcg_allowed;
>  #define tcg_enabled() (tcg_allowed)
> +#define tcg_builtin() 1
>  #else
>  #define tcg_enabled() 0
> +#define tcg_builtin() 0
>  #endif
>  
>  #endif
> 
