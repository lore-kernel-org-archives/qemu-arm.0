Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1930921lfb;
        Tue, 7 Jun 2022 01:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzguzwlvTt0O6MrNV8BQNbmmV0UTEoqXZqYirJ8/r+ctUeQcK/lCUI3MDXAYc0psfvltAZ5
X-Received: by 2002:a05:622a:52:b0:304:e646:8d23 with SMTP id y18-20020a05622a005200b00304e6468d23mr11431445qtw.350.1654591587556;
        Tue, 07 Jun 2022 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654591587; cv=none;
        d=google.com; s=arc-20160816;
        b=eX01H46ysnpb9KwV51uOVokAPDRdFEspxYD2IqVFRX456XDx0PBgzyvH+cwXdrwGJv
         2eRCPaR7v2U6MZYsprLgE9Trde9pM6QWE6ZDPHg1mSJ27P32A/7IQVlzB5XhLN/6dp8R
         BR2TlaQg93lOMUK8wU+BGadgOIPkQoolPS4Ikq+y+af0K51+ONCxzblshOL/AjbGJSQ7
         bgOdv1flUqlL+vPu3DqoFFJaezZpUeEiOWRiedag4BD3mHS3CC1x3Th5rrVV28oLat0k
         HiKzrctM4Fw5yTyyOrS2hqOYjUbLnPc5DzJuehNBRXEEjSqTC1uH8miNUQHA6dHzDz5g
         Ky6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8R/d5a0zxl6iY6cktNdDQf8Dtelrx7tfG0YTcG/ls7Y=;
        b=NtW5XZVJxR9jZiRHXcJ2cSvS7tm0/mN8Ht3ImMASavQlQf5fV8xcXoD5Z3dw6sCoGA
         wHKpZZ0V5iJyvQeaeMvosK47ogE2R4UPHOpYU4gKHzjjSS85BxEkGRhAhyRqhkKikntb
         +3P8pHJ51fS1K81nOaJwkQqL0C3igd3sHlD7omnOifDwDIbZgcMtoYF6PCz+Jnkc4nqG
         A3qxdU4TFeY/xJOcm7kjg1Epx+Mi5kH2gqf4MHDHS7PkdIGjWs6PAIs9Td0Qt0teDdkJ
         X6tiDCoeVmrO85+w/QG+CQwwZvOwAWXMGmsiuY0/51Uvuw9KwbM3Da+TvIhOSnWo5Lud
         UL8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUYT1qZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05620a430600b006a62fae07bdsi10098096qko.306.2022.06.07.01.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUYT1qZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyUr5-00037N-0Q
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUqV-0002Vl-FZ
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:45:51 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUqS-0002yr-Sk
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:45:51 -0400
Received: by mail-yb1-xb34.google.com with SMTP id f34so29987686ybj.6
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8R/d5a0zxl6iY6cktNdDQf8Dtelrx7tfG0YTcG/ls7Y=;
 b=iUYT1qZnU9MrZ1MlB+MFrCPg7g6tAMlBHRuQd1tMX2w8Dp6t5ywAduLBiqsSgCp3ci
 yQIgqzIgTgJle02fyccBBnkeut1cIEedKyMaKzJCLTHocKtnKExtb10gLWE8Ng2WeaiY
 jESpJUuDzZA9qYiHKcjIhD1ZGI4EePJgBYfWQ87nPr7htqNO4FUqycKxP1cnJlnjWeuq
 iBIAZa2rcY3CgI67ZnssZ1WB6mi8SMI0ODm/KRGrePwRjRy/fPkgaK9aFFDhp8VxfGE6
 SvngHzdsrCiPZ35YIc/sRzZyCyx5cyGNmdj33QOwe9WB4Z35ULAqSIcMrOrjDdAvKFFz
 qZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8R/d5a0zxl6iY6cktNdDQf8Dtelrx7tfG0YTcG/ls7Y=;
 b=V1tbENtMjhBoXV/CpDyVZl1HC6l2SZFw6F/UqYS9xwA+aAqaMVLtBfz1ZCILzuCUyc
 8BJjURnwK31JKO3VYGNBTufN7pXbIju6w1RLEm/uDuibjPgZFBzeb2A2CuYUZ4Yx8TqL
 geUBwpGQt9MxNRnhJSpSDggq6yFFmdwbr5/FWaJc6U+xtpWSBDB0odO5+00O0ZRnhz/H
 95IVNpbTpERqjsl+H7gUs27LkGtxwm6YPQ5ylWDuZZUyeGtGFhXbtyLJsdW3Y4b5Goch
 9W4XNyCy4MJbqJovc8mtP6mjM4L3aGnlzVJpddkLjLhjuMyvn+XxA0YFA6X79E77R0o8
 1YIg==
X-Gm-Message-State: AOAM533ENuRmPoy/wsFAQOywrmYdm6bN9q4KLL3GdPMQXv7PipZbebyu
 QOMoB2DFnB0LC+SKxkJjttlhAARv1Gvtu5H6hltyei2NrGA=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr27676293ybb.140.1654591547970; Tue, 07
 Jun 2022 01:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-33-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:45:37 +0100
Message-ID: <CAFEAcA9KWvnskAAbQe=5T3Ptk58J4tPCHOTLumr8-g=N=twHrg@mail.gmail.com>
Subject: Re: [PATCH 32/71] target/arm: Create ARMVQMap
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: I/fg8L4aagtp

On Thu, 2 Jun 2022 at 23:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull the three sve_vq_* values into a structure.
> This will be reused for SME.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
