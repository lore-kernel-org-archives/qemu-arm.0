Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1599259lfu;
        Thu, 28 Apr 2022 02:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsVak3Y9ZrvrvgzA1Oor2MbtqZ8PYPwhxbWLFgnmSXesO6lZVuwKrSKyJY+COMfKdxtl3b
X-Received: by 2002:a05:620a:2018:b0:69f:9981:d00c with SMTP id c24-20020a05620a201800b0069f9981d00cmr3345108qka.419.1651138870550;
        Thu, 28 Apr 2022 02:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138870; cv=none;
        d=google.com; s=arc-20160816;
        b=JvSzqQ452GNVSaZLn1j76kch4RB42qcQLJfRCCHtitrKUJBuzktNOcX3uXMyhXqCFX
         78+e+snxBwbrwI29kLF2KTQJR4Zp68NzJVKefcs2TKfhoDBe5lcT7bWiwaTl/hBAK79v
         pkuHCOzN/kfawQ1nCLIQFPzcPVOFD/ovF033/Go0+79lBxygMgIQ6wXNsqlEm/VA9WZn
         BYHQVkTwpojyRPAec0Q081/mkc9ahGUempOCZXN5XmaEh/YMqegFiQYV958DH/zo8wfy
         +++u0CQeqgoCUxkPFpsZebkBZvk2MXSUsOXd2VX8NrpsdpozvMTntosszJQUqQVgIZYn
         Me5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+RazEXZ5ZnwHXU/LQ+zhvx1Vn4ZeCaCRassTJ/KRCKM=;
        b=awN0bAIUwrKd1AfpM0i7/VamSJTNw06nTzoWzQLxjSCbEtSGq35zElKP5sDXv6b5RN
         sd4n72pxbkzXgBdmt5q2HszprrKILeWhvO3gk1EC0vV+Fkb0ehB9hFlD/bNVK0drWO8F
         /0svvnEph4qrPx8+whzZWiLgj2gmUDbyGshEHuEs/0KutrQkcHPWbJPMnGWDh6EfsJLA
         jQkfpA9P5Oyrv651zO4TGE8nGDDfHcXvQ4i5FyXU9qDbN8RH7AkVcg0IaYtxw+rSgiks
         ycHiP5L6Y33BSrDjH9aM+eW4M6MAtuJ7KRmAIMfbEaW64GyoO5hMopuW+fmXOMj9t5Hs
         koCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x0XUf/hQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020ad45cae000000b00456512b70e2si1637474qvh.481.2022.04.28.02.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x0XUf/hQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0e5-0004yY-M0
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0d5-0004wC-WA
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:40:08 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0d4-00074a-IW
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:40:07 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id g28so7952451ybj.10
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RazEXZ5ZnwHXU/LQ+zhvx1Vn4ZeCaCRassTJ/KRCKM=;
 b=x0XUf/hQfxr0fpyGErqYC/rDAwcalwoq2BBIg4c1HuMUxcgVS+l+OS6hP5AjCvXfvt
 WEsG5NuVnk1j63iBNAMhmpquobLj/w0Rqc3iFSWo659o6VVDnzqT31jAuK4IfUxoS9Vn
 lQsmIo0gzNO1XQtHE3+V36a7Qx2iwcnCs38cuivnyx7vuW/lakCEmKTMCycx687V0Xal
 bI+riiPBcJzcTfccvJ82ZcRXsbBl71Ab/gl5eFooHmWbEqdWzLns08vMufWznTMvzBNq
 exvqSgbTYh6vWCs6bNxNKOIP1zgzc+g2hbxgBpF5+A2ZvEwiXdhnycJTVv2uzf653Mvv
 5u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RazEXZ5ZnwHXU/LQ+zhvx1Vn4ZeCaCRassTJ/KRCKM=;
 b=buO2EwG6pO/G2C03Had6eopHwrrjTQIQnGpRNfYPRnJ4xtvbvtZajAvQIkQUQ6lYL/
 eitdb8tSTlzZp/J2e+gbHQTWGAWDfdsQN2q2IqZn3VnrVaLIN9mpCxXKdUduF+wMW0d2
 OPR9sSPbLJRtIsRJw9LkIEZBcZt2M9OP8yUHxgy/q4KjdfRskSJiiEhm6SPLC6E7Fgj2
 PmPOs4/GECRfAoA+C7jEZNptna+n9LLgCvyDYojO6mAxJrLLz69qWqZN+NZJIDlOmbT6
 7CIa1ZqAFvICxboDeywY1yKyWqcF3TkA2LofQIW/XrRyicj4oiLBh2UGV4YU74To31XN
 GLcA==
X-Gm-Message-State: AOAM531rPwMYdWFGlSbE9k+LA374nIM8KZIiZHaBxC+wOVFis6smsdes
 r8KeyRJF70h3fHAfZEHy3OuRUap9bnJNDSri6RXTSX6nbt8=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr28043207yba.193.1651138805590; Thu, 28
 Apr 2022 02:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-6-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:39:54 +0100
Message-ID: <CAFEAcA_fscePT7YvywrfBgAn5rExLVo-jH8WqZQrYCR5No95FA@mail.gmail.com>
Subject: Re: [PATCH 05/47] target/arm: Use tcg_constant in handle_msr_i
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: Bv+EGd8VoNln

On Tue, 26 Apr 2022 at 17:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
