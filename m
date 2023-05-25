Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp323494ejb;
        Thu, 25 May 2023 03:06:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7s/nmuTsjtDPggsIXSu3UZkISTeb4jgo5hq8Xxlp99vZpRmvsHWA8Kr4lkg5cSZ9MToElr
X-Received: by 2002:a05:6214:252c:b0:621:451b:6e42 with SMTP id gg12-20020a056214252c00b00621451b6e42mr870375qvb.22.1685009159747;
        Thu, 25 May 2023 03:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685009159; cv=none;
        d=google.com; s=arc-20160816;
        b=qD6iOfLpU+fkWnNiNryq+5UrS06rMMNkO2WgVPAHK6d+pRusy9cro41nBPK3WlTaWA
         ngsNY/DC8Lw9ByGBwRZrSwarIFn54rWa6S7VIxS2XxY4/n9dLVJtiEDfk1a2WXEpXXJy
         RP1jclZ1gukx93dKr0QPUuT5VqMH5OMhsdveNDhQx5jphP4dm9BLCdO20IQvPxPpcqUO
         iljje/8SU/Ua4j2HIFkCGA7SlJ99f2UR36Y2k32dulhoFm6wpn0aVfmdItBFwD/7fKWh
         pyuRxKx0PJiNcgEQS5QnfCJqNe3+N+gfpEOE7aypU9z7f9pgBEotiNIUTwsH2OtRh2HZ
         aDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N5Vp1FQA5Pj3pdinX5mQO1qAqFA2PIXogTWP4Vq7diw=;
        b=Zf8+aCdUJC03/IdamjE8W1XfOBQ7ceQYssVpN6BH62Yq0F53WeUvDvBy4zXUEn5ilW
         yeNK8OeoAOceIXzOONlAnEyK8pshU0DSbwnWsRkB8fdGQrclxY9XresDo/xBoGnXkdTd
         RWSZKfubEEODOlCVxZ9OLTXAq8pvd4PMjb281TwAgPwT3an2CHXIo5qsFq8OusQGkW3J
         yWqKQk2tc8j+h/yWSTGkf1cvO8laF5UUBieC86iFTba9Qbpgoq3XoFebq/pDkoadQS7k
         FiBLaO/HJUSYvTsfveIqZQaDzdmePBXQjhOxPuPI204WcpiZ2Jzvy3zqsXD3kDT/09Bt
         9pvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdNQmncR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a0562140c6700b005e1ff013f8csi345634qvj.204.2023.05.25.03.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QdNQmncR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q27ql-0007vn-BB; Thu, 25 May 2023 06:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27qj-0007tu-BF
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:05:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q27qh-0003v9-LW
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:05:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510ede0f20aso3502320a12.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685009134; x=1687601134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N5Vp1FQA5Pj3pdinX5mQO1qAqFA2PIXogTWP4Vq7diw=;
 b=QdNQmncRtZWbe9SCnt4CIOj56oGTAOLZvG6LecPDWpVbfTOorisArxYE9Bq8xO10Z1
 rVA1BrEAFW20AEmP/cQaUI71Nw2cOETPTAvDxZjh/9yiIcsLcWr6tEJLc/f4ZQFYnIOA
 UAbAYqOT0zhFhPOvRvKAxokUAP3UU+uqnRXasXkeA1A6CzAsbJTRi3Y0mS7DwXiPB42M
 X5PeSV9hBYXX2MbTlk/0eykcgGQz7aP0oBSmFK1NJQyATiLexOUAWlJb5nXlsx8942HK
 x6fuutjS/d0V/SV6C2fdCis2B+r7tHwEsWg7mEl2C3M+H6Dwc25SCtqihEaZ8xlCYYZG
 szKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685009134; x=1687601134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5Vp1FQA5Pj3pdinX5mQO1qAqFA2PIXogTWP4Vq7diw=;
 b=irHcOz7s0a9LMPklX9/2wNTB6njH8GwfjHZ+7ECJDCbGEIVWI81IhtDzTNsembmONI
 4rMT26eQn8aoDx4QdZ477Ro4gylC1eycYM9VmZ5lsVo8+V+nBfTLHXJhconhBnVjxKc3
 P4wMpQ8yJ6NjwfPVU4wVCBkogBw7dggw7nD+rgcsugSGRK6m48LrgUUs6wngSC2MytIH
 MOtiu1TEXVguSQ7fXXWuqGiDIIr/y+A9ARt9gGrMtUQrbjwG4HbXJBvSH9lUMJ1Vkj4s
 c3IviXHlNJ8a2D9tNMQlP5l0A2+vG7OkL/dCJ3PePnqDy3L2uY8Dd7VQBESvsX8B/mN5
 epHg==
X-Gm-Message-State: AC+VfDx7rJYnQUPffd170w7+1zevL0NYQm7k6m0CVrIAtRdao7KfIf66
 x7UIfoVnYwAmsUezsC0JDBQAN8vnDwAHHT5aC/PTDQ==
X-Received: by 2002:a17:907:da3:b0:967:21:5887 with SMTP id
 go35-20020a1709070da300b0096700215887mr1062135ejc.40.1685009133930; Thu, 25
 May 2023 03:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
 <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
 <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
In-Reply-To: <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 11:05:23 +0100
Message-ID: <CAFEAcA8OUP9vnJwRxcT7AUWPD5ANhc17ETgePYPe2=-N_ZvCsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
To: Thomas Huth <thuth@redhat.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: jt91+KkyzIxh

On Tue, 23 May 2023 at 19:41, Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/05/2023 19.30, Marcin Juszkiewicz wrote:
> ...
> >> (is there a reason why it can't be disabled with "-vga none" or
> >> "-nodefaults"?)
> >
> > That's something I need to check how it should be done.
>
> Other boards set mc->default_display in their ...class_init
> function and then use pci_vga_init() (or vga_interface_type)
> to instantiate their default display adapter ... however, that
> does not seem to support the bochs adapter yet (see
> vga_interfaces[] in softmmu/vl.c).
>
> Not sure whether it's worth the effort to extend vga_interfaces[]
> in vl.c

Isn't that a legacy-command-line-option thing? I feel like
the recommended way to select a different graphics card
these days would be to use -device my-pci-vga-card ...

thanks
-- PMM
