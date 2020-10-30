Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1810120lfa;
        Fri, 30 Oct 2020 11:56:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTpgYFWThNA8IhXqyXIRxrLM/H7CrPW9rXKETSyzATpEeIg0QreJO/EsohG0flfBYZu+5+
X-Received: by 2002:ac8:6f53:: with SMTP id n19mr3566420qtv.282.1604084168578;
        Fri, 30 Oct 2020 11:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604084168; cv=none;
        d=google.com; s=arc-20160816;
        b=KOd4SFz+ka2XN7QrNNnJ5XL4G8MFt/g7bwljbwBis3A9PrRPEm+JJ7rdh1L4S7XqD1
         gMq9hY0No5KJqTkncMrniKcXJcg8F+k5xMkQ/LcC+hzeP1qRqh7b2cCYqnwLQ09DvwwQ
         RYNKWaaCE9jZcLtzH7M/pIWUbEk9XOu1XBZvnaw/uGjeoMOhwVODlbftt8nYsMwSE46G
         X3fNMfTMekfl88lRaeoFj6RMwgPm3OPT2ypVAFL7YGap6NPsfxHHiGDNaCjMQC9H+eIl
         EyYHYa6S9EN7XNCHHdvdTJ8STLcFl16OiGGd4qLF3LjhmsfB0i/IAZ0qZLvR4KB/eW8K
         c9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n5WsTISRTCQIvpp4LSM8XKauaw2iY7A6sH8JLSVOCgw=;
        b=PAgNSDrKeJls0YRlBFHymDNCa0Y+s/njfqmk5FyYcfy0ivTU1KpwvBwP/JLuZlkcIn
         SnLRnqM/43uueQIGZUithnE4BE80oWOPq2hJXalLrXllElFA+adLvSoIUq1S6Hu8iXOn
         TCuMYx+dfaenrkjojBODPM6YxuC/8BuePcdFzn+F8Hj/s197XJH+LmcaDRP8t8rwixLv
         u10Vcp9/kHxtw46SDXpDlBBA5VU/J+OYOha+JRm+YywaZFgDygOlK77sfcvhnCUoGb15
         9W7mYa/BOCkTaJGCXDL/8ddr94DV4DB5oD1/SJPfakUkmXaLfubwW0fsU3iSUgbXiXSf
         s2AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToEUVQ5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z48si2739216qtz.26.2020.10.30.11.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 11:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ToEUVQ5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYZZH-0001P8-VZ
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 14:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZZ9-0001Or-9V
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 14:55:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kYZZ7-0002lk-ID
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 14:55:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id w21so6080947pfc.7
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n5WsTISRTCQIvpp4LSM8XKauaw2iY7A6sH8JLSVOCgw=;
 b=ToEUVQ5dxeYZwp1pDiybfaLNVLavjPASlBeyqe6e+sGnlaQ75Bb6878y9qZ2WWpgRK
 DZHG+VnG6dM22ocxm6TBMcJks4U0oRcvbfiH8Xze4xCHjBdqLNGiX5WAXAnkN1xnppnX
 geUfmMg+bmmYWycAdPV2IVLkEYThCmb7WHTCVP/r9BEVzNaIiNGUN5Y+5+f6rRQdmx2c
 MWPR2FW9ZT/tmgNhvhVyzaQvYn+zvKP3J6ph82pIJsIBKwVf6hGXzGKsxC4UtjSZq9Rw
 Xr+VZF8S8fqE2+gFPW3bwXiws1OOH6gHmaT9P05mD9UspnZX53VaVgLs8hagQQPM2pPa
 whKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n5WsTISRTCQIvpp4LSM8XKauaw2iY7A6sH8JLSVOCgw=;
 b=IWS+ZPua05UgRnTS0dseum7tjbovB4STBl94/GbOXVs4LBL9YAVGl2kQ7dIS4F71oa
 nEikWO4h5ityKljOJ3c3az7ngUwS5Z2lLgTx4bFXZRROF1KpmMvsmkFuxPnUDQwnmYl+
 a8vAxad902stHEMNUtP6euRarwaliJgU8LNMyegzE6Qq3y5grsYkQCos6VCgjGocS6xc
 uQfRBPR5Leg5YrJKwiWq4BNc8kxuynzES2ZXX6Wq5fMqmNPgFKtPZvX+9l0WUr5M/FE6
 MGjFtR3jZziLiBkcOgIt4n7hvryjR8nrMWEccrYomKEeFgeuT9L1ixApvf2FALoO0Pdc
 V4yA==
X-Gm-Message-State: AOAM532yA5Wd7g4tT1bE31G4RoqeMRufSyhXB4dhNlFBfZMkSFEW5X94
 oA7mTdAq9fLpA6xzXrb+gIXtFw==
X-Received: by 2002:a63:140b:: with SMTP id u11mr1852956pgl.248.1604084156108; 
 Fri, 30 Oct 2020 11:55:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t10sm4244148pjr.37.2020.10.30.11.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:55:54 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/boot: fix SVE for EL3 direct kernel boot
To: remi@remlab.net, qemu-arm@nongnu.org
References: <20201030151541.11976-1-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6066544-a259-9739-3acd-2d9abc2d7455@linaro.org>
Date: Fri, 30 Oct 2020 11:55:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030151541.11976-1-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-TUID: ake0NRPcNpP4

On 10/30/20 8:15 AM, remi@remlab.net wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> When booting a CPU with EL3 using the -kernel flag, set up CPTR_EL3 so
> that SVE will not trap to EL3.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  hw/arm/boot.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
