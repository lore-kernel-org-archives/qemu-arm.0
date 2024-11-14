Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp297366njc;
        Thu, 14 Nov 2024 04:54:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVS0htbolo38FVCjt93Q1Z3eVtciU2IW9VvmFmsyVbzpJ1FoIqHPdS3ZQDBFIEMZwC0ymuoBbiu0UpIjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEI9DveWeO3KnGsgpYjCNsL0YU76i0MYX+Z2mDs0lX6mgFkjQWt2i+bwiZtPJRhBcg3SF9q
X-Received: by 2002:a05:690c:6f87:b0:6e3:4190:ab45 with SMTP id 00721157ae682-6ecb32cb08amr74641407b3.15.1731588861618;
        Thu, 14 Nov 2024 04:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731588861; cv=none;
        d=google.com; s=arc-20240605;
        b=D73oQBH9dXN8XrHa+hMrZzchwqELv8E1tQ9FascEk+JBCJtKauiv2Ehx+vX5Mc7mDy
         ew5GzwYAco6xZBhJ3oyd6KhT12K4hIlK7c3KHPU4d9OaKNlCEQQ9QYLJ78fGJ0C/+V8B
         GBx5fMO6psm8IXXF6vpSb3NLfe3TK/FPWq59J6/empySokTa7YIoO2x0UmU3jm7JP+xY
         uxWe9w1iZzQgxGdhABTORBjl7IXcah7AvoWWguC45Mgks+NmTRlQK0Gcsl5AWct0geEJ
         pDDlr4yhk67zOPfaYEBKFkEl8gK0YSf4p46FvVHFRqVYrZ/+x+4bL3ozbpua8VUTyFZo
         0NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M3mfTEfKdxOywnm+iZvD8KBR3LErUOlqd1NYZnAjRs4=;
        fh=A0O07pau4QYPEXI8lyrEizu0i2MZqWwA1iUC7lo98MA=;
        b=GfgVQNFRKVE317QbWEQ1yfDEXn/QsRTFzeGDOVFAUm+ug8eM7GGFVgjJYuBpEdtL27
         jC6Jk7EeLIekc3EWfwgRK71QLwnq96x4T8eSctm+i0yPY2BjC6ItwOWUyBG2EvXsdBW4
         W9gVzT6zKPT1VvQLJo2eiSUOP8j6O6JN7jZNshJ+//yPjDKFPzJzTGDeJzdY0jj57LX+
         28PTX+UP8QXdy1b26+/ooQv7JvQMvpQg7damz9wzTnYm2dO5aiqBJInND2BBFKX2mMCs
         /jWZtyPDDCuygq3QXYAnKplfXOI5+6bFeRbT4v9OMsQG+Oo4BDFSOuv4goZ4N3ZE4ajC
         akPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfkuViUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aadcdd5si10333661cf.366.2024.11.14.04.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 04:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CfkuViUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBZLu-0003Uy-J3; Thu, 14 Nov 2024 07:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBZLs-0003UZ-G5
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:53:36 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBZLq-0005Uw-AK
 for qemu-arm@nongnu.org; Thu, 14 Nov 2024 07:53:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c94a7239cfso397542a12.3
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2024 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731588812; x=1732193612; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M3mfTEfKdxOywnm+iZvD8KBR3LErUOlqd1NYZnAjRs4=;
 b=CfkuViUmx4H+oEtCIhnhEKc/8twddwXCa+8sppjAJ9e+LmYcBTpL/p7Lr3TF/gbq7d
 dUuHx5EG1mHXLV885+m+0zZN/SzaycR3cQ6HEQbe37tgWTtD6B0acVSgYF1HwBLql9B4
 0ZUfY7bcc4BdBMpQYUtMusVci6cMHiBjFPh8z3I4pMTP8DMJW3LyiRkejmPNk2C2qtN3
 d7zbmExir8Y0jF0e86RppLjAsvdtfo4zZU4vBFL2mUWwmIj/j4DZ/xWd6qx/Ut60bjbO
 Guy7X01G8CtwEMHS/bG7t4lukQkRDDfrxuGeDqZoYMg3PSbr2B5XzoSTVOvyk2QVjlWL
 YXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731588812; x=1732193612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3mfTEfKdxOywnm+iZvD8KBR3LErUOlqd1NYZnAjRs4=;
 b=ns8xXAQd1962B1CjJMVUkxFyqQanlSN2LyuTe13hGrfbBJv1krZt5DQQWXPAzRnXOA
 EiuK9w5aEy22cz161NA3sMHuWwAgED3OK4fEnTa/l/eSwlniThznlwmFwy8OiNXJrRfB
 NRE+yEwfjbOlZ2Sl27osRfqquYAKjrU9EVinHw6oIeJInW5XfnP02aiwS7g+GcLCNcP2
 jlqEi4hRR1YW+RSvN1U8Qhu42iPhzDU0yTIf76aPd9klqobSJeuzQQCRDac1X65aLu0D
 a5GgUiy+CozsYHw0qptlNzxES+dVZOWnu4xqcHQjPOc4r/yRb3dskzHY+94nrKPi4Vl9
 jEbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV9sn0ISWj/b40h2gxhdcLhSkzLRL/BBcKzuVpkA4WPLAcjpfRQ6MibSa9qZBEW1MemNBnJtSG6Q==@nongnu.org
