Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp703927lfb;
        Wed, 13 May 2020 13:20:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymKaqagQIpjJqF72DGRu1ZX1Jbfu4LF2ndbXmo31tMhqIBIYz7W0ENfkrgSkXgEPXdTBjZ
X-Received: by 2002:a37:9487:: with SMTP id w129mr1434085qkd.21.1589401227662;
        Wed, 13 May 2020 13:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589401227; cv=none;
        d=google.com; s=arc-20160816;
        b=FaHN2rEUoMzUsEzCFGlVP4nZMWHqY+brvQXqNsxbUIP4ppSvL+S9+0JWczSuqrFoda
         PT/2EJ9NxVw5KesEQrfY5/uYASaVAkqh1F8rwZH1y8iEq9uU3nL1OLgMtqZHrrp7KV76
         Aeyhtt5S4ANN/kYi7HaYSFRP7lH4swsW2jnIqZboixrHrct+mJVID7Mu9tvN9IVxp+Oz
         s+mGhUaaZAK76Lhh08VhkGw2Iy5vwqkChEcQ9ZE5Ujt5G07OcCinGlLpJ6SsrfgdD8RI
         pUx/epYdzmiFV44/awU7dLMhyU/ELMHofFGMl6cuR7g9W5Pe22J1dfrBEfck8UUs9d+g
         4TEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w+YXX14kevu9UFtDYvimw8YqpZbmhLFgJ74/9C4T/x4=;
        b=vSm7ZiyRsH7jLe8zbuSxuujrf0mWaHCpfFKr4HB69fcr+aqVeAD5jK8N+ymlrHRd2P
         1viYSDM+h/5uaNI4kMzNwwEs3nSTPzkMZ2jI5ckli+p6zvHkagytGYtgBYSMFMsN/kTo
         tJQzpcwBBmV8xZTRmx6Tv6Zm1QAm1hTiIgMXowGh5nUJ3Sf50k8BWFlP91DlriroTFgu
         tIY/TjaLyDkdTv/6dNTuUKV+s1rShKhEhrzkLHCxjugAW84Tvqy1rnj4ZmO2qAn9BRW6
         oGjiwHgJ36Sejm2F/xwepQcGrHA5ZAwTiHNPjrtIGHTuKFXbE3oXWoab5/zDvqETW1eN
         fmng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXRLbLhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w186si320658qkb.367.2020.05.13.13.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 13:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BXRLbLhp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYxrf-00041P-45
	for alex.bennee@linaro.org; Wed, 13 May 2020 16:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxrU-00041C-Fr
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:20:16 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYxrS-0003Oe-0Y
 for qemu-arm@nongnu.org; Wed, 13 May 2020 16:20:16 -0400
Received: by mail-pf1-x443.google.com with SMTP id 23so232558pfy.8
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=w+YXX14kevu9UFtDYvimw8YqpZbmhLFgJ74/9C4T/x4=;
 b=BXRLbLhpjdAEpounCYugUhudY7Db8hBuJtFMVYpYMrCdh2XfwkdHL1x/lyBO9c4RoD
 nPnAGR/cqBIayj+ed8IL4u59opwot4sAMy9IH8VYTN0LUALr0aMDz1uX3HbJ2N0EGi+Q
 XDzUMVeD+FywczY1/js0RTK6wfLtlXddV//3yYesBeGOzrq7Bt9yhfybYpxPPFiGFaxf
 Vki93ZVKAupQ9n89hnfAmFRhX2RQPRBOr9LTpIJocME7biD+E6GMCfSsFNOFWf1+jk5F
 Sq/7ONeIyKbaKquvsWoR6xQQZlxvlAK3H5e3YOTBCKgQc1tvid+CWcrxf+zh014OowJC
 HvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+YXX14kevu9UFtDYvimw8YqpZbmhLFgJ74/9C4T/x4=;
 b=FpASdU7zj9k+uevQG3A3HbLl31/O5KdtNB8+iGFFiDaRsQsDHJrvWHxWTi+53JB1XY
 jedcfNZRMEdqrAFqQ4nDmwCB+uGiKh0o/p2FfE+u6JXgZC3VQ20p1EeFIiu5cFXbAPXc
 SPOayuADSfbx+EBGuOU2t9eoztZ3w9MmYvgl8J6NZf8zR6EKwR5M2c9WkOD9zFTAbCs3
 wluAUWZD6TMeDZ+y0/kWMi+to/8PoenU2zZe4zXqLl7aQX9JVsssWzo0bm+2oJa3lWJT
 uHdFBD8Ctv5ritLVgGkA9peMeOa66IAbE5fcqBu4/FSQmXt5+uVvV9TCVbll3JRrWShL
 6wZg==
X-Gm-Message-State: AOAM532r62RRmj+dr5QEffi8lFATRJKtxAXc1cWxeDPev8LeEsJ+CjOl
 fbn8zHSnm/cQayzjK/Au5dIm5Q==
X-Received: by 2002:a63:d013:: with SMTP id z19mr950004pgf.202.1589401212317; 
 Wed, 13 May 2020 13:20:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m43sm2743425pje.16.2020.05.13.13.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 13:20:11 -0700 (PDT)
Subject: Re: [PATCH v2 16/17] target/arm: Convert Neon fp
 VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8d22afc-75cb-8459-12b9-fb6938b46953@linaro.org>
Date: Wed, 13 May 2020 13:20:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: cO8b9NPK/NW6

On 5/12/20 9:39 AM, Peter Maydell wrote:
> Convert the Neon fp VMAX/VMIN/VMAXNM/VMINNM/VRECPS/VRSQRTS 3-reg-same
> insns to decodetree. (These are all the remaining non-accumulation
> instructions in this group.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  6 +++
>  target/arm/translate-neon.inc.c | 70 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 42 +-------------------
>  3 files changed, 78 insertions(+), 40 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static bool trans_VMAXNM_fp_3s(DisasContext *s, arg_3same *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            return false;
> +    }

Indentation is off.

> +static bool trans_VMINNM_fp_3s(DisasContext *s, arg_3same *a)
> +{
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            return false;
> +    }

Likewise.


r~
