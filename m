Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp368718lfg;
        Thu, 13 May 2021 03:50:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCoZ+Q8LQKQfuPWiEaqmtHgyPEGO3j7SQm8bj9bpQLc38ZmtUB9reiGJG4sd7gpVqFG1uB
X-Received: by 2002:ab0:21c5:: with SMTP id u5mr7054252uan.84.1620903055210;
        Thu, 13 May 2021 03:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620903055; cv=none;
        d=google.com; s=arc-20160816;
        b=SW85ha3hFFieNhi7mXNyso6vwgYR8Ih4J3V5Bdk0zVZxoIlbLBpUg2QatuMfjjdZC6
         8teiUXF7tJVkNd/hFIjgc8+BIxZOPz62W1MFcKwxZEuvRyeFOCvEX+O26t92VGh2+myb
         HbYb3Glii/CEKP5zt+28Pxo3SmROMhnRUxh8ERtt6CgcUCyBq0pKh8pn+bE/j+obVGXm
         KgNfwZm8FyPO6K/PNKsRq8IJY1ZlNNFrVgrNlII+nJ6l6C5t4lHIpaP5+GHG+yDr5qs6
         f28O48Z57t9PFrxw1ax1KzHGp6NgV9JPB3Z0DGKwa7uVWhV5GfVMLVv321aEaBR0R+87
         BweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WYNR3E5xBld5+hYWcPBTYDEgz2OvbmhDiBBg0vbQWXI=;
        b=YXVxrv5AM73NdLvfYadJPD3DP/PCmlGBqFOr8njOraZU4ViIWSPk+y2/aiob0lkPre
         zEKon3gUVG7Qc03RU5iip7HmHlvZhQSRwxnwoikv6CTCs4DQ8z/fnfzouEK69MBHU0d1
         b7LpmVk7u2wrnohsP0fDIo5gdJZQD5e3yvLCUwMBtUqU6Mj/7AE+2/fKbQwZImIOH/Ub
         QOg55ict+nGHwhrVxncx8zcyu9SQuSivAonVKhxzTuGShc9z9stPDVb47G0zcR5+KuCw
         bORxGkL/U4cKdEIzUsiDbnwjc00evInXLkqQoeF1JQpoPxGQM5CxINOjR8y9FPx3xtcX
         F+iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlFz3+6J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si1628034vsj.12.2021.05.13.03.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WlFz3+6J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh8ve-0004K8-B3
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8tS-0001xB-3m
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:48:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:33475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8tQ-0003Yq-HF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:48:37 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b17so30483280ede.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYNR3E5xBld5+hYWcPBTYDEgz2OvbmhDiBBg0vbQWXI=;
 b=WlFz3+6JoNgUbKeeBD25emxw1cr4qo9tDKmJROtUkDOlj0hqnCU9EL3cg9ukcSLOD3
 3Jd0gUJd0e5lTazoAaZm+TfQJLztEYCjhIIRWP1Az/9DUAcDYQWqASAnEe+jnK12llyR
 +OMiIMFRArd7hrwNzbPAd5JQAgu+eM+rLk6ar3DjqYYMy0CaZlGjaO0/RcN7T0gwYF9z
 vVJtvjUT1duYJYoHRXLx/fywLhEPluh8IvOzyGoqcobwHJjD+VXJwXJiR5QPpTGnowON
 cX3isIURRvT6XSMGKsMG1LbabnyQSFC1Hlii+4eXZb2JhCm9q4VACce8HfjD+nWu/zSq
 pgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYNR3E5xBld5+hYWcPBTYDEgz2OvbmhDiBBg0vbQWXI=;
 b=YFz7QnVgICwADuAevFhnZtQ7zF6C70IlaZ3/+c0Lfqb7gdE5ioDLjqaPEf7AQuhm7G
 tBO2GRoCNKYGo7DwK71SagZ/savrGLks9MnULXxdU92crsAlyheRcksU/YxfkwAAS/9N
 pThNvijZPVwHfdYJ/MOafAREeeOlf/Jt2O/RSKjkEPeydbT0QaDjTHEgktjuTJ+PMQ+8
 DiM5NQpfOpOjku+gPRqjoUSlgpFaXxALONCwOT5T3U42QzdfoyEdrewTO/qZ7SHG7XH9
 4pbpuP6oKQk1uYG5R5ydPitskv+Ch/3gN5j9Ivc75Z06OBmrStu4r27WcSwp61moilK9
 Lmyw==
X-Gm-Message-State: AOAM532yqEE349LnYxCn+5Y7rB2kP7omqTSxDST1qxuxVmgQW/XgF3Ft
 Csej44Bz0RPEIOP6kqFW7vhlTRu5N/iZFAxn9fAPOw==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr48883461edd.251.1620902914960; 
 Thu, 13 May 2021 03:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
 <20210416210240.1591291-50-richard.henderson@linaro.org>
In-Reply-To: <20210416210240.1591291-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:48:23 +0100
Message-ID: <CAFEAcA8wiffznNUXw8fL6Y3-Sdx5h28fux32+N7K4JwY5b7VjA@mail.gmail.com>
Subject: Re: [PATCH v5 49/81] target/arm: Pass separate addend to FCMLA helpers
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 05PUoXEI2C7V

On Fri, 16 Apr 2021 at 22:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For SVE, we potentially have a 4th argument coming from the
> movprfx instruction.  Currently we do not optimize movprfx,
> so the problem is not visible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             | 20 ++++++-------
>  target/arm/translate-a64.c      | 28 ++++++++++++++----
>  target/arm/translate-sve.c      |  5 ++--
>  target/arm/vec_helper.c         | 50 +++++++++++++--------------------
>  target/arm/translate-neon.c.inc | 10 ++++---
>  5 files changed, 62 insertions(+), 51 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
