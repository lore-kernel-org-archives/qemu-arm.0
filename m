Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp394892lft;
        Fri, 24 Jun 2022 08:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXH+P+IG1mvMEw23ijmalq9jqG4Gm5CTuIsCcSq9r1RDRe45IPOFxqaxVxw0jzJCIRd9GV
X-Received: by 2002:a05:622a:54b:b0:305:1f15:9688 with SMTP id m11-20020a05622a054b00b003051f159688mr13327652qtx.417.1656083467467;
        Fri, 24 Jun 2022 08:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656083467; cv=none;
        d=google.com; s=arc-20160816;
        b=kkTENCpcbtrOk4tqg+S1z7vaufm1DF1bcD/gujOccJ60c+gEmcwQC6e81L51u6ozkD
         jBjYYP4fmXMS6KNKlQe/aKLQTO1+tAFJNOVDoDYmrrBfvE7WdwsOmL8xGawyhNGfRbiR
         Ui30s/OmdEAw/mtHrj9LwWbkEGbSlbuWv3cfW1mBtiyZF2JevtMZcuxsJpfdFVBNmXI3
         FdFEVCASXBYOLJxpuTD1TOy83wrWi8EZiDHqvtspj5OFYrvKXp5bDviq5obofITLs8cY
         H5VWbEFJ6HeXkyU2+OsVBrEORrV+GAbOsXVqz8RSSSKV4OqZMSkGQMRnr3qbNVUU+0m/
         I63A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uhAsNFJZuMxj5B48U52b+UW+vDqOA5FhHGh+CM8j8hg=;
        b=QDi/x9aO3ah8qmM3aJYZ+vLr4ow7PK/nEOuTO/YHh0Ywt4nYm2hFWeERiootdu9TI/
         wdHye1AR2Z9L0OnY02vONSxJsl0z3hU0UgIdj4K/RXGv231JBcOU0uaZgemWdh+qXTvf
         re2+fcuOxT5V24teYvD2iJs+djrrvhvo+LG+mKYvz3/c1PcB0S/izXEllV42HJEilgO4
         CwGGszKxc63Z3Fr9mmvZmjChy99SWK+qqzsjoQQ3cjEUx5B8YFQ+1qn9IwTtJz07AqcX
         F2VleV3HGvBslxpmI9jxZ8DHZNjQbyWPtchOxHE4DVNb1oRK8MWYcZvIYF2O50VWu5Bt
         bw7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoIX1B8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020ac85ccd000000b003179426dba6si1936094qta.414.2022.06.24.08.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 08:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoIX1B8J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kxe-0004VI-Ue
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 11:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kus-00080Z-Kd
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:08:15 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kuq-0003EI-Nj
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 11:08:14 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3177e60d980so27317107b3.12
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhAsNFJZuMxj5B48U52b+UW+vDqOA5FhHGh+CM8j8hg=;
 b=uoIX1B8Jl4wIJydiu0aq0xwqG+Js58omJPQqJcokd5ltBykNC5lR4XWynsrTs32Fsu
 GgVB1aWuaWF5xABMP6SxXI376YdiIWtVCCZIKmz3cajBolTggUEj4FI2lXl7uF+R8GD5
 uzMgrw485E1OeLYS6fqOUwbEfsHWwByL3Vgi3++agsn+Xbr0YbBdVk1OroIV+HnFO5Ny
 pTuD1oONZNCpJtNpwSX6+hpQti8Vviptk1zayvrjZ3vQaPkwcllYMSXXdiEO02L4bcOk
 5M8VaXuIAOfwneticuxMcccVA4qEyGikb9rMwkG217rrYyHND7Ncre3pn6f6dtPYZPNg
 5C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhAsNFJZuMxj5B48U52b+UW+vDqOA5FhHGh+CM8j8hg=;
 b=7Dgiz8D7KycESb4Npd5sQqwvGSoJMDRGd3qnNmtXUPHUf28Uea10uF6bCeYQYavnsO
 SMud0ZySPrhwwUeki/p2kleeM+wBzYXYISd1il1p7qgCKGFK2JJZCag2zWiGw8fYBGN3
 6MM9+BjrphCMuvS8yhYYS7M2t/RblOxZn7Nm91ydmenOq30AfCtm6XSw2y21fjI8CrI3
 jurZaKtyWxJTiFQp6Tcv5wUJhZttb120iOZuOl+0DZZUU4SgmTj752Zf47rRObwx+Z3e
 wLBKFFutydY3hHo7wo+6Lo3zAzLYnDOYUCU8vDWyddgdDQgZpB6qoRWI6gMr5Ouqv/yd
 wowg==
X-Gm-Message-State: AJIora+J3sJ6tMSw9ODMtwTCG6cXmafkEPl5+xjNOne1gXNt6ggxayZT
 5VUNa0GgFakdQIIu5IZEMxY0lpw0rhFdQP9PeBRyPg==
X-Received: by 2002:a81:8486:0:b0:317:a4af:4e0a with SMTP id
 u128-20020a818486000000b00317a4af4e0amr17582259ywf.455.1656083291822; Fri, 24
 Jun 2022 08:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
 <20220624134109.881989-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220624134109.881989-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:07:34 +0100
Message-ID: <CAFEAcA94MB-kH7ixzPz046KH49=a-JcL5yDue+zh+z6Mfnp94g@mail.gmail.com>
Subject: Re: [PATCH v2 26/54] pckbd: implement i8042_mmio_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yl+T1bW14Sm5

On Fri, 24 Jun 2022 at 14:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables use to set the required value of extended_state directly during
> device init rather than in i8042_mm_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>  hw/input/pckbd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
