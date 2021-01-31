Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2681566lfo;
        Sun, 31 Jan 2021 06:19:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2ZAF9kJn0lXnRva3drixKRwq/pXNjl4k+JRtdaWejRY8Kw4o1ucq7Ur5R//6qS56NRxZ/
X-Received: by 2002:a1c:6289:: with SMTP id w131mr3132139wmb.0.1612102784793;
        Sun, 31 Jan 2021 06:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612102784; cv=none;
        d=google.com; s=arc-20160816;
        b=VKu6hB6xlRBoUjenHrur/76tqsQcMG6HN7FlM6IdAYfCvef8RzR5dBzI37jM9su5QC
         pwiF8xVHkjiNTYE7G04ea3ln0ZK8ZY48gcTNfWg1EGAxuXX3BiMgb8jA+3AKNOSW1UQK
         NSrDfDQAZoxdruYP7au1vLHX/QCV52Rt+5UKcKF6tK8KEXAsTVjjH6OwjMKw93D5UWAP
         IEamiGabRbiL8Ua7aQ6eQJElPv/uLmnMK05IxwHrHW1I5jSz1DoBrKEQftZR+tsUwI6k
         WTxHVXMCyvKGQQAaeRhdir6d5d3IVOSUd9vT+o3GzqwNO0OxwLk1vn8/2OeUPXQKZmDc
         y1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nQH2fuA2kW0iJ0U/1pDeTRFBzVcbt4M9N8z1pxZbZ6k=;
        b=jDaBL3qlnFmXBQ5RijehsWCI302dSuzZ9+Q65HM1DZg5a7xhN6A8YH/SnhF1oE0iEe
         NYy6EP/nL6q1J0dihQ0wGX7lz1o+Sjru4TGswEMi/X2d8lmuE6uKDhinrgCV0Xqqyutf
         ffZl4DO3ylmQHI5zLBl/SvFjCXh6vHugqZFbEZ8njt+wzsos4/gaj0NTnGElwbMb1ZEi
         IeUWfUqizDk1EUl8h+ef2fNTRxncak46tuYIwCkdjA/5XMASHFaBwxd7210LVazp8hxu
         /5W/V05+7VaVLmyvTLaRrbO8qt2ItL/SdKMbLANsrk/83lTeqeGUgMII9slssb2mAes7
         y0Mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id s187si12554489wme.85.2021.01.31.06.19.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jan 2021 06:19:44 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 57DB1AF13;
	Sun, 31 Jan 2021 14:19:44 +0000 (UTC)
Subject: Re: [PATCH v6 02/11] exec: Restrict TCG specific headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-3-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7a8bedbb-7e76-61bc-f158-f550d78539fa@suse.de>
Date: Sun, 31 Jan 2021 15:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +lOl0YNpJEzW

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> Fixes when building with --disable-tcg on ARM:
> 
>   In file included from target/arm/helper.c:16:
>   include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such file or directory
>      42 | #include "tcg-runtime.h"
>         |          ^~~~~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/helper-proto.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index 659f9298e8f..740bff3bb4d 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
>  
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
> +#ifdef CONFIG_TCG
>  #include "tcg-runtime.h"
>  #include "plugin-helpers.h"
> +#endif /* CONFIG_TCG */
>  
>  #undef IN_HELPER_PROTO
>  
> 

Ok, this would go away when applying the refactoring to ARM though right?

Ie the file should not need including at all later on right?

Anyway:

Reviewed-by: Claudio Fontana <cfontana@suse.de>
