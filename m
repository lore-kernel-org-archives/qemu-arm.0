Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp823214ejc;
        Thu, 23 Feb 2023 07:23:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9voeDP+NV/17M2Vn/4RHWQmbOOjqiJK4Rsz7Nm9ugtItE5Cppwv3l11Jrh1AvdQrADdKym
X-Received: by 2002:a05:6214:d49:b0:56f:8a99:1a64 with SMTP id 9-20020a0562140d4900b0056f8a991a64mr24201315qvr.4.1677165820248;
        Thu, 23 Feb 2023 07:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677165820; cv=none;
        d=google.com; s=arc-20160816;
        b=bAc7iXMs8qWzpvJK8dwFO08GwWWPUpt3G6WlpU1AqZVZJ5WgO7baE4kPsI9+aEQ7Hf
         +8c6WPSY/Eqd8u+FDLIffMf8RnCQfgx0uxvSU+sAIdKBcryvsizq/mS5KsVPbjWMVsd1
         XOVgRVeyZnA3dWu4qlM/VEjvyZbL43z6Ks7EqZ/iBqgjyXKynXODBJIsFZtCnUIiRZ3/
         h9WxlhLldMNwfT7uHMWwe6f1tEi7iONflDTqrOHvR/qRScsgFKM/Np/hbpEXos9TXIUg
         Emk37rgJUI20+OcfbbHs9aOVtnDfbOVIkl3auols5YuevIaEnZDzwBNxYFT3yb4+I0yn
         uGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=flvNreU1ZmeFjUF6wIHapxkgykr+7+DFu64SIfPhOgc=;
        b=xzWSHi4a+LTI/Aa3ikibD7LvH7TwHlaEH7tjUhY7qVHXNtS9e0ElHrolHcfQobEj3B
         hMWkk+a4xSPcZjMeNHM4MzncCIGpsOdF/KRnhbcdwMrXELyiboCdJtn60Mha53c5mEgd
         KlAYTt/QujpyskwpsfwLOV9A/sOndyFqt0i6fjWPOmYRa3S2kNRT9ImIUOba0adwIYh3
         I9EuV7fyM8vsAzAd0AK6FdICrG+yGE9F/pbh1oz4HP7aYoqZqQ+gvU8ZmYt1SZpV5ole
         rIkN0vxg7GhWsicGePx6cGCdrA9G+2Yy9Z+SL2R/0hntHxLyAinj7lef1/c0x/wzBbyi
         TxYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9cv1vfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14-20020a0ce08e000000b0056e99e1980csi5938870qvk.551.2023.02.23.07.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9cv1vfM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVDRL-0000LE-Nq; Thu, 23 Feb 2023 10:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDRI-0000Jr-FQ
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:23:20 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDRF-0000c9-T5
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:23:20 -0500
Received: by mail-pg1-x534.google.com with SMTP id q23so526572pgt.7
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 07:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flvNreU1ZmeFjUF6wIHapxkgykr+7+DFu64SIfPhOgc=;
 b=K9cv1vfMsKUaL1omJ3Jv+d/NtD6hidmPfmF1fm0jozoyStKMI2oFZPXbFWGlkll0Bn
 3Y0VijtVXFPfs6I6vAW6b6CKyj5YJpbzZSs3HY96fEHb5KKN52T9g+i76XQwmlS0nvrE
 8Wbrvw2jCWLVIEvnU3Oyz4HmWNxyIbviHDCL8PbMEz7RP5RnI5w6YeoqF/FYWsS+dWJI
 5slE26pwmY8M/3ydy9/ojKNgLFrmtdM1npNw8juel0riE5R89i95njhJU5enEsZqRSnN
 LTaAh6bPg7Wao5agt4jv9knwTYrCbzKWGMbuCSGcYE1+NZ2S7oIJMt924/aB6k+b0B8K
 jhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flvNreU1ZmeFjUF6wIHapxkgykr+7+DFu64SIfPhOgc=;
 b=lncmOlKHCvV23pndCv0NbQgCFb0/oI951vraDDIg/B3EdRqtBQhTE9CrHt5CaH3IYH
 NfdxeE01TpD0Gzer8NH120tEMQSYUxrBm8TfSs75LMxTU5jUxUyLLmqMxFCaJqkbYHPQ
 pqYVRrZ/WA+fIERqihxE9NEjD7/wcKRgW+BVYanzkRFIfOJzwkIGvnZ5sIQzwasRqimq
 JDKgpGRToQ74mDTyBZACM1Ui/e/d0XLkkelbh97WFCzAvlv55LnqhM8ZPFhcnt7Izobf
 10DvdzNn4QbCdQ4sejbBBynuNcd/9khwBdAad+V1H89umozxKx/JbbDIFcAEfx1z1Nt5
 5NqQ==
X-Gm-Message-State: AO0yUKVIaL/rl7Nr6v/TqfEBFUMmRmUP+OncmhDx5K73dDkIO3Mvpu7r
 nWTF6ChkiNlciytXXuU1J9yLHFv7G3FxEwbnTf4nag==
X-Received: by 2002:a62:e401:0:b0:592:453c:320a with SMTP id
 r1-20020a62e401000000b00592453c320amr1794009pfh.5.1677165796457; Thu, 23 Feb
 2023 07:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-4-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:23:05 +0000
Message-ID: <CAFEAcA-CJFWSbcvH08szYWQ8R3qxgcsV_DO33VXM9T2ZK6mP2Q@mail.gmail.com>
Subject: Re: [PATCH v1 03/19] target/arm: Use tcg_gen_qemu_{st, ld}_i128 for
 do_fp_{st, ld}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TdVkLOy9b9m+

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we don't require 16-byte atomicity here, using a single
> larger operation simplifies the code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 38 ++++++++++++++------------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
