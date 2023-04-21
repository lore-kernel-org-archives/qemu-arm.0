Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1447523ejm;
        Fri, 21 Apr 2023 15:30:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnA+4vvQzCTF0qbpI6h9ksIbptP2qWQRJr1/c1DaaxOBKvoLjCK/z2KhBCgvX1H98bnJKr
X-Received: by 2002:a05:6214:b64:b0:5e0:63ec:5d79 with SMTP id ey4-20020a0562140b6400b005e063ec5d79mr13432975qvb.37.1682116222677;
        Fri, 21 Apr 2023 15:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682116222; cv=none;
        d=google.com; s=arc-20160816;
        b=XyjfPfW8mMm+PQeq1o35HEAqpKOc3W6r4txhDGGiOdlPoQzOlvQcaHjxw5+kJcc8bl
         hwr2DecR7V7jzUn8ruiDE8jeD289+4nEeXPGg1Fl68t6vi4t464E5xFXZt9yAKdAtPeM
         4xwbar5XQiMsC1mWKuWrCMJpXTDAXrq3dnEA+Dg423IhHcAqEJ/abd5/gO6QyWRb+EzC
         Ly8UeukGF79YVqM4tkcFfEUGLKlksmyA81S5E5yZqMP1YUVrAJ4cYNEAr7qUAzK6l1tT
         oPeSUC+DYIOoq/+0FrKzhe4U6yfooZnagcI+hrjt79w3NNN6ZKD+mqZylxo+RJblhaZt
         uqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=472OONecVWosuY1vgDCjKtAxingjuVZ3GNaTf/9T0tM=;
        b=XH7yyPGyu7udBFE+3xidmltC+GK/Wa8Wmgldaz2boqMLUmd4tJS6iBpdP7FEZrssD9
         fNX8pA2pNDF74yZiVXKotXaPvosq2ve9ANTBwNwIYByodXa0l5Y1w8lP7sWfSnYuz6pX
         cLDH7CKgZsqkc8TLvcKPZ63VjMoXe5Y3Lf43/9XipjnYYmg1x7/Xh5hdcmPh5by0Adne
         xLpaFq2TeEEB+X/WR62r7DiPpxXelIHMji/vFZwQRaalEqjDtetvjdDqSqH5EHKsUOFG
         fZWfYh01iOUql9bsRqjx8eBe3B/pyzphI//1PxdyqsSaio4pHjMG40zLkIFAQB5wmdog
         ZTsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+cny+0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo6-20020ad45946000000b005c8dd7a8bd1si3649192qvb.543.2023.04.21.15.30.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z+cny+0y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzGY-0003Qa-Qr; Fri, 21 Apr 2023 18:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzGQ-0003Ok-8k
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:29:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzGN-0006Qp-O7
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:29:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1763ee85bso22714135e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116194; x=1684708194;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=472OONecVWosuY1vgDCjKtAxingjuVZ3GNaTf/9T0tM=;
 b=Z+cny+0yqi8sN6yxWE4j47BVtDqCi6hN/fIaHxQzPy/+7cpVoOnnIMGPJWXlZee0yk
 s8x+0hr23pyZKgF0YhSir9qYp4j2nIbt+lXQLDgpItbQDGGB0Jid5cEebwBevlskU0fD
 Uic4HFTzSI/gJvvwJVJJaI0CeK5RK4SxwRm4rixlS0Qug4S1kZiX0YPHCp1NAja3uhoz
 9uHuoJ8RHAagYgr8FVEppJOk/ihrHS8grtK7l9d3ufRsbu8uxoD08RkQrwystjOZVFAD
 a3TMIEN5hNAl5F2WqU3Q8DSIVFq27lC7ldb+eNdn27bx/3z1iju6Ii2Azxrc/iyv/gNE
 98AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116194; x=1684708194;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=472OONecVWosuY1vgDCjKtAxingjuVZ3GNaTf/9T0tM=;
 b=YEUrgVvVIUEK8J0IvJreL83AkFBleCoLG9U6X1lFRujht3FwtTvECOD1JmQM5T/f0q
 E2JPGmexiX4YgUWRx4jdy2BpXfmf6sQgqVN073YrD91qDZgbC+MyvdULkf2E0enTleZC
 hP5LfFrHmbGFNmMezSSX8RoIkOZvipZMMgi8L3LJ1GN6f6CtdSxDJ/MwkP7qbQkY9QYU
 Y+Lu5UKga+5dgAyinV1jSWn91golztPOvjLdk76G2AlKcdaupJ85afjI42Ho1dqSQccf
 +EBhfMfRI+0eZRdWOCptMPq0cRr3YHlkrDdwwG3xiHeIF84Zl4SAAJZJLGGvXa44+/Q8
 NZrg==
X-Gm-Message-State: AAQBX9fKuZlqElc54aYaxMZ4k3x859ZAzgABEjeWj++HPNznzypoK17b
 q8/1yELQ2ljE03TSM/2fM317lg==
X-Received: by 2002:a05:600c:2194:b0:3f1:72ec:4009 with SMTP id
 e20-20020a05600c219400b003f172ec4009mr3148939wme.9.1682116194055; 
 Fri, 21 Apr 2023 15:29:54 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002febc543c40sm5264466wrm.82.2023.04.21.15.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:29:53 -0700 (PDT)
Message-ID: <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
Date: Sat, 22 Apr 2023 00:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r3p3lxJiF85v

On 11/4/23 03:04, Richard Henderson wrote:
> This will shortly be used by sparc64 without also using
> TCG_TARGET_NEED_LDST_LABELS.

Is that in this series?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c          | 13 +++++++++++++
>   tcg/tcg-ldst.c.inc | 14 --------------
>   2 files changed, 13 insertions(+), 14 deletions(-)

