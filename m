Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1013719lfm;
        Fri, 19 Jun 2020 15:48:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYatyhAKnbDjiI+RJ+AWN9oDwsvh7mccK6YZipIWukJQtiPUNFWD6sLxVQGwNEm/cfmYtz
X-Received: by 2002:a25:b511:: with SMTP id p17mr10191178ybj.86.1592606894408;
        Fri, 19 Jun 2020 15:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592606894; cv=none;
        d=google.com; s=arc-20160816;
        b=LsmevBxqdjxU7G2Na3QVtN3JoM6J3ip9hWWWNww6+9FGBEgFB5mL7a8kubFL1Y2x2G
         cJ62j9eOL+Nn1c8x1qWwld8Tdx3qM8vaipSUFDZ4s/i3gWGNvF9JmdGufOIfb6WMCJ3r
         C0gsemx1h0llgT4PJZaJ7onTXJk8RUDxpaPKEvG7152wWX5GGidEH23fBX1g6Nb8vAfM
         JfhB2wJX6wKRqT6/dOmCKmLF5rvgAqDs50vbKugCs5VK1WxOrjII8Ggg+Ze/grKgyYQc
         LSTrNBlvdfD7kksZzu5G9B2WTqcjQ5BazVPpMdR3bT5jlS4C9Mx4jOJskvui0hW+RnLh
         Q0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Fi6CPrs4M+nb/FU/foAhmvlkzzSTg8CGtbvKr3xghu0=;
        b=hOogfOgE+HxhkqUoEew5EH62YOYyabBMUQwoNDzFWvzBV8ZQUbBO3bNARbKZwFGRZg
         hHKqypP2vd8fomboG4HnsiNhmChRtC8MA3XJrvAaiNpfpuiEdmJSN5oNq46MW/AtUGNB
         T0enCnWqUgW2NzGiyRSRtCX/+MN245VOOVHIw0tXdPhUY+LIvTcIDFfFs/rHFc88L/TT
         LvZQS4pM01wE+zZaOb1MVCka62HIKEa92cr2PuEcuZaBtl5ZvGOA3hJocGUGaxB5cut6
         DZAdFzC/YIfA/Vqxyzhi3Bh3BaBgG01HAF+dOzOYtDz8RNG6+jYZwbz5DqAX1fRzk4h4
         EV1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoJ9Ayxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si6005896ybc.70.2020.06.19.15.48.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 15:48:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IoJ9Ayxs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmPnx-0005Tv-PZ
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 18:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPnm-0005Rh-UU
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:48:03 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPnh-00024r-H0
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:48:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id d10so2631246pls.5
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Fi6CPrs4M+nb/FU/foAhmvlkzzSTg8CGtbvKr3xghu0=;
 b=IoJ9AyxsTZWPmX29qRxzqOJgwZ/6I/SFh4YNIa8oKA9EB1wjnk2gDnb2PKV1J6+j+j
 yA0ScjCdyGVweeUS+Far4djHhe+IcL6E9goIoiDlAXErpBuS3N/C0ySaZDe46SHZOF2e
 Z4+FomInrZbzDup3rR73uur1iiPx7rxuuR1DNcVgXhenURIEJQrMDlhcc48JnEjgxkLZ
 8DRVul9Ypag7vKBLeNSmYTbEZ/qpsJaJxZtLNhMbvkRiBxJ8poKVvXON7dSsrIW5Olr9
 RBf5FbiTb4InFUyi7CleS4DvGQnYJfRtb57mABhrqxv5cOJOOx0SWMDD0Fns59gmgmWu
 7KYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fi6CPrs4M+nb/FU/foAhmvlkzzSTg8CGtbvKr3xghu0=;
 b=AA0a/GgGDWK5PdKTB9/g+MHXuFiE8Be34sdL20Ur/RMjBp9zbblNGyat3n4Agc9cGC
 aW9iAKcB/EIvVBSik9G4vw8kWp8+fxsVB7s5ZZYiqog//YWUIC2M1LjTYgxWz86r0Z1V
 iNAC8pOy36gL+vT3xw8c+Xti8X4xge/5qS0q3dOfmy+n4Aj1q5IW9mrRG8+pcTi2lrRg
 zPr6q8TiVxr4Qi7TrC131biX4scPRvMef7EH7u8VyefUD5FZNuB3HqO0dmCMXzfPTfe2
 7bnVi1mc+M8WxBPn+YOfaLJwqA3G9pq049vOnCqP+bVXoOtJHQTEFeySLd47HaQ7OKQk
 2JsQ==
X-Gm-Message-State: AOAM533YZ4fFa4PHl/TodkNLg/XlqyzIx38rShaUYzh+sdL86o4+K+Cc
 tIfUsd9gssUMgJDBDq4d5FlVcg==
X-Received: by 2002:a17:902:8a82:: with SMTP id
 p2mr9580254plo.316.1592606875922; 
 Fri, 19 Jun 2020 15:47:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b4sm6962925pfg.75.2020.06.19.15.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:47:55 -0700 (PDT)
Subject: Re: [PATCH 03/21] target/arm: Convert VZIP, VUZP to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17a26e98-ca88-23a2-6c94-6da06716d69e@linaro.org>
Date: Fri, 19 Jun 2020 15:47:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
X-TUID: ATYm3YxfqGzM

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VZIP and VUZP insns in the 2-reg-misc group to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 ++
>  target/arm/translate-neon.inc.c | 74 ++++++++++++++++++++++++++
>  target/arm/translate.c          | 92 +--------------------------------
>  3 files changed, 79 insertions(+), 90 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

