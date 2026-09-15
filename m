Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFA1C88E7F
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 15:25:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6V1o-0006li-NK; Tue, 15 Sep 2026 11:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6V1n-0006lK-QM
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 11:24:59 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6V1l-0004Ly-L5
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 11:24:59 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab20f4bso3281444d50.0
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 08:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789485896; cv=none;
 d=google.com; s=arc-20260327;
 b=HRA43IezSL+Zl9LK76rOzYtjeAg+igtj7ePyOjLZcUgrHBD0ZeI76+QnBkFSufEs4Z
 yUIeCv04VMswSmVkJL0L9pZXhwL/LKZ4ao3rPnJdq42H9bkECnCpEhHC7qn4gx6NpGBV
 edoaOe+onYF05zhfDVNfpW7k7vTSG6YEb4VSfAXqAOGVwo93s+GT5O/WcYiCwl/IGP/k
 LjAXRpQ/KAzt6pQPHFD8FTy6yD+F6MY+sRIvi6Ez7HbafgN/pMkRTQ03IC23etAcPdIx
 8h8OFMD964ExI/r+XghW4d3NmTO8o6w8fe3R4D/5qIJgvWn45weAUwzF4Fdctau/Ftwo
 yq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=f39LRX6t5miX88Vb9pSej9Bo7WXHts2Zw12vmv6/pc8=;
 fh=tzIwbrEKlYjA7MKZSLx1sx0D/301ntEx8gbwFzgE/48=;
 b=lUktTG4s8z41zEwWBw00c1ZKl7rYPkhtiNtKvkrJsI3YaH11XjB/ELvyei87Y5gMO7
 XFzmHgs4ueG9SAjeavucK95dspc3GhJWnj5vbUtSnriEV7YPMpOhT/EDvvwG706EjTHj
 3RqyzR8V7Gu1AoiTu6bTUS6sIryxmMU0G/Av/Mfj4vRCPTfXsmz8f2EMjG6X0Obf/QeN
 6oN5e1KJshyMqCTPOCjnu84zDuuBrVurV7VSlP7Xwl7PvpzKeSaXxDg1PKpOq1/dP+s9
 Mi1utyyZ5MUS2iw1RqOBrdzaYoeKLXZbKO2X57xSeiCcdfwWKfIpU1jX56eYuoxSaCZ2
 SedQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789485896; x=1790090696; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f39LRX6t5miX88Vb9pSej9Bo7WXHts2Zw12vmv6/pc8=;
 b=nL7SRXFf8xH054AUbqjlceI37FymKw4npt+Ek0aP80AbLKEm9QIaWmF4Alg0MKyqFS
 mvMmJrMoWp6MHtlN6NJj1n1RtXWb+MGZZ+8LM/Gts9OvTqRL2f6ZWwuDj73GyjbcZkte
 RptnjPudGusib95EIxASI/8anxslRrm5HAvtvq/lLGAl8CuAYI4z7fQ7gdBSx3x26M4j
 1jrf7FsB40hka/MxegmMoEsZBshwxXIHcVI8MFmxwarVYQsosnSG1wicmXQ4BMKnt546
 fx7TfuEPUv9OFJIzOUlDPz84uZbCg6NPb1jDm+Te1D6JJDmfCdhew3Q+Lg2+bOuKqAHe
 v5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789485896; x=1790090696;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f39LRX6t5miX88Vb9pSej9Bo7WXHts2Zw12vmv6/pc8=;
 b=VDk61dGPtGDkdtLJkKHjrs7VTdGowDOjwH/xYJ1iGcl85KY/qTTBj7MDLv1Gjmd4kw
 0ueI/061VY6QLhlF1Dycp3hSneNxXEByNyMQKXMAC7imjyZqZEiIC49lzGXgIC4S05bX
 EqbCq7oFksRlfvrhBYGgBxbXShWlMcNOW+wOnCIuvRbJqGTr8jE/ZsvumDMYESFzDJ3U
 hMLaPMtBqs8evhpN6Vrh1XikaIzpFU4PvZODGZGMmplA2WgaiBRArFlk3V0C0aPHlB2j
 ZsobXspLdCESJzJZJjo7gUwMJOw0IHUXOJ/J02BxnYuPawa6sMJba9ZOC1nME1vtM/GF
 zmGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy03wYN2UJfPOFRCvF4PS0IA2vt9nDq50Z0ze9hmfmU34lswT2N35eXbtXmzaN5pEZH8WZP2APA9A==@nongnu.org
X-Gm-Message-State: AFuF++lPj3pdc7tVyGKv4k+vUM4OzJHCBCc/3buvBco129PtGSbkYUmo
 aCG4RyhwU7e3mDuPSGOOGIh/o2I4BKIXoyqrB/tKiaAf+4dFd3jqvYUHHi8ZGZpEC9jeMvKFzEd
 i2NS2Bj6MjT7nILF2oNBmN+5320ll4tBYN1Io8113RA==
X-Gm-Gg: AYBFou1ETXZz8snsIQP+fUF1ckEEUKsszO9PmRkva5UKav3Ib+M+6BohUce4ORJ61Qg
 ObsmgVDUxBpDbawrP0Gd7DWw41DLyZvVu6xusIvGZs++vAD8syxjhlPFmFcsjXh61cDC/wzPJcE
 juu4l+nays90bib8TgN58pgSPUO0pvX9YRjkhF1FDCNCG772HbEWMIVDewqOWDRTHsa0VpTBVuH
 D4TNe2dSWBIGwERjmmcHIFRN+JOQug6hPzR//NjgaYJSpXIojCpwzHa/MAaxR7i8sa/LW0yucyN
 CjluZEczf036UjoGv7mweaZAv1rtyp58csxIFut7/wGeJhsVtfrAzHJc26lAeyrCBwv8V82wX9I
 Kkg5i1o9NBSlqq3bJvcP3UQc/
X-Received: by 2002:a53:ac87:0:b0:66f:c8e4:f013 with SMTP id
 956f58d0204a3-6714e060f40mr2664831d50.50.1789485896076; Tue, 15 Sep 2026
 08:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com>
 <20260913-allwinner-gpio-v3-1-a9affa474b3b@gmail.com>
In-Reply-To: <20260913-allwinner-gpio-v3-1-a9affa474b3b@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 16:24:43 +0100
X-Gm-Features: AcwNN1WP3f-o7iYou4z1A14ofObFQq9Hfo6kxvOpKfuHL4OkdG-PTuKJ64_fHFs
Message-ID: <CAFEAcA-TOjsMHDpThkBP_Mjbt+gA23SoXabOpAUVMdoFbRGjow@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/gpio: Allwinner A10 GPIO emulation
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jack wang <163wangjack@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 13 Sept 2026 at 19:17, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> This patch implements Allwinner A10 GPIO peripheral emulation.
>
> The emulation focuses on input/output and interrupt functionality,
> whereas the drive and pull up/down functionality is not emulated.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

> +static inline void allwinner_gpio_update_all_output_lines(AWGPIOState *s)
> +{
> +    for (int port = 0; port < AW_GPIO_PORTS_NUM; port++) {
> +        port_update_output_lines(s, port);
> +    }
> +}

This doesn't compile on clang because this function has no callers:

../../hw/gpio/allwinner-gpio.c:257:20: error: unused function
'allwinner_gpio_update_all_output_lines' [-Werror,-Wunused-function]
  257 | static inline void
allwinner_gpio_update_all_output_lines(AWGPIOState *s)
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

Should it be being called somewhere, or is it just a leftover
from an earlier revision of the series?

thanks
-- PMM

