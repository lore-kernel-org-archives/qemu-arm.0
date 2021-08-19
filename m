Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp278795lfg;
        Thu, 19 Aug 2021 05:33:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2P19+DE1XmlNJ12AdODTtT0KBDHYNQZn79HnUFnSU5BH6t37hM3xRtRqACEftPiJv0uUz
X-Received: by 2002:a05:6402:375:: with SMTP id s21mr16598388edw.318.1629376388575;
        Thu, 19 Aug 2021 05:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629376388; cv=none;
        d=google.com; s=arc-20160816;
        b=NkMds4oAaO0w3dV/9bbAHiePmsMUCrTbqLs9E6Z1Ie0IM6BnyW5J1OZ/0F68WeTSjp
         XTgMwPGWSAUMoKFJZ0FW9rgrUHdGeB7RPEIu0mlDl392rvqtigrqeKWvV6G3406xxMzN
         OEfPMhtOkqdSvymQkkoTndKN3XLz2sB4mmUrKlEEI01A1iV0EoJa+6MaeXe+g99h3i8A
         GVo1KtYqGkqRL/DBdr3RpK/hnX6rmuikBcHnk5CfC23Bdz3cY9IWXsBSdgqeDkCi3zrV
         64I8P69w9/7Cd91B3rKToKgzFbl3UFmfm47w438PmuxIxuL6Fah1NgHHD22pLGw77Lzx
         TAZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PdEqVwiOUrR2OxTB7UVLjUUjHayH7DXX5FSPQbzbmk0=;
        b=ImzM+mSLKq1/5e+9l6Wb5RS0R2OVqKEel0iCAU3unwLYTHcrqVUR4hkgY85047EMj0
         nQb9VXPiqF7rcOhTbtSnrM/ijw3q5du7AAry41cFs3fYsXnXUd5dO8fu+fK8/3g7UjVa
         u12vJ9GZZksUd1Ekdjgl90Hrxnj9grjwdlnsL2B/APl/7OyzmoiwlGl1pUO/rkj07z8T
         Wyg1mEN5rYSGLlMkjB80ZjKRrynqjSqKbwgSp6EoQjvvCcjEpOlBPcs1llqYqMZm8Xw5
         grK1L4yspaU50THNjQxga86AafWU2YY7woit1jw9JDMVnQgl1YA2XbEnGg4EPFb7u5Lw
         6LAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Hqm5nt/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si3439806ejl.218.2021.08.19.05.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 05:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Hqm5nt/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGhEJ-0001ZM-L6
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 08:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhE0-0001Yv-CM
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 08:32:48 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhDy-0003Em-Qq
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 08:32:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id bq25so12529366ejb.11
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PdEqVwiOUrR2OxTB7UVLjUUjHayH7DXX5FSPQbzbmk0=;
 b=Hqm5nt/Av0YMgRwQbj/nC3b/U3CwjvWgnJ621IxW03oUPt5gw14Q6o8Ou4wbwZcLHR
 zy3UN/GKxCn12ttOyInzrfFiUKN7Ltw2vdTRlRaTxkDAu53oSxxRUeZ3/RqysBfIiHYL
 Os51MWVbhAQU2yvzqGAZNkLKPVUpQozsh9RQtEJy2AwfVEh6fKXJOj9A9oMWWc++/ySJ
 hRpQfUBg1CXXd4ZclTSHgEUnFJ/NN+XC89defBGpTwXetF8G1koAq14KWhaqKSrXKI+K
 5iuQUWXqfb+m08u6M4jq9ejCrzsWjZREFWMfdnItd0JIYdnIpaNGOJeBEFNWpbn/7wSv
 5HFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PdEqVwiOUrR2OxTB7UVLjUUjHayH7DXX5FSPQbzbmk0=;
 b=sY8lxO7X+scUuZSq1NNc9G4xtBrBlhvthyWl/V6BarJkVugKY+okrRNJ5/elKB9EWD
 SUywyeBQn7P7qhOSlL7udGSFQtIPQ3WaM2GPpWCB1Q+QPpJHY5AL30jv7dPRuM9GV1/f
 Ld1yqlYrePTo/7DRsFcW+27eFnknW55QoLxl5/GKHFeoVQ2MknttnHS3+cholycmZvB4
 7u/ICcK33MRdXPQO5G3/vzvidqzxpKw6w9nxqhfYxGwf8XUClG3+u0I+MD9bVKqn9vSA
 yhpksrxNLBmKUTQyvNT8Sn2xASKmM3taUFWgjBEfx8vXYHLMpmrhRMgsWKExNp9v06ax
 j6Jg==
X-Gm-Message-State: AOAM533QnWqji+exOwIe3ftkCe9mNh9M/aIsoM5gPOnUU1bMafipSYLg
 gQKBzjLu/Ce2zRMuBv7pJDVVWnMNlPlYYLKWxtRAJA==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15420135ejy.407.1629376365013; 
 Thu, 19 Aug 2021 05:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 13:31:58 +0100
Message-ID: <CAFEAcA8pWb4v-ZhaY27k3vGmMnUZ_o1eEHpvQDSMBq=JUGZ0xQ@mail.gmail.com>
Subject: Re: [PATCH v5] hw/dma/pl330: Add memory region to replace default
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KCpO0ugYrgpk

On Wed, 18 Aug 2021 at 11:17, Wen, Jianxian
<Jianxian.Wen@verisilicon.com> wrote:
>
> Add property memory region which can connect with IOMMU region to support SMMU translate.
>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> ---



Applied to target-arm.next for 6.2, thanks.

-- PMM
