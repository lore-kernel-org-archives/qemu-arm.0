Received: by 10.25.0.144 with SMTP id 138csp1836759lfa;
        Tue, 25 Apr 2017 05:09:07 -0700 (PDT)
X-Received: by 10.28.125.137 with SMTP id y131mr1811576wmc.141.1493122147106;
        Tue, 25 Apr 2017 05:09:07 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id 12si295654wrt.64.2017.04.25.05.09.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x241.google.com with SMTP id d79so24520503wmi.2;
        Tue, 25 Apr 2017 05:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iDcCY84PECIH8tFS+14sxfFT+DZGZ6bdvYPoH4MkMrI=;
        b=VB17hdTCy45awytYg4DK6VCi4+vONBG5rKooNzRjfE9xM/1gGMjd/mf69nxtSimX7l
         w9AXGfPWMjXVHQLFnnyyEmyk3wieJXI13S3vZiD/Lfk9TU2FzWR2Uioq7NG4rMZRjI0R
         ocgYcC8l2uPclvMdoA8u/OYpDhvhqd4ez2hOXHkkmhMTlfoYmKHH7t3k9wqTdPT2Npb9
         lerHRUEHX7QAX8FNZm3Q6hG4lHY9C2yguVBVtqKO+NFkwn3X15qMAPGYyW/zKDJOJaAy
         ImSRM7p8GDPLEOmHi8FrzVnP2GkjtkLXQ8hgtcuOt/PaGmwxTpXHTQBdB1R6Z8V4qS+t
         yoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iDcCY84PECIH8tFS+14sxfFT+DZGZ6bdvYPoH4MkMrI=;
        b=uNAkHRalxwSwT6/uv6Smka7HT6c1BGvFLtrz9EAi0q69JAEv/z3MVqpNTwypXv0rtF
         BgI4iwQr0HPtfOF/gNaCqcpI77GdYsVetwPZYmdDj/XGT547kaWuEFbqq4K627GXGdLt
         VLmWzsFr+cIM8N6GsIWh0fATKO5Cnz2ctNzLkjF27fUq8cgCp2alU2XZ8BaqZrP2XFk/
         s7kRYde72js17pEXSAY4zUNwXl+QKt+a5dAdia8mHUkpxzhWbkEcMJxYs3eE6AMGaqXA
         /udm3vGIdQWtZZ0MlswjYIV08PUyN/zNz2oMNhxXPOCXwtwmN3dDmUXeCL4egs8ReqoY
         ykwg==
X-Gm-Message-State: AN3rC/6rmea3VoBxiCQCiU/GkmbUJts0XiBhWp7MG3tMvTOspMsMSO3w
	ZS0Q+s34ab9HI889SvI=
X-Received: by 10.28.214.212 with SMTP id n203mr1885864wmg.61.1493122146706;
        Tue, 25 Apr 2017 05:09:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 72sm2368213wmx.23.2017.04.25.05.09.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:09:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 06/13] tcg: add goto_ptr opcode
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
 <1493106839-10438-7-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4f90169b-3d23-434a-40de-1e3eec37f64c@twiddle.net>
Date: Tue, 25 Apr 2017 14:09:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-7-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: sBEqpa9IUsjG

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> +void tcg_gen_goto_ptr(TCGv_ptr ptr)
> +{
> +    if (TCG_TARGET_HAS_goto_ptr) {
> +        tcg_gen_op1i(INDEX_op_goto_ptr, GET_TCGV_PTR(ptr));
> +    } else {
> +        tcg_gen_exit_tb(0);
> +    }
> +}
> +

I think this function should look more like

void tcg_gen_lookup_and_goto_ptr(TCGv target_addr)
{
     if (TCG_TARGET_HAS_goto_ptr) {
         TCGv_ptr ptr = tcg_temp_new_ptr();
         gen_helper_lookup_tb_ptr(ptr, tcg_ctx.tcg_env, addr);
         tcg_gen_op1i(INDEX_op_goto_ptr, GET_TCGV_PTR(ptr));
         tcg_temp_free_ptr(ptr);
     } else {
         tcg_gen_exit_tb(0);
     }
}

since there's not really any point in all targets being exposed to the 
implementation detail of lookup_tb_ptr.


r~
