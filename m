Received: by 10.223.183.22 with SMTP id l22csp117126wre;
        Thu, 17 Aug 2017 16:45:42 -0700 (PDT)
X-Received: by 10.200.8.188 with SMTP id v57mr9685537qth.213.1503013542400;
        Thu, 17 Aug 2017 16:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503013542; cv=none;
        d=google.com; s=arc-20160816;
        b=aKhYNIQRKuZztXXz4VLNsPCLnnUpcjxSnRb15w2/mnyaCzCxbLEfbgYcy8/3MSh+dB
         Tv52MXWyCV5qdbrLe5bJOuewlWIF4bHj6PvaMwVkWCEiRHJ3saDKVAZJqrdApx3DQjnv
         OLn6XKEESYeUEPyyIogu9Tn0UJNM/UadrrzQSwvcfLYcXXSeSnGcBZpcR6BfKookVbQ3
         HMX/oX8OVhHRDKR9+PoQa4opyFPnkpxAZTSyAaKqqzEQ7F66nMnw8jcKJ9s6ZMFJgEJm
         bcs7XIAD32fcUBQgm14qJ8Xg9MWZegCx/fM3gpe1+gU46nbjs1rPkL0xrTdT51sPzajk
         1wIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=ZEEQ47zfaPuiBrxCSaBInTnQ1hZGhTIHMrShOgK1XZ8=;
        b=dcazdLeTZ1mipdWNUlWHv5EwG7q/cOXq5/vnqF+Wp9B3nFrB887qtPe1MHrKd8rcU6
         WSkEfox510WSUxaQbfPIcSV5m3SFIA8M4fzndZ19RN18NH7ZtzWdS6S805a7pZxVtqeu
         7Y29TfiX8LSnYegzbed/sa/VCrYG96X2NHuFUfe2jMzGrBNPm3+zVwqTtgklNHVcsp7g
         Nf+Eva1uz8c6yZPz5H8/azJDUnIBDJXidpWFA/yw1WgDTkv5GSyk4PJ8qWN+nxi74vrW
         7kaKwmpmdVNoR1uaEAZlKJSRGClDcx5GjIsceeShCqUP5BXvH/ovLhQfol9wm5h3ZvIJ
         kubw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JXhIx3c4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id d41si2125717qtb.393.2017.08.17.16.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JXhIx3c4;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id c13so3407293qtk.0;
        Thu, 17 Aug 2017 16:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZEEQ47zfaPuiBrxCSaBInTnQ1hZGhTIHMrShOgK1XZ8=;
        b=JXhIx3c4PKN5ODcR42ChTap7MWFUZHbgP+UciWO7429zOVsYTBXnD0EB0FY2KNaDEx
         J4GoRlgskY5vzBSlFcnKrCopYChZadX4LzMjr7g5ZIOaVXBqe4G1tqn1xQXOkWNDlOq0
         wl1Tq++Uo2Ig0EjVvKqNz5pcyFUQWyN+jcLjWgNKZdZutWMqQTrDUFAAui8cl9Nbg3WN
         71b0yT5bnGvx/UKYfE45Gbzb4VAITuWpeLx7G0PpAUA1YiC/3l6vAEhGq77VQ5zKo3jb
         y1pWQ/r++3mFY05XaQGZzViO006QN+OMmwKkVbBMP7UFRkg1ZXdrlYeUIwm9/aAS6lck
         TmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZEEQ47zfaPuiBrxCSaBInTnQ1hZGhTIHMrShOgK1XZ8=;
        b=SIk815CIPk1sZYwX17fA97DrM/AXEoj48LDnuYeZ08Z367Dx+B9CxJ+kTeA8LLR5FD
         vOwjwldJ/mISg/sjSjrdUHJaxp0Ji6ObJ+QWLu/G6d48SQqAfbz6LaHEvjuad+AXZwRR
         0b+OvPY3mxID1Z7UBsYfX1S3aZg5LPPQUfAhAXcQ8+SECQ+L3TGqm9bXp5wzDm8AG/2c
         wll3ut3+hFKHYAM89/NVHnz+3EMP4MuvjG/eLp+qM4NRze7qKMp1m1xFT3nlBx/L3fjo
         MI2KKkCRqurINhHeaCXK+2MnANva4RIpcvkhUNlxwFwBITmXJUZYYh52oSU/9f3I73OJ
         yCQQ==
X-Gm-Message-State: AHYfb5jXdvFd3kKni4etogdhwk2mlkEOG3oNDAog3Pt0TABJhberg8Qc
	ntmEl4xuoLFHEHUiL90=
X-Received: by 10.237.32.172 with SMTP id 41mr10535765qtb.260.1503013541921;
        Thu, 17 Aug 2017 16:45:41 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([181.93.89.178])
        by smtp.gmail.com with ESMTPSA id d50sm3143893qtd.37.2017.08.17.16.45.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:45:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 6/8] tcg: Add INDEX_op_invalid
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f7d3643e-6dc3-5bda-70f2-75c57fec4146@amsat.org>
Date: Thu, 17 Aug 2017 20:45:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817230114.3655-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AVIuLpUc/w0L

On 08/17/2017 08:01 PM, Richard Henderson wrote:
> Add with value 0 so that structure zero initialization can
> indicate that the field is not present.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tcg/tcg-opc.h | 2 ++
>   tcg/tcg.c     | 3 +++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
> index 9162125fac..b1445a4c24 100644
> --- a/tcg/tcg-opc.h
> +++ b/tcg/tcg-opc.h
> @@ -26,6 +26,8 @@
>    * DEF(name, oargs, iargs, cargs, flags)
>    */
>   
> +DEF(invalid, 0, 0, 0, TCG_OPF_NOT_PRESENT)
> +
>   /* predefined ops */
>   DEF(discard, 1, 0, 0, TCG_OPF_NOT_PRESENT)
>   DEF(set_label, 0, 0, 1, TCG_OPF_BB_END | TCG_OPF_NOT_PRESENT)
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 3c3cdda938..879b29e81f 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -756,6 +756,9 @@ int tcg_check_temp_count(void)
>   bool tcg_op_supported(TCGOpcode op)
>   {
>       switch (op) {
> +    case INDEX_op_invalid:
> +        return false;
> +
>       case INDEX_op_discard:
>       case INDEX_op_set_label:
>       case INDEX_op_call:
> 
