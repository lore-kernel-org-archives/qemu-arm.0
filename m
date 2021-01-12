Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3089324lfq;
        Mon, 11 Jan 2021 16:04:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX/lXx8gqNNIMMkJA+locXgEtJ652eH+0IWp2H+qohdnil0R6JzL9LXmm2S0J47GbTQ0aY
X-Received: by 2002:a25:190b:: with SMTP id 11mr3108846ybz.236.1610409893514;
        Mon, 11 Jan 2021 16:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409893; cv=none;
        d=google.com; s=arc-20160816;
        b=nF+aJGSYvPPZ4QmHivBOr+a+aKiXWfO0fcn/zCKddPrDuojUi3YOeCri92I9O6lmm8
         M/VGamDBCxIEeCoNz++2MsN2A5BqeHrqzACVGsD72mK8uMbcBfrDUl4xq89qHBtVWB7Z
         5aprGIEJrvS08fcC9ZtnsqAVxkWAQOo8+0PKxpSzOfNIdf5yxjy0GWrTWpCrGGCiFSJq
         3TVQlNPHBBtIjGXVeWaGDwev5Hgcg6QeErm+SR8K4swZV3TJmQjUax0nb/tv8sFBRam8
         gKL43WMxM17cEPUWyMMh0N/04Yq7Gvo0sdl7SDEEDxroXDdxLaMZ5dkKySpaASgwSuX/
         f6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LJNA0ymU8hi3RERfT9NjYqnA2IoQ4wFCQxB8JLyAW/Q=;
        b=NgBQ3GcxLdTvwhuXrFCoc5o8mSBB04Q/p88CDrS3dN5aeNtOf8SwglRkbd0Oq2kobW
         APGPWTevYYomu5MKfPGeCFosGNnLtWl3HOuQbRKb4Ms/hUyBOuWqHsaKbCFcQsIaPmwW
         FGWwvH+K/bJbcTq5klrsW/AikQlZ+6HHdTcVaGyuPaOMOJEx6J5xPp9GkDQouqK8dCyy
         o0LEVHcws3wR1d9S9iluKygcCei7DA4X38D3F1Fkbd8S9DHbV6ZU5LSYu6+U1ghThDFy
         ciNACayFMGi0wmKzbZCIeABqFSoQAJbF+ny4mzyXg7b42SYB0i3wRtJQB86oQnfLjCGS
         OXSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1q6X9dS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s95si1497447ybi.54.2021.01.11.16.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1q6X9dS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7B6-000479-S3
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Ar-00044t-4I
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:04:37 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7Ap-0004AA-HU
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:04:36 -0500
Received: by mail-pj1-x1031.google.com with SMTP id iq13so508775pjb.3
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 16:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LJNA0ymU8hi3RERfT9NjYqnA2IoQ4wFCQxB8JLyAW/Q=;
 b=M1q6X9dSodIo6VLP26CmHfkuNU2smANxSU/9Z9xJNiKUhnaWDjT0LllzRfsm89/Q/w
 9AQXQzTyyoB1JQ0gXebFAvTeEdBZc/mwrBkW1SJN72h3HU8eksdvhXaoVT2nHVpeH14v
 9vEYBD1rqSBUjOttPVNtg6ZY+xrjjWYSCGuWRUFTCWVDVtixEX/yEI7vGiHbakp9QPUl
 twzK5TipXTlfq16q9TUDPTYnYXB+dIi04qan37y0Nm+4TRiwsTdj9J5L2aDKiMlRXy6q
 EcVnA1U6/Q/flG4helwSHvSzm2qXdsK09mG5t55IRcnr0RSHHIYPQpJzbjtjG4wjy2CX
 Rr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LJNA0ymU8hi3RERfT9NjYqnA2IoQ4wFCQxB8JLyAW/Q=;
 b=c9lxmLusVAx3pVaUHGjz2vo5CfATmFFnSwULWfuhgI0xhiVBARQOGyolpVnwItCmkz
 aJYqYwftrgL7mSK+w8ub3pHcOC9JgW7bAgBNXPq1NvI3u/4CsOlrrLTGHJkMIcU/TSh8
 KEwem+sApeX0ymtJ+HmN5yGUf25AoUSvZEbaq5lnqza7EviGw8NaLtShahv6PG2bQIWU
 VOIm3zJzAmvMtkpzx0ZcaCutwdtnl6rXWNKjYQuxBm1bbpHX3fI63k0lFag2GhoRsDaN
 bQErOPEFiuqaimYEHebh3Y6Vn8W1olq810dLUpzji/q5OlFkdqi0P480KF78QbAcjkBe
 TegA==
X-Gm-Message-State: AOAM533pFD03tnfLAwGsEsyK5+iCfasm992/52B1NCGkFhMPcP8gl5qI
 m5zYo3kF6MeFS4iKJif3erEJkQ==
X-Received: by 2002:a17:90a:414d:: with SMTP id
 m13mr1398726pjg.229.1610409874174; 
 Mon, 11 Jan 2021 16:04:34 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i10sm924251pgt.85.2021.01.11.16.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:04:33 -0800 (PST)
Subject: Re: [PATCH 07/18] target/arm: add 64-bit S-EL2 to EL exception table
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-7-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e1eec7e-35de-4276-68ec-7e12cb73a699@linaro.org>
Date: Mon, 11 Jan 2021 14:04:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-7-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2zX82i0gapv

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> With the ARMv8.4-SEL2 extension, EL2 is a legal exception level in
> secure mode, though it can only be AArch64.
> 
> This patch adds the target EL for exceptions from 64-bit S-EL2.
> 
> It also fixes the target EL to EL2 when HCR.{A,F,I}MO are set in secure
> mode. Those values were never used in practice as the effective value of
> HCR was always 0 in secure mode.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c    | 10 +++++-----
>  target/arm/op_helper.c |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

At some point I think it would be worthwhile to convert that target_el_table
back to code.  It is really hard to follow with 6 indicies.  Not your fault.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
