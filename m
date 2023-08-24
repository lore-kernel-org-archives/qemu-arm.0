Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp817311ejc;
        Thu, 24 Aug 2023 09:19:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm3zHKfaHcWuzw2vuLN/UfonxEqh+qWXp52wLJmfQQXvtvwY9lYFOFPp/KcEB8rBlTl0Kn
X-Received: by 2002:ac8:5b14:0:b0:403:a262:7751 with SMTP id m20-20020ac85b14000000b00403a2627751mr20847806qtw.12.1692893981388;
        Thu, 24 Aug 2023 09:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692893981; cv=none;
        d=google.com; s=arc-20160816;
        b=N2jSyClrufhywxXOKTYZ4NsIbMFLuEytXWVRDW0CYZj7giS4n1cmireEXFdbXDb49j
         LYuIWWnvYd81lilqL7tCJ9FmzPZVZNQ5VRMrW3gtbr8m23Wq7PCaLNX7PLBDg5gTEE+6
         HC98Fa51lez6+YagiMA2WSzHfXRuowbT6i5CKyhPQe4AKpITHu8hQO+lam2cJT14w9LV
         IkS0okH9hv7f/Nen1YGQXudiKwIT0mXbooVmZgfUZeVP9lUrh51d/pY45jWxTOFhnkCp
         8zktMjGhSJktqnzW0ZEx9JWgpM8UeD8XJeXqcKo3G3CU6nnAHUEPl76f9KFsvt30JAQ1
         ZlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eaqahD3Pv/BaTH4xQ70BxCZK0BBJwVqOquZQEtuY+00=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=Q7hTEmYmbW9J9oDjnMd0DN8UQTds+C2J5UtpgswMYZZLAn42eipriTty39lWpjdM78
         rnMsYog3AfU9CCS2TaOAqESPX7WtFvFsAS1TEPhLuUGkZnfj+vtZ5GQgL+ugFwi/qLMp
         kmpep8sXan+Bkgf6rV2aPZ+l1JVpL0HRQjI4MY1egXHJc3q1LuM8O7jC3iSIMD17ij3D
         Mr7TsklnEH8fFq2+eenob7N/HIj4SrQTL5/CYONbg1d0sAYQ/PgVeFFJG5ju91FBrBoM
         VGYHWdAzovs2aDOSAbmgLP1z9FtceSdtoN48HeM23lVGHVpgxTDxIrbgSPrI/un75VcB
         Hx9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EG6N+hsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a138f00b00403ed9ef130si8615243qtk.516.2023.08.24.09.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 09:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EG6N+hsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZD3L-00074I-8b; Thu, 24 Aug 2023 12:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZD3K-000742-Io
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:19:22 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZD3I-00046X-As
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 12:19:22 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so1739551e87.0
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692893958; x=1693498758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eaqahD3Pv/BaTH4xQ70BxCZK0BBJwVqOquZQEtuY+00=;
 b=EG6N+hscK8lTHXeKccxaL0V3BHBxze5TgTnWu8oVQqthFKTWkLqHwzUtsNiDlLnVBK
 ohNKkCRRuiCnTG1orSrNVGZIL6oR0P48czsO+o6cRBZOARJGWwJd77amp8bmqH7+CNYU
 mOHi3XPOJDijZEbrMHUO8BFFGXHgMjxokvuXYuKL+rg36c7uNr8CxvXiRRh4cySUhpyx
 FqBhluEYq9YkKoBfzVSs4EDFVfPz4OilwcTwsoCVULaSYPfHREWLA2qBd2h0KprphVWu
 m5t7ZV426aaicIV0J058tMLeZ1LY/OdhNihn511NFfIkETiIDItSt9CVg8esNxaBavgZ
 JhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692893958; x=1693498758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eaqahD3Pv/BaTH4xQ70BxCZK0BBJwVqOquZQEtuY+00=;
 b=Ad2zNsBJHk9+YnxV6w4Mo3npopWvsX6qudtV3XFIGfMb0Q07whhHHo7dSul0q26ufD
 Vgtyx3N01yTLhgwfLwIbWc+Er6m/GuHL1sU3TXxYtRFeTwK86gXOYrXI+65IJD+ltbro
 nZltuu9gTkN4aof6zUUbn5EqTCab3+QmOz6Cj4x+euMtml8hOZK4rrWMm3Ff9+m9VhyQ
 8Byw7CmPS74r4J6I9A3GxJwmVDCo7VQjOeGv5HDAh1dUUaCDOgsYXjQClsGOLPpLvfB6
 rae8tl18j4eFdHUu12obaEMOYRrmY42kUrCxySK7bZGpRR7Y2TaTVA7pGn9IzCqc5k2H
 Qo8Q==
X-Gm-Message-State: AOJu0YyLMxB/d5XUAAh8R3zficiXhB5C11Tzm6mdOaHquxvT9Ihe6BSW
 UiC6V2j3Hk7VJRxZN0JMl0S8AxJ8v5jTDFeZPDHWFg==
X-Received: by 2002:a19:e001:0:b0:500:a2d0:51ba with SMTP id
 x1-20020a19e001000000b00500a2d051bamr1038373lfg.44.1692893958317; Thu, 24 Aug
 2023 09:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-11-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 17:19:07 +0100
Message-ID: <CAFEAcA9MMyV2zb5WPETyWokFU-tBNbFKhqHiESRWvWB5qK5nVg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] target/arm: Implement FEAT_HPDS2 as a no-op
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hoWVpo23PX5E

On Fri, 11 Aug 2023 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature allows the operating system to set TCR_ELx.HWU*
> to allow the implementation to use the PBHA bits from the
> block and page descriptors for for IMPLEMENTATION DEFINED
> purposes.  Since QEMU has no need to use these bits, we may
> simply ignore them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
