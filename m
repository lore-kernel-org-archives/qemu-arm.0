Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2188525ejb;
        Tue, 30 May 2023 06:47:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46R0PZZp3FiV3+nOJxSd2SHBMT653NSvpgpZIhiL6y6sy2Sg05dte0TOO3QzUHNKhx5dmU
X-Received: by 2002:ac8:5c90:0:b0:3f6:beb9:c856 with SMTP id r16-20020ac85c90000000b003f6beb9c856mr2188710qta.2.1685454447363;
        Tue, 30 May 2023 06:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685454447; cv=none;
        d=google.com; s=arc-20160816;
        b=hizb1qtw7V4TiDAtkCgm6KYm3BHf5O+2RWo+JR8GT5gI+gT8oMLJFLcyCY4zkOT1A3
         0K8PSVfaL6YlRJszYMbv58cvJd3u7Bv9UvhI7R62lYcwpXCJW/a7YNiJ/ctWUOrRBJjF
         N4RT3efiXlgFLp6yA/1MksvVR+k6as7LzALAtN44CAHWjmh6+0wWRPCNDzpNZBbU+tCH
         PBGOR3u21Fh2pLtrFNsDtVvx6FAUd5HXhHK5TwUPTmc2lcskdFgmF7REctFUmELMBaFH
         25z170IU6ZNA2CW8BrsAI3NgJcespZ0myAIbSAkx8vJ3Hz8XEyvAl/bQSam3Ruqe4G+F
         HYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Qhq+1FO/EIQe0BRgNkohT6DFOMOYO68w/Ys49eYQmHE=;
        b=ASxGWxP7sxV86BccJ8cxEX8SM40dSJU/R5fdhshj5zMQyQRqNSSks1qFJXnFsCAmqP
         ICfUwgfV87hZv8HngQtRr36FcT5YEFz1u2LtMjz3jF0ZDA8GDAkTWa0QeoXfD1Ky4Djp
         23GIZh2zLzwoCLNMFFRcwk/POrkpJz4G1iAOFT12OFnbmX77yi8m7uVH9GlaAKyv1PaV
         7/zzTykPLH4njzfzTi9DtreCTHoAUM9THcuxqTVolmm33S6RMl7Hhun6FK0p1vO3hh47
         zwBZ+qTArApoeZBpGJuGvtruQ8ZRvQivseknQuzuo4DGOOBPtPjkILakMxg5I49wcz5k
         2z8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRxTcxTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020ac87e8e000000b003f4e1ef2a71si6648382qtj.311.2023.05.30.06.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRxTcxTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zh0-0001Fj-Jg; Tue, 30 May 2023 09:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zgx-0001FP-PT
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:47:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zgu-0000Gg-RH
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:47:15 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso6594909a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685454431; x=1688046431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qhq+1FO/EIQe0BRgNkohT6DFOMOYO68w/Ys49eYQmHE=;
 b=VRxTcxTh0IGBGzh+WG0mibQzARWlthxWEZ+GvWD8B4taNGi99hplj7I7JFTyTItHuH
 NVbh5aidxLp1pdA7Zf+6brzHPxfn6M+ja5BRQJU2T1lL3i7BtnE4U6fKPWE5wl4LFFiq
 gclso7+02j7YtMWFA773TQLqVl7y5k8uHC8wG3Vkszyq3V/YA6OxM8qz6sK8zta58iAy
 kcUBMJyE9f1des/at7wKZmCZEQKZmvopFFYXaJbTRobVtV4N7VVz1wThFeR7O3W0T+xv
 Cd+/zv0JCF57oK29GVvqnYaeONu8d1d49GYLAaU6bjGKd1bDGoDWvswqWoEH/pCnSiCJ
 zs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685454431; x=1688046431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qhq+1FO/EIQe0BRgNkohT6DFOMOYO68w/Ys49eYQmHE=;
 b=V2Jv5FwdAFYaMJG5vslic6aa3Q21gOfLl+v6FfpPzA1Excc37jmr6m2TeRWaxDN16h
 /kRYEa/QMb79SX52gTrZIf5eQ+ZMDowuqQyQiFwHsC03Z6oGC73XM95PjOVHzsOZNMmz
 MtuMAtgcxVi1YGyAtlU4wvP6fOP1/Fk+272xE+B85Lyt2NP6VrXiboB2jWL8DwKz+5xF
 4lIHL+Us7GlSCsyWbo+eINWev2MZDRJeI1H1Rq2giKlYGQtJwARLNdiWWjpSbcO6NnOw
 k2Hed+1YhHXTkR8CNrDrMsFJ/CgdwbLf9Z9RY6ZtNpjxONDNbLdEYjlGknzWKp4P0Hk0
 kIiA==
X-Gm-Message-State: AC+VfDz98qijgt4UYJGa+xHcUC+s8VhUP8y3NrA9noirLeF4CfTA78uk
 bCDCI6Ji6hTDJRaGTyC/UfMhsCaAxguKHe26dPSnsw==
X-Received: by 2002:a05:6402:31f5:b0:514:a3e5:e434 with SMTP id
 dy21-20020a05640231f500b00514a3e5e434mr1421953edb.34.1685454430986; Tue, 30
 May 2023 06:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-4-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:47:00 +0100
Message-ID: <CAFEAcA_15ewWUW4xEb0fYmt5=6FH+dPDcVEh1__6Kfcc3GPnZA@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] meson: Split test for __int128_t type from
 __int128_t arithmetic
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4PkJtt04locf

On Fri, 26 May 2023 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Older versions of clang have missing runtime functions for arithmetic
> with -fsanitize=undefined (see 464e3671f9d5c), so we cannot use
> __int128_t for implementing Int128.  But __int128_t is present,
> data movement works, and can be use for atomic128.

"and it can be used"

>
> Probe for both CONFIG_INT128_TYPE and CONFIG_INT128, adjust
> qemu/int128.h to define Int128Alias if CONFIG_INT128_TYPE,
> and adjust the meson probe for atomics to use has_int128_type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
