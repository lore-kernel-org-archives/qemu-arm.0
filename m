Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2338106ejb;
        Mon, 20 Feb 2023 06:51:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8ojjQel7wiH6W6PMtxE3+t614bF3mXwsjsn8BEEQQsJ9DxU12BqAv3I14xnLW9OgKBM178
X-Received: by 2002:ac8:5d8a:0:b0:3b8:6c80:c113 with SMTP id d10-20020ac85d8a000000b003b86c80c113mr1782292qtx.66.1676904712858;
        Mon, 20 Feb 2023 06:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676904712; cv=none;
        d=google.com; s=arc-20160816;
        b=TBjY7jqoCEL4h6E73UBDLcD28HAnFa5CUf0reGRzBJ9E33A0d0oNps6LcrxKdHYpcE
         l+cp/wNeDl3Gp0/0jHHzQ6z2vRBTFCKcHBYoCo5fd99mrtSy/fCJNBQfGGm5rT3+yjTO
         BkN9sjnqC6CpgJzN3ULD4wrx/HXkffgV8cQKsGzDY3A7chF+p4X+ybJoVb/UIVHPFtub
         gEMhh0hI+p8DFIjgFotBkTu/4/5dv7SqT+apgTGu0+fwPwOcOZYV0ACrx0uA8VqCXZHS
         QrALALQoCuAtFHSQhJfKoIlQ4naBLt8dnehXo0hNbLM8RstZfTstRnFLsUU/2uca2OZN
         N83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OOqOv0S4AmruzS46bC7oAarcPy0QZ0WNgZoeBUtXMyE=;
        b=sNqoKRln1APBKQX8eLKuq/AMTVvZY/3qjrpN4iUSeevjgGD2AguOYEgRGq6Z/qXvGS
         m+c0XIEZTWNt5NuHj5DI7q0rjlGdyVDV2U/xIhtZvbOWNeWa7WJ6AvKy1D0PPLPhbNoX
         m7EvWn3tnuosXng1ZSTzu3bIMMvDtAk6XxFGYC+qtkpVFmfxx/GS5NglaplHtcncfSjb
         qeZY84D+fPSsFSef0Lqr1WopC3LqaIcic5PS8zefkY6lknTi9NELbADf8W1R3ZRA0ZSW
         a8YXo+HFM7XIOF5RX96vodDn4BE3M7BD8r2E71Q1lq2Ww0/XTQc1GBxen/V/r5uDuRUB
         DgXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCw9gxkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs34-20020a05620a472200b0071ac6ed945asi10269994qkb.143.2023.02.20.06.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 06:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kCw9gxkV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU7W1-0005jR-3q; Mon, 20 Feb 2023 09:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU7Vx-0005iu-0v
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 09:51:37 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU7Vu-0004gM-E1
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 09:51:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso1124927pjv.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 06:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OOqOv0S4AmruzS46bC7oAarcPy0QZ0WNgZoeBUtXMyE=;
 b=kCw9gxkV3XUyAeW640WEPBn0SHim7nUUtaFFPTvZly9oULgDUrUn8Bh4GmnKzyCmI6
 A5baRoJq+nRTcBktt6yyUDKe8lWN4R3zWYYaECXhKvDUd1nt03FxHDam60LJzBr7h1L+
 wY3xSWkJceULw2dk8qqmEeEwgxxeiiqh8gfBbtbQTmM2fLTzQsgH4yN1/5wE1o0kY29J
 VyB2fv9vbZW/8+036a5K/eHmBlflZaxcD4TF7IZItjrhWxmpgHkwth4F/Tp3jzdJ5hUm
 AvrcS1G0f2phTOFos49j7kylxGKBf2grYrFxBfuilJxcHvgDZg+A0rGZEDoqWuwt8HB8
 knnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OOqOv0S4AmruzS46bC7oAarcPy0QZ0WNgZoeBUtXMyE=;
 b=kcCgEpmjUDcF2oZoqV7oyaBpak+WYWUfhnvNHzXrVbxCQwdo/6eypUQnAPiqcyWHMZ
 BhhxSdXpMvAuz/MhflVovJdE3sr/k/1vzAxfoZLjGsSOnfOCBNhX/4lmAZ3C8hk5K9Ee
 +etgTdK6S0ACCVp70CUxxs/n8UlaNlUphpnqXwHiPn4K1A5AKsuFr6AYx6LmaM2QtbLN
 KCqzI/fAhCf5ePOXxo4n7ilosBpFFWzZKEB6p5A8OBhjsgCLeGKGu83PamQSginNRj0g
 gIscWjMG+tHL2wFbLz/hSZm5HJ6n7vK7sLP/czyiXGalkSWG00dq8CLOmWpQFrSMOYjT
 O2jQ==
X-Gm-Message-State: AO0yUKWttSzXHP0U5XCmoAKDEUeUqYd+Sz9O0Mi/kE7jbeB2TI2mo1bI
 jGhxVLnf4n6UpBI7DxxrvjzD9U8X+k7IhlWtGXx+Jg==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr938178pjb.92.1676904692955; Mon, 20 Feb
 2023 06:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20230215152233.210024-1-thuth@redhat.com>
In-Reply-To: <20230215152233.210024-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 14:51:21 +0000
Message-ID: <CAFEAcA9hRNqdvd99ZwXiTzJ+ChwSmrV+ukuNaZS08Fwmcr8RZA@mail.gmail.com>
Subject: Re: [PATCH] include/hw/arm/allwinner-a10.h: Remove superfluous
 includes from the header
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: qqWOGY0YzgEi

On Wed, 15 Feb 2023 at 15:22, Thomas Huth <thuth@redhat.com> wrote:
>
> pci_device.h is not needed at all in allwinner-a10.h, and serial.h
> is only needed by the corresponding .c file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/arm/allwinner-a10.h | 2 --
>  hw/arm/allwinner-a10.c         | 1 +
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
