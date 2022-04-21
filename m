Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp502400lfk;
        Thu, 21 Apr 2022 10:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx0Do/vA+1PifPySgzNuxM6Q1mm3BU0piklhhF61knmGOjXonMf/G21unEuZQQjL326lMN
X-Received: by 2002:a05:6902:1082:b0:63e:56c0:7ce8 with SMTP id v2-20020a056902108200b0063e56c07ce8mr627473ybu.455.1650560591008;
        Thu, 21 Apr 2022 10:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650560591; cv=none;
        d=google.com; s=arc-20160816;
        b=SzbkmqJg9gYhEacWbr6gOOmgXnLJ2+TXJOFZjvvmsJsJAFFFphxch5ude6QWQMDUeE
         qvOPhDpxgTU1rxDAK2+K87cRAQ/ADQsboPBp1V3lNx3pbVQeqNC7iRckFUUh/gaoCu+5
         Xjn8ebg8XZbAGc7u/SYYS17movbzrwDlrH/B6CylIDG7BnRfz5J3zDzbQcAYRQgPUSbG
         55Yr8ZZGSj46xWjPHXcUUcviM53t8jHmaD14gymh3wFKcK1Mp9a4gTSsut3Pq1ZB3a5F
         Ce95AjUb+EIpU2Fam6NbrE2dCIoJaAfKy+L0T618FFDHWkwQzI85J+pBa5/WHF1GLmLK
         X0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHGRs9PUJZ6cTFvhZyuM8jZqIx/VUy6ECAHzWPjnfL4=;
        b=XknLPT3aJlYFANxz8VvW4B+id3D9N/rhT6f7TQ14TUxM/FnYblWmi7I/yWo9DJTeYv
         ArV/601tt+wCyDvoIy5kfceSRJIbYhMLYoJmFAetrnppjCNh2DiTRPHYx+PLqsR9n68Q
         byHvzQZ6Ae5VYglADuoTEpsqaD8RrL808c5e2zstT2B4QT9bhi5zJ9SdhsbXSnRKBimL
         KI9qxTzhSa5rD2BS7NUeFv4zPk4fT5/fplaS9TWgBx7uSOqbxeFQnlNOX2gu+I/h/riP
         HJcwfqLNoO1reqtdhbJQf/pri3TuEeHfR2xZTa+KGv2r1aX6JO+Ixr4neOffD61caQaR
         3drw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BqHy7aG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v184-20020a25dec1000000b006413550e8c9si2952355ybg.89.2022.04.21.10.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 10:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BqHy7aG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhaD0-0006dQ-CT
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 13:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZca-0001bF-I0
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:25:33 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:39376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZcU-0000QV-HR
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 12:25:30 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ebf3746f87so57866947b3.6
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 09:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHGRs9PUJZ6cTFvhZyuM8jZqIx/VUy6ECAHzWPjnfL4=;
 b=BqHy7aG9T3c4sLXvMidYwjmy2mHnQbEkHqdWdfaYTprvCiuG5BEYij30vYuTteUTSD
 /EsLdAIx6lNmlD/sgrG3P2I2X1Pw2KhaH372OpAzdhhwMerK0fNSCFFeKF5kkxgEEbcV
 VD28hiTCRj6r6j9uAg8MaA1wcAtUeajG/dDJpwh/B21FBV7AewqH6LhLjyAGQG6lDzmI
 SF21hDLGpIRmL8h8eTtpBxw6YGnmgkRBGbg5+PNCot/19fv966K324/YDQsw1B4XQtgm
 lsmI0qy0nMtaKD7RlIL+73RFphzenJhMLW7wU36yc25NvSMXQ8wyrEQmTGDhgjGb19+b
 oOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHGRs9PUJZ6cTFvhZyuM8jZqIx/VUy6ECAHzWPjnfL4=;
 b=zHmL0Edb7SNp2jGEfyPo4N1nLh2whN84WcQWkWrWzh30uEmEdfr6aN3Wz9Np0r0y8J
 mODfVc+KstZKiug6cjm2iiw3EgwdI/3Mq9kIEBcJU2HqsbiaGJWhHL8s9wfSoWy7ewx5
 IGdeDF0PJ09YPknvA+RErqa/XN1Xdmy0EDj3C0y//8D5f9Z+XGnaK1uFT0QF1Z+iqkuB
 arSqyw4uGN1Vj/9TY2jtV+aHudUFnJb98cqoM4V180TakKLQdLqLjLQER1IigfpEBfMI
 4FFsVUx/grruOX0+nV6vQMIoROyRxdlqShX4I7+yTUas9ujtGqlcoll1ZQUO2Ij+rIXC
 VDjg==
X-Gm-Message-State: AOAM530aFUN/iZjnMnKVdsYsQy7MiqyRVNX6zfK6oe460FRzVzIsJhXi
 DvBmMNLWn8Z8iC5uO7YSSheFgvgL6DLdtmcxwdErkw==
X-Received: by 2002:a81:3450:0:b0:2f1:d8f4:cd9c with SMTP id
 b77-20020a813450000000b002f1d8f4cd9cmr430462ywa.455.1650558325078; Thu, 21
 Apr 2022 09:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-11-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:25:14 +0100
Message-ID: <CAFEAcA_foagYcT8D_f+bOCh_Y4u3A0=-CyJObWMVhSoBVp0SaA@mail.gmail.com>
Subject: Re: [PATCH v3 10/60] target/arm: Remove fpexc32_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 751kXcaz80Ti

On Sun, 17 Apr 2022 at 18:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is incorrect in that it does not properly consider
> CPTR_EL2.FPEN.  We've already got another mechanism for raising
> an FPU access trap: ARM_CP_FPU, so use that instead.
>
> Remove CP_ACCESS_TRAP_FP_EL{2,3}, which becomes unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h       |  5 -----
>  target/arm/helper.c    | 17 ++---------------
>  target/arm/op_helper.c | 13 -------------
>  3 files changed, 2 insertions(+), 33 deletions(-)
>

Always nice when you can fix a bug by deleting code :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
