Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1416068ejc;
        Fri, 3 Mar 2023 10:55:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8ivasV8CFMGtZU9vxFRY1pZrSajozRjM7hCyCMi/rmmgSq73N8zsVhk4R6QXbJ9JzxvJHE
X-Received: by 2002:ac8:5a82:0:b0:3b7:ec70:30af with SMTP id c2-20020ac85a82000000b003b7ec7030afmr3823363qtc.46.1677869751258;
        Fri, 03 Mar 2023 10:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869751; cv=none;
        d=google.com; s=arc-20160816;
        b=xVQbQe/r2GRfulMstWh5+PmoahGPdApoNYkb956AK/3mJYgTto6IzPvt7vBRLjtjpi
         /66VVvNym/Go+k0QIKFLC8KOwaoVBpszK3fTqFVWcY+AIiwZ4/ZQ7gusPDmtNaskGv7b
         Xq1b3fEkF3GI123f5ex54tuYWPvyf8Yer2f4b1sO9ZwETdEtIC+0XWNYhr407x7j25ik
         TA4HEyDc3PdwVZcwGowa975Mwauzl/Zh1aaGuuv8AGqqDRa4EwTR1gsRi9s2ZApm2AUt
         INvcBWPJ5nhWtWX1cbUm/GDEf6n0HVDFu3L9Bwr44kyaVbHBeDekKBofCsEwj172K9Pa
         ALNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=11UU2AZmIhClsrZQq4N+R9RlCHE2UkNBidLFiFJ/agg=;
        b=Pz9UTZWe9bkCfl9N9UoNHYpHzP2cRSNjipGXWIIpkBZEGy0FYurYztHHK4O9SkNwoh
         Qra49yIu010nDGDlT1Cu9jKsB7O3sNkw0r8xPqCINRIM/RooUmynAqX8mn6tH/oxF6R7
         4kHFde1Pta4X1sjzlFCO0REjtOFa0PU5av9mmpmuKdv92t9xOrlYhQgRT9NZA/ZvEByL
         NEU24sM1rwRfOmBJ/Ihair4wrzqgU6NZYXRVZViTKUQfhoSjwJMP3AEz5j2BOHmYpLhT
         JCXVeq2y3ejc68oXW7a420mWrWqHDUj4hbwTCPQkpLizUKA8LtY+EqHlIZoIrycgUzDJ
         4RTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRd6WaLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ac85701000000b003b9c812b82asi2433962qtw.464.2023.03.03.10.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRd6WaLk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAYz-00088u-NQ; Fri, 03 Mar 2023 13:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAYx-00087Z-Re
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:55:27 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAYv-0003m4-7B
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:55:27 -0500
Received: by mail-pg1-x533.google.com with SMTP id y19so2071974pgk.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=11UU2AZmIhClsrZQq4N+R9RlCHE2UkNBidLFiFJ/agg=;
 b=BRd6WaLkOzmX1VFapgji/0q/0ZuiclEtJU4iuiSy3yHqNpRmiTaLpoKRkyw/KhUajy
 zdgx2Y/7HJpIlhSyGAKsUG9c/tq06yTJ87QtkRvt7A4dJKVEkcL9rBzBUH36BUN1pEup
 lwnRKETTHMT8GAFL6jw1sZZoJd74LluU3KczTFBvji4QcDpcZhax5mZlUDMqcrjEpkD/
 MTa0AbPo5+U4RSvLXoAR69h9zSF+My2KGtrffzc++us51+0Pr9wCAFRcuYBVbXJM0VKF
 KPIV/Y49YzgEJSF53Q6B9sMBONYm13T+hq8wSIpV9u5NtPFqcpTTalmMZkVj8yY9SB0P
 O5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=11UU2AZmIhClsrZQq4N+R9RlCHE2UkNBidLFiFJ/agg=;
 b=NPZuFolAI5Ka4AoGS7CzeBZdEAr5yAmuiE5sV77uXUPq9SOmkBhi5Oi3tiPLL3HVo3
 cuPHi4vKTm1z/JQR38HAYOO0PigkNLhQn8uNCut8Bpoe+GQLYm60VB0/mR8p+LlJMEuN
 1gkQjlasPIKm8SRVhhoIKtlF7w0PyF8US4G6kyqYWA79i1iikouylFV+QJh9djY3cfve
 k9wkU91+22pCyO51KEoa0tJpfQ84c5pyOx73kYTPhADqXLDqO12K9DDtVLSMKMaYGsCi
 p6y3yNG+gS2wIYWld4sljVyEVYP1BubwEXAg0v2lCeLYXgWHjKWBu3Kgqoccw38cEqBh
 eVAw==
X-Gm-Message-State: AO0yUKX+sPng+cWRITi+mwlXOxT0ipmFAzz2hDJQmsbxoURECgLL7OZ4
 DWjyVfMdhJEIE29hkifvn+RRUCU/v7NBCQ5DBYDFBw==
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1316068pfe.5.1677869723891; Fri, 03 Mar
 2023 10:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-37-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:55:12 +0000
Message-ID: <CAFEAcA93iAPj2RDJSrnLQuqDJZLpKph-FrQX2yUuFrZtaeuxww@mail.gmail.com>
Subject: Re: [PATCH v2 36/76] target/microblaze: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KN/bxwkz8U/z

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/translate.c | 54 -----------------------------------
>  1 file changed, 54 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
