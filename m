Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp576170lfk;
        Thu, 21 Apr 2022 12:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTWLrM5YpMfZ0IsPh+qL5g0BjAgZqGRCg7IvAmQKFMIrc0iEBbaMZXL0sVaOW7fl9y4Ch3
X-Received: by 2002:a05:690c:294:b0:2f4:def8:b256 with SMTP id bf20-20020a05690c029400b002f4def8b256mr1266240ywb.405.1650567860234;
        Thu, 21 Apr 2022 12:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650567860; cv=none;
        d=google.com; s=arc-20160816;
        b=HKRTM21BLs6W2siCPZ4q54Yyrk77tYtgjKtfWqQtTo0jhPXFA7VRUcyGCBdVFm6fo+
         W95nLYVWPxeP1jGX3D1esxbd5TFyIgapJD8DsNbL8Qyq7SL97S8RidKRD7cZ5SgpHYa9
         xPcH1kl3/3qCftB3guzLHDXJYn/RUW+mJa3ntLtb3Capw+j5NsGaR4XSR8TT22RRTDr6
         mjd0SjPHmPJE8hNdvRsM4gjzCIjzW0I8cl23vVDaeFxqP4OH5e0rD0pbzzW883HY/Hn+
         jT4zRrpqYkNAj6VjgRWvp8TKMMV3vk0cqw0bWhqyJ9s7c1EyuNwb7hOmKnT47BhOXtDO
         05ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y+fFxWtGpfkIsF7CZJxQr/ve1yOSz0ZiKpJgvRDZj0g=;
        b=tRGeK98OoPpHINZnrUc+V2zTrUMqwoF2O/5YhuE2asacMo2a9kX02kbldIrBY2nC3T
         zcR8My4fjFDjJFG1wmJqltDrnP3YRwSjIRFsIcGW+ujVPrk6hdmCoJ/DlpT/3Lf8PNyH
         giMrK0j8nj6p53nMWhqxcNEOyj/6MU2P+xgQvSipXHspBMaKQnLL3dTvSUiX5+WrXR2f
         aXaQ8hL0WC/4jmzImfoLwEIqIX5X5AlPSuoWehNzlxlpxo5IP9QkeNCxTp8QAhPfbUyr
         c7lUBKPuv3/ch8eSbXSQ2VaIWWZDSXv+xnENgufqTtclG/ya00Re5/xLn3OVX7hywDXG
         Ywxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aFCVQ4J4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j186-20020a2555c3000000b00633994044c5si2954989ybb.303.2022.04.21.12.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aFCVQ4J4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhc6F-0003pf-JK
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbz8-0005wx-Hk
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:56:58 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbz6-0008Tn-2l
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 14:56:57 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r189so10397997ybr.6
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+fFxWtGpfkIsF7CZJxQr/ve1yOSz0ZiKpJgvRDZj0g=;
 b=aFCVQ4J41/Jqew7rLhacgM8jRCEdy2erpFnc2se2Gpq2M+8j9HUgtbz8woWQwjvWdo
 dd/xSxPkkRVAe3OBkicf/96nB0JWk8YKWow7Q31vOAuoztjSVKgzxNqQ02tDiesfSCde
 1XINccCvjuEE85IhAcCmTlCa+JSs0uOBfYbz2cFy0YjxR8L/2cQbSFHCla7vfIiBnDkA
 ccnYt1iN3WSYqdUwkKvK3yiqjXfTZ0Z5v35PK9i9Ph4ZMivawRwzY58xC0mnGaD7WEZl
 cJvt6h4jqMrDm4HRzpZtczO0zOIRpZthGFmBap7HcdXJgfHSZnWy0Z5hqB8rewoiwS7J
 555w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+fFxWtGpfkIsF7CZJxQr/ve1yOSz0ZiKpJgvRDZj0g=;
 b=qv6zd0fm9MSaDUijieQCI/MIxj0sIwivnmIX8TLxuGGwH7RkDPTGJAKZdbtcEdMt/V
 2WlOeRJmMr6haxoBs1oe/c1yXBQStZH5PB3Wps0ZqhfTk5iwjWrYLNxIcHrIHM8oKEn9
 XKOlLJB3qeDcEWlgQcaTf/o6RLOjR9eikaWGWHMinVfIFbhVtHXt8ynXRO66MXhxKo5E
 mVCkw6Ht6L3+p6AwAjzeKEOXH94ghWc5OSjQaCnYXSUm4dNs6dV8NhAfj4h+ySd/X9Lv
 yoXeTp+lFLietA/eDPJaLPY4MXNDwHDVyQxtYgErcVxa1sJL/KtHHJ1E1xuLZgfjyE7F
 V9Kw==
X-Gm-Message-State: AOAM53081GSrqfoZevTeC+mJ7W1ttIL0q0wsPD+KFjArfPuZmJsr0M96
 SQxqt+Pth6QedJBszzRxZCEv9Vnsem8v2dE9WmJWrg==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1143749ybq.67.1650567415016; Thu, 21 Apr
 2022 11:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-15-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:56:44 +0100
Message-ID: <CAFEAcA_ZeMGoEVyN+73aPUcOpakzvtoCqXz=yagtxBJQvU9pkw@mail.gmail.com>
Subject: Re: [PATCH v3 14/60] target/arm: Simplify GEN_SHIFT in translate.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: VSN8cO/rtDGP

On Sun, 17 Apr 2022 at 18:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of computing
>
>     tmp1 = shift & 0xff;
>     dest = (tmp1 > 0x1f ? 0 : value) << (tmp1 & 0x1f)
>
> use
>
>     tmpd = value << (shift & 0x1f);
>     dest = shift & 0xe ? 0 : tmpd;

Typo here: should be "0xe0".

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
