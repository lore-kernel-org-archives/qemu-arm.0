Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EA0C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 10:05:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfamC-0006Ur-H6; Fri, 03 Jul 2026 06:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfam9-0006TY-KQ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:05:37 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfam8-0001cG-6p
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 06:05:37 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-664d7863920so322941d50.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 03:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783073134; cv=none;
 d=google.com; s=arc-20260327;
 b=O5PPqG4ZRl3te6CmbuoVljmFcUretzxaqETqon35f1oT8JomCJbLdwXT6eXLwazLMH
 NMOPmv9DwhMU8CuTTSfeMzqMSlRgARPx/bkKN4jdIWED7ys3UznWFHNFbroy5uLbTbMi
 zZ4E+J/7GoPp7X1bejrn1hd0h04DsYU27MtMJu8u0WdZY1DxCw2yhsl8LsmBh8F/F4dY
 0pHcv46FIangpioP0iAGHkt1CXfS+l/3D2fp/r+PUhuwBFkOG4vEraYrRCGdLlCYUYHu
 eaelQi1yK29FP5w6QpkJcooRG/5FT2eLYZRDyXoBTmybHNO470WIW7Szq9q1eOrpr+bw
 P/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=oeUGoLGxhy4xRJ1+R8hWN/3fx/m6Juhe2wVH5KdxEzA=;
 fh=qV8bYrmbIc8AlCkHPz/8+F/HQ+2nuuVfvQjspU/F/bQ=;
 b=AxQ/BMl1hejYa/OPR+TvZKdCk4f8ksNc86ORBojvxMR2j8k4hJ1Uzo6MwkrJFl3YuL
 rNfECb3UmLuMP6WrBhGJ+2k6EEv3KyuHg5pRzN+/d3YPgthiI9YD+bVLV9bGWdKRJBii
 UaoYu27YrvOJPnWHgxUSWpxZtVAtKxlCBXEwqzEwN+NCXeMqWUgwrJkYrEz0MM5CQGEm
 w/tbrHBrKfadkvPZLyRE37fnOX3s+gVOGhtVHM1HubXYtoIsLpiH4JW2FnTWIOelS9IA
 4q85L/zulQknRirwkt2w6FEAUnXoMSoV85/WQpwuDvRu4by3STxD4n6+PZpoOloTCbz3
 ptwg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783073134; x=1783677934; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=oeUGoLGxhy4xRJ1+R8hWN/3fx/m6Juhe2wVH5KdxEzA=;
 b=tsEAyBKU+m4IWbOgwNFQyCAc9IE3KZY5zHXqND7QdAZqIYU437dvO5+7LDAwA6HUtx
 eULoHjbLdEYgwok8CUFSUsJyr7vv7kpCHny8Ne60+SwTPoUK+cx9Lq+5abti1QDFHBAi
 td5fRv9hlXappUT87N14uOhUnUPyOkkQDPa7nvBt16VHUrHJjgQgaxztbXepa0FUgUic
 QxmDKW5qmJQyLrW5Prc/DEhOU9pRxf0qOeqpjS4zEikkjvfdB6tdDFGs+zkDYqxGFOCW
 jJ0GdmAfT878fJpAwuOzJljiA2J+5uiTPSqJPD381UO45URHIUgUYW/biBX7CBZMK4+H
 4kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783073134; x=1783677934;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=oeUGoLGxhy4xRJ1+R8hWN/3fx/m6Juhe2wVH5KdxEzA=;
 b=e5b0MnYXfKjPU2Ifwi/f4Ld/MSFCUtPjx8LTVeD45HxkC4hcvJQGhU2YtLKhQUSwRl
 2ohpP57C08Y+zOiR4fBk4S7/DqrnRQa9xjbd4hWFu74L1eTntxd7+zznXqaOOlAzJ92i
 fh7/2a0g015R5X98Wi9bOGaVVSuAGj2JSji9vkhp0uD+dhdBpeHKs6PjBWR7iH6sCM0N
 q9arRlVS6bNOCjsjQ378wFELx+tZYJVdw7owp2zQkT1pIfGHQWmCWc7/TcHZM0xwVaXt
 qn2Mg7pSZMn3Yt7yptqNOT1zbJwUdKSXYhBrE0BjSpkko8zg0H7tH4iow0uLqtFV0Vxy
 okqQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOHRMN+F1One53ZrAZFu9PI2l/BxkPOXZ9HVy6AD32ystgciyJG02A2f0NgVfTHzJVUzeKXFwk7A==@nongnu.org
X-Gm-Message-State: AOJu0YxWDpFICDXnD5vIJz5ZknuqjLdUEuvepOk1ZL4wQk6+1vfXW8Lj
 vYwZRFYb9uREIPNqeaa5LXjO5t2+hds2LYkzODeHSQrbe7XqtBuyAyjjAtS6+lE3Wh0gq+t5fQA
 +Gbk+hZgXUuFUJLnUqUe125wTq7s0m0eLy3ILismokw==
X-Gm-Gg: AfdE7ckRTv1P2Ci9c7giZ5uBZS7G/Y16qG7vmB1Du3WGJP1mAXsTVFNrFYJpk8ipoe2
 WKfPBk0ULG/7XdQYfIGIeXj5/T8OtqYHvLR5sY6rNy1NjLeTx6y8l2ibAJd6VzFwUjkejBHucS2
 wTzNTR3Bzcj9hmtV+yIXaCBRjAq8gDOg6HbOGOzoC2Am/KjYEcj2VEJKjXQ7SVxerRbt3wMz9Sz
 lyxvwVlv/dwrZoI7lmB32RI9wnP26cBN4Ax1a/bnEslf+aTokzFmkrz6jWGNviRtaO4LRxnQ9us
 MrP7q/jmcQGbkD6MwMhKiYglxPxEDvqAIxuLmWfvSRSf0GAZkCSsYmEF
X-Received: by 2002:a05:690e:e8c:b0:664:c8af:1910 with SMTP id
 956f58d0204a3-66596526562mr8313213d50.26.1783073134242; Fri, 03 Jul 2026
 03:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <akYylBa-3xSn-qTB@sirius.home.kraxel.org>
In-Reply-To: <akYylBa-3xSn-qTB@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 11:05:22 +0100
X-Gm-Features: AVVi8CfLfy8GeBdihJNHxF49XNVmbqaBfwYa5rbFKiB5-WTSvqLeFQdiMTQpwu8
Message-ID: <CAFEAcA9=Tz4OX3O5eRXb8vQwJZB9EoU4ZAv5Xo3hhbf7TCj1QA@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 2 Jul 2026 at 10:45, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, May 28, 2026 at 03:28:05PM +0100, Peter Maydell wrote:
> > On Thu, 21 May 2026 at 12:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Also little refactoring in preparation
> > > to avoid code duplication.
> > >
> > > Gerd Hoffmann (3):
> > >   hw/nvram: add load_image_to_fw_cfg_file()
> > >   hw/i386: switch shim loading to load_image_to_fw_cfg_file
> > >   hw/arm: add support for shim loading
> >
> > Any chance of some information on what this is?
>
> Ping.  The doc update with additional info is merged,
> this isn't yet.
>
> Do you want take this through the arm queue?
> Alternatively I can merge this via firmware queue.

I've applied it to target-arm.next; thanks.

-- PMM

