Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1051267lfm;
        Fri, 19 Jun 2020 16:52:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZixuVBkenORe2WZyegvTzxv9ghdJW8/PMyqQKkHecYI87gTTq8MTgIHWmHw6+ltafa5ij
X-Received: by 2002:a25:ba49:: with SMTP id z9mr9384710ybj.391.1592610736783;
        Fri, 19 Jun 2020 16:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610736; cv=none;
        d=google.com; s=arc-20160816;
        b=hd5NmVmrEqPTe1IhHmeZYLpnI6R4MD0GCdlZILIQn48LMcwfe78Fki+MfHplHtpnO5
         ySdJ8Hpu3hYFnaIVvFGMoSYzv0GsdWJUJlxJAVlpdxQptAwaV1uSCM1qCCSblUZD/550
         qfzT77e6SWca0FbHIlbknoOZuIuw9AmMiLWbQdmVwlIPNHTVwtCCKDxzt0vWHDsrPla9
         /saieCQ55mXyjnxozhk7uEKFxFxad23EIA5pC2eGT+tmlowd+cq0WPQMZVIfcoM95Xbj
         ZirOg6Grpqq0Mwcy07Jh8MXk9WuRVooeTFIVZ2kuGH/b6yE645lvkRXflF1b6E/xqJry
         dwRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xRz6Y/zjuBr5hAYlbSqvWITymCDh6v7bthIplErXgp0=;
        b=hJF1N7AMIHMqRO0IZZ75fo8+S76jlpaBvYlaXt5pPN+LOIEOau8ztDRJd4RHGsKYQ6
         y09j14HF1gozBkj74IH/+vFMV45Sp/M5DNuPHkNgpJUg7VUmobqtiR+mJ89ir/DwwHHO
         XHfcNbwQTfP+1Gb0Njjhh/HIHESIErh1IdY2XGOODpytoXHrJg5qNL32Mnc03pRDlvsj
         L1zkHVVO5UEQRTp8WPbzqKlqn2PqhJ2dUvMyTTBi4FOyoxLMl8CZQk4+ynKfyCMfWwae
         HKpMm2ImL+8bOz3W7gMogHwKuSX6rKE5YQ6Ts6MVtWE/tA76vN7DiBN631tUPdclJ5LQ
         7FKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gBAaFhVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si5954751ybr.60.2020.06.19.16.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gBAaFhVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQnw-0006ak-3X
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQno-0006Zr-0a
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:52:08 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQnm-0003UW-EF
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:52:07 -0400
Received: by mail-pf1-x441.google.com with SMTP id x22so5162690pfn.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xRz6Y/zjuBr5hAYlbSqvWITymCDh6v7bthIplErXgp0=;
 b=gBAaFhVD1rSeAE73sbLBss9wIJYLUrXX/HwBQ88CoOPyv0fKlXdiA00/hiOa8QixKq
 zVXy2wT20QX4EMpwDa0YZWoPuA+V5SpaIU7YUdgZPMYW1+jSGW7oOAzyoM+nftqr/U9l
 GKNt4wbtIEIaWaqwDojpvoOaLgDYIw/9n3CRxmNRWKyBmH8iyhw+i87ULyD/DS9GC5UG
 cbkUxWHCAXiBfasvtmG9jnrtKlhTWp3Frzqm0uemf9I6WpxC+9MJx89uILs2Sx5porRZ
 BDo0f8LCk7i6PcLcdQNTBzKwz9lHmTpWO9BPzVxvOgBqC4Cze2FyVrwFHCavQueLK6WB
 lSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xRz6Y/zjuBr5hAYlbSqvWITymCDh6v7bthIplErXgp0=;
 b=TGcZutwOHg4bzwGEzrZnnb6KkfTk9cX51RcSgX3K2Q6vpZV8ADOPdJsPgVC+/m5uzP
 qEfDRJZc3tihdGpV4u1RkDezblVUwox5yN4+KFk1XZzuCNscT7y0h4rgpCC4J8CjJqJ+
 SUkUjSDDHO/j3I8yutfnN4Qr2/D4y+HAx3IYmaRVtLRuwUuUa47L99EBanVNIGff4E0n
 6VacvSx9n0jNdJy7Puflm9eHPbNU+5u0QEkw1kMzPT+r8gfZ0Sxpo87nS3yL8/4YLTWn
 mBK/lVHjI03JIzzNHgNFMHShBWqN9xV2c2JXCYUdFGVfEZgbv95znD0U+Z/HoIfIVM7K
 lb+A==
X-Gm-Message-State: AOAM531QVMzdT185xlvpEcOSZG7qOTxA17yssCFDH+Mu7+sxLyTnKzXP
 K/AYG9aaZliCcrLnqRlYes6g+Q==
X-Received: by 2002:a05:6a00:1514:: with SMTP id
 q20mr10402430pfu.243.1592610724838; 
 Fri, 19 Jun 2020 16:52:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d25sm5828143pgn.2.2020.06.19.16.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:52:04 -0700 (PDT)
Subject: Re: [PATCH 18/21] target/arm: Convert Neon 2-reg-misc VCVT insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <732d86fc-f6bd-79bd-f06d-4a51784a240a@linaro.org>
Date: Fri, 19 Jun 2020 16:52:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
X-TUID: 5Lso3oCiLtJe

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the VCVT instructions in the 2-reg-misc grouping to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  9 +++++
>  target/arm/translate-neon.inc.c | 70 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 70 ++++-----------------------------
>  3 files changed, 87 insertions(+), 62 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

