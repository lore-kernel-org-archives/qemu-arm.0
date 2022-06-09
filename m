Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp556196lfb;
        Thu, 9 Jun 2022 09:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYuuvyvc6cXwXiTvvpyIL1wf/iKBGvQ8/jT6mn1sIG4ZdLjLlA62vJDNNUef/GvrYIdBZD
X-Received: by 2002:ac8:5955:0:b0:304:b3bc:b79e with SMTP id 21-20020ac85955000000b00304b3bcb79emr32614244qtz.84.1654792222111;
        Thu, 09 Jun 2022 09:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654792222; cv=none;
        d=google.com; s=arc-20160816;
        b=O72jsy35FzvCDIGl0N6A6lIfq3SvHYUYS/ygV6oXGiaS2pMF2GELC3I4pjy1oSIF5Q
         mI7ll/ihllge9Jc3iPESlegcQMnRRpugfI/Hau9uNMzU2vyOdDMfN4fihbhulVo0fDTx
         weeEjPpLdQ0FqJNAncpVd7sXd6r2nccQ7AdBdxHYaFoMlBLMLaAvqyJrWhhtGXHsX+HJ
         Bg6/FshOcut5T8SUeXMqVBfXIByCeZYY/dT4RBTscF3rbPDtbqJ0+01SMbY73v9M8bJq
         uioldgboHI3txSc1FVXYv6tHUxj1IHdSC4AP2lyOmprbetfKNUY44cxfqo4eVbYPZ8lw
         mkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uJ/u5jDo7NY/VXpQeLEdVORR+/BuWGCk3zqk1mwJ7yg=;
        b=F6bdfTbI6BssxbRxVv6rFp/FzDtPBMHxErtdBYBFMMKxpaw7bmJf8BmLLVrMUd3M/u
         pl+Vd6stY5ddkAytPxzRkFABLAa+ndaI6u9Tb6CkHLnzHLo0a4WSgF0PIqi7ZOWadHjW
         DpZNWVNE/kegnp+zXcYRPJcK6UHsYXBxZQoRbbhsJEdsWMvhpxUODtTs7WxsihPavHzZ
         cOwCi4qlLm2LrGeUfcb1lspaB07oG5NUmHhIGY6D1xjP+NazJK6vw6+a5pb7uNngULK0
         +433NedYC0QSqfPHrtLo1Co2aFlYvpoZLaNPHJQHm6vd1JBSUrq1ANqeEOxyoyxrGuke
         8X2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zY3CQC/K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020ac859d6000000b002f3db75589dsi13370047qtf.501.2022.06.09.09.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zY3CQC/K";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzL37-0007ir-IJ
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKag-0007Em-V9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:00:59 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKab-0007K3-Of
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:00:58 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id r82so42455487ybc.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJ/u5jDo7NY/VXpQeLEdVORR+/BuWGCk3zqk1mwJ7yg=;
 b=zY3CQC/Kp6HQNoo+K2Vi6Mpv9dNyptDNU1V5XuTFdZRQIcM64Nz+tyXwD2GFdmXBDL
 neN35pcyACAF/lqZ0/sL9wvBYHtMgvvvxGAcLh191hG+Y4yau9OOTFnWD2dHmnYiCoHD
 y4iWRS+oEEr3ozB0VesXF6xdpuQZ5I4Vvar2rv+QgIETsO2cF0DYlDK4mZol9lpqXCsS
 M/K7WBBcGwqtWVeHorc9UYAcYdN1O7H2muLDLiPoVMeJ4FuN17NAZhCamPmo3Kkw/mly
 xNSO7NwRLHLB0LuNiQL1rJt3zlYo0mw8LlwHQTMHO3xoiAjWy/87ws6/ERy/gY8GRHdw
 2ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJ/u5jDo7NY/VXpQeLEdVORR+/BuWGCk3zqk1mwJ7yg=;
 b=hiXGKJVlMn9mBsiKSpPWhcvvVJs1yqJBuk78RO6271wfI1jiDq/rHRYMw7BQO1RmWU
 s02NTgvXW/vu1Eo83Zo8/pRfh88AqjM2qjXUIEcWJUH0dykkl579P+fqFl4kZlVQ8o/p
 2gJ+qwjOojm7xyzbHgOyFn+qgKaEDJ6wSOm9M1/X96zQXMavWKyZlAEIBaIAmAY/O0+H
 kMORTGekzlYr9kcPOi0pO61IzEFDtqd20Ry0NV9D61BrJqx/uxmqQfOOHhN+DLUJumDX
 Rv1v8KsU/OOvT6R/FE5B81ZpV0rQEpqmty+1TcuyZH9jVU6y8IeWUUS8XnH5jX9vpIXZ
 WKpQ==
X-Gm-Message-State: AOAM531P6JgDhZLapkS1y80DhkhvoLZnYCDWkjptXEvA/170SneZ4uHW
 1TGqlCszAOg5ihiULKOhBR8WZYirTh0Cy4PLmlWFjQ==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr38606027ybb.140.1654790452634; Thu, 09
 Jun 2022 09:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-9-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:00:42 +0100
Message-ID: <CAFEAcA8q1xeVjmt_4UwR-CewcPHZ4Cau0bx_4-Nq4e0iY6V8ig@mail.gmail.com>
Subject: Re: [PATCH v2 08/25] target/arm: Move exception_bkpt_insn to
 debug_helper.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
X-TUID: W6oP3GtAF5eL

On Tue, 7 Jun 2022 at 03:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 31 +++++++++++++++++++++++++++++++
>  target/arm/op_helper.c    | 29 -----------------------------
>  2 files changed, 31 insertions(+), 29 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
