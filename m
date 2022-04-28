Received: by 2002:a0c:cc02:0:0:0:0:0 with SMTP id r2csp732500qvk;
        Thu, 28 Apr 2022 03:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOgRrwKkyys09pscBO/tV5VMIJ/zqD38txcTc3fdEdjWS2GdFL6GTm+VMQsaF3ERvJlTel
X-Received: by 2002:a37:a202:0:b0:69f:9da6:5ac9 with SMTP id l2-20020a37a202000000b0069f9da65ac9mr2393556qke.13.1651143079142;
        Thu, 28 Apr 2022 03:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143079; cv=none;
        d=google.com; s=arc-20160816;
        b=wnj5mcz3Z7bFWlcfTPDmdv8doQACixbxaoHbqDeE7XD2rHyJ/TXIvFnDP9uD0P6lRE
         GYR8RGg1GyQss5I2S9vcte3txHtNf589PNYshZjINP9VhyaXAjvlzwIBip7P9i6e8kI3
         FRSZwfWP3nJtetH+s8hk52EPYwtatZ4rYafo4tjVyXMFEPthLQrs8OoQ5xkIFS2AbMVw
         E+2aqk/G/opq5a61XDVD8HL02PReU4VmUU0aZ9VIp5ClmLkd1evhaCjcyVfO07b55F5P
         SBgWW9fp1ghccnY9UfHZdBU4IT/Fh9vdMtwe4RcchWUaN24f1/X8zW4TVfWc3ysNLG6I
         AMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVMnkHqCxX0hNDmKb4F5r+XusruWiAqJh8ozrVX/2Nc=;
        b=H7iuHo7wC4Sv8OTkFksZpuH/I34/BGx8VuqPJce1VxKxoZTm00SDwWJaDQGbe2Dutp
         Nda1pW/UMlXlPiac/vniX+JNT4MTp0NQL8ahpOCwr3ltw6v3eIiknQWSW0e4JTSFAl85
         +shrEDuu1cpJl/lI2JHdr+O8BlVa6Yho7esf1EF09/rl54qFxD2QAi0C2wX9EE8gSzJc
         Tw7MHTZW9QtWUC1wHk9KvL7AmTF1wNoTMa1g0tqF9z7UFrnzwFrE6RmFV/JkSQ7Bk9EN
         I63cpavG9C2Uz4OVonGOl6hBs6oehQRVG0TxLBTxEIPmyR7A9uSEZki0YdB+FhUrC9IM
         TGeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=srA71nZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bd5-20020ad456a5000000b004564fe0758fsi1380003qvb.143.2022.04.28.03.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:51:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=srA71nZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1jy-0007xX-NF
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk18H-0003i6-1e
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:12:21 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk18D-0003xa-Qt
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:12:20 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j2so8201270ybu.0
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cVMnkHqCxX0hNDmKb4F5r+XusruWiAqJh8ozrVX/2Nc=;
 b=srA71nZha2OI5ffY+4Ee1wUoojQ9w8lGeMqhxSJLvkTNNT0r34Ij5kRLUngzxoROb2
 O6+WIrtrtvik9YvpZ/7V+/jrJyaU70ERXMZJdPoXGPlz5g52RhKaZRlgHcZX+z1+XI9m
 0Vk1s4jaZ2GZQH6RVPXV77CokbcZ5LY8Y+wDFnOGLx+QWnBXNmiXKCU0TN3EL3Mt0YND
 +K+KEUbAtD9XrPprPWDGj2NVyOs2diJkZJH3YBhXcexRw3mSncNswBgwOS5a+lKDyqcF
 xwnMgPT6Gt+fM2SNG9wS/XZsYB+4pA/b6bdbuv3+fVR99cCFWV9NzNXogx7bKjwmDyuP
 TC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cVMnkHqCxX0hNDmKb4F5r+XusruWiAqJh8ozrVX/2Nc=;
 b=SOa8FlrCKwMCr1oHOpe61Ri/KIL+p+krYh+Wt5TytcENi0HSXItvpDSZKmXiO3K37T
 ZH15/Zt7RCSfOt7AEgcGu9gywgo/xAncbG92v4pcsf0x4lsXH2HEKxRVV8knBTG2S6Sd
 Qv+XXfjBlBXH5hIYLws4eEWHP4NU2i5i+1ml+bp16PU+1Kj8B1PODV3+JnpPWG7nMCF6
 3hxDz4yZeeWwHtDFGYOapaSDUENakPrEgdMgBltb4dXYaq2NyOm+JVoiahnHkwHtZ9FR
 HyQRwsLowGp1WGm8fiI8Cxy+aX1ykc+BNFlCU8hyTdVKQTAon9NzE9w0EZwdDijnwQwc
 qEZA==
X-Gm-Message-State: AOAM532mtZbBumJfpWoVyvQRywyvSZG4FQxT825GTw6J2hxdOap8MFVL
 Gy4metTOZ8XvobQ78PdvuaioqCYfgTgdj+jvIM+Hcg==
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr19966419ybk.479.1651140736811; Thu, 28
 Apr 2022 03:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-22-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:12:05 +0100
Message-ID: <CAFEAcA_PdvKFLiQb3ssvUmzewC_2+0sC9Pvv0vifdXbOU1nCWQ@mail.gmail.com>
Subject: Re: [PATCH 21/47] target/arm: Use tcg_constant in balance of
 translate-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: Gj5ACIPE9+3t

On Tue, 26 Apr 2022 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Finish conversion of the file to tcg_constant_*.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
