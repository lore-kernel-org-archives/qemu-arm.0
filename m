Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2416324lfv;
        Mon, 1 Nov 2021 11:54:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrTnfL+ZaZx7ERg7SSp6d8Eeh3s044yZRnAQqFe42rsgnsJfc/W2guEopZFZqiDXA+R4Vi
X-Received: by 2002:a9d:5881:: with SMTP id x1mr21478299otg.332.1635792849924;
        Mon, 01 Nov 2021 11:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635792849; cv=none;
        d=google.com; s=arc-20160816;
        b=lBaYQcOdoXEdgFfKksp+11z6WK5YESxT1VDpxPAoEbrQHPqltBWZ8p1xZriQQ4suk1
         6ljTVhxtnAYE06zabrteo4Hxpfwjj5frKawooc+SEiGvOaxxWxSPVKD1MBeM0sRfOD1t
         VZVxhAacaeG/cxvYDjyVD8zCnzDkaHDYLr1JeLonusU+ps84vjGh/F9K4SbgcTkMw5Qs
         p2rkQ+97oIkJ9ZnHfFeiL6lCno155M14mygecpOHQcI0vEto4+pHLArAMe8FznL/GOsf
         QpxUtQxTx5oAl+4afevAnE2kS7XIVF/SEVlBdpytJSKslkxL2dUBpmo878jpl84WZv6s
         ilbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vxtYdT7tuil2KNSsdqxVZtgL8WILDaWBTN/F2v/nUt8=;
        b=V8h12fk/llOdvYNUBr4fgauyZvKV72/AmcYKCXP1JgebXGqBBV3+4msPIuxJY/jWRR
         RDGUw5UR2ZDvRgT8fYCAt/59U1geVi192kMRi2fvehQxsTUW1krY43RbAjK2BL4N0cfU
         NQzhs/TfT4e+I2WDaQnlkQKPz5vhIBBRKg6ffPU7+E+oG+sfCzFUpdnN0g7ZbGVPAnjP
         4IVO63jZkbJItxyGWtsFKLoVcu6jp1WLHUp80/mEuu/5ye/hA7IVxQDu/IU+PIXrQdsM
         +883wskpZkuNMhmQZQhf20V46eQ33VivkykdKkw8nIAssxoUiPtXPvTiLes5ysSqOTwR
         g6kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ujg/YHSU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si13690047ote.54.2021.11.01.11.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 11:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ujg/YHSU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcRd-0004CU-9H
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 14:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbGn-0006aj-Gn
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:38:53 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:36645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbGl-0004wF-P0
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:38:53 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h14so15755886qtb.3
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vxtYdT7tuil2KNSsdqxVZtgL8WILDaWBTN/F2v/nUt8=;
 b=ujg/YHSU0uezidS0Y7M44EVHJXJks4QlAKjkl9XV9g6nq58hEBxi/Gk7xWIgkjPyob
 mC/WBG321cs+Q1A6hujFEgHv15r8WaAZr58UHVtYS0oH3VIGyLJw7ewccS14H2+SryvO
 y/aGMWWx1cLJ89WtjqSuFx+sorp8UQIhRn7v4QW/3iSw6bjCRQmY4ZYdJPsiy+S1BZwJ
 fS2FUfYUxPfgj0e5r03SB2TFn4dPg7zb7NLVO4I8DA0qafgz1fZD4dAJlNvBk/m5kaEj
 kLngEUN3DsN0iJekS50vaiOY/wg10at4hmE70MuFPwdapioInGPATNUnyUqSVlmX7n/P
 fTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxtYdT7tuil2KNSsdqxVZtgL8WILDaWBTN/F2v/nUt8=;
 b=fpDWQz12zW49bigru1JOzHMkLOBZ1j6+6ePChuyQJGaTqyLUltIcBBg81/gMfDbln5
 Qq0UfckT3Jj6dBc8NGBLNvykuJo2FJWogmSN/KqBKoeN2VtWA663VSBJYMt1qMTBzqPC
 2bF72EbxmOVikP3uWDBSHkput+5u4kZvug0nqyytzwZUcdJ+l8Mb/v9iOhVuS5E3j4rs
 nHOfyblgMCCOGYUeEzSrieDSvTqfx7jQgsJJVAQKPEF6sxRbvjGTYJx75OA3kFPnSeEo
 CieF/qb3elh5oL2HUCWIb88vMjqOfdUAXqOlGfAXl+tJCfAziyZx2nxnuIz5ei3fNHIX
 zAuA==
X-Gm-Message-State: AOAM533XVtdqQtKHZGbL3AfUlEkiMZxTzvXK/cYX6OAPRiyyojTdkN30
 lO38RgWNDTMHdaG0ZhzOuifclg==
X-Received: by 2002:a05:622a:58e:: with SMTP id
 c14mr27898798qtb.225.1635788330756; 
 Mon, 01 Nov 2021 10:38:50 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o190sm10202067qka.16.2021.11.01.10.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:38:50 -0700 (PDT)
Subject: Re: [PATCH v2 for-6.2] target/arm: Advertise MVE to gdb when present
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211101160814.5103-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc90c451-c38a-00ce-cc9a-64ce7e1f08c9@linaro.org>
Date: Mon, 1 Nov 2021 13:38:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101160814.5103-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: gdB0Ok6Zbwih

On 11/1/21 12:08 PM, Peter Maydell wrote:
> Cortex-M CPUs with MVE should advertise this fact to gdb, using the
> org.gnu.gdb.arm.m-profile-mve XML feature, which defines the VPR
> register.  Presence of this feature also tells gdb to create
> pseudo-registers Q0..Q7, so we do not need to tell gdb about them
> separately.
> 
> Note that unless you have a very recent GDB that includes this fix:
> http://patches-tcwg.linaro.org/patch/58133/  gdb will mis-print the
> individual fields of the VPR register as zero (but showing the whole
> thing as hex, eg with "print /x $vpr" will give the correct value).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
> Reposting this unchanged except to remove the 'RFC' tag, as
> the gdb patches have now gone upstream and the XML layout is
> therefore finalized.
> ---

Thanks, applied to target-arm.next.


r~
