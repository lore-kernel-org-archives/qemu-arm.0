Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp598198lfb;
        Thu, 9 Jun 2022 10:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0VEBZLTU3Kh2JNei4WsJbswg8qtvXo0BCBcNEILg6YnCOEeNojiiwCajxmQUveTDCB6Ts
X-Received: by 2002:a05:620a:404d:b0:6a7:d3d:df9b with SMTP id i13-20020a05620a404d00b006a70d3ddf9bmr5537304qko.530.1654796794199;
        Thu, 09 Jun 2022 10:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654796794; cv=none;
        d=google.com; s=arc-20160816;
        b=CQs3Hj46pNpvDV9mCJMJGhiWaBNGYGnTuBzzcS5eFu9UiLnZ1Av/6e8wX5ypzsKabk
         l+huQBxt7S3bJyOlglC78v1fhlLLQnNr/S1Fj5wT6yV3pDV0o2rFgJDZ0F2baOKcNcgt
         PlBCb3o6Houa88CSkcxuXtl8IfdpamYm6ptGUv6CyKoRfGXzqVcf9s5VNyZKeE7t3sTR
         HR98SkRV5s3k/bREzuCGNmnm1VBmFliRdeXILQVhHUYLEupW4k49SGrZq7sFCpf8tdVT
         UdCsvVt20WWflahIi8ha0iIG6X+tKa43m4sO8AOSIEdEl7IildiZeVZm6LJFsVOHcKWy
         62cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4v8m5cv4Wjo+9wHRx2A7i6m8UK4l2Y40Ei1ZfKXWtJY=;
        b=t2qQ7ZY/9zJD6VoadZhyl9YRM31S86YX/t39dO3rMGbxO3nCaYucCCPtH+HU/hSRNn
         J504TDVc0shuadLY6/br7pNIPLDxvbFni7epwqTLnivyJNwkR2D8+NyQQum0ZmbkbeV2
         wXHNPCUASvmC54L/nLGJM5trh0oEr8fKQ89Hl+Yj/IZpKwNYdraZZ/J/TJX9Nz3/vZoK
         wV6a9rXUEMGQQ4WThnvJu3eRvdOvSpEEOcn6QyOIXemVG/2twPFOBgesyAcQz3xVOQMl
         LCfJeon064n8qazWQBzM82d0YxxfTCzetVPrfStfCJfY9gvbpSgXd+CG2yT49v90y1Lq
         8UmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YInXD3gY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05620a449200b006a672acc61esi2240555qkp.135.2022.06.09.10.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YInXD3gY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzMEr-0005dQ-Ls
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAu-0002ab-4q
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:38:26 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLAq-0004l4-RJ
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:38:23 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso246699737b3.11
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4v8m5cv4Wjo+9wHRx2A7i6m8UK4l2Y40Ei1ZfKXWtJY=;
 b=YInXD3gY25tScYe1J/wUgm9VVTV1n/HxEbm1HCUfdENwNz0wKpX5TocJflvLTIa+Mi
 cnGwNwOZqyZd1zEOJvB9tSSHoDWjR96aSUucC5W11dDCKNVMOZMeta45eeLypKlm38jT
 LqIP7HV7p8UedfjdPVQ3h0fSL0z797GX8oXZFApR1pSQKheuWvO604UDlzae9cs1Eydi
 Rb+thXXueNe321vQiIfqciFDctV98RoNV1+AsgZUN9tq5TdJmK9l8vodpLt73yOmztqv
 Z2MkwSO9/CqjWN9AUh2zErp819gwroOPlUrTmIIi3CUELoNQWYYjlzjefspu6Fc2YcM9
 aLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4v8m5cv4Wjo+9wHRx2A7i6m8UK4l2Y40Ei1ZfKXWtJY=;
 b=gJ8GuYfI5z1I8b+/LijfZrvFVP4iJDN1MvGFVPzOKDAE0CcxJFLt94hqQYKlEb0j9/
 lYo+r7ydM6j+DG6bHY92X9dI18ZX4gHqOMfZiNHZR2+1O31LgmypKjlUgBoFwVotNQl4
 oZZ2Yjfbi/19qs7bTzNYcCfbkBMPo81GlERIfhGDdRNwqJcYwvgYQX5O3uISNJclDwON
 ukcdDnOLNxEM7v6eyPe5A9VYBHlXvB51CjrJxKB3gCyINpe9PBowh6XGp/wiJDvHvpMc
 P7YrolBpTdDvnMPRtX6fqq5wKyjThmRpE/5vq7IzqiXsYCs0LrmUEM+sMh1Em+RRYEvk
 ZD+w==
X-Gm-Message-State: AOAM5325LPhzvs7MNQdN+vEcr2M5Ek2s5pm9HprcUn/ov+GtsXhZmx5B
 93ugnxjVQoY6ao+PHgSGZX52Jcz4nS2l+UXuBKcqTg==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr44110144ywb.257.1654792698939; Thu, 09
 Jun 2022 09:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-19-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:38:08 +0100
Message-ID: <CAFEAcA81et10c1wLVcVY3o5iURq8k7KdSjWVaAk=Fmu5W5Lduw@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] target/arm: Introduce gen_exception
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
X-TUID: P6PsjfNfBaUf

On Tue, 7 Jun 2022 at 04:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a new wrapper function that passes the default
> exception target to gen_exception_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
