Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1851318lfc;
        Fri, 28 Aug 2020 16:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3IbdyL0xvIqvrLxh9ymiZSNqs0qHxby6ZRP05aJ424NaNwugr39oEH+1wofdHnR+EQx3G
X-Received: by 2002:a25:c60b:: with SMTP id k11mr5363522ybf.482.1598656127952;
        Fri, 28 Aug 2020 16:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598656127; cv=none;
        d=google.com; s=arc-20160816;
        b=fMCfaHxfmFpMeZMaMJTBjBfsnjKJrNeufbAdwrQ42DjY+eTZS/TRIcf0SG9fQ/xAY3
         hM7O5IiENpeoqmYfZv8p31ClMcy4c34p0jaz2QzzJUWz1yOPiIszRi8FgdEY4je6d55C
         9hDieuCHgjr/EVmkq97pNheKuSrIIDENoXFk6dldbWBz/RbXjY/fUr+mr84nv4dW/1rH
         ChJKqdIKO7312vtO7FDt4xQOOBctQhRnvRPsQ+aEsFvl8T5PtysGXrF4Ls/AUM9Ecj3H
         FzXrFvUF9HpoSvAHcq+tpxiGV+P58UQut15P1WZ+Iaslzcfrrnk/q3RllwSApmVRumlE
         xvmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uJa3ICx2B1uQJg3u48HE9FY4yQe6djaNU5QbKQaRHso=;
        b=zmnBE2EZUieYtaYCFmDlRoIKcfHBCqWlmrYSluJnyrYiObSfn27NH4tL2zDl3CyZ4U
         2w6S6FOiLEgpAWCxwDSBIu1E//tMvBPFSViZEn1qEMSXOgHOATRNtYUqfF1gdGVlKaMe
         CeDqqgHuJy/5Qn7WQ5EGVD174Fw2rUqlKLc6nsuSirEvoS/OBTBPQmkjeGdux7ezKlEb
         S8ydkWs+oAKLbxmGQJgUWceV0Cu4dZFkVdB6pFkuJrHqjNj38p58ZCs61N47RUHF45rE
         mmO9fbLE5vYgnK8pxYunPHAm2b/udA6sTnu1j26gZbs4eCh0cIzu9Q/lMjA0qcidEErK
         7KoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wuwKUllW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si624456ybk.368.2020.08.28.16.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 16:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wuwKUllW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnUF-0001QA-Cv
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 19:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnU9-0001Px-Cc
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:08:41 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnU7-0004UT-P2
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 19:08:41 -0400
Received: by mail-pg1-x541.google.com with SMTP id i10so1139318pgk.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uJa3ICx2B1uQJg3u48HE9FY4yQe6djaNU5QbKQaRHso=;
 b=wuwKUllWIWgvPDAurzjSZVGcy10lipbQbLKmT4RwI4cwVv8j2t23l0M1DXDBeOEfkx
 8wkCIRVjzCeUxZFg3z6SNML+f3Hpg7mSM7drmH8E8/j2GC0248thtFKbf0flPTH+3axX
 erOtX8pS72u1ELtZHBxfKOmFawIReXjhtz3c25szxi79ziVWMfj/zPzyi0ZDjxgw8hDs
 dUNXHtFMVe+UfQU9hhkvGVhKuX3a3YdeLk7JjiqTxw0rK48ZUvmk/mXofPbw0iS4Zavo
 KhbrpljlSMttC5APRwkkCMT6gtiYrVfjJXIZ7q0U2sUU213YkxupsORmuTUTm3AmZcY3
 5mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJa3ICx2B1uQJg3u48HE9FY4yQe6djaNU5QbKQaRHso=;
 b=hzX1O1C7hgxosyZuWsD/MQeQgceXxKoq7ll5fxQupUrRHw7Gtihkmy65lLluUV38oz
 wvdHJG+PFMdYB8+KrAga+xHCj7XGhS85NYdE6wH3oXw6cNvPkRrls/LzYlduJYZqBDcT
 hHbl5f90qetCAk5LY42JRr+Z/DQSotugHDzynIx73VEnico0gXPQiJJI1F2wvNtzi3F5
 Wa0t4ZO+gTHaj26ptn2zC4yADHM+zju36t1FITCz/X69tdCYUYpbej0pgKH6DgTRDjb4
 G1Dx3r+0zcMFDwQuFqguE0k/ep5vaxRU95rKm7ix6LhV5nl3X9fb2XVF1yHUWwzAiQh5
 HfpQ==
X-Gm-Message-State: AOAM531jARCNim0S06L/UxZF5zjNAMC7luc3gESXWEg6k84fDGv5zK9X
 pr3HThZeCUxJVtoz9BIqIwTpnw==
X-Received: by 2002:aa7:96d1:: with SMTP id h17mr1046190pfq.68.1598656118183; 
 Fri, 28 Aug 2020 16:08:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a13sm498125pgn.17.2020.08.28.16.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 16:08:37 -0700 (PDT)
Subject: Re: [PATCH v2 37/45] target/arm: Convert Neon VCVT fixed-point to gvec
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98160666-d11d-89c5-cdc3-bfe125616392@linaro.org>
Date: Fri, 28 Aug 2020 16:08:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QqHMd3J9mscV

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the Neon VCVT float<->fixed-point insns to a
> gvec style, in preparation for adding fp16 support.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  5 +++++
>  target/arm/vec_helper.c         | 20 +++++++++++++++++++
>  target/arm/translate-neon.c.inc | 35 +++++++++++++++++----------------
>  3 files changed, 43 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

