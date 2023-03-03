Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1294517ejc;
        Fri, 3 Mar 2023 08:49:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/Tm1UbvcqlJqie3kQV86AWT9bRdxa2KZ3Ixd8rDPHvM4+/C7DvaDeHGFTNQHDQQBANMO65
X-Received: by 2002:ac8:5c93:0:b0:3bf:ca04:3bc9 with SMTP id r19-20020ac85c93000000b003bfca043bc9mr3989858qta.5.1677862176828;
        Fri, 03 Mar 2023 08:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677862176; cv=none;
        d=google.com; s=arc-20160816;
        b=rRIU689/TCpV/EgLuH6DdiFSYVyAVhDcq7Dntz9itedeppMrc6+9q4Is+8LQGmbE0d
         yAXtsZ9L7NYEBEsWymQavbnQDGUcK/0ziAEZgzTWGmfcmRJxarlkzjdSgzHHN8Bc4qzn
         G8egPrVHuf08kqnOYdX7EET83bnM1nUinAg1BwSfGb3NeJe56PhVKgkntnBb45GVVoL9
         l7lW1hr+ry5O94HZtBhNyn4kP05FA75KP/QSLohKgE5wmpJ8v0aTGCAyivteHGyRW/6E
         yNrS01FcjBdn13PklrrQXlyvnB0qtscZ/YvQOqOHNwKLSKiiB2ehrBjtQRjbkZvN43ek
         YTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gYqUDK5QCWo5zUjaVokPHL9/Kw7/CqfGFL4kZ/hEAFk=;
        b=Oizm0e1BaQife1eSU2ow8eWoMRmqAib3UwyNulbJ/zQM6ViXNCwTU6WbiTpB+Ry9cu
         +a7V4JnZFlFWrGG9IOaUt2fIosSQX+LbLX2jHS3kiFD/wjMbvHmPBNFvT+FMJyB/Chk/
         B29stU6zoag5TQenerdaoxsCa9OxEBRMTNMwZwfDko6OMzlE17T075tYkULBIlVFdn2l
         fR3eI37rpxhAT/bKaxYSk01EePMRtqqQP0Pvypf5NeqrNHX+dtOqpoCqFz2cXW1eLFKU
         2bMmUw4iMbE5jr2oQnMoyvLu870WJiASCBcq91lcJGYjNn7YMpStlRymjIOBYByEC2Pz
         dqDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+05wIbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05622a131100b003bfc2f0ee12si2240110qtk.442.2023.03.03.08.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n+05wIbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8av-0006dd-VP; Fri, 03 Mar 2023 11:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8at-0006cS-7Y
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:49:19 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8ar-0002NY-ME
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:49:18 -0500
Received: by mail-pg1-x52f.google.com with SMTP id y19so1854607pgk.5
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677862156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gYqUDK5QCWo5zUjaVokPHL9/Kw7/CqfGFL4kZ/hEAFk=;
 b=n+05wIbm+dRGwZg4X95UwcBJ/az0BCYH2wcdbCnWVIOe079ZThwHcVm1BjCWdak1qS
 qY7WzH7w5wfftefW6F/rJe+AyqDTIurnR24ShHArcFNMkYm6eYOGZII+iWcQhCJRTBKm
 lzUaCBgFXhJJ9UUlhMNlgh4qG9nIkrhpCP9qd/eU0MiMd1bSNcWkhiqMQCvfViK8K6TH
 9csA5GqB7OxNZPeN3luGerGoISrvze6sdTUH/3AQcRZf3jR4j8T2AGfn95LSnznnShqe
 dIdjlAGifsemMzpUqtihtArCxS53m/W1GM5V1AnCCB4YcdHCmiuELGbZAS7T4HgDJqoK
 GPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862156;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYqUDK5QCWo5zUjaVokPHL9/Kw7/CqfGFL4kZ/hEAFk=;
 b=my4CcBTO1CPk53E6hazaAE5ysfxa2fl87qU1kO8Sd5w0sVxccjB/xBWWnUdcERZulO
 ngMzSHf1TEQ+UTxjPy6CfuF3RxWDKt36SUE3vSYopWwWyfhGO5ErWt06eEDzWkOOUFvZ
 cR+nTJa+xV+gatavj6DFl7kmhpEcyBAzyVgsPCLibB6pDpiv3TN5bXZzVSK4RSEvYTuP
 FCUtD61jvHE9e5Z7l/M36sqoqUZx4i7mr+gswlg4UL8L0PIHEVBfvHx/fpDPCRQIKxZb
 Lu1WIYYKHyhwDVJfk0gctSDLKtKdx2PF5tTfjMHgh/al80qvR6vsVWfgosUcILbOThUL
 QQZQ==
X-Gm-Message-State: AO0yUKVRmZPnxh+7rEd+nU2XFGIBWgEGqWUkWcxM9WFFHQ4s2NjQsfBn
 KEO0EB4l6Jq3qCtpUsB1uIqLa4Aw0OOduBdikoJmAg==
X-Received: by 2002:a05:6a00:225a:b0:593:c9dd:9069 with SMTP id
 i26-20020a056a00225a00b00593c9dd9069mr1189541pfu.5.1677862155919; Fri, 03 Mar
 2023 08:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-7-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:49:04 +0000
Message-ID: <CAFEAcA-PnmGDjWY6OfyKw+XY94e2j6vb5_rWM3oqnia4BN3Ogw@mail.gmail.com>
Subject: Re: [PATCH 06/13] accel/tcg: Trigger watchpoints from
 atomic_mmu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
X-TUID: RZhZ4W7KS0Ch

On Thu, 23 Feb 2023 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixes a bug in that we weren't reporting these changes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++++-----------
>  1 file changed, 29 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
