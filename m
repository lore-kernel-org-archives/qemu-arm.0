Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1936277lfb;
        Tue, 7 Jun 2022 01:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz58n/usfwsAQANMsYci8mrT1J5bZrqkROac0HvTK7dfyqCwN6tGuyVhbhMR+6qTyaaQqHn
X-Received: by 2002:a05:6214:1942:b0:464:4427:7657 with SMTP id q2-20020a056214194200b0046444277657mr37265083qvk.64.1654592325156;
        Tue, 07 Jun 2022 01:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654592325; cv=none;
        d=google.com; s=arc-20160816;
        b=toKwCgp77lk6YzVssrtxWL1Egu+rPT9RNezy+TSS6rS+9uhKwJySfiloJgVtFBLqir
         L6jOp3eartp119633qEVdbo6HuLzhIr1+m7ZwX0HIdioBIpFm84H7Y/+PCy6VO/CRSKb
         gRBpBwRoKZ4nLUCSTNCYGLb/BqdkOtoUs4sPMk7tOCQCnlI0IF9R3+xqaSGCAyQTPQSn
         bJNBsPFcjn1a/io3XJwGeYswPyjtwIgGMOBQnDfM+df8uimM316dvzMEo1UJ7fUM3NjJ
         76b4boSyUpFDB3drLgCLxehqWGnn9yGXPAbD6qhJdMXBd4TluTDKADoYqFP6V5M4gYdP
         mJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xomun+qoifso+6ucaHGJGCGP8DAiSzl4a9PWzZmQdeI=;
        b=02C8qNrgykgIQIWZrTxYbaUsfkmwb4EiNvyNlsyMQ5JMUaPDp5IZBlHDpmKwMz2dvl
         JaFS7zFe6bBO9xoCmnpvsOkjdFz6ZRKLbnwasIFlxQuNKjs+6sy8QIy2gfwV+IvU+mLY
         O3OsDeqPo96N+QlC0vySBvikbdai2MAxy2OemHWTs64GiKYyTMHVdwnIdg5yd+MRWnGI
         e2x5OL9ETLJtiTjYu1aRGFvtxJPLTI1AtjQZTTli1tGbgSY7Z+kkaVhFyIIykg9zUfee
         ruhBNT+xfXecDkeEUfpQ0SVEOv45liaLleSyTIvLcSsA/Nv/CsiWV8I64DxnKDWIl4ZB
         b1uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIR8btJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a05620a0d8500b006a39db1d696si10019367qkl.474.2022.06.07.01.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIR8btJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyV2y-000411-Ja
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUw1-0007zF-Sd
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:51:36 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:34369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUw0-0003vU-0Y
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 04:51:33 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-30fdbe7467cso132675577b3.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xomun+qoifso+6ucaHGJGCGP8DAiSzl4a9PWzZmQdeI=;
 b=LIR8btJYIrapSvruBkcmq81D2u5gRYlZ2nvJbHAbT9NdWDhHyAKvjUktRzZSqjtpF0
 oiDOROE9c3TA3gl4LjOk8F0Zo7/vk5pqBA0hEksVqPgR07EagI04xwHS+Fh+1Ax5cRrG
 4B3yXpjSeFoAwBfQUMXR4czWv1w3vNikpHk7kWXJkj8x+LGSHvJoPaxIM1BA09y3sPpP
 RHLRWRisJ6kx1sfGHzIabnZyhl/xXOoe9/HUYJ83lkiGkJh/8krj1/GanrUKMtiDmzzo
 3/Jhx4W8KkI/o0Z35UbNk+ZyuP7Rx4y28nWfaHQwL2fr9nTUCWgZ7NbJvsFWMLVHwsU2
 rGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xomun+qoifso+6ucaHGJGCGP8DAiSzl4a9PWzZmQdeI=;
 b=vUXsqc2WryhQgnA1n9u8chBWgbvlZ1bV3T6E5bv5Iy208UyjG5E3yuyDZ7mlvS+01p
 5x3Lftc8Q1yCwqsecs294Ji3aLVQFZUn9kiL9otHLeVzwkiQbuCRq6CvDeIywr53wKHM
 G5fLWlxDX0VK+tgnnr/PNuAg6TEiUsn7QwR0c++7uQwy68bkX6g8J/6tUgtcLfVxZAAk
 krK7U7B6rxyv8ToCdkukYsxmxdKPP9BfN+dioatGiGyn/IxGyTZJ5L4XpcbHjnElV8fw
 mGXLlbqWgt8s9WnqsMWEmpKhu5yBWvWVX5EpRcAXes5LRPYBDzFGkqZpa7WeTGgV3ba2
 a1wQ==
X-Gm-Message-State: AOAM533fRfCbINRdzF5skVYH6PARpAq8iIOqfeTEp/KwWTz5yG0krhdy
 iE+pBX/7nzu6fRPrDGlbsjPfV35VY5l9ZbyDIg1m9w==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr31633618ywd.469.1654591890546; Tue, 07
 Jun 2022 01:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-37-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:51:20 +0100
Message-ID: <CAFEAcA9quqX4ZGbS5qY7wKuPz+DBJTHgFv8cQ_MZBYSKbW960A@mail.gmail.com>
Subject: Re: [PATCH 36/71] target/arm: Unexport aarch64_add_*_properties
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nsW8D/BAF2aP

On Thu, 2 Jun 2022 at 23:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not used outside cpu64.c,
> so make them static.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h   | 3 ---
>  target/arm/cpu64.c | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
