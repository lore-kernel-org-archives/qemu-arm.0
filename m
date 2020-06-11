Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1542526lfc;
        Thu, 11 Jun 2020 08:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaDIcgjkxw5J1eU2aE6CCeS4TLexX0AThM29f2SWdpHRgMMXufU4sPUQb5yrFYFU0T6Q0S
X-Received: by 2002:a25:9746:: with SMTP id h6mr14392420ybo.409.1591890224284;
        Thu, 11 Jun 2020 08:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591890224; cv=none;
        d=google.com; s=arc-20160816;
        b=megRQTzue2n1EWiIlpwNr5R5MfNeM9ouRondqlGj0YuKUy+DHUI+vM/VhZb3O6n/eY
         stexo87EVy/MM85ELOoQ384dDYiEGopcR1n+/qzTcSmEWFxJ8Kom9B4gUVNHnCdRNWV2
         tWmDLekvcyDpq7S3gxsTeEyUG9nWM7YoRHKyg/zmLZJZ2QyiriMuVyikFrMB2S5BRZq2
         wDk/ttW1ewptZ8Sg2ryX17jDwSB0td6mEGeJgxnhlOaY1bBx3PXBRRHLAZ5MlFA51l5P
         X0xluPGUCHP0unih6xSE0mjE7ZUJhdDykCr3ZiBxTiQa2ZK5p0m9WPBsumk+zx9b74Vr
         BZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dmGgdjzoHZYYsa1vZ/PrK/4qatxUWFsIxvydmMFCb7Y=;
        b=mFj3ov7VL2ze6wKiUj1DnlUTnmxWEA6JOjyaFCIdqCQhNlV61WsUHtbpP4i50bntIq
         2n0jbu9VxCarJUTByEh9wzMgon3Cc0xvLwZVyOMdGo84XobWVmcq/gDqXQMAmAFJXAr+
         1a2V6ltRKbrAHZs3dJyNRP5gkx5MkmNc5Hj/WaYTj1VdByaLQsVEfctF2tqJsWmgJbyo
         lCc3jCK0HcY8pysYBYo+nAK6T7Gr06tmtGEV1a5KuHAHfRe0b0xArOs2jcSaE/txVKBu
         gywrPwQKdikf/oOyCRHGF5/LwKdyB17Ne70nfbYcbcafDKQfdvUgnTbeNw0qm/EbNEB4
         jmNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRh0zZDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r128si2671205ybc.354.2020.06.11.08.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 08:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRh0zZDn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjPMl-0000I1-M3
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 11:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPMe-0000Ht-2Q
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:43:36 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53141)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjPMc-0002rT-Sm
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 11:43:35 -0400
Received: by mail-pj1-x1044.google.com with SMTP id k2so2373278pjs.2
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dmGgdjzoHZYYsa1vZ/PrK/4qatxUWFsIxvydmMFCb7Y=;
 b=iRh0zZDnVkdHPJfxM7rcBnocuOVbde5YLDG4rN0mhWAW/PiwSVVcOfpdoatxMsLZjB
 O709gmXpjYCKxiKlgJsCkxrDkV5qo82gnxj9Ca+UX05PJC26rk6DBmNa7g74DOxgXEC6
 hsDSgvK3M1tnm/mPi+5adfLTjtUekE/hEQAghuUmDoVhchE+Hb9SXh/Wj8oXkn+7SyjD
 jGpiLhkq+04Q74JOg6lpaYNSsyxbN1gJ5cMRx5uMowDTyNmqnYR/Eo/xPnLyw/gNVxxP
 Ol1aL/b+8XtsbUB8ektVGSOzSA1Ie7fOp8XRDzTrazGz3nLuL71q8PqYZUMJasp/Uigy
 jXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dmGgdjzoHZYYsa1vZ/PrK/4qatxUWFsIxvydmMFCb7Y=;
 b=fMMzpcJHCErXSB+vK5uzMZy5CSJMIBOQHZVO8bxHlaoPp3qZwrsoO94REfHtf4HZjU
 DAMROVRcNlhhBhw9yH5B8kT3ic11iUSze4EeA2gzu3eBpvpUp6EKcsHPf6Mw/Tq4oAeW
 QGTyczgZnpSXs5Qz9D4SRfDXf4LQO9vZpcLAOh+kaklrJ8JxQ53JnfMBy8zUzWwD8HFj
 +w5dCrCYRoBACCAqI+sigt1xu/yx0/WsJKSjLugQTZsaXGgjW6KN5gr6gbi8qfGPZFko
 l0SKaDzC4udflZT90ab1P3O2S8VFeh+srF4I/cz+Zobb8dE7Aew67Fbn89E2G7CGBjqZ
 bPXQ==
X-Gm-Message-State: AOAM531iQnYUNZjNgkhDQSx6PIanXGcX68qVcOtlyf/2K7qZXaO1em3D
 RiHRifsauBP9a3SqF5k8mzhSO1NKyxQ=
X-Received: by 2002:a17:90b:4306:: with SMTP id
 ih6mr7911085pjb.62.1591890204349; 
 Thu, 11 Jun 2020 08:43:24 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id r7sm2424010pgu.51.2020.06.11.08.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 08:43:23 -0700 (PDT)
Subject: Re: [PATCH 02/10] target/arm: Add missing TCG temp free in
 do_2shift_env_64()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d32b36c2-6662-91b1-5b18-ff7a56386cd8@linaro.org>
Date: Thu, 11 Jun 2020 08:43:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4sM0frvvaYBN

On 6/11/20 7:45 AM, Peter Maydell wrote:
> In commit 37bfce81b10450071 we accidentally introduced a leak of a TCG
> temporary in do_2shift_env_64(); free it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> My test setup wasn't looking for temporary-leak warnings (they are
> not as easy to get at as they used to be because they only appear
> if you enable qemu_log tracing for some other purpose). This is the
> only one that snuck through, though.
> ---
>  target/arm/translate-neon.inc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> index 7c4888a80c9..f2c241a87e9 100644
> --- a/target/arm/translate-neon.inc.c
> +++ b/target/arm/translate-neon.inc.c
> @@ -1329,6 +1329,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
>          neon_load_reg64(tmp, a->vm + pass);
>          fn(tmp, cpu_env, tmp, constimm);
>          neon_store_reg64(tmp, a->vd + pass);
> +        tcg_temp_free_i64(tmp);

Huh.  I thought all the a32 stores magically freed their inputs.  I guess
that's just the general-purpose registers.  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


