Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2663333dle;
        Thu, 13 Jul 2023 05:00:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEmFerdQCa0MA/admdyEBCKgwMhUlV8WC+yTTR2+NLgQkRxGampa0O8I8S7sQEvkbRZdXDe
X-Received: by 2002:a67:ed01:0:b0:443:7503:a534 with SMTP id l1-20020a67ed01000000b004437503a534mr634815vsp.16.1689249631698;
        Thu, 13 Jul 2023 05:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689249631; cv=none;
        d=google.com; s=arc-20160816;
        b=O7FlBuPe045FCqJreGN8ox1XRKrhpyPVJ7ZZb3El4PFhos3TmNh5+5hfkxaoTXrWxA
         gJ8KCvST1NLleYL52h3Ghnbs1HlW/hr78VzQ0p3E7oIqpNcruk7MWuSWPjHsWmrJthrY
         R2ahxPvbFNJ872wdN4h41oSdvVUdDgmMO4wo5lfBHyN7eHrBVxJucR6QHQeEwJfwD3It
         L5esWw/EpeYzIeVzV6dw+/6uyla43jJvvaNgGpSrrZb1TmqzrY7R9Rlyuc9nmSRBJZ4u
         NAoYOvJNNPJ7gtd656pgd2ZIko+i7WOpMKh3nE02A8CM2qnPCh0Qj//zsiqEqmJZTt01
         an7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pBv/l07OIc6LoGg76LMCmBbXQkjiwRyE1zqqM3sKzvg=;
        fh=2gq+6FthMt7mXteatDOQC7TRhTwu5VRpPB9qEkZ5Vr0=;
        b=E44FfTnfUtOWiyqwrxJakmXpAI+tUKpu4iN+B72tiMqWcXkBK2eEmg4D1yBq+lfX8X
         +d6Wnuocst9ScBC6gLLCNBaSU2beWsm8w47s9c2E+QOUkIKr/wCFWMmG9UaRblOnW5SD
         gPYivG9NEF2V40S+vUcR+M4HUjKO08t6Tf4QA0d5LGsJHx06vQdyjJmEky98WfEf6n4b
         sW0wM+YnXMdXtpe5U5jfplc62fGRSR/eugpdDSpTm5jK6FVfnLzPXfTt1jB4cfBPCMmg
         B36v0BGgiDb4YkYcfoNbLhit0EOeackZrozerha6+eGKlU/51m7onTHr1LsJeIylUqTS
         e+KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGO+aMVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21-20020a05610205d500b0044504272a47si369094vsf.491.2023.07.13.05.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 05:00:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZGO+aMVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJuzc-00084Y-8l; Thu, 13 Jul 2023 08:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJuzZ-00083u-3l
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:00:17 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qJuzX-0006In-HE
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:00:16 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so1047827e87.3
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689249606; x=1691841606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pBv/l07OIc6LoGg76LMCmBbXQkjiwRyE1zqqM3sKzvg=;
 b=ZGO+aMVJiQ1ZEdFz6jnnMb184cma38WeGE/lrCGnxKyiqYXeIlpU0gnD5MK1qEIsDu
 heoDbnKZf0+qUnGuvpUWt7imnklzHNT36gNjz1ueSNDAEs/4iCaCjNigHdxX9MtYYn9V
 NvKo73sw96BgOOnImog3QZQ71KcQB6Xxb9RwyhVji4qEieX/FFDxMvjdpVD2lpo1RBVb
 xsezIjttwpmBDscZMbMqbKLjmkhDqx4w6dzs45dkEIrebrhpa4uSLAMBmQJItr1vIs+2
 zs8OE6w1T/lASIHbk2Xqd56e/ypUNDByiUFCT9oThOgqER45X1m4ulKu39xEKxDvtfNj
 Wzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689249606; x=1691841606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBv/l07OIc6LoGg76LMCmBbXQkjiwRyE1zqqM3sKzvg=;
 b=X4V42T5B6v13UFQ4CD6UZKRttP3vInaIQQhCL83MxJIKKNWEWe8+W9tLkttivZhPh2
 4aBgJVVYNQF+Yv2L/WvLloo/VJB6sONypUigN98W+ZKitbrrWmSi7eIArTI8KVb/a+OZ
 RSIFkkiVcbRklJjyE85yinS0no5xCPWqhP4Ud2wBrqy8mrbNqt5rTK18K3p6fSOnHBhX
 HmsDzz4/r5vZrv2WXYmiWX3CsxnqZEMtZlNzkH7G+WqnErIqtFXVje9uEyeeON8m9LQs
 MaG9LhGMZ3CKKbDBW/FSrDmgLXlS+2RCT/00Zk0tOSLk02c3d5DSOnGh2DdHZzZ1pj9x
 jy1Q==
X-Gm-Message-State: ABy/qLa10IdVSaGzQI6/ntqFVavjEhBqHB085e5AI41zXvBfjgs7g9QR
 evMfUPUjsrUX7+GI3BG2q0gNNnDqGQ9byNDKItwtrg==
X-Received: by 2002:a05:6512:20c8:b0:4f9:a232:f09c with SMTP id
 u8-20020a05651220c800b004f9a232f09cmr1025830lfr.63.1689249605929; Thu, 13 Jul
 2023 05:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
In-Reply-To: <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2023 12:59:55 +0100
Message-ID: <CAFEAcA-XK0U0bPuAf4K7avdJqnmcibFX_swY1Weo_Tn3wHJ1fw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x131.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5fu63SSyXQS2

On Thu, 13 Jul 2023 at 12:52, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>
> > I see this isn't a change in this patch, but given that
> > what the user specifies is not "cortex-a8-arm-cpu" but
> > "cortex-a8", why do we include the "-arm-cpu" suffix in
> > the error messages? It's not valid syntax to say
> > "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
>
> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for
> other architectures.

Yes; my question is "why are we not using the user-facing
string rather than the internal type name?".

-- PMM
