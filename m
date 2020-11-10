Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4213012lfb;
        Mon, 9 Nov 2020 19:37:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMqSf3qyMD/wZzhk1NhDYdczsbjRdm67dB1pTLR5cXj+DQnFYkEaxzSuG22udVSYFMdV6o
X-Received: by 2002:a0c:b2c6:: with SMTP id d6mr18226714qvf.38.1604979434396;
        Mon, 09 Nov 2020 19:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604979434; cv=none;
        d=google.com; s=arc-20160816;
        b=Idoe98Ndm8dMDXX/j7S5uzDTPbLjvdBYAKWOawniuAe29vKwVjdz0x+AoL6DzqMiP5
         l+rtLV9b9SkHNoVXNsrPzewogRQ9rNvRp71mH0Q1bzRa7n2CiY9G/s7/HvfzCZdCqsSk
         TGx8KvTtqaL2hI55D6bY75UAk1384LHpLV8IUaroIJk+psFNSCucqjs/nhmrCyMoe0E8
         USQCDYKDlGwlvzkJhNu8GAzzIWKxrcCv5hihS5z3mxr/qInJngZolr2myfJVhfvG2ACC
         TJ8TUEf1oe16LcEUScLW8dUzDj6P5erXXFD2wFmpsGE9AEls6g+58LaNj/X6ehmNs24F
         U4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w1AtoijchZskA1WbSwDurrxO3GME61Mrm83kGKPg3zU=;
        b=nj7iTuBhQEUxs8+iNcffGgwBsh7u8eS9DTQAddUVfBNuwHFnFofzjyHx2LUZWVgqUC
         0XHgRG9buY5cjcjyMmzy4mnnw5+sf9YrOQbUzQbRrqDVh1MiZM3fQ8IA2dHc5CGjOj4r
         F8yjgTGzW2QMz0LteQnC98nbB5UqvoKpQBfNak/onHDeNKXTU+g7+Z3KSOgtQFIZ7oSR
         9TYflxhRqviQLHS9pqWNyPTwTOeq0ELvgCdiEvODQrSCcDH1PSll3qVPT4cWtcbuIQ/y
         kCXOTnIoOUHqi8PqnYYKa9fnZjhnRsseQ5J/knePEkNzutLeIegiXxIYmZxLy6BZD8JD
         XPPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmzndc4f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si6090440qkh.364.2020.11.09.19.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 19:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rmzndc4f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcKT3-00063v-Qx
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 22:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcKSf-00063f-Rs
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:36:49 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kcKSc-0006bc-FQ
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 22:36:49 -0500
Received: by mail-pl1-x643.google.com with SMTP id b12so5782434plr.4
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 19:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w1AtoijchZskA1WbSwDurrxO3GME61Mrm83kGKPg3zU=;
 b=rmzndc4fpadq8U0FBn/x/zCZUZlnl6zauxkglTaocmN4rfnA4hvP+2Amo7hxxOQ6JN
 PHKsf1mLNX2Z79tIVOpOEjzozOmQHWTXHN9U0bcNMy1ce/yyKNDpGqr8LnDMRHTyXHYs
 FTX+ZUIQD1B2qXyOA8lvhr81k5KE/bsb8dGRj8waMRDrdXOntbS5yk8jLOfB3UxMomHu
 5I+hkiYV1HcfV580YQfGa99P60DvnW2u3W7xPIOH7C3ajUoTEmefknUYLjzs3+UvcKxO
 oozhrpYeqLBQB3NuoicMTDJ0zcjKi32UjtaScWgI8FTMmSx13xgNKfCgptc/xATi5T6R
 /AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w1AtoijchZskA1WbSwDurrxO3GME61Mrm83kGKPg3zU=;
 b=FHRstdklC5P9VPuzJLiEYQw+ePybyDAjmgPkziPN5VsZnrUTnfB63w7MmMMyOcjdaz
 c8MD6OpoZAXnlSNx6zTlvPKBR5eZXunAW9oGt4rgZ9Vkmvl73ZvB8FG6ztAzeURxxeWS
 A4/lDd7Is9Xw4yzMvTA9X8HYhAcq3bDQD6JHIyAK1ZggEFViwsV9eTTM2tssZYmrDaZ8
 bYbe95TyqiGYTHTh4s2Z8myWsfiLCSzGS2Qr9N0GJ6RymYO7Ej517y6H2VssoipExoiq
 JiKYjqyBaJwcsvFtOh67d5wfdeA/uPTutNh6Ga/56QSCZaiwsUhELroElOZiTa8XdMGt
 luVg==
X-Gm-Message-State: AOAM532ChIacP0VSmh16qu7EvvDJOmVWBuf6uVdqFblhfDdErHcYDUA0
 14+DSTd64zGP0JHEzGL1zkclr3xpjxPJuw==
X-Received: by 2002:a17:902:778d:b029:d6:489c:67ee with SMTP id
 o13-20020a170902778db02900d6489c67eemr15367224pll.52.1604979404700; 
 Mon, 09 Nov 2020 19:36:44 -0800 (PST)
Received: from [192.168.3.43] (068-185-011-182.biz.spectrum.com.
 [68.185.11.182])
 by smtp.gmail.com with ESMTPSA id gk22sm955718pjb.39.2020.11.09.19.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 19:36:43 -0800 (PST)
Subject: Re: [PATCH] target/arm/translate-neon.c: Handle VTBL UNDEF case
 before VFP access check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201109145324.2859-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e41e645-1a99-8fd8-60a6-36eb1931dbce@linaro.org>
Date: Mon, 9 Nov 2020 19:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109145324.2859-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jULD1hrw5XgR

On 11/9/20 6:53 AM, Peter Maydell wrote:
> Checks for UNDEF cases should go before the "is VFP enabled?" access
> check, except in special cases. Move a stray UNDEF check in the VTBL
> trans function up above the access check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based-on: 20201105171126.88014-1-richard.henderson@linaro.org
> ("target/arm: Fix neon VTBL/VTBX for len > 1")
> ---
>  target/arm/translate-neon.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
