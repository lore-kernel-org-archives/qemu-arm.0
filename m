Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1450658lfc;
        Mon, 8 Feb 2021 11:51:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQGNKUr6W0Jk3Dq/p7XnHnV+q0t9+m8AebCFLV8lajlZga1NbG/OOMUwD78g//KFJsk/DE
X-Received: by 2002:a25:d441:: with SMTP id m62mr26711274ybf.109.1612813879884;
        Mon, 08 Feb 2021 11:51:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612813879; cv=none;
        d=google.com; s=arc-20160816;
        b=tNqYZl4ECh4oqXV+NieWuQK0Ds7WIUDthiO/R3Es9SpNrp0Ymc0u10uoz5J7NGVkfh
         j3U5kQkH3HkbjNaXxISvOUo7pejGtoEqHgkq7TSV5/AyTNtKAeBpWMN2hQzhdhKuGa0s
         TefhT6jeSxq6/76RSa5Magnlil419n2op6x7Gg4FytZrOkOmtdmbBQtuswT4VWrxKNNE
         2t12qQb1SJKzVTvrOr5p4nCYKCFDUxYmuE1Qzu5WHAUpJJw0IEyYlwGG0WUfz3eFPuEw
         mrbc+ah6YnhW9JfapOPR1ItrBnwURwYdCQKAR+HBJ7OW3ysVWASpYjN0DUp9T7Y1gBti
         5jeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4fhfLpYOTxB/e5AgW1sQsAyU4PSjyxOuRnRu+oJ1l0=;
        b=ZHZz4EsbiA8GmFuEx2sZz4Xsve2ubaF7RESpOY2QQsvsxkICDeJj3rqiHWcvmoKOsQ
         z2BrGBejH5Llmq00dr1AzXX1ne7N3Gdzd5c7ddNuoRPRMHZMLQXA8XeGvTDyLJexEIBf
         8QTa0GLe0+T4MI4Z9XChCCcy1eUKm0basXszdSWgBf6q+CBiq61PQr8xbEJiQI4xIAFP
         XKqT+Myn3KTq/hRe9Tu+2DTwYOfXEMKDSPtR3GI/uYwcgEmGFxRBRDxQykH98xt0Mf4w
         BmPXUCfyYdqFab3p8Q2q9KRuqtSsipnJAHtjJpj8PNW0E9jOGTSc1mLbaNvOCT8XBLf7
         ThYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dciXufr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si17261776ybt.336.2021.02.08.11.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 11:51:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dciXufr+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9CZ4-0005zO-9C
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 14:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96tT-0004Ln-Bh
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:48:06 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96tB-0007SJ-Gk
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:47:53 -0500
Received: by mail-ed1-x52c.google.com with SMTP id q2so18143223edi.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4fhfLpYOTxB/e5AgW1sQsAyU4PSjyxOuRnRu+oJ1l0=;
 b=dciXufr+Qc8ygz1gSPaxiAD57yBZLpVYeif5F5mTISucP/ih6HXRBuWHrClmMvFr29
 zR8eYV7hB166euDpKLACHKPJ5j7rKERdKqvDkZzJPHvVGb+8D53cxhm/cWCRxFbFSXt/
 sCCCENJ/Ofu3AkAt87zbVToxMvGkyuONBx+G6VFDL4pfc4Ixf3ykCvvChWDqjVkzE6Em
 SOOV1BYs8paVbRJQPp1f2+UWsVw0uuDCzPx5Ilkoawytb3wGLVlYjUyRXTMaVfw6xvRc
 JTF4Kw0k5EqAaXLN82JESMvqgU5UZYchnf2bUcjKB2mDjZxsl3Q89b+zz4geRvnvS/Qf
 JpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4fhfLpYOTxB/e5AgW1sQsAyU4PSjyxOuRnRu+oJ1l0=;
 b=coHbkHHR1Dh/pcPlzSXxol8PeXDVsESXJS9VquzWXUSLq11HLXM8JMtvtxjKGVetAb
 tJPip8kjUH9yAapwJMBC5q4bK7dzeHH+0AVrOOouke0xtQCNtXJaz4zFAKbMzJQlok8d
 vZqaYUxpfe8v/tVcJjrg9QLng2V0SBSV7bDgETRNKLidq2xPJhF8Nnmhmaw08oBrByIi
 AkfHmes9u60oZpXstjFoUWa2WpsdfvbAZSU/MsDkrQnWehmc95k/B80SxM+LOlVR1/Dn
 Ll7hQzTfb4KDGRVqDOo0E4j3YG9ef8YSMr0J7JD2AkrxPscqaMlwPRVR5PApTkrdyh81
 rCdw==
X-Gm-Message-State: AOAM532lI10/Opo7DNq+PdsVfjLHuCNlGRiyMtYjKhGFTxUxk6oCzl23
 BJ4k/1/nNVehnPAMdJA1EbXIf5LqSYCEPveW3Ntqcw==
X-Received: by 2002:a50:9e01:: with SMTP id z1mr15658050ede.44.1612792055320; 
 Mon, 08 Feb 2021 05:47:35 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-15-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:47:24 +0000
Message-ID: <CAFEAcA9c-F2PDyGg=7e67KfNy=C8MagLngjTW-suuZxBHmGe9g@mail.gmail.com>
Subject: Re: [PATCH v5 14/31] linux-user: Use guest_range_valid in access_ok
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5vmHl67a/ck

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're currently open-coding the range check in access_ok;
> use guest_range_valid when size != 0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 9fbc5edc4b..ba122a7903 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
