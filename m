Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp580553lfk;
        Thu, 21 Apr 2022 12:10:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9EtB6nGEehl3lpy5ZAy1vnN7ZCw68CTEnFIjWXCVVs7DmmjI2CwmtYGTIxAeZli5Xg953
X-Received: by 2002:a81:2185:0:b0:2f1:de50:5ecb with SMTP id h127-20020a812185000000b002f1de505ecbmr1330226ywh.40.1650568216284;
        Thu, 21 Apr 2022 12:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568216; cv=none;
        d=google.com; s=arc-20160816;
        b=ZofRlqI9VhtaFqEZZPhcAHNgxvUJ5ic3j9yjdW+qkLA1mcQDRsUtpRx//ieIP99JgJ
         rdO/+7ZfnHtkZ9OtOR7N4zrR/8iqWeCVquVWDTpGZ/Db5+6pqF/b5Yaa6/wzV52iyOlX
         bN8Vx9L8b9OvJFlK02UbVtafK6aQ0Ob7Otrt35GXOGgP7pi5HiFtTVepuTnoECheuqCj
         Rscd4KX0WINKvUVwyQq+MfNT8Nj3iyyOpFukf5MfyC8MUmtDbHWtRhavBqzsC9WKu+uN
         uCrzbWtsAt476SYoQ7eJ0c1WJF5WPZplh8zvk+J9yjjNfbRzQhq8u23c9tGnSEkokuU1
         milA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KiZfIo2U4alUC+pZmajN1wzad9oCLiAF0iFsdhuYDs=;
        b=G8M/LhaTkITyPMEgHVSKJjTptVZWsYcu3mDdwijXaYV7uRpUiSnBVeyPw/5gNMxGx6
         R8jZ8BHMAjnzceQSkl4AgmpgL/siFWqk6XBwvbuHkJwGLDPsZHib2rIKmBncVYkcdrfH
         s6Nq5fffRz/buQ8uXbhEBPneaUfRLKqrVTLtA5Q7NOjCPF4Smcf/yjDhWfWKgGnxgASQ
         wo1OAnPYR+Ky7go7IW6ud4w6QERkDQTCdNSiffaYDibyeuqgtHXdWkdF8ChVYiuCcyU8
         LIXsgaL8NvygzCM/KKmzKNjOp8RJW44JTMemr1kKl9HxqZQg4BXKtmla/jKSwa58LicU
         XhfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRfi98rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23-20020a815517000000b002f4c964a47fsi3235552ywb.320.2022.04.21.12.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRfi98rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcBz-0005Uh-LW
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc9u-0002PS-5g
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:08:06 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc9s-00021D-Kq
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:08:05 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x9so3340250ybe.11
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7KiZfIo2U4alUC+pZmajN1wzad9oCLiAF0iFsdhuYDs=;
 b=pRfi98rP22f0OT9xb+AaKE8X/mOBasi35OczLzvKJW9+89gshDza2jGhPDx5558vIM
 u4q0cMo6pNRf2NcgKRJFtHb7NXBHAHzcwwWJDD27uk4zlg6WqgSeRnq2bLL+E8i0ZRCX
 L4/c4+lpoIeSQgzim+7x5d+f+B/JFu7XJoNHw5Vnads0A4hteetbq7t09/6HsbC8BNUR
 S+zG9c36WabmuEO+eQg6Ez0HYzLOfFIrXSwaTo1/W8greSFZYYe+gylH3Upd08L00uFf
 8FEQHIeBY3yq07v8pXlxlE2ulPcg4zZ9wtOocp6nSCKj2KYBBSpB8GLsfvpWGavjv4o+
 XbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KiZfIo2U4alUC+pZmajN1wzad9oCLiAF0iFsdhuYDs=;
 b=3o8hLm1cwA2QrO+wuXWeUpXlscJBf8K4YwEOUsYTdYQ+nO51KlxQOPzcgWRBmtzEF+
 xyLKbrkBu5PxLYBb/6TufUbC5IvxLM6yfVo756IC4q/C31C72tt7RaiiaudrBkuGYeVP
 GQTJNM1UYjqriT22NMpyd78nk4oiycTFTNyfPOSB73cW829dQP9hF9snnlcZKnqwIWhL
 zN9OlV5RWbrs6TP1dsvwpCjEn5GjGLa6sRZ16pObMwfZ3z9z0BxyW01Du0NZdUQ5x2oT
 AoU3LX4cRon78p4zWXdG3cDMfIV92pgvDafG759OHImANRZj79/uo5Fb81tfojFgyV6c
 2Xog==
X-Gm-Message-State: AOAM532oT8/Ib0rzvWbRjFRTew5yV86dG5D3nvOntuwfJADl9KMOWc8S
 SuPhkLa/lV94f2v9KyFAuXfo3T5dkz12KjMVAAiMWg==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1197426ybq.67.1650568083341; Thu, 21 Apr
 2022 12:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-21-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:07:52 +0100
Message-ID: <CAFEAcA_2kdY3uo=H7Y66oOMKV-c6A+ah8Kh-ok1-KNJ9Q6UFYQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/60] target/arm: Use smin/smax for do_sat_addsub_32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LX+sAbygmlY4

On Sun, 17 Apr 2022 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The operation we're performing with the movcond
> is either min/max depending on cond -- simplify.
> Use tcg_constant_i64 while we're at it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
