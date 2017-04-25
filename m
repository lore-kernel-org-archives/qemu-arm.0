Received: by 10.25.0.144 with SMTP id 138csp1821936lfa;
        Tue, 25 Apr 2017 04:32:44 -0700 (PDT)
X-Received: by 10.28.87.70 with SMTP id l67mr1538081wmb.37.1493119964550;
        Tue, 25 Apr 2017 04:32:44 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id s132si4107762wmb.18.2017.04.25.04.32.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id y10so13190317wmh.0;
        Tue, 25 Apr 2017 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PkM7sfnP62b0ATlYK76Ge9/HP3Ota6Blyl5Ui61UPnc=;
        b=U3yrF8yk8OgYiZuJyqNiXTvhTVTdObtRCUNRXbypoVX8hPEQfLOx+7RZcgDIMKsCGC
         Bf7YNkkSbOhW24IbAD0OxBNTCahj3B2/UVt3D6RPe2mWvGllBjK/rKbKjB/quz5PZrHz
         TzLTyfSM03JMdFX2YnCtoV6s39myw4IudMQ1SYsqSjHxzQKf76XL7q9wEHVph8/wIIRp
         HyGwcuJNoxhdIx/HFnb2psMj4VturLYQY/Gtdkhx+1BLzA0uKOuLD+8lPbCxHg00iDCs
         49AodNDVcMMEMdivih5V2tqANsW1eHFYE6ake5TrzBxIkAzDt3cDeCdyBccXoiKidunF
         2f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PkM7sfnP62b0ATlYK76Ge9/HP3Ota6Blyl5Ui61UPnc=;
        b=LG3scdUPHBQDrD+C58fQsE7YXflNAlKUumYYQlOWgf5QULUievpWfOYAy6MIL27cam
         h5Kb+Amwz1VL7XX0alvXzLZBhXsZW+PD2+p7utyKqzeZ2XUKJ2MTNSO5ZWaVv2CkAvk8
         VUx10sKi7jjQ5qc7J2GH4myauY12YhpEyj9L2xsvxraM4Owh4/h2e2lfYD2W/w9AGBmZ
         3VgBBfCm0GFrDS5k7g2N2HhNmHdU8iFQJDmbkE14OI+e4pJTzUq7EeIGhusukO2ZrXpQ
         GRxS8/ex6s+83WuDl/eZ9yI2eBmI/M13DoBQpOdkYBUpDJKOfGAxSQGGweNuvpi752Hv
         ekLA==
X-Gm-Message-State: AN3rC/5D8FWS4xS8gSjXeaSqbg5exF6MpA0PmFJVrM5rgyXqiRu6kc7T
	UInBpNC17iBtVA==
X-Received: by 10.28.132.134 with SMTP id g128mr1751682wmd.106.1493119964287;
        Tue, 25 Apr 2017 04:32:44 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id u9sm3470081wme.8.2017.04.25.04.32.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:32:43 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 07/13] tcg/i386: implement goto_ptr op
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-8-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <14efb39b-c319-cf7d-400d-bd6fd20388b7@twiddle.net>
Date: Tue, 25 Apr 2017 13:32:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-8-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: HkJaKtmW7vKb

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
>   static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
>   {
> +    static const TCGTargetOpDef ri = { .args_ct_str = { "ri" } };
>       static const TCGTargetOpDef ri_r = { .args_ct_str = { "ri", "r" } };
>       static const TCGTargetOpDef re_r = { .args_ct_str = { "re", "r" } };
>       static const TCGTargetOpDef qi_r = { .args_ct_str = { "qi", "r" } };
> @@ -2324,6 +2333,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
>       case INDEX_op_st_i64:
>           return &re_r;
>   
> +    case INDEX_op_goto_ptr:
> +        return &ri;
> +

This is incorrect.  You only handle register inputs (i.e. just "r") in your 
implementation.  Indeed, that's also the only thing that makes sense.


r~