X-Gm-Message-State: AOJu0YyIXtw9HqDsgRK5i2oL0m483KZa4yxObWQkWsMci+WM1VdPeWvU
 tuupazXbmtnLe8JlsFhTM7gOZtKzNWWJu0nMyxiXJUnpAV9cNsQ9reKkpbVg9xB//jkM9+07rXV
 VbyDQQbJUU9NJhQGEfaMNBxSBKd1PN3e1TLjncQ==
X-Received: by 2002:a05:6402:510f:b0:5cb:bebb:38d8 with SMTP id
 4fb4d7f45d1cf-5cf77e956f8mr2257317a12.14.1731588812016; Thu, 14 Nov 2024
 04:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20241108191024.2931097-1-roqueh@google.com>
 <20241108191024.2931097-2-roqueh@google.com>
In-Reply-To: <20241108191024.2931097-2-roqueh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2024 12:53:21 +0000
Message-ID: <CAFEAcA8bWb=PV=R2-UZCDLzkuV-THmNb3yd+BY167B+P+u3JJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/watchdog/cmsdk_apb_watchdog: Fix INTEN issues
To: Roque Arcudia Hernandez <roqueh@google.com>
Cc: farosas@suse.de, lvivier@redhat.com, slongfield@google.com, 
 komlodi@google.com, pbonzini@redhat.com, venture@google.com, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +t+a6riS6cQY

On Fri, 8 Nov 2024 at 19:10, Roque Arcudia Hernandez <roqueh@google.com> wrote:
>
> Current watchdog is free running out of reset, this combined with the
> fact that current implementation also ensures the counter is running
> when programing WDOGLOAD creates issues when the firmware defer the
> programing of WDOGCONTROL.INTEN much later after WDOGLOAD. Arm
> Programmer's Model documentation states that INTEN is also the
> counter enable:
>
> > INTEN
> >
> > Enable the interrupt event, WDOGINT. Set HIGH to enable the counter
> > and the interrupt, or LOW to disable the counter and interrupt.
> > Reloads the counter from the value in WDOGLOAD when the interrupt
> > is enabled, after previously being disabled.
>
> Source of the time of writing:
>
> https://developer.arm.com/documentation/ddi0479/d/apb-components/apb-watchdog/programmers-model

I see that the URL in the current sources
https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
is no longer working -- would you mind including a patch that updates
the URL in the comment at the top of the file to the new one
https://developer.arm.com/documentation/ddi0479/

please?

> Signed-off-by: Roque Arcudia Hernandez <roqueh@google.com>
> Reviewed-by: Stephen Longfield <slongfield@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>
> ---
>  hw/watchdog/cmsdk-apb-watchdog.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> index 7ad46f9410..e6ddc0a53b 100644
> --- a/hw/watchdog/cmsdk-apb-watchdog.c
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -202,10 +202,10 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
>           */
>          ptimer_transaction_begin(s->timer);
>          ptimer_set_limit(s->timer, value, 1);
> -        ptimer_run(s->timer, 0);
>          ptimer_transaction_commit(s->timer);
>          break;

This looks like a correct change, but the comment just
above here needs to be updated to match it (it currently
says "and make sure we're counting").

Otherwise this change looks good.

-- PMM
