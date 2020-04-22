Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp150711lfm;
        Tue, 21 Apr 2020 20:30:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypKB0locuWd1vwfISGoie//4ALQnCT/1yKp6rwdY21J6PL4ti4lboxtCPodQTF1R7pjC6Al0
X-Received: by 2002:a37:a0c7:: with SMTP id j190mr23308642qke.461.1587526211666;
        Tue, 21 Apr 2020 20:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587526211; cv=none;
        d=google.com; s=arc-20160816;
        b=CPDFeTFDTkYphu0TxWRGKzOFgStchZ29EcATFziRbWGWNJQ7yJ6yIxtmIiuj57XA4I
         3QhOGtCw7LkZjP4qHuMdaYvwqqqdwS3oYNQ+7VxGMpX/GqO3tkIr1/il73GTh32qDo+x
         /je1Qp2Z/9KGW9Enq1m/bcfwNphXmjbYOfSDplq7vnMuks5ic9YuW/MHMmAlgrgrZeKe
         zpwJLO3qmzatW/oG0tBLAkUTRU9MC+TgkGG6vwjsu+jAYkoAx3IDGEV7AEMvKmDePd34
         rYMSC/sxUSqNpRt4xnDkSoPvWorQwoQPKaXUZMpk5SpxudvkX1edIo0aIHkKdidO8mMl
         rg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Pbx9ehobw8ROo+UOJ/SHHbMosUJ2HFpZPPDhmxUmdQE=;
        b=OaNGQz55tXHgVfXo/onASUOylCLpDEBB4gkzR8UFA4PyLNRWg/v9CS24MCVo59ralL
         X6mvANDH0JpjzZ82Rr5VxZ1Cyb2iEKAEEnLDF/cVw2RIVKQF2J42nrP7Hznc2KsUNyNn
         sFGS49Rv32yiXyqzrbvQQUFO1AoeJNN8XqQQc+GA/6gH1IfSn+MskyOfrjjTwf0/Bmxv
         2xtid9jE8y0wZVttCU47RIhBgJ7LCWuUC0msN+SGnxgHfhuZSXxVgTR/Yukp9pdbcnKU
         r6W0t67epoxdm5XUcwRtMLfhRRf8hNMHDuoAimL/lw+06P99uQN4BaL2vWRG+MynOQ97
         65Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GW2USCXI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si2238510qtu.154.2020.04.21.20.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 20:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GW2USCXI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jR65S-0003Za-V8
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 23:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR65M-0003ZI-Gi
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR65L-0001iC-Dh
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:30:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR65K-0001SF-OI
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 23:30:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id d184so373301pfd.4
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 20:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pbx9ehobw8ROo+UOJ/SHHbMosUJ2HFpZPPDhmxUmdQE=;
 b=GW2USCXIBwJpo06mFnMWlqOyKXekJpJj3vTQ8VDZfJKjIlNutA0YSruzemHM4416US
 bDtB3Xnox3CswXKXfVjvuVE//e1JFA6RoCr4mloOOEcf9Q0WbUU9teEhhTVfsqFVZQcC
 zUlkiVW+bdmi4dEiIjcBQJbiS73NRsS7RzDWkQ0/m/iBa/YMUtxFcseiF5mDPn5HOSpr
 z0tefYGbri1mnocOB+FPGWXPIdi27vdwCa2WGEisLSKPNWfMw79ikszLaa2Y6j6zNVtk
 5uTCPDHSF+KAiA1iT7j9aROibm/mamgBkMYxkShC65AMKhb7Du/5DJpi97PPuaM7D3e0
 285g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pbx9ehobw8ROo+UOJ/SHHbMosUJ2HFpZPPDhmxUmdQE=;
 b=PXo0a2yy9Yj9dqh55n8IqqQ9rmWHhe2TWyMt2LWIj3UWwhW7bSMQfA1YxP9t0ogrtm
 W+ufMax89liKPV8HoJT/AIOGtLxxSKsJdg9GT57iGmar1TEOtxCfh6S4A0BK8flGyozm
 VpX/XAKzZyJ5AQkXVbYttWsBqwUcMkkDcXl/l4NebPaChJ8q8W0gRkMyLvwh7xL6YSmO
 +IS/fLCeseNQ0pm5Z3zxuHxl0VftJTOY2jSxzkjKEZElc508eQXZXWnEN53DmLjQlk+U
 l+dS+qO65fYQhafMz7S0l3cBYowKud+xkDmQm3XhDsY+TDF9sY2bx58qIc0m7U/XEv5R
 HJkQ==
X-Gm-Message-State: AGi0PuZNraDrtd2OV6y0Mq23zOo2BV+QbIVKk0Vuv+oX3M33576AlrSG
 D2vGnOXOT96yqHBbrtYhgWM/fg==
X-Received: by 2002:a63:b256:: with SMTP id t22mr23273348pgo.92.1587526200493; 
 Tue, 21 Apr 2020 20:30:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u188sm3004714pfu.33.2020.04.21.20.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 20:29:59 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Implement SVE2 scatter store insns
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200420204203.13279-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75ad766b-c687-1b57-03dc-521bed73281a@linaro.org>
Date: Tue, 21 Apr 2020 20:29:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420204203.13279-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::436
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJoi25ouW3at

On 4/20/20 1:42 PM, Stephen Long wrote:
> +static bool trans_ST1_zprz_sve2(DisasContext *s, arg_ST1_zprz_sve2 *a)
> +{
> +    gen_helper_gvec_mem_scatter *fn;
> +    bool be = s->be_data == MO_BE;
> +    bool mte = s->mte_active[0];
> +
> +    if (!dc_isar_feature(aa64_sve2, s) || a->esz < a->msz
> +            || (a->msz == 0 && a->scale)) {
> +        return false;
> +    }
> +    if (!sve_access_check(s)) {
> +        return true;
> +    }
> +    switch (a->esz) {
> +    case MO_32:
> +        fn = scatter_store_fn32[mte][be][a->xs][a->msz];
> +        break;
> +    case MO_64:
> +        fn = scatter_store_fn64[mte][be][a->xs][a->msz];
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
> +               cpu_reg_sp(s, a->rn), a->msz, true, fn);
> +    return true;
> +}

I was thinking of something more along the lines of

static bool STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
{
    if (!dc_isar_feature(aa64_sve2, s)) {
        return false;
    }
    return trans_ST1_zprz(s, a);
}

The fields should be identical, and so decodetree should pick the same type for
'a', underneath all of the typedefs.

If decodetree cannot find a common argument set for the two insns, we might
need to help it along, like we do with e.g. &rri_esz.  I don't know without
trying if that will be required.


r~
