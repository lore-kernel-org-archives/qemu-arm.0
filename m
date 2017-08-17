Received: by 10.223.183.22 with SMTP id l22csp117872wre;
        Thu, 17 Aug 2017 16:46:41 -0700 (PDT)
X-Received: by 10.55.27.142 with SMTP id m14mr8816774qkh.305.1503013600720;
        Thu, 17 Aug 2017 16:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503013600; cv=none;
        d=google.com; s=arc-20160816;
        b=u8wD7VR2vuyi1/CNcscJUHA7ecy9xR1SV9P1jZmL0K0bGca09UQ3ZF9CzCh/V0FlvT
         Nzhdo4fJayp9lKMogRWXXKOp/t9ucFLnm51kR5yOP99VDllrMDhR56DdWnzmjQxca05s
         wD1GoGLChgiFSvFkMMXxinCjqwDZq3U2l5MyXejVowZ7OUJNTse7Gj5HgHTiDq0sk3/1
         RTZvqbiCggDyXqYLZcV8jDOx53eh2KbkJAZN9i2HwxtNsFHLAEfw5FLOWKEYNijx0dBB
         8EAI6BzcCbkt8zbau2igNVbz7kAFT6ow1FKO05eS7ommTHDZ5cRnwa2sxJK+K+1Yoju9
         tgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=mqi8s9rIvj8jdm9aO/Jh/c7H3U4oGlTCXoBQZ+vgfUw=;
        b=A1Tfi8F+Cvrn72WCW6Kc8FY1XoYtEZK6PdNcRFViYafzPZBycgRWvBtGWUma4YfeKz
         wVLmgoZseC9JoMtWsO+agPzaGzcBy7gFMXwiQQOQizw7owXezbWREfPKpFxR4jRILQzR
         ul677oskgvOxSBqmf85ZOGlImfQT8W2P8jM5wLgdWZqDxmmdZpvxJLRLjDU+zFfKFE9t
         2BW4j1rB1+x+NxIvIdvhpXltciqDo6yLmoYefCosQz+yHiviD53Hv6tI2DLQyjqvt575
         yQApCtroBZ4hY3Aq+w+SLR5GNAuS5EPSjPwtPvuzJUvpHESet6f++Q/QObKFoELWE+BG
         TglQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzm6ds9b;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com. [2607:f8b0:400d:c0d::242])
        by mx.google.com with ESMTPS id r64si3956331qkl.194.2017.08.17.16.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) client-ip=2607:f8b0:400d:c0d::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzm6ds9b;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::242 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x242.google.com with SMTP id c15so7640887qta.3;
        Thu, 17 Aug 2017 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mqi8s9rIvj8jdm9aO/Jh/c7H3U4oGlTCXoBQZ+vgfUw=;
        b=qzm6ds9bMmtKeJWkbyTHfBmI6MrQRVRGaWsiB26EvuU2VvPuvAi78AyaM9JH8lR+JR
         d8r+xLWWPgOyQVvv+J8fOVUENMOWneIeMTJhSREDJ+XOInOq9yEu8yFPtSnbRcmvnODz
         OSgP2SRohQwwBvC0HFsgG6YEgrkCBhiLEphnp4qG5F3Ryt9vglVWlVObIQZdfYGJUmXI
         st2wahb20vogIORwDuixnOl9WAsAYdVW4d6GiPdfiMPGRmvka1qEFqQxqISekrNrw6iW
         KLA0qz+GcAMHTXSdTPd4d4uIaqFFW7G5Ua1u70vLjoO1cDSuSFNq20+sUuQJAHnRKpqf
         F1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mqi8s9rIvj8jdm9aO/Jh/c7H3U4oGlTCXoBQZ+vgfUw=;
        b=CMaKkiDRm4V1dXK6/BmyMpMny72rZpJMK3IrqwSrvSvdchDtMHzZpoCOTxVeBz/FGb
         yHZ2y+Eam7j8iP4nsFJ1/mr4O9Wz0s8dCrjUa8LppAss4ruLPUyJs5CmBJ5zfUjf4usq
         v1BqCI1isIjkBlSrwUoYXQlIfwpBbwWFv6CpaDGkTY5mUkUFynyI72cT5EGrpg4n7v3N
         TA7l+doKtkiFNmIaRlJ8P1hatAbG2qbRy04tiqayLSVxBV7bgE+IzpsT1cbgFG+ZCO+1
         r+MQOUbHp7Hwf3pAL4R6Otdk2HI/sjcO+3mPEs99OC02kS6X14uIyybL61RZK8ZCeIkf
         YdAw==
X-Gm-Message-State: AHYfb5hN3/5KzunGH+99HTy42/ZkaWVRFsVRheEzkThh0c0U4CouPA6z
	igq2lGL1fa3ttd1y9wg=
X-Received: by 10.200.50.151 with SMTP id z23mr9830899qta.140.1503013600268;
        Thu, 17 Aug 2017 16:46:40 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([181.93.89.178])
        by smtp.gmail.com with ESMTPSA id f17sm3214956qka.14.2017.08.17.16.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:46:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 3/8] tcg: Add types for host vectors
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9ceed03c-896b-a947-0736-3ee108bec7a3@amsat.org>
Date: Thu, 17 Aug 2017 20:46:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817230114.3655-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: LClXibhM+cIr

On 08/17/2017 08:01 PM, Richard Henderson wrote:
> Nothing uses or enables them yet.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tcg/tcg.h | 5 +++++
>   tcg/tcg.c | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index dd97095af5..1277caed3d 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -256,6 +256,11 @@ typedef struct TCGPool {
>   typedef enum TCGType {
>       TCG_TYPE_I32,
>       TCG_TYPE_I64,
> +
> +    TCG_TYPE_V64,
> +    TCG_TYPE_V128,
> +    TCG_TYPE_V256,
> +
>       TCG_TYPE_COUNT, /* number of different types */
>   
>       /* An alias for the size of the host register.  */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 787c8ba0f7..ea78d47fad 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -118,7 +118,7 @@ static TCGReg tcg_reg_alloc_new(TCGContext *s, TCGType t)
>   static bool tcg_out_ldst_finalize(TCGContext *s);
>   #endif
>   
> -static TCGRegSet tcg_target_available_regs[2];
> +static TCGRegSet tcg_target_available_regs[TCG_TYPE_COUNT];
>   static TCGRegSet tcg_target_call_clobber_regs;
>   
>   #if TCG_TARGET_INSN_UNIT_SIZE == 1
> 
