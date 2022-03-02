Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp703558lfo;
        Wed, 2 Mar 2022 05:34:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwGPRn1apIvaxLI/bJuOxR1Nn0iXssCM2AHWEF4THa9HdE7Nj85o/1xct/j69S5qKjXOhh
X-Received: by 2002:a5b:804:0:b0:61d:8129:eadf with SMTP id x4-20020a5b0804000000b0061d8129eadfmr29884913ybp.331.1646228047188;
        Wed, 02 Mar 2022 05:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646228047; cv=none;
        d=google.com; s=arc-20160816;
        b=gqbrGIOZjvYWfVldACSUlDW4e4MXUo86YNq1a4qaOXIoqxPMhTMEdSo0aK3rT+ezXu
         ARXrs4q9r5IHcd/ZI8fg5Wf0d1aXiaIhvyZeyBNwgqx3Jv3Fb3orycUlarSMv1RvVIY/
         Q8QyTE24sujIgfFaqr5qI1rWDTw4YhxkBBZUGOzaDHFFsLU4L9m7dX3PWQMNPdXDspI8
         h24IgTF9GHQTYMueWJSkpWr4i2N6eC4Ex+8PN95nonkRmJxVywDCEAoNWSm3ocdwqsw+
         LB944PBa9cClQa4CMoQhQaiiPUtNUgdvMEC6WSZofIRQxlbeRN4Z2OOe4IZuPbclWHRK
         PeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Nhm9oD3n5qmfahefXmVTgi6LkffTknx2hqFEXijf4a4=;
        b=mMBNuYOYAblvLvOewZgwD+9WDxU93r4zsxHiDvIalSpLljX7aAr3/WdK/kcQAS8Cf+
         wcVt3n2YIqd1eXDWI/kLbHdJNj0Psogqsnro7pP9KryMA/KVZHonMqYPjjmBFJk7R18x
         8qINZURfEXx0atUyiPZQLWABxeahfgK6vk9FsQ9AcZ/xRYwO+v81Xj23U2vyvSBtHgVa
         0YDjB4KkbxV4EmElE2dRmm3l1hjd7gDpV/ZK++ZRMPjFOjhN60HXhAjsaEGXb/ONrqkj
         4Brqf0KKCpEiKfAxEfr3kumGTLFabgl73wetE8IMwTUprt+0iP6Yhiz5NhHJtW/Mk1xE
         XF9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QE0s2qcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a056902144800b0062883ba25e6si3631908ybv.685.2022.03.02.05.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Mar 2022 05:34:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QE0s2qcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPP7G-0002Dp-Jd
	for alex.bennee@linaro.org; Wed, 02 Mar 2022 08:34:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPO7E-0000Ti-BK
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 07:30:00 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=34507
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPO7C-00016w-Rg
 for qemu-arm@nongnu.org; Wed, 02 Mar 2022 07:30:00 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id h126so3065661ybc.1
 for <qemu-arm@nongnu.org>; Wed, 02 Mar 2022 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nhm9oD3n5qmfahefXmVTgi6LkffTknx2hqFEXijf4a4=;
 b=QE0s2qcNyO1UmhydFEn/J8buLTqtB3PRwXSzhNq0pqKXzaf3fxGlilBDlfUSsl5q9v
 d+JP4roaF1R6p+h+LGg0BD0j/X9hIyWNF0He2pxtG36zceT7csgngInWtgvTZejLojGY
 3nu6aIooA10WGWdg6lGGjLbEs21dblILsRP86Vacj3qo+8Q4mYeEx2u025NVG99OM56O
 kq+EMSBCraun6aRp8fifxlyyxAm+Lh9TDv/SXJRzzUgyWkIUUfFUfdnM3HD+7WdIz9kV
 3BBOwJ8ovB1Rmvp4EZSEApmHGJbqCq6lafJNst43Trw8vU+plPs6MQzCcV48LEwOb75i
 X95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nhm9oD3n5qmfahefXmVTgi6LkffTknx2hqFEXijf4a4=;
 b=is5jOhXfS/QB1oqcjCwSw9MnGo6lFzrFWASLLLiLI3Mv92YVahNZ4L/Jn/jaVyr00Z
 9JRjBQIYDzhgcSiTbniwWjMHWNSC0Z+Yb98K14RLbtmOS3heI4oMNlR96r99E5kKLd3F
 gjU4WVPG2f1S9/T8fQiJCyEocVajdlgCywqx24s5aC+kG18WupEKNF++iFFmzKEdKUg7
 BRLuEV9+jxBlX/vz1LMpZDhGvU4Dzh/hu+cIAQHlyJlHNqcDAUOJCCXJ982nJMzmJD7Y
 ZCyJu1koZPZ1FeWxBRkzDgyFO085CHLKFGviCsZ72DGRykzVKg57XvssKXjXe/Jrfucv
 gQrQ==
X-Gm-Message-State: AOAM531NPpPVqfiPiD5NbM8m7Su/rhaBSEyQgslXlQv2sggrs+dg6+e4
 y9ZvWBQc67mpm3ZGfioxmrJ0U1YVS8jvUYPW1/ooIA==
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr4111637ybc.288.1646224197848; Wed, 02
 Mar 2022 04:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20220302083308.820072-1-clg@kaod.org>
In-Reply-To: <20220302083308.820072-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 12:29:46 +0000
Message-ID: <CAFEAcA8V+Jc4eXF+CYay_OoSrZPj7yTGFiGL0omt7+0D-0GQ8w@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Fix a potential memory leak bug in
 write_boot_rom()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Wentao_Liang <Wentao_Liang_g@163.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KbLAZ+bJWr9g

On Wed, 2 Mar 2022 at 08:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Wentao_Liang <Wentao_Liang_g@163.com>
>
> A memory chunk is allocated with g_new0() and assigned to the variable
> 'storage'. However, if the branch takes true, there will be only an
> error report but not a free operation for 'storage' before function
> returns. As a result, a memory leak bug is triggered.
>
> Use g_autofree to fix the issue.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Wentao_Liang <Wentao_Liang_g@163.com>
> [ clg: reworked the commit log ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
