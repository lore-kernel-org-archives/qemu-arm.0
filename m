Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1341429ejc;
        Fri, 3 Mar 2023 09:29:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/UYT0oYludebT4Jnsqj3dcxDDLDo1fRg+mx8w3GX+ayBzAsUBubXSv/CBFQp2ExXF6wOWM
X-Received: by 2002:a1c:2b02:0:b0:3ea:e4bb:33ef with SMTP id r2-20020a1c2b02000000b003eae4bb33efmr2504025wmr.9.1677864562088;
        Fri, 03 Mar 2023 09:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864562; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4b7JmdBPZiBVUC9oaKdzFyFuRzS/8X6h34v9Y+y4gGcwMits1Q5VkRIUUTsoKQj/K
         FMUl9HWXNkBeb+/Qm0U4XErAN9SDVWo2DgxPvZS5Ev7//0PEnNZAT7fN2PTGbCyqMVJU
         Fo05uySpwz86zakB8dw2JulapEKznQLnjEYMXfoCQYTeZVghbkzu/S4BuYf2uavbX4fQ
         YI0r+JAvNDkD/SUXXz9bn9EXf0R7RmqN8tJyItNUKpZ9FlnXFvm64sN8UER5ajwWCMr7
         z9bZ/PJhEBqDGWyXWlQ3FwsUpn8E6Ch7sIB8dDCuqGyDsxxkmA6tkEG5DSC6u6T2dEz0
         6gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
        b=XxiEx1M8lEq2jMdpuGkBHSwBY3EXUgc1gxMRXwm52KrS2CsynE40a7WDopH7xE/6Ur
         +jNPvGdcj22hgka6wB3qQ72Vru/fDkHqavK7FkIMvF+bwZEHKid7F7t7K+Mx7UYqmYhw
         k6yd0YoTYtROJaK7hOzOtx4P9KO4Nw/25gMtUlxOkgfSShta9yq7lQsbHiSK9Kh27Aig
         I5fuprszPqUhXih1kzDt8Kn9ppUQqF3rpZ6NMx1KJEiiDShzcx9RMW3C4CiwWn3rIoTJ
         N0amrcS6lB6E6yDXFHd7Q+Z3X6a3vu0MmBiNaav6GfHM7x8eGlshoFodjzN9rDU/J9cr
         sQsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf4pvQci;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2-20020a05600c1d8200b003dc18751862si2178867wms.6.2023.03.03.09.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 09:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf4pvQci;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY9Dc-0005ve-5b; Fri, 03 Mar 2023 12:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Da-0005oy-3M
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:29:18 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9DX-00075J-Hv
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 12:29:17 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c4so2079199pfl.0
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=cf4pvQciX92KSrmXZmahY9k8P3fBP4VR2zZ5DWYntYI152R9pBZQIGzXpATPv1ZI7n
 JbpdV/he3jrvHKX7WuzZbgxfUKgt11eM1FFRzTRGizWRi20eE8m3fcMZ/QJPp608Wxuf
 3n/Z7kczicP9O+4C93a+A/VTNiRdUix+BWTir2YS7fVMbi7IWl4ivwNtS9V4OkO2zjnO
 qVMP8YHVOs9wOcj3rmOKthD0ARUmK3uzbgZWPJQ/lt5xuaKEAFizfPtsopkSx28TWDRb
 cI9/u5su+7OuP3+8EpAOMo/3sF2zuD3MJMp+4coRAKZYYLsTE7NZg2mVfKk4jKhYXKIF
 8M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aNps1/FowZmxOx2hlK5agPTOt7fAGsvKEYSNaTUjzYg=;
 b=O+cWB+U/f1HmYBvcv6KIctES+JOT+RGi/UCqR5FT4/ABgKl+r9TE1Iwh9XaszwTSib
 7o2GsTmJq8JXbnNOIQiSYq3KZenGbcW/XPq/GPQCkleS03c+LBhCjsxPdjbtOpMaQ44A
 CD+944GDDvGkfrhzWXkL+eu7WjNPL/gdC+aP96nDoXBd46D353exttcp2iKOBIwOaiMD
 /u4PEVqKYVBkSf+Lukav9zbC9MoxbTXffJCAm1/1o1rKaFPa177T5T8qQ9KEMpOa6tSo
 Shq4mGtabetl7By+A1UxCGrOIXlYRbjE8+ITUY42Upg3DrpugPbbgiEf5yTl95xt64LH
 HyxQ==
X-Gm-Message-State: AO0yUKU77WRSCvqrOySclDWAIDU3si3aOWhDtY007y6YjNYpzdeCyhMg
 q4Mimsrwmrl4hG+dHtuPZj5DbZVZK0o9+cjY816mwA==
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1203980pfe.5.1677864554075; Fri, 03 Mar
 2023 09:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-6-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:29:02 +0000
Message-ID: <CAFEAcA9RY-_h_xCYpmS0qh_FSOkL8CvzJhifZ1TQi2W2Gx4cCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/76] target/arm: Remove value_global from DisasCompare
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: R72GktDoVY4b

On Mon, 27 Feb 2023 at 05:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field was only used to avoid freeing globals.
> Since we no longer free any temps, this is dead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 1 -
>  target/arm/translate.c | 5 -----
>  2 files changed, 6 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
