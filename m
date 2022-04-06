Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp710606lfu;
        Wed, 6 Apr 2022 06:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuKhoWapbWk+OIQWeNjEi6+vrbQoQTwdWd7jRkZHZg8Jc3hRGX9/nuRi9Lm30bO4921xEE
X-Received: by 2002:ad4:5bcc:0:b0:443:8d8d:8340 with SMTP id t12-20020ad45bcc000000b004438d8d8340mr7528838qvt.27.1649252857312;
        Wed, 06 Apr 2022 06:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649252857; cv=none;
        d=google.com; s=arc-20160816;
        b=wROY/g9/eUTmNZwV4UsWksr0a7tkiYx9q965Eq2sU/CElzUWuI/IfUE5ooJwib7Cb+
         Il2ctMTa4KuSjevy6MfdkSVvzuZ8aEkefZQVOBMppNWCxBzkxk/cOVJlAhcBrroCjP9V
         v7z7uRbjj6/ubuUVArzuw81mVjR6Wg5qbyzykon+6xukXRgZ6AHC85UaOkk3qhiIr5De
         AOGWSEZMXz/luStnvyP9QkG5zzvUVjA/GnWNb5OyZAOU9ZlCaHx/jy1OMFqBBOyp34J8
         BUmLLXed5YhkKmzaBQtytcA4UP3/qzULCvYgQO17yW9WUPROKj4vxFG1ZvUGu2pdobfx
         zcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=cWOjChsKc+caA4Aog3n5qoCEdt3BhXmG/WMTNFBIIVE=;
        b=LnoF88PIOF5PhDa1iZoMy/UYIrr6gtoOGxG6DCbdEkp/8oH5c1OwxmCwk+i5UQGbgl
         AUwVP0pcrw5bIErP1ZEykq44Xh0Ut6n+q05wCsWEuOE97CX99JxCjOi8PoiFOg3Xk7kD
         KuTWfQSoqu7LlB18hm0pUcHQWM+n93RFneGxo7wIANOm5gUPH+frQro5RotcVGByeDJg
         oDhY7Jj2IRTeYhEH7p/cJMJNv0pLq728WTN6FX7cjGk3xKCBYfgdQpFF1hoqptIJWmID
         sAu0M6l9LGajoBcFwH24wxBkdIh719VI84TMeZYEiRBjFZt4PUBKHcdZoOeCo1kN64eC
         DUsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TiZhejnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc14-20020a056214230e00b00443f25c613csi1757957qvb.524.2022.04.06.06.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 06:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TiZhejnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nc60W-0007ph-Qm
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 09:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc60J-0007n6-QB
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:47:23 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:40676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc60I-0002b6-84
 for qemu-arm@nongnu.org; Wed, 06 Apr 2022 09:47:23 -0400
Received: by mail-qt1-x835.google.com with SMTP id i4so4297599qti.7
 for <qemu-arm@nongnu.org>; Wed, 06 Apr 2022 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cWOjChsKc+caA4Aog3n5qoCEdt3BhXmG/WMTNFBIIVE=;
 b=TiZhejnZ5GLuRUUZZ9KrQ88oQuzBNbjtzlebtWDC5Vper8qe8FUEKVqbKIx7vsWeEx
 ZtHJLEPUgnUoRZfGV2QliFJEGZvKlx918UlmyQeNK1KAYlzcEY+ZCTPEFSgMnsLpxVVG
 jn6rapo6nPQn5iRfpCDxhAFckWJ5+4DMcEh+PJjITOPpGknkmqv8RF2b6zxo9FgILmSh
 MkY5e3YCnepQTzVFCEZwISxfz93BMn6IcXrTdJexgp0BOH6yivmFHSSwvjJ9nvPEorwi
 o7F93Fes6zmuLy0vA2OM9wueo1A3KqtUh/58eoE1D+J2PjHhnRhBklUc9oHJA4s3/S3s
 lcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cWOjChsKc+caA4Aog3n5qoCEdt3BhXmG/WMTNFBIIVE=;
 b=TsCD/MxTZbLexkTmXU/P9I9gVUS2vLAHyuUFqStMw4b8upC4otYN7l2SvizEIHkFYx
 WIFexZgth+p+dN0vNCariBCOT8f3Mx/mgH0t+ogboMAiAhj4KCR3/9aj+3bnl9u+zaZV
 K5oIQAUP5NzgC1qSxG7zbIr80F4dRJ1QWR9mU4pJXomKJU1Pre/mSEp67JSH6ZjF6mWI
 tkadJFr6KsnJNX5ZLWCxv+jLcIGlHhzfonNXtEPvvf3yu5cESR4WFoYLMSJJW+m4OliD
 9onwGTK1f51Gro/yMmNhnWvN/fQH6paBMyjwoDOAy6g1wvADlXpehSRPKqmUKsu4MtaU
 sHDQ==
X-Gm-Message-State: AOAM531AMIsd40AatL3JhM1GTELJZtjE9K2FdylAXk6BTbWz+Np7S0R4
 sWo1KPuKcJE5ZMOBxNXHcR4UFg==
X-Received: by 2002:a37:644f:0:b0:67d:1717:6338 with SMTP id
 y76-20020a37644f000000b0067d17176338mr5617623qkb.389.1649252841132; 
 Wed, 06 Apr 2022 06:47:21 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05622a14cb00b002e1fd9dce3dsm13459453qtx.60.2022.04.06.06.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:47:20 -0700 (PDT)
Message-ID: <574f442e-4dc3-d035-f928-de42d4eeff18@linaro.org>
Date: Wed, 6 Apr 2022 08:47:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 06/18] hw/arm/exynos4210: Fix code style nit in
 combiner_grp_to_gic_id[]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKswC/S4wOxe

On 4/4/22 10:46, Peter Maydell wrote:
> Fix a missing set of spaces around '-' in the definition of
> combiner_grp_to_gic_id[]. We're about to move this code, so
> fix the style issue first to keep checkpatch happy with the
> code-motion patch.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/exynos4210_gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
