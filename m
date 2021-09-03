Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp751926qvo;
        Fri, 3 Sep 2021 08:23:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8G5+qTkHxyn2MXM/WYjh8ouTLnppgO+2Plb7MS+xpSDfFe7zJXzs8dsIH8GRp4IO/fFQd
X-Received: by 2002:a67:6c06:: with SMTP id h6mr1892254vsc.21.1630682584985;
        Fri, 03 Sep 2021 08:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630682584; cv=none;
        d=google.com; s=arc-20160816;
        b=eAcb7jL9jtU2/WiCqICDkYuK01FHlMBWXS32Ihwwn3qtLSzmPE73c91ak5H/C1SNC4
         rwLQy0VNNcsoDSYORYh6W/gdwIevMxAHOc3+BOLygIH+VlfiKQxSvDLLmbSAV1J9HoAn
         p+/Se/fICCy4bDtSztBB+gg/uekORrNyMAYAChPdhUeUAbbTEqJ6gp0Qo7Oo35qSwMkl
         CcmRnpeb3Gt8EfX3GTGQVDfbL6nJQhsU6rGMhr/P+RcKIHdNkCQB3cdKRQgtnh9KaZLj
         DZjcdMFmYHAGZYmvcpGZPcCWwkPjcmD4g0NRlMmKNZVlHUnRut7xdypEwhpvHRhLmLaF
         i8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kuUoYaSs5EmtTlWML/oxj1StBWDDRyk+vKyZGXXxF1c=;
        b=qtyIZTwGAPzCUKHvkDa4D+HUwwJYkOVMDtFXZ2JZcvx6WQ1GCK1Y2+D89rFpqk8+OL
         dh/TA+kgbMEwXifFA9Bf7ABP5X6/zOopj76GsW/NYZm70TMKrnmcpccwXRZtIZSBQFG7
         yRRzY0sEp4JxGhrobAyFJdwOsREZY6DUtxkb4IyozlcogiEK1Dxfdapu3idnyYkBzsE8
         6EFQb5pqANZXMM4R4CZ1TzDUkVKU6qOzkX4zacXwMrH+BWOcmytiBjFTJkImwlolU2fQ
         2vRgcTRZuIVWENzC2My3Xq1wv/fA24YA7L3escqPoTUozS+QWsxgf+pzX27URaAWd4VS
         qYgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gDJM8Dtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si2514294uam.94.2021.09.03.08.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gDJM8Dtl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMB20-0002fc-Dk
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMB0g-0000hq-FV
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:21:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMB0e-0004h3-US
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:21:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id u9so8715202wrg.8
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kuUoYaSs5EmtTlWML/oxj1StBWDDRyk+vKyZGXXxF1c=;
 b=gDJM8DtlIifequ0wGoDoI042fPb6FJA78rc/vAsXRWGO2vY0OPDIbwLhW4M5DjZjyk
 HPd3BecCVeCnmkPsxmTlLDVwjiC3tAYCkaajLahSpLaxol0t4FbG2G/At8AQ8Huvy+k8
 4Yh99aY/FY2QlxYnyoURq6SviqwRvVSuyT/LWnyptx9a7CyJPsDJDaa+eZwAGO7Fa21L
 tarNb0qKxbt31mQbGvEhc1WBPanSI8wHahrrFLdNU07VGXDcpu+gstlfEhsbJeD3/MAP
 qMUNKswRQS1nfZYNrwl+EpYRwaS+AKgOL4rraz0udESmS2CPUjxDiMY5Q4tNB1Jx+nVi
 b0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuUoYaSs5EmtTlWML/oxj1StBWDDRyk+vKyZGXXxF1c=;
 b=JkWQwjDijMuNCMc/UKo68xutwX4F2Lm+7rxUgVL4FPHdMsWZV+InpECn5IC8yRZoQb
 JHUgZ6aI6GS2G3B9wN5eEbOxXKjf62ofUFOnSCHCEDxKzui2+3K9j+qSg4W0/t40uPyi
 5zQVFExhkam7FQeDK7sM7siNiVuG4K+4/uwOC5KL1WbxLsT9545naBBRpB6PsvhGP6sA
 gNLBQcpllQvtHuuNvgwJlHsUGCl198R4hMjWydy9acefw9SaUbgVWuus2QpTiG0VriYG
 agG0CXDsnzbSkc7tmVClMpEXRRtIavTYB5BnAOv1rENy5DKKi/LKU5EaavpMvodV8NTi
 cTEA==
X-Gm-Message-State: AOAM532hjoh7LWkWIjl8kql190K2fIuAdX+g0zJWIaK8yLw0gtV73gjV
 gyi0+WY6piW+6HjkZnXeeBclQ+drnc/D/9+v1Kkhaw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr4874618wrs.149.1630682499153; 
 Fri, 03 Sep 2021 08:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
In-Reply-To: <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 16:20:50 +0100
Message-ID: <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: en+NykFGlC6A

On Fri, 3 Sept 2021 at 16:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/2/21 5:09 PM, Peter Maydell wrote:
> > Richard: if you have time to scan through the MVE insns
> > and suggest which ones would benefit from a vectorized
> > version that would be very helpful...
>
> VDUP
> VMOVL (into shifts or and)
> VMVN (which seems to have gotten separated from the rest of the do_1op)
> VSHL
> VSHR
> VSLI
> VSRI
>
> I think that's about all.

I guess also VMOV (immediate) (vector) ?

Thanks for the list, I'll have a look at them.

-- PMM
