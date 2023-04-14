Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp319040ejc;
        Fri, 14 Apr 2023 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350b2bqbiIvvIaeFKt5NtDJecT8U7XiMumYBKWgKf7pKhHxC8kbZqag8qifd97mfsBJUApHux
X-Received: by 2002:ad4:5763:0:b0:5e3:c84a:9422 with SMTP id r3-20020ad45763000000b005e3c84a9422mr2754889qvx.2.1681463040528;
        Fri, 14 Apr 2023 02:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681463040; cv=none;
        d=google.com; s=arc-20160816;
        b=TPkBqvuzZOtgECuto0BdY/1UTZyqUJSYosi4y7uuq1X9xMl2io/qbsiHAqPw2qhOri
         wHtdVSnLedm1Be4YWI+o7n66mjxK8xLCuly+Z3CGe3tTqjsRTlslgEbvUA2iW1zKUbCA
         XTJcCamfWdABMQ0svd9cJ2MtVUdUqGopjgVbnjJn0XN0IkOE9k52X/BXu5M8s31bWwGa
         T9mywf380lqaBc6VL5eyduC4rXzObOMaTB/9qPuItsbsRi3nwG8M0gyFanW1InN+njTF
         chBa3B6Yx+0VQFziteJhT126Nna55P3jJ3Yhd4lSneFSc3Hual63OqDlbYGOI01/qS49
         FP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pvphCMhe1Lq20Ao5H6BwntU+fb8+1XVXCNXrhrGrf9U=;
        b=AhpDg5vhW+mDoQpJFZGWOjM/OloapLr+Tib1tW/XFVycSSmP8Jo7Z9RAiYnuRfxiim
         leI3JB7cNXd95cHocccbDgIKF3qE23JU/mivtOCSGVtr+oVODjczuAsc3mMT2jJRbA3Y
         CizhWtkZmewaIKEDpklsIoWqe/qQL0/S4yxJhJIDOiKfeBnvMH+izJ41cz9dW+X1G3QO
         CO0m7YTWc4ZiWqorc1g9xLyAqZJJXElhsdMPufl39oT8tnYB1LXR+0wbY/eEcQi3Wkx9
         Yd6zUJjccIPi6VRv1lXY9rnr1yhxCMOoWQAtPjHuzg1fwvdWMQTF16+UjclExVv+NMPw
         GSQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcgpSdrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw4-20020a0562140f0400b005ef5b0e47efsi315645qvb.125.2023.04.14.02.04.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Apr 2023 02:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcgpSdrC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnFKz-0003Yr-Q5; Fri, 14 Apr 2023 05:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFKv-0003Wd-OG
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 05:03:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnFKn-0001DR-2o
 for qemu-arm@nongnu.org; Fri, 14 Apr 2023 05:03:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id q23so34442747ejz.3
 for <qemu-arm@nongnu.org>; Fri, 14 Apr 2023 02:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681462986; x=1684054986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pvphCMhe1Lq20Ao5H6BwntU+fb8+1XVXCNXrhrGrf9U=;
 b=XcgpSdrCJ2nzEINjpflaUYrw0sdFo2ts1iBVUNutsHpfWC44sWCZRWbEQNetZ6zGdB
 QGBUiKZkBBnG7y3CXrMHbD0HBuqS2vKYclh9PZ7LG3zb107Un871wwhXNxWRmifVHqJx
 p3QlO6x6gg8rOHB7dxjI74eQSoR/qmMGS9wENfaLsiuopzmGz3IsUbKe35ddZZTYLb4+
 JwH9SOlw2jOW1qpiEzWYrWq4oIF/Sz94horg5tRL7acC4VOTa8D4KMS9IeiUemB4qCDj
 84hvgJYP4/4Nnhkyu1YjMA9Ye1G5/joW/Kt2dS5s1RsG+X4pdp/W28V7ddknmaKh3gb/
 DhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681462986; x=1684054986;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvphCMhe1Lq20Ao5H6BwntU+fb8+1XVXCNXrhrGrf9U=;
 b=a9dEggFZ6YjNTsIa84hdNYemKICpQfQ3vxCJ4gwzlJEo9ifuRbMyCpQy0qeCo9/QFZ
 YZBSSiiKxuvir+0qKnlfBk8W9DvFHlENWOaxZQPMqAJNwE1vQg4Do9c1WAxc9hktxE+w
 ZaWwzuSrhzlUnwW+Gy61GpOzZDoEDu7QS2leNM/f7ixPzo0IYMhuz6yRdeDNLM0xYwxJ
 DNZkoDYpWILdLw49uWBBq9SfqYnDdzzs07QeD+GU97ySVP5oT1M3oSPvhsQwMzudDEeO
 LhY80e81OXN+f02LtRmEjs37cltBVPtMiOwH8pDOhsUeCE/K7rIsAho7MlI7w/ZxgVEW
 U/Ww==
X-Gm-Message-State: AAQBX9f5Zj0u3EHznhD3tQlMir43cPvMi+9ma9fo1efqVeXA6dt8dM7P
 QIEVCnuCFzgPTyoL0FyGaRa7ABTUibgQ8RZFwQ+1Ag==
X-Received: by 2002:a17:906:2749:b0:94e:8d10:86ca with SMTP id
 a9-20020a170906274900b0094e8d1086camr2691500ejd.6.1681462986237; Fri, 14 Apr
 2023 02:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
 <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
In-Reply-To: <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2023 10:02:55 +0100
Message-ID: <CAFEAcA9CnA0Pxxr1Q5S25SFnQTJM4oBwGeXsaHgTpt+TvJuGOA@mail.gmail.com>
Subject: Re: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
To: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ZlQjnfrNITf3

On Fri, 14 Apr 2023 at 08:35, Stefan Lankes
<slankes@eonerc.rwth-aachen.de> wrote:
>
> Currently, the flag `--initrd` is only support for Linux ARM kernels.
> However, also other ELF kernels could depend on an initial ramdisk.
> This PR loads also the initrd for ELF kernels and announce the
> location by the nodes "/chosen/initrd-start" and
> "/chosen/initrd-end" within the device tree.

What are these "other ELF kernels" ? Is there some defined
specification of bootloader you're trying to implement here?

Currently QEMU for Arm supports two things:
 (1) I am a Linux kernel, load me like the Linux kernel defines
 (2) I'm just a bare-metal image (ELF file or raw)

Adding support for some third type of loading would need a
pretty solid justification, eg that this is a very common kind
of image to load, that there is a well defined specification,
that it's supported by lots of other bootloaders, etc.
The bootloading code is too complicated already and I am
very reluctant to add more to it.

thanks
-- PMM
