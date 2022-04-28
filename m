Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1641190lfu;
        Thu, 28 Apr 2022 04:05:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXmCnaZiw1QQhuuQ5m/RYlZsebCGKeR8yrf3oJSX4NRyWW8dw9DEtZOfi8UeFm7jXQKUba
X-Received: by 2002:a05:620a:4451:b0:69e:c6a0:7506 with SMTP id w17-20020a05620a445100b0069ec6a07506mr18920002qkp.313.1651143916154;
        Thu, 28 Apr 2022 04:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143916; cv=none;
        d=google.com; s=arc-20160816;
        b=gEVs2QCW2sZzTHoxq+iH4aE9m2AuI0aik60oKkT9lYaXbipsdG0shniTboTw2yH8K9
         xHaGAI1qyuKar3pUNAg8Nsyfgh2nOruqDcHFUGbUTVR2eoVXcGaS175puAS2t1Nj/NZs
         M2iTUIjJanB8dywQDj7ykh/2Rqf5etxxXqYliEQAr2A39rv2Sw3OYkJ9DE2rM7CAocTn
         MALh3LEt2T6zUK6L/bNob3L3HXwDnk4/0iD6fgG8lfOjYHKBKKOf/UmOs2d6LMbt4hqR
         X9MwTTfbQzwSAfmv3LH8SQ4aAeehkxwD+l4dgJD5b6IkSebKCvKmvj01zt/VM4Nt1BRA
         /3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PxxqO1XObLqrUoyugL9zG30slpAuqlB7rv9B15JIUxM=;
        b=cfHSBEpQMrXE/JDMyd/OLn14YPJFQYkHfd8htdKiZoVyLsFwO9Q7d35TtLXSeHORmH
         CPTlvS5/xXMBrSfGpgFpjJGGfhLaBuar0hu5ytGVt+6/A2DJA/SEYlidN0rSwhn9l2rm
         CiSKuS/CZh+HzYl/hQHc38sKTXwu8AGFYsUrPSgpaWb+7HN3/aQ9kDAnmgZq+YvbOjqb
         ZhfJC+0cyllIJMFAGKqcw9facXb8WeliLpXwup3u2fnA5V5aiXp7aJITC4zWMHFHNtzX
         ft9jg07guZf2K/92dtRTDEysl7mHBFafvOb7XTK/cRU/43pvI5bD37R9Y0pdU65U6M5E
         /0ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NkYGeLtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020a05622a054c00b002f383a72ec8si1410714qtx.71.2022.04.28.04.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 04:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NkYGeLtY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1xT-0006Cq-Kd
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 07:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Na-0000Lb-MY
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:28:10 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1NV-0007JF-Sf
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:28:09 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7ca2ce255so47506547b3.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxxqO1XObLqrUoyugL9zG30slpAuqlB7rv9B15JIUxM=;
 b=NkYGeLtY6mTdv+1wLirLuVv4T/ILcxCbtEUd50TiSS5PiktB10in7vXFrChndduRiy
 csQDZcnfu+OrDXfUThdmubqV1xRLGoLZMaxM4iyXTW6k4Ig1SGPqs4nzDu5Rkm7jQZYD
 FhMYqy5MS8THnvu9rNJstkLdqpEXKNabImU4lYqtSAAU+pKqltYdupYRR6yE8t+dGPwj
 5zT2uLcSHLnpZ31jkEEHvDNWguryYOru668nT4tgNv6nlIVMBSBdcuV2M33H7snJXQ5R
 ZVQnA06Puyv7ndLjnayihBXmsAaWHRlGL4i8AWeuEyFkyyV2unDO0GgHPxdiKcbasQ0r
 DH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxxqO1XObLqrUoyugL9zG30slpAuqlB7rv9B15JIUxM=;
 b=lo5EgKsx2jlrxCglIsEvA0V3OqL63w1WMag2/k6+A799bQtMSrnrKw0m8sNhGTIauU
 ppTn44Ijuc+6km8Nnd4vL4hIrZWtoTgiSLxJG/fxo30WcERqJ8bTw+zxhHPyPkdPTAO3
 wyr1wQhKYE9KNQS4kO+kGAVYxg+qtwhkFCK7RZ+klQaIfEKEC798isPZpu7nhYii4rPw
 n2UicekO/snvPxvv5OPC32gftjPauAIUUQKZ4FXFD2KSEzMKK2BDAvPQTgt40MrvtlaK
 OTCXRnDBNuPmWKg+zR2FYLRtOF39zuEi+ubk4huS/BEaT4Eipdk7gatrDsRml/vRZbjT
 DYvQ==
X-Gm-Message-State: AOAM530p1mIUnj5/KWe4DlT2bPXNMdXagwwtm7kgsuL+Dfh5U2+rjzZ0
 O9cMJBlvy2rwXj4t97r+lPJ5STjMC9Df72xetjj4xw==
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31780946ywj.329.1651141684979; Thu, 28
 Apr 2022 03:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-27-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:27:53 +0100
Message-ID: <CAFEAcA8U4Gi3FyETZaQXfQdAX80PDYX_6XwmOPegoNGqNomz1g@mail.gmail.com>
Subject: Re: [PATCH 26/47] target/arm: Use tcg_constant for do_coproc_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: RnTTGp1enT+/

On Tue, 26 Apr 2022 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 43 +++++++++++++-----------------------------
>  1 file changed, 13 insertions(+), 30 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
