Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp7481030ejb;
        Tue, 3 Jan 2023 09:41:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvRRzeLX3d8RFs/PBfwkrbys4foWfA+mcfHd4QIfS004r9T7rYZzZ30Zqx/tgsjciVSyF5F
X-Received: by 2002:a05:622a:1a08:b0:3ab:6e0c:166b with SMTP id f8-20020a05622a1a0800b003ab6e0c166bmr73334968qtb.47.1672767711221;
        Tue, 03 Jan 2023 09:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672767711; cv=none;
        d=google.com; s=arc-20160816;
        b=GIB3DlZoD2b2Id/HTcrz5B93+fd7gf7CLclJU61CSz+RrJ+MzGqJQl9S+U4B5gqKsk
         1aIzquFhVUOSlJErkQXheHxVdNEjB6L1y4NLC1dIVdcRxh5s9LknMoZVERkWvfyV47Jk
         W/YrU/tGBUs9HVvEsrA5TL+ai80Sk6iUPlfSzKj7kOMTh8cQLrN7/ZsSTg3QhCPZu0cn
         mYlVcA4laq4vvDVZe9XQHMwaNvbeO4D8Qwvyoqp1X32XbiT4DzuOpGQSbB8/lpxIdHck
         K+uV8gryyXq+SLWF1b7uT7MAU5sPjDO1AMkCw+O+fcTvmipXkC0DvjVn2PoafcMHF0xG
         06nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=EeSiNLZ9AMf8Y3T9zWy+2/VWs5tl2a2H2uzQHAfk1l4=;
        b=egb4QFHReO9079q98wzlf3/0Zva85XiE7Mn69NNj/IJbg9AgZ34xJazLaMvrdDc5eO
         3OfBZjyKNBB1RG9ghS4XwYBRPsvH70RTWFdsaAR6wfTQgGfAF+gIJWPsDy7HuLjybtz2
         PesVs7yJmqKNWXOiNz5Q9cEXeQMjml2PW1pb/dGRc+T7mvHvLgKjZEA1QJicUtTw8SZQ
         +4QloJ46eTLl6pMAXbP/ILfK0zYU5RFLjN1zIjqJeXsAtIs7dSXGPz9NKllADaBi9vLz
         dalhdHlvn5oUVDZm5kdgsy88gvrxnaRpwvhPOjU8FmuYagmUxBhHRqNUrbIzIIyYP7bn
         zuBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2PX6naK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05620a0c8d00b006ff03700276si14860258qki.91.2023.01.03.09.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jan 2023 09:41:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t2PX6naK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pClHx-00044B-4t; Tue, 03 Jan 2023 12:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClHw-00042m-Cn
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 12:41:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClHu-0007YK-CF
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 12:41:23 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so31806053pjj.4
 for <qemu-arm@nongnu.org>; Tue, 03 Jan 2023 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EeSiNLZ9AMf8Y3T9zWy+2/VWs5tl2a2H2uzQHAfk1l4=;
 b=t2PX6naKRa6O8WJuSc1k3RsgQ0QvIqp4pyx1iC3ps3SjGJUUx+dtSmqvmpW3XDJWiY
 F7IORNY0QCNXAFVB37obzHJi6eqmhaSD2OqrjNDYuNue2napN6bJQjgbj9dD0BQb+vne
 SpEg5q27M5+sdRYZaF44X8Dtnk0m+yjGgxVyOsfoNrvh++ZYeCKCiEDMz3aB7P4QEFk3
 kVmpKwv4lq2J45pDZ36hJHsA7RSIaUsMOVkmYkNbLvIHz2GZZ131dbf/J9UZhbxIDH96
 KuUZmUs4jixKsTUw4GqeJKz1jTAGBCp3XvZ4+A/HV6sMYOwLGGtkbrdj/AfcDlXFD7dI
 VykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeSiNLZ9AMf8Y3T9zWy+2/VWs5tl2a2H2uzQHAfk1l4=;
 b=uUFHaVBJKkfmtXl1vBBetmXMt7FexExtzD4xDHndnsiugT6VRCT6m+KM1koyZQ5Uk2
 ddAT5i3vneNspP9PNl5W7IYCd2/hqEAXaE9Td6gtGHJLNcPjwmzMRaOSt4yR67PHv0Pv
 5qpR0Z2O6rP5RTaSrODcy64nROcNqlbAk/fCW9lXciCQVvO7ayyCdQOvS6WeBKInn+I0
 r4vVzTI09PuXtDHI1jeyky9SHUeEifWlAqyjEWBY3bzMcos5Ix4La9qFHrU+7QYXUzxN
 Ys3YzH1YtXvnjStCK2Rt1UFtVBd2l4CRP0Vf9xa5ATr37Q9H1A20L9a8U3gvWag0xq6Q
 IE1Q==
X-Gm-Message-State: AFqh2krC2vOy3YfMQWcQ4oHAy7T3YYj0c75rRWoJQRLWExosMnZpsLrl
 52CHmylsAXtnitHmI3GTQ/zubYeOGhA2PRJkJETsxQ==
X-Received: by 2002:a17:903:268c:b0:192:8d9e:d70a with SMTP id
 jf12-20020a170903268c00b001928d9ed70amr1877030plb.19.1672767680497; Tue, 03
 Jan 2023 09:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20221223085047.94832-1-agraf@csgraf.de>
In-Reply-To: <20221223085047.94832-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:41:09 +0000
Message-ID: <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Shashi Mallela <shashi.mallela@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: QqFqNhvwQKXY

On Fri, 23 Dec 2022 at 08:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> While trying to make Windows work with GICv3 emulation, I stumbled over
> the fact that it only supports ITT entry sizes that are power of 2 sized.
>
> While the spec allows arbitrary sizes, in practice hardware will always
> expose power of 2 sizes and so this limitation is not really a problem
> in real world scenarios. However, we only expose a 12 byte ITT entry size
> which makes Windows blue screen on boot.
>
> The easy way to get around that problem is to bump the size to 16. That
> is a power of 2, basically is what hardware would expose given the amount
> of bits we need per entry and doesn't break any existing scenarios. To
> play it safe, this patch set only bumps them on newer machine types.

This is a Windows bug and should IMHO be fixed in that guest OS.
Changing the ITT entry size of QEMU's implementation introduces
an unnecessary incompatibility in migration and wastes memory
(we're already a bit unnecessarily profligate with ITT entries
compared to real hardware).

thanks
-- PMM
