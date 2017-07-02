Received: by 10.25.227.6 with SMTP id a6csp511298lfh;
        Sat, 1 Jul 2017 18:54:09 -0700 (PDT)
X-Received: by 10.200.39.196 with SMTP id x4mr30288178qtx.80.1498960449164;
        Sat, 01 Jul 2017 18:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498960449; cv=none;
        d=google.com; s=arc-20160816;
        b=bJKhjaasQaqewe6WnOLMwS5cMv0oV361R/3HDuO4TyDd7pQO3mO3r0JKw2+xdoOaR2
         pBTmddatwbBvZfSgxmi2WsqfwJEC9vzMcGi497l+IQa/m/zIIOTmYuxm3rKEXxxs9Ic2
         PZhVl4FDtvJ2/nVWdzzJGBIV8AFll29m3lSodUeeqzeu8t4bqdHVu0Ou5sXEtWQ4OhUB
         wwjNdCVytzoibaFlXC1+n7QSWd2k/sh/o7K/pRJfmDTZjW1Tr/p67LXZxCHo/t4TH44y
         W2ScOHYmUlVg7BkJ+R83Nm+HrkiWFCndqNteN7hXD9IIg4wLmX67fz/GQ43octdiwfSR
         j62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=zuTTir2I3n2R+tcRrA4vWXQlr4U2+CiFvwWIy+8YY+A=;
        b=v5i7eGSUSReL8uCa21nYmFUAubcUhoS6nzB0Sf0z0wsope4sR8CHdzjpLrMnNvj6Qd
         nJarMnVadl/1+zJnlO70um1ah7Hi7NAKyi5MU0aiFPz9iEMtZrGMrdZscFG4zYROkVtX
         UolIzvAD+y0CMOtYtLNb0MmCbuv5H5CviZAAoSV+bWdOt4Uf4goULwR7d85WpaFccfKR
         Y3fu3yK/KcV8hm9ucu9SQa5ZSGb6Wq3Ww6GhYaUmcMvcZm0RRyvKM/q/ehQjK7KUxsIb
         shEGO1fJcQqXZeEA+jx1G10cTS2H9JFjZUbKoHsOFibBonhhj3ikni7dh1wlezCwmjI6
         K/CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=JtsRe21G;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id n10si11357365qte.262.2017.07.01.18.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=JtsRe21G;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id v31so19722122qtb.3;
        Sat, 01 Jul 2017 18:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zuTTir2I3n2R+tcRrA4vWXQlr4U2+CiFvwWIy+8YY+A=;
        b=JtsRe21GRehxRhsve4LOplUj7au64YhZu9mfzQ1vFjvMrfj9S8JE2pk0XUKq231oLO
         kIqPVMyWRAnWilTIIKzeHFi8PjsZ973QbPX/t9VX02IADLRrqzzBZ5Le1pk6ZjHOP+UM
         KsyQiPVIhYj4TiU59y3hXMA/VgrwC/SL/tHHAupI9ymc/65eWAnsycIbA8wOtoHIPq/W
         IIU65MYyvmk3bOmgH3n0jsB1FUcTb9yjAosW6EOJKm8XgPpL+OwT7f675sntB8dHRCvO
         EiuH79a5DbFda7Ndz03+uhAX3gz6PdtcSq09+jk9+07WRfYL+sa7Zq35Q/QU5Uo8R350
         8HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zuTTir2I3n2R+tcRrA4vWXQlr4U2+CiFvwWIy+8YY+A=;
        b=FOi9q2GeCsZj2ZooiwwbWDdbL/neZKGROYVkFIoUlbpTTSJDGAc+2jnMr0PEdV4XIg
         ihDCP0LVNBjfzbzMveRakFMw3N5c18hjFcAGf9IS9MskcvUbeOsbYhZkuNo9OV4+sQ0w
         JKvaokqVsnufHB27qQWtkXUYC/Uv+MopHyGqnkEfuHBfM7bDZZ7MAxxjx579qeN5X3B7
         KX7V5MoPYi9Kefotu69mJykBDFOzU/mY3XoVxRKb+0guAp3hcff96f1UFSu7Y/9Ps6JJ
         jCFp7qU1tBpoipHonkcNBlqF43p2GOHg70vMgtZuxZIO4BYgy9uZjX5JInBV6CigqbWu
         L/bA==
X-Gm-Message-State: AIVw1111lOLDRVkfCan3JswMm5+lIi/l54pt8yKoVcYdSrOunMnpTe1m
	VHDXtf9iFl8YMkoQNbE=
X-Received: by 10.237.34.149 with SMTP id p21mr3680075qtc.90.1498960448615;
        Sat, 01 Jul 2017 18:54:08 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id w43sm10242789qtc.48.2017.07.01.18.54.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:54:07 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 29/29] target/arm: [tcg] Port to generic
 translation framework
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865922142.17063.17637554632892697681.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5e3f1bec-5597-172b-1ec0-0a823a4960b0@twiddle.net>
Date: Sat, 1 Jul 2017 18:54:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865922142.17063.17637554632892697681.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SOy7/Iun/cI1

On 06/28/2017 07:13 AM, Lluís Vilanova wrote:
> @@ -11377,6 +11385,9 @@ static void aarch64_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>               break;
>           }
>       }
> +
> +    /* Functions above can change dc->pc, so re-align db->pc_next */
> +    dc->base.pc_next = dc->pc;
>   }
>   
>   static void aarch64_trblock_disas_log(const DisasContextBase *dcbase,

Surely this belonged in a previous patch.


>      DisasContext dc1, *dc = &dc1;

Drop the dc1 thing.

> +    translate_block(
> +#ifdef TARGET_AARCH64
> +        ARM_TBFLAG_AARCH64_STATE(tb->flags) ?
> +        &aarch64_translator_ops :
>  #endif
> +        &arm_translator_ops,

It would be nicer to avoid the ifdef within the parameter list.
Maybe pull the ops pointer computation to a separate statement.


r~
