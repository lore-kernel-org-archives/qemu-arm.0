Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp532360lfb;
        Thu, 9 Jun 2022 08:54:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrswxRx4TZ5MnTKZswKoCg5jJlaVd0tWibt/vVr6MHQRXs03MQD8NszuxykiIVgKFrZyLQ
X-Received: by 2002:a05:620a:2544:b0:680:a53b:ec1a with SMTP id s4-20020a05620a254400b00680a53bec1amr27972108qko.544.1654790096041;
        Thu, 09 Jun 2022 08:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654790096; cv=none;
        d=google.com; s=arc-20160816;
        b=03ptzbi8aI4wBbO8faWHj5WT7c1eZr60M4YTZh8qPsvgpcDDNfWoss2IAmPe9+pXYt
         Dr0f/cATBZFjBQWf4BNXN+Numcw3COhXzy2xHhJqt4IMI8ayX2JDrn0w9o28Zkkr3kcU
         gpBho5XT3FNjczPm6GKuiML10YaawB/amDipAzwm25olM725ku5SluFvkDqOUUpDl6jV
         2Ej3eJJhCzq29x2IhLC7Bpf2VPnZR/iDFPfhDx9yIOkK8/iUjWQ0XjrFA0VmFEFFT5lb
         YW183gpIzC0p8ZwAUeFu0ivwCmcrS+iH2UReimnzMeeSqFB5mdqXxtHQRH61cL+69dO8
         /5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QiTjh8ykw/Aql0jlrN2Hl1GRDdYGpja0v1d7hfn7pTI=;
        b=t+e280FpQ6+AAf+D8uFQ126NPfiPxw6S/1dyheGz4pfA8xvbVpDR2mIBk11mUvfR4L
         jzI23tkKX60V0puK6bxY2iABPUq0RknbvM9/rHuk1Q8NIV94wvBAm6udTsSkBoSVXTI9
         0TjCzCH7tfJjDX4UdhGJC8CLX7kci1xUvT51y8sIU5l6JQrLJF8zJbM8shKvpyzcAWRL
         /R9CJk4fr6qTrqzcakHElXMKNGsexeEAtvMFKNHMb1xH4jKw+FE0uMaIpV9nQcl2ag2G
         Pvu9/9vC3P4fEDLrPyWeEaI5rqrb99POI8g4BIJMxjvgURVEhpPKHFRpkoiXDE1uyE/G
         IXLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vF881CRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a244300b006a6e4dc1e26si4929374qkn.259.2022.06.09.08.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vF881CRM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKUp-0004pa-El
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAT-0008J8-3e
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:33:54 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKAR-0002Hi-42
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:33:52 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso244671077b3.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QiTjh8ykw/Aql0jlrN2Hl1GRDdYGpja0v1d7hfn7pTI=;
 b=vF881CRMzMIWpZPtPSm0e/M1gDBhOonEO9VkHha7u4wJRVDCVDCN2DrMnmEN09qKeR
 x2m/Q6QZgEqxFYDxrzYWaK9VMQaUIToZ/Xn40ANUENhUZPolhEvrdD6S020u9iGt1Jdy
 jZeiA3Z36lJyQ0jn2FFXNYDwaccv6qdPgo+WSygNhIJ9jyZWZ37kkfgWcE/dkutBLsDu
 lqdxCz5lisq7xd4Zh7coWLEMyCH4YFkglK91dhwgC0Qvahx75/5I7fhT21a87WzudViu
 MPWW9wapaOxR/Wjhg7nvz4DlcLmaHLZmuLDzsHtC/+6ozCjqkkkK/Z6zSzG5CxZf82NF
 mnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QiTjh8ykw/Aql0jlrN2Hl1GRDdYGpja0v1d7hfn7pTI=;
 b=iQT02u4qKj0pql1UY5MCdYL/RPxvgSKZ6YXBEwAvUxC72WhrdkwdZh35+yvfxrc1o/
 WyyqTZCZNS3B9RBxfMmsEpujn6LYuuFBbG5xQbC4IB1CCJpYZjXQzQRzBgWl19qyN6UU
 BnhTZVxaxJqDNyDZ8ELW+jpzSQXRCrWp1PCBes6+uzjNiZt0R1T/hd7KbknW+yCRowF1
 XX50CBlexW8KiTnjxV5029uUi1Md9+Qj8D9qkEZ9Bpr4n3pWF2491xSV5SUf/SFgzeXb
 dvJpCBJCeGSZUJJ87ZHBpwgw1/JTdP3vVE6iYlxkcL6WZPChCcUzVT5K8QbO5yNkKFjt
 zI4A==
X-Gm-Message-State: AOAM53305eHP0esAPLtXkLjnx+vsS2L4IxK0YVYxlkgCMOTq+GZEzH1m
 GzFpERNu73B++eV/Py+cofMK1gfQV9zfYsYpKmLo8g==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42201609ywa.455.1654788829891; Thu, 09
 Jun 2022 08:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-40-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:33:39 +0100
Message-ID: <CAFEAcA-OfWLaucq48MCFXJ_8Km9HNU95Bp5TmxOCNFH5fR62bQ@mail.gmail.com>
Subject: Re: [PATCH v2 39/71] target/arm: Add SVL to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-TUID: 83X/DPf48iwu

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need SVL separate from VL for RDSVL at al, as well as
> ZA storage loads and stores, which do not require PSTATE.SM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
