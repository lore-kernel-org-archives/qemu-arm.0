Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1016061lfm;
        Fri, 19 Jun 2020 15:52:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkPOgfovSTQDs3v9gmZF48iFT6P1lWLofihAotb+EdMNdHcoxFPoCRjDNnvDJ7bgIeZCA8
X-Received: by 2002:a5b:290:: with SMTP id x16mr9102643ybl.75.1592607159532;
        Fri, 19 Jun 2020 15:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592607159; cv=none;
        d=google.com; s=arc-20160816;
        b=Nuo5sNhVuYDV1Gx4U5J9sD3Y8ANRiWfj275EKnxivwodWEVBdaKSEdQcHr3roXxEaI
         kc+j2ihFmduk666gOWRYGHXqd8x/bUbdVuHy6oPLjku5+8Q1pPGsCZYmZgeHvIOsFjBK
         WEOJuuVPObHfUtGjcaKYrl5XXPOUJXaXQ2+vVEx3pPsIbHRrDKu7U9qB3E+2hJDkhIzW
         5Mn/yKhLSCT4/CVHi6oVnJUmcdDIvl69bTuX38QrNJZpxGxDBUo/zIk6GNHqPZwDs2rj
         6UlGbLql0j74Pruol/FNM+IRqyN98Pv7Hl5Q6J2HuAK30HVTSjRYv9+Kx0bkvlHGo1ej
         j5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6v+vvlDT/vgxC+n8e3pvkFPZ1iJqTwyKNDRCBWHJGqQ=;
        b=G1/KPW3oC8ROCB/NG5fQbebWI9eSHl9e4eo7uuymk62e8OXV02g7F6l/YWLpwxEQhw
         xnX3kaaTnjURUTuickD9l9cPKhc32rpvReh6fxOOklX9xdCcWi13PV1uKLCb/cHvK8mq
         ODay2cqQ6Z3kczyhpDCch+glm5cGinITRpUs7bgAr+JrOtxA/qM+1VMSpSBr8MkBi1jK
         TS7Dxnx+jObTTQ+pJWLuGIoDnhI0cwPAjxgu11AZu5X8DOVjvVn+/sEEEYEsWoXX8OP8
         6hilioBmF2atmZ8VDn0BGCyoTrcWtORb/GD2HwnSnh87UG+aqfNCN4o2kWA+3gkV6JgA
         yXxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlLuKIwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s83si6174045ybc.44.2020.06.19.15.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 15:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlLuKIwh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmPsE-000857-Vk
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 18:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPs8-000850-Sb
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:52:32 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:53485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPs7-0002lG-CP
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:52:32 -0400
Received: by mail-pj1-x1043.google.com with SMTP id i12so4694569pju.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 15:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6v+vvlDT/vgxC+n8e3pvkFPZ1iJqTwyKNDRCBWHJGqQ=;
 b=XlLuKIwhnaxYJoV6kOKYTcRHWy8LNCOsvcAfQKPv/tCpo7YVEW2cIlB9Zr1Pkmg5sg
 wOY75Msu1za96I6H0f+/eY5N99VWq1t0d7ySSf+k0BACTC4cg32z7HCE4c8ztuG6fHXg
 e8A/IfTo22804R3u+xFSPHbRfxyHerMLc86q9WFHotTj5bMyQZ0csGP2QVq8JoZauwcm
 E7n7L5Gdo+K6BuFh8bgIvl3WsBoW+5mfFWfZ1Fb8I9dYjvP7CB5Z6fB8FOf7gOGFyaw3
 Upgeh0r/zLOyjL+CwH02q2eRozQWQApShaEySWJSmTllTbwMJfzFAj3XInpXpxct/2vo
 1IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6v+vvlDT/vgxC+n8e3pvkFPZ1iJqTwyKNDRCBWHJGqQ=;
 b=Qc+0Rx4ZUJ1eSmcdK585KrN5u4qh/CX+FwEiV5huHaf8RBlKakrQoPrZSFFunXQ5kC
 R/572udSS3xBubkHwdlTyldUEXQepg8gKkqB3Rn3gv8kkJZP89NNJqyCyBk0wp9C1fSV
 4kYAFACZZM8UEapL4UaxJIECwx7rpWVh5ITlTxBvnZ+PAjplMgGkDys1e4Ipiw47ZZiI
 C+7XD6ImdS+mzgTZpHzP+UkgBHFKXOzb9vgdde+XaARGbIdPkBZdiop3u4mIiNq1JzaS
 sDtoQLqbjyRQi2yd3SEECWWa3Gkfl+VKft5fH/MFccdZJyl3IfMWAX8DBrVUPRH9Aupn
 JwNA==
X-Gm-Message-State: AOAM531q+Xt1z2UY02vAFDwb7i8FM2S1lJZU/t8uAGx2kUJcr9R2AdoW
 Ce7lB+8CNM5bkRxrpdDM0lbW4g==
X-Received: by 2002:a17:902:ff06:: with SMTP id
 f6mr9644890plj.22.1592607149962; 
 Fri, 19 Jun 2020 15:52:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h3sm5914506pgk.67.2020.06.19.15.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:52:29 -0700 (PDT)
Subject: Re: [PATCH 04/21] target/arm: Convert Neon narrowing moves to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ed83d82-5b65-1bb5-398f-66e86e05087d@linaro.org>
Date: Fri, 19 Jun 2020 15:52:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
X-TUID: R0fDxqsvzke9

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon narrowing moves VMQNV, VQMOVN, VQMOVUN in the 2-reg-misc
> group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  9 ++++
>  target/arm/translate-neon.inc.c | 59 ++++++++++++++++++++++++
>  target/arm/translate.c          | 81 +--------------------------------
>  3 files changed, 70 insertions(+), 79 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

