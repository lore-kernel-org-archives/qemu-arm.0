Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp474615lfg;
        Thu, 13 May 2021 06:04:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0vh6spONGgiBG3hlP/lC4RX/+6kanmsmHeu0jWQtSDjINF/eGN/jcfnQTRy3hgKDpqIUe
X-Received: by 2002:a05:6512:696:: with SMTP id t22mr23581450lfe.581.1620911059965;
        Thu, 13 May 2021 06:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620911059; cv=none;
        d=google.com; s=arc-20160816;
        b=fvjRTj0yRL0bqE+6y4NE0T7027yU827FCFIXMxzQS3MF7/iRa6vWSnazYNTpyavLH2
         z2RxFuXbxAfrxAwobQ6EdkTmRkAbySD9i7mJKHX4deIl6/AKkQIz4mrLs+jdvKGKwbUn
         v+iCoK/xfp08NadbsyCX1UWkOFK4yVlIGcPTfiWI2J2jbpl7L94Py3YUw1hRkXtsjI9A
         6J2KxLcXSTwFsHVi478uBmsY0cDy/of1w70AH1iqo1mQHEfbkkfwebugZhzwwWp8AnOE
         xIeUceeMLZToY5ubVAcKSMuQl5wUTD2AvnA6cpT6Pa98GbYAuXnbIk97KiNQ2PK7b4q0
         t5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E83A2qNX6XXhlLueYZ2ZRoVq9t9NRgT7ngBkXJ0lkPQ=;
        b=LdS2m5jOCRlDNSuErbSW8ElMRCxYRmtJgH3elLot3nDhoQTsC313z9Gt85Qb2yb2o4
         nqZ6F21nfzoJQXuMZ12RqX/aCcrONxhNQSEW/bKa/Yfb158IA//D/40LK/HHtNCEguyR
         a4hLJFJr0sbdVH4u6TF5WOTh4SEERdUpBbwzDq97VT5ZpH9L4UZSqWb351/eN5PemkNt
         hphUkEZUe6VoN4DBQQiGEX5LvkPVo/A5t+46WNfhoXcUwRmABJjiBMfKRG/4AbPMzOQh
         cIe179CbKU/1kUk7cqFRba7movmYuxWmnMT1V5T3X7qNh2nwb9pfSsApumGaFqQeM9MY
         lAUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LeII5JKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19si3803936lfc.160.2021.05.13.06.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LeII5JKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhB0k-0002cQ-Rv
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAzS-0001ED-V3
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:02:59 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAzQ-0000QC-C2
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:02:58 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so39746890ejc.10
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E83A2qNX6XXhlLueYZ2ZRoVq9t9NRgT7ngBkXJ0lkPQ=;
 b=LeII5JKmWNjy5kv37j/hTyrvWvyWx59fRYVoaH06eKcZ7PTzea4pymJ2zD+i5jraEs
 ti/lUHREyJrkL28vlZoyObmn5gWPI/+MuTKO1LO5y9djpKrWIf1GSBvWp97UWE3ZNXJO
 ApAxXIcUeYz9Oon9duH405kmPM+WZ4Og5l1R6lM+WGwiRR8qfrZsEanAZKsGJ4S8c3yu
 3UTeys+59nUKdDo9IsqYVkyeCmj039Ja2IlG2EJbENf49weS9qz9YZPr00WMdKxfY7X1
 4OeJeWnPNhNOzIgabS+5csP76DjlE+1ihwYURaLpPBMn1MfrV20tL3Fmp++Ri+qhKqIH
 lmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E83A2qNX6XXhlLueYZ2ZRoVq9t9NRgT7ngBkXJ0lkPQ=;
 b=FBmsr+pJiuogLrUkRhGo/z9dxDA069AP5261shWvATvwjb7uYUmo7evPPu70/YsT6j
 WNset4GqipDTtfms66fnuqF/fU2uxOt8uoyzi9xFs9kqHUC9G2nYforIHUFlqpw8fKlZ
 JTdlUokCmIVuc/ixCdEd9xWNg0jUiyqMq+Xwe4bsahwvAXZB4DM0TsIweA7sgA/EKM6r
 1g23uZNotUVHin3a2KYqYIJKqP7Sw4dst/75d7B3fxbVYhsxR2lB+LMANjHQ5Uh5ELll
 qWsuUIjfnM+HlyS2zCKPYfCP+Yl2q2/CNGxydXvwXvXnyLoeHS3OqGezSc0uWGRK7Kxb
 yA8g==
X-Gm-Message-State: AOAM532+C/zMdn/qa/s9Y9QCzTMTGfudLYSisbRDU72ZG3OokTlKTpx5
 qNXxx0xQhxM3ELoCkbC7JbLqh+HHQNpcobPZftSJpw==
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4680823ejb.85.1620910974802; 
 Thu, 13 May 2021 06:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-62-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:02:43 +0100
Message-ID: <CAFEAcA_iAUr0kFxySpAnM2an=o7e4q4XmGbddHRbgFPiKaT=Bw@mail.gmail.com>
Subject: Re: [PATCH v6 61/82] target/arm: Implement SVE2 crypto unary
 operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: 0F9YjzGHe5Fk

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/translate-sve.c | 11 +++++++++++
>  2 files changed, 17 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
