Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp656770lfq;
        Sat, 9 Apr 2022 13:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfUC2PZAF06wIdyaULMsEPr2M6ddZQYznv72jCh84ER4+aKFQWlUrLdZS3Tl5wkLzZ13cI
X-Received: by 2002:ac8:51d8:0:b0:2eb:dc92:63d1 with SMTP id d24-20020ac851d8000000b002ebdc9263d1mr9864276qtn.526.1649537760214;
        Sat, 09 Apr 2022 13:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649537760; cv=none;
        d=google.com; s=arc-20160816;
        b=ReNZMhINb5HicyJpeJjUF31C/t2oxE6+HbY7atRHlbSMszAgK4mmppgeB0aOtJzip7
         gJfwHVug2mFDaHIJo7JYWtcOnxElgi4L8fo0xFh1zgSKUTRBLX3mYIzTQtvX8CK8X5Xq
         Y1ulWJZtDKbb2G9aTbocBarfOnZhjlHcK0qWF/Cje20ebWaXu0i95K4fU6Ovu7j0NG1U
         f+Ntvh12/Akcna143n51KzOvWX3gqcsw8wvWwM8nPBaeBe5eUi74W4ZpcXMl+LEHSEbO
         G0GVta0gtufYYnV2Nicnr2MgtkFqQG9xwyXcNp0o3l9f2oKfXupkvLdURG0HVPnemSvq
         LXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=aV7olfjUKb4aLyRerxOq0O8Mms/Yy9rpbRgqdtoxO2I=;
        b=P4nwfpvh+t9eChtPlIOENF6oU1oJlE4EmGF1KpUCetjEUYR15eXdlBnyolZ9zd//1s
         dXSZsCE2w99fQbaRjRj7eDYZ2eEOaR+7cIjdrSC5nfCzAcbAEZXohWu3ha200JdzUPEf
         xsrixvIcgNMJquGa+4dRqKxW9Yzn+kviuOiUr4Rui+xx/f+38uuOUE20PWwoAjSPu3/w
         y/dIVe//NysYSTnpMu5RaS/l+wGj1xzPY3DFaaqGA0Cw9iMNW7W/8EgBCGM37hyTnPlZ
         6A1BaoeV38yrOlTHte/on4JDu+N4B562m2/x8lAsoGQOJOcrZPsZ8Pv2yb1ENnnXVD7V
         fLUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXgvMvsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020ac84115000000b002e1fbf3be5dsi2493743qtl.78.2022.04.09.13.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXgvMvsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndI7j-0006bw-Nj
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI7Q-0006Zx-Az
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:55:40 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndI7O-0006Ia-OM
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:55:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id d15so10802157pll.10
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aV7olfjUKb4aLyRerxOq0O8Mms/Yy9rpbRgqdtoxO2I=;
 b=EXgvMvsjtnX8QrVzLci0yesZRN309U8qlYtDPoqbxnB7iArMYiR5dcwlx/dZo8/ewc
 wuhffcDHKBzdwwySe733QbynRLI5P1CNRH+5r/ZoXJfYakoOT9j8zFg4c/N4oqNXUxL2
 yIiILU4PWlOmul24arr93ph+cmY3GWFaLS+8zHxmHCwbWzXkOT2U/tfZZMWLkwQ15BbL
 GH8d+wfYHh/wkRqWPk6t3nX4H18Nu7HBi7OKOoWGh2EPC55rtl6OKw+SuK1GAFQInz4t
 rAd3ZlwcDK5aypH7htF9/48Xgyx2lpi1UH7CokC2ft/ys+KEtM455vphNwsEzlq/YLcJ
 dpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aV7olfjUKb4aLyRerxOq0O8Mms/Yy9rpbRgqdtoxO2I=;
 b=IueP5So/a1gSN1e6Bc0J3qPyzS5Syfmbd9dfrN201feuxfjiUzp7js+Pf0Lb2mToD+
 G4CPM0EdWQo3UruZRvC94wMYFaf6lD9Xza+Cc0XuiECTMdO6Jd2rzsS9JPrHtDUpFgSF
 EJoxs/p7u2D0kXpuBdceYcCYI49SmO/Rh8CXvv7xrm7XA7t62/jkAj9WewJOtvmE8bwM
 4AhKHZRVXFBi2kcYrQf9aPW+cCpbHbmtXj5yrAlpuBgu7Jmy+zpkleujsYQqgTeQ6RZO
 /KFW0V5DML0j9SRIf0eP12Am8jCYB/En8Hxw+Kdxo+oBrW3PtbBPbngGpWSFFeFlRQRc
 b1mQ==
X-Gm-Message-State: AOAM533IJ6YKw/5Hm5r9TOD45VVi2QEfpXujcQow/MUI/l8q7SKdz0YC
 38j0mmqfnX5w5MFtNwLDHq/1ew==
X-Received: by 2002:a17:902:7684:b0:156:25b3:ef6b with SMTP id
 m4-20020a170902768400b0015625b3ef6bmr25296568pll.39.1649537737213; 
 Sat, 09 Apr 2022 13:55:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 md4-20020a17090b23c400b001cb66e3e1f8sm2523139pjb.0.2022.04.09.13.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:55:36 -0700 (PDT)
Message-ID: <70faae86-0eef-7f00-f629-e29b6159b934@linaro.org>
Date: Sat, 9 Apr 2022 13:55:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 41/41] hw/arm/virt: Support TCG GICv4
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dt1n71Mp3HHq

On 4/8/22 07:15, Peter Maydell wrote:
> Add support for the TCG GICv4 to the virt board. For the board,
> the GICv4 is very similar to the GICv3, with the only difference
> being the size of the redistributor frame. The changes here are thus:
>   * calculating virt_redist_capacity correctly for GICv4
>   * changing various places which were "if GICv3" to be "if not GICv2"
>   * the commandline option handling
> 
> Note that using GICv4 reduces the maximum possible number of CPUs on
> the virt board from 512 to 317, because we can now only fit half as
> many redistributors into the redistributor regions we have defined.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/virt.rst |  5 ++-
>   include/hw/arm/virt.h    | 12 +++++--
>   hw/arm/virt.c            | 70 ++++++++++++++++++++++++++++++----------
>   3 files changed, 67 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
