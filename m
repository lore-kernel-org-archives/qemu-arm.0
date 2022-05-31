Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3434417lfh;
        Tue, 31 May 2022 05:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZq/NFqak3nOTC85CFk1shmtSyoap2ZZPS2nhmbnCMTfMnSA8oFpTQ89QYxfkw6ae7ilHM
X-Received: by 2002:a05:620a:24d0:b0:6a0:7ba7:c6d1 with SMTP id m16-20020a05620a24d000b006a07ba7c6d1mr40059417qkn.514.1654001875559;
        Tue, 31 May 2022 05:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654001875; cv=none;
        d=google.com; s=arc-20160816;
        b=pfie6B/RAYUFt9VUN5HtFLp2/ZRNyptedPED43exW8o/S6OD0X3s3++0YRgkg1fitJ
         D3Bn9AClwzlWhh15IcWqtew7a+swdXbx+jp3XW0kuZ3JZiHBkIXlILFmPvwdyzbnEwAA
         MbAxkf7SnC5wjHGhKVYtSaZ/VNfgT4ADrZdAfsdZUh1LwlZbxlSR1GYHW+OqumDg3iNF
         LGZhDC50i+o0ZexTyhpApAB2Vh3gUogvCy3z5yu//IBvsC9Dt7LoZAKtIV1AfLHYL1c6
         uxw6QHfODFJW1zSLZYgiJ+8XxSKn7TP5uyA7ecvk6cgkyEHnThbXsJuheBmSml0HNloH
         8beA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h2kfGbhgs4tWtp8UaNID7Zm8Cz2K3axy4EM1gqFvvWk=;
        b=fQun+tyd/UbSJIJzf1ycRGwM4WO0kgVCeQvdn9s3f8Ln6W964LJlVZ73XAlJvLcMST
         kvFoA2MvYezj6cwjy0OU3PjzArw441Ct2Xqa10WIM/yRDLLaqcofiyUAEnmt2KAPToN0
         z1n4a8AcaYmhkHR5xfsr/h72TG83aDPnbcKryG7OwYvFNwDHKp4GxBvh9BiZqvfQe+dH
         7/JIiecx0QicuRztb0jYEKqwBv/1E9vn81d5AJyeK3ETb6jftcmStqTf2xR24LSYNFKp
         6JkDj9TThrWiOk3eCd8/7E/MgfcspE4mY1K5spYFNO8XYAkswZQ40RtrTN9qgSLRpbXB
         coCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIPvAnsV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u31-20020a05622a199f00b0030352ba50e7si3902979qtc.463.2022.05.31.05.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iIPvAnsV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw1Rb-0004yp-0I
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw16J-0005Hp-L7
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:35:55 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw16D-0007UG-9f
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:35:53 -0400
Received: by mail-yb1-xb29.google.com with SMTP id w2so1942681ybi.7
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2kfGbhgs4tWtp8UaNID7Zm8Cz2K3axy4EM1gqFvvWk=;
 b=iIPvAnsVBYYWS4dMIWCsTV6FFIEgp6dnWzgvpgwDaPN4wcsOJeKhTxoZpO0csFV3eN
 x9JztGsYt1T2EdcCrsahzXRxEbHi+m7RY0ij7QfvHdrD2OWsw92+/1UOCqrqdczZ4S+/
 ibxu4PlqRogg6QCrPTG2dVtUBO2cte3iMEpllzNEy4ronulYYr38dU3LHlKrV5GOSuES
 r7b0aj7C9Frxd0jNODGJ88QphpwwowAYkryXAxqt9y7Qgr3VBMPL+c796YR3c7suDRqB
 OSEnPy0nanO88oJdRVaSjmndZU/YVZc0GlwGip8zmGAneCENpySH1Zes2pjiXg2Kx9mc
 XJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2kfGbhgs4tWtp8UaNID7Zm8Cz2K3axy4EM1gqFvvWk=;
 b=6VQtX90w642Uapn6gYzgeMqR3HQjj+CWZzz8S4SorH6rhSbca7aAHLKhCDcF4ftTFE
 ODISolx/QsbPi4L7BxnR1KLt8iVOW5cMQh+sU/b813noyhB5MgFIxEumlLOiXZUi4Rsj
 3Q/D8zlutNhGQiZFvqd6hKaF+rxJG6sDPwv7i24jIsDIxtPJ2OndIzMJP83cU4sx5GFh
 Tbab0iVpSppXlHaBDK+8e+hyw7W7//xB7Oq+y5dVWE847nzbiDzSD+bJbgDVDsJayKSZ
 zYmdMobtYuczkhNsKnvA+S0E7pXvlp8qRn9yg42AbQkPNcoLFX3xgaw5xgfN9sfQC4eL
 GfPA==
X-Gm-Message-State: AOAM532zV6u0NXxXl89G7UxMRDA6Rx3psqApznoKs532kD84yS30Uw66
 jIoJ1EgYfP+Ve4ty5DWd7zMeOsb4dStL3n3HaL17wg==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr1844490yba.39.1654000516769; Tue, 31
 May 2022 05:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-16-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:35:06 +0100
Message-ID: <CAFEAcA-=A1O2sfaQPJe4D4FjrVU4SZuxy0SfdFfFZtyxiaU=Kw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] target/arm: Export bfdotadd from vec_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /8Wpvm8PqtdV

On Fri, 27 May 2022 at 19:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need this over in sme_helper.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/vec_internal.h | 2 ++
>  target/arm/vec_helper.c   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
> index 43cff5ec7c..5e50c503aa 100644
> --- a/target/arm/vec_internal.h
> +++ b/target/arm/vec_internal.h
> @@ -230,4 +230,6 @@ uint64_t pmull_h(uint64_t op1, uint64_t op2);
>   */
>  uint64_t pmull_w(uint64_t op1, uint64_t op2);
>
> +float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2);
> +

A brief doc comment would be nice.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
