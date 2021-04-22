Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp939426lfb;
        Wed, 21 Apr 2021 18:39:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsxZGoReqYN0MABgJpPUPk5fsaoqgSFCCNpR/dVsw0RI0EgOQgxTBeTjrgf+yH2fXA7zLa
X-Received: by 2002:a05:6e02:58f:: with SMTP id c15mr755668ils.277.1619055556087;
        Wed, 21 Apr 2021 18:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619055556; cv=none;
        d=google.com; s=arc-20160816;
        b=N44f1WupoaQo7iWDjdzpFTpJGGzT+CX8ST0EQneGiQXhVZR1YNHQX9HbdD/ILBgXYo
         xg48507+r7ZTkSRiBQ+tPfmkLG2KwSqecRAQMCx87Vo45g738vwrocYnMdHPavmBtS5J
         gHHom8gPOrDyiImoj4u0fzhqBmgUBFGYSMhlP5lOJmwp/V6/xIZQ8uk93G6HbLMfacCX
         KmPoyV8b2guo8HxTklQb8wsnyUU1+iC/t6T7MFa2jSquz4fw4Lk9wka2G7k4zKae5aXB
         PsTNO7EOJ9pFcGO9WQ9RsZ5SNZxphrM78FZ3Bw/RP3CEBKDliEWTVbC8j6sm8xePRkKf
         51HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6ZEe78lgm772nVefiF+O1Ja/EFN4mH29kATby/KlCHs=;
        b=R1GcEk7t5dgFros1XGTlcgTtXpEMJQBis1mKmC1Rupnhb4VJ+wiUCcfWPjzogGTZOA
         UYlrrzO2lrwxMCdcSFmS54eEtFt90vZq2LlC214DWmGmb6GvqA1d9mHFoyEMmsYF9rhW
         XwT3KP1uVX4gQR6HMx1aDlBnqJUyYHRecaeKRttVbkFG/pih3W6P7t14AnhxL8ZjfTID
         4E3II2Xg/rvR7LF9Z8X+OprUefX4KMpa0UPngkh8AfAy1JC17755Id/h429f7Ftcppwy
         H0FJdL1xBUxEqDicSjRxIzPWm3riLY5hgpEYL3u/Q+yMIhhseo8qcMS8WqRWKhiAjCHu
         ndEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E/7lxrDD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si995045ioj.39.2021.04.21.18.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E/7lxrDD";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZOJH-00076T-E7
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOHw-0006F0-GC
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:37:52 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOHu-0002q9-U4
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:37:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id a12so30577784pfc.7
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6ZEe78lgm772nVefiF+O1Ja/EFN4mH29kATby/KlCHs=;
 b=E/7lxrDDNxyeLvigKnzYVf17UdLVso1ljCodCQV4erkxpqwuPK3pOqQgeg1C4NbUss
 q2U/m3YuxfV2EWPpPLHAGd4Oe7w9MVhEX4bBgfIxdBTDT/jYTLLQoWxNXswtZ022zXdC
 6srBXULkM5ZgO+6S3NoLfCFO9t/MkMlxH95t85SAgODkB/I6rYk/NDvPNuy0FqfO6C15
 FqYu81gC3hP/qxzWMemhdYnjT7IV2OqwEouIm+GJJhAGah/GnvWQUMKIiXeIzWhQUYCi
 bfW8qVpzXKgJ+30IWhdAuJ6C9/MIAj5czIjxC1cJoLaxDyJ/o5G+YT5nuWX7XZaZIXIS
 YwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ZEe78lgm772nVefiF+O1Ja/EFN4mH29kATby/KlCHs=;
 b=PpdtqgtKYX01dtbuWir00XQOZI6IsCgJ6vnUQNimpcstk8CI3bjVoSVIYkuqKAQ56C
 5y0Xkkmgir9cya25UFICzFk5WNrV3eHEUEf/mLyP5ZC/RER4kxhVoxYhCzwmMiuDL/xM
 1FUiA+5TwChgW/FtcmGuB09pteMX8XqVeinzrbr1HzMxThQDuqXHep75mQ8aLIA7h4ai
 DFauoZGwXcBXv7jIAfdcd5TSo/0vSsVCHLeg4UbGyV4QhrgnVpXX7KNDDniD5x/oU9UU
 d8tCkUIHpjjsmIZuwsbwRU5DVanw0zXD15TLWcETFYvKMf4e2YDkgbpdu1sG3ZUeOsgW
 hOmg==
X-Gm-Message-State: AOAM533O1LdccX7j+ZwISZjj6CNNYGmhZabAUbO5GAkBzPDA+D0y6HZA
 SzLuYJjeTXnkspteyhiXZfPD7g==
X-Received: by 2002:a05:6a00:2389:b029:261:abe:184 with SMTP id
 f9-20020a056a002389b02902610abe0184mr983742pfc.52.1619055469468; 
 Wed, 21 Apr 2021 18:37:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s5sm519636pgp.7.2021.04.21.18.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:37:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] hw/arm/musicpal: Open-code pflash_cfi02_register()
 call
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ea979ae-85c9-8a9e-814a-538953ab09af@linaro.org>
Date: Wed, 21 Apr 2021 18:37:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkYcavtrDmpN

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> To be able to manually map the flash region on the main memory
> (in the next commit), first expand the pflash_cfi02_register
> in place.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/arm/musicpal.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 9cebece2de0..8b58b66f263 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
>   #include "hw/sysbus.h"
> @@ -1640,6 +1641,7 @@ static void musicpal_init(MachineState *machine)
>       /* Register flash */
>       dinfo = drive_get(IF_PFLASH, 0, 0);
>       if (dinfo) {
> +        static const size_t sector_size = 64 * KiB;

Drop the static.  We do not need permanent storage for this.
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
