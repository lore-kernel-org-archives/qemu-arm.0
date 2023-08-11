Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1319676ejc;
        Fri, 11 Aug 2023 05:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGudkSvVTesYZBCcOiykBXE8WmBLbrekvmMcVKO2rek2Uijtna1k2bHpcHRiOJbNxqbaU25
X-Received: by 2002:a05:622a:1207:b0:400:a976:fc71 with SMTP id y7-20020a05622a120700b00400a976fc71mr1837687qtx.65.1691755792637;
        Fri, 11 Aug 2023 05:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691755792; cv=none;
        d=google.com; s=arc-20160816;
        b=ODCRu8nj45xuRFI/yM8n0gfS70IQUj9VceRSCLUpeJ0TSucxh7kkYIR569Ktw8UXrp
         08gu2t9ea1R7U18M/75mUdJ3621Uxz2JJ4SoDdmvbIkrgGwOTIvvzqSI0H8awxESzGWg
         m4H5eCwJ5hBue23tOhamkjotU6c++YYt2e8yrfAlY5TppymJ2xffYGgGWw5s11Loy7bS
         n/j0Hxg61WEcQgV+vC1Dd8gbUoTbqe6DYMSLdV2upW4OeYC06eusXLioL3c/NN7X9BsE
         MVyTG/50QegtSjKE8Vq3IG8UkPGbxUFzhlI7eWo5IkPCp2oUIE64Qdte11DzZmJQ8MEV
         u60w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=f519i4IzIrPT4DfUdbMMnoDh8gDWGEPx3By6NW7ZTfE=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=kerZfn2Ko6u/gZc7KHuyBSC9cZAHHGKfS2dAehNGhiO/DLYVbt/ff3LKplSKdi2e3B
         AGW/8axEbO4l6mIvz4xvPZTuGMB7OVOx5OsPzCYXEmwlpZSPozH/V7p584pdhvwhtw4P
         AWtBGuQvw0Ahd7KPZ9uBGgviNUfmvsbnwTW8BULzQRf/Xs0/aXeWRIn/ZUCCvZ1D89Dw
         wKszY5hceUZuITSHyMw/ulTKOZErxmUwrs92Wf+b6xuBoEEAfIL73RagID6h/zz+QJie
         NmE3+ohoGAJuL68BorHNRF+ugqPBH5DVvP3ycBJELDUM5c7PivkGFhYAh9wLdQPeh7H5
         5AHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RiQ5NBTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7-20020ac85987000000b004039cfbaaa7si2191738qte.139.2023.08.11.05.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 05:09:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RiQ5NBTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUQxF-0004W9-Fk; Fri, 11 Aug 2023 08:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQxD-0004Qr-Dg
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:09:19 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUQx9-00037K-DK
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 08:09:19 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe2de785e7so3071342e87.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691755752; x=1692360552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f519i4IzIrPT4DfUdbMMnoDh8gDWGEPx3By6NW7ZTfE=;
 b=RiQ5NBTk7I6KOk426n6c8ooaY88cB33mL83tS7nPJ5I6knRk/IHHFBqGtBqJLVBSoG
 wVGcbwJi5xJMEanS1TgDVqPsIMiMYqY4yJnBqyTXzPqEh/7V9aocOT1IyVix0gbyBmA6
 /oDEDVc6xGqAUdE+4eUsWwcsfc25RXcLmtELvg+sqQUsg2zshP2/IPWE6XugCKBx8qMn
 +LA7T5aF13B53YJuF9ZdqN3vE9002XZXPrCf21G0oB7PApl9uPf7y/r6voqn5FTso/HK
 GPPGF0LqtJwkUzEu+S3HnFQk/2E4/OEowx/p5LuNSdJvzosmmSfTvhwXqjlWyKX0mHGx
 jV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755752; x=1692360552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f519i4IzIrPT4DfUdbMMnoDh8gDWGEPx3By6NW7ZTfE=;
 b=JK7BhreaHYxeacMf6opfYH0sTd12f7yQb745O6whRFVB9MbVg77W27o8EobAJMztfg
 uHJyH/p0Zb0YLnO8RB4V5Z90aFQP7wJ1ycV0PfBhxfbYoyc4wu21qmdv9glyvqGIZgBF
 VmGAj5e2m3UAHHNWE6tsahPF81a6N+kZD9fJ33H0Fv3B9eGdHsRjmmX2Qj1A7J5HkwVn
 8aHDPBHNsiSwoeb+GTHhvWiIVx/m+Rh/BQNeCoXd7vxYZsoyovu2lF8vYMkRDOB3UbjS
 /L7Foa1ea2UeAC/J/JcN7EbpvZ0AbKlb6bd36ee/9CUH9p1xkJO+CFM5u5TPNpMf0OFL
 HAMQ==
X-Gm-Message-State: AOJu0YwQEYiUWzRIaGEo0O996+BSY1eJeEO7eW8e7RqJ16nzNEAIiN8N
 6A+BESMzxPk5C5EmTY8Uyby+rMO8F4eAcJxwfl7ehQ==
X-Received: by 2002:a05:6512:b84:b0:4fb:96f3:2f4 with SMTP id
 b4-20020a0565120b8400b004fb96f302f4mr1432995lfv.51.1691755752212; Fri, 11 Aug
 2023 05:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-23-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 13:09:01 +0100
Message-ID: <CAFEAcA_u7vtVRz3XqFULH=a+iXVGvu-XERg482jh5OhhRrf7cg@mail.gmail.com>
Subject: Re: [PATCH 22/24] tcg/i386: Clear dest first in tcg_out_setcond if
 possible
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Y0maFpjFHJZN

On Tue, 8 Aug 2023 at 04:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using XOR first is both smaller and more efficient,
> though cannot be applied if it clobbers an input.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
