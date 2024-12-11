Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4177029njb;
        Wed, 11 Dec 2024 08:15:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVOS8bVf7aQr4TrM7V8Qr8ll3BfsOLD1K1a9OUhQIaQ9CCyike+wqjXcAyKFSne3FZYV6y9Q9V00cgjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFayP+Flif98fv5VtAn4er95ksIlb0GcfB5Gr8o7yrz4BACIyHCgRZE4WA2B5kD5Jztq2x3
X-Received: by 2002:ac8:7d8f:0:b0:466:8616:2553 with SMTP id d75a77b69052e-46789379e86mr51962801cf.48.1733933728111;
        Wed, 11 Dec 2024 08:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933728; cv=none;
        d=google.com; s=arc-20240605;
        b=HXsU7N6SIQRUnGha4V6ukIPQ+QnIiCmBEhXmFJtQukwEC0tEaR+RjsU+IiPVBEcDrX
         QuKPb2M1sc0Px/drAhSRdRvpOL/vB2tMHGZJP/ldS2UtnNVdZ3+t7BSNO7IvVM95onN0
         bw1HkK32cMxdP6J5JmuVHUSkEKyj63uVuJ/Cz17YJ9O0nAjBJc2ZN/rT1yrkw3F9E8/i
         FfYQAmlYoKjI8xo60RQ17G/WROZGgdZapcNgcCUjl0slay/gBfSM6yd2G5RyynShNdm7
         dljYtW9MGRNrjd+XL2YXN6Sz2GZaoPxd9D5jDtTJrJa8VV+46eHjKVv4GD1rppxn8dXU
         qzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TlpwIXmcyz6DCaOErKJBIKCl8E1QjfX9Oj7cY94iv3U=;
        fh=0WVXSJeN1egGjH9/4qzdhRGClU0xSXnyzCzWpCYXXNA=;
        b=g2b0Il3XWWD5vry6J4b0r0LqJeWAynFtb4KMfjxj39jWa9fVvi7ePAklwJqyg8m8Jd
         z6NIrOc7g/z9D9JJIqp7kR3sEjP0ocche+rhOPzXHv1zai/UlhPEeTXBXdmbRllQO+ng
         50KSqICe+WoahuFbEmJ5DJgBZ2cYOR6S8hJxDopnbLHQ9iBo/K8wz5NYI9hwxQRTr9LQ
         S6bJWtZlh4q7hvw8/G6zMs3yPg6hBtNhhOV6FiA3cn5lA01WO3tPDH/rRrRVegm0efVh
         zMUhPw+SR/x7FMAtZ5VwryN2NalW8fvgDcv2C36J5p/BMA/+gXeo7+nk3U32PmPcUnMa
         HnoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9ShLHLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4672986bea5si186020731cf.722.2024.12.11.08.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:15:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l9ShLHLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLP35-0003i2-PG; Wed, 11 Dec 2024 10:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLP33-0003hN-Lo
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 10:54:49 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLP32-0003zN-Ad
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 10:54:49 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e399e904940so5351321276.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 07:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733932487; x=1734537287; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TlpwIXmcyz6DCaOErKJBIKCl8E1QjfX9Oj7cY94iv3U=;
 b=l9ShLHLCdjonlcYNW5pNJ49Gjxcv64JbKSTriV5rZ8d7CdJzVcw/6YstHVX16fujFU
 qnAtwaQFq1WUNcfxl/qmgvi4fpSNeaBHsXnNwWs/lnHFLz1FJWtn56uto9U8NmfZFqya
 6S1nHOv72w4KW5P6HD0Vyyi9GEPP9uOGmpb6FrRt0MAVVW0eo6VPAcRuJcXXJ4iDik5Z
 PtO8akhvmQ3kcBiAlkBFGsc+gEEGITFnUI/Ii7zHpZejEogB2q4jDHb+Bs3MpP8e9JVb
 axmWdJSAcg7NNXjppuvbkk67jyp6XAkBhQWcowPVuWOXe07E9/IR9Xrgy8RwyEakXEdS
 1aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932487; x=1734537287;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TlpwIXmcyz6DCaOErKJBIKCl8E1QjfX9Oj7cY94iv3U=;
 b=XioX+JmDk1yHey1awLHPrQ7nlRJkjr/oZnt1TbrC/nCyejQw75S3S3QvZGtssV8q1c
 051nOztun5OrB84mWAA1ZI3jXY/BQO3+lhMJn9R4VNl2Druz4sAbf3FtFJmiaDs4/IED
 MEl15dKBgRryYjk2cB0pU1FwfdU47KASbn0mEHXz5OyeCwFBuGIegRumm09IScZuAi1U
 Io+HVxzc5Lgjjui/mEGYBezDG/v11aWS02/Lx+/1myGWTmIIruRjEWC27QDZVRO5AzwX
 O1VJg8EZk+n/q22oELLnnu20DW1P7pDlbvVFIGi5Il07W4gJOURXNm/xNhJpTRu7W4px
 8aIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/MyRH8P+Ixj5vAKm+AKMBu4Rttea5JiJccGMMLVhGUGpBlJRU8yewCYTxclTUwywR3KykckfORg==@nongnu.org
X-Gm-Message-State: AOJu0Yx99nX6UCBbzA3UAupxFJco2kopUJLVf6XiGdQt215ym6n7Pu/s
 kyJzkavik817syWPnJJzspiX9lN/XDIh6nSXGOODo+hUm6lbGmhqFDRe0Wv2rQ4Lkq90G+GJlog
 Yh/rTeuGUJt1p1+AcIYeUxIJQuhS8xk4xoZLeeg==
X-Gm-Gg: ASbGnctCv+1PqWjwdE7UxHb+6ZomydjCaq2ixNrybg2jb56Qp66FNyMoPtT29R7cLUV
 au8wiTSgg/IR+QWfjNJ0nWrp6qWO6k36rSGHu
X-Received: by 2002:a05:6902:1549:b0:e38:a15d:40ad with SMTP id
 3f1490d57ef6-e3c8e42da9dmr2370440276.7.1733932487205; Wed, 11 Dec 2024
 07:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-44-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 15:54:36 +0000
Message-ID: <CAFEAcA8xx_FWYcojWAQHQstkPH7GO5taweo2Lop3MenGpE_X=g@mail.gmail.com>
Subject: Re: [PATCH v2 43/69] target/arm: Convert handle_rev to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: uzhHSG+e0KtU

On Tue, 10 Dec 2024 at 16:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes REV16, REV32, REV64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
