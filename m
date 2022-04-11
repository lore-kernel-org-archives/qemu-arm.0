Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1726748lfq;
        Mon, 11 Apr 2022 09:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmwIav6mziykQ/rzqK6Kotrv8f27jKr1Hl//y666DWDwyTEDIQmQPHHQWeNhnhm1lngZJd
X-Received: by 2002:a05:6902:4b:b0:641:619b:94c4 with SMTP id m11-20020a056902004b00b00641619b94c4mr3678934ybh.648.1649692961713;
        Mon, 11 Apr 2022 09:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649692961; cv=none;
        d=google.com; s=arc-20160816;
        b=LO0jYXwa2AXHRiiTY3TeCHa/R4EokTNpU0pdERI2CPm2WOgvXi9fnahWoeGYvtXl8D
         PmiHgu72eyCD1yAlYQ3RLt0Yv2G7FMyPmBkabc/47cae4WNUHlbXe8dWZ9uLVmiAZ+BQ
         MMlYvNF21mXtSVj31PQWZae/E3a5Sp4tWw6XV/YTnytjkqwGu+shXdlCCB4vqVgsz0c4
         nXAb7P3zwjW2GXvALUe10WWJ3YfYhi9U2B6X0BnvLTEzhoSlRr9sopVhsv8mBazToY/Y
         R0zWa2BkJ5jlP9P1BhpzR09hy7/LH6HtEv0qjmyeUuXyEY2QH0ebiOWngx2mWo2DvUjY
         4P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0I2JaqxtIsEx5SmzX+favuz5CQeeHHWeNGeBomrWEY=;
        b=hJ2vGFUXccsTbT7Cd3ryz0rRNUFiMtppvrTOr0u67L7LQvGPPu1fRh4rM3LXbaLMuU
         FI39oCpDaERmhpA46xkEq0hxpczaCrL/tPOFVDlvnoK7M6Rl7fsAwG5yhq5AZ+8LKZcq
         xGCJvR+pR3ggdLQyUJARag8Cv7b3f0kIer1K1uZX9AxF5RUoniC/QXcrQJmp4Kp5TbHP
         xI1TC1zNYfVCBcJbLzu2swI4T8Od2kDvY6PHrMJMdZt97uiMRrQMbiar7xqwKnV58b1L
         5DiqGj5NazvUX7rwyNRnvagxC6FEubYc0mT0rVA4Q5X8lQBbXrfa1dw+h/ujxua64bYs
         D/rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Foj8fV9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a253b01000000b0064115d07825si4298723yba.196.2022.04.11.09.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Foj8fV9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndwUz-0002YO-1w
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwTZ-0000sh-3O
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:01:13 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:33338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwTW-0003s6-I3
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:01:12 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id j2so28397268ybu.0
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v0I2JaqxtIsEx5SmzX+favuz5CQeeHHWeNGeBomrWEY=;
 b=Foj8fV9i5zpWW/BXF9p5XYMXz+Z2ymOqtG8iLgRBAkXPNl/ueNF4LJ3UXmdOYhjY1L
 ElbPPjIeZCJA0cxbZL7Cjp7M3tD+7aR/dSVn30WWwv2oeNPa4aeBSFPQgN7fkFnXbCHo
 9F2PZPrT5UK9RoUe2TWRrFnCQxH5KS7s8CSrBJEiyP6VfG3ELzz6DqzgT3rdfgXm7rpG
 THMPLA/pDViTki+CNYJbyhpdKBpZ2aSUe4ZIf5LJU/CRXI6T8x7s6lT7mWkQp4vJslUM
 yspApWwD1ngb80w1MHjqbzwOqS96qvzvBhmTG6vf0Qiwf3btg/vl26zBswgjvuSjSzEf
 +0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0I2JaqxtIsEx5SmzX+favuz5CQeeHHWeNGeBomrWEY=;
 b=YmXbEKkVXowaRWuoraa9qKVocI5TBoFkNPU9kCEqDVJAAVIRDbdKRyOizl5JcQf6bJ
 DQSw9dJcpfj4KuKawqdw9KimgVDid1E/xTOVbDOFhC+HeJjI4Hrk55ylxoX9y76I4nqV
 9aNnZhN1KUHLwnK0dnPf3sPJ7fPAg5VNekUpO9l/hUr5Df61xWDBTqqscH/3/igWqLb2
 twB9hDuRZZeD00OWnf/NDqWG0/yZZFQgwI7IsrAYpu16M7G5Pp4lLDn14GEVMhwbC+tN
 IgV9SX7PSVDDuaxJRwx1cyi/Q9boNeb0PJnztWi4Oh6lStYGuFVSHiGoQdqHjcNnJbnu
 A7aQ==
X-Gm-Message-State: AOAM533q3RCjgtl2bwRAgV5bgoRPS5kJyrhm4SwlfJpcF80bYvKYaCTi
 I1h/zFeu9EG9IdGNYxHgRPfD0u1sYwGqMkxG4lpxrQ==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr22941998ybq.67.1649692868919; Mon, 11
 Apr 2022 09:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-14-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:00:58 +0100
Message-ID: <CAFEAcA84JRXpwUzigYAUoN5Oz4RgQhpvFmukB5q2JhCqFPcD4w@mail.gmail.com>
Subject: Re: [PATCH 13/16] target/arm: Implement virtual SError exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVvNkGRQifaM

On Sat, 9 Apr 2022 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Virtual SError exceptions are raised by setting HCR_EL2.VSE,
> and are routed to EL1 just like other virtual exceptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       |  2 ++
>  target/arm/internals.h |  8 ++++++++
>  target/arm/syndrome.h  |  5 +++++
>  target/arm/cpu.c       | 38 +++++++++++++++++++++++++++++++++++++-
>  target/arm/helper.c    | 29 ++++++++++++++++++++++++++++-
>  5 files changed, 80 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
